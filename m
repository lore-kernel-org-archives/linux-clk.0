Return-Path: <SRS0=MqlC=IF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892F2C433E9
	for <linux-clk@archiver.kernel.org>; Sun,  7 Mar 2021 14:18:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57DF865104
	for <linux-clk@archiver.kernel.org>; Sun,  7 Mar 2021 14:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbhCGOSX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 7 Mar 2021 09:18:23 -0500
Received: from aposti.net ([89.234.176.197]:51610 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230184AbhCGOSO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 7 Mar 2021 09:18:14 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 0/6] clk: Ingenic JZ4760(B) support
Date:   Sun,  7 Mar 2021 14:17:53 +0000
Message-Id: <20210307141759.30426-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Here are a set of patches to add support for the Ingenic JZ4760(B) SoCs.

One thing to note is that the ingenic,jz4760-tcu is undocumented for now,
as I will update the TCU documentation in a different patchset.

Zhou: the CGU code now supports overriding the PLL M/N/OD calc
algorithm, please tell me if it works for you.

Cheers,
-Paul

Paul Cercueil (6):
  dt-bindings: clock: ingenic: Add ingenic,jz4760{,b}-cgu compatibles
  clk: Support bypassing dividers
  clk: ingenic: Read bypass register only when there is one
  clk: ingenic: Remove pll_info.no_bypass_bit
  clk: ingenic: Support overriding PLLs M/N/OD calc algorithm
  clk: ingenic: Add support for the JZ4760

 .../bindings/clock/ingenic,cgu.yaml           |   4 +
 drivers/clk/ingenic/Kconfig                   |  10 +
 drivers/clk/ingenic/Makefile                  |   1 +
 drivers/clk/ingenic/cgu.c                     |  92 ++--
 drivers/clk/ingenic/cgu.h                     |  12 +-
 drivers/clk/ingenic/jz4725b-cgu.c             |  12 +-
 drivers/clk/ingenic/jz4740-cgu.c              |  12 +-
 drivers/clk/ingenic/jz4760-cgu.c              | 433 ++++++++++++++++++
 drivers/clk/ingenic/jz4770-cgu.c              |  15 +-
 drivers/clk/ingenic/tcu.c                     |   2 +
 include/dt-bindings/clock/jz4760-cgu.h        |  54 +++
 11 files changed, 591 insertions(+), 56 deletions(-)
 create mode 100644 drivers/clk/ingenic/jz4760-cgu.c
 create mode 100644 include/dt-bindings/clock/jz4760-cgu.h

-- 
2.30.1

