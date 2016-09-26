Return-Path: <linux+mturquette=baylibre.com@armlinux.org.uk>
Date: Mon, 26 Sep 2016 22:57:41 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Wim Van Sebroeck <wim@iguana.be>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: sa11x0/pxa: acquire timer rate from the clock
 rate
Message-ID: <20160926215741.GH1041@n2100.armlinux.org.uk>
References: <1474312335-20997-1-git-send-email-robert.jarzmik@free.fr>
 <1474312335-20997-3-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474312335-20997-3-git-send-email-robert.jarzmik@free.fr>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Sep 19, 2016 at 09:12:13PM +0200, Robert Jarzmik wrote:
> As both pxa and sa1100 provide a clock to the timer, the rate can be
> inferred from the clock rather than hard encoded in a functional call.
> 
> This patch changes the pxa timer to have a mandatory clock which is used
> as the timer rate.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Acked-by: Russell King <rmk+kernel@armlinux.org.uk>

Thanks.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
