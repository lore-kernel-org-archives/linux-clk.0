Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: David Lechner <david@lechnology.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Wei Yongjun <weiyongjun1@huawei.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1521684708-79015-1-git-send-email-weiyongjun1@huawei.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-clk@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <1521684708-79015-1-git-send-email-weiyongjun1@huawei.com>
Message-ID: <152182351300.178046.6457097306354234373@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH -next] clk: davinci: Remove redundant dev_err calls
Date: Fri, 23 Mar 2018 09:45:13 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Wei Yongjun (2018-03-21 19:11:48)
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> =

> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-next
