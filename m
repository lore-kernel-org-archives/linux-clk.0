Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Paul Burton <paul.burton@imgtec.com>,  linux-mips@linux-mips.org
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1429881457-16016-27-git-send-email-paul.burton@imgtec.com>
Cc: "Paul Burton" <paul.burton@imgtec.com>,
 "Ian Campbell" <ijc+devicetree@hellion.org.uk>,
 "Kumar Gala" <galak@codeaurora.org>, "Lars-Peter Clausen" <lars@metafoo.de>,
 "Mark Rutland" <mark.rutland@arm.com>, "Pawel Moll" <pawel.moll@arm.com>,
 "Ralf Baechle" <ralf@linux-mips.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Stephen Boyd" <sboyd@codeaurora.org>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <1429881457-16016-1-git-send-email-paul.burton@imgtec.com>
 <1429881457-16016-27-git-send-email-paul.burton@imgtec.com>
Message-ID: <20150513025204.20636.10155@quantum>
Subject: Re: [PATCH v4 26/37] MIPS,clk: migrate JZ4740 to common clock framework
Date: Tue, 12 May 2015 19:52:04 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Paul,

Quoting Paul Burton (2015-04-24 06:17:26)
> +static void __init jz4740_cgu_init(struct device_node *np)
> +{
> +       int retval;
> +
> +       cgu =3D ingenic_cgu_new(jz4740_cgu_clocks,
> +                             ARRAY_SIZE(jz4740_cgu_clocks), np);
> +       if (!cgu) {
> +               pr_err("%s: failed to initialise CGU\n", __func__);
> +               return;
> +       }
> +
> +       retval =3D ingenic_cgu_register_clocks(cgu);
> +       if (retval)
> +               pr_err("%s: failed to register CGU Clocks\n", __func__);
> +}
> +CLK_OF_DECLARE(jz4740_cgu, "ingenic,jz4740-cgu", jz4740_cgu_init);
> -- =

> 2.3.5
> =


Patch looks good to me, but I have one question. Is it possible for you
to have a proper platform_device for the cgu instead of relying on
CLK_OF_DECLARE?

For an example of a clock driver that does this, check out the bottom of
drivers/clk/qcom/gcc-msm8660.c.

Regards,
Mike
