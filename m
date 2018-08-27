Return-Path: <djkurtz@chromium.org>
Return-Path: <djkurtz@chromium.org>
MIME-Version: 1.0
References: <1534834341-18345-1-git-send-email-akshu.agrawal@amd.com>
In-Reply-To: <1534834341-18345-1-git-send-email-akshu.agrawal@amd.com>
From: Daniel Kurtz <djkurtz@chromium.org>
Date: Mon, 27 Aug 2018 17:00:27 -0600
Message-ID: <CAGS+omCS3nNke2BVLQtv5LK8xCKrMD6xwiPWajKMphWWfgsC3g@mail.gmail.com>
Subject: Re: [PATCH] clk: x86: Set default parent to 48Mhz
To: Akshu Agrawal <akshu.agrawal@amd.com>
Cc: Alexander.Deucher@amd.com, Mike Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
	rafael.j.wysocki@intel.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 21, 2018 at 12:53 AM Akshu Agrawal <akshu.agrawal@amd.com> wrote:
>
> System clk provided in ST soc can be set to:
> 48Mhz, non-spread
> 25Mhz, spread
> To get accurate rate, we need it to set it at non-spread
> option which is 48Mhz.
>
> Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>

Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>

> ---
>  drivers/clk/x86/clk-st.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/x86/clk-st.c b/drivers/clk/x86/clk-st.c
> index fb62f39..3a0996f 100644
> --- a/drivers/clk/x86/clk-st.c
> +++ b/drivers/clk/x86/clk-st.c
> @@ -46,7 +46,7 @@ static int st_clk_probe(struct platform_device *pdev)
>                 clk_oscout1_parents, ARRAY_SIZE(clk_oscout1_parents),
>                 0, st_data->base + CLKDRVSTR2, OSCOUT1CLK25MHZ, 3, 0, NULL);
>
> -       clk_set_parent(hws[ST_CLK_MUX]->clk, hws[ST_CLK_25M]->clk);
> +       clk_set_parent(hws[ST_CLK_MUX]->clk, hws[ST_CLK_48M]->clk);
>
>         hws[ST_CLK_GATE] = clk_hw_register_gate(NULL, "oscout1", "oscout1_mux",
>                 0, st_data->base + MISCCLKCNTL1, OSCCLKENB,
> --
> 1.9.1
>
