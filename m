Return-Path: <t-kristo@ti.com>
Subject: Re: [PATCH 1/3] Documentation: dt: Add TI SCI clock driver
To: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
References: <1477053961-27128-1-git-send-email-t-kristo@ti.com>
 <1477053961-27128-2-git-send-email-t-kristo@ti.com>
 <20161030204121.qvb5d33dh65awwzx@rob-hp-laptop>
 <41c58712-bc00-ed05-9d1d-42e31397a70c@ti.com>
 <CAL_JsqLtSs6ifnMdEOsfXpGoWnmXuGAx83+ziB9yU+zurvob+A@mail.gmail.com>
 <0fe81866-8bfd-f3a7-d808-9cb23841f504@ti.com>
 <8579b123-f214-22f1-0236-e5b98ab51597@ti.com>
 <CAL_JsqKox9WVXh=i1jSCijJDTACC35uiNtS-bg9fdyDrX0svRQ@mail.gmail.com>
 <5f146fb6-ec88-b7ee-ef5b-a5ad32c54a74@codeaurora.org>
CC: linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>, Nishanth
 Menon <nm@ti.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <76fca1ab-fbae-07ed-7585-cd9ba1230a19@ti.com>
Date: Fri, 2 Dec 2016 23:07:54 +0200
MIME-Version: 1.0
In-Reply-To: <5f146fb6-ec88-b7ee-ef5b-a5ad32c54a74@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 02/12/16 20:58, Stephen Boyd wrote:
> On 12/02/2016 10:45 AM, Rob Herring wrote:
>> On Fri, Dec 2, 2016 at 2:19 AM, Tero Kristo <t-kristo@ti.com> wrote:
>>>
>>> Rob, any response on this one? I see you have acked the reset part of the
>>> bindings which is doing pretty much the same thing as the clock part is
>>> doing here, namely adding child node under the main SCI node. Is it okay to
>>> do this same for other parts of the TI SCI?
>> Yes. It would be silly to allow for one and not others...
>>
>
> I'm expecting a respin for the node name (clocks or clock-controller).
> I'll also make a review pass on patch 3 today so please don't respin
> until after that.

Yeah, I need to fix that and re-send. This series will be most likely 
delayed until 4.11 though seeing its very late in 4.9-rc already (and 
the genpd part dependency is still not ready either) so we are not in a 
rush right now.

-Tero
