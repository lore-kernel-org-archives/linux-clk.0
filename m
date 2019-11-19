Return-Path: <SRS0=V3Jc=ZL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6D8C432C0
	for <linux-clk@archiver.kernel.org>; Tue, 19 Nov 2019 19:28:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80F1B2245D
	for <linux-clk@archiver.kernel.org>; Tue, 19 Nov 2019 19:28:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7rxSF8S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbfKST25 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Nov 2019 14:28:57 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44123 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfKST25 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Nov 2019 14:28:57 -0500
Received: by mail-qt1-f195.google.com with SMTP id o11so25918182qtr.11
        for <linux-clk@vger.kernel.org>; Tue, 19 Nov 2019 11:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WtMAhnacD79siUcoDBQE9L9Ul5krG9aH/vO3sVrpb0s=;
        b=e7rxSF8SaHoYAhteN+iEMD+9/fLdn0wmfEnbC80J2pT/+YjM21AdqShT8RYi08thjg
         CGNU/RSdzgUd0pNZbIOPVJJUlRb2jjDRswFLnzoTGBbi0RwBz9QxS/939ajvi+h6tZ8+
         C2vVEaumA6Ol+wYHIWXeRjfGi38pD06qkQTHFNRAXurHIkydrLxXqdh4iifXSdu6qjOY
         xX6t9E6BAcyEWRuQrNG7QUzFTOy/ach9g6OKvdNfzgzg9zXQpUwMNpqEPTLAMPFM/vHE
         F8IkOp3uAvLv5PjxJrurmIo+Kr6xODUezSXMYdgX7UH9VfCDOWRiMa3IyYVLeZLhg1Af
         4o0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WtMAhnacD79siUcoDBQE9L9Ul5krG9aH/vO3sVrpb0s=;
        b=PVnvlLGdKeGFCmxI7oI1ESErP97ivdR9mgwXRNI42eAaM+B0r88Mej7MptMtlUoCX8
         ahd77+J7khrG/zA2ePqW89jGiUjUYH+1l7cH/gENw23B68wTBGrRycZFaM50+1yixpto
         ysWtpnYYEDsdmL9LWeiz9QfJRUR2Pg/P+TSi+NzGzB4G0gqicRHdgTwHFs0rJhZ9UVan
         ao5xN/zVv6a3U5MKQ6x96fYWniKj7EGzdaTbXFkNA2WWpwCONhGFz0OJt/0rzQmdEkGU
         /g+P4GhDUNMBJqag8sb2yuJ2VIfsTsZkjBGB6dD535S7jfQKs5uFhCcxgm1m+tZvn0Zn
         yIoA==
X-Gm-Message-State: APjAAAVKiICOvhRc8l7FGFznG7zMCp5AK9R9p4dsVjX6ykweXUpXRKMj
        aIkPTfL7WmJNlv2b7mdrzrg=
X-Google-Smtp-Source: APXvYqxyGyhsH/yJ+raEilDZBMrEepr/jV/yJdfJ4wlFTrFJ7mSzD1P0IgXz1rrf2M5x5Lh8O1vTiA==
X-Received: by 2002:ac8:13c9:: with SMTP id i9mr32295419qtj.95.1574191735858;
        Tue, 19 Nov 2019 11:28:55 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id l198sm10660821qke.70.2019.11.19.11.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 11:28:54 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     sboyd@kernel.org
Cc:     shawnguo@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
        linux-clk@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] clk: imx7ulp: Fix watchdog2 clock name typo
Date:   Tue, 19 Nov 2019 16:28:48 -0300
Message-Id: <20191119192848.27043-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is a typo in the watchdog2 clock name. 

Fix it by changing it to "wdg2".

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/clk/imx/clk-imx7ulp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx7ulp.c b/drivers/clk/imx/clk-imx7ulp.c
index 3fdf3d494f0a..3d9673cb1270 100644
--- a/drivers/clk/imx/clk-imx7ulp.c
+++ b/drivers/clk/imx/clk-imx7ulp.c
@@ -181,7 +181,7 @@ static void __init imx7ulp_clk_pcc2_init(struct device_node *np)
 	clks[IMX7ULP_CLK_USDHC0]	= imx7ulp_clk_composite("usdhc0",  periph_plat_sels, ARRAY_SIZE(periph_plat_sels), true, true,  true, base + 0xdc);
 	clks[IMX7ULP_CLK_USDHC1]	= imx7ulp_clk_composite("usdhc1",  periph_plat_sels, ARRAY_SIZE(periph_plat_sels), true, true,  true, base + 0xe0);
 	clks[IMX7ULP_CLK_WDG1]		= imx7ulp_clk_composite("wdg1",    periph_bus_sels, ARRAY_SIZE(periph_bus_sels), true, true,  true, base + 0xf4);
-	clks[IMX7ULP_CLK_WDG2]		= imx7ulp_clk_composite("sdg2",    periph_bus_sels, ARRAY_SIZE(periph_bus_sels), true, true,  true, base + 0x10c);
+	clks[IMX7ULP_CLK_WDG2]		= imx7ulp_clk_composite("wdg2",    periph_bus_sels, ARRAY_SIZE(periph_bus_sels), true, true,  true, base + 0x10c);
 
 	imx_check_clk_hws(clks, clk_data->num);
 
-- 
2.17.1

