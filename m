Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 26 Jun 2015 23:27:11 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Paul Osmialowski <pawelo@king.net.pl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <kernel@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nicolas Pitre <nicolas.pitre@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anson Huang <b20788@freescale.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@freescale.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Frank Li <Frank.Li@freescale.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Jingchang Lu <jingchang.lu@freescale.com>,
	Jiri Slaby <jslaby@suse.cz>, Kees Cook <keescook@chromium.org>,
	Kumar Gala <galak@codeaurora.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Magnus Damm <damm+renesas@opensource.se>,
	Michael Turquette <mturquette@baylibre.com>,
	Nathan Lynch <nathan_lynch@mentor.com>,
	Maxime Coquelin stm32 <mcoquelin.stm32@gmail.com>,
	Olof Johansson <olof@lixom.net>,
	Paul Bolle <pebolle@tiscali.nl>,
	Rob Herring <r.herring@freescale.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	Simon Horman <horms+renesas@verge.net.au>,
	Stefan Agner <stefan@agner.ch>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Pawel Moll <pawel.moll@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	Yuri Tikhonov <yur@emcraft.com>,
	Sergei Poselenov <sposelenov@emcraft.com>,
	Dmitry Cherkassov <d_cherkasov@emcraft.com>,
	Alexander Potashev <aspotashev@emcraft.com>
Subject: Re: [PATCH 3/9] arm: add call to CPU idle quirks handler
Message-ID: <20150626222710.GU7557@n2100.arm.linux.org.uk>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
 <alpine.LFD.2.11.1506251237000.2617@knanqh.ubzr>
 <alpine.LNX.2.00.1506260715300.499@localhost.localdomain>
 <2139691.3OPR29uKdT@wuerfel>
 <alpine.LNX.2.00.1506262324230.5744@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <alpine.LNX.2.00.1506262324230.5744@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 26, 2015 at 11:52:23PM +0200, Paul Osmialowski wrote:
> I tried it and it works. This approach does not cause code duplication, but
> (comparing to arm_pm_idle-based approach) its long. Would something like
> this be accepted ever?
> 
> Note that contrary to proc-v7, there's no __v7m_proc macro, I had to define
> it in order to avoid another code duplication:

And I don't like it - until we have word from Uwe, I'd like to keep this
simple and restricted just to the affected SoC.  Until we have it proven
that this is a generic problem, we shouldn't go treating it as such.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
