Return-Path: <lho@apm.com>
MIME-Version: 1.0
In-Reply-To: <20160129205820.GU12841@codeaurora.org>
References: <1453256863-15092-1-git-send-email-lho@apm.com>
	<1453256863-15092-3-git-send-email-lho@apm.com>
	<20160129205820.GU12841@codeaurora.org>
Date: Fri, 29 Jan 2016 13:44:21 -0800
Message-ID: <CAPw-ZT=mxyGUzvhWBZ8TA32THiQPNoKFwrU4X9J1y2MwzTm-zA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: xgene: Add SoC and PMD PLL clocks with v2 hardware
From: Loc Ho <lho@apm.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
	"patches@apm.com" <patches@apm.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen & All,

On Fri, Jan 29, 2016 at 12:58 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 01/19, Loc Ho wrote:
>> Add X-Gene SoC and PMD PLL clocks support for v2 hardware.
>> X-Gene SoC v2 and above use an slightly different SoC
>> and PMD PLL hardware logic.
>>
>> Signed-off-by: Loc Ho <lho@apm.com>
>> ---
>
> It's not from this patch, but I notice that we have a return
> inside a void function in this file...
>
> ---8<---
> From: Stephen Boyd <sboyd@codeaurora.org>
> Subject: [PATCH] clk: xgene: Remove return from void function
>
> This function doesn't return anything because it's void. Drop the
> return statement.
>
> Cc: Loc Ho <lho@apm.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/clk-xgene.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
> index 266d573b9134..bd7156baa08b 100644
> --- a/drivers/clk/clk-xgene.c
> +++ b/drivers/clk/clk-xgene.c
> @@ -50,7 +50,7 @@ static inline u32 xgene_clk_read(void __iomem *csr)
>
>  static inline void xgene_clk_write(u32 data, void __iomem *csr)
>  {
> -       return writel_relaxed(data, csr);
> +       writel_relaxed(data, csr);
>  }
>
>  /* PLL Clock */

Thanks for spotting this. Was my original patch for v2 X-Gene HW
pulled in an specify GIT tree? I don't see it in the clk GIT master.

-Loc
