Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Message-ID: <557EF0EB.9040403@linaro.org>
Date: Mon, 15 Jun 2015 18:36:11 +0300
From: Georgi Djakov <georgi.djakov@linaro.org>
MIME-Version: 1.0
To: Paul Bolle <pebolle@tiscali.nl>
CC: sboyd@codeaurora.org, agross@codeaurora.org, mturquette@linaro.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/5] clk: qcom: Add A53 clock driver
References: <1434098519-26406-1-git-send-email-georgi.djakov@linaro.org>	 <1434098519-26406-5-git-send-email-georgi.djakov@linaro.org> <1434376712.2069.5.camel@x220>
In-Reply-To: <1434376712.2069.5.camel@x220>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 06/15/2015 04:58 PM, Paul Bolle wrote:
> On Fri, 2015-06-12 at 11:41 +0300, Georgi Djakov wrote:
>> --- /dev/null
>> +++ b/drivers/clk/qcom/clk-a53.c
> 
>> +static int __init qcom_a53_init(void)
>> +{
>> +	return platform_driver_register(&qcom_a53_driver);
>> +}
>> +arch_initcall(qcom_a53_init);
> 
> There's no function that's, well, called by module_exit() that undoes
> the above. So one can build this as a module, load that module, but not
> unload it. That's by design?
> 
> 

In general, it is not expected to unload it as this is for the
main CPU clock, but i will add a module_exit() call to make it
correct. Thanks for the comment!

BR,
Georgi
