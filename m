Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D65C282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:34:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4D1120881
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:34:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="KhRO5+cs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbfA1Sd3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 13:33:29 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34349 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfA1Sd2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 13:33:28 -0500
Received: by mail-wm1-f67.google.com with SMTP id y185so11107924wmd.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Jan 2019 10:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CrsB9vDQWUxmYDFtafFb8lMIaGmRCz/1Apw6ozfisK4=;
        b=KhRO5+csN6b8B+mnXc+NAwS26Oh+divVSo7QhSO3rViTZsfX0dTqWyofGc7paL1I+9
         YmjqT4gyn4WWHjSJ2KHFD9EVU19issse0zOzuDZq+GpG8ewfA9hfWkLO/h4AOXwezu78
         f/9cKm4qgduRmD5A5un53ljNDnpsg2bd+AxT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CrsB9vDQWUxmYDFtafFb8lMIaGmRCz/1Apw6ozfisK4=;
        b=UJLESyMqGjPKcHPSA1gtjnrrmnAETV2B8jzUL5tig7J9rdbuAyN8EWG1wkmWCU6b0R
         fShpn8JniUMl+pyRAGhsKTOc4erqoPmaQjXJyEKVUlSRNJC8VQ5ssXMZ+RDsLuVsboqn
         8LM+AnyqSjEfToKsaBs71MpEQKtL5tH4AirKd4pvG7Mu1blJy+kofcFku0cK0YLzpkgS
         Emm3QCHrtLEsMNP8KwauGumbI9ajCcwvSQtiNeXJUpot35TMBskfbmzuCNAK92mVBgal
         B9jWLtp0dtiHkKp5d93ObqYkm15F3idFeLjkExhEtUK41CYy1r9yH4Wy8Fx8d+y46yKL
         SxYg==
X-Gm-Message-State: AJcUukdxypRhPEzmUPtfFomok0abqdz2GKIos0Q6ESnJsSUif+o06CRH
        6fEiokRJbOeLU9kQK4t/CZ4Lvg==
X-Google-Smtp-Source: ALg8bN5e+//cVztkL1BiaB2dZA1ZoazVcMiftOg308Qtn/CxK5rzHIza9kn/nUZIMqAIDiibN6IchQ==
X-Received: by 2002:a1c:5dd1:: with SMTP id r200mr18719376wmb.93.1548700407005;
        Mon, 28 Jan 2019 10:33:27 -0800 (PST)
Received: from localhost.localdomain (233.red-81-47-145.staticip.rima-tde.net. [81.47.145.233])
        by smtp.gmail.com with ESMTPSA id l19sm270082wme.21.2019.01.28.10.33.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 10:33:26 -0800 (PST)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v2 06/14] clk: qcom: hfpll: get parent clock names from DT
Date:   Mon, 28 Jan 2019 19:32:53 +0100
Message-Id: <1548700381-22376-7-git-send-email-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Allow accessing the parent clock name required for the driver
operation using the device tree node.

This permits extending the driver to other platforms without having to
modify its source code.

For backwards compatibility leave the previous value as default.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/clk/qcom/hfpll.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
index a6de7101..87b7f46 100644
--- a/drivers/clk/qcom/hfpll.c
+++ b/drivers/clk/qcom/hfpll.c
@@ -52,6 +52,7 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 	void __iomem *base;
 	struct regmap *regmap;
 	struct clk_hfpll *h;
+	struct clk *pclk;
 	struct clk_init_data init = {
 		.parent_names = (const char *[]){ "xo" },
 		.num_parents = 1,
@@ -75,6 +76,13 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 					  0, &init.name))
 		return -ENODEV;
 
+	/* get parent clock from device tree (optional) */
+	pclk = devm_clk_get(dev, "xo");
+	if (!IS_ERR(pclk))
+		init.parent_names = (const char *[]){ __clk_get_name(pclk) };
+	else if (PTR_ERR(pclk) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
 	h->d = &hdata;
 	h->clkr.hw.init = &init;
 	spin_lock_init(&h->lock);
-- 
2.7.4

