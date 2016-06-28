Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20160627192321.GX4000@lukather>
References: <1466391138-12862-1-git-send-email-wens@csie.org>
 <1466391138-12862-6-git-send-email-wens@csie.org> <20160622100206.GV26668@lukather>
 <CAGb2v67DVBZbRb2PWLP8WurPaNin=2Fa=HMAEK_PdBeqv1x+8Q@mail.gmail.com> <20160627192321.GX4000@lukather>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 Jun 2016 10:27:42 +0800
Message-ID: <CAGb2v675+iEnKPH4zdYRA-+aQGUfHgB9K_TH_GrpmXXw4qM50w@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] rtc: ac100: Add clk output support
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	rtc-linux@googlegroups.com, linux-kernel <linux-kernel@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jun 28, 2016 at 3:23 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Wed, Jun 22, 2016 at 06:11:55PM +0800, Chen-Yu Tsai wrote:
>> On Wed, Jun 22, 2016 at 6:02 PM, Maxime Ripard
>> <maxime.ripard@free-electrons.com> wrote:
>> > Hi,
>> >
>> > On Mon, Jun 20, 2016 at 10:52:15AM +0800, Chen-Yu Tsai wrote:
>> >> +     /*
>> >> +      * The ADDA 4 MHz clock is from the codec side of the AC100,
>> >> +      * which is likely a different power domain. However, boards
>> >> +      * always have both sides powered on, so it is impossible to
>> >> +      * test this.
>> >> +      */
>> >
>> > If that ADDA clock is exposed by the codec, why are you putting it in
>> > the RTC?
>>
>> The thing is it's not entirely clear that it's from the codec side.
>> I'm just inferring this from the name. (I'll make the comment clearer.)
>> The codec parts of the datasheet don't mention this clock at all.
>>
>> Allwinner's SDK puts all the clocks under the RTC module. And the
>> are always on, so I can't really turn off the codec and see what
>> happens. That and I don't have an oscilloscope or logic analyzer.
>
> Why not just create a separate clock driver then?

That would mean a separate device node as well. I'd like to keep
the bindings close to how the hardware is organized.

I can move the ADDA clock over to the codec side.

ChenYu
