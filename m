Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2939807.q7WvOoYzDX@wuerfel>
References: <1435667250-28299-1-git-send-email-pawelo@king.net.pl>
 <1435667250-28299-5-git-send-email-pawelo@king.net.pl> <2939807.q7WvOoYzDX@wuerfel>
From: Rob Herring <robherring2@gmail.com>
Date: Sun, 5 Jul 2015 09:39:26 -0500
Message-ID: <CAL_Jsq+r9fNWqD9O8Kz7Tn7oCaiJv7fSjEJ5QNcf+YLO146wPw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] arm: twr-k70f120m: timer driver for Kinetis SoC
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Paul Osmialowski <pawelo@king.net.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Jiri Slaby <jslaby@suse.cz>, Kumar Gala <galak@codeaurora.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pawel Moll <pawel.moll@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@arm.linux.org.uk>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Vinod Koul <vinod.koul@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	dmaengine@vger.kernel.org,
	Nicolas Pitre <nicolas.pitre@linaro.org>,
	Sergei Poselenov <sposelenov@emcraft.com>,
	Paul Bolle <pebolle@tiscali.nl>,
	Jingchang Lu <jingchang.lu@freescale.com>,
	Yuri Tikhonov <yur@emcraft.com>,
	Rob Herring <r.herring@freescale.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
	Alexander Potashev <aspotashev@emcraft.com>,
	Frank Li <Frank.Li@freescale.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anson Huang <b20788@freescale.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jun 30, 2015 at 3:43 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 30 June 2015 14:27:25 Paul Osmialowski wrote:
>

>>  / {
>> +     aliases {
>> +             pit0 = &pit0;
>> +             pit1 = &pit1;
>> +             pit2 = &pit2;
>> +             pit3 = &pit3;
>> +     };
>> +
>>       soc {
>> +             pit@40037000 {
>> +                     compatible = "fsl,kinetis-pit-timer";
>> +                     reg = <0x40037000 0x100>;
>> +                     clocks = <&mcg_pclk_gate 5 23>;
>> +                     #address-cells = <1>;
>> +                     #size-cells = <1>;
>> +                     ranges;
>> +
>> +                     pit0: timer@40037100 {
>> +                             reg = <0x40037100 0x10>;
>> +                             interrupts = <68>;
>> +                             status = "disabled";
>> +                     };
>
> I don't think it's necessary to have both an alias
> and a label here. What do you use the alias for?

Yes, don't use aliases. If you really need a specific timer to be used
then there must be some feature it has or doesn't have (e.g. always
on, output compare pin, specific clock, etc.) Put those those
properties in DT if that is the case. See OMAP timers for a complex
example of this.

Rob
