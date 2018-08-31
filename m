Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jiancheng Xue <xuejiancheng@hisilicon.com>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180726004719.GA9896@embeddedor.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
References: <20180726004719.GA9896@embeddedor.com>
Message-ID: <153573701576.93865.614018614668737096@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2] reset: hisilicon: fix potential NULL pointer dereference
Date: Fri, 31 Aug 2018 10:36:55 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Gustavo A. R. Silva (2018-07-25 17:47:19)
> There is a potential execution path in which function
> platform_get_resource() returns NULL. If this happens,
> we will end up having a NULL pointer dereference.
> =

> Fix this by replacing devm_ioremap with devm_ioremap_resource,
> which has the NULL check and the memory region request.
> =

> This code was detected with the help of Coccinelle.
> =

> Cc: stable@vger.kernel.org
> Fixes: 97b7129cd2af ("reset: hisilicon: change the definition of hisi_res=
et_init")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---

Nobody has reviewed, so I guess applied to clk-next unless someone
complains.
