Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Kai Zhao <zhaokai1@hisilicon.com>, Kaihua Zhong <zhongkaihua@huawei.com>,
 Leo Yan <leo.yan@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Ruyi Wang <wangruyi@huawei.com>, Stephen Boyd <sboyd@codeaurora.org>,
 Tao Wang <kevin.wangtao@hisilicon.com>, Wei Yongjun <weiyongjun1@huawei.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1515047794-170174-1-git-send-email-weiyongjun1@huawei.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-clk@vger.kernel.org
References: <1515047794-170174-1-git-send-email-weiyongjun1@huawei.com>
Message-ID: <152089282248.147033.8539609925147287088@swboyd.mtv.corp.google.com>
Subject: =?utf-8?q?Re=3A_=5BPATCH_-next=5D_clk=3A_hisilicon=3A_hi3660=EF=BC=9AFix_?=
 =?utf-8?q?potential_NULL_dereference_in_hi3660=5Fstub=5Fclk=5Fprobe=28=29?=
Date: Mon, 12 Mar 2018 15:13:42 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Wei Yongjun (2018-01-03 22:36:34)
> platform_get_resource() may return NULL, add proper check to
> avoid potential NULL dereferencing.
> =

> This is detected by Coccinelle semantic patch.
> =

> @@
> expression pdev, res, n, t, e, e1, e2;
> @@
> =

> res =3D platform_get_resource(pdev, t, n);
> + if (!res)
> +   return -EINVAL;
> ... when !=3D res =3D=3D NULL
> e =3D devm_ioremap(e1, res->start, e2);
> =

> Fixes: 4f16f7ff3bc0 ("clk: hisilicon: Add support for Hi3660 stub clocks")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied to clk-fixes
