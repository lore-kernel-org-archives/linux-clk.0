Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADA9C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 13:56:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95D462133D
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 13:56:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y+IULaGQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbfDKN40 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 09:56:26 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45128 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfDKN40 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Apr 2019 09:56:26 -0400
Received: by mail-pl1-f193.google.com with SMTP id bf11so3438054plb.12
        for <linux-clk@vger.kernel.org>; Thu, 11 Apr 2019 06:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ClUU+SVRlGfqKXGcUvbdevlNJHckubkDnT0pIeXVGo=;
        b=Y+IULaGQZPcgXGJKaO5x/3c7/CS7b90tbNi6x4SdpFMvxU4a5RglgbAZVSN55QDhup
         6GWTZmjKDYPmeU74rNmCh9Vqkhnvgfia5fespuvh1mJKf8h/E4GHD1I9X9QTCCZ7u515
         zwqxIRaEvJv9z+w6CLpB0Bswnof/T2ORp5u0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ClUU+SVRlGfqKXGcUvbdevlNJHckubkDnT0pIeXVGo=;
        b=VsrdVuMIUj5zSIQSvAUQXIRHbJJjTMogEM9riO+27UddRUHqs8ESnQADEraZKRSPej
         ZmaE/SDFWEXUaUTBmPyTL08BjlgEZSXWHivLCYTpLRHRoSMb0JNaii4WlYJ2Mp1PS5T6
         9DV84sW8eiN1FKMh7rlaOGQyojfvKalyVCDtdGMvvahvRCZ//igA4KU1mFKWEu5KDxzh
         SrB1cwOZfoDqwFrgKBuhbMtuvoG5xXa5kPyfeImnR9SEaa0owphM71/wYX8LtUbfAWlp
         TAye3xjhSHWqlRcyU95c+KrxNm9DUtcvu/juAUevE+X711DztR3KQPunMsJVA2Ty8rWD
         1tVg==
X-Gm-Message-State: APjAAAVsuMw7yszTXEuaDTvdAFxp+2Aty0uYAaY/6YLXK5awaFaIqLYv
        Wa2XmYjGkR6jQeHSFDkMNwAPQQ==
X-Google-Smtp-Source: APXvYqxdkm3c+ME8kedFIAhaOjckgUmY14dX6xlRAn1S2d2DSoin0DQYAjnnqNzJDm8fzIwl6ZRw/g==
X-Received: by 2002:a17:902:4381:: with SMTP id j1mr48303199pld.75.1554990985257;
        Thu, 11 Apr 2019 06:56:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id v189sm90797218pgd.77.2019.04.11.06.56.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 06:56:24 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Jonas Karlman <jonas@kwiboo.se>, Tomasz Figa <tfiga@chromium.org>,
        Randy Li <ayaka@soulik.info>,
        Ziyuan Xu <xzy.xu@rock-chips.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        ryandcase@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>,
        mka@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] clk: rockchip: Fix video codec clocks on rk3288
Date:   Thu, 11 Apr 2019 06:55:55 -0700
Message-Id: <20190411135555.235625-1-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It appears that there is a typo in the rk3288 TRM.  For
GRF_SOC_CON0[7] it says that 0 means "vepu" and 1 means "vdpu".  It's
the other way around.

How do I know?  Here's my evidence:

1. Prior to commit 4d3e84f99628 ("clk: rockchip: describe aclk_vcodec
   using the new muxgrf type on rk3288") we always pretended that we
   were using "aclk_vdpu" and the comment in the code said that this
   matched the default setting in the system.  In fact the default
   setting is 0 according to the TRM and according to reading memory
   at bootup.  In addition rk3288-based Chromebooks ran like this and
   the video codecs worked.
2. With the existing clock code if you boot up and try to enable the
   new VIDEO_ROCKCHIP_VPU as a module (and without "clk_ignore_unused"
   on the command line), you get errors like "failed to get ack on
   domain 'pd_video', val=0x80208".  After flipping vepu/vdpu things
   init OK.
3. If I export and add both the vepu and vdpu to the list of clocks
   for RK3288_PD_VIDEO I can get past the power domain errors, but now
   I freeze when the vpu_mmu gets initted.
4. If I just mark the "vdpu" as IGNORE_UNUSED then everything boots up
   and probes OK showing that somehow the "vdpu" was important to keep
   enabled.  This is because we were actually using it as a parent.
5. After this change I can hack "aclk_vcodec_pre" to parent from
   "aclk_vepu" using assigned-clocks and the video codec still probes
   OK.
6. Rockchip has said so on the mailing list [1].

...so let's fix it.

Let's also add CLK_SET_RATE_PARENT to "aclk_vcodec_pre" as suggested
by Jonas Karlman.  Prior to the same commit you could do
clk_set_rate() on "aclk_vcodec" and it would change "aclk_vdpu".
That's because "aclk_vcodec" was a simple gate clock (always gets
CLK_SET_RATE_PARENT) and its direct parent was "aclk_vdpu".  After
that commit "aclk_vcodec_pre" gets in the way so we need to add
CLK_SET_RATE_PARENT to it too.

[1] https://lkml.kernel.org/r/1d17b015-9e17-34b9-baf8-c285dc1957aa@rock-chips.com

Fixes: 4d3e84f99628 ("clk: rockchip: describe aclk_vcodec using the new muxgrf type on rk3288")
Suggested-by: Jonas Karlman <jonas@kwiboo.se>
Suggested-by: Randy Li <ayaka@soulik.info>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Now also has CLK_SET_RATE_PARENT for "aclk_vcodec_pre"
- Added Suggested-by tags for prior work
- Added link to Elaine saying that this is indeed correct

 drivers/clk/rockchip/clk-rk3288.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 5a67b7869960..51e8e799debb 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -219,7 +219,7 @@ PNAME(mux_hsadcout_p)	= { "hsadc_src", "ext_hsadc" };
 PNAME(mux_edp_24m_p)	= { "ext_edp_24m", "xin24m" };
 PNAME(mux_tspout_p)	= { "cpll", "gpll", "npll", "xin27m" };
 
-PNAME(mux_aclk_vcodec_pre_p)	= { "aclk_vepu", "aclk_vdpu" };
+PNAME(mux_aclk_vcodec_pre_p)	= { "aclk_vdpu", "aclk_vepu" };
 PNAME(mux_usbphy480m_p)		= { "sclk_otgphy1_480m", "sclk_otgphy2_480m",
 				    "sclk_otgphy0_480m" };
 PNAME(mux_hsicphy480m_p)	= { "cpll", "gpll", "usbphy480m_src" };
@@ -420,7 +420,7 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	COMPOSITE(0, "aclk_vdpu", mux_pll_src_cpll_gpll_usb480m_p, 0,
 			RK3288_CLKSEL_CON(32), 14, 2, MFLAGS, 8, 5, DFLAGS,
 			RK3288_CLKGATE_CON(3), 11, GFLAGS),
-	MUXGRF(0, "aclk_vcodec_pre", mux_aclk_vcodec_pre_p, 0,
+	MUXGRF(0, "aclk_vcodec_pre", mux_aclk_vcodec_pre_p, CLK_SET_RATE_PARENT,
 			RK3288_GRF_SOC_CON(0), 7, 1, MFLAGS),
 	GATE(ACLK_VCODEC, "aclk_vcodec", "aclk_vcodec_pre", 0,
 		RK3288_CLKGATE_CON(9), 0, GFLAGS),
-- 
2.21.0.392.gf8f6787159e-goog

