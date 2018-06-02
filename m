Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180529160804.1982-2-gregkh@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Phil Elwell <phil@raspberrypi.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Danilo Krummrich <danilokrummrich@dk-develop.de>
References: <20180529160804.1982-1-gregkh@linuxfoundation.org>
 <20180529160804.1982-2-gregkh@linuxfoundation.org>
Message-ID: <152790645382.225090.17720205606557722300@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/5] clk: bcm2835: no need to check return value of
 debugfs_create functions
Date: Fri, 01 Jun 2018 19:27:33 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Greg Kroah-Hartman (2018-05-29 09:08:01)
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> =

> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Stefan Wahren <stefan.wahren@i2se.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: Phil Elwell <phil@raspberrypi.org>
> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Danilo Krummrich <danilokrummrich@dk-develop.de>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Applied to clk-next
