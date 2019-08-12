Return-Path: <SRS0=0MvX=WI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECF4C31E40
	for <linux-clk@archiver.kernel.org>; Mon, 12 Aug 2019 09:27:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C9E8E20820
	for <linux-clk@archiver.kernel.org>; Mon, 12 Aug 2019 09:27:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RrLAVjZF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfHLJ1b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Aug 2019 05:27:31 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44122 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbfHLJ1b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Aug 2019 05:27:31 -0400
Received: by mail-wr1-f67.google.com with SMTP id p17so103929377wrf.11
        for <linux-clk@vger.kernel.org>; Mon, 12 Aug 2019 02:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=GR8qazzT8f+x8TL8FuamVXWkhCPQ1djbAEb+Khg42sE=;
        b=RrLAVjZF5SLIr6VfF2oWZrWLYXA8e5cWwLgTx36VNXuqgTLeQQ/SQfWRcHiJYyfUrA
         IGv/Lxu16lKhAm6B0AgwWIDyTct+pV0UiTJu5MeFxriXbDUie6XScNXpKOV35k7R1+F0
         OusIDfq8L3juao3bjzzwYcFGWmwlwOHH+z70XkFLFWUN/v4olG6VbkCdvFJDli5OcZo4
         ov+yk7AOiAW5DCcVFdUiiwxmWRUQc8pu/gMnFBL7Zx1Pzjn/n5iwaOH2fPOaN3kIoStf
         UnywNeArFDSMizKAfArpadSUz2WNoqg8NVbkL7Sbtt4lv8qvoBSGvu7TpJ2Y9fB2XXkB
         T+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=GR8qazzT8f+x8TL8FuamVXWkhCPQ1djbAEb+Khg42sE=;
        b=iWTWnt8V8rSjP/MGaCh/WBZv6A+ICHBgGRLG39Tl01mrj/1rvqs435pO06fG//7Vx3
         2vXT+c9W9IVD+qsUbfYvqvZUZQR6Q33vvAx4DV3kdqz/abH0GGuNHnLvuV0cbT1AiB0k
         Zg3RyiBNbGRNhnNdh2esyMkJ7mcpB4H4t6z83bdBAJW6foNQ8Pnd7QeGsPPuRh5xkyHl
         wmEHiTSWvB24Mf8Yoh210gzKJvHBVRxtVsUvlzYHMgd6cJfXTdfdfTQIuUVw3sVLgf0G
         6FRDZ+rsokRW6FROTcgaunP5kQHIRnMMmQ5Mu5kcTdz32cnF8T+1OA8UmlskUGLe659X
         8glw==
X-Gm-Message-State: APjAAAUesg5tygI7GYr5pY5DTX94f8RelGEp5IIG6o0rvPdwQXm+N1Wt
        0BXhpwm/MvD2589+T9O9AdReUA==
X-Google-Smtp-Source: APXvYqwNXwv21TNgxSZ+0VY405tXAlYYxJaz7T+p7H+h/IRdCcNfuHJdCdbF82S7YVCmO7WqJh4xzg==
X-Received: by 2002:adf:eb4e:: with SMTP id u14mr39668555wrn.168.1565602048674;
        Mon, 12 Aug 2019 02:27:28 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id p9sm4940942wru.61.2019.08.12.02.27.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 02:27:28 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] clk: meson: updates for 5.4
Date:   Mon, 12 Aug 2019 11:27:27 +0200
Message-ID: <1jr25qivi8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Dear clock maintainers,

Below is a request to pull Amlogic clock updates for v5.4.

The main changes in this PR are the migration to the new parent
description method and DVFS support on g12, based on notifiers.

Kevin requested a tag to test DVFS so sending the PR now so he can use
it well. We may send additional changes later on.

Cheers
Jerome

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.4-1

for you to fetch changes up to 1d97657a4794ab23b47bd9921978ddd82569fcf4:

  Merge branch 'v5.4/dt' into v5.4/drivers (2019-08-09 12:12:58 +0200)

----------------------------------------------------------------
Amlogic clock changes for v5.4

* Migrate to new clock description method
* Add DVFS support to g12

----------------------------------------------------------------
Alexandre Mergnat (13):
      clk: meson: g12a: fix hifi typo in mali parent_names
      clk: meson: axg-audio: migrate to the new parent description method
      clk: meson: g12a-aoclk: migrate to the new parent description method
      clk: meson: gxbb-aoclk: migrate to the new parent description method
      clk: meson: axg-aoclk: migrate to the new parent description method
      clk: meson: remove ao input bypass clocks
      clk: meson: g12a: migrate to the new parent description method
      clk: meson: gxbb: migrate to the new parent description method
      clk: meson: axg: migrate to the new parent description method
      clk: meson: meson8b: migrate to the new parent description method
      clk: meson: clk-regmap: migrate to new parent description method
      clk: meson: remove ee input bypass clocks
      clk: meson: remove clk input helper

Jerome Brunet (1):
      Merge branch 'v5.4/dt' into v5.4/drivers

Neil Armstrong (4):
      clk: core: introduce clk_hw_set_parent()
      clk: meson: add g12a cpu dynamic divider driver
      clk: meson: g12a: add notifiers to handle cpu clock change
      clk: meson: g12a: expose CPUB clock ID for G12B

 drivers/clk/clk.c                     |    6 +
 drivers/clk/meson/Kconfig             |   11 +-
 drivers/clk/meson/Makefile            |    2 +-
 drivers/clk/meson/axg-aoclk.c         |   63 +-
 drivers/clk/meson/axg-audio.c         |  261 +++---
 drivers/clk/meson/axg.c               |  207 +++--
 drivers/clk/meson/clk-cpu-dyndiv.c    |   73 ++
 drivers/clk/meson/clk-cpu-dyndiv.h    |   20 +
 drivers/clk/meson/clk-input.c         |   49 -
 drivers/clk/meson/clk-input.h         |   19 -
 drivers/clk/meson/clk-regmap.h        |   12 +-
 drivers/clk/meson/g12a-aoclk.c        |   81 +-
 drivers/clk/meson/g12a.c              | 1626 ++++++++++++++++++++++++---------
 drivers/clk/meson/g12a.h              |    1 -
 drivers/clk/meson/gxbb-aoclk.c        |   55 +-
 drivers/clk/meson/gxbb.c              |  657 +++++++++----
 drivers/clk/meson/meson-aoclk.c       |   37 -
 drivers/clk/meson/meson-aoclk.h       |    8 -
 drivers/clk/meson/meson-eeclk.c       |   10 -
 drivers/clk/meson/meson-eeclk.h       |    2 -
 drivers/clk/meson/meson8b.c           |  710 +++++++++-----
 include/dt-bindings/clock/g12a-clkc.h |    1 +
 include/linux/clk-provider.h          |    1 +
 23 files changed, 2626 insertions(+), 1286 deletions(-)
 create mode 100644 drivers/clk/meson/clk-cpu-dyndiv.c
 create mode 100644 drivers/clk/meson/clk-cpu-dyndiv.h
 delete mode 100644 drivers/clk/meson/clk-input.c
 delete mode 100644 drivers/clk/meson/clk-input.h
