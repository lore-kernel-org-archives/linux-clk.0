Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A46C433E6
	for <linux-clk@archiver.kernel.org>; Sat, 27 Mar 2021 11:03:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF985619FC
	for <linux-clk@archiver.kernel.org>; Sat, 27 Mar 2021 11:03:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbhC0LDQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 27 Mar 2021 07:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbhC0LDP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 27 Mar 2021 07:03:15 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C84C0613B3
        for <linux-clk@vger.kernel.org>; Sat, 27 Mar 2021 04:03:15 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id v15so11503596lfq.5
        for <linux-clk@vger.kernel.org>; Sat, 27 Mar 2021 04:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KZDpEXPQmSxpWJA5pbH10vAd6wTYvaEgEWkgKJ7hknY=;
        b=xbeuY4fHeWgajQPrP2wfQ/qKNf1IQvjaHgMipZUKetQ+GwVwfTw4vcPFgntVtYD23+
         koQfFVqRIKx2AL2+AsQ3FbD2ed71A2hUiPD8JREN9dTO2PIlVAX1eWN15SrnljBucFEv
         c2oCkOPYGO8VQP8R0ozuxE9b0+BdGsFnNEAOZ9+MyfuLQqmB4+3SFk5cB/g1oanT1+kZ
         OQa2suhjwGiZEzWuMTfKwBT+1IroRx7pRG3StbS0F+yX+L+A34ToLRZDNlAmOMUsoWoF
         jFKe71m+AURunrBZibU6aQZxx5/HZrkEjZMtfx0fjv8MRdlFt6I1zjwzHHv2KMyk6DUW
         kTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KZDpEXPQmSxpWJA5pbH10vAd6wTYvaEgEWkgKJ7hknY=;
        b=ELg/ily01EvMRZ4gUgezJ5t4qIm8+8E9VKiL57/+toVLHE+11/D/gYLgoieHqKDUIC
         pmVabZ4Vm/FZ+/M8TwFbivQ28CPLnXXb2ZEtGrXh7WY1k6z5j7IMSZubR3IFLIguVhtl
         emLMCBhBJ2ShzIU9+9adbfRkhAgOjubPBBepqEFLdilzQ2Z/yQ5PumvclHNS/A8QUc5I
         l9E9lBhxPd+lOxjYuh2tiwXfQpgM/nCxDLIqf0gYgYl7wnjforzRglMfq63sRt7JghYY
         Web0vBF/Z7R/H1Dj2q2PZIKIVvxTi74xLn/8xFXmJbrD2Z8A3mwmfHTSjfqhpZKHIS0d
         9pEA==
X-Gm-Message-State: AOAM530BseloamQSOjks2wl872DlnaWhNnAfqCOf7K74EsNh1+Wz1GQl
        6Ix4yc1Zb3VBh+x55QiaLc78sA==
X-Google-Smtp-Source: ABdhPJzKlkUYKA9Z7ZuJKCxOltu1RQmG+F/4OudHEO78+/n3taFdvD3MWfzQYmmMt+9YO4BNe0PW8Q==
X-Received: by 2002:a19:3804:: with SMTP id f4mr11362701lfa.117.1616842991268;
        Sat, 27 Mar 2021 04:03:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 04:03:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 00/25] drm/msm/dsi: refactor MSM DSI PHY/PLL drivers
Date:   Sat, 27 Mar 2021 14:02:40 +0300
Message-Id: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Restructure MSM DSI PHY drivers. What started as an attempt to grok the
overcomplicated PHY drivers, has lead up to the idea of merging PHY and
PLL code, reducing abstractions, code duplication, dropping dead code,
etc.

The patches were mainly tested on RB5 (sm8250, 7nm) and DB410c (apq8016,
28nm-lp) and lightly tested on RB3 (sdm845, 10nm).

The patch 'clk: fixed: add devm helper for clk_hw_register_fixed_factor()'
is already a part of mainline as of 5.12-rc1, but is included here for
completeness to fix compilation issues (as msm-next is based on 5.11-rc5).

Changes since v2:
 - Drop the 'stop setting clock parents manually' patch for now together
   with the dtsi changes. Unlike the rest of patchset it provides
   functional changes and might require additional discussion.
   The patchset will be resubmitted later.

Changes since v1:
 - Rebase on top of msm/msm-next
 - Reorder patches to follow logical sequence
 - Add sc7180 clocks assignment
 - Drop sm8250 clocks assignment, as respective file is not updated in
   msm/msm-next

Changes since RFC:
 - Reorder patches to move global clock patches in the beginning and
   dtsi patches where they are required.
 - remove msm_dsi_phy_set_src_pll() and guess src_pll_id using PHY usecase.

The following changes since commit 627dc55c273dab308303a5217bd3e767d7083ddb:

  drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume (2021-03-22 18:52:34 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dsi-phy-3

for you to fetch changes up to da7ba6797b2899a78774fb89e586e79a1001eff4:

  drm/msm/dsi: stop passing src_pll_id to the phy_enable call (2021-03-27 13:56:26 +0300)

----------------------------------------------------------------
Daniel Palmer (1):
      clk: fixed: add devm helper for clk_hw_register_fixed_factor()

Dmitry Baryshkov (24):
      clk: mux: provide devm_clk_hw_register_mux()
      clk: divider: add devm_clk_hw_register_divider
      drm/msm/dsi: replace PHY's init callback with configurable data
      drm/msm/dsi: fuse dsi_pll_* code into dsi_phy_* code
      drm/msm/dsi: drop multiple pll enable_seq support
      drm/msm/dsi: move all PLL callbacks into PHY config struct
      drm/msm/dsi: drop global msm_dsi_phy_type enumaration
      drm/msm/dsi: move min/max PLL rate to phy config
      drm/msm/dsi: remove msm_dsi_pll_set_usecase
      drm/msm/dsi: push provided clocks handling into a generic code
      drm/msm/dsi: use devm_clk_*register to registe DSI PHY clocks
      drm/msm/dsi: use devm_of_clk_add_hw_provider
      drm/msm/dsi: make save/restore_state phy-level functions
      drm/msm/dsi: drop vco_delay setting from 7nm, 10nm, 14nm drivers
      drm/msm/dpu: simplify vco_delay handling in dsi_phy_28nm driver
      drm/msi/dsi: inline msm_dsi_pll_helper_clk_prepare/unprepare
      drm/msm/dsi: make save_state/restore_state callbacks accept msm_dsi_phy
      drm/msm/dsi: drop msm_dsi_pll abstracton
      drm/msm/dsi: drop PLL accessor functions
      drm/msm/dsi: move ioremaps to dsi_phy_driver_probe
      drm/msm/dsi: remove duplicate fields from dsi_pll_Nnm instances
      drm/msm/dsi: remove temp data from global pll structure
      drm/msm/dsi: inline msm_dsi_phy_set_src_pll
      drm/msm/dsi: stop passing src_pll_id to the phy_enable call

 drivers/clk/clk-fixed-factor.c                  |   39 +-
 drivers/clk/clk-mux.c                           |   35 +
 drivers/gpu/drm/msm/Kconfig                     |    8 -
 drivers/gpu/drm/msm/Makefile                    |    9 -
 drivers/gpu/drm/msm/dsi/dsi.h                   |   60 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c              |    4 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c           |   30 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  161 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |   41 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  745 ++++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  939 ++++++++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      |   16 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  654 +++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  479 +++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  772 +++++++++++++++-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c           |  184 ----
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h           |  132 ---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c      |  881 ------------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c      | 1096 -----------------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c      |  643 -------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c |  526 -----------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c       |  913 -------------------
 include/linux/clk-provider.h                    |   34 +-
 23 files changed, 3732 insertions(+), 4669 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c


