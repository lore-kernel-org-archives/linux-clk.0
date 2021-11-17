Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F2AC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 17 Nov 2021 11:51:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B8AB63214
	for <linux-clk@archiver.kernel.org>; Wed, 17 Nov 2021 11:51:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236979AbhKQLyO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Nov 2021 06:54:14 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:30432 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236961AbhKQLyM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Nov 2021 06:54:12 -0500
X-IronPort-AV: E=Sophos;i="5.87,241,1631545200"; 
   d="scan'208";a="100916782"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Nov 2021 20:51:11 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 367B24006182;
        Wed, 17 Nov 2021 20:51:09 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jiri Kosina <trivial@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 0/4] clk: renesas: trivial fixes
Date:   Wed, 17 Nov 2021 11:50:57 +0000
Message-Id: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

These are some sanity patches to remove power domain on probe failure,
said that the system might be not in a bootable state when such case
is hit.

Note: I have just compile tested for renesas-cpg-mssr driver.

Cheers,
Prabhakar

Lad Prabhakar (4):
  clk: renesas: rzg2l: Check return value of pm_genpd_init()
  clk: renesas: rzg2l: propagate return value
    of_genpd_add_provider_simple()
  clk: renesas: cpg-mssr: Check return value of pm_genpd_init()
  clk: renesas: cpg-mssr: propagate return value
    of_genpd_add_provider_simple()

 drivers/clk/renesas/renesas-cpg-mssr.c | 17 ++++++++++++++---
 drivers/clk/renesas/rzg2l-cpg.c        | 17 ++++++++++++++---
 2 files changed, 28 insertions(+), 6 deletions(-)

-- 
2.17.1

