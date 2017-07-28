Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] clk: meson: fix protection against undefined clks
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20170727161755.10393-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <709b4877-f3e5-3654-c0c7-970ea43161e6@baylibre.com>
Date: Fri, 28 Jul 2017 12:07:00 +0200
MIME-Version: 1.0
In-Reply-To: <20170727161755.10393-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 07/27/2017 06:17 PM, Jerome Brunet wrote:
> If the last clkids defined have no hw pointer associated with them in
> the hw_onecell_data array, the initialization is going to crash badly
> because the array is not big enough.
> 
> The patchset makes sure the array is big enough, and that each clkid is
> associated with a valid hw pointer, or NULL.
> 
> Doing it in two patches to ease backport, since we are not fixing the
> same commit on meson8b and gxbb
> 
> Jerome Brunet (2):
>   clk: meson: meson8b: fix protection against undefined clks
>   clk: meson: gxbb: fix protection against undefined clks
> 
>  drivers/clk/meson/gxbb.c    | 2 ++
>  drivers/clk/meson/meson8b.c | 1 +
>  2 files changed, 3 insertions(+)
> 

Applied to clk-meson's fixes/drivers !

Thanks,
Neil
