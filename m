Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62005C47091
	for <linux-clk@archiver.kernel.org>; Sun, 30 May 2021 16:49:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25AEC611F0
	for <linux-clk@archiver.kernel.org>; Sun, 30 May 2021 16:49:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhE3QvP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 May 2021 12:51:15 -0400
Received: from aposti.net ([89.234.176.197]:33392 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229599AbhE3QvO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 30 May 2021 12:51:14 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 0/6] clk: Ingenic JZ4760(B) support
Date:   Sun, 30 May 2021 17:49:17 +0100
Message-Id: <20210530164923.18134-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Here is (finally) my v2 of the JZ4760(B) patchset.

Patches 1-5 are the exact same as in v1.

Patch 6's algorithm was updated with Zhou's feedback.

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
 drivers/clk/ingenic/jz4760-cgu.c              | 428 ++++++++++++++++++
 drivers/clk/ingenic/jz4770-cgu.c              |  15 +-
 drivers/clk/ingenic/tcu.c                     |   2 +
 include/dt-bindings/clock/jz4760-cgu.h        |  54 +++
 11 files changed, 586 insertions(+), 56 deletions(-)
 create mode 100644 drivers/clk/ingenic/jz4760-cgu.c
 create mode 100644 include/dt-bindings/clock/jz4760-cgu.h

-- 
2.30.2

