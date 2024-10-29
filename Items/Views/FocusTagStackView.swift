//
//  FocustagStackView.swift
//  Items
//
//  Created by Joseph DeWeese on 10/28/24.
//

import SwiftUI

struct FocusTagsStackView: View {
    var focusTags: [FocusTag]
    var body: some View {
        HStack {
            ForEach(focusTags.sorted(using: KeyPathComparator(\FocusTag.name))) { focusTag in
                Text(focusTag.name)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 5).fill(focusTag.hexColor))
            }
        }
    }
}
