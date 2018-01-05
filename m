Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <1515047794-170174-1-git-send-email-weiyongjun1@huawei.com>
References: <1515047794-170174-1-git-send-email-weiyongjun1@huawei.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 5 Jan 2018 12:59:38 +0900
Message-ID: <CAK7LNAQXTg=A6udMPs4dptbaLz1U5+D4JBJaW0W8d_EgH_R1_A@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_=2Dnext=5D_clk=3A_hisilicon=3A_hi3660=EF=BC=9AFix_poten?=
	=?UTF-8?Q?tial_NULL_dereference_in_hi3660=5Fstub=5Fclk=5Fprobe=28=29?=
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Kaihua Zhong <zhongkaihua@huawei.com>, Leo Yan <leo.yan@linaro.org>,
        Ruyi Wang <wangruyi@huawei.com>, Kai Zhao <zhaokai1@hisilicon.com>,
        Tao Wang <kevin.wangtao@hisilicon.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

2018-01-04 15:36 GMT+09:00 Wei Yongjun <weiyongjun1@huawei.com>:
> platform_get_resource() may return NULL, add proper check to
> avoid potential NULL dereferencing.
>
> This is detected by Coccinelle semantic patch.
>
> @@
> expression pdev, res, n, t, e, e1, e2;
> @@
>
> res = platform_get_resource(pdev, t, n);
> + if (!res)
> +   return -EINVAL;
> ... when != res == NULL
> e = devm_ioremap(e1, res->start, e2);
>
> Fixes: 4f16f7ff3bc0 ("clk: hisilicon: Add support for Hi3660 stub clocks")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/clk/hisilicon/clk-hi3660-stub.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/hisilicon/clk-hi3660-stub.c b/drivers/clk/hisilicon/clk-hi3660-stub.c
> index 9b6c72b..e8b2c43 100644
> --- a/drivers/clk/hisilicon/clk-hi3660-stub.c
> +++ b/drivers/clk/hisilicon/clk-hi3660-stub.c
> @@ -149,6 +149,8 @@ static int hi3660_stub_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(stub_clk_chan.mbox);
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -EINVAL;
>         freq_reg = devm_ioremap(dev, res->start, resource_size(res));
>         if (!freq_reg)
>                 return -ENOMEM;


Probably, it is better to use devm_ioremap_resource().
This checks NULL input.



-- 
Best Regards
Masahiro Yamada
