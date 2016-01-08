Return-Path: <vz@mleia.com>
Message-ID: <568F03CA.2030502@mleia.com>
Date: Fri, 08 Jan 2016 02:33:14 +0200
From: Vladimir Zapolskiy <vz@mleia.com>
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
CC: linux-clk@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 0/3] clk: remove dead code allocations of parent lookup
 tables
References: <1452136568-478-1-git-send-email-vz@mleia.com>
In-Reply-To: <1452136568-478-1-git-send-email-vz@mleia.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 07.01.2016 05:16, Vladimir Zapolskiy wrote:
> The change simplifies core operations over multi-parent clocks (clock
> registration, clk_set_parent() and clk_get_parent() internals) by
> rejecting a possibilty to skip failed memory allocation during clock
> registration time and falling back to it on the next [gs]et_parent.
> 
> No functional change is intended.
> 
> Vladimir Zapolskiy (3):
>   clk: don't fetch parent index for non multi-parent clocks
>   clk: simplify array allocation of clock parents for lookup
>   clk: remove redundant clock parents lookup table allocations
> 
>  drivers/clk/clk.c | 49 +++++++++++++++++++------------------------------
>  1 file changed, 19 insertions(+), 30 deletions(-)
> 

Please ignore this series, the discussed Masahiro's changeset completely
covers the proposed improvements (and it adds even more of them).

--
With best wishes,
Vladimir
