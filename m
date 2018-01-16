Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUURgzHV_jsU0o9DGuyCjhd8j7iU_Fs86GY2pEEx+Xh9g@mail.gmail.com>
References: <1516106529-19703-1-git-send-email-fabio.estevam@nxp.com> <CAMuHMdUURgzHV_jsU0o9DGuyCjhd8j7iU_Fs86GY2pEEx+Xh9g@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 16 Jan 2018 12:51:52 -0200
Message-ID: <CAOMZO5CeHtivG_7iF+=g=tX7BzepiVrBctMPfbEHfCs8D4Dd1g@mail.gmail.com>
Subject: Re: [PATCH] clk: Print the clock name in the warnings
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

On Tue, Jan 16, 2018 at 11:19 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> This means we still have to look into the sources, to find out which
> condition triggered. So what about improving the warning messages,
> cfr. e.g. below?

Thanks for your suggestion. I did it like this in v2.

Thanks
