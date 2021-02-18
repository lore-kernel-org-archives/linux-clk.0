Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42578C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 15:13:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAB2964E85
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 15:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhBRPN3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Feb 2021 10:13:29 -0500
Received: from mail.manjaro.org ([176.9.38.148]:57376 "EHLO mail.manjaro.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232478AbhBRMKs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Feb 2021 07:10:48 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.manjaro.org (Postfix) with ESMTP id 34AB93E600A0;
        Thu, 18 Feb 2021 12:20:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
        by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id O9EmeLmQl_Hb; Thu, 18 Feb 2021 12:20:23 +0100 (CET)
From:   Tobias Schramm <t.schramm@manjaro.org>
To:     Icenowy Zheng <icenowy@aosc.io>, Maxime Ripard <maxime@cerno.tech>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH v2 0/1] clk: sunxi-ng: v3s: use sigma-delta modulation for audio-pll
Date:   Thu, 18 Feb 2021 12:20:00 +0100
Message-Id: <20210218112001.479018-1-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

this patch extends the v3s audio-pll declaration to use sdm for supporting
24.576MHz and 22.5792MHz clock rates, required by the i2s peripheral driver.

This is v2 of the patch. The previous version used a flexible postdivider only.
However, that setup was unable to provide the 22.5792MHz clock rate.

Cheers,
Tobias

Changelog:
 v2:
  - use sdm instead of postdivider for audio-pll
  - change patch subject to reflect use of sdm

Tobias Schramm (1):
  clk: sunxi-ng: v3s: use sigma-delta modulation for audio-pll

 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 33 ++++++++++++++++++----------
 1 file changed, 22 insertions(+), 11 deletions(-)

-- 
2.30.1

