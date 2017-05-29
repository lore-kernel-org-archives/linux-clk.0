Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/2] clk: meson: mark clk81 as critical
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
References: <20170524093932.5262-1-jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, carlo@caione.org,
 Kevin Hilman <khilman@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <a550aa57-c1b5-8849-095d-01586aaf5b50@baylibre.com>
Date: Mon, 29 May 2017 09:54:36 +0200
MIME-Version: 1.0
In-Reply-To: <20170524093932.5262-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 05/24/2017 11:39 AM, Jerome Brunet wrote:
> The GX (gxbb.c) clock controller driver already marks the clk81 clock
> as criticial. However, the Meson8b clock controller driver does not do
> this yet.
> This can lead to a freeze of the whole system when clk81 is disabled
> by the common clock framework (for example after the last child clock
> is disabled by a driver which used that child clock).
> 
> Changes since v1: [0]
> With the clock flagged as CRITICAL, CLK_IGNORE_UNUSED is no longer
> useful. Remove this flag from meson8b and gxbb's clk81.
> 
> [0]: https://lkml.kernel.org/r/20170504183201.13175-1-martin.blumenstingl@googlemail.com
> 
> Jerome Brunet (1):
>   clk: gxbb: remove CLK_IGNORE_UNUSED from clk81
> 
> Martin Blumenstingl (1):
>   clk: meson: meson8b: mark clk81 as critical
> 
>  drivers/clk/meson/gxbb.c    | 2 +-
>  drivers/clk/meson/meson8b.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Applied,

Thanks,
Neil
