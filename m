Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Paul Burton <paul.burton@imgtec.com>,  linux-mips@linux-mips.org
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1429881457-16016-28-git-send-email-paul.burton@imgtec.com>
Cc: "Paul Burton" <paul.burton@imgtec.com>,
 "Lars-Peter Clausen" <lars@metafoo.de>, "Ralf Baechle" <ralf@linux-mips.org>,
 "Stephen Boyd" <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
References: <1429881457-16016-1-git-send-email-paul.burton@imgtec.com>
 <1429881457-16016-28-git-send-email-paul.burton@imgtec.com>
Message-ID: <20150513025600.20636.34201@quantum>
Subject: Re: [PATCH v4 27/37] MIPS, clk: move jz4740_clock_set_wait_mode to jz4740-cgu
Date: Tue, 12 May 2015 19:56:00 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Paul,

Quoting Paul Burton (2015-04-24 06:17:27)
> +void jz4740_clock_set_wait_mode(enum jz4740_wait_mode mode)
> +{
> +       uint32_t lcr =3D readl(cgu->base + CGU_REG_LCR);
> +
> +       switch (mode) {
> +       case JZ4740_WAIT_MODE_IDLE:
> +               lcr &=3D ~LCR_SLEEP;
> +               break;
> +
> +       case JZ4740_WAIT_MODE_SLEEP:
> +               lcr |=3D LCR_SLEEP;
> +               break;
> +       }
> +
> +       writel(lcr, cgu->base + CGU_REG_LCR);
> +}

What do these modes do? How are they used?

Do you think the above function is a good candidate for .prepare and
.unprepare callback?

Regards,
Mike
