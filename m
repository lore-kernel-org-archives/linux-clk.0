Return-Path: <SRS0=3VTX=3J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94DFC2D0DB
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jan 2020 13:43:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C811A2087E
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jan 2020 13:43:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgATNnP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jan 2020 08:43:15 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44793 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgATNnP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jan 2020 08:43:15 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so10096941ljj.11
        for <linux-clk@vger.kernel.org>; Mon, 20 Jan 2020 05:43:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nwutvSRr8XpFBMA7LDbRxN1JeFf/PyimQjlchz5hegw=;
        b=Rz1Hm93WndkaQri3UhdrhNkAFqQKh4vrCZEVtucCoptiT7r3dN9nMxOqiFjvKzdBHA
         o0somYk+453leAVyKUULgNTol9lt6i5SB3UKt2MnTfYGxu+vqKGX7a+MQKpKDMOCe3od
         BickKLg/92RK9XyfA6rvTC0vCXcuWPsJRiR9JZGIhp4/zvh6xh0jkR8/S6SXfiPcHkOk
         Y4sIQa/lEKW7mkvvNmy7hMsx5XpmHcDcL72Rz935JtNogAdzi41IT9bMtp7bGM4dtHc0
         ISl5CJ2MzmAd8AxCd8UqTGOZsthgHLz6B0WYGEtg9ZszurXQ/dWUTYRnSNwVZt9Nyzqn
         +PsQ==
X-Gm-Message-State: APjAAAVO2ZdfSK5SOjP5F3mfSDC94h3HALrCIcx0KTnbuvNHZ/5040Yt
        9UURZN2GlEKfugUQAvSBoCk=
X-Google-Smtp-Source: APXvYqy/RZaHjhJVs0g462sWqWTiu4BZH6g7puqz8KeKf8PyninheepTnNJNoHjf3BhxJ4VnebPPBA==
X-Received: by 2002:a2e:8119:: with SMTP id d25mr12712478ljg.76.1579527792996;
        Mon, 20 Jan 2020 05:43:12 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id m21sm16846429lfh.53.2020.01.20.05.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 05:43:12 -0800 (PST)
Date:   Mon, 20 Jan 2020 15:43:01 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org, linux-gpio@ger.kernel.org
Subject: [PATCH v13 04/11] mfd: bd718x7: Add compatible for BD71850
Message-ID: <bfd8c79edbd9c04ec6e9ef946e9d473e6bf55042.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

ROHM BD71850 PMIC is almost identical to BD71847. Main difference is some
initial voltage values for regulators. The BD71850 can be handled by
BD71847 driver but adding own compatible makes it clearer for one who
creates the DT for board containing this PMIC and allows SW to be
differentiating PMICs if needed.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/rohm-bd718x7.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index bb86ec829079..c32c1b6c98fa 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -213,6 +213,10 @@ static const struct of_device_id bd718xx_of_match[] = {
 		.compatible = "rohm,bd71847",
 		.data = (void *)ROHM_CHIP_TYPE_BD71847,
 	},
+	{
+		.compatible = "rohm,bd71850",
+		.data = (void *)ROHM_CHIP_TYPE_BD71847,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bd718xx_of_match);
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
