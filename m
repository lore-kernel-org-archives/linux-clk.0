Return-Path: <SRS0=srpp=UF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3D2C04AB5
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 16:45:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73379206BB
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 16:45:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2F5WTYl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbfFFQpE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jun 2019 12:45:04 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:43310 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfFFQpD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jun 2019 12:45:03 -0400
Received: by mail-qt1-f194.google.com with SMTP id z24so3398445qtj.10
        for <linux-clk@vger.kernel.org>; Thu, 06 Jun 2019 09:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=U+er66nDJidQ6nB58sEzOJg4BlXk/c0Ijq6UBsIMJXo=;
        b=m2F5WTYlWialE81j6D3Qz0KT8Jit3JmkXEp4BqfMfgBJabs0NMut76/ktVkaGIE2i1
         emKGUhvIyW/SVhUGXgV0s35bkZqSE14FAvch5FtEx7O0Gm7DibMf4xs1wUyh5cK7Fyhh
         Pp4f8IvGxFJ5epz9nGbyZl8aejagrAS/dD50EoPC2augNwkHOISAHfDCfbp8f6q/avpi
         RXxxf4zY1BLw2n/VfwrZuZ3RoIwMm1I3KuLnIA68ulkwllaz8BfDcye7AemqGWzU15iv
         WaZF4NxvyPulX+EG0iyHvrrH0hoKYju9+5y8aLYSVFTNewr7S8/kAqXesUzhTqdJ28np
         +/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=U+er66nDJidQ6nB58sEzOJg4BlXk/c0Ijq6UBsIMJXo=;
        b=Z64wReNHTBM8v8CFHBerGTT/YGUV8y2m+svEEpLy94G+LQ2gfQy+TWJxHgi5A4CF1x
         W4crmae+11CszjC9Hf/yijksjXet8o/k7tZELR4CsEzLnWNOf53EnD4AaVEVejtoKQpQ
         /Of/O+hCix2XVFfK6GHQIk5Q4Pr57X0VzzMLvtI4sNX+SNo/gIEH2lQR9MrECyLHzUjs
         s6I6t1XHVQdwIlqXCd9rHB5XjZtlpdkmuVMF3UNAHWYKUbZYkiZb7L+LWkOPa8DBu4GX
         C9/ZC5T5q2hwp8/yDI3bGqaj9ZqeUrxJYXU7tp8GMaL4Gik79tFQiRohiUAqDyyVsSkJ
         907g==
X-Gm-Message-State: APjAAAXcBtNu0hmvSk12RbmxFHRcFe69sfuw3UJkhJr/1vckDsiZESQd
        YHiozMwBg5GQwMtygW1hlZM=
X-Google-Smtp-Source: APXvYqzOnnoPWUYbQqkAxkW7m4Pc7gtv8y8PTip+tOvyvaM04rClF/axwk3VETImmzrr6i73nyiezA==
X-Received: by 2002:a0c:d0b6:: with SMTP id z51mr26723234qvg.3.1559839502661;
        Thu, 06 Jun 2019 09:45:02 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id y19sm1402144qty.43.2019.06.06.09.44.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 09:45:01 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     sboyd@kernel.org
Cc:     shawnguo@kernel.org, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] clk: imx8qxp: Use devm_platform_ioremap_resource()
Date:   Thu,  6 Jun 2019 13:44:43 -0300
Message-Id: <20190606164443.6991-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit. 

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index fb6edf1b8aa2..716af92242d2 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -159,7 +159,6 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data;
 	const struct imx8qxp_ss_lpcg *ss_lpcg;
 	const struct imx8qxp_lpcg_data *lpcg;
-	struct resource *res;
 	struct clk_hw **clks;
 	void __iomem *base;
 	int i;
@@ -168,12 +167,9 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
 	if (!ss_lpcg)
 		return -ENODEV;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!base)
-		return -ENOMEM;
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hws,
 				ss_lpcg->num_max), GFP_KERNEL);
-- 
2.17.1

