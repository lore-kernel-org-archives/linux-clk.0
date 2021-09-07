Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A56C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  7 Sep 2021 16:46:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5561F610A3
	for <linux-clk@archiver.kernel.org>; Tue,  7 Sep 2021 16:46:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344832AbhIGQrx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Sep 2021 12:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344621AbhIGQrx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Sep 2021 12:47:53 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AEAFC061575
        for <linux-clk@vger.kernel.org>; Tue,  7 Sep 2021 09:46:47 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id c6so6734689pjv.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Sep 2021 09:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PP2ABdQKAw7a9Vz1k0Jj0CJwbnVZivj1PUS2EvlCvgY=;
        b=hj4juZ9Y4gulEIE2+5Tmdsl6/hSiw0jMQoKY7j1HVLnpkYg71iUsOJla9YDf7Cduh6
         DstWDWhTwVDrLlaFof+hUrerVjCSRceKfROWvlsfhHcPO1UDRsT9spbCjq6n4swgS1/d
         ptsgPpu1R+lqqxAOjUw7fxNTE0UlEy2kf/ihI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PP2ABdQKAw7a9Vz1k0Jj0CJwbnVZivj1PUS2EvlCvgY=;
        b=HlU7t7exB6W+RSxDI2YqIuLSiDwQW1I3Z7+55eyoxi303kOHIzL/fHNZFKET+eAMbI
         lJ68ko7RyzwV5N74iz0Fjo/e6IRojDNXf5mzJNS9kyD91cPZBflmDpCuyK5g/jVmojTG
         LX2sjxvQ6AEHqazoaOpURx0ybR1qOLbajCKuqCJMKY72HaDx6ZmtrF7otRsq8rPvc4cO
         7hrY1lNPk7VqoEI4tZdbYYMw2RNz/bmpcgSTswZSVQPyjlCtfDmeSW2Fl6CgiwC3OmNu
         1iaiArcm5gmCpisIJMKFPRAyKIDCZHeM2325eJdlzj4vlGJff6nsT10HVVJLVL1CuwwK
         gxNg==
X-Gm-Message-State: AOAM533KFzvZUycJBRD0RWpMKwP02F0XfsDnF/fdcLG7Pj8CTuS9gEGd
        z6VuXl0L4bM+BR/NnU5MOInmXg==
X-Google-Smtp-Source: ABdhPJxvuFfk9GSy2PRDzf3a1XQiZDc7Rc4bkdjCm1pJK0CbBHydSsXo2x55MjkidEHQT3e+aSkaoQ==
X-Received: by 2002:a17:90a:450d:: with SMTP id u13mr5539107pjg.138.1631033206634;
        Tue, 07 Sep 2021 09:46:46 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7662:6d8e:510:db67])
        by smtp.gmail.com with UTF8SMTPSA id l11sm3118441pjg.22.2021.09.07.09.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 09:46:45 -0700 (PDT)
From:   Brian Norris <briannorris@chromium.org>
To:     Heiko Stuebner <heiko@sntech.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Brian Norris <briannorris@chromium.org>
Subject: [RESEND PATCH 1/2] clk: rockchip: rk3399: expose PCLK_COREDBG_{B,L}
Date:   Tue,  7 Sep 2021 09:46:36 -0700
Message-Id: <20210907094628.RESEND.1.If29cd838efbcee4450a62b8d84a99b23c86e0a3f@changeid>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We have DT IDs for PCLK_COREDBG_L and PCLK_COREDBG_B, but we don't
actually expose them.

In exposing these clocks (and attaching them to the coresight debug
driver), the AMBA bus may start to disable them. Because no CPU driver
owns these clocks (e.g., cpufreq-dt doesn't enable() them -- and even if
it did, it's not early enough -- nor does arch/arm64/kernel/smp.c), the
common clock framework then feels the need to disable the parents
(including the CPU PLLs) -- which is no fun for anyone.

Thus, mark the CPU clocks as critical as well.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Resending, because I missed the mailing lists on the first version.

 drivers/clk/rockchip/clk-rk3399.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 62a4f2543960..53ed5cca335b 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -481,7 +481,7 @@ static struct rockchip_clk_branch rk3399_clk_branches[] __initdata = {
 	COMPOSITE_NOMUX(0, "atclk_core_l", "armclkl", CLK_IGNORE_UNUSED,
 			RK3399_CLKSEL_CON(1), 0, 5, DFLAGS | CLK_DIVIDER_READ_ONLY,
 			RK3399_CLKGATE_CON(0), 5, GFLAGS),
-	COMPOSITE_NOMUX(0, "pclk_dbg_core_l", "armclkl", CLK_IGNORE_UNUSED,
+	COMPOSITE_NOMUX(PCLK_COREDBG_L, "pclk_dbg_core_l", "armclkl", CLK_IGNORE_UNUSED,
 			RK3399_CLKSEL_CON(1), 8, 5, DFLAGS | CLK_DIVIDER_READ_ONLY,
 			RK3399_CLKGATE_CON(0), 6, GFLAGS),
 
@@ -531,7 +531,7 @@ static struct rockchip_clk_branch rk3399_clk_branches[] __initdata = {
 	GATE(ACLK_GIC_ADB400_CORE_B_2_GIC, "aclk_core_adb400_core_b_2_gic", "armclkb", CLK_IGNORE_UNUSED,
 			RK3399_CLKGATE_CON(14), 4, GFLAGS),
 
-	DIV(0, "pclken_dbg_core_b", "pclk_dbg_core_b", CLK_IGNORE_UNUSED,
+	DIV(PCLK_COREDBG_B, "pclken_dbg_core_b", "pclk_dbg_core_b", CLK_IGNORE_UNUSED,
 			RK3399_CLKSEL_CON(3), 13, 2, DFLAGS | CLK_DIVIDER_READ_ONLY),
 
 	GATE(0, "pclk_dbg_cxcs_pd_core_b", "pclk_dbg_core_b", CLK_IGNORE_UNUSED,
@@ -1514,7 +1514,10 @@ static const char *const rk3399_cru_critical_clocks[] __initconst = {
 	"aclk_vio_noc",
 
 	/* ddrc */
-	"sclk_ddrc"
+	"sclk_ddrc",
+
+	"armclkl",
+	"armclkb",
 };
 
 static const char *const rk3399_pmucru_critical_clocks[] __initconst = {
@@ -1549,9 +1552,6 @@ static void __init rk3399_clk_init(struct device_node *np)
 	rockchip_clk_register_branches(ctx, rk3399_clk_branches,
 				  ARRAY_SIZE(rk3399_clk_branches));
 
-	rockchip_clk_protect_critical(rk3399_cru_critical_clocks,
-				      ARRAY_SIZE(rk3399_cru_critical_clocks));
-
 	rockchip_clk_register_armclk(ctx, ARMCLKL, "armclkl",
 			mux_armclkl_p, ARRAY_SIZE(mux_armclkl_p),
 			&rk3399_cpuclkl_data, rk3399_cpuclkl_rates,
@@ -1562,6 +1562,9 @@ static void __init rk3399_clk_init(struct device_node *np)
 			&rk3399_cpuclkb_data, rk3399_cpuclkb_rates,
 			ARRAY_SIZE(rk3399_cpuclkb_rates));
 
+	rockchip_clk_protect_critical(rk3399_cru_critical_clocks,
+				      ARRAY_SIZE(rk3399_cru_critical_clocks));
+
 	rockchip_register_softrst(np, 21, reg_base + RK3399_SOFTRST_CON(0),
 				  ROCKCHIP_SOFTRST_HIWORD_MASK);
 
-- 
2.33.0.153.gba50c8fa24-goog

