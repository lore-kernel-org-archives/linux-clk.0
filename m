Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF83C433ED
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 06:24:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B20261164
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 06:24:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236806AbhDWGZe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Apr 2021 02:25:34 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:23262 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236955AbhDWGZd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Apr 2021 02:25:33 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d49 with ME
        id w6Qu2400721Fzsu036Quj9; Fri, 23 Apr 2021 08:24:55 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 23 Apr 2021 08:24:55 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        gregory.clement@bootlin.com, thomas.petazzoni@free-electrons.com
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/4] clk: mvebu: Fix some error handling paths + do some clean-up
Date:   Fri, 23 Apr 2021 08:24:52 +0200
Message-Id: <cover.1619157996.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This serie fixes some (unlikely) error handlings paths.

The 4th patch is completely speculative. When I compile-tested the changes,
I had to remove this line in order for it to compile.
As it works fine (at least for me) without it, I wonder if it is needed at all.


Also, I wonder if the drivers in drivers/clk/mvebu are used by anyone.
In order to compile-test the changes, I also had to change the 'bool' in Kconfig
by 'bool "blah"'. Without this change, it was not possible to set
CONFIG_MVEBU_CLK_CPU required by Makefile.

I don't know if I did something wrong, if it is an issue only on my environment
or if something got broken at some time in the build chain but it looks
spurious.

If I'm right and that these drivers never compile and no-one noticed it,
maybe removing them is better than fixing some unlikely issues and style.
If these drivers should stay, Kconfig may need some love from someone.

Christophe JAILLET (4):
  clk: mvebu: Fix a memory leak in an error handling path
  clk: mvebu: Fix a another memory leak in an error handling path
  clk: mvebu: Fix a checkpatch warning
  clk: mvebu: Remove an unneeded include

 drivers/clk/mvebu/clk-cpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

-- 
2.27.0

