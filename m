Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1B1C001DC
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:32:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbjG0Fcd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjG0Fcc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:32:32 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B88E1FDA
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:32:30 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-686daaa5f1fso438340b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690435950; x=1691040750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KUys1cDp/2h7CG55/Ytj4NCRarR8kFAc8HIBwQgZbvA=;
        b=V0hWqsPPDiPMT83R1pVfVCMYSrBLqz6mc6EmFuwO1yCN/iNQXE1//W7WibzJPN9xRF
         j89axna4imoV+P9Ciz31Ax/8HEG8TRDt11HxGIU4+7WOtcIhyiYNmUHeGAGlpYzk+zTM
         2RMn5LAbKbUOUapiC9PLwlCbTJn75OltqI1svRLv284ezFzAJlgdQWtlxxDDUl6ck4HI
         TPcoOctqsFpUkTvRCAgXtu8jRX3UBZ6UzwT8DiSV4GpvO28Tu1LAfMzB61/NweQTMgkh
         CPV6EZLjSvbSs+mUCmok0UrUtzL5376P2FIqKmlHFyVZQwa6L6djZbXvQNB2SYuVd2bf
         m9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690435950; x=1691040750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUys1cDp/2h7CG55/Ytj4NCRarR8kFAc8HIBwQgZbvA=;
        b=eBOXhaXnQ9BZ/QxtaMM0jREbz8qol0KdoGlOU3uRKYNWDYjSp1tBk69C1rOlJ8YX0f
         5DddhgaU+jyPGCCtvoG7++QfOSoOeu5UzzFiVmCFUAL7qlaRZSALRvGZE1zxsWkcthXR
         LJeKHipJrvyXU2sgPTFvKCMt336r0FQosPmhG3UhKxQ4jpknZsTCUdNr9rh8w1N6ArLw
         YwJQriKOfHFgViu35LjOugr/+0weQf8HO0KDdc5ItUFwKb/Zbg2+dcE6xuj36I5Rs66Z
         cjL11Yr+jqCF9u+AAIh6gj/1XxP8MCDLSonjygNfNfv39SfLBd+ym8moAkjNdgaNB+RC
         Cmnw==
X-Gm-Message-State: ABy/qLaz/feNU2POTI22SyXU7vQ0CHGBGn32/rx62mOOPfVyci8Fttmg
        jyLuJHFCgPaif3X3Nyb/m6emGq47s+gi53aVlXNtdmN7
X-Google-Smtp-Source: APBJJlGE9hhTvh6wkyKNJHhZ7YJNkDle/Tksp17wSJxgHShpBSYKh+2gLuxRxwhUauESUzKZfUPPrg==
X-Received: by 2002:a05:6a20:b70a:b0:132:87ab:42d5 with SMTP id fg10-20020a056a20b70a00b0013287ab42d5mr3296876pzb.35.1690435949763;
        Wed, 26 Jul 2023 22:32:29 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:32:29 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 00/42] clk: at91: add support for parent_data and parent_hw (take #2)
Date:   Thu, 27 Jul 2023 08:31:14 +0300
Message-Id: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Series adds support for parent data and parent_hw on the remaining AT91
clock drivers. Along with it a fix for SAMA7G5 has been introduced
(patch 1/42).

Series has been tested on SAM9X60 and SAMA5D2 SoCs.

Thank you,
Claudiu Beznea

Claudiu Beznea (42):
  clk: at91: sama7g5: check __clk_get_hw() argument for errors
  clk: at91: clk-usb: add support for parent_hw
  clk: at91: sam9x60: switch to parent_hw and parent_data
  clk: at91: sam9x60: make checkpatch.pl happy
  clk: at91: clk-pll: add support for parent_hw
  clk: at91: clk-audio-pll: add support for parent_hw
  clk: at91: clk-plldiv: add support for parent_hw
  clk: at91: clk-h32mx: add support for parent_hw
  clk: at91: clk-i2s-mux: add support for parent_hw
  clk: at91: sama5d2: switch to parent_hw and parent_data
  clk: at91: clk-smd: add support for parent_hw
  clk: at91: sama5d3: switch to parent_hw and parent_data
  clk: at91: sama5d3: make checkpatch.pl happy
  clk: at91: sama5d4: switch to parent_hw and parent_data
  clk: at91: at91sam9x5: switch to parent_hw and parent_data
  clk: at91: at91rm9200: switch to parent_hw and parent_data
  clk: at91: at91rm9200: fix checkpatch.pl check
  clk: at91: at91rm9200: fix checkpatch.pl check
  clk: at91: clk-slow: add support for parent_hw
  clk: at91: at91sam9260: switch to parent_hw and parent_data
  clk: at91: at91sam9g45: switch to parent_hw and parent_data
  clk: at91: at91sam9g45: fix checkpatch.pl check
  clk: at91: at91sam9n12: switch to parent_hw and parent_data
  clk: at91: at91sam9n12: remove checkpatch.pl checks
  clk: at91: at91sam9rl: switch to parent_hw
  clk: at91: dt-compat: switch to parent_hw and parent_data
  clk: at91: clk-audio-pll: remove parent_names support
  clk: at91: clk-generated: remove parent_names support
  clk: at91: clk-h32mx: remove parent_names support
  clk: at91: clk-i2s-mux: remove parent_names support
  clk: at91: clk-main: remove parent_names support
  clk: at91: clk-master: remove parent_names support
  clk: at91: clk-peripheral: remove parent_names support
  clk: at91: clk-pll: remove parent_names support
  clk: at91: clk-plldiv: remove parent_names support
  clk: at91: clk-programmable: remove parent_names support
  clk: at91: clk-sam9x60-pll: remove parent_names support
  clk: at91: clk-slow: remove parent_names support
  clk: at91: clk-smd: remove parent_names support
  clk: at91: clk-system: remove parent_names support
  clk: at91: clk-usb: remove parent_names support
  clk: at91: clk-utmi: remove parent_names support

 drivers/clk/at91/at91rm9200.c       | 101 +++++----
 drivers/clk/at91/at91sam9260.c      | 140 ++++++------
 drivers/clk/at91/at91sam9g45.c      |  94 ++++----
 drivers/clk/at91/at91sam9n12.c      | 113 +++++-----
 drivers/clk/at91/at91sam9rl.c       |  71 +++---
 drivers/clk/at91/at91sam9x5.c       | 123 ++++++-----
 drivers/clk/at91/clk-audio-pll.c    |  16 +-
 drivers/clk/at91/clk-generated.c    |  10 +-
 drivers/clk/at91/clk-h32mx.c        |   8 +-
 drivers/clk/at91/clk-i2s-mux.c      |   5 +-
 drivers/clk/at91/clk-main.c         |  24 +-
 drivers/clk/at91/clk-master.c       |  23 +-
 drivers/clk/at91/clk-peripheral.c   |  20 +-
 drivers/clk/at91/clk-pll.c          |   6 +-
 drivers/clk/at91/clk-plldiv.c       |   8 +-
 drivers/clk/at91/clk-programmable.c |  10 +-
 drivers/clk/at91/clk-sam9x60-pll.c  |  16 +-
 drivers/clk/at91/clk-slow.c         |   8 +-
 drivers/clk/at91/clk-smd.c          |   7 +-
 drivers/clk/at91/clk-system.c       |   9 +-
 drivers/clk/at91/clk-usb.c          |  30 +--
 drivers/clk/at91/clk-utmi.c         |  23 +-
 drivers/clk/at91/dt-compat.c        | 330 +++++++++++++++++++---------
 drivers/clk/at91/pmc.h              |  64 +++---
 drivers/clk/at91/sam9x60.c          | 124 ++++++-----
 drivers/clk/at91/sama5d2.c          | 165 +++++++-------
 drivers/clk/at91/sama5d3.c          | 126 ++++++-----
 drivers/clk/at91/sama5d4.c          | 131 ++++++-----
 drivers/clk/at91/sama7g5.c          |  45 ++--
 29 files changed, 1032 insertions(+), 818 deletions(-)

-- 
2.39.2

