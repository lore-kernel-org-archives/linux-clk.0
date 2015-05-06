Return-Path: <zhangfei.gao@linaro.org>
Return-Path: <zhangfei.gao@linaro.org>
Message-ID: <5549D709.2050509@linaro.org>
Date: Wed, 06 May 2015 16:55:37 +0800
From: zhangfei <zhangfei.gao@linaro.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
 Mike Turquette <mturquette@linaro.org>
CC: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 07/19] clk: hix5hd2: Silence sparse warnings
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org> <1430897996-11597-8-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-8-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 05/06/2015 03:39 PM, Stephen Boyd wrote:
> drivers/clk/hisilicon/clk-hix5hd2.c:255:13: warning: symbol 'hix5hd2_clk_register_complex' was not declared. Should it be static?
>
> Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Zhangfei Gao <zhangfei.gao@linaro.org>

Thanks

> ---
>   drivers/clk/hisilicon/clk-hix5hd2.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/hisilicon/clk-hix5hd2.c b/drivers/clk/hisilicon/clk-hix5hd2.c
> index f1d239435826..78bd95b6fc7b 100644
> --- a/drivers/clk/hisilicon/clk-hix5hd2.c
> +++ b/drivers/clk/hisilicon/clk-hix5hd2.c
> @@ -252,8 +252,9 @@ static struct clk_ops clk_complex_ops = {
>   	.disable = clk_complex_disable,
>   };
>
> -void __init hix5hd2_clk_register_complex(struct hix5hd2_complex_clock *clks,
> -					 int nums, struct hisi_clock_data *data)
> +static void __init
> +hix5hd2_clk_register_complex(struct hix5hd2_complex_clock *clks, int nums,
> +			     struct hisi_clock_data *data)
>   {
>   	void __iomem *base = data->base;
>   	int i;
>
