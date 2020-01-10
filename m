Return-Path: <SRS0=Bq/F=27=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10E3C282DD
	for <linux-clk@archiver.kernel.org>; Fri, 10 Jan 2020 16:11:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84DFD206ED
	for <linux-clk@archiver.kernel.org>; Fri, 10 Jan 2020 16:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0KIDPA3k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgAJQLq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Jan 2020 11:11:46 -0500
Received: from mail-wm1-f54.google.com ([209.85.128.54]:39717 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728408AbgAJQLq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Jan 2020 11:11:46 -0500
Received: by mail-wm1-f54.google.com with SMTP id 20so2548567wmj.4
        for <linux-clk@vger.kernel.org>; Fri, 10 Jan 2020 08:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=user-agent:from:to:cc:subject:date:message-id:mime-version;
        bh=11CBeVx0qG2qVwiQYzkWGfj3hi25ILYcyR118XXNZfM=;
        b=0KIDPA3k6hM19fhd3wV4dg4R6+PIUPXb0JNDvXktMvDixTehCJqFmxFGbjBvRGTn/a
         hPPbPMoW5KnnH35V5t5q37OU+fOkboVn43+Wfyw3J2tB9ykhUk2SfTFTWr1orL9Xeqq7
         UU1DvT8R+Qj4SBbeVxibYwx/YOghcGdro1/sV/DHr20L8+H7TlXmKGQGqqymtR0+NvXO
         6fWvrmtm4WORl+ROmc3V7G4KaPfvKpbzQRBIVy8XAIMvMVcZ6mhLzbKpXSCtQWyTVvYw
         K9YID78dEy4MTviHeuxJ9GZ+f/+K4pQ1eHxKmQBGC8Qv8MLBmZoIYBqQMCGsRDQ+pE0S
         g6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
         :mime-version;
        bh=11CBeVx0qG2qVwiQYzkWGfj3hi25ILYcyR118XXNZfM=;
        b=Hk0LgDJcZ9kcFDk9UPNKgkAt1/+wR2/ZRmkL9chN7AnsmNUZVj/Rf5iPXk3dKNjp11
         C6FZ4B7JCdub4u9zeU8BzayW3uacvUrnw6inBqRbdYjGXWBzC31MvyTUyPBG6/o7Gje2
         qEo+mCFZwNX3vBxPrA6v+wHGSCXqOEOikPJTJ5zzGjudaR5Op0GcU5dmCX0IeuxDSxST
         BAjW8SQqNOni4D7DZC8yPSlRGCo1y2MJEBGgoId8MCVFAyYnHzH4XYjvBzMbZTSJ8YtM
         +dYvhjzelJjn2+H6pG0SUGtUV/Rflut+n0n65Jb+Qn3vwO5ZIRVtLQc/hqttmYflIkyf
         Ha/Q==
X-Gm-Message-State: APjAAAWtQDGaliyikLRLT/Rz+3cF02R58GQClUL1jAKTOMijuOnUE7Wx
        shQgwCi/1u/EuUsH05FL/sZd4w==
X-Google-Smtp-Source: APXvYqwVR7JRuUkKA5QJmBxEY0+sSIt5jRCWtZzf6A0xlR5i8Dy47hKoLjJSgIg2vQ9n6xNxHw1+FA==
X-Received: by 2002:a1c:20d6:: with SMTP id g205mr5260601wmg.38.1578672703762;
        Fri, 10 Jan 2020 08:11:43 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d8sm2701059wre.13.2020.01.10.08.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 08:11:42 -0800 (PST)
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: [GIT PULL]: Amlogic clock updates for v5.6
Date:   Fri, 10 Jan 2020 17:11:42 +0100
Message-ID: <1j5zhj70ld.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen

Here are the updates for the amlogic clocks for this cycle.
The bulk of it is a clean up of the 32bits SoC clock controllers by
Martin.

Cheers
Jerome

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.6-1

for you to fetch changes up to 64c76b31774db5a0c0ce8df13aef618912136e32:

  clk: clarify that clk_set_rate() does updates from top to bottom (2020-01-07 11:31:47 +0100)

----------------------------------------------------------------
Amlogic clock updates for v5.6:
* Add meson8b DDR clock controller
* Add input clocks to meson8b controllers
* Fix meson8b mali clock update using the glitch free mux
* Fix pll driver division by zero init

----------------------------------------------------------------
Jerome Brunet (2):
      clk: meson: g12a: fix missing uart2 in regmap table
      Merge branch 'v5.5/fixes' into v5.6/drivers

Martin Blumenstingl (9):
      dt-bindings: clock: add the Amlogic Meson8 DDR clock controller binding
      dt-bindings: clock: meson8b: add the clock inputs
      clk: meson: add a driver for the Meson8/8b/8m2 DDR clock controller
      clk: meson: meson8b: use clk_hw_set_parent in the CPU clock notifier
      clk: meson: meson8b: change references to the XTAL clock to use [fw_]name
      clk: meson: meson8b: don't register the XTAL clock when provided via OF
      clk: meson: meson8b: use of_clk_hw_register to register the clocks
      clk: meson: meson8b: make the CCF use the glitch-free mali mux
      clk: clarify that clk_set_rate() does updates from top to bottom

Remi Pommarel (1):
      clk: meson: pll: Fix by 0 division in __pll_params_to_rate()

 .../bindings/clock/amlogic,meson8-ddr-clkc.yaml    |  50 +++++++
 .../bindings/clock/amlogic,meson8b-clkc.txt        |   5 +
 drivers/clk/meson/Makefile                         |   2 +-
 drivers/clk/meson/clk-pll.c                        |   9 ++
 drivers/clk/meson/g12a.c                           |   1 +
 drivers/clk/meson/meson8-ddr.c                     | 149 +++++++++++++++++++++
 drivers/clk/meson/meson8b.c                        | 124 +++++++++--------
 include/dt-bindings/clock/meson8-ddr-clkc.h        |   4 +
 include/linux/clk.h                                |   3 +
 9 files changed, 291 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
 create mode 100644 drivers/clk/meson/meson8-ddr.c
 create mode 100644 include/dt-bindings/clock/meson8-ddr-clkc.h
