Return-Path: <khilman@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20160907221403.GA13062@codeaurora.org>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160904213152.25837-2-martin.blumenstingl@googlemail.com>
 <20160907003355.GQ12510@codeaurora.org> <CAFBinCBwcVkXi9wVt1FGaEFdK+fsxz-r12ao89HwqozqLGtd7A@mail.gmail.com>
 <20160907221403.GA13062@codeaurora.org>
From: Kevin Hilman <khilman@baylibre.com>
Date: Wed, 7 Sep 2016 19:24:50 -0700
Message-ID: <CAOi56cVD-ijetJ0rn=D2DNCVYaGVV7EfdfsSdQQB-Z1p5QSXUQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] clk: gxbb: expose USB clocks
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-amlogic <linux-amlogic@lists.infradead.org>,
	=?UTF-8?B?SsOpcsO0bWUgQnJ1bmV0?= <jbrunet@baylibre.com>,
	johnyoun@synopsys.com, Kishon Vijay Abraham I <kishon@ti.com>, Carlo Caione <carlo@caione.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Sep 7, 2016 at 3:14 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 09/07, Martin Blumenstingl wrote:
>> On Wed, Sep 7, 2016 at 2:33 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> > On 09/04, Martin Blumenstingl wrote:
>> >> USB0_DDR_BRIDGE and USB1_DDR_BRIDGE1 are needed for the related
>> >> dwc2 usb controller. USB, USB0 and USB1 are needed for the PHYs.
>> >> Expose these clocks to DT and comment out in clk driver.
>> >>
>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> >> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> >
>> > Is authorship correct on this patch? Did Jerome author it
>> > instead?
>> We (Jerome and I) have both worked on this patch, that's why you have
>> two signed-off-by's.
>> Or is this simply about the order (author = from address should be
>> listed first)?
>
> Yes. Typically author is listed first in the signed-off-by chain.
>

And if you use git-format-patch + git-send-email, there would also be a

From: Jerome Brunet <jbrunet@baylibre.com>

at the beginning so that when it gets applied by the maintainer,
authorship is correct.

Kevin
