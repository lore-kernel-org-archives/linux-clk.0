Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1287CC433F5
	for <linux-clk@archiver.kernel.org>; Wed,  2 Feb 2022 13:49:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiBBNtk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Feb 2022 08:49:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344446AbiBBNti (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:49:38 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E333FC06173B
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:49:38 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id c9so18256568plg.11
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mkeyVZYvCErysBkvQ94PwTRCMEuEAHN8L4E3uqIGPCI=;
        b=bXPvwVRs+o8/xWH8TeTOFCnMCD1p/4Rth+FE0/AFRoTwQyqw/q1/VGpcFWER/SXKyP
         5QlmSDfD+hb+/LOonVU3tXRtUSi67cLfvQ37t1nx6vQWDuoSQwptl0v7L+JSFHbslt5Z
         cEBbgrZibEWq44oSnvtVEjrp5pFEEOWOMBNYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mkeyVZYvCErysBkvQ94PwTRCMEuEAHN8L4E3uqIGPCI=;
        b=QORfb6+eSeBxSk1GvjMsynI86ElqswsvyVUvv3g91RFK6ImflKwc6dnh5XM/FyHkBa
         WA+22zUsCzz9ieJcg+kmOcHw+BIx1g59BXtHbDSwKd+M2/MKOMS4YMPBvdeW5dZdDJtk
         n1e11eP6JdiZIex8U+3oHdrItEWxpqir29IJBxmYc8vrUVHOujd1lnrMwOz18xC2M4gf
         tenMCBBe17Vg7cIHs/+xtvwBMnANsueFSF44mP4N3E1qlE7m0Rx7NwLk2DQkzTiEGkaT
         /Hs2V8Pe5KZ1wyjkprwpOc1ALAYQJE5+LX6bLtS4ZTqxZa3TyE0WRUDBop82HXpYLJnl
         U4KQ==
X-Gm-Message-State: AOAM530wMvy4alCVeVzINwCAPPcph2nO1Be5BzeRrPG6OB0gM4Cr6rys
        aMxTFektEpOE6CCQZ8efFRyxaw==
X-Google-Smtp-Source: ABdhPJw56wLA9JPuzbPs9Ql1eCc++lFBo6TckNMETFk/i7rRcRv46MMyA6BnNUo81t0G312z4+aVTg==
X-Received: by 2002:a17:902:e0c2:: with SMTP id e2mr30133644pla.53.1643809778399;
        Wed, 02 Feb 2022 05:49:38 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:49:38 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/31] clk: mediatek: Cleanups and Improvements - Part 1
Date:   Wed,  2 Feb 2022 21:48:03 +0800
Message-Id: <20220202134834.690675-1-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi everyone,

This is version 2 of part 1 of planned work to cleanup, improve, and
modernize the MediaTek clk drivers. The full proposal can be found here:

https://lore.kernel.org/linux-clk/20220122091731.283592-1-wenst@chromium.org/


Changes since version 1:

- Added NULL pointer check against __clk_get_hw() return value in
  mtk_clk_unregister_pll()
- Added NULL pointer check against __clk_get_hw() return value in
  mtk_clk_unregister_composite()
- Copied MHZ macro into clk-pll.c and restored its usage
- Dropped extra semicolon in mtk_clk_register_plls()
  - Reported by kernel test robot <lkp@intel.com>


I also wanted to ask, what would be a good way to do the "struct clk" to
"struct clk_hw" API conversion?

A. Add new register/unregister APIs that use "struct clk_hw" instead of
   "struct clk". This would result in a lot of patches and a lot of
   churn though.

B. Replace "struct clk" with "struct clk_hw" (and "struct clk_onecell_data"
   with "struct clk_hw_onecell_data") and work around existing code with
   __clk_get_hw() or its opposite. This would result in a few huge
   pages, as to not break bisection, but would likely cause less churn.
   And it would cover all existing platforms in one go.


Thanks
ChenYu


Original cover letter sans full proposal as follows:

Part 1 involves cleaning up various parts of the MediaTek common clk
driver library:

- Code style cleanups in places touched by other changes
- Code for a given clk type that happened to be split between different
  files is consolidated
- Parts of the implementation, such as the internal data structures and
  registration/unregistration of a single clk, are internalized and no
  longer exported to other parts of the library
- Unregister APIs for all clk types in the library are added
- Remove function added for the simple driver case
- Error handling is added for all clk types
- MT8195 clk drivers cleaned up with error handling and removal support
  added

Adding error handling to the clk driver library results is a change in
its behavior, and might cause some breakage where the affected system
was originally somewhat working, but not completely. The failure would
result from a duplicated clk, either in name or ID. Old behavior was to
skip over these and ignore the error, whereas the new behavior is to
restore changes and error out.

To detect duplicate IDs, an additional warning will now be printed when
such occurrences happen. In a correct driver such things should not
happen though, so maybe we could consider wrapping that in some debug
Kconfig option. That's why I put it as the last patch in this series.

This series was tested on MT8195 with the series applied on the downstream
ChromeOS v5.10 kernel. Some other patches were applied to make this
series apply cleanly, but nothing The cpumux clk type changes were
not tested due to lack of related hardware. However the changes are
very similar to the other types, and I am confident there are no issues.


Chen-Yu Tsai (31):
  clk: mediatek: Use %pe to print errors
  clk: mediatek: gate: Consolidate gate type clk related code
  clk: mediatek: gate: Internalize clk implementation
  clk: mediatek: gate: Implement unregister API
  clk: mediatek: gate: Clean up included headers
  clk: mediatek: cpumux: Implement unregister API
  clk: mediatek: cpumux: Internalize struct mtk_clk_cpumux
  clk: mediatek: cpumux: Clean up included headers
  clk: mediatek: mux: Implement unregister API
  clk: mediatek: mux: Internalize struct mtk_clk_mux
  clk: mediatek: mux: Clean up included headers
  clk: mediatek: pll: Split definitions into separate header file
  clk: mediatek: pll: Implement unregister API
  clk: mediatek: pll: Clean up included headers
  clk: mediatek: Implement mtk_clk_unregister_fixed_clks() API
  clk: mediatek: Implement mtk_clk_unregister_factors() API
  clk: mediatek: Implement mtk_clk_unregister_divider_clks() API
  clk: mediatek: Implement mtk_clk_unregister_composites() API
  clk: mediatek: Add mtk_clk_simple_remove()
  clk: mediatek: mtk: Clean up included headers
  clk: mediatek: cpumux: Implement error handling in register API
  clk: mediatek: gate: Implement error handling in register API
  clk: mediatek: mux: Reverse check for existing clk to reduce nesting
    level
  clk: mediatek: mux: Implement error handling in register API
  clk: mediatek: pll: Implement error handling in register API
  clk: mediatek: mtk: Implement error handling in register APIs
  clk: mediatek: Unregister clks in mtk_clk_simple_probe() error path
  clk: mediatek: mt8195: Hook up mtk_clk_simple_remove()
  clk: mediatek: mt8195: Implement error handling in probe functions
  clk: mediatek: mt8195: Implement remove functions
  clk: mediatek: Warn if clk IDs are duplicated

 drivers/clk/mediatek/clk-apmixed.c            |   2 +-
 drivers/clk/mediatek/clk-cpumux.c             |  69 +++-
 drivers/clk/mediatek/clk-cpumux.h             |  13 +-
 drivers/clk/mediatek/clk-gate.c               | 148 +++++++--
 drivers/clk/mediatek/clk-gate.h               |  59 ++--
 drivers/clk/mediatek/clk-mt2701.c             |   5 +-
 drivers/clk/mediatek/clk-mt2712.c             |   3 +-
 drivers/clk/mediatek/clk-mt6765.c             |   3 +-
 drivers/clk/mediatek/clk-mt6779.c             |   3 +-
 drivers/clk/mediatek/clk-mt6797.c             |   3 +-
 drivers/clk/mediatek/clk-mt7622.c             |   5 +-
 drivers/clk/mediatek/clk-mt7629.c             |   5 +-
 drivers/clk/mediatek/clk-mt7986-apmixed.c     |   4 +-
 drivers/clk/mediatek/clk-mt8135.c             |   3 +-
 drivers/clk/mediatek/clk-mt8167.c             |   3 +-
 drivers/clk/mediatek/clk-mt8173.c             |   5 +-
 drivers/clk/mediatek/clk-mt8183.c             |   3 +-
 drivers/clk/mediatek/clk-mt8192.c             |   3 +-
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c  |  30 +-
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c  |  25 +-
 drivers/clk/mediatek/clk-mt8195-cam.c         |   1 +
 drivers/clk/mediatek/clk-mt8195-ccu.c         |   1 +
 drivers/clk/mediatek/clk-mt8195-img.c         |   1 +
 .../clk/mediatek/clk-mt8195-imp_iic_wrap.c    |   1 +
 drivers/clk/mediatek/clk-mt8195-infra_ao.c    |   1 +
 drivers/clk/mediatek/clk-mt8195-ipe.c         |   1 +
 drivers/clk/mediatek/clk-mt8195-mfg.c         |   1 +
 drivers/clk/mediatek/clk-mt8195-peri_ao.c     |   1 +
 drivers/clk/mediatek/clk-mt8195-scp_adsp.c    |   1 +
 drivers/clk/mediatek/clk-mt8195-topckgen.c    |  69 +++-
 drivers/clk/mediatek/clk-mt8195-vdec.c        |   1 +
 drivers/clk/mediatek/clk-mt8195-vdo0.c        |  20 +-
 drivers/clk/mediatek/clk-mt8195-vdo1.c        |  20 +-
 drivers/clk/mediatek/clk-mt8195-venc.c        |   1 +
 drivers/clk/mediatek/clk-mt8195-vpp0.c        |   1 +
 drivers/clk/mediatek/clk-mt8195-vpp1.c        |   1 +
 drivers/clk/mediatek/clk-mt8195-wpe.c         |   1 +
 drivers/clk/mediatek/clk-mt8516.c             |   3 +-
 drivers/clk/mediatek/clk-mtk.c                | 304 +++++++++++++-----
 drivers/clk/mediatek/clk-mtk.h                | 105 ++----
 drivers/clk/mediatek/clk-mux.c                |  89 ++++-
 drivers/clk/mediatek/clk-mux.h                |  17 +-
 drivers/clk/mediatek/clk-pll.c                | 100 +++++-
 drivers/clk/mediatek/clk-pll.h                |  57 ++++
 drivers/clk/mediatek/reset.c                  |   3 +-
 45 files changed, 903 insertions(+), 292 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-pll.h

-- 
2.35.0.rc2.247.g8bbb082509-goog

