Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.131]:60039 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750711AbcBZFOn (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 26 Feb 2016 00:14:43 -0500
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [RFC PATCH 0/3] Support round phase stuff for clock driver
Date: Fri, 26 Feb 2016 13:08:10 +0800
Message-Id: <1456463290-3581-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


clk_set_phase is probably most used for sample tuning stuff, and
the caller will check whether finding a good degree or not to decide
how to implement the algorithm for catching the best sample window. Not
all of the phases are supportted by clock phase generator. So the drivers
which call clk_set_phase may result in setting the phase which is not
requestted, which will fininally makes the tuning result different.
Especially for the cross-platform drivers, they can be used for different
Socs, so it must care the actual phase supported by different clock phase
generators.

This RFC patchset introduces new API for phase stuff which parallels rate stuff
to meet the requirement.

Based on tag of v4.5-rc5
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git



Shawn Lin (3):
  clk: add clk_round_phase support
  clk: add clk_hw_set_phase_range support
  Documentation: clk: Add clk phase callback comments

 Documentation/clk.txt        |   5 ++
 drivers/clk/clk.c            | 147 ++++++++++++++++++++++++++++++++++++++++---
 include/linux/clk-provider.h |  23 ++++++-
 include/linux/clk.h          |  23 +++++++
 4 files changed, 187 insertions(+), 11 deletions(-)

-- 
2.3.7


