Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46ADBC43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 21:55:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FEB3217F5
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 21:55:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hnisAFtR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730237AbfC2Vzf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 17:55:35 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40547 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730113AbfC2Vzf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 17:55:35 -0400
Received: by mail-pl1-f196.google.com with SMTP id b11so1618077plr.7
        for <linux-clk@vger.kernel.org>; Fri, 29 Mar 2019 14:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ecc389FYQ0L59bBTC8JbGTFUcbTIY5rYmXWozIAY7B4=;
        b=hnisAFtR/2zxLT/Jp/D+xocLkDC5DbBCrBqQd1WlPOllJVYBmrOsvIlBy2t0MkoFst
         /AdTOTF4vVNZVzBuIHXNgFku7pSkultEU3AM5taXmGWgPSCbRNEnRu8me7EUPTBQVbCs
         AGBgehOsiQKtwGT+s7caWz7dhIyLweX7iSqfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ecc389FYQ0L59bBTC8JbGTFUcbTIY5rYmXWozIAY7B4=;
        b=Sy45nlJBCkghK+RqeTKiOuFGRqW63bSkYHP+Lgcvty78Hu4Br2X6u8kuULNqj4CLUJ
         CoolBbq2r4fntr8ph42olV8YrNmIIMX0kLrUtZvCsEyoyomGDlfqwbjXgoCt/tLQqnZc
         ib5/+nf5x17jA5zCA0BIqTgBYfYrYFHYkgIHpCU9xkgMVMcyL2HN6EwEMiMPJe8N0zeK
         iL84GNu/ythu6dq9MIy13BNe4QlD/FvGqIPJEtQOd/AII/HlfXNqP5iL23UqmQSFMZ3h
         m0tdG2KUK28PqFRG9u08Sj+ZeYccAurpb+ptNW9dxdaM9oJJ4RQrPMtshCtjkxWnxVFl
         LD3A==
X-Gm-Message-State: APjAAAWjauj2CadGTO30gQdoj25xW3SuBvmZ1X4zxxa1+Np5ll80cpFm
        1t8YgJmpD1SZTaCpLejbRzz/Eg==
X-Google-Smtp-Source: APXvYqzS56Wdd5AWjHRFithraHo+bIHKtALoqOiZvTC3cbnpcBptYR/yiu6zV7xXACzJgcbuF9StdQ==
X-Received: by 2002:a17:902:b618:: with SMTP id b24mr48434370pls.73.1553896534506;
        Fri, 29 Mar 2019 14:55:34 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 20sm4301146pfn.131.2019.03.29.14.55.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Mar 2019 14:55:33 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Ziyuan Xu <xzy.xu@rock-chips.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        ryandcase@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>,
        mka@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: rockchip: Fix video codec clocks on rk3288
Date:   Fri, 29 Mar 2019 14:54:55 -0700
Message-Id: <20190329215455.159717-1-dianders@chromium.org>
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

Fixes: 4d3e84f99628 ("clk: rockchip: describe aclk_vcodec using the new muxgrf type on rk3288")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I currently have no way to test the JPEG mem2mem driver, so hopefully
others can test this and make sure it's happy for them.  I'm just
happy not to get strange errors at boot anymore.

 drivers/clk/rockchip/clk-rk3288.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 5a67b7869960..4d767f9c3a80 100644
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
-- 
2.21.0.392.gf8f6787159e-goog

