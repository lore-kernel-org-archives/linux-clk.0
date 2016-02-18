Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>, "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <CAOMZO5AZbe2PKysy353Q-3w_+WY0HQD4EYtq24SzwadoQ4ikeA@mail.gmail.com>
Cc: linux-clk@vger.kernel.org, peter.chen@nxp.com,
 "Lee Jones" <lee.jones@linaro.org>
References: <CAOMZO5AZbe2PKysy353Q-3w_+WY0HQD4EYtq24SzwadoQ4ikeA@mail.gmail.com>
Message-ID: <20160218013839.2278.23558@quark.deferred.io>
Subject: Re: Keeping a clock enabled during suspend
Date: Wed, 17 Feb 2016 17:38:39 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Fabio Estevam (2016-02-03 09:04:07)
> Hi,
> =

> I am trying to implement a workaround for a mx25 USB erratum issue
> (ENGcm08333), where I need to keep the USB clock turned on when the
> system enters in suspend.
> =

> Is it possible to indicate that a clock needs to be kept enabled in
> suspend with the current clock framework?
> =

> I saw this attempt from Lee Jones:
> https://lkml.org/lkml/2015/4/8/9

That link didn't resolve for me but I'm guessing those are the CRITICAL
clk patches.

That flag is designed to keep a clock on always, so it may do what you
want, but I'd like to know more first.

Where does your clock get cut? Is there a clk_disable call in a suspend
callback that does this to your USB clk?

Regards,
Mike

> =

> Any suggestions?
> =

> Thanks,
> =

> Fabio Estevam
