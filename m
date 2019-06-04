Return-Path: <SRS0=hifp=UD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E2CC282CE
	for <linux-clk@archiver.kernel.org>; Tue,  4 Jun 2019 22:32:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F0122067C
	for <linux-clk@archiver.kernel.org>; Tue,  4 Jun 2019 22:32:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a6SMCfW3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfFDWcM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Jun 2019 18:32:12 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37176 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfFDWcM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Jun 2019 18:32:12 -0400
Received: by mail-pl1-f196.google.com with SMTP id bh12so2824838plb.4
        for <linux-clk@vger.kernel.org>; Tue, 04 Jun 2019 15:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7LrsWOu9H08D9VnyWoK4aMKFSqz39fLtN0sqw4NiYmE=;
        b=a6SMCfW3Grszq2AuhWerX+Qret6+CW6/s7WM7ae6WCeNv1pzOjPcAAjhxtm4SMJcGw
         bep+z6ve4HsBKKv2+9WzO3L68i4ehYfGyamPfhQOqc4dcrn70qgWiT9PBsSdV4ohOYs5
         63QbziAKVPMzQ/8C7IHZCEsYkvSNHeIsA6E/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7LrsWOu9H08D9VnyWoK4aMKFSqz39fLtN0sqw4NiYmE=;
        b=nspBcSP0WHsQmd/hMil/Brt/IqwFJkjAby5SpQ8ZK1UImgzOyi9uCoB9vvA/oXhoUz
         ucTdAswF3gjiTzal6qYm1ViIbHcJb0oX4HBvZ4/vyCL0QS/K7IrD2lY49jfzlX1RcinX
         5/Kj3exfFlVDoP1GkkFhYh1rdIwo5nwcXJ6EYmC2KhcC6KqfMYO6D1W3v3FE8DtfSnRK
         UFfMNu4AhNQ3BPHTCFl0V7wdZIAn3S0NpO3W3j7cuKLOFonroMq9l5PHDiY1DAyCA53i
         SyBM9WEPkxPvOByJDkNuZtrhrWF2NsW4wwqjPmHhBwKq1V1BTM5dg6xOlX5qvYeCni+g
         E/wQ==
X-Gm-Message-State: APjAAAXQtM+Ai9X2yuT0qvau5HFaTpZ3SKnqRQH63bJkllqj/IEZ7hdd
        w6utoROIT+3DatxavsHpycTdSQ==
X-Google-Smtp-Source: APXvYqyP3mL6L3hXGIHj9/i/mpdSFQYcVM5JqdDzD0ZqHoQlEFBlN2xJ2cgV7XcUdPhRNGofv0hBsw==
X-Received: by 2002:a17:902:6ac4:: with SMTP id i4mr37076584plt.75.1559687531967;
        Tue, 04 Jun 2019 15:32:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i5sm642508pjj.8.2019.06.04.15.32.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 15:32:11 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Stephen Boyd <sboyd@kernel.org>, mka@chromium.org,
        seanpaul@chromium.org, Urja Rannikko <urjaman@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: rockchip: Remove 48 MHz PLL rate from rk3288
Date:   Tue,  4 Jun 2019 15:31:59 -0700
Message-Id: <20190604223200.345-1-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The 48 MHz PLL rate is not present in the downstream chromeos-3.14
tree.  Looking at history, it was originally removed in
<https://crrev.com/c/265810> ("CHROMIUM: clk: rockchip: expand more
clocks support") with no explanation.  Much of that patch was later
reverted in <https://crrev.com/c/284595> ("CHROMIUM: clk: rockchip:
Revert more questionable PLL rates"), but that patch left in the
removal of 48 MHz.  What I wrote in that patch:

> Note that the original change also removed the rate (48000000, 1,
> 64, 32) from the table.  I have no idea why that was squashed in
> there, but that rate was invalid anyway (it appears to have an out
> of bounds NO).  I'm not putting that rate in.

Reading the TRM I see that NO is defined as
- NO: 1, 2-16 (even only)
...and furthermore only 4 bits are assigned for NO-1, which means that
the highest NO we could even represent is 16.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/clk/rockchip/clk-rk3288.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 152a22a69b04..51a26ff600a1 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -101,7 +101,6 @@ static struct rockchip_pll_rate_table rk3288_pll_rates[] = {
 	RK3066_PLL_RATE( 216000000, 1, 72, 8),
 	RK3066_PLL_RATE( 148500000, 2, 99, 8),
 	RK3066_PLL_RATE( 126000000, 1, 84, 16),
-	RK3066_PLL_RATE(  48000000, 1, 64, 32),
 	{ /* sentinel */ },
 };
 
-- 
2.22.0.rc1.311.g5d7573a151-goog

