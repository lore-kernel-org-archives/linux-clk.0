Return-Path: <SRS0=TujE=WS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01802C3A5A3
	for <linux-clk@archiver.kernel.org>; Thu, 22 Aug 2019 17:25:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC25C23427
	for <linux-clk@archiver.kernel.org>; Thu, 22 Aug 2019 17:25:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="euLLhY+9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391826AbfHVRZE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Aug 2019 13:25:04 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:32895 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391818AbfHVRZD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Aug 2019 13:25:03 -0400
Received: by mail-pl1-f195.google.com with SMTP id go14so3839698plb.0
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2019 10:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RtuYujDQbGoE383NaOTW8yNTTYMDfvcRIoYrv77xBo0=;
        b=euLLhY+946DfyFpuvIdyFGJfMj0knyI7kYwiFDLPxTrrpqBXt30egdCgq3fEB/sL88
         GJZHY1upb9230M9+Zx2VsXWQbb6terlbASK2Y8NjIXMYqZYxmMrwPJrKbYsdrXVKdKVp
         h3oLBX6Xq2Kyr7bh2rZD1m3sNpfVxJEePoY4q7+bX1Usir70lWfAZ2Q5Wm9c3x/iC2oF
         i845R9dxFgTKai1UsSQc1aFVXhbltY2Rql4zSkj4KmwbqXDJHZOd0ZxLP53dYJHtXhvW
         PFZDbnj5L0kebFpNB0KndJJvUuR+yNkmwD89p/IsdVDOyVRCYiob6rsRKOyrv39tDlJH
         213g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RtuYujDQbGoE383NaOTW8yNTTYMDfvcRIoYrv77xBo0=;
        b=c9/HK4J9xE4GuuHhEjtpMhJQx5COXVNT+I9q4pFICbyE7hiqHdmt+lhLdmzKrpiiS4
         xS8epn8XBa7YklHceZtq8qyIGNj7W3Nskqo/w/pYZWFQyNJm0YwJ4JEugBIbDQemg+A2
         6bD4o/gZ3BXVdwzbHflq/7dYSK+xpBaz93Ai9cwWMWlEoglfByXZbRWevSatZiGzIRVV
         f6OGg+OmUBycpDrfwoaNfmOKr600JJtQVNBPI3dQ2og0uZEy4OrO03uVQUm0wcoNRwiH
         36Hz5BeuqURSPqjWhTTJZC9/+FPC5cbDU4RnfH2d+dQerTR6KxgPdMHxegt3XvSOcaPe
         Ptaw==
X-Gm-Message-State: APjAAAX2KtwGtsBWpRIQZrRcwyuO/jqaDGKTKnptGEGTJhtoyNB/nhpc
        UwVeuLzag+d0EA77EWSFndoD
X-Google-Smtp-Source: APXvYqz5vFIuN706iVqol8q3EsrpnwcsQfBFEXMXn/Nwi/SX1PpPwoQhg1LPT7MBQ1EhYyTnuzzXkA==
X-Received: by 2002:a17:902:788b:: with SMTP id q11mr40640145pll.308.1566494703001;
        Thu, 22 Aug 2019 10:25:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:71cc:5738:24ad:193e:4b59:8a76])
        by smtp.gmail.com with ESMTPSA id r12sm31705798pgb.73.2019.08.22.10.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 10:25:02 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 3/8] clk: Add clk_hw_unregister_composite helper function definition
Date:   Thu, 22 Aug 2019 22:54:21 +0530
Message-Id: <20190822172426.25879-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
References: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This function has been delcared but not defined anywhere. Hence, this
commit adds definition for it.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/clk-composite.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 4d579f9d20f6..ccca58a6d271 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -344,3 +344,14 @@ void clk_unregister_composite(struct clk *clk)
 	clk_unregister(clk);
 	kfree(composite);
 }
+
+void clk_hw_unregister_composite(struct clk_hw *hw)
+{
+	struct clk_composite *composite;
+
+	composite = to_clk_composite(hw);
+
+	clk_hw_unregister(hw);
+	kfree(composite);
+}
+EXPORT_SYMBOL_GPL(clk_hw_unregister_composite);
-- 
2.17.1

