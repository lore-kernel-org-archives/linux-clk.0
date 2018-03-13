Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <20180313203719.75639-1-dbasehore@chromium.org>
References: <20180313203719.75639-1-dbasehore@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Mar 2018 14:57:51 -0700
Message-ID: <CAD=FV=UK-Rnto+iH8TSuTyzt010HT8Ujk0TX74hA1D5Lh4HfOQ@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: Add 1.6GHz PLL rate
To: Derek Basehore <dbasehore@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	sboyd@kernel.org, Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Tue, Mar 13, 2018 at 1:37 PM, Derek Basehore <dbasehore@chromium.org> wrote:
> We need this rate to generate 100, 200, and 228.57MHz from the same
> PLL. 228.57MHz is useful for a pixel clock when the VPLL is used for
> and external display.
>
> Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> ---
>  drivers/clk/rockchip/clk-rk3399.c | 1 +
>  1 file changed, 1 insertion(+)

Looks good to me.  I spent a little bit of time poking at this and I
agreed it's the best way to make 1.6 GHz in
<http://crosreview.com/956677>.  Lin Huang at Rockchip also said:

> yes, we also use this setting for 1.6GHz in our internal branch.

...and they seem to agree this is a sane setting.  Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
