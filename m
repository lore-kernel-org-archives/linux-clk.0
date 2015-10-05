Return-Path: <yorksun@freescale.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, <linux-clk@vger.kernel.org>
From: York Sun <yorksun@freescale.com>
Subject: What's the proper use of con_id in clkdev
Message-ID: <5612D4D0.30104@freescale.com>
Date: Mon, 5 Oct 2015 12:51:44 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Return-Path: yorksun@freescale.com
List-ID: <linux-clk.vger.kernel.org>

Michael and Stephen,

Can you help me to understand "#define MAX_CON_ID 16" in clkdev.c? I am trying
to use clk_get() to acquire the clock with its name. This fails when the clock
name is more than 15 characters. I traced it to this macro.

The reason of using clk_get() is I don't have device tree for my platform until
device tree overlay is officially supported. So I use clkdev_add() in the clock
driver.

So my issue is with the MAX_CON_ID. Is there a reason to limit it to 16?
Wouldn't it be better to use kstrdup() in vclkdev_alloc()?

York
