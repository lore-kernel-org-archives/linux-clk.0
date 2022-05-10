Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D7DC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 10 May 2022 10:48:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240081AbiEJKwp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 May 2022 06:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240101AbiEJKwl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2022 06:52:41 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164322AC0EA
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 03:48:36 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id cq17-20020a17090af99100b001dc0386cd8fso1799928pjb.5
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 03:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tzF3zMl148ythS9iGSJQp8oXHfarSiI1rX+VL1jsG+s=;
        b=jZeTzcOZnlADgIFe3NUqIMmSuY7M9pUwvK8p5IFeb+DvxZI0dXmBftEtJP7l2z2uTM
         jrX/MFC9DnVK2rqlNU7fBXgMeTJvT9Zh6VT8+eTUpzxMhn+00+HdsQzDXCt6qcZs6420
         2f9cKqvtuMDNR+89Bqpks7OFnVk4YzwNfuDN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tzF3zMl148ythS9iGSJQp8oXHfarSiI1rX+VL1jsG+s=;
        b=Fz46XzDOMVgSSKCRhhG9vTG3L7x14cT7M376WVI6eLGYaCn6g6vh7DZa6xfiJE4EjD
         t9Bal0qCdMd/Mdx8h2yS1DGI43Q8v9Q33SFipGFUEhRR3fEIGHf9uMU9kihdodwEfd9I
         XBe8OU45b6A21dWXyVpOp9/B5Nmy0TNgewNIpJSHR3h9DRGnHch6loubKM9jnGjjMPnB
         qLypinTwrI3M9wGkjuYKiJCErkfTnuPw/Yxn1BMwV/cML2N1kv7bDuYU3bfvOOJW2Jfh
         P59YNJyrIml86A2BUXYcBmLc+RKSXBMkpsvvbIuRjl8grxSJUQDrU9enr/9fwZ34xh2O
         PNvA==
X-Gm-Message-State: AOAM533eMCx78IasMhTuO945ns+rOsAtHkKWRsRbCzYgiEr37RdwUIup
        MsPDCPI7Aw+HL6A6/8XJ/YFVSQ==
X-Google-Smtp-Source: ABdhPJzg4hcOpMXUhbbguk4wcBkfp9MKOzQzpx82C9nBakbzVvlhEej4m/INwNRulsfCiSpL4GziVA==
X-Received: by 2002:a17:90b:2250:b0:1dc:6437:8b10 with SMTP id hk16-20020a17090b225000b001dc64378b10mr22474118pjb.119.1652179715683;
        Tue, 10 May 2022 03:48:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6dcd:8578:55cf:2b12])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902e30900b0015e8d4eb21esm1659691plc.104.2022.05.10.03.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 03:48:35 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] clk: mediatek: mt8173: Fix usage of mtk_clk_register_ref2usb_tx()
Date:   Tue, 10 May 2022 18:48:03 +0800
Message-Id: <20220510104804.544597-11-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
In-Reply-To: <20220510104804.544597-1-wenst@chromium.org>
References: <20220510104804.544597-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As part of the effort to improve the MediaTek clk drivers, the next step
is to switch from the old 'struct clk' clk prodivder APIs to the new
'struct clk_hw' ones.

The apmixed clk library contains one special clk type that doesn't fit
any of the generic clk types. This type is currently used only on the
MT8173 SoC. The code for this clk type was converted by the coccinelle
script from the previous patch, but the call site was not.

Fix the return variable type for mtk_clk_register_ref2usb_tx() in the
MT8173 clk driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8173.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 511b4da9e727..68d3a9749316 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -993,6 +993,7 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 {
 	struct clk_hw_onecell_data *clk_data;
 	void __iomem *base;
+	struct clk_hw *hw;
 	struct clk *clk;
 	int r, i;
 
@@ -1013,16 +1014,13 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 	for (i = 0; i < ARRAY_SIZE(apmixed_usb); i++) {
 		const struct mtk_clk_usb *cku = &apmixed_usb[i];
 
-		clk = mtk_clk_register_ref2usb_tx(cku->name, cku->parent,
-					base + cku->reg_ofs);
-
-		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n", cku->name,
-					PTR_ERR(clk));
+		hw = mtk_clk_register_ref2usb_tx(cku->name, cku->parent, base + cku->reg_ofs);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register clk %s: %ld\n", cku->name, PTR_ERR(hw));
 			continue;
 		}
 
-		clk_data->hws[cku->id] = __clk_get_hw(clk);
+		clk_data->hws[cku->id] = hw;
 	}
 
 	clk = clk_register_divider(NULL, "hdmi_ref", "tvdpll_594m", 0,
-- 
2.36.0.512.ge40c2bad7a-goog

