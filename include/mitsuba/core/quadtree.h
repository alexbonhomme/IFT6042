#pragma once
#if !defined(__MITSUBA_CORE_QUADTREE_H_)
#define __MITSUBA_CORE_QUADTREE_H_

#include <mitsuba/core/point.h>
#include <mitsuba/core/logger.h>
#include <vector>

MTS_NAMESPACE_BEGIN

/// Compute the Minkowski distance between two Float
inline Float minkowskiDistance1D(const Float &a, const Float &b) {
    return fabs(a - b);
}

/// Compute the Minkowski distance between two Point2
inline Float minkowskiDistance2D(const Point2 &a, const Point2 &b) {
    return sqrt(pow((a.x - b.x), 2.) + pow((a.y - b.y), 2.));
}

struct AABB {
public:
    AABB() :
        center(0., 0.),
        halfSize(0.) {}

    AABB(const Point2 &center, Float halfSize) :
        center(center.x, center.y),
        halfSize(halfSize) {}

    AABB(const AABB &aabb) {
        center.x = aabb.center.x;
        center.y = aabb.center.y;
        halfSize = aabb.halfSize;
    }

    inline bool isIn(const Point2 &p) {
        SLog(EInfo, "isIn()");
        return p.x > center.x - halfSize && p.x <= center.x + halfSize &&
               p.y > center.y - halfSize && p.y <= center.y + halfSize;
    }

    Point2 center;
    Float halfSize;
};

enum NodeState {
    EEmpty, EFull
};

enum NodeType {
    ENode, ELeaf
};

class QuadNode {
public:
    QuadNode(AABB aabb, NodeType type=ELeaf, int level=-1) :
        m_northWest(NULL), m_northEast(NULL),
        m_southWest(NULL), m_southEast(NULL),
        m_point(0., 0.), m_aabb(Point2(aabb.center.x, aabb.center.y), aabb.halfSize),
        m_state(EEmpty), m_type(type), m_level(level)
    {}

    ~QuadNode() {
        if(m_northWest != NULL)
            delete m_northWest;
        if(m_northEast != NULL)
            delete m_northEast;
        if(m_southWest != NULL)
            delete m_southWest;
        if(m_southEast != NULL)
            delete m_southEast;
    }

    /**
     * @brief isLeaf
     * @return
     */
    inline bool isLeaf() { return m_type == ELeaf; }

    /**
     * @brief isEmpty
     * @return
     */
    inline bool isEmpty() { return m_state == EEmpty; }

    /**
     * @brief isInAABB
     * @return
     */
    inline bool isInAABB(const Point2 &p) { return m_aabb.isIn(p); }

    /**
     * @brief insert
     * @param p
     */
    bool insert(const Point2 &p) {
        if(m_type == ELeaf &&  m_aabb.isIn(p)) { // the point is in leaf
            if(m_state == EEmpty) {
                m_state = EFull;
                m_point.x = p.x;
                m_point.y = p.y;

                return true;
            } else {
                if(m_point != p) { // for just return an error
                    split(); // split this node

                    if (m_northWest->insert(p)) return true;
                    if (m_northEast->insert(p)) return true;
                    if (m_southWest->insert(p)) return true;
                    if (m_southEast->insert(p)) return true;
                }/* else {
                    SLog(EWarn, "This point is already exists !");
                }*/

                return false;
            }
        } else {
            return false;
        }
    }

    /**
     * @brief split
     */
    void split() {
        if (m_type == ELeaf) {
            // this is now a node
            m_type = ENode;
            m_state = EEmpty; // no importance (just precaution)

            // allocate new leaf
            Float halfSize = m_aabb.halfSize/2.;
            m_northWest = new QuadNode(AABB(Point2(m_aabb.center.x - halfSize,
                                                   m_aabb.center.y - halfSize),
                                            halfSize));
            m_northWest->setLevel(m_level+1);

            m_northEast = new QuadNode(AABB(Point2(m_aabb.center.x + halfSize,
                                                   m_aabb.center.y - halfSize),
                                            halfSize));
            m_northEast->setLevel(m_level+1);

            m_southWest = new QuadNode(AABB(Point2(m_aabb.center.x - halfSize,
                                                   m_aabb.center.y + halfSize),
                                            halfSize));
            m_southWest->setLevel(m_level+1);

            m_southEast = new QuadNode(AABB(Point2(m_aabb.center.x + halfSize,
                                                   m_aabb.center.y + halfSize),
                                            halfSize));
            m_southEast->setLevel(m_level+1);

            // move the point in the corresponding leaf
            if (m_point.x > m_aabb.center.x) {
                if (m_point.y > m_aabb.center.y) {
                    m_southEast->insert(m_point);
                } else {
                    m_northEast->insert(m_point);
                }
            } else {
                if (m_point.y > m_aabb.center.y) {
                    m_southWest->insert(m_point);
                } else {
                    m_northWest->insert(m_point);
                }
            }
        } else {
            SLog(EError, "You can't split a leaf ! Only a node.");
        }
    }

    /**
     * @brief setLevel
     * @param level
     */
    inline void setLevel(size_t level) {
        m_level = level;
    }

    /**
     * @brief getLevel
     */
    inline size_t getLevel() const {
        return m_level;
    }

    /**
     * @brief getPoint
     * @return
     */
    inline Point2 getPoint() const {
        return Point2(m_point.x, m_point.y);
    }

    /**
     * @brief getCenter
     * @return
     */
    inline AABB getAABB() const {
        return AABB(Point2(m_aabb.center.x, m_aabb.center.y), m_aabb.halfSize);
    }

    /**
     * @brief bNNSearch
     * @param p
     * @param r
     * @return
     */
    bool bNNSearch(const Point2 &p, Float radius) {
        if (m_type == ELeaf) {
            if(m_state == EEmpty)
                return false;
            else
                return minkowskiDistance2D(m_point, p) < radius;
        } else {
            // distance from V & H plans
            Float distToVPlane = m_aabb.center.x - p.x;
            Float distToHPlane = m_aabb.center.y - p.y;

            // check if search cercle is over many cells
            bool searchVBoth = fabs(distToVPlane) <= radius;
            bool searchHBoth = fabs(distToHPlane) <= radius;

            bool top = false, bottom = false,
                 right = false, left = false;
            // right search
            if (distToVPlane < 0.) {
                // left search too
                if(searchVBoth) {
                    left = true;
                }
                right = true;
            }
            // left search
            else {
                // right search too
                if(searchVBoth) {
                    right = true;
                }
                left = true;
            }

            // top search
            if (distToHPlane > 0.) {
                // bottom search too
                if (searchHBoth) {
                    bottom = true;
                }
                top = true;
            }
            // bottom search
            else {
                // top search too
                if (searchHBoth) {
                    top = true;
                }
                bottom = true;
            }

            // recursive search
            if (top && bottom) {
                if (right && left) {
                    if (m_northEast->bNNSearch(p, radius)) return true;
                    if (m_northWest->bNNSearch(p, radius)) return true;
                    if (m_southEast->bNNSearch(p, radius)) return true;
                    if (m_southWest->bNNSearch(p, radius)) return true;
                } else if (right) {
                    if (m_northEast->bNNSearch(p, radius)) return true;
                    if (m_southEast->bNNSearch(p, radius)) return true;
                } else {
                    if (m_northWest->bNNSearch(p, radius)) return true;
                    if (m_southWest->bNNSearch(p, radius)) return true;
                }
            } else if (top) {
                if (right && left) {
                    if (m_northEast->bNNSearch(p, radius)) return true;
                    if (m_northWest->bNNSearch(p, radius)) return true;
                } else if (right) {
                    if (m_northEast->bNNSearch(p, radius)) return true;
                } else {
                    if (m_northWest->bNNSearch(p, radius)) return true;
                }
            } else {
                if (right && left) {
                    if (m_southEast->bNNSearch(p, radius)) return true;
                    if (m_southWest->bNNSearch(p, radius)) return true;
                } else if (right) {
                    if (m_southEast->bNNSearch(p, radius)) return true;
                } else {
                    if (m_southWest->bNNSearch(p, radius)) return true;
                }
            }
        }
        return false;
    }

    /**
     * @brief nodeToVect
     * @param vect
     */
    inline void nodeToVect(std::vector<AABB> *vect) {
        if(m_type == ENode) {
            vect->push_back(m_aabb);

            m_northWest->nodeToVect(vect);
            m_northEast->nodeToVect(vect);
            m_southWest->nodeToVect(vect);
            m_southEast->nodeToVect(vect);
        }
    }

    /**
     * @brief leafToVect
     * @param vect
     */
    inline void leafToVect(std::vector<Point2> *vect) {
        if(m_type == ENode) {
            m_northWest->leafToVect(vect);
            m_northEast->leafToVect(vect);
            m_southWest->leafToVect(vect);
            m_southEast->leafToVect(vect);
        } else if (m_state != EEmpty) {
            vect->push_back(m_point);
        }
    }

private:
    // Children
    QuadNode* m_northWest;
    QuadNode* m_northEast;
    QuadNode* m_southWest;
    QuadNode* m_southEast;

    Point2 m_point;
    AABB m_aabb;
    NodeState m_state;
    NodeType m_type;
    int m_level;
};

class QuadTree  {
public:

    QuadTree() : m_root(NULL) {}
    QuadTree(AABB aabb) {
        m_root = new QuadNode(AABB(aabb), ELeaf, 0);
    }

    ~QuadTree() {
        delete m_root;
    }

    /**
     * @brief insert
     * @param p
     */
    inline bool insert(const Point2 &p) {
        return m_root->insert(p);
    }

    /**
     * @brief bNNSearch
     * @param p
     * @param radius
     * @return
     */
    bool bNNSearch(const Point2 &p, Float radius) {
        return m_root->bNNSearch(p, radius);
    }

    /**
     * @brief printImg
     * @param size
     * @param filename
     */
    void printImg(int size, const std::string &filename, bool grid) {
        std::vector<AABB>* vectAABB = new std::vector<AABB>;
        m_root->nodeToVect(vectAABB);

        // PPM file header
        FILE *f = fopen(filename.c_str(), "w");
        fprintf(f, "P6\n#\n%d %d\n255\n", size, size);

        char** tab_out = new char*[size];
        for (int i = 0; i < size; ++i) {
            tab_out[i] = new char[size];
            for (int j = 0; j < size; ++j)
                tab_out[i][j] = 0;
        }

        if(grid) {
            //std::cout << ">> " << vectAABB->size() << " nodes.\n";
            for (unsigned n = 0; n < vectAABB->size(); ++n) {
                AABB aabb((*vectAABB)[n]);

                // left top
                int xMin = (int)((aabb.center.x - aabb.halfSize)*(size/2-1) + (size/2));
                int yMin = (int)((aabb.center.y - aabb.halfSize)*(size/2-1) + (size/2));

                // right bottom
                int xMax = (int)((aabb.center.x + aabb.halfSize)*(size/2-1) + (size/2));
                int yMax = (int)((aabb.center.y + aabb.halfSize)*(size/2-1) + (size/2));

                int fullSize = xMax - xMin;
                int halfSize = fullSize/2;

                for (int i = 0; i < fullSize; ++i) {
                    tab_out[yMin+i][xMin] = 'L';
                    tab_out[yMin+i][xMin+halfSize] = 'L';
                    tab_out[yMin+i][xMax] = 'L';

                    tab_out[yMin][xMin+i] = 'L';
                    tab_out[yMin+halfSize][xMin+i] = 'L';
                    tab_out[yMax][xMin+i] = 'L';
                }
            }
            delete vectAABB;
        }

        std::vector<Point2>* vectPoint = new std::vector<Point2>;
        m_root->leafToVect(vectPoint);
        //std::cout << ">> " << vectPoint->size() << " leafs.\n";
        for (unsigned n = 0; n < vectPoint->size(); ++n) {
            Point2 point = (*vectPoint)[n];

            int x = (int)(point[0]*(size/2-1) + (size/2));
            int y = (int)(point[1]*(size/2-1) + (size/2));
            assert(x < size && x >= 0);
            assert(y < size && y >= 0);
            tab_out[y][x] = 'P';
        }
        delete vectPoint;

        for (int i = 0; i < size; ++i)
            for (int j = 0; j < size; ++j) {
                if(tab_out[i][j] == 'L')
                    fprintf(f,"%c%c%c", 100, 0, 0);
                else if(tab_out[i][j] == 'P')
                    fprintf(f,"%c%c%c", 0, 255, 255);
                else
                    fprintf(f,"%c%c%c", 0, 0, 0);
            }
        fclose(f);
    }

    /**
     * @brief clear
     */
    void clean() {
        // backup the AABB
        AABB oldAABB = m_root->getAABB();
        // free the tree
        delete m_root;
        // build an empty tree
        m_root = new QuadNode(AABB(oldAABB), ELeaf, 0);
    }

private:
    QuadNode* m_root;

};

MTS_NAMESPACE_END

#endif // QUADTREE_H
