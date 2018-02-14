Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [PATCH -next] clk: samsung: exynos-audss: Remove redundant
 dev_err call in exynos_audss_clk_probe()
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <240b9be5-429c-ca34-63c6-bdd260970ca8@samsung.com>
Date: Wed, 14 Feb 2018 15:43:34 +0100
MIME-version: 1.0
In-reply-to: <1516188378-144847-1-git-send-email-weiyongjun1@huawei.com>
Content-type: text/plain; charset="utf-8"
References: <1516188378-144847-1-git-send-email-weiyongjun1@huawei.com>
	<CGME20180214144350epcas1p1d66e605e6d68de23661f51ced410d72e@epcas1p1.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/17/2018 12:26 PM, Wei Yongjun wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied, thanks.
