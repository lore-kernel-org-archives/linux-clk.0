Return-Path: <linux-clk-owner@vger.kernel.org>
Subject: Re: [PATCH v6 3/6] kernel/reboot.c: export pm_power_off_prepare
To: Christoph Hellwig <hch@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20171206072402.11694-1-o.rempel@pengutronix.de>
 <20171206072402.11694-4-o.rempel@pengutronix.de>
 <20171206231130.GA6235@infradead.org>
From: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <b39d3ae2-5a93-854f-a0ff-aefd405da78b@pengutronix.de>
Date: Thu, 7 Dec 2017 06:36:55 +0100
MIME-Version: 1.0
In-Reply-To: <20171206231130.GA6235@infradead.org>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 07.12.2017 00:11, Christoph Hellwig wrote:
>>  void (*pm_power_off_prepare)(void);
>> +EXPORT_SYMBOL(pm_power_off_prepare);
> 
> EXPORT_SYMBOL_GPL for something this deeply internal, please.

Ok,
probably all other symbols should be converted in this file in to
EXPORT_SYMBOL_GPL as well?

grep EXPORT_SYMBOL kernel/reboot.c
EXPORT_SYMBOL(cad_pid);
EXPORT_SYMBOL(pm_power_off_prepare);
EXPORT_SYMBOL_GPL(emergency_restart);
EXPORT_SYMBOL(register_reboot_notifier);
EXPORT_SYMBOL(unregister_reboot_notifier);
EXPORT_SYMBOL(devm_register_reboot_notifier);
EXPORT_SYMBOL(register_restart_handler);
EXPORT_SYMBOL(unregister_restart_handler);
EXPORT_SYMBOL_GPL(kernel_restart);
EXPORT_SYMBOL_GPL(kernel_halt);
EXPORT_SYMBOL_GPL(kernel_power_off);
EXPORT_SYMBOL_GPL(orderly_poweroff);
EXPORT_SYMBOL_GPL(orderly_reboot);
