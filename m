Return-Path: <stillcompiling@gmail.com>
Return-Path: <stillcompiling@gmail.com>
Date: Fri, 29 Jan 2016 15:35:21 -0800
From: Joshua Clayton <stillcompiling@gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: shawnguo@kernel.org, kernel@pengutronix.de, mturquette@baylibre.com,
 sboyd@codeaurora.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: imx: do not sleep if IRQ's are still disabled
Message-ID: <20160129153521.3deee49c@jclayton-pc>
In-Reply-To: <1454107764-19876-1-git-send-email-stefan@agner.ch>
References: <1454107764-19876-1-git-send-email-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Fri, 29 Jan 2016 14:49:23 -0800
Stefan Agner <stefan@agner.ch> wrote:

> If a clock gets enabled early during boot time, it can lead to a PLL
> startup. The wait_lock function makes sure that the PLL is really
> stareted up before it gets used. However, the function sleeps which
s/stareted/started/
