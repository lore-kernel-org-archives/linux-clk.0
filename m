Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
Date: Wed, 3 Feb 2016 15:04:07 -0200
Message-ID: <CAOMZO5AZbe2PKysy353Q-3w_+WY0HQD4EYtq24SzwadoQ4ikeA@mail.gmail.com>
Subject: Keeping a clock enabled during suspend
From: Fabio Estevam <festevam@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, peter.chen@nxp.com,
	Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

I am trying to implement a workaround for a mx25 USB erratum issue
(ENGcm08333), where I need to keep the USB clock turned on when the
system enters in suspend.

Is it possible to indicate that a clock needs to be kept enabled in
suspend with the current clock framework?

I saw this attempt from Lee Jones:
https://lkml.org/lkml/2015/4/8/9

Any suggestions?

Thanks,

Fabio Estevam
