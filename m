Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238CCC282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:04:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC1472175B
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:04:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ywwqSiGB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfA1SEn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 13:04:43 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:43666 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfA1SEn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 13:04:43 -0500
Received: by mail-wr1-f49.google.com with SMTP id r10so19097768wrs.10
        for <linux-clk@vger.kernel.org>; Mon, 28 Jan 2019 10:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KzNtDTjaKqI9Jv9d2VdDxDqv10i26x5+1d6Xbas7BmE=;
        b=ywwqSiGBHHAMtivWCMTz63VvsWcJkDVuOu444eYcJxyOXM6l7QHo7SR0kZ7trWAw6Z
         Dj+uUKwJJYCkvtwYvdKlcUFcjXLd8ZJHirfZvJ20LLdIRLoRguGYDzffDF6jEPbTpAdS
         44eKxUr14k4zPQvaIRaxfZ5RlmPFKRRGN4fNvKm/yCykYiQVFaRV/xE8y6RPmD3W8v44
         ABgsKWTucN4WWa6OJ2zAdIQDoM8vlHhGRGz43uto4bpMR23FOJDYEyH5PGHxJ8BrsSUW
         RhgTq0yp9jCpYnJlUVLULFDJg3ruabzynNmIK3cYV6WTUO1Y7y68QcEq4YwdyZyIm1P1
         wT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KzNtDTjaKqI9Jv9d2VdDxDqv10i26x5+1d6Xbas7BmE=;
        b=Fxr3XCrogT6hW5WND3ZvhxEDdZh0vkNbxVLVfyz57DCMRUTg4AH7g+hcTUvZKVZlw1
         2cY+tv35B0X2fI5CVWhYdlml3jZZoBSfQ3ZU+TgZ/8ya/WcEN8muMl18S1r4J2BJ7eQY
         RqQevy26IdTkBjZjpfm/jnarmjPZGmuSlUYIFgnEoGJ2QF+EXl3YcA2Tk8timEqMYjHU
         72OquD2KXPrWkFPXrAIduVhCPVZyGlARW6wi0fEGVIUGDPyxe+VifPM1jFPsFgUZqGrw
         TFWi4ak8n7PFNiLpgU9Hvrc6iAn1OMyyeDtGxE7MyNt1DlblYU5cLbIA0I6OTTzp9F4p
         jg9w==
X-Gm-Message-State: AJcUukcf+U1L4mT6ithmh9Zet7mZ/M4Qu8volQ33sTcjAyDNMQWS4ddb
        I4YJ6AGgAzGm+95OfgXZLpmg/g==
X-Google-Smtp-Source: ALg8bN6zuRuRmfEXj8PNM1eMQnbaZgjGdXS3lvonydlFr2RVbkqMa03NB99Vho7Hoz7TdM3JKkCmpw==
X-Received: by 2002:a5d:6647:: with SMTP id f7mr22600477wrw.225.1548698681545;
        Mon, 28 Jan 2019 10:04:41 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id p6sm145548193wrx.50.2019.01.28.10.04.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jan 2019 10:04:40 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/14] clk: meson: rework drivers dependencies
Date:   Mon, 28 Jan 2019 19:04:16 +0100
Message-Id: <20190128180430.28689-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The goal of this patchset to clean-up the dependencies between
the controllers and the different clock drivers provided in the meson
directory. The expected result is that each controllers can pick the
the clock drivers they need, without necessarily pulling everything.

This is becoming important as we are adding more and more controllers
to support new amlogic SoC.

Patch 1 and 2 are out of the meson directory, so we need an Ack from
Stephen or Mike on this.

Patch 4 to 14 is the actual rework. The intermediate state are provided
to make it a little less painful to review. In the end, Patch 4 to 14
should be squashed, keeping the commit message of patch 14.


Jerome Brunet (14):
  clk: export some clk_hw function symbols for module drivers
  clk: meson: use CONFIG_ARCH_MESON to enter meson clk directory
  clk: meson: axg-audio does not require syscon
  clk: meson: move MESON_GATE to clk-regmap.h
  clk: meson: move parm out of clkc
  clk: meson: take the pll driver out of clkc
  clk: meson: take the mpll driver out of clkc
  clk: meson: merge phase driver and remove from clkc
  clk: meson: take vid-pll-div out of clkc
  clk: meson: take dualdiv out of clkc
  clk: meson: take clk-input out of clkc
  clk: meson: clkc must die
  clk: meson: move sclk-div out of clkc-audio
  clk: meson: rework and clean drivers dependencies

 drivers/clk/Makefile                          |   2 +-
 drivers/clk/clk.c                             |   3 +
 drivers/clk/meson/Kconfig                     |  84 +++++++---
 drivers/clk/meson/Makefile                    |  21 ++-
 drivers/clk/meson/axg-aoclk.c                 |   4 +-
 drivers/clk/meson/axg-audio.c                 |   5 +-
 drivers/clk/meson/axg.c                       |   5 +-
 drivers/clk/meson/clk-dualdiv.c               |  10 +-
 drivers/clk/meson/clk-dualdiv.h               |  33 ++++
 drivers/clk/meson/clk-input.c                 |   7 +-
 drivers/clk/meson/clk-input.h                 |  19 +++
 drivers/clk/meson/clk-mpll.c                  |  12 +-
 drivers/clk/meson/clk-mpll.h                  |  30 ++++
 drivers/clk/meson/clk-phase.c                 |  75 ++++++++-
 drivers/clk/meson/clk-phase.h                 |  26 ++++
 drivers/clk/meson/clk-pll.c                   |  13 +-
 drivers/clk/meson/clk-pll.h                   |  43 ++++++
 drivers/clk/meson/clk-regmap.c                |   5 +
 drivers/clk/meson/clk-regmap.h                |  15 ++
 drivers/clk/meson/clk-triphase.c              |  68 --------
 drivers/clk/meson/clkc.h                      | 146 ------------------
 drivers/clk/meson/gxbb-aoclk.c                |   4 +-
 drivers/clk/meson/gxbb.c                      |   5 +-
 drivers/clk/meson/meson-aoclk.c               |   2 +
 drivers/clk/meson/meson-aoclk.h               |   5 +-
 drivers/clk/meson/meson8b.c                   |   3 +-
 drivers/clk/meson/parm.h                      |  46 ++++++
 drivers/clk/meson/sclk-div.c                  |  10 +-
 .../clk/meson/{clkc-audio.h => sclk-div.h}    |  16 +-
 drivers/clk/meson/vid-pll-div.c               |  10 +-
 drivers/clk/meson/vid-pll-div.h               |  20 +++
 31 files changed, 467 insertions(+), 280 deletions(-)
 create mode 100644 drivers/clk/meson/clk-dualdiv.h
 create mode 100644 drivers/clk/meson/clk-input.h
 create mode 100644 drivers/clk/meson/clk-mpll.h
 create mode 100644 drivers/clk/meson/clk-phase.h
 create mode 100644 drivers/clk/meson/clk-pll.h
 delete mode 100644 drivers/clk/meson/clk-triphase.c
 delete mode 100644 drivers/clk/meson/clkc.h
 create mode 100644 drivers/clk/meson/parm.h
 rename drivers/clk/meson/{clkc-audio.h => sclk-div.h} (54%)
 create mode 100644 drivers/clk/meson/vid-pll-div.h

-- 
2.20.1

