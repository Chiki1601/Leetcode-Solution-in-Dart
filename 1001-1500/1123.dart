import 'dart:collection';
/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
    TreeNode? lcaDeepestLeaves(TreeNode? root) {
        final res = levelOrder(root);
        if (res.last.length == 1) {
            return TreeNode(res.last.first);
        }
        final p = res.last.first;
        final q = res.last.last;
        final ancestorValue = lowestCommonAncestor(root!, TreeNode(p), TreeNode(q));
        final subTree = getSubTree(root, ancestorValue);

        return subTree;
    }

    TreeNode? getSubTree(TreeNode? root, int target) {
        Queue<TreeNode> q = Queue();
        q.add(root!);
        while (q.isNotEmpty) {
            final node = q.removeFirst();
            if (node.val == target) {
                return node;
            }

            if (node.left != null) {
                q.add(node.left!);
            }

            if (node.right != null) {
                q.add(node.right!);
            }
        }

        return null;
    }

    int lowestCommonAncestor(TreeNode? root, TreeNode? p, TreeNode? q) {
        if (root == null) {
            return -1;
        }

        if (root.val == p!.val || root.val == q!.val) {
            return root.val;
        }

        final left = lowestCommonAncestor(root.left, p, q);
        final right = lowestCommonAncestor(root.right, p, q);

        if (left != -1 && right != -1) {
            return root.val;
        }

        return left == -1 ? right : left;
    }

    List<List<int>> levelOrder(TreeNode? root) {
        if (root == null) {
            return [];
        }

        Queue<TreeNode> q = Queue();
        q.add(root);
        final List<List<int>> res = [];
        while (q.isNotEmpty) {
            final size = q.length;
            final List<int> curLevel = [];
            for (int i = 0; i < size; i++) {
                final node = q.removeFirst();
                curLevel.add(node.val);
                if (node.left != null) {
                    q.add(node.left!);
                }
                if (node.right != null) {
                    q.add(node.right!);
                }
            }
            res.add(List.from(curLevel));
        }

        return res;
    }
}
