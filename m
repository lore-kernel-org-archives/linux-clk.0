Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5696CC43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 16:07:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 16E402070B
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 16:07:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kYT5+kuN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729787AbfC2QHN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 12:07:13 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40926 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728839AbfC2QHN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 12:07:13 -0400
Received: by mail-wm1-f67.google.com with SMTP id z24so3451909wmi.5
        for <linux-clk@vger.kernel.org>; Fri, 29 Mar 2019 09:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h2MA8D37zKyCh3+b0iJ6DYGl2ecKDGupFPgJCiFgLA8=;
        b=kYT5+kuNF+fXhhOGMYGLJJmqyilv14pXIYempfyDnZSO4cFfli/MirI8RdeQxjmGw8
         WW3E1SDxfnsp7gHqsWVGSD4HrSahm/d3Uv2H0aHIpYETlwcdV6HrC0OR7iVsu0KtfXWT
         bUChCQ1syzIZwsML2cSWPFCYiwhaKayNgbCOLimVz972w0PQata1GkcLDuwf2cp4189K
         zE+6igdW+OCYNwB+iCSCOeGrsk33k1sK8770paSp2hm40iTD2gDCj7ThJEIkfYWPtmiM
         2H19OazCUB/ItLr/mED/4NP3A3XI6G23mbvNdvQhISOY32q52vpiXx9uyxe/b7hXtDbb
         XBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2MA8D37zKyCh3+b0iJ6DYGl2ecKDGupFPgJCiFgLA8=;
        b=ma86ydu1HkN0Wt+kIAPGfb1da5IYG8aIPYn8wQPVilxHASHUHuq1Lbgop5hHoQd3s0
         RODCL1HxbWSrZTm046aW42EUZL9t7EQo+x1A+Bi8x6BY0YU76qcfjZricyGk4zEmtk11
         KAaWyYIR/f9joo/9Vn+B5uf8tkgYtjGfdNJeWl8OODbOIPqsPJzPtCFgfUZ5uFQrWCGZ
         6cDIsNxKcSeWnmGO8SqwGRyHKOMsjpEIT4idGgkkON99BUz6NMvc9wMt59zT1N5QJPzR
         0ikxFa4HOC/pGo1XuR1DM8MxzWwxeGXd+8fq/P6dY6QHtuwWA2e+5ZofMvLoluB1/zXb
         NXaQ==
X-Gm-Message-State: APjAAAU6/lm1LmTrOP+vkh8uDryS9UzVzfsgKrmVROdzmuvJL1UzySk4
        Dlp4yQYr5dGd5WNZwAg+Y+EOZw==
X-Google-Smtp-Source: APXvYqwcNgqBc3b4P9u9adZPRLV2/LI5EF7emm/I4AspRv3L4AWhYZ0aDO+cYG79PsW8E9MOPnfHFw==
X-Received: by 2002:a1c:9d8f:: with SMTP id g137mr4305540wme.26.1553875630762;
        Fri, 29 Mar 2019 09:07:10 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id c10sm3329527wrt.65.2019.03.29.09.07.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Mar 2019 09:07:10 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/4] clk: meson: axg-audio: don't register inputs in the onecell data
Date:   Fri, 29 Mar 2019 17:06:48 +0100
Message-Id: <20190329160649.31603-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190329160649.31603-1-jbrunet@baylibre.com>
References: <20190329160649.31603-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Clock inputs should not be exported outside the controller. It is a hack
to have a stable global clock name within the clock controller, even for
clocks external to the controller.

There is an ongoing effort to replace this hack with something better.
The first step is to not register those clocks in the provider anymore,
so we can completely remove them later on.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 21 ++++++---------------
 drivers/clk/meson/axg-audio.h | 29 -----------------------------
 2 files changed, 6 insertions(+), 44 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 38fccffc171e..e8516f9c03d3 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -665,8 +665,7 @@ static int devm_clk_get_enable(struct device *dev, char *id)
 }
 
 static int axg_register_clk_hw_input(struct device *dev,
-				     const char *name,
-				     unsigned int clkid)
+				     const char *name)
 {
 	char *clk_name;
 	struct clk_hw *hw;
@@ -686,8 +685,6 @@ static int axg_register_clk_hw_input(struct device *dev,
 			if (err != -EPROBE_DEFER)
 				dev_err(dev, "failed to get %s clock", name);
 		}
-	} else {
-		axg_audio_hw_onecell_data.hws[clkid] = hw;
 	}
 
 	kfree(clk_name);
@@ -696,8 +693,7 @@ static int axg_register_clk_hw_input(struct device *dev,
 
 static int axg_register_clk_hw_inputs(struct device *dev,
 				      const char *basename,
-				      unsigned int count,
-				      unsigned int clkid)
+				      unsigned int count)
 {
 	char *name;
 	int i, ret;
@@ -707,7 +703,7 @@ static int axg_register_clk_hw_inputs(struct device *dev,
 		if (!name)
 			return -ENOMEM;
 
-		ret = axg_register_clk_hw_input(dev, name, clkid + i);
+		ret = axg_register_clk_hw_input(dev, name);
 		kfree(name);
 		if (ret)
 			return ret;
@@ -759,26 +755,21 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	axg_audio_hw_onecell_data.hws[AUD_CLKID_PCLK] = hw;
-
 	/* Register optional input master clocks */
 	ret = axg_register_clk_hw_inputs(dev, "mst_in",
-					 AUD_MST_IN_COUNT,
-					 AUD_CLKID_MST0);
+					 AUD_MST_IN_COUNT);
 	if (ret)
 		return ret;
 
 	/* Register optional input slave sclks */
 	ret = axg_register_clk_hw_inputs(dev, "slv_sclk",
-					 AUD_SLV_SCLK_COUNT,
-					 AUD_CLKID_SLV_SCLK0);
+					 AUD_SLV_SCLK_COUNT);
 	if (ret)
 		return ret;
 
 	/* Register optional input slave lrclks */
 	ret = axg_register_clk_hw_inputs(dev, "slv_lrclk",
-					 AUD_SLV_LRCLK_COUNT,
-					 AUD_CLKID_SLV_LRCLK0);
+					 AUD_SLV_LRCLK_COUNT);
 	if (ret)
 		return ret;
 
diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
index 644f0b0fddf2..9644c2ff0b3b 100644
--- a/drivers/clk/meson/axg-audio.h
+++ b/drivers/clk/meson/axg-audio.h
@@ -51,35 +51,6 @@
  * These indices are entirely contrived and do not map onto the hardware.
  */
 
-#define AUD_CLKID_PCLK			0
-#define AUD_CLKID_MST0			1
-#define AUD_CLKID_MST1			2
-#define AUD_CLKID_MST2			3
-#define AUD_CLKID_MST3			4
-#define AUD_CLKID_MST4			5
-#define AUD_CLKID_MST5			6
-#define AUD_CLKID_MST6			7
-#define AUD_CLKID_MST7			8
-#define AUD_CLKID_SLV_SCLK0		9
-#define AUD_CLKID_SLV_SCLK1		10
-#define AUD_CLKID_SLV_SCLK2		11
-#define AUD_CLKID_SLV_SCLK3		12
-#define AUD_CLKID_SLV_SCLK4		13
-#define AUD_CLKID_SLV_SCLK5		14
-#define AUD_CLKID_SLV_SCLK6		15
-#define AUD_CLKID_SLV_SCLK7		16
-#define AUD_CLKID_SLV_SCLK8		17
-#define AUD_CLKID_SLV_SCLK9		18
-#define AUD_CLKID_SLV_LRCLK0		19
-#define AUD_CLKID_SLV_LRCLK1		20
-#define AUD_CLKID_SLV_LRCLK2		21
-#define AUD_CLKID_SLV_LRCLK3		22
-#define AUD_CLKID_SLV_LRCLK4		23
-#define AUD_CLKID_SLV_LRCLK5		24
-#define AUD_CLKID_SLV_LRCLK6		25
-#define AUD_CLKID_SLV_LRCLK7		26
-#define AUD_CLKID_SLV_LRCLK8		27
-#define AUD_CLKID_SLV_LRCLK9		28
 #define AUD_CLKID_MST_A_MCLK_SEL	59
 #define AUD_CLKID_MST_B_MCLK_SEL	60
 #define AUD_CLKID_MST_C_MCLK_SEL	61
-- 
2.20.1

