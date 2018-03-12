Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Wei Yongjun <weiyongjun1@huawei.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1515047683-169770-1-git-send-email-weiyongjun1@huawei.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org
References: <1515047683-169770-1-git-send-email-weiyongjun1@huawei.com>
Message-ID: <152089290816.147033.15405850347853576388@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH -next] clk: qcom: msm8916: Fix return value check in
 qcom_apcs_msm8916_clk_probe()
Date: Mon, 12 Mar 2018 15:15:08 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Wei Yongjun (2018-01-03 22:34:43)
> In case of error, the function dev_get_regmap() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> =

> Fixes: 81ac38847a1d ("clk: qcom: Add APCS clock controller support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-fixes
