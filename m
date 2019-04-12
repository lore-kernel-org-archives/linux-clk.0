Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F91C10F14
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 16:18:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0012A21872
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 16:18:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NQ6qBLy1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbfDLQSX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 12:18:23 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:32936 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbfDLQSW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Apr 2019 12:18:22 -0400
Received: by mail-pl1-f194.google.com with SMTP id t16so5376074plo.0
        for <linux-clk@vger.kernel.org>; Fri, 12 Apr 2019 09:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/5ajLH9je0Ozanm9T4duBjRpNF3/9i3rLbzTI05QHzI=;
        b=NQ6qBLy15AX8pQRuq3XRelSIl9rbRSmVDJ2FYJVVAkruZeDiiGI5ccxCnUcTxc2LfV
         XSic3zNBYOE6AJon3Be6dPReBZ4Re+5Eb57BJ9NW4wKiSMPgwvJxSp2aGO7s6raGfYnr
         sBZ6b5gp8qMv35kJIoOaA7oMDf5kPHS1YlfYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/5ajLH9je0Ozanm9T4duBjRpNF3/9i3rLbzTI05QHzI=;
        b=pYdeQ0kYGjDTGyrZVK722o0MJqhWHn8lBqc/+fGQxDK55is8yhLA2zFaCpHnvqC15G
         fxcvRxfOJkIzrdFYK1OMMF3FGyHC8w7ldoX9PHRQJSPbIC9SSGkOO6JIYEPe5Mal5Zu8
         38KzVK1/9+B0QQA7dAtty1ibP23Rcq9xt9F/D3PEUXsj7xKaCG0f4LB96Nh93Q0vCdwE
         lZ36OAnCrREGiLo0yznmoE3cD3HJ2tULCnwHKob606LqcUNLpoZaEMm/Z6019usZdXbj
         9mOIOUK4mW4/AdWq07+UoK+qHjKCl13JGJT5HLOlK60FvEQnaLf+YeWNwWzbcKoPy/mR
         qrhg==
X-Gm-Message-State: APjAAAWwTAvriR71UwfZrv5T9gi+Zj8eUHho/lr8XOjCcQjWKNMGrVmx
        tCa3BnRdo2VEj47w2K+V6yJcZA==
X-Google-Smtp-Source: APXvYqw3Z+VjmHV9GsiPDxUsisWFYNsC3GBaCBSy6keJspQ6DO3jWTf7jQAh+UdDbzv8QTM1ucQz8Q==
X-Received: by 2002:a17:902:d705:: with SMTP id w5mr58628375ply.200.1555085901627;
        Fri, 12 Apr 2019 09:18:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 66sm84070136pfr.44.2019.04.12.09.18.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 09:18:21 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Heiko Stuebner <heiko@sntech.de>,
        Elaine Zhang <zhangqing@rock-chips.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Caesar Wang <caesar.wang@rock-chips.com>,
        linux-rockchip@lists.infradead.org, mka@chromium.org,
        ryandcase@chromium.org, linux-clk@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] clk: rockchip: undo several noc and special clocks as critical on rk3288
Date:   Fri, 12 Apr 2019 09:17:47 -0700
Message-Id: <20190412161747.107107-1-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is mostly a revert of commit 55bb6a633c33 ("clk: rockchip: mark
noc and some special clk as critical on rk3288") except that we're
keeping "pmu_hclk_otg0" as critical still.

NOTE: turning these clocks off doesn't seem to do a whole lot in terms
of power savings (checking the power on the logic rail).  It appears
to save maybe 1-2mW.  ...but still it seems like we should turn the
clocks off if they aren't needed.

About "pmu_hclk_otg0" (the one clock from the original commit we're
still keeping critical) from an email thread:

> pmu ahb clock
>
> Function: Clock to pmu module when hibernation and/or ADP is
> enabled. Must be greater than or equal to 30 MHz.
>
> If the SOC design does not support hibernation/ADP function, only have
> hclk_otg, this clk can be switched according to the usage of otg.
> If the SOC design support hibernation/ADP, has two clocks, hclk_otg and
> pmu_hclk_otg0.
> Hclk_otg belongs to the closed part of otg logic, which can be switched
> according to the use of otg.
>
> pmu_hclk_otg0 belongs to the always on part.
>
> As for whether pmu_hclk_otg0 can be turned off when otg is not in use,
> we have not tested. IC suggest make pmu_hclk_otg0 always on.

For the rest of the clocks:

atclk: No documentation about this clock other than that it goes to
the CPU.  CPU functions fine without it on.  Maybe needed for JTAG?

jtag: Presumably this clock is only needed if you're debugging with
JTAG.  It doesn't seem like it makes sense to waste power for every
rk3288 user.  In any case to do JTAG you'd need private patches to
adjust the pinctrl the mux the JTAG out anyway.

pclk_dbg, pclk_core_niu: On veyron Chromebooks we turn these two
clocks on only during kernel panics in order to access some coresight
registers.  Since nothing in the upstream kernel does this we should
be able to leave them off safely.  Maybe also needed for JTAG?

hsicphy12m_xin12m: There is no indication of why this clock would need
to be turned on for boards that don't use HSIC.

pclk_ddrupctl[0-1], pclk_publ0[0-1]: On veyron Chromebooks we turn
these 4 clocks on only when doing DDR transitions and they are off
otherwise.  I see no reason why they'd need to be on in the upstream
kernel which doesn't support DDRFreq.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Now keep pmu_hclk_otg0 as critical.
- Updated description since this isn't a clean revert.
- PWM patches have landed, so just one patch in the series now.

 drivers/clk/rockchip/clk-rk3288.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index f47d514cba36..13668ad59f2e 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -313,13 +313,13 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	COMPOSITE_NOMUX(0, "aclk_core_mp", "armclk", CLK_IGNORE_UNUSED,
 			RK3288_CLKSEL_CON(0), 4, 4, DFLAGS | CLK_DIVIDER_READ_ONLY,
 			RK3288_CLKGATE_CON(12), 6, GFLAGS),
-	COMPOSITE_NOMUX(0, "atclk", "armclk", CLK_IGNORE_UNUSED,
+	COMPOSITE_NOMUX(0, "atclk", "armclk", 0,
 			RK3288_CLKSEL_CON(37), 4, 5, DFLAGS | CLK_DIVIDER_READ_ONLY,
 			RK3288_CLKGATE_CON(12), 7, GFLAGS),
 	COMPOSITE_NOMUX(0, "pclk_dbg_pre", "armclk", CLK_IGNORE_UNUSED,
 			RK3288_CLKSEL_CON(37), 9, 5, DFLAGS | CLK_DIVIDER_READ_ONLY,
 			RK3288_CLKGATE_CON(12), 8, GFLAGS),
-	GATE(0, "pclk_dbg", "pclk_dbg_pre", CLK_IGNORE_UNUSED,
+	GATE(0, "pclk_dbg", "pclk_dbg_pre", 0,
 			RK3288_CLKGATE_CON(12), 9, GFLAGS),
 	GATE(0, "cs_dbg", "pclk_dbg_pre", CLK_IGNORE_UNUSED,
 			RK3288_CLKGATE_CON(12), 10, GFLAGS),
@@ -647,7 +647,7 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	INVERTER(SCLK_HSADC, "sclk_hsadc", "sclk_hsadc_out",
 			RK3288_CLKSEL_CON(22), 7, IFLAGS),
 
-	GATE(0, "jtag", "ext_jtag", CLK_IGNORE_UNUSED,
+	GATE(0, "jtag", "ext_jtag", 0,
 			RK3288_CLKGATE_CON(4), 14, GFLAGS),
 
 	COMPOSITE_NODIV(SCLK_USBPHY480M_SRC, "usbphy480m_src", mux_usbphy480m_p, 0,
@@ -656,7 +656,7 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	COMPOSITE_NODIV(SCLK_HSICPHY480M, "sclk_hsicphy480m", mux_hsicphy480m_p, 0,
 			RK3288_CLKSEL_CON(29), 0, 2, MFLAGS,
 			RK3288_CLKGATE_CON(3), 6, GFLAGS),
-	GATE(0, "hsicphy12m_xin12m", "xin12m", CLK_IGNORE_UNUSED,
+	GATE(0, "hsicphy12m_xin12m", "xin12m", 0,
 			RK3288_CLKGATE_CON(13), 9, GFLAGS),
 	DIV(0, "hsicphy12m_usbphy", "sclk_hsicphy480m", 0,
 			RK3288_CLKSEL_CON(11), 8, 6, DFLAGS),
@@ -837,11 +837,6 @@ static const char *const rk3288_critical_clocks[] __initconst = {
 	"pclk_alive_niu",
 	"pclk_pd_pmu",
 	"pclk_pmu_niu",
-	"pclk_core_niu",
-	"pclk_ddrupctl0",
-	"pclk_publ0",
-	"pclk_ddrupctl1",
-	"pclk_publ1",
 	"pmu_hclk_otg0",
 	/* pwm-regulators on some boards, so handoff-critical later */
 	"pclk_rkpwm",
-- 
2.21.0.392.gf8f6787159e-goog

