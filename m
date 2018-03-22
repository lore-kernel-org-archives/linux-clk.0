Return-Path: <david@lechnology.com>
Subject: Re: [PATCH -next] clk: davinci: Remove redundant dev_err calls
To: Wei Yongjun <weiyongjun1@huawei.com>, Sekhar Nori <nsekhar@ti.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <1521684708-79015-1-git-send-email-weiyongjun1@huawei.com>
From: David Lechner <david@lechnology.com>
Message-ID: <ee04575d-e869-b696-8fc2-de908a5cdb4a@lechnology.com>
Date: Thu, 22 Mar 2018 11:28:28 -0500
MIME-Version: 1.0
In-Reply-To: <1521684708-79015-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 03/21/2018 09:11 PM, Wei Yongjun wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Reviewed-by: David Lechner <david@lechnology.com>
