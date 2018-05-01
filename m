Return-Path: <robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAGb2v64ZTQ0jAaSpDXtV58c-EE2FMMbVASLLjxjGkWM3iJTMHg@mail.gmail.com>
References: <20180430114058.5061-1-jagan@amarulasolutions.com>
 <20180430114058.5061-2-jagan@amarulasolutions.com> <20180501161618.GA32350@rob-hp-laptop>
 <CAGb2v64ZTQ0jAaSpDXtV58c-EE2FMMbVASLLjxjGkWM3iJTMHg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 1 May 2018 11:34:14 -0500
Message-ID: <CAL_Jsq+0KhCWc-8cpTX=OtGapM+4YdymHDndY6AgGfq3z+mqhg@mail.gmail.com>
Subject: Re: [PATCH 01/21] dt-bindings: clock: Add compatible for A64 DE2 CCU
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, Icenowy Zheng <icenowy@aosc.io>,
	Jernej Skrabec <jernej.skrabec@siol.net>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
	David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 1, 2018 at 11:19 AM, Chen-Yu Tsai <wens@csie.org> wrote:
> On Wed, May 2, 2018 at 12:16 AM, Rob Herring <robh@kernel.org> wrote:
>> On Mon, Apr 30, 2018 at 05:10:38PM +0530, Jagan Teki wrote:
>>> Allwinner A64 has DE2 CCU which is similar to H3/H5 SoC.
>>>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>> ---
>>>  Documentation/devicetree/bindings/clock/sun8i-de2.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>
> Hi Rob,
>
> Do we need to add this if it's just a soc-specific compatible
> we add in the device tree to future proof things in case we
> discover quirks later on?

Yes, but the fallbacks should be documented too as I found in the rest
of the series.

> AFAIK we haven't been doing this, and this is likely to create
> some confusion, because they aren't actually mentioned anywhere
> in the driver.

The binding doc needs to written such that compatible can be validated
to contain the correct set of strings. We can't do that now with free
form text, but when we move to a schema we will.

Rob
