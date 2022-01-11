Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D92C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jan 2022 05:11:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbiAKFLh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Jan 2022 00:11:37 -0500
Received: from mta-p6.oit.umn.edu ([134.84.196.206]:45298 "EHLO
        mta-p6.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiAKFLh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jan 2022 00:11:37 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4JXzLv5ly5z9w5LS
        for <linux-clk@vger.kernel.org>; Tue, 11 Jan 2022 05:11:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4cWag-X6rGRO for <linux-clk@vger.kernel.org>;
        Mon, 10 Jan 2022 23:11:35 -0600 (CST)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4JXzLv3Zddz9w5LV
        for <linux-clk@vger.kernel.org>; Mon, 10 Jan 2022 23:11:35 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4JXzLv3Zddz9w5LV
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4JXzLv3Zddz9w5LV
Received: by mail-pl1-f199.google.com with SMTP id z18-20020a170903019200b00149b6eb5d3eso4285803plg.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Jan 2022 21:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OJq20ZDsbsCyRFb0aTI4IU3mCcY8cyPLYydnaATGypQ=;
        b=ZW+OlbDxE47Q36VWP+qFHlEJZ3IFfFN/DVnUpz5b5GefXSfvAyo4GG/zDdLGOQLqf8
         xu9Elc1Q49mlP4YkNQuahX9uQTGgnjsaXQcjuU86a9gXQL/q1IFQp4nWBE5cLYTeJ1Km
         b9gp7yy4ndUKgXggc7yqDvLm9I/za74qUOJq+F0/QP3e7HI71WQjmf0Kis4tcfbxGgcr
         CuNNQuoTn3jV6+/UoygspAYxXkoSAQesQ9ZyOm1bD8+w51imCc999xFwRNYx/RB5a96w
         1sLjvn5vd3GwQYMVgH8QPh9NqaUbr6X9KYtrNz9TiV8rkPhBBXTyoERJtgpgXx7HuLM/
         AjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OJq20ZDsbsCyRFb0aTI4IU3mCcY8cyPLYydnaATGypQ=;
        b=u5v3aWewzyMaXfJBgdbQIwZObp659jTs17KmiakWhDgqiQqrn3i4Yyv42DV5aY6+hg
         DxGBFgsrrSPHdd7T8uQw6i6f2XuYYBoq6LFOtj3Hw0liPK3cR2OJxT+Dw3p/BW06pNgl
         JgK55vx2BtQvYSdH/wbVgbFrNVxfDy/8pOtzpba3qRnhSbhQk40slgWVHxBR7pJGcMKM
         hLUSqQhAraF/U/ogWs5woEL8uoZu7Dz/6J4WgmM7T0bhTwbjd0yCark0AbkLEeOr48jW
         HdCaKt3LT3ABggfRj4HWsY1A2WQuZUOjmWhpSBlKxWUWHIR6+etuHLpcl/wTHXQ1YjY1
         xh5Q==
X-Gm-Message-State: AOAM5326dBlTbNeGY6zdK0qGQHhvLVnlJ/hYTPVvsXvf3LPSl6p0Gyt5
        AEfmu2xB9G/6DETKkJDr8zWssSA6lO/LNph1w1UbblNGBfwL0T6OM1FgKWy7SasFUye9N35Gq/A
        5+bmEBDFCUBiMxkhGcpXk6QCn
X-Received: by 2002:a62:8f87:0:b0:4ba:a2f0:5f88 with SMTP id n129-20020a628f87000000b004baa2f05f88mr3043833pfd.80.1641877894596;
        Mon, 10 Jan 2022 21:11:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCutU1AIoI+xaBfL7oHa9AbLxukUT+2pXjQtjRTQlRwYiNcnlDJq+Mnp5TEOfrxx9OpuUF7g==
X-Received: by 2002:a62:8f87:0:b0:4ba:a2f0:5f88 with SMTP id n129-20020a628f87000000b004baa2f05f88mr3043802pfd.80.1641877894198;
        Mon, 10 Jan 2022 21:11:34 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.249])
        by smtp.gmail.com with ESMTPSA id q19sm300034pfk.131.2022.01.10.21.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 21:11:33 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mario Limonciello <Mario.Limonciello@amd.com>,
        Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Akshu Agrawal <akshu.agrawal@amd.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] clk: x86: Fix a wild pointer dereference in fch_clk_probe()
Date:   Tue, 11 Jan 2022 13:10:21 +0800
Message-Id: <20220111051022.98479-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In fch_clk_probe(), the return value of clk_hw_register_mux() is
assigned to hws[ST_CLK_MUX] and there is a dereference of it in
fch_clk_probe(), which could lead to a wild pointer dereference on
failure of clk_hw_register_mux().

Fix this bug by adding a check of hws[ST_CLK_MUX].

This bug was found by a static analyzer.

Builds with CONFIG_X86_AMD_PLATFORM_DEVICE=y show no new warnings, and
our static analyzer no longer warns about this code.

Fixes: 19fe87fd854a ("clk: x86: Support RV architecture")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
The analysis employs differential checking to identify inconsistent 
security operations (e.g., checks or kfrees) between two code paths
and confirms that the inconsistent operations are not recovered in 
the current function or the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Changes in v3:
  -  Rebase this based on clk-next.

Changes in v2:
  -  Add error check to every register function calls.
  -  Add error handling logic to every error path.
  -  Turn clk_hw_register_mux to devm_clk_hw_register_mux.
  -  Add error check of clk_set_parent().

 drivers/clk/x86/clk-fch.c | 69 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/x86/clk-fch.c b/drivers/clk/x86/clk-fch.c
index fdc060e75839..bb0ed6b2a126 100644
--- a/drivers/clk/x86/clk-fch.c
+++ b/drivers/clk/x86/clk-fch.c
@@ -46,6 +46,7 @@ static int fch_clk_probe(struct platform_device *pdev)
 {
 	struct fch_clk_data *fch_data;
 	struct pci_dev *rdev;
+	int ret;
 
 	fch_data = dev_get_platdata(&pdev->dev);
 	if (!fch_data || !fch_data->base)
@@ -60,36 +61,88 @@ static int fch_clk_probe(struct platform_device *pdev)
 	if (pci_match_id(fch_pci_ids, rdev)) {
 		hws[ST_CLK_48M] = clk_hw_register_fixed_rate(NULL, "clk48MHz",
 			NULL, 0, 48000000);
+		if (IS_ERR(hws[ST_CLK_48M])) {
+			ret = PTR_ERR(hws[ST_CLK_48M]);
+			goto err_st_clk_48m;
+		}
+
 		hws[ST_CLK_25M] = clk_hw_register_fixed_rate(NULL, "clk25MHz",
 			NULL, 0, 25000000);
+		if (IS_ERR(hws[ST_CLK_25M])) {
+			ret = PTR_ERR(hws[ST_CLK_25M]);
+			goto err_st_clk_25m;
+		}
 
-		hws[ST_CLK_MUX] = clk_hw_register_mux(NULL, "oscout1_mux",
+		hws[ST_CLK_MUX] = devm_clk_hw_register_mux(NULL, "oscout1_mux",
 			clk_oscout1_parents, ARRAY_SIZE(clk_oscout1_parents),
 			0, fch_data->base + CLKDRVSTR2, OSCOUT1CLK25MHZ, 3, 0,
 			NULL);
+		if (IS_ERR(hws[ST_CLK_MUX])) {
+			ret = PTR_ERR(hws[ST_CLK_MUX]);
+			goto err_st_clk_mux;
+		}
 
-		clk_set_parent(hws[ST_CLK_MUX]->clk, hws[ST_CLK_48M]->clk);
+		ret = clk_set_parent(hws[ST_CLK_MUX]->clk, hws[ST_CLK_48M]->clk);
+		if (ret)
+			goto err_clk_set_parent;
 
 		hws[ST_CLK_GATE] = clk_hw_register_gate(NULL, "oscout1",
 			"oscout1_mux", 0, fch_data->base + MISCCLKCNTL1,
 			OSCCLKENB, CLK_GATE_SET_TO_DISABLE, NULL);
-
-		devm_clk_hw_register_clkdev(&pdev->dev, hws[ST_CLK_GATE],
-					    fch_data->name, NULL);
+		if (IS_ERR(hws[ST_CLK_GATE])) {
+			ret = PTR_ERR(hws[ST_CLK_GATE]);
+			goto err_st_clk_gate;
+		}
+
+		ret = devm_clk_hw_register_clkdev(&pdev->dev, hws[ST_CLK_GATE],
+			fch_data->name, NULL);
+		if (ret)
+			goto err_register_st_clk_gate;
 	} else {
 		hws[CLK_48M_FIXED] = clk_hw_register_fixed_rate(NULL, "clk48MHz",
 			NULL, 0, 48000000);
+		if (IS_ERR(hws[CLK_48M_FIXED])) {
+			ret = PTR_ERR(hws[CLK_48M_FIXED]);
+			goto err_clk_48m_fixed;
+		}
 
 		hws[CLK_GATE_FIXED] = clk_hw_register_gate(NULL, "oscout1",
 			"clk48MHz", 0, fch_data->base + MISCCLKCNTL1,
 			OSCCLKENB, 0, NULL);
-
-		devm_clk_hw_register_clkdev(&pdev->dev, hws[CLK_GATE_FIXED],
-					    fch_data->name, NULL);
+		if (IS_ERR(hws[CLK_GATE_FIXED])) {
+			ret = PTR_ERR(hws[CLK_GATE_FIXED]);
+			goto err_clk_gate_fixed;
+		}
+
+		ret = devm_clk_hw_register_clkdev(&pdev->dev, hws[CLK_GATE_FIXED],
+			fch_data->name, NULL);
+		if (ret)
+			goto err_register_gate_fixed;
 	}
 
 	pci_dev_put(rdev);
 	return 0;
+
+err_register_st_clk_gate:
+	clk_hw_unregister_gate(hws[ST_CLK_GATE]);
+err_st_clk_gate:
+err_clk_set_parent:
+	clk_hw_unregister_mux(hws[ST_CLK_MUX]);
+err_st_clk_mux:
+	clk_hw_unregister_fixed_rate(hws[ST_CLK_25M]);
+err_st_clk_25m:
+	clk_hw_unregister_fixed_rate(hws[ST_CLK_48M]);
+err_st_clk_48m:
+	pci_dev_put(rdev);
+	return ret;
+
+err_register_gate_fixed:
+	clk_hw_unregister_gate(hws[CLK_GATE_FIXED]);
+err_clk_gate_fixed:
+	clk_hw_unregister_fixed_rate(hws[CLK_48M_FIXED]);
+err_clk_48m_fixed:
+	pci_dev_put(rdev);
+	return ret;
 }
 
 static int fch_clk_remove(struct platform_device *pdev)
-- 
2.25.1

