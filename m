Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84128C48BD8
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 16:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C2EC204FD
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 16:48:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IxyUGn+U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbfFYQsi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 12:48:38 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45367 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731672AbfFYQrt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jun 2019 12:47:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id f9so18639340wre.12
        for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2019 09:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7eEjWytHo14d2wy5W+tNOY0jTfYkPmqHS9SlIMebT7c=;
        b=IxyUGn+UrZ+bnbjJipqX8Tqr/n5Yw6lxFKwRmp2JnOX2l2ltpJwYjzdfcGcgWUJN9F
         WNLe0y0I++0SHoHm8xeEyfqzAlOioa4k0z2moHs9hrOg6RwJ//dJQV1Ee2OGRe/3j5Hp
         62fpJ3/UXSAor4BUpfnIej1/cuQE+ztaAJxvjNBHIuh5iBR8yJTizPh0Zp9RoaX9la45
         AWR/0bwRoG2+sRvo9HyVfH2OPDFOOqIWZNy+o9PQBCWR1GehhyJndZbaLo/DZ5YJV0+1
         cfHb4PtMG78DUKmH0BG6bnNrDdfmVTQNqtRcghH86R5fGo6RpffmFD9aLff+DYw58R3E
         6JcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7eEjWytHo14d2wy5W+tNOY0jTfYkPmqHS9SlIMebT7c=;
        b=di1GL7twMYV8veOwfU2sShHfKqco/ABfk3cPBTq/waV1c4FQ0xHp9BS0j50YckhP5O
         WvMfv1h7W9dW4VgsvbyIajuI4JHgdE7Rjj8j+msO/cUmaYKpNlBHsumK2fefllT5cev4
         jSD6K+Ko7+11VEg49KtAj1ZiCGpJKgjbkOENvEoEZKkDD6LVtemxJOhUpud49iQ990Rv
         pZIYIDbAyQk+4abv4xWg8lrDnmbr0BjMnJQqhymY+M1o3VBpOb6sQJvya3urV0kliZA6
         Ttf5NsCUu+Jcn8+V/78zdLRqwrqISjj3eLzVpeHyLbnwaetUp6C/7QSfuNtmz5cR/EK6
         ccHQ==
X-Gm-Message-State: APjAAAWN2HAmcjPfIUWWbToXWOySDaGN6T6eVGUa2FX6XyDHCZdoF9pj
        +CyIYgH/5i1lDHEfgNazPapEEA==
X-Google-Smtp-Source: APXvYqy2Usw9GKw00Bg4lc9/CCqNSi0YvbljOkEbw/xyGvesb5SsyGkFWWx+viRnUehPAPaizW+rCg==
X-Received: by 2002:a5d:5189:: with SMTP id k9mr112089wrv.45.1561481267921;
        Tue, 25 Jun 2019 09:47:47 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:47 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        jassisinghbrar@gmail.com, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com,
        arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de,
        sibis@codeaurora.org, enric.balletbo@collabora.com,
        jagan@amarulasolutions.com, olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v3 06/14] clk: qcom: hfpll: get parent clock names from DT
Date:   Tue, 25 Jun 2019 18:47:25 +0200
Message-Id: <20190625164733.11091-7-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index a6de7101430c..87b7f46d27e0 100644
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
2.21.0

