Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: kernel@martin.sperl.org, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Stephen Warren" <swarren@wwwdotorg.org>, "Lee Jones" <lee@kernel.org>,
 "Eric Anholt" <eric@anholt.net>, "Remi Pommarel" <repk@triplefau.lt>,
 linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1452542157-2387-3-git-send-email-kernel@martin.sperl.org>
Cc: "Martin Sperl" <kernel@martin.sperl.org>
References: <1452542157-2387-1-git-send-email-kernel@martin.sperl.org>
 <1452542157-2387-3-git-send-email-kernel@martin.sperl.org>
Message-ID: <20160113200755.1168.19225@quark.deferred.io>
Subject: Re: [PATCH V2 2/4] clk: bcm2835: enable fractional and mash support
Date: Wed, 13 Jan 2016 12:07:55 -0800
List-ID: <linux-clk.vger.kernel.org>

Hi Martin,

Quoting kernel@martin.sperl.org (2016-01-11 11:55:54)
> @@ -1274,9 +1283,50 @@ static int bcm2835_clock_set_rate(struct clk_hw *h=
w,
>         struct bcm2835_cprman *cprman =3D clock->cprman;
>         const struct bcm2835_clock_data *data =3D clock->data;
>         u32 div =3D bcm2835_clock_choose_div(hw, rate, parent_rate, false=
);
> +       u32 ctl, mash;
> +       bool enabled;
> =

> +       spin_lock(&cprman->regs_lock);
> +       /* check if divider is identical, then return */
> +       if (div =3D=3D cprman_read(cprman, data->div_reg))
> +               goto unlock;
> +
> +       /* it is recommended to only set clock registers when disabled */
> +       ctl =3D cprman_read(cprman, data->ctl_reg);
> +       enabled =3D ctl & CM_ENABLE;
> +       if (enabled) {
> +               /* disable clock */
> +               cprman_write(cprman, data->ctl_reg, ctl);

This seems unsafe to me. Any IP block consuming this signal will have
its clock cut without warning!

If you need to enforce this behavior we provide the CLK_SET_RATE_GATE
flag to handle it at the framework level.

Regards,
Mike
