Return-Path: <magnus.damm@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUf1JLv-JF3pojhWSyChHAv2sXdxE7Wzf5mvWeNhsou-A@mail.gmail.com>
References: <20160218071403.11935.50948.sendpatchset@little-apple>
	<CAMuHMdUf1JLv-JF3pojhWSyChHAv2sXdxE7Wzf5mvWeNhsou-A@mail.gmail.com>
Date: Fri, 19 Feb 2016 00:53:25 +0900
Message-ID: <CANqRtoR_yXPXbAj+wKA43XuBU3xBU70cg4pNnJGiizb5KyAd+g@mail.gmail.com>
Subject: Re: [PATCH v2] clk: shmobile: r8a7795: Add INTC-EX clock
From: Magnus Damm <magnus.damm@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>, Simon Horman <horms@verge.net.au>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

On Thu, Feb 18, 2016 at 5:01 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Magnus,
>
> On Thu, Feb 18, 2016 at 8:14 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Add the "intc-ex" clock to the r8a7795 CPG MSSR driver V2.
>>
>> According to information from the hardware team the INTC_EX
>> parent clock is CP. The next data sheet version will include
>> this information.
>
> That makes sense, as it matches R-Car Gen2.

Yeah I think so too. The other INTC-AP and INTC-RT got their parent
clock updated in Gen3 though, so I somehow assumed that the same
update happened for INTC-EX. But now we know.

>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Will queue in clk-shmobile-for-v4.6.

Sweet, thanks for your help!

/ magnus
