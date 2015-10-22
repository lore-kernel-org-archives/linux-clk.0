Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: York Sun <yorksun@freescale.com>,  sboyd@codeaurora.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1444240750-30842-1-git-send-email-yorksun@freescale.com>
Cc: linux-clk@vger.kernel.org, "York Sun" <yorksun@freescale.com>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Guenter Roeck" <linux@roeck-us.net>, "Andrey Filippov" <andrey@elphel.com>,
 "Paul Bolle" <pebolle@tiscali.nl>
References: <1444240750-30842-1-git-send-email-yorksun@freescale.com>
Message-ID: <20151022164642.20687.57688@quantum>
Subject: Re: [Patch v6] driver/clk/clk-si5338: Add common clock framework driver for
 si5338
Date: Thu, 22 Oct 2015 09:46:42 -0700
List-ID: <linux-clk.vger.kernel.org>

Hello York Sun,

Quoting York Sun (2015-10-07 10:59:10)
> +static const struct clk_ops si5338_xtal_ops =3D {
> +       .prepare =3D si5338_xtal_prepare,

There are many instances of .prepare where there is no matching
.unprepare. Why is that? And what are these .prepare callbacks doing?
Are they changing rates or just enabling the clock signals?

> +static const struct clk_ops si5338_clkout_ops =3D {
> +       .prepare =3D si5338_clkout_prepare,
> +       .unprepare =3D si5338_clkout_unprepare,
> +       .enable =3D si5338_clkout_enable,
> +       .disable =3D si5338_clkout_disable,

This is an i2c device, so I'm confused how an .enable or .disable
callback is appropriate.

> +       /*
> +        * To form clock names, concatentate name prefix with each name.
> +        * The result string is up to MAX_NAME_LENGTH including terminati=
on.
> +        */
> +
> +       /* Register xtal input clock */
> +       if (!IS_ERR_OR_NULL(drvdata->pxtal)) {
> +               strlcpy(register_name, drvdata->name_prefix, MAX_NAME_PRE=
FIX);
> +               strncat(register_name, si5338_input_names[4], STRNCAT_LEN=
GTH);
> +               drvdata->pxtal_name =3D __clk_get_name(drvdata->pxtal);

I don't really understand what's going on here. Why is this necessary?
Are you not able to get this info from DT?

Regards,
Mike
