Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5102C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 10:11:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A61F8217D4
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 10:11:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jUvvE6w3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbfDKKL2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 06:11:28 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51316 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfDKKL2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Apr 2019 06:11:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id 4so5972440wmf.1
        for <linux-clk@vger.kernel.org>; Thu, 11 Apr 2019 03:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7qI+ZWWIMHltYSznNw2lTgjNf3bPwadjKioiVRWZ+9k=;
        b=jUvvE6w3smmDbCVhZ4x7SPkUjN3ayQHofEjHTZXDZ7Fl3rDkn3bm6mRBUCLvzz2ViK
         B3HkbTnyyPzZoPUBUYcMcXxWwiqS5rCEseDt06tBPK89ALKPngQwbBEdFUIWIjezjoAy
         yFoWEmMof0NYXsO1KGOWBuPBlFHvg/WPa/HdgIciwbimqj5XZg0dq21/nbiKv9mmv1U0
         yYqomJ+zP1plvLeZs9YfWlH3xrOGqj+rJFIBZ96HA0HKptn37fPB1ioRDTjTGBnlhoVu
         U7zN+JtuygYH0fd5lTvbUdQ2q+8HhHwif/vpmxTV21ZKzOGYQglUN+5HcMDPFjtQlrZ+
         c87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7qI+ZWWIMHltYSznNw2lTgjNf3bPwadjKioiVRWZ+9k=;
        b=PiZ53BGpLXhqPUSGObTEhVr/rNtPZGhpryLMKIjPGQhUCze1tdN4K7M6HVHkSmozbw
         Bq4GlbQnk97o2sFNTsSjjd63uD2pBAcQUDW++wtxtFmDVNWEEcZS18o1OsB25NgcNO2y
         mP9SGA+c9kiTYL+xPZUmMASXR7HBD0qgkBdJHV5ZyRqoRd2iBFxca+RkciGsg/LHxipu
         U5Z/G41jGL1BmxKtEeIv7zxJ9uOOl0yeIPaPvJgB/nF7aCofxWJ2QRBJ9yHGEahTsPoY
         n/tmy96qMJpPTtbJpwBccVZoF4kdwCo9tJdYOcZdLWfgPgmFKYRf2IpzSSUW6JBrj52s
         HE7A==
X-Gm-Message-State: APjAAAUz91IqpH/TvWYJc83mpPVljlJgyowavH35WcOVMZ737LAHwli1
        7eH+hbrQkRJbQg9g4RPfwA3IWg==
X-Google-Smtp-Source: APXvYqwb3+sZIsfGEr50gu0LXWxS00KYvWV+aGZ4XFruIONuzWVi/unDI4oWnMykpfkh1e6+Uy3XEg==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr6508663wmi.57.1554977485970;
        Thu, 11 Apr 2019 03:11:25 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j3sm90805800wre.51.2019.04.11.03.11.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 03:11:24 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     stable@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
        khilman@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [PATCH stable 4.19] Revert "clk: meson: clean-up clock registration"
Date:   Thu, 11 Apr 2019 12:11:22 +0200
Message-Id: <20190411101122.5438-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This reverts commit c8e4f8406842332fb55cd792016e5dac266f6354.

This patch was not initially a fix and is dependent on other
changes which are not fixes eithers.

With this change, multiple Amlogic based boards fails to boot,
as reported by kernelci.

Cc: stable@vger.kernel.org # 4.19.34
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/meson-aoclk.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index 258c8d259ea1..f965845917e3 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -65,20 +65,15 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Populate regmap */
-	for (clkid = 0; clkid < data->num_clks; clkid++)
+	/*
+	 * Populate regmap and register all clks
+	 */
+	for (clkid = 0; clkid < data->num_clks; clkid++) {
 		data->clks[clkid]->map = regmap;
 
-	/* Register all clks */
-	for (clkid = 0; clkid < data->hw_data->num; clkid++) {
-		if (!data->hw_data->hws[clkid])
-			continue;
-
 		ret = devm_clk_hw_register(dev, data->hw_data->hws[clkid]);
-		if (ret) {
-			dev_err(dev, "Clock registration failed\n");
+		if (ret)
 			return ret;
-		}
 	}
 
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
-- 
2.21.0

