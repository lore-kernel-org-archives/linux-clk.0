Return-Path: <SRS0=v31j=TH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD21C004C9
	for <linux-clk@archiver.kernel.org>; Tue,  7 May 2019 20:50:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFD2920656
	for <linux-clk@archiver.kernel.org>; Tue,  7 May 2019 20:50:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GtBJBi17"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfEGUt6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 May 2019 16:49:58 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46692 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727256AbfEGUt6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 May 2019 16:49:58 -0400
Received: by mail-pf1-f193.google.com with SMTP id j11so9243878pff.13
        for <linux-clk@vger.kernel.org>; Tue, 07 May 2019 13:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=16ni+8UEniYJYlMiaLm9MTZL5f4uI05QVZvXY8kGkyE=;
        b=GtBJBi17Nvcq1G7rVZ9uJaeHxN4bn4kXoaDa6iTX8XSeUFAicrKXpkEgXGf3y81kvf
         5mT8XP9qGfozJM+DJlH2PiPHjL8scDu/V6aO++md4LgoYQ6eaGaD41a2YFFVxDS16Hzj
         AfaZDXtfrRnyP36FduMmBoEotVSb6OqRnajcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=16ni+8UEniYJYlMiaLm9MTZL5f4uI05QVZvXY8kGkyE=;
        b=BDhKk/Tb61Xpczb+seg6i1g8TclmJcrBmcg5N3f1q6viugruMZvKzlGqjIJkyOmtIz
         xruPAumoCrwRAkn7JA8fuKPHmCwgEnJkIj4aCc8LVBRMgtiNrAQy4+FcZs3gAKD6NIbV
         pCaZ3l9ZlY9t47uiy8kDIsOYRUCSJHa8673jPQ8kr1+wxP9ZN0EKfEQBwr/n37BU5C+j
         pV+9KYhWMjwNqcaipmPo9NYXRnUnCmsJUBLlSuD79EIs2545PoneSyG+26jKgcUstwRg
         R1G6Z1SldIQq/n+NDoCtlwXrQ8AK37vLcnmdBxQO/aGkSID7Wak1eKRma4tBiM3AuAak
         0GDg==
X-Gm-Message-State: APjAAAXxWvV0LOB9672nutKiTZJHReAidIVXmULS5MRdSGACUyN6QysY
        ZXnQXKaJf2RdiOgKEfq1cBxOFg==
X-Google-Smtp-Source: APXvYqzq46xNr1WmdaRR59uTuZVU09D1ZwcWwdDjivzpxshj1SH+qs20Hl2kkBUMpFYjGgNqsTbWWA==
X-Received: by 2002:a63:9d8d:: with SMTP id i135mr25594688pgd.245.1557262197357;
        Tue, 07 May 2019 13:49:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id x19sm8312796pga.4.2019.05.07.13.49.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 13:49:56 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc:     Shawn Lin <shawn.lin@rock-chips.com>, hal@halemmerich.com,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: rockchip: Use clk_hw_get_rate() in MMC phase calculation
Date:   Tue,  7 May 2019 13:49:35 -0700
Message-Id: <20190507204935.256982-1-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When calculating the MMC phase we can just use clk_hw_get_rate()
instead of clk_get_rate().  This avoids recalculating the rate.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/clk/rockchip/clk-mmc-phase.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchip/clk-mmc-phase.c
index 026a26bb702d..07526f64dbfd 100644
--- a/drivers/clk/rockchip/clk-mmc-phase.c
+++ b/drivers/clk/rockchip/clk-mmc-phase.c
@@ -55,7 +55,7 @@ static unsigned long rockchip_mmc_recalc(struct clk_hw *hw,
 static int rockchip_mmc_get_phase(struct clk_hw *hw)
 {
 	struct rockchip_mmc_clock *mmc_clock = to_mmc_clock(hw);
-	unsigned long rate = clk_get_rate(hw->clk);
+	unsigned long rate = clk_hw_get_rate(hw);
 	u32 raw_value;
 	u16 degrees;
 	u32 delay_num = 0;
@@ -86,7 +86,7 @@ static int rockchip_mmc_get_phase(struct clk_hw *hw)
 static int rockchip_mmc_set_phase(struct clk_hw *hw, int degrees)
 {
 	struct rockchip_mmc_clock *mmc_clock = to_mmc_clock(hw);
-	unsigned long rate = clk_get_rate(hw->clk);
+	unsigned long rate = clk_hw_get_rate(hw);
 	u8 nineties, remainder;
 	u8 delay_num;
 	u32 raw_value;
-- 
2.21.0.1020.gf2820cf01a-goog

