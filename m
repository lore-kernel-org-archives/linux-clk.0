Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 1/2] clk: meson: meson8b: mark clk81 as critical
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
References: <20170524093932.5262-1-jbrunet@baylibre.com>
 <20170524093932.5262-2-jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, carlo@caione.org,
 Kevin Hilman <khilman@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <18cf4eec-0bd0-aefe-9736-1aadd3e40942@baylibre.com>
Date: Wed, 24 May 2017 11:45:30 +0200
MIME-Version: 1.0
In-Reply-To: <20170524093932.5262-2-jbrunet@baylibre.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 05/24/2017 11:39 AM, Jerome Brunet wrote:
> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> Disabling clk81 results in an immediate freeze of the whole system. This
> can happen "accidentally" when the last child-clock of clk81 is disabled
> (in this case the common clock framework also disables clk81, even if it
> was only enabled indirectly before).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/meson8b.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index e9985503165c..9d1aaf6e9ac6 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -399,7 +399,7 @@ struct clk_gate meson8b_clk81 = {
>  		.ops = &clk_gate_ops,
>  		.parent_names = (const char *[]){ "mpeg_clk_div" },
>  		.num_parents = 1,
> -		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
> +		.flags = (CLK_SET_RATE_PARENT | CLK_IS_CRITICAL),
>  	},
>  };
>  
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
