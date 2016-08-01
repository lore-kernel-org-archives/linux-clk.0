Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20160801103024.cc74c093466d7fdfd91a2587@free.fr>
References: <20160726203041.29366-1-maxime.ripard@free-electrons.com>
 <fb559224-561c-3476-1146-96f7aea427f0@arm.com> <20160801103024.cc74c093466d7fdfd91a2587@free.fr>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 1 Aug 2016 17:13:34 +0800
Message-ID: <CAGb2v67+1rG1kj+7cGO=TMwSgpktP4xMAeZ9Zfy8PRWXyRLi+g@mail.gmail.com>
Subject: Re: [PATCH 00/13] arm64: Allwinner A64 support based on sunxi-ng
To: Jean-Francois Moine <moinejf@free.fr>
Cc: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Aug 1, 2016 at 4:30 PM, Jean-Francois Moine <moinejf@free.fr> wrote=
:
> On Mon, 1 Aug 2016 02:43:06 +0100
> Andr=C3=A9 Przywara <andre.przywara@arm.com> wrote:
>
>> As this became quite a long read, here a TL;DR:
>> - We consider using an SCPI based clock system for the A64, alongside
>> allwinner,simple-gates and fixed clocks. We try to avoid any Allwinner
>> specific clocks (apart from the simple-gates).
>> - ARM Trusted Firmware provides the SCPI implementation - for now, later
>> we may move this into a possible arisc firmware.
>> - We upstream some basic DT first, possibly omitting any controversial
>> clock parts at all.
>>
>> Let me know what you think!
>
> Hi Andr=C3=A9,
>
> This looks interesting.
> As I understand, the clock enable/rate setting functions would be in
> the arisc. The arisc firmware would be loaded only once in the Soc and
> would contain the code for handling this specific SoC.
> From my calculations, this would save about 1Mb of clock descriptions
> in the kernel for a universal Allwinner kernel.
>
> But I don't see why you are keeping the simple-gates. The bus gate may
> be ungated/gated when the clock is enabled/disabled, and that's what
> Allwinner's software does.

For peripherals that have a separate mod clock, having them separate
is a good thing. One example might be the audio codecs. You could ungate
the bus gate to access its registers to program it, but only enable
the mod clock when you actually play something.

Regards
ChenYu
