Return-Path: <magnus.damm@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWcHvi19tBGSKSfLbb0WuqB+GkfAenXCwkeZNy99gk1Ew@mail.gmail.com>
References: <20150828091550.21731.85227.sendpatchset@little-apple>
	<20150828091624.21731.11014.sendpatchset@little-apple>
	<CAMuHMdWcHvi19tBGSKSfLbb0WuqB+GkfAenXCwkeZNy99gk1Ew@mail.gmail.com>
Date: Sat, 29 Aug 2015 18:31:01 +0900
Message-ID: <CANqRtoQJAexS8zyH0CYFOZou3NmKHV3S0e7gu6+4YLupSgx+_A@mail.gmail.com>
Subject: Re: [PATCH v3 03/04] clk: shmobile: Add Renesas R-Car Gen3 CPG support
From: Magnus Damm <magnus.damm@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linux-sh list <linux-sh@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Gaku Inami <gaku.inami.xw@bp.renesas.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms@verge.net.au>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

On Sat, Aug 29, 2015 at 5:46 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Aug 28, 2015 at 11:16 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> From: Gaku Inami <gaku.inami.xw@bp.renesas.com>
>>
>> This patch adds very initial CPG support.
>> R-Car Gen3 write function should use CPG write protection method
>> which is shared with MSTP driver. This patch has it but not used.
>
> The last sentence is very confusing. I think it should be removed?

I agree it is confusing. I've reworked the commit log message in the
latest version.

Thanks,

/ magnus
