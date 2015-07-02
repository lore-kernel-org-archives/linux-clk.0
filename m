Return-Path: <pawelo@king.net.pl>
Date: Thu, 2 Jul 2015 23:42:18 +0200 (CEST)
From: Paul Osmialowski <pawelo@king.net.pl>
To: Arnd Bergmann <arnd@arndb.de>
cc: Paul Osmialowski <pawelo@king.net.pl>,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Jiri Slaby <jslaby@suse.cz>, Kumar Gala <galak@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@arm.linux.org.uk>,
        Stephen Boyd <sboyd@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        Nicolas Pitre <nicolas.pitre@linaro.org>,
        Sergei Poselenov <sposelenov@emcraft.com>,
        Paul Bolle <pebolle@tiscali.nl>,
        Jingchang Lu <jingchang.lu@freescale.com>,
        Yuri Tikhonov <yur@emcraft.com>, Rob Herring <r.herring@freescale.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
        Alexander Potashev <aspotashev@emcraft.com>,
        Frank Li <Frank.Li@freescale.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Anson Huang <b20788@freescale.com>
Subject: Re: [PATCH v2 3/9] arm: twr-k70f120m: clock driver for Kinetis SoC
In-Reply-To: <1861313.aMcV1xHCIq@wuerfel>
Message-ID: <alpine.LNX.2.00.1507022338070.28322@localhost.localdomain>
References: <1435667250-28299-1-git-send-email-pawelo@king.net.pl> <alpine.LNX.2.00.1507011756140.14440@localhost.localdomain> <alpine.LNX.2.00.1507021206410.13210@localhost.localdomain> <1861313.aMcV1xHCIq@wuerfel>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Arnd,

On Thu, 2 Jul 2015, Arnd Bergmann wrote:

> I wonder if you could move out the fixed rate clocks into their own
> nodes. Are they actually controlled by the same block? If they are
> just fixed, you can use the normal binding for fixed rate clocks
> and only describe the clocks that are related to the driver.
>
> 	Arnd
>

In my view having these clocks grouped together looks more convincing. 
After all, they all share the same I/O regs in order to read 
configuration.

Thanks,
Paul
