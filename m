Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160218013839.2278.23558@quark.deferred.io>
References: <CAOMZO5AZbe2PKysy353Q-3w_+WY0HQD4EYtq24SzwadoQ4ikeA@mail.gmail.com>
	<20160218013839.2278.23558@quark.deferred.io>
Date: Mon, 22 Feb 2016 14:18:00 -0300
Message-ID: <CAOMZO5BnmSoi9oNJLi4+EzVxr+bFo2bZo0X_ktv5aK+5QnAGRQ@mail.gmail.com>
Subject: Re: Keeping a clock enabled during suspend
From: Fabio Estevam <festevam@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, peter.chen@nxp.com,
	Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Feb 17, 2016 at 11:38 PM, Michael Turquette
<mturquette@baylibre.com> wrote:

> That link didn't resolve for me but I'm guessing those are the CRITICAL
> clk patches.
>
> That flag is designed to keep a clock on always, so it may do what you
> want, but I'd like to know more first.

Yes, let me give it a try with CLK_IS_CRITICAL once it reaches
linux-next. I think that should solve this issue, thanks.
