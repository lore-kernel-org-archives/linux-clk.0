Return-Path: <SRS0=tn1a=YW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49442CA9EAE
	for <linux-clk@archiver.kernel.org>; Tue, 29 Oct 2019 14:13:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 165832087F
	for <linux-clk@archiver.kernel.org>; Tue, 29 Oct 2019 14:13:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qdbylPBM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbfJ2ONP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Oct 2019 10:13:15 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:40644 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388274AbfJ2ONP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Oct 2019 10:13:15 -0400
Received: by mail-wm1-f45.google.com with SMTP id w9so2578466wmm.5
        for <linux-clk@vger.kernel.org>; Tue, 29 Oct 2019 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=user-agent:from:to:cc:subject:date:message-id:mime-version;
        bh=FFSlQWpI7UYBhGJZmYafwOetjRk3Pi2G+CPwDCZIHmk=;
        b=qdbylPBMd1wiIcELFTDTOf1UntxHVkifMPuvGD2tFgeXoXWvxRR0hp8kmcyJnQaaki
         z7LaKmVCcU+M9IfswnizRiX8kVDl5bhhKGsxom+0rVpq1w2VQpfaeLEK0JyhP8UyrIad
         49aMB56iQGf1ixij6VE8Ggk7UaIUXZheAq3Fpj9HhcaV47oRyQb0TN97FsUMl9rE/UM8
         xAloxhFrTrxbAui4CkHuGEqg80SHGB/2C81LEOqgbo+BS68b8vYQOKK2WG6DBCeNqrrY
         XJ2z7or15l7F0xLUj7FXgpSZXswbSNHS24lKUcjIWe6BaAKBCXwpO1QflS1mM0/69wC0
         4VfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
         :mime-version;
        bh=FFSlQWpI7UYBhGJZmYafwOetjRk3Pi2G+CPwDCZIHmk=;
        b=FnLuIhAaTunKUdPhxVyoZjIYmTlTpWoEWT9iz89yj+th0a4tv8i+ltk2Woa6EMFh9z
         wZDvXdbLvgCeariICr7AibNhoDBqZMxNvE4kBLGEbjF9FQQPzx5Ue0XD5gHaXonE/7dE
         oi2Rc2VaXX2OzZqDaFPTD5wKauxkB4x8FwpyIttMi60xFDAQ/buiUqnkgAZnuTudVcN8
         I9FOxdKMPeWeaPFaOULFyGZpVF374bfjUqfGFAuMxJiVTn50Y4suC5N0/IMTltQwxJ1l
         hua8so0ARFTlYWnshUILm57i6zZndOW2WTTgmuMihQn9/4wC03/oRiWiTDtS03IHIom1
         H8DA==
X-Gm-Message-State: APjAAAW/C+CEbGiyaUTsowWqUuxeeCMKo8PLfL/FxcSstvGWIkKTGCj0
        0yx6cDkYd6oBZUFBt3k1jBWDgEZhjaM=
X-Google-Smtp-Source: APXvYqyB45wTMPlw7B5AIHR/+zcb1QJV0BIuol4jBgYN1VBZzXNW8RGW0TvGK2DCsMW7t4r4pLQelg==
X-Received: by 2002:a1c:1b07:: with SMTP id b7mr4325462wmb.111.1572358393542;
        Tue, 29 Oct 2019 07:13:13 -0700 (PDT)
Received: from localhost (uluru.liltaz.com. [163.172.81.188])
        by smtp.gmail.com with ESMTPSA id t16sm16546074wrq.52.2019.10.29.07.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 07:13:13 -0700 (PDT)
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: [GIT PULL]: Amlogic clock updates for v5.5
Date:   Tue, 29 Oct 2019 15:13:12 +0100
Message-ID: <1jftjbljwn.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi Stephen,

Here are our updates for Amlogic clock for this cycle.
The main topic is sm1 soc family support in the audio
clock controller
Please pull.

Thanks
Jerome

The following changes since commit 90b171f6035688236a3f09117a683020be45603a:

  clk: meson: g12a: set CLK_MUX_ROUND_CLOSEST on the cpu clock muxes (2019-10-01 14:51:15 +0200)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.5-1

for you to fetch changes up to 50bf025b75902d326fdb8078be3d278e1b693576:

  clk: meson: axg-audio: use devm_platform_ioremap_resource() to simplify code (2019-10-14 17:06:27 +0200)

----------------------------------------------------------------
First round of amlogic clock update for v5.5:
Add sm1 support in the audio clock controller

----------------------------------------------------------------
Jerome Brunet (8):
      dt-bindings: clk: axg-audio: add sm1 bindings
      dt-bindings: clock: meson: add sm1 resets to the axg-audio controller
      Merge branch 'v5.5/dt' into v5.5/drivers
      clk: meson: axg-audio: remove useless defines
      clk: meson: axg-audio: fix regmap last register
      clk: meson: axg-audio: prepare sm1 addition
      clk: meson: axg-audio: provide clk top signal name
      clk: meson: axg_audio: add sm1 support

YueHaibing (1):
      clk: meson: axg-audio: use devm_platform_ioremap_resource() to simplify code

 .../bindings/clock/amlogic,axg-audio-clkc.txt      |    3 +-
 drivers/clk/meson/axg-audio.c                      | 2025 +++++++++++++-------
 drivers/clk/meson/axg-audio.h                      |   21 +-
 include/dt-bindings/clock/axg-audio-clkc.h         |   10 +
 .../reset/amlogic,meson-g12a-audio-reset.h         |   15 +
 5 files changed, 1374 insertions(+), 700 deletions(-)
