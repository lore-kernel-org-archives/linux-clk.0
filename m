Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB53C432BE
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 09:26:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF6AE61372
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 09:26:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236154AbhG0J0e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 05:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236160AbhG0J0d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 05:26:33 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E03C0613CF
        for <linux-clk@vger.kernel.org>; Tue, 27 Jul 2021 02:26:32 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id k4-20020a17090a5144b02901731c776526so3234574pjm.4
        for <linux-clk@vger.kernel.org>; Tue, 27 Jul 2021 02:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=5SSN8c+A4q649OGgaNnRGixZUmx2INCHF3tLkD6nvPk=;
        b=CRs4rxHiTAVDHul4JO57FrHKxWcKeSET+hZ7bsRxxdnOI/mzdM/iEnqGaOoDrIqM/b
         He6PzFxF3vrtAArMBMdSYNHZ+bZjVTQWHCOSZcg0n1KsF6xSARZyhjrnW8eRIayE8dbZ
         9N4p0ct1dxKENdqjdopc9Jy/IdVqItMFp1R8nsA2CFAIcIMq9UIEjEIivspbC6JsdxO5
         1gm9tAuFINZA2s6uOGh8JxOzlhYAPg2N5b7cPTwKHg9xIm1QsIpjc/1GCc8l9qzXDlom
         t8/xcc0gAcbk1o9Nc4Q08V9yrLvOs+BIl4GBcVt7d/1rMikCC7EGCH39CXKHPxPFxIYg
         st8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5SSN8c+A4q649OGgaNnRGixZUmx2INCHF3tLkD6nvPk=;
        b=XFb+6thkcwGWYdG+dXSTK8gVGQnTQCG/VROo9yqQjfu+kt1YeQDyw107BUyggO5l5g
         3PL4gEMKJAu+q/9vB2MYCZ3Dyj1ATeC9cwAHg3UdHgBT8G9Fh3Yuqx+SidBTOLNM6k4+
         Tqbsr1Rm3Lue1WHFh+bDhXKE1+yEaxqdYDD5llG+gynCVkrq0Gt61PGp0da6eVpAVWBJ
         20hl2R7LXWLx+F6Buh+i3MG5MyW4R12nq/NOSGlx779V1gLxm+6KkGQwhueR0tggcdnO
         p69BmxPt86aSdPz22ICRwTiDydM0ZEqLJVDOyuF094ptWKsMvAU6Q6mYGnYSxb2X9ff9
         HGTw==
X-Gm-Message-State: AOAM532iZNRVXztmL6A14UMOdngvdg18tLlk5m9dPQmTbF2+DOroIe6O
        SsOHR46cs0I9Ln3wgxTeIb4w/w==
X-Google-Smtp-Source: ABdhPJx75YBBeJBmSL+GJKa8wgm8sgIijuSXexYHcqm0FXwCCyAEWDQnWMfIbX4RS4ehj7+78QKMEQ==
X-Received: by 2002:a65:5684:: with SMTP id v4mr22572933pgs.388.1627377991891;
        Tue, 27 Jul 2021 02:26:31 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id e12sm2216272pjh.33.2021.07.27.02.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 02:26:31 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] clk: qcom: smd-rpm: Fix MSM8936 RPM_SMD_PCNOC_A_CLK
Date:   Tue, 27 Jul 2021 17:26:13 +0800
Message-Id: <20210727092613.23056-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit a0384ecfe2aa ("clk: qcom: smd-rpm: De-duplicate identical
entries") introduces the following regression on MSM8936/MSM8939, as
RPM_SMD_PCNOC_A_CLK gets pointed to pcnoc_clk by mistake.  Fix it by
correcting the clock to pcnoc_a_clk.

[    1.307363] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    1.313593] Mem abort info:
[    1.322512]   ESR = 0x96000004
[    1.325132]   EC = 0x25: DABT (current EL), IL = 32 bits
[    1.338872]   SET = 0, FnV = 0
[    1.355483]   EA = 0, S1PTW = 0
[    1.368702]   FSC = 0x04: level 0 translation fault
[    1.383294] Data abort info:
[    1.398292]   ISV = 0, ISS = 0x00000004
[    1.398297]   CM = 0, WnR = 0
[    1.398301] [0000000000000000] user address but active_mm is swapper
[    1.404193] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    1.420596] Modules linked in:
[    1.420604] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.14.0-rc3+ #198
[    1.441010] pc : __clk_register+0x48/0x780
[    1.446045] lr : __clk_register+0x3c/0x780
[    1.449953] sp : ffff800010063440
[    1.454031] x29: ffff800010063440 x28: 0000000000000004 x27: 0000000000000066
[    1.457423] x26: 0000000000000001 x25: 000000007fffffff x24: ffff800010f9f388
[    1.464540] x23: ffff00007fc12a90 x22: ffff0000034b2010 x21: 0000000000000000
[    1.471658] x20: ffff800010f9fff8 x19: ffff00000152a700 x18: 0000000000000001
[    1.478778] x17: ffff00007fbd40c8 x16: 0000000000000460 x15: 0000000000000465
[    1.485895] x14: ffffffffffffffff x13: 746e756f635f7265 x12: 696669746f6e5f6b
[    1.493013] x11: 0000000000000006 x10: 0000000000000000 x9 : 0000000000000000
[    1.500131] x8 : ffff00000152a800 x7 : 0000000000000000 x6 : 000000000000003f
[    1.507249] x5 : 0000000000000040 x4 : 0000000000000000 x3 : 0000000000000004
[    1.514367] x2 : 0000000000000000 x1 : 0000000000000cc0 x0 : ffff00000152a700
[    1.521486] Call trace:
[    1.528598]  __clk_register+0x48/0x780
[    1.530855]  clk_hw_register+0x20/0x60
[    1.534674]  devm_clk_hw_register+0x50/0xa8
[    1.538408]  rpm_smd_clk_probe+0x1a4/0x260
[    1.542488]  platform_probe+0x68/0xd8
[    1.546653]  really_probe+0x140/0x2f8
[    1.550386]  __driver_probe_device+0x78/0xe0
[    1.554033]  driver_probe_device+0x80/0x110
[    1.558373]  __device_attach_driver+0x90/0xe0
[    1.562280]  bus_for_each_drv+0x78/0xc8
[    1.566793]  __device_attach+0xf0/0x150
[    1.570438]  device_initial_probe+0x14/0x20
[    1.574259]  bus_probe_device+0x9c/0xa8
[    1.578425]  device_add+0x378/0x870
[    1.582243]  of_device_add+0x44/0x60
[    1.585716]  of_platform_device_create_pdata+0xc0/0x110
[    1.589538]  of_platform_bus_create+0x17c/0x388
[    1.594485]  of_platform_populate+0x50/0xf0
[    1.598998]  qcom_smd_rpm_probe+0xd4/0x128
[    1.603164]  rpmsg_dev_probe+0xbc/0x1a8
[    1.607330]  really_probe+0x140/0x2f8
[    1.611063]  __driver_probe_device+0x78/0xe0
[    1.614883]  driver_probe_device+0x80/0x110
[    1.619224]  __device_attach_driver+0x90/0xe0
[    1.623131]  bus_for_each_drv+0x78/0xc8
[    1.627643]  __device_attach+0xf0/0x150
[    1.631289]  device_initial_probe+0x14/0x20
[    1.635109]  bus_probe_device+0x9c/0xa8
[    1.639275]  device_add+0x378/0x870
[    1.643095]  device_register+0x20/0x30
[    1.646567]  rpmsg_register_device+0x54/0x90
[    1.650387]  qcom_channel_state_worker+0x168/0x288
[    1.654814]  process_one_work+0x1a0/0x328
[    1.659415]  worker_thread+0x4c/0x420
[    1.663494]  kthread+0x150/0x160
[    1.667138]  ret_from_fork+0x10/0x18
[    1.670442] Code: 97f56b92 b40034a0 aa0003f3 52819801 (f94002a0)
[    1.674004] ---[ end trace 412fa6f47384cdfe ]---

Fixes: a0384ecfe2aa ("clk: qcom: smd-rpm: De-duplicate identical entries")
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 800b2fef1887..b2c142f3a649 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -467,7 +467,7 @@ DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc_clk, sysmmnoc_a_clk, QCOM_SMD_RPM_BUS_CLK,
 
 static struct clk_smd_rpm *msm8936_clks[] = {
 	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
 	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
-- 
2.17.1

