Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gabe.freedesktop.org ([131.252.210.177]:50879 "EHLO
	gabe.freedesktop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752836AbbGTTdW (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jul 2015 15:33:22 -0400
From: Eric Anholt <eric@anholt.net>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@linaro.org>
Subject: [PATCH v4 0/8] Raspberry Pi clock support
Date: Mon, 20 Jul 2015 12:32:59 -0700
Message-Id: <1437420787-32137-1-git-send-email-eric@anholt.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This is a respin of my rpi-dt-clocks series (also available at
https://github.com/anholt/linux/tree/rpi-dt-clocks).  New in this
version is mentioning the clk subsystem for drivers/clk/* patches,
some better documentation of behavior in clk-raspberrypi.c, and a new
patch at the tail of the series for updating the EMMC clock.

