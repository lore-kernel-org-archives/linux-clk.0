Return-Path: <pebolle@tiscali.nl>
Message-ID: <1434376712.2069.5.camel@x220>
Subject: Re: [PATCH 4/5] clk: qcom: Add A53 clock driver
From: Paul Bolle <pebolle@tiscali.nl>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, mturquette@linaro.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Date: Mon, 15 Jun 2015 15:58:32 +0200
In-Reply-To: <1434098519-26406-5-git-send-email-georgi.djakov@linaro.org>
References: <1434098519-26406-1-git-send-email-georgi.djakov@linaro.org>
	 <1434098519-26406-5-git-send-email-georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2015-06-12 at 11:41 +0300, Georgi Djakov wrote:
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-a53.c

> +static int __init qcom_a53_init(void)
> +{
> +	return platform_driver_register(&qcom_a53_driver);
> +}
> +arch_initcall(qcom_a53_init);

There's no function that's, well, called by module_exit() that undoes
the above. So one can build this as a module, load that module, but not
unload it. That's by design?


Paul Bolle
