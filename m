Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <1524817171-7258-1-git-send-email-tdas@codeaurora.org>
References: <1524817171-7258-1-git-send-email-tdas@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 30 Apr 2018 11:42:12 -0700
Message-ID: <CAD=FV=X=2nVbP+C14UMjBYveDuVYgvhbAKji6SUnXDtE8_G_uA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gdsc: Add support to poll CFG register to
 check GDSC state
To: Taniya Das <tdas@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>,
	Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	"open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Fri, Apr 27, 2018 at 1:19 AM, Taniya Das <tdas@codeaurora.org> wrote:

> -static int gdsc_is_enabled(struct gdsc *sc, unsigned int reg)
> +static int gdsc_is_enabled(struct gdsc *sc, bool en)
>  {
> +       unsigned int reg;
>         u32 val;
>         int ret;
>
> +       if (sc->flags & POLL_CFG_GDSCR)
> +               reg = sc->gdscr + CFG_GDSCR_OFFSET;
> +       else
> +               reg = sc->gds_hw_ctrl ?  sc->gds_hw_ctrl : sc->gdscr;

nit: why two spaces after the "?" in this new patch?  Should be just one.


> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 3964834..ac5f844 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -53,6 +53,7 @@ struct gdsc {
>  #define VOTABLE                BIT(0)
>  #define CLAMP_IO       BIT(1)
>  #define HW_CTRL                BIT(2)
> +#define POLL_CFG_GDSCR  BIT(5)

This doesn't apply cleanly to clk-next because clk-next already has
the old patch #1 and patch #2 from your series.  You should have
applied your patch to clk-next before sending out.

Also a nit here is that you have two spaces before "BIT(5)" but all
other entries in this list have a tab before them.  You should be
consistent and use a tab.


In general I'd tend to assume that Stephen could handle this small
merge conflict and fixing the whitespace issues when applying, but if
he tells you to spin then you certainly should.  I'll also say that
I'm nowhere near an expert on gdsc but it looks like Stephen's
previous comments were addressed and the patch seems sane in general.
Stephen: feel free to add my Reviewed-by: if you wish when applying
(or Taniya, if you end up spinning).


-Doug
