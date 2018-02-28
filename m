Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751717AbeB1Gza (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Feb 2018 01:55:30 -0500
Date: Wed, 28 Feb 2018 14:55:07 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stefan Agner <stefan@agner.ch>
Cc: kernel@pengutronix.de, fabio.estevam@nxp.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: imx: imx7d: add the Keypad Port module clock
Message-ID: <20180228065506.GK3217@dragon>
References: <20180227160544.11446-1-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180227160544.11446-1-stefan@agner.ch>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Feb 27, 2018 at 05:05:43PM +0100, Stefan Agner wrote:
> According to the i.MX7D Reference Manual, the Keypad Port module
> (KPP) requires this clock gate to be enabled.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied both.  But for future i.MX clock patches, please also copy
clk maintainers to give them chance to comment.

Michael Turquette <mturquette@baylibre.com>
Stephen Boyd <sboyd@kernel.org>

I will eventually need to send i.MX clock patches to them.

Shawn
