Return-Path: <ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160614173910.GB28218@codeaurora.org>
References: <1465381201-11537-1-git-send-email-ricardo.ribalda@gmail.com> <20160614173910.GB28218@codeaurora.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 15 Jun 2016 00:59:15 +0200
Message-ID: <CAPybu_1qTTn8tkdvJ8r1ehi4-ooJdPkmYJVvQdg71vsOJwoFUQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Convert clk-fixed into module platform driver
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	jeremy.kerr@canonical.com, linux-clk@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen

Assume this device tree overlay:


&bus0{

axi_clk: axi_clk {
compatible = "fixed-clock";
#clock-cells = <0x0>;
clock-frequency = <125000000>;
};

iic_0: iic {
#address-cells = <1>;
#size-cells = <1>;
compatible = "xlnx,xps-iic-2.00.a";
reg = < 0x00030000 0x10000 >;
interrupt-parent = <&xps_intc_0>;
interrupts = < 2 2 >;
clocks = <&axi_clk>;
 } ;

}

Which is basically a new i2c master and a fixed clock definition.

The fixed clock driver will only be probed to the driver at arch
initialization, when of_clk_init is called.  The device overlay can be
added at any point, usually after arch init. Which will result in ii_0
failing to probe,  because it is missing its clock.

This changeset allows fixed clocks to be added after of_clk_init is
called, by converting the driver into a platform driver.


Thanks!b

On Tue, Jun 14, 2016 at 7:39 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 06/08, Ricardo Ribalda Delgado wrote:
>> When clock providers are added to the device tree after of_clk_init is called
>> they are not added to the clock provider list. This makes that drivers such
>> as i2c-xiic.c fail to init, as they may depend on the unadded clock provider.
>
> Who's the provider here? It isn't clear to me why we're
> populating fixed factor and fixed rate clks from DT for i2c
> devices? Presumably there's an i2c device driver that should be
> populating clks from C code instead?
>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project



-- 
Ricardo Ribalda
