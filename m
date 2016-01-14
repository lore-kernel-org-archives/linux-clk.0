Return-Path: <ralf@linux-mips.org>
Date: Thu, 14 Jan 2016 12:12:13 +0100
From: Ralf Baechle <ralf@linux-mips.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
        linux-kernel@vger.kernel.org, linux-mips@linux-mips.org,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Purna Chandra Mandal <purna.mandal@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Andrei Pistirica <andrei.pistirica@microchip.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org,
        linux-api@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Jean Delvare <jdelvare@suse.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Corneliu Doban <cdoban@broadcom.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Luis de Bethencourt <luisbg@osg.samsung.com>,
        Weijun Yang <Weijun.Yang@csr.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Scott Branden <sbranden@broadcom.com>,
        Vincent Yang <vincent.yang.fujitsu@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        "ludovic.desroches@atmel.com" <ludovic.desroches@atmel.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        yangbo lu <yangbo.lu@freescale.com>,
        Kevin Hao <haokexin@gmail.com>,
        Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH v5 02/14] irqchip: irq-pic32-evic: Add support for PIC32
 interrupt controller
Message-ID: <20160114111213.GC28942@linux-mips.org>
References: <1452734299-460-1-git-send-email-joshua.henderson@microchip.com>
 <1452734299-460-3-git-send-email-joshua.henderson@microchip.com>
 <alpine.DEB.2.11.1601140901210.3575@nanos>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <alpine.DEB.2.11.1601140901210.3575@nanos>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 14, 2016 at 09:10:09AM +0100, Thomas Gleixner wrote:

> I like that approach.
> 
> So except for the nit in pic32_set_type_edge() this looks good. It's pretty
> clear now what the code does and how the hardware works.
> 
> Thanks for following up!

So I take that for an ack.  I still haven't seen any acks or comments for
the patches:

     4/14      drivers/clk
     8/14      drivers/pinctrl
    10/14      drivers/serial
    12/14      drivers/mmc

Of this series.  Ping?

  Ralf
