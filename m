Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF7937AA97;
	Fri, 25 Sep 2026 15:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348539; cv=none; b=KTGek9hI2P6TXvXx+RltLo+bWUoMYjnn4ecIVaFFI1LWaFKu2uhqEaJduFt95KwXBMaCnNI/D5MfHddOYqidU5bi6aRjMHoJow0bYVM3vIczdRNcjpx6GgmrN805tsLX4hJlmqpPfVOWwakmtffQdpbAnMc4+aAecccHdduXFkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348539; c=relaxed/simple;
	bh=CSun39gInhtIedDtysHo39/F4SBNIot2xNyw1oD6vO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8rAbQ/WGgc/TV2XIZpJZjzRPg27BzRF0gESYISyadyvvu/BjuXs3GWT2QrHTBdlXiFc32XSfSOiT1iDaIXL7S9HhQ4RykHJozWcpJegdkIgbnmupm5PQqwQu2uqRY40mcYF41syteOT3tmus8fOD9Rpyi+4FmIt3j6LFGrYuBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTdJ+P0+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTdJ+P0+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F651F000FF;
	Fri, 25 Sep 2026 15:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790348527;
	bh=PTnU+g9dXk5TCSxeirUwdQO0n3xV/HSWuf9fQ3x5egs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CTdJ+P0+d28HfgOMOsFG1/vSXaklLfFKz/Gye+/zwqfW50JKhIelYKMkLlARCXNNW
	 dLitddK5CmjjtkGQBe4RPZgh/3WdCVlSTvULwKXAOCjorx3+JVjuYiQNDbp3sZHwI1
	 nZ+hnBcp4uMIl2OL6ZMHWYoNUDvhP8h+Xmv5m1rxe7y0NJWCDilst3lc6bzfBl64h2
	 /5op9G+EfHEQ5sqRYEUoewWaPWGAmubUOSVak6YvVFDu8u77R3GfeuWJ8RrbOnek+v
	 qjWiMVu5X03YmxnR3pFmDE8rFqGq0STETrgyy5k/bEDV5+ZKShmGI9xsdEEL4RX4L7
	 hz9eBaS8/q+YA==
Message-ID: <f45985ee-afbe-4c97-b2bd-3cec4a6bc54a@kernel.org>
Date: Fri, 25 Sep 2026 10:02:05 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: socfpga: agilex: convert to CLK_OF_DECLARE()
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>,
 Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
 <c7006ac0c353640f52902580564a85d6d23c57e5.1789096458.git.adrian.ho.yin.ng@altera.com>
 <aq2-Ysy2wbLeBWd1@redhat.com>
 <1abffb74-3b9d-494d-a414-ea21d537ed74@altera.com>
 <1jh5jd8yk0.fsf@starbuckisacylon.baylibre.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <1jh5jd8yk0.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/25/26 04:34, Jerome Brunet wrote:
> On lun. 21 sept. 2026 at 11:17, "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com> wrote:
> 
>> On 9/19/2026 6:42 AM, Brian Masney wrote:
>>> Hi Adrian,
>>>
>>> On Fri, Sep 11, 2026 at 03:01:18PM +0800, adrian.ho.yin.ng@altera.com wrote:
>>>> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>>>>
>>>> Register Agilex and eASIC N5X clocks at of_clk_init() so they are
>>>> available before platform devices probe.
>>>>
>>>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>>>> ---
>>>>    drivers/clk/socfpga/clk-agilex.c | 83 +++++++++++---------------------
>>>>    1 file changed, 28 insertions(+), 55 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
>>>> index 2bdea1997b5e..64a20c727d16 100644
>>>> --- a/drivers/clk/socfpga/clk-agilex.c
>>>> +++ b/drivers/clk/socfpga/clk-agilex.c
>>>> @@ -4,8 +4,9 @@
>>>>     */
>>>>    #include <linux/slab.h>
>>>>    #include <linux/clk-provider.h>
>>>> +#include <linux/io.h>
>>>>    #include <linux/of.h>
>>>> -#include <linux/platform_device.h>
>>>> +#include <linux/of_address.h>
>>>>    
>>>>    #include <dt-bindings/clock/agilex-clock.h>
>>>>    
>>>> @@ -454,24 +455,26 @@ static int n5x_clk_register_pll(const struct stratix10_pll_clock *clks,
>>>>    	return 0;
>>>>    }
>>>>    
>>>> -static int agilex_clkmgr_init(struct platform_device *pdev)
>>>> +static void __init agilex_clkmgr_init(struct device_node *np)
>>>>    {
>>>> -	struct device_node *np = pdev->dev.of_node;
>>>> -	struct device *dev = &pdev->dev;
>>>>    	struct stratix10_clock_data *clk_data;
>>>>    	void __iomem *base;
>>>>    	int i, num_clks;
>>>>    
>>>> -	base = devm_platform_ioremap_resource(pdev, 0);
>>>> -	if (IS_ERR(base))
>>>> -		return PTR_ERR(base);
>>>> +	base = of_iomap(np, 0);
>>>> +	if (!base) {
>>>> +		pr_err("%s: failed to map clock registers\n", __func__);
>>>> +		return;
>>>> +	}
>>>>    
>>>>    	num_clks = AGILEX_NUM_CLKS;
>>>>    
>>>> -	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
>>>> -				num_clks), GFP_KERNEL);
>>>> -	if (!clk_data)
>>>> -		return -ENOMEM;
>>>> +	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, num_clks),
>>>> +			   GFP_KERNEL);
>>>> +	if (!clk_data) {
>>>> +		iounmap(base);
>>>> +		return;
>>>> +	}
>>>>    
>>>>    	clk_data->clk_data.num = num_clks;
>>>>    	clk_data->base = base;
>>>> @@ -491,27 +494,28 @@ static int agilex_clkmgr_init(struct platform_device *pdev)
>>>>    	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
>>>>    			      clk_data);
>>>>    	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
>>>> -	return 0;
>>>>    }
>>>>    
>>>> -static int n5x_clkmgr_init(struct platform_device *pdev)
>>>> +static void __init n5x_clkmgr_init(struct device_node *np)
>>>>    {
>>>> -	struct device_node *np = pdev->dev.of_node;
>>>> -	struct device *dev = &pdev->dev;
>>>>    	struct stratix10_clock_data *clk_data;
>>>>    	void __iomem *base;
>>>>    	int i, num_clks;
>>>>    
>>>> -	base = devm_platform_ioremap_resource(pdev, 0);
>>>> -	if (IS_ERR(base))
>>>> -		return PTR_ERR(base);
>>>> +	base = of_iomap(np, 0);
>>>> +	if (!base) {
>>>> +		pr_err("%s: failed to map clock registers\n", __func__);
>>>> +		return;
>>>> +	}
>>>>    
>>>>    	num_clks = AGILEX_NUM_CLKS;
>>>>    
>>>> -	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
>>>> -				num_clks), GFP_KERNEL);
>>>> -	if (!clk_data)
>>>> -		return -ENOMEM;
>>>> +	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, num_clks),
>>>> +			   GFP_KERNEL);
>>>> +	if (!clk_data) {
>>>> +		iounmap(base);
>>>> +		return;
>>>> +	}
>>>>    
>>>>    	clk_data->base = base;
>>>>    	clk_data->clk_data.num = num_clks;
>>>> @@ -531,38 +535,7 @@ static int n5x_clkmgr_init(struct platform_device *pdev)
>>>>    	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
>>>>    			      clk_data);
>>>>    	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
>>>> -	return 0;
>>>> -}
>>>> -
>>>> -static int agilex_clkmgr_probe(struct platform_device *pdev)
>>>> -{
>>>> -	int (*probe_func)(struct platform_device *init_func);
>>>> -
>>>> -	probe_func = of_device_get_match_data(&pdev->dev);
>>>> -	if (!probe_func)
>>>> -		return -ENODEV;
>>>> -	return	probe_func(pdev);
>>>>    }
>>>>    
>>>> -static const struct of_device_id agilex_clkmgr_match_table[] = {
>>>> -	{ .compatible = "intel,agilex-clkmgr",
>>>> -	  .data = agilex_clkmgr_init },
>>>> -	{ .compatible = "intel,easic-n5x-clkmgr",
>>>> -	  .data = n5x_clkmgr_init },
>>>> -	{ }
>>>> -};
>>>> -
>>>> -static struct platform_driver agilex_clkmgr_driver = {
>>>> -	.probe		= agilex_clkmgr_probe,
>>>> -	.driver		= {
>>>> -		.name	= "agilex-clkmgr",
>>>> -		.suppress_bind_attrs = true,
>>>> -		.of_match_table = agilex_clkmgr_match_table,
>>>> -	},
>>>> -};
>>>> -
>>>> -static int __init agilex_clk_init(void)
>>>> -{
>>>> -	return platform_driver_register(&agilex_clkmgr_driver);
>>>> -}
>>>> -core_initcall(agilex_clk_init);
>>>> +CLK_OF_DECLARE(agilex_clkmgr, "intel,agilex-clkmgr", agilex_clkmgr_init);
>>>> +CLK_OF_DECLARE(n5x_clkmgr, "intel,easic-n5x-clkmgr", n5x_clkmgr_init);
>>>
>>> Why do all of these clk providers need to be registered so early?
>>> CLK_OF_DECLARE is abused quite a bit today and the majority of the clk
>>> drivers that use it don't actually need it.
>>>
>> Hi Brian,
>>
>> Thanks for the review.
>>
>> subsys_initcall() / subsys_platform_driver() would not fix the failure
>> we are hitting. Both still run after time_init(), while the DW APB timer
>> is registered via TIMER_OF_DECLARE from timer_probe().
> 
> You presumably only need a tiny subset of clock to feed the timer, not
> the whole controller
> 
> Can you just register those early ?  clk_mt8173_infracfg* does that for example.
>>
>
I was thinking that, yes. Thanks for bringing it up.

Dinh
