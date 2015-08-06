Return-Path: <abrestic@google.com>
MIME-Version: 1.0
Sender: abrestic@google.com
In-Reply-To: <1438868614-7672-3-git-send-email-govindraj.raja@imgtec.com>
References: <1438868614-7672-1-git-send-email-govindraj.raja@imgtec.com>
	<1438868614-7672-3-git-send-email-govindraj.raja@imgtec.com>
Date: Thu, 6 Aug 2015 09:23:18 -0700
Message-ID: <CAL1qeaEEndYJc7kVW9hgEZYGnVs8tFBy7y0sObiS8GVj=ta88w@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: pistachio: Fix override of clk-pll settings from
 boot loader
From: Andrew Bresticker <abrestic@chromium.org>
To: Govindraj Raja <govindraj.raja@imgtec.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, linux-clk@vger.kernel.org,
	Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>, Zdenko Pulitika <zdenko.pulitika@imgtec.com>,
	Kevin Cernekee <cernekee@chromium.org>, Ralf Baechle <ralf@linux-mips.org>,
	James Hartley <James.Hartley@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>,
	James Hogan <James.Hogan@imgtec.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Govindraj,

On Thu, Aug 6, 2015 at 6:43 AM, Govindraj Raja
<govindraj.raja@imgtec.com> wrote:
> From: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
>
> Pll enable callbacks are overriding PLL mode (int/frac) and
> Noise reduction (on/off) settings set by the boot loader which
> results in the incorrect clock rate.

Please be consistent about how "PLL" is written out.  Since it's an
acronym, it should be in caps.

> PLL mode and noise reduction are defined by the DSMPD and DACPD bits
> of the pll control register. Pll .enable() callbacks enable pll
> by deasserting all power-down bits of the pll control register,
> including DSMPD and DACPD bits, which is not necessary since
> these bits don't actually enable/disable pll.
>
> This commit fixes the problem by removing DSMPD and DACPD bits
> from the "pll enable" mask.
>
> Signed-off-by: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>

Otherwise,

Reviewed-by: Andrew Bresitcker <abrestic@chromium.org>
