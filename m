Return-Path: <shawnguo@kernel.org>
Date: Wed, 2 Dec 2015 21:03:02 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: linux-kernel-dev@beckhoff.com
Cc: kernel@pengutronix.de,
	Patrick =?iso-8859-1?Q?Br=FCnn?= <p.bruenn@beckhoff.com>,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: imx5: ipu_di_sel clocks can set parent rates
Message-ID: <20151202130302.GV692@tiger>
References: <1449047797-4300-1-git-send-email-linux-kernel-dev@beckhoff.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1449047797-4300-1-git-send-email-linux-kernel-dev@beckhoff.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Dec 02, 2015 at 10:16:37AM +0100, linux-kernel-dev@beckhoff.com wrote:
> From: Patrick Brünn <p.bruenn@beckhoff.com>
> 
> To obtain exact pixel clocks, allow the DI clock selectors to influence
> the PLLs that they are derived from.
> 
> Commit 4591b13289b5 ("ARM: i.MX6: ipu_di_sel clocks can set parent
> rates") did this for i.MX6.
> Port it to enable high display resolutions on i.MX53 based platforms
> such as CX9020 Embedded PC, too.
> 
> Signed-off-by: Patrick Brünn <p.bruenn@beckhoff.com>

Applied, thanks.
