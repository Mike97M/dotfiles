(setq org-capture-templates
        (append '(("i" "Income Ledger Entry")

                ("ig" "Income:Gifts" plain
                (file ledger-journal-file)
                "%(org-read-date) * receive %^{Received From} %^{For why}
Assets:%^{Account|Personal|Home}  %^{Amount} %^{Currency|CNY|USD|JPY}
Income:Gifts
")
                )
                org-capture-templates))

(setq org-capture-templates
        (append '(("e" "Expense Ledger Entry ")

                ("eg" "Expense:Gifts" plain
                (file ledger-journal-file)
                "%(org-read-date) * send %^{Send to} %^{For why}
Expense:Gifts  %^{Amount}  %^{Currency|CNY|USD|JPY}
Assets:%^{Account||Personal|Home}
")
                )
                org-capture-templates))
