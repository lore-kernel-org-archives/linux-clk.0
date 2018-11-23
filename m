Return-Path: <SRS0=uK82=OC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AC9C43441
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 08:56:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01FA120685
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 08:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01FA120685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408746AbeKWTkC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Nov 2018 14:40:02 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:35194 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408747AbeKWTkC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Nov 2018 14:40:02 -0500
Received: from ramsan.of.borg ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id 3Lwh1z00G3XaVaC06LwhDr; Fri, 23 Nov 2018 09:56:42 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1gQ7GT-0002Yt-Fq; Fri, 23 Nov 2018 09:56:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gQ7GT-00085w-Dl; Fri, 23 Nov 2018 09:56:41 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.21
Date:   Fri, 23 Nov 2018 09:56:35 +0100
Message-Id: <20181123085635.31067-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.21-tag1

for you to fetch changes up to eb38c119dd91c61de26f67050671a84064554f7d:

  clk: renesas: r7s9210: Add USB clocks (2018-11-13 09:58:51 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v4.21

  - Add support for SDHI and USB clocks on RZ/A2,
  - Add support for RPC (SPI Multi I/O Bus Controller) clocks on R-Car
    V3M.

Thanks for pulling!

----------------------------------------------------------------
Chris Brandt (2):
      clk: renesas: r7s9210: Add SDHI clocks
      clk: renesas: r7s9210: Add USB clocks

Sergei Shtylyov (1):
      clk: renesas: r8a77970: Add RPC clocks

 drivers/clk/renesas/r7s9210-cpg-mssr.c  | 7 +++++++
 drivers/clk/renesas/r8a77970-cpg-mssr.c | 4 ++++
 2 files changed, 11 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
