Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] clk: meson: expose clk ids
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20170731113832.26490-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <203231e0-1d9b-ecca-bc04-d5133fb2ec87@baylibre.com>
Date: Mon, 31 Jul 2017 14:00:12 +0200
MIME-Version: 1.0
In-Reply-To: <20170731113832.26490-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 07/31/2017 01:38 PM, Jerome Brunet wrote:
> In previous cycles, concerns have been raised about the way clocks are
> exposed for the meson clock controller, only when validated and required
> in DT.
> 
> Instead, this patchset expose all the known clocks which may be needed in
> DT later on. The clocks left out are internal clocks which should never be
> used directly in DT. These are mostly internal muxes and dividers of
> composite clocks.
> 
> While this should reduce the patch flow on the related header files, It
> won't stop it completely. There are still many clocks we don't know about
> yet. We tend discover a few in every cycle.
> 
> This patchset depends on these fixes [0] to avoid issues when adding new
> clk ids.
> 
> [0]: https://lkml.kernel.org/r/20170727161755.10393-1-jbrunet@baylibre.com
> 
> Jerome Brunet (2):
>   clk: meson8b: expose every clock in the bindings
>   clk: meson-gxbb: expose almost every clock in the bindings
> 
>  drivers/clk/meson/gxbb.h                 | 117 ++-----------------------------
>  drivers/clk/meson/meson8b.h              | 103 ++-------------------------
>  include/dt-bindings/clock/gxbb-clkc.h    |  60 ++++++++++++++++
>  include/dt-bindings/clock/meson8b-clkc.h |  70 ++++++++++++++++++
>  4 files changed, 141 insertions(+), 209 deletions(-)
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
