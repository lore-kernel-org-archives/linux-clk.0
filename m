Return-Path: <stefan.wahren@i2se.com>
Date: Wed, 14 Jun 2017 22:01:39 +0200 (CEST)
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Danilo Krummrich <danilokrummrich@dk-develop.de>
Cc: rjui@broadcom.com, linux-clk@vger.kernel.org, eric@anholt.net,
	bcm-kernel-feedback-list@broadcom.com, mturquette@baylibre.com,
	f.fainelli@gmail.com, sboyd@codeaurora.org,
	linux-rpi-kernel@lists.infradead.org
Message-ID: <1934417554.81732.1497470499708@email.1und1.de>
In-Reply-To: <20170614194057.28722-1-danilokrummrich@dk-develop.de>
References: <20170614194057.28722-1-danilokrummrich@dk-develop.de>
Subject: Re: [PATCH v4] clk: bcm2835: remove remains from stub clk driver
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Danilo,

> Danilo Krummrich <danilokrummrich@dk-develop.de> hat am 14. Juni 2017 um 21:40 geschrieben:
> 
> 
> This commit removes the fixed clocks introduced as a stub clock driver
> added with commit 75fabc3f6448 ("ARM: bcm2835: add stub clock driver").
> Originally they were used to drive the AMBA bus and PL011 uart driver.
> Now these clocks are derived by the CPRMAN clock driver and configured
> in DT.
> 
> Additionally, get rid of init_machine function in bcm2835 board file
> as there's nothing to do any longer.
> 
> Acked-by: Eric Anholt <eric@anholt.net>
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Danilo Krummrich <danilokrummrich@dk-develop.de>

please stop resending this patch only to add someones Ack. This doesn't make our job easier.

Thanks
Stefan
