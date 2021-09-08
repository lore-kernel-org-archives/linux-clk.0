Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D641C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  8 Sep 2021 18:14:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27A5A6115B
	for <linux-clk@archiver.kernel.org>; Wed,  8 Sep 2021 18:14:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349618AbhIHSPK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Sep 2021 14:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349202AbhIHSPK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Sep 2021 14:15:10 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC82C061575
        for <linux-clk@vger.kernel.org>; Wed,  8 Sep 2021 11:14:02 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id f129so3511286pgc.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Sep 2021 11:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YmaBqKj8o4HmKcMeIl0Rd4QT1PMQFox+evWowfdT4pM=;
        b=LhDZLw+XEOIsX47v4NpnWSsriew4EbKSYY+nTXSZ9TmzNi61j7u4637SNRUlYjyoO8
         4R4YpmU0eL3um0lTV+i052dCvVbo4xV0OYKht0oajmhCceVIlOxvjPyxbVM/YbGWSWBS
         ZIRkmc+hJiyaUDFaiaiH2UcD7B2bPGrHAFmv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YmaBqKj8o4HmKcMeIl0Rd4QT1PMQFox+evWowfdT4pM=;
        b=gbZlqx4FuNH16yEreobL3QGYa+JdYYXstszeVlXirMS9fUk/5kVdC15tSkBZQUleu8
         1BPl5fAbOezIRqEzM8I2EJkrsp3lt6Z4wbDQXdcZgz8WMqBqM9QiiU0wHL64CWwhXosc
         ro0IiyR0lxGD8wPZc9BWayI/KdZ1u+TpxnkG5jL/JwYC4VF2iPYhukpx9+9v22yAr2Tz
         1v+wHQwGOL+l1Abq82wM6+07BCL0lIAL207ivYTJ2uYeSfWWgRLejsdUAuLG1/GyAmL+
         2ajlBOhwf7eYmvmvBYit99b50zRVYeVPwNxtC/VGjwYyk2DtNg5fJE/2utuwwL5B67NT
         v+sg==
X-Gm-Message-State: AOAM531T7ev3Y5GomGFblye0BfORbwps64ycGIkW4bM/Lnuj85dEKQKw
        KfnsIJlL61PMv2bTFfcVJ0smMg==
X-Google-Smtp-Source: ABdhPJz7vRfq/pAFYK+fNsy+aJ/Sx1OQI+A2rftCimRi2r9//7V/EaLJIn03rX6MPvX0ZYsKroiejA==
X-Received: by 2002:a63:ef58:: with SMTP id c24mr4826337pgk.299.1631124841813;
        Wed, 08 Sep 2021 11:14:01 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7556:e88d:6fba:e1d0])
        by smtp.gmail.com with UTF8SMTPSA id e19sm2982086pfi.139.2021.09.08.11.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 11:14:01 -0700 (PDT)
From:   Brian Norris <briannorris@chromium.org>
To:     Heiko Stuebner <heiko@sntech.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wenst@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org,
        Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 2/3] clk: rockchip: rk3399: expose PCLK_COREDBG_{B,L}
Date:   Wed,  8 Sep 2021 11:13:39 -0700
Message-Id: <20210908111337.v2.2.If29cd838efbcee4450a62b8d84a99b23c86e0a3f@changeid>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210908111337.v2.1.I006bb36063555079b1a88f01d20e38d7e4705ae0@changeid>
References: <20210908111337.v2.1.I006bb36063555079b1a88f01d20e38d7e4705ae0@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We have DT IDs for PCLK_COREDBG_L and PCLK_COREDBG_B, but we don't
actually expose them.

Note that this requires the previous patch (making "armclkl" and
"armclkb" into "critical" clocks) to prevent these clocks from taking
down the CPU.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
  - Split "CPU clocks are critical" to a new patch, to make it more
    obvious

 drivers/clk/rockchip/clk-rk3399.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 0ac9c72c4ee8..53ed5cca335b 100644
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
-- 
2.33.0.153.gba50c8fa24-goog

