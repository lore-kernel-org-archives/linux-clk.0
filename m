Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81D9C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 10 May 2022 10:48:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235836AbiEJKwK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 May 2022 06:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233315AbiEJKwJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2022 06:52:09 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84FFC1D866C
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 03:48:12 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id k14so14344453pga.0
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 03:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vpDFlOZXpJjXLC7ktedthI7zQougAm9+755lwKBDRYQ=;
        b=L2p74zzSnxmX+oAWUzKHb5m9IZgc62QdY3HohYzBVPVhe0dhmg9ADu4Yqu6AqCF4B0
         v4jkWStbaOkwaXbT8yqdvBCGNLccvBfLYoTlQo87rzR3e3bhqPB22CbyCS5yh1wEp9Ew
         gzxoCQ/DWr/9rVFWN/LM/IS9Cq3uEDN8srenc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vpDFlOZXpJjXLC7ktedthI7zQougAm9+755lwKBDRYQ=;
        b=6vYBqo640li7XZhqQ6GoOZG/FHxKYpPJJeQLcNET/JAukZzJ8OSyk/cnoBBrB1EXSq
         8+LApqxHPavVScM53uVoCIjnNjSi4ZvFiFRVB/4R+vdkPZ2IMYaypiD9Z3pY1yWIZwpt
         JgRvM9plyblMczlbWrfLFm8hEbPwr360d2jWrftWoJPNftPFEEGgFU6hDAUxle7T8LzY
         k+i29U6nOgg28rvTVCHi2+pWKojdb3/q1YilhacEJhNOZtBaSsRMHZBVMIvMw9S9eDQt
         n1c+vtC3n2Cgor6jo8rY2jt/ZFac3Dsu/tHtKCtwopo6isk2Jmdkl/+nAAXmKlajqS7O
         T7pw==
X-Gm-Message-State: AOAM531fJPynR9bzuSlmZ1BlaNt7UOMHslXxDauQS+TinsK1/KUHZmxB
        yaPaNemLspTImFSXqJTtZ7gSt6h0I5jRZQ==
X-Google-Smtp-Source: ABdhPJyhlmUFh9/ps5D57B2uVw0NOeQ/MOs6dPy31mbKwB0SdcdcVA74igmhool6iWIHCQau2SEetQ==
X-Received: by 2002:a62:31c1:0:b0:50a:4909:2691 with SMTP id x184-20020a6231c1000000b0050a49092691mr20316266pfx.64.1652179692002;
        Tue, 10 May 2022 03:48:12 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6dcd:8578:55cf:2b12])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902e30900b0015e8d4eb21esm1659691plc.104.2022.05.10.03.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 03:48:11 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/11] clk: mediatek: Move to struct clk_hw provider APIs
Date:   Tue, 10 May 2022 18:47:53 +0800
Message-Id: <20220510104804.544597-1-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi everyone,

This is v2 of part 2 of my proposed MediaTek clk driver cleanup work [1].

Changes since v1:
- Rebased and added coverage of new MT8186 clk drivers
- Split patch "clk: mediatek: Replace 'struct clk' with 'struct clk_hw'"
  into arbitrary pieces so that they don't bounce from the mailing lists

This was tested on MT8183 Juniper. Apppreciate any help testing on non-
ChromeOS devices.

I'm not sure how this is supposed to be merged. Patches 3~8 need to be
squashed together for bisectability, and the same goes for patches 9+10.
Maybe after review, I could squash them and send a pull request? Or the
patches could be put on a separate topic branch? That would be bad if
we needed to revert the branch and other stuff was based on it though.

Original cover letter from v1, with patch numbers fixed:

Part 2 involves moving the whole MediaTek clk driver library from the
old `struct clk` provider API to the new `struct clk_hw` provider API.

Parts of this series were done with coccinelle scripts, while others
were done by hand. To facilitate review, these parts are currently split
into different patches. As a result however, this series is not fully
bisectable. Later on, the related parts should be squashed together.

Patch 1 and 2 are minor cleanups around code that is touched by later
patches.

Patch 3 starts the switch of the underlying data structure used to hold
clocks from `struct clk_onecell_data` to `struct clk_hw_onecell_data`.
This part is done by hand. The helpers used to allocate the data
structures are changed, but none of the actual call sites, nor the
clk provider API usage.

Patch 4~8 finish the switch from `struct clk_onecell_data` to `struct
clk_hw_onecell_data`. All the holding variables and call sites that
involve `struct clk_onecell_data` are changed using coccinelle scripts.

Patch 9 moves most of the MediaTek clk driver library from clk_register*()
to clk_hw_register*, including all intermediate helpers, using
coccinelle scripts.

Patch 10 fixes, by hand, a build error from a call site that was not covered
by the previous patch.

Patch 11 converts the last usage of clk_register*() in the MediaTek clk
drivers.

As mentioned above, this series includes parts that don't build, but are
split out for clarity. These are patches 3~8 and 9+10. Once the patches
are reviewed, they can be squashed together.

This series will likely conflict with Rex's "Cleanup MediaTek clk reset
drivers" that was posted earlier today. We'll see how these work out.

The next phase of the cleanup/improvement shall be to introduce some
variant of `struct clk_parent_data` to describe clk relationships
efficiently.

Please have a look.


Thanks
ChenYu

[1] https://lore.kernel.org/linux-clk/20220122091731.283592-1-wenst@chromium.org/

Chen-Yu Tsai (11):
  clk: mediatek: Make mtk_clk_register_composite() static
  clk: mediatek: apmixed: Drop error message from clk_register() failure
  clk: mediatek: Convert mtk_{alloc,free}_clk_data to struct clk_hw
  clk: mediatek: Replace 'struct clk' with 'struct clk_hw'
  clk: mediatek: mt27xx: Replace 'struct clk' with 'struct clk_hw'
  clk: mediatek: mt67xx: Replace 'struct clk' with 'struct clk_hw'
  clk: mediatek: mt7xxx: Replace 'struct clk' with 'struct clk_hw'
  clk: mediatek: mt8xxx: Replace 'struct clk' with 'struct clk_hw'
  clk: mediatek: Switch to clk_hw provider APIs
  clk: mediatek: mt8173: Fix usage of mtk_clk_register_ref2usb_tx()
  clk: mediatek: mt8173: Switch to clk_hw provider APIs

 drivers/clk/mediatek/clk-apmixed.c           |  12 +-
 drivers/clk/mediatek/clk-cpumux.c            |  50 +++---
 drivers/clk/mediatek/clk-cpumux.h            |   6 +-
 drivers/clk/mediatek/clk-gate.c              |  52 +++---
 drivers/clk/mediatek/clk-gate.h              |   8 +-
 drivers/clk/mediatek/clk-mt2701-aud.c        |   4 +-
 drivers/clk/mediatek/clk-mt2701-bdp.c        |   4 +-
 drivers/clk/mediatek/clk-mt2701-eth.c        |   4 +-
 drivers/clk/mediatek/clk-mt2701-g3d.c        |   4 +-
 drivers/clk/mediatek/clk-mt2701-hif.c        |   4 +-
 drivers/clk/mediatek/clk-mt2701-img.c        |   4 +-
 drivers/clk/mediatek/clk-mt2701-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt2701-vdec.c       |   4 +-
 drivers/clk/mediatek/clk-mt2701.c            |  26 +--
 drivers/clk/mediatek/clk-mt2712-bdp.c        |   4 +-
 drivers/clk/mediatek/clk-mt2712-img.c        |   4 +-
 drivers/clk/mediatek/clk-mt2712-jpgdec.c     |   4 +-
 drivers/clk/mediatek/clk-mt2712-mfg.c        |   4 +-
 drivers/clk/mediatek/clk-mt2712-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt2712-vdec.c       |   4 +-
 drivers/clk/mediatek/clk-mt2712-venc.c       |   4 +-
 drivers/clk/mediatek/clk-mt2712.c            |  28 +--
 drivers/clk/mediatek/clk-mt6765-audio.c      |   4 +-
 drivers/clk/mediatek/clk-mt6765-cam.c        |   4 +-
 drivers/clk/mediatek/clk-mt6765-img.c        |   4 +-
 drivers/clk/mediatek/clk-mt6765-mipi0a.c     |   4 +-
 drivers/clk/mediatek/clk-mt6765-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt6765-vcodec.c     |   4 +-
 drivers/clk/mediatek/clk-mt6765.c            |  12 +-
 drivers/clk/mediatek/clk-mt6779-aud.c        |   4 +-
 drivers/clk/mediatek/clk-mt6779-cam.c        |   4 +-
 drivers/clk/mediatek/clk-mt6779-img.c        |   4 +-
 drivers/clk/mediatek/clk-mt6779-ipe.c        |   4 +-
 drivers/clk/mediatek/clk-mt6779-mfg.c        |   4 +-
 drivers/clk/mediatek/clk-mt6779-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt6779-vdec.c       |   4 +-
 drivers/clk/mediatek/clk-mt6779-venc.c       |   4 +-
 drivers/clk/mediatek/clk-mt6779.c            |  12 +-
 drivers/clk/mediatek/clk-mt6797-img.c        |   4 +-
 drivers/clk/mediatek/clk-mt6797-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt6797-vdec.c       |   4 +-
 drivers/clk/mediatek/clk-mt6797-venc.c       |   4 +-
 drivers/clk/mediatek/clk-mt6797.c            |  22 +--
 drivers/clk/mediatek/clk-mt7622-aud.c        |   4 +-
 drivers/clk/mediatek/clk-mt7622-eth.c        |   8 +-
 drivers/clk/mediatek/clk-mt7622-hif.c        |   8 +-
 drivers/clk/mediatek/clk-mt7622.c            |  30 ++--
 drivers/clk/mediatek/clk-mt7629-eth.c        |   8 +-
 drivers/clk/mediatek/clk-mt7629-hif.c        |   8 +-
 drivers/clk/mediatek/clk-mt7629.c            |  30 ++--
 drivers/clk/mediatek/clk-mt7986-apmixed.c    |   6 +-
 drivers/clk/mediatek/clk-mt7986-eth.c        |  12 +-
 drivers/clk/mediatek/clk-mt7986-infracfg.c   |   4 +-
 drivers/clk/mediatek/clk-mt7986-topckgen.c   |  16 +-
 drivers/clk/mediatek/clk-mt8135.c            |  18 +-
 drivers/clk/mediatek/clk-mt8167-aud.c        |   4 +-
 drivers/clk/mediatek/clk-mt8167-img.c        |   4 +-
 drivers/clk/mediatek/clk-mt8167-mfgcfg.c     |   4 +-
 drivers/clk/mediatek/clk-mt8167-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt8167-vdec.c       |   4 +-
 drivers/clk/mediatek/clk-mt8167.c            |  12 +-
 drivers/clk/mediatek/clk-mt8173-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt8173.c            |  69 ++++----
 drivers/clk/mediatek/clk-mt8183-audio.c      |   4 +-
 drivers/clk/mediatek/clk-mt8183-cam.c        |   4 +-
 drivers/clk/mediatek/clk-mt8183-img.c        |   4 +-
 drivers/clk/mediatek/clk-mt8183-ipu0.c       |   4 +-
 drivers/clk/mediatek/clk-mt8183-ipu1.c       |   4 +-
 drivers/clk/mediatek/clk-mt8183-ipu_adl.c    |   4 +-
 drivers/clk/mediatek/clk-mt8183-ipu_conn.c   |   4 +-
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c     |   4 +-
 drivers/clk/mediatek/clk-mt8183-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt8183-vdec.c       |   4 +-
 drivers/clk/mediatek/clk-mt8183-venc.c       |   4 +-
 drivers/clk/mediatek/clk-mt8183.c            |  25 +--
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c |   6 +-
 drivers/clk/mediatek/clk-mt8186-mcu.c        |   6 +-
 drivers/clk/mediatek/clk-mt8186-mm.c         |   6 +-
 drivers/clk/mediatek/clk-mt8186-topckgen.c   |   6 +-
 drivers/clk/mediatek/clk-mt8192-aud.c        |   4 +-
 drivers/clk/mediatek/clk-mt8192-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt8192.c            |  21 +--
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c |   6 +-
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c |   6 +-
 drivers/clk/mediatek/clk-mt8195-topckgen.c   |   6 +-
 drivers/clk/mediatek/clk-mt8195-vdo0.c       |   6 +-
 drivers/clk/mediatek/clk-mt8195-vdo1.c       |   6 +-
 drivers/clk/mediatek/clk-mt8516-aud.c        |   4 +-
 drivers/clk/mediatek/clk-mt8516.c            |  12 +-
 drivers/clk/mediatek/clk-mtk.c               | 173 +++++++++----------
 drivers/clk/mediatek/clk-mtk.h               |  25 ++-
 drivers/clk/mediatek/clk-mux.c               |  50 +++---
 drivers/clk/mediatek/clk-mux.h               |   6 +-
 drivers/clk/mediatek/clk-pll.c               |  52 +++---
 drivers/clk/mediatek/clk-pll.h               |   6 +-
 95 files changed, 543 insertions(+), 554 deletions(-)

-- 
2.36.0.512.ge40c2bad7a-goog

