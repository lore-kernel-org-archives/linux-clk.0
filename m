Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4E5C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 16:58:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E78B320659
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 16:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FQqO74ty"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E78B320659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbeLDQ6e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 11:58:34 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32979 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727296AbeLDQ6e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 11:58:34 -0500
Received: by mail-wr1-f68.google.com with SMTP id c14so16747238wrr.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Dec 2018 08:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QexVJLOcv8y3bTpNXNLUpoDtvoGi99S6MUCsYAM8CRc=;
        b=FQqO74tybSN6ZzpP8nkyCnk5REj5HgC0rtTZ59/fMkGAZWtMvvyyIcAVJ+puYiCsDR
         E/SqYIMjkdLbKRDM5Khucml56wOebg9QpoOyK16N74kgE+Yng9jAupkrMdeAzTWpFIdF
         EEaQvbgi9ZeQTczsmQXuZcoZDhNlSOuZxsWpOTfpPypQoApIoeLs6lct1C5trseZM+tw
         WXfZ2lxCtp/djnrVgg6aM8yltj4ByF4X4uOmThquR/9/LWKegsAXrDsHHvays/KDkhJ9
         NwUXLR0dBSDzYklJQ/flLkRNjh94aW0062UVp9pCCib7ifWUGag2xND5rPJncQmcD41q
         RUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QexVJLOcv8y3bTpNXNLUpoDtvoGi99S6MUCsYAM8CRc=;
        b=M8ZYlDuoTMliVq1nhZSeYgmA29kJF8fglCnJiM18NLS5QVJBiiSUzK3u02r45iZU+y
         mlRoLHDDkBi9VxB5TPQ6sZpcwjIIbXtsmmknahJEsXQ6y1XrgU3tqP/wOiJ//QXRGzpe
         w7oti3MWZJUolU7vz2at6wF0jGgXBgbsn/hAB0Wox2lK/kwtj7m5RJAknQ0EXbFuULCR
         20CeHwXnIdXYPMcfB5kV3aHeqwur3qlQ3NRjJ0jCOHqXfiOvZ4ndLguNwN5lOQ7t1IUQ
         Ktkod7IruYw3y58+h5zzRt4YHk1PEZkRuMx7juijwjVdEz0qUpPfoPuEqYR4upbF/1f9
         wUEQ==
X-Gm-Message-State: AA+aEWZHD9pOw+fB9nqrAHrAS0aFk0tNzmOdIvZ+RDcdGwuhGYYL62ty
        7HK+LJp7rHSDght4PqnzIbN65AriGKY=
X-Google-Smtp-Source: AFSGD/UMgq/PhM7oa7J4PwCRvyOblmIKxSBNNjyF15wBFEmRB1874ajEyIP9XuaJRro2QGioz8/poA==
X-Received: by 2002:a5d:4b8b:: with SMTP id b11mr18978382wrt.180.1543942711702;
        Tue, 04 Dec 2018 08:58:31 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id x81sm10152521wmg.17.2018.12.04.08.58.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Dec 2018 08:58:31 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] clk: meson: axg-audio: use the clk input helper function
Date:   Tue,  4 Dec 2018 17:58:19 +0100
Message-Id: <20181204165819.21541-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181204165819.21541-1-jbrunet@baylibre.com>
References: <20181204165819.21541-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rework the axg audio clock controller to use the new clk-input helper
function.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 83 ++++++++++-------------------------
 1 file changed, 24 insertions(+), 59 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 5f6c860aa122..72b717e61a68 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -631,22 +631,23 @@ static struct clk_regmap *const axg_audio_clk_regmaps[] = {
 	&axg_tdmout_c_lrclk,
 };
 
-static struct clk *devm_clk_get_enable(struct device *dev, char *id)
+static int devm_clk_get_enable(struct device *dev, char *id)
 {
 	struct clk *clk;
 	int ret;
 
 	clk = devm_clk_get(dev, id);
 	if (IS_ERR(clk)) {
-		if (PTR_ERR(clk) != -EPROBE_DEFER)
+		ret = PTR_ERR(clk);
+		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "failed to get %s", id);
-		return clk;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(clk);
 	if (ret) {
 		dev_err(dev, "failed to enable %s", id);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
 	ret = devm_add_action_or_reset(dev,
@@ -654,74 +655,40 @@ static struct clk *devm_clk_get_enable(struct device *dev, char *id)
 				       clk);
 	if (ret) {
 		dev_err(dev, "failed to add reset action on %s", id);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
-	return clk;
-}
-
-static const struct clk_ops axg_clk_no_ops = {};
-
-static struct clk_hw *axg_clk_hw_register_bypass(struct device *dev,
-						 const char *name,
-						 const char *parent_name)
-{
-	struct clk_hw *hw;
-	struct clk_init_data init;
-	char *clk_name;
-	int ret;
-
-	hw = devm_kzalloc(dev, sizeof(*hw), GFP_KERNEL);
-	if (!hw)
-		return ERR_PTR(-ENOMEM);
-
-	clk_name = kasprintf(GFP_KERNEL, "axg_%s", name);
-	if (!clk_name)
-		return ERR_PTR(-ENOMEM);
-
-	init.name = clk_name;
-	init.ops = &axg_clk_no_ops;
-	init.flags = 0;
-	init.parent_names = parent_name ? &parent_name : NULL;
-	init.num_parents = parent_name ? 1 : 0;
-	hw->init = &init;
-
-	ret = devm_clk_hw_register(dev, hw);
-	kfree(clk_name);
-
-	return ret ? ERR_PTR(ret) : hw;
+	return 0;
 }
 
 static int axg_register_clk_hw_input(struct device *dev,
 				     const char *name,
 				     unsigned int clkid)
 {
-	struct clk *parent_clk = devm_clk_get(dev, name);
-	struct clk_hw *hw = NULL;
+	char *clk_name;
+	struct clk_hw *hw;
+	int err = 0;
 
-	if (IS_ERR(parent_clk)) {
-		int err = PTR_ERR(parent_clk);
+	clk_name = kasprintf(GFP_KERNEL, "axg_%s", name);
+	if (!clk_name)
+		return -ENOMEM;
 
+	hw = meson_clk_hw_register_input(dev, name, clk_name, 0);
+	if (IS_ERR(hw)) {
 		/* It is ok if an input clock is missing */
-		if (err == -ENOENT) {
+		if (PTR_ERR(hw) == -ENOENT) {
 			dev_dbg(dev, "%s not provided", name);
 		} else {
+			err = PTR_ERR(hw);
 			if (err != -EPROBE_DEFER)
 				dev_err(dev, "failed to get %s clock", name);
-			return err;
 		}
 	} else {
-		hw = axg_clk_hw_register_bypass(dev, name,
-						__clk_get_name(parent_clk));
-	}
-
-	if (IS_ERR(hw)) {
-		dev_err(dev, "failed to register %s clock", name);
-		return PTR_ERR(hw);
+		axg_audio_hw_onecell_data.hws[clkid] = hw;
 	}
 
-	axg_audio_hw_onecell_data.hws[clkid] = hw;
-	return 0;
+	kfree(clk_name);
+	return err;
 }
 
 static int axg_register_clk_hw_inputs(struct device *dev,
@@ -759,7 +726,6 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	struct regmap *map;
 	struct resource *res;
 	void __iomem *regs;
-	struct clk *clk;
 	struct clk_hw *hw;
 	int ret, i;
 
@@ -775,9 +741,9 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	}
 
 	/* Get the mandatory peripheral clock */
-	clk = devm_clk_get_enable(dev, "pclk");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ret = devm_clk_get_enable(dev, "pclk");
+	if (ret)
+		return ret;
 
 	ret = device_reset(dev);
 	if (ret) {
@@ -786,8 +752,7 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	}
 
 	/* Register the peripheral input clock */
-	hw = axg_clk_hw_register_bypass(dev, "audio_pclk",
-					__clk_get_name(clk));
+	hw = meson_clk_hw_register_input(dev, "pclk", "audio_pclk", 0);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-- 
2.19.1

