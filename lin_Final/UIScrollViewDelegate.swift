//
//  UIScrollViewDelegate.swift
//  lin_Final
//
//  Created by User01 on 2022/12/21.
//

// MARK: UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
                
        guard scrollView.contentSize.height > self.tableView.frame.height, self.pageStatus == .NotLoadingMore else { return }
                        
        if scrollView.contentSize.height - (scrollView.frame.size.height + scrollView.contentOffset.y) <= -10 {
                        
            self.pageStatus = .LoadingMore
            self.tableView.reloadData {
                // 模擬 Call API 的時間
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.dataList += Array(repeating: "", count: 6)
                    self.pageStatus = .NotLoadingMore
                    self.tableView.reloadData()
                }
            }
            
        }
    }
}
