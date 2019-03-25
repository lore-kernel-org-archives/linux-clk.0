Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92156C43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 641EE20863
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HLJdfe4u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730915AbfCYLMO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 07:12:14 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42725 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730739AbfCYLMO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 07:12:14 -0400
Received: by mail-wr1-f68.google.com with SMTP id g3so6120303wrx.9
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2019 04:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fKq0Xmw2ntAqrTVNaEz/XqYkib9vFynLezQDvMrUHDU=;
        b=HLJdfe4usokrPovRQReXb3u4/AX4uD/nG1dOjRXM6qMGCuiE5XhVyoMWmgp32yaGTl
         kEu0Zh5L1k0o/ERmTU8U4rscsJj0nWj/V8kyY7/Bt8NiBAJZwpypz4lHJDmu7veLelcC
         XFrn4pOXj2r+UCdQ63gUljC2h3SYDRx4RIzmUHYMAwr3oppJcj7pTt1Ikg+9OVQvPZ5j
         12nBK8Y+Lk+jVhREudTFRTbR0LmKuV/FaWQ3jzZNNIOI9e1jYSt9Fp6qhik5niLFfWxP
         RI2/3IbJD+kOC/TGr6o3PqhrD8VcUs1GmsRyOeyJov2zDMq9j2mjxDABZe8u2bfXWS7z
         OpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fKq0Xmw2ntAqrTVNaEz/XqYkib9vFynLezQDvMrUHDU=;
        b=UFmrQG/5sQjsAdF2OCR1VyhfA0cnPQrxPkwJeIb4GLhSzlTZtfrz+dHWYPL4lMkaEg
         CWisfnKGmqNDW8B3Uq4Rkp171kjTfx+ZFEUIVbJy0v+nRnwDfHJZu85XsKj91hboMWfA
         Ze/TC6Ut1B2DR0s6KSj5t8vIWrGySRzrJseIrUhnQ4q0U90QWu/VT0BzBruFCfQPwZbM
         /pWvme5Zk2Xc9Zg+zUtY8UbZWSz+wmsdLdU9R0yCY6/Jbj6ja3fkDjkcWKWOlpz+Q1FU
         O+MNLh7am43iwgVcG1VvmQPZNESw2KS+k21SZBk8K4mzUYotLkZYRNq2fcOVfdLShMqY
         c5zA==
X-Gm-Message-State: APjAAAUFmlS3n3WbYpdUNT4bXbmL+XI+sFMdMaxotT6UeKwrnKtlSir8
        Mnrx8v7K9rOpaA3abhU9LByDCA==
X-Google-Smtp-Source: APXvYqzuscNSf995R6bIjyFx5XSYb8F+ngHC5dvyb/ItWnCgkc4V1XJlyCosXz1frjAulr1d0+N0lg==
X-Received: by 2002:adf:dcca:: with SMTP id x10mr15173526wrm.57.1553512332252;
        Mon, 25 Mar 2019 04:12:12 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id n188sm15134301wme.13.2019.03.25.04.12.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2019 04:12:11 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] clk: meson: eeclk: add init regs
Date:   Mon, 25 Mar 2019 12:11:59 +0100
Message-Id: <20190325111200.15940-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190325111200.15940-1-jbrunet@baylibre.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Like the PLL and MPLL, the controller may require some magic setting to
be applied on startup.

This is needed when the initial setting is not applied by the boot ROM.
The controller need to do it when the setting applies to several clock,
like all the MPLLs in the case of g12a.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson-eeclk.c | 3 +++
 drivers/clk/meson/meson-eeclk.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
index 37a34c9c3885..6ba2094be257 100644
--- a/drivers/clk/meson/meson-eeclk.c
+++ b/drivers/clk/meson/meson-eeclk.c
@@ -34,6 +34,9 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 		return PTR_ERR(map);
 	}
 
+	if (data->init_count)
+		regmap_multi_reg_write(map, data->init_regs, data->init_count);
+
 	input = meson_clk_hw_register_input(dev, "xtal", IN_PREFIX "xtal", 0);
 	if (IS_ERR(input)) {
 		ret = PTR_ERR(input);
diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
index 1b809b1419fe..9ab5d6fa7ccb 100644
--- a/drivers/clk/meson/meson-eeclk.h
+++ b/drivers/clk/meson/meson-eeclk.h
@@ -17,6 +17,8 @@ struct platform_device;
 struct meson_eeclkc_data {
 	struct clk_regmap *const	*regmap_clks;
 	unsigned int			regmap_clk_num;
+	const struct reg_sequence	*init_regs;
+	unsigned int			init_count;
 	struct clk_hw_onecell_data	*hw_onecell_data;
 };
 
-- 
2.20.1

