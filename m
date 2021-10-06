Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0595EC433F5
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 19:00:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB88E61130
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 19:00:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhJFTCW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Oct 2021 15:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhJFTCW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 15:02:22 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF21C061746
        for <linux-clk@vger.kernel.org>; Wed,  6 Oct 2021 12:00:29 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id z3so2587438qvl.9
        for <linux-clk@vger.kernel.org>; Wed, 06 Oct 2021 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=glP7rgcIAL6wqIbM3vIVPAiMynzzX5NProMBYSjchkM=;
        b=pJobD4u3VK05crFTlP7vi7YmurAORV7USxcEo+h0/XhkAlM4xmcO1VzSfbj+jtjR5P
         KEDceoA6rNpx/Lq2PM6/ugrD8YC63CL/mANjcfL7Kd1WV1ltWg7sNZ0m+Lgi/5JIAQc4
         LqCgkbcDbkApWBKsKmKbPYq2Kew7gc2VLqUO9McFCvDcirl7zFcgAHGp5fc2NDsB4uWY
         FsUTyyp5Gdqkkvh0u3flmOcvA15axN604XlPrXee0vpzeoxgHgfOmazUgKbgtKouLaeQ
         j0PyuWrSXFh4ujSUuBWLyk78PbO1PoGlmNpKH6j2Nb6TkjWOgksgd2kGLHSNBwlOk8pS
         DKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=glP7rgcIAL6wqIbM3vIVPAiMynzzX5NProMBYSjchkM=;
        b=Evwtq3wwi4WNP5zbmUo2BOL3r2oUmSK1r0ARvWzQqO8rp2QfKdYzh7A3HQif1w6i+X
         m1xq4WXJi3+WDF/TudbOZGlTzWj413JCk2y0xAcwEq6gRTu1vsetF8xFs/C2gOKbmbJ5
         0y6tTmlVRj3H9TGJUN6EKEivKRKnKZNSOI+TZ1PYr3jm+OkIrYdGtljAJj8yC91jhH0l
         OdIfg0yjxLJXppBOq5Z4+nxxHRw0rxAG3Z7ycT6LzNYxxLHgyQPHPC3IVwtGt0OMg2GV
         C/5IRuTO6yLYKxj0VU7cqV2pgBzq56panb+WLs7+ICeRWikq/HzW27ONzHQlbmkuO0af
         pfLg==
X-Gm-Message-State: AOAM530y1+ylyGt5ZB8azvv9tQBaRk99F2XNVu8n2cwGQ4/+3YDzWJqv
        sYsjc+g3sz5vAlSmrx6/GU4=
X-Google-Smtp-Source: ABdhPJzNBkWXrufssWiNyPnL7KvmlWU2XeDuE0OKdCrbSS7zrZSKdt4n2teznlO3mgknCR0ZRBan8g==
X-Received: by 2002:a0c:9d4d:: with SMTP id n13mr35719172qvf.40.1633546829004;
        Wed, 06 Oct 2021 12:00:29 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:64e6:6f46:5646:4c28])
        by smtp.gmail.com with ESMTPSA id l6sm3502383qkj.18.2021.10.06.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:00:28 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     abel.vesa@nxp.com
Cc:     shawnguo@kernel.org, rdunlap@infradead.org, ping.bai@nxp.com,
        linux-clk@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] clk: imx: Make CLK_IMX8ULP select MXC_CLK
Date:   Wed,  6 Oct 2021 16:00:08 -0300
Message-Id: <20211006190008.1935051-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Building CLK_IMX8ULP without selecting MXC_CLK causes the following
build errors:

ld: drivers/clk/imx/clk-imx8ulp.o: in function `imx8ulp_clk_cgc2_init':
clk-imx8ulp.c:(.text+0xd0): undefined reference to `imx_ccm_lock'
ld: clk-imx8ulp.c:(.text+0x14f): undefined reference to `imx_clk_hw_pllv4'
ld: clk-imx8ulp.c:(.text+0x15a): undefined reference to `imx_ccm_lock'

Avoid this problem by making CLK_IMX8ULP select MXC_CLK.

Fixes: c43a801a5789 ("clk: imx: Add clock driver for imx8ulp")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/clk/imx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index b81d6437ed95..c08edbd04d22 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -102,5 +102,6 @@ config CLK_IMX8QXP
 config CLK_IMX8ULP
 	tristate "IMX8ULP CCM Clock Driver"
 	depends on ARCH_MXC || COMPILE_TEST
+	select MXC_CLK
 	help
 	    Build the driver for i.MX8ULP CCM Clock Driver
-- 
2.25.1

