Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Paul Burton <paul.burton@imgtec.com>,  linux-mips@linux-mips.org
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1429881457-16016-29-git-send-email-paul.burton@imgtec.com>
Cc: "Paul Burton" <paul.burton@imgtec.com>,
 "Lars-Peter Clausen" <lars@metafoo.de>, "Ralf Baechle" <ralf@linux-mips.org>,
 "Stephen Boyd" <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
References: <1429881457-16016-1-git-send-email-paul.burton@imgtec.com>
 <1429881457-16016-29-git-send-email-paul.burton@imgtec.com>
Message-ID: <20150513030652.20636.98939@quantum>
Subject: Re: [PATCH v4 28/37] MIPS,
 clk: move jz4740 UDC auto suspend functions to jz4740-cgu
Date: Tue, 12 May 2015 20:06:52 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Paul,

Quoting Paul Burton (2015-04-24 06:17:28)
> -void jz4740_clock_udc_disable_auto_suspend(void)
> -{
> -       jz_clk_reg_clear_bits(JZ_REG_CLOCK_GATE, JZ_CLOCK_GATE_UDC);
> -}
> -EXPORT_SYMBOL_GPL(jz4740_clock_udc_disable_auto_suspend);
> -
> -void jz4740_clock_udc_enable_auto_suspend(void)
> -{
> -       jz_clk_reg_set_bits(JZ_REG_CLOCK_GATE, JZ_CLOCK_GATE_UDC);
> -}
> -EXPORT_SYMBOL_GPL(jz4740_clock_udc_enable_auto_suspend);

I couldn't find a caller for these functions. Where and how are they
used?

Thanks,
Mike
