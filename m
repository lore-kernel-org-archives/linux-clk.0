Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
To: Paul Osmialowski <pawelo@king.net.pl>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>,
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
	Russell King <linux@arm.linux.org.uk>,
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
Date: Fri, 26 Jun 2015 09:40:10 +0200
Message-ID: <2139691.3OPR29uKdT@wuerfel>
In-Reply-To: <alpine.LNX.2.00.1506260715300.499@localhost.localdomain>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl> <alpine.LFD.2.11.1506251237000.2617@knanqh.ubzr> <alpine.LNX.2.00.1506260715300.499@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Friday 26 June 2015 07:30:49 Paul Osmialowski wrote:
> ENDPROC(cpu_kinetis_do_idle)
> 
> But... what about the rest of this hypothetical proc_kinetis.S file?
> 
> It would be a lot of code duplication with proc-v7m.S I think.
> 

I doubt that the Kinetis has a custom version of the CPU core. Are you
sure that not all Cortex-M4 need this?

As long as the idle implementation depends only on the CPU core type,
it's easy to just define multiple .proc.info.init entries in the
same file, like we do in proc-v7.S.

	Arnd
