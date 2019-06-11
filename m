Return-Path: <SRS0=yexa=UK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B28C43218
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jun 2019 12:38:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17BAA2089E
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jun 2019 12:38:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CZ9GRlYp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbfFKMiU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Jun 2019 08:38:20 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:40890 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfFKMiU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jun 2019 08:38:20 -0400
Received: by mail-wr1-f47.google.com with SMTP id p11so12848150wre.7
        for <linux-clk@vger.kernel.org>; Tue, 11 Jun 2019 05:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=ua8dbQ0PYMtOfmOmHj3FX1FYigU/RZxoFrS9hw3wCAQ=;
        b=CZ9GRlYpaqHJpE3ea2eQKpeffCqvJwydOasniw/mWTGIYb2/7Q9jQEBjRnA6q7yLz9
         9WeZHyMwCYqaLq9gpJ/n5SFpyQtm7/kTidZGOi3FryD5iUN4txd71STUpNFuCrPvQ6f7
         S4EV9gPCkxudayX5Q5qOJ/qi1sUBRQxY9ZqpfqH/uIuT2eOarVkPXuRN+H2ii20y34QD
         /D7z3WqZ4Su0KTEisKVqzn8Nb6DxJejnHeotlUtQ9qRBpYsa5qH+2WBvTQM0NvvjHBqG
         9sb+9LU2kJcr1EqQ/DaRBuczU6mjS/HqmyQFPMavCkV/p6XlZ3aTWvdi3Zy5uIgLLeZV
         PWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=ua8dbQ0PYMtOfmOmHj3FX1FYigU/RZxoFrS9hw3wCAQ=;
        b=DtuSNd3eaVVedMuPSjv/CwZEdZBgV2v0WhCciD9WF+hLQolKUD8FKaH3DlvXRAbFYo
         8pdbAbTIXvzXI3jidgGwmwZ26gqSVbDH0sLe93o6/ope2meKOJXoFhEQNPSApMpfrzNz
         63CAoK9EzpHJDqPIASy3704Te8j6xxRyb/jA6no7A4R0GZmvA2uTlwV5d5v2Kz/JV0Ax
         a2h5yUAXhbfUXE5GPrc3Z6vYM3VPifxV3Y5ZogosqO9Mqq6fp96zFZo6GV64qYtBbULx
         zdi53kOfGKxYrEDYRZk19opAokupSXIxSYOUvhEnlRr5w37LSLbbpra8ingo6svEyOS3
         EYhg==
X-Gm-Message-State: APjAAAVRUQuVxbrFyMXz8WedDAFacWl9nmkt4qSW9bMbTBnTNkofRhLb
        OWBHk/hhd6MXi+QUby0VvyoqHg==
X-Google-Smtp-Source: APXvYqyWtPPjjPWqEp7Z0mPXz8EwfU+kOhNinox32AhFZYRHexAJvfx90c/9HQU008uxA30BgBwutg==
X-Received: by 2002:a5d:6242:: with SMTP id m2mr4824737wrv.310.1560256698779;
        Tue, 11 Jun 2019 05:38:18 -0700 (PDT)
Received: from boomer.baylibre.com (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id g8sm2770805wmf.17.2019.06.11.05.38.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 05:38:18 -0700 (PDT)
Message-ID: <39ccc93ddd8bc64af85541086190e563fa13f038.camel@baylibre.com>
Subject: [GIT PULL] clk: meson: update for v5.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Kevin Hilman <khilman@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Date:   Tue, 11 Jun 2019 14:38:17 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dear clock maintainers,

Below is a request to pull Amlogic clock update for v5.3 based on the fixes
we just send. This update add the init() callback to the mpll clock driver
as discussed in the previous cycle. As promised, the rework to register/deregister
will follow.

Apart from this, we've got a fairly regular update, adding a bunch of new
clocks to several SoC families. It also adds support for g12b derived from the
g12a, which explains the significant line count in the g12a file.

The following changes since commit 3ff46efbcd90d3d469de8eddaf03d12293aaa50c:

  clk: meson: meson8b: fix a typo in the VPU parent names array variable (2019-05-20 12:11:08 +0200)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.3-1

for you to fetch changes up to eda91833f099277998814105c77b5b12cbfab6db:

  clk: meson: g12a: mark fclk_div3 as critical (2019-06-11 11:28:44 +0200)

----------------------------------------------------------------
Fix mpll fractional part and spread sprectrum issues
Add meson8 audio clocks
Add g12a temperature sensors clocks
Add g12a and g12b cpu clocks

----------------------------------------------------------------
Guillaume La Roque (2):
      dt-bindings: clk: g12a-clkc: add Temperature Sensor clock IDs
      clk: meson-g12a: add temperature sensor clocks

Jerome Brunet (10):
      clk: meson: mpll: properly handle spread spectrum
      clk: meson: gxbb: no spread spectrum on mpll0
      clk: meson: axg: spread spectrum is on mpll2
      clk: meson: mpll: add init callback and regs
      clk: meson: g12a: add mpll register init sequences
      clk: meson: eeclk: add init regs
      clk: meson: g12a: add controller register init
      Merge branch 'v5.3/dt' into v5.3/drivers
      Merge branch 'v5.3/dt' into v5.3/drivers
      Merge branch 'v5.3/dt' into v5.3/drivers

Martin Blumenstingl (4):
      dt-bindings: clock: meson8b: add the audio clocks
      clk: meson: meson8b: add the cts_amclk clocks
      clk: meson: meson8b: add the cts_mclk_i958 clocks
      clk: meson: meson8b: add the cts_i958 clock

Neil Armstrong (3):
      dt-bindings: clk: meson: add g12b periph clock controller bindings
      clk: meson: g12a: Add support for G12B CPUB clocks
      clk: meson: g12a: mark fclk_div3 as critical

 .../bindings/clock/amlogic,gxbb-clkc.txt           |   1 +
 drivers/clk/meson/axg.c                            |  10 +-
 drivers/clk/meson/clk-mpll.c                       |  36 +-
 drivers/clk/meson/clk-mpll.h                       |   3 +
 drivers/clk/meson/g12a.c                           | 843 ++++++++++++++++++++-
 drivers/clk/meson/g12a.h                           |  41 +-
 drivers/clk/meson/gxbb.c                           |   5 -
 drivers/clk/meson/meson-eeclk.c                    |   3 +
 drivers/clk/meson/meson-eeclk.h                    |   2 +
 drivers/clk/meson/meson8b.c                        | 154 ++++
 drivers/clk/meson/meson8b.h                        |   8 +-
 include/dt-bindings/clock/g12a-clkc.h              |   1 +
 include/dt-bindings/clock/meson8b-clkc.h           |   3 +
 13 files changed, 1083 insertions(+), 27 deletions(-)

