Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 23 Jun 2015 23:33:58 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Osmialowski <pawelo@king.net.pl>,
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
	Nicolas Pitre <nico@linaro.org>,
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
Subject: Re: [PATCH 5/9] arm: twr-k70f120m: basic support for Kinetis
 TWR-K70F120M
Message-ID: <20150623223358.GI7557@n2100.arm.linux.org.uk>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
 <1435094387-20146-6-git-send-email-pawelo@king.net.pl>
 <3935594.UmXqE2ND2k@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3935594.UmXqE2ND2k@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jun 24, 2015 at 12:05:40AM +0200, Arnd Bergmann wrote:
> On Tuesday 23 June 2015 23:19:43 Paul Osmialowski wrote:
> > @@ -1740,7 +1752,7 @@ source "mm/Kconfig"
> >  config FORCE_MAX_ZONEORDER
> >  	int "Maximum zone order" if ARCH_SHMOBILE_LEGACY
> >  	range 11 64 if ARCH_SHMOBILE_LEGACY
> > -	default "12" if SOC_AM33XX
> > +	default "12" if SOC_AM33XX || ARCH_KINETIS
> >  	default "9" if SA1111 || ARCH_EFM32
> >  	default "11"
> >  	help
> 
> Put it in the defconfig?

That doesn't work - defconfigs only provide the answers to _visible_
options.  This option won't be visible.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
