Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
To: =?utf-8?q?Alexander_M=C3=BCller?= <serveralex@gmail.com>,
 linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
 <1467741391-60534-4-git-send-email-serveralex@gmail.com>
In-Reply-To: <1467741391-60534-4-git-send-email-serveralex@gmail.com>
Message-ID: <146776490365.35356.4549950541188860670@resonance>
Subject: Re: [PATCH 3/7] meson: clk: Rename register names according to Amlogic
 datasheet
Date: Tue, 05 Jul 2016 17:28:23 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Alexander M=C3=BCller (2016-07-05 10:56:27)
> Signed-off-by: Alexander M=C3=BCller <serveralex@gmail.com>
> +#define HHI_MPLL_CNTL                  0x280 /* 0xa0 offset in data shee=
t */
> +#define HHI_SYS_PLL_CNTL               0x300 /* 0xc0 offset in data shee=
t */
> +#define HHI_VID_PLL_CNTL               0x320 /* 0xc8 offset in data shee=
t */

Nitpick: these three regs are not present in the data sheet, which is
why I did not include the comment for these three addresses originally.

Regards,
Mike
