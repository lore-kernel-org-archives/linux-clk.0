Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] clk: meson: gxbb: fix audio divider flags
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20170727130940.18005-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <0aa1d502-473e-637e-7907-e4f805a16ffb@baylibre.com>
Date: Thu, 27 Jul 2017 15:35:45 +0200
MIME-Version: 1.0
In-Reply-To: <20170727130940.18005-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 07/27/2017 03:09 PM, Jerome Brunet wrote:
> Two audio clocks incorrectly set divider flags in the hw.init flag.
> Just move these flags where they belong.
> 
> Jerome Brunet (2):
>   clk: meson: gxbb: fix meson cts_amclk divider flags
>   clk: meson: gxbb: fix clk_mclk_i958 divider flags
> 
>  drivers/clk/meson/gxbb.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Applied on clk-meson's fixes/drivers

Thx
