Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3291743C061
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328853; cv=none; b=VPVc6LSPnPOaD9U8HqRe3cqAg+B0dn75GSJW5HA+eMRMVbb3Vgh2JbvviKEE1+vgdfQNs1/tBeMZ+hFwmn9Rx24V4RgbmfBpRVqJC+vwQm8w05ObT0mT13u0w0BvKD2Fr/fJnnslODlMRKBnNg7r4rxlcDNsIQsfYTwO7Bcf+FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328853; c=relaxed/simple;
	bh=3zTH5VeoJHTIiObjW/bHgWDuv27V41EPahlkqnMQBws=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J9QJdmsPVvJNf7t+RVo0v3NcwhShN83BOK2zVnVf/oYiKgDd+Z6+X187q9D9BtAplZwd91xM4zk5iOr9Ij8OX0a2Qihw3ag6bfB/IF21NMbIJt/EK4/fwEWYAwtfstK9DZmnMTb3BuCSwwXf5w+Yakib9pOHgRitSKT+CXUZ8pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PohplJAQ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PohplJAQ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so520736f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 02:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790328849; x=1790933649; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbLKbFtiuNxiSezLiao3sOaKseP8/5HCJFUPTdxOZiM=;
        b=PohplJAQyo/ebpM4a/C4Ynv5rlo3LCHiyAL+S10dn3jik85tqwbQezcdp4BDYE0CsQ
         SkUh6yM8yJ++qhN2VqIxBI6HIbOB+joajcjgCJKlevC3D7lfisS0iWmGIpPdFgb4B7uB
         eDeT+TYDq43cbnRdPLyv72JewvrAxBR06+ESngxdzyfS1VqP90khi9N8lQdEZ567+/Fx
         /7QYj7O/dLiPvovSdmjC5HGijJtPkJu4dC8yU0iMNXo8Cg7ZfxKRFiUVS2246YahI73C
         hgkydIuhl3Cmav57aruFn7g1QcB0yuWvrsgCzVcPJ3Cw+jyjlVI1R0/fXqfPFTH/rwue
         RCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790328849; x=1790933649;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cbLKbFtiuNxiSezLiao3sOaKseP8/5HCJFUPTdxOZiM=;
        b=T8/25KIiBzRLf3FfTgMS4gsQMc3UFqYEMz0770v+DkB6dOMC2roQfbfMmSSa3KZCmJ
         HCeRax0WfMs9m7+HPi9e6ve+JZ4tuiKbSqWg6WrOV5YtxQAGWWrr7qcNXdLqlXrvEhuz
         oOImVAIOLz7vZhXeRzVDaV/zwwwrBcON7nyWi/HZVBkQ5XsY2Q6iv2hC8imAkkn9/vfl
         iRT/PrHufk/58tM0BpDmeOjXBzKFeQ0aZz8hJJ4VLSoC3XHyDq58cs7AkafeKoHdFKRy
         Ns2BNj6iO6ELFd4x6C0uhWWN16KmVqZKSqoq9FUh7p3HYf2/vFdjENRqpzJcvJWBaTKo
         sFaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+ARUj5ipGlxzSqvWHWhjewdDBUjLInq0eU6WW4XWsXO9ApzlMTCPMle6v6zucGl0LqJi5H1J4Rx8=@vger.kernel.org
X-Gm-Message-State: AFuF++lsJnqSJjGaUa7jr+yI4U3kU6AxKBFkqf+ebb1Isb0NwiF4YW/J
	HmsxyyCyVrbVJbzY7+eiJRv59GlsBgQ9uwvYagS67HW4RseiU6SKpsb/oOllKgatG7PjZ70bDRg
	Pr0d+
X-Gm-Gg: AYBFou06TQ4sV93WNwT9m/eRdtsaB7b12xJvyN2f06qBawIK4gelyqBY5j2xovUXD2F
	ScY6jqKFDTKMpAuSLwE/0MXlkeb3Ro2PSl0/dqoFsy/NE8oek2+M1Vq2GyfM7b3NkyiZmxnE8es
	6QxZQtLFxWJ2c12EktTThOCZs9XXj5sbJuithPaIl9iLK4lMFIgXZQA+cy1TZ40LNh5UVP3kCM8
	5Bux3eHEe17whnjDqi0g5LIwVhUPJ7TgbPBAg+WNU1qpkjCTIA4eWyaLNIZOCCDHKj2Jll+cLaJ
	ZQov3koHzS+kWvYYibn+pJdWOmTK7HhdhdAhuQAWcvpb25OsO5eT+hm3i0q7CnUnEQWZ0+f98mU
	ZAffLIecmHMBzCFvaJv0e5up0hFYU1jP5L0zsGnbKPZC+mTz4oX51IhqhdikAYZ2SE3tWpNIz8l
	5PwQ5gWQe7HTYgKT/HhKO/WTHFPSab6QLvtuv9QnFakOpai98YBpM1L/GQeNMY7Mi1LSV7AT4Z4
	lfWMmrj5RERuOoTTA==
X-Received: by 2002:a05:6000:703:b0:487:13ab:142 with SMTP id ffacd0b85a97d-48872abc483mr8810374f8f.35.1790328849352;
        Fri, 25 Sep 2026 02:34:09 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a354c47sm5917708f8f.15.2026.09.25.02.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:34:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>, Brian Masney
 <bmasney@redhat.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: socfpga: agilex: convert to CLK_OF_DECLARE()
In-Reply-To: <1abffb74-3b9d-494d-a414-ea21d537ed74@altera.com>
References: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
 <c7006ac0c353640f52902580564a85d6d23c57e5.1789096458.git.adrian.ho.yin.ng@altera.com>
 <aq2-Ysy2wbLeBWd1@redhat.com>
 <1abffb74-3b9d-494d-a414-ea21d537ed74@altera.com>
Date: Fri, 25 Sep 2026 11:34:07 +0200
Message-ID: <1jh5jd8yk0.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 21 sept. 2026 at 11:17, "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com> wrote:

> On 9/19/2026 6:42 AM, Brian Masney wrote:
>> Hi Adrian,
>> 
>> On Fri, Sep 11, 2026 at 03:01:18PM +0800, adrian.ho.yin.ng@altera.com wrote:
>>> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>>>
>>> Register Agilex and eASIC N5X clocks at of_clk_init() so they are
>>> available before platform devices probe.
>>>
>>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>>> ---
>>>   drivers/clk/socfpga/clk-agilex.c | 83 +++++++++++---------------------
>>>   1 file changed, 28 insertions(+), 55 deletions(-)
>>>
>>> diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
>>> index 2bdea1997b5e..64a20c727d16 100644
>>> --- a/drivers/clk/socfpga/clk-agilex.c
>>> +++ b/drivers/clk/socfpga/clk-agilex.c
>>> @@ -4,8 +4,9 @@
>>>    */
>>>   #include <linux/slab.h>
>>>   #include <linux/clk-provider.h>
>>> +#include <linux/io.h>
>>>   #include <linux/of.h>
>>> -#include <linux/platform_device.h>
>>> +#include <linux/of_address.h>
>>>   
>>>   #include <dt-bindings/clock/agilex-clock.h>
>>>   
>>> @@ -454,24 +455,26 @@ static int n5x_clk_register_pll(const struct stratix10_pll_clock *clks,
>>>   	return 0;
>>>   }
>>>   
>>> -static int agilex_clkmgr_init(struct platform_device *pdev)
>>> +static void __init agilex_clkmgr_init(struct device_node *np)
>>>   {
>>> -	struct device_node *np = pdev->dev.of_node;
>>> -	struct device *dev = &pdev->dev;
>>>   	struct stratix10_clock_data *clk_data;
>>>   	void __iomem *base;
>>>   	int i, num_clks;
>>>   
>>> -	base = devm_platform_ioremap_resource(pdev, 0);
>>> -	if (IS_ERR(base))
>>> -		return PTR_ERR(base);
>>> +	base = of_iomap(np, 0);
>>> +	if (!base) {
>>> +		pr_err("%s: failed to map clock registers\n", __func__);
>>> +		return;
>>> +	}
>>>   
>>>   	num_clks = AGILEX_NUM_CLKS;
>>>   
>>> -	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
>>> -				num_clks), GFP_KERNEL);
>>> -	if (!clk_data)
>>> -		return -ENOMEM;
>>> +	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, num_clks),
>>> +			   GFP_KERNEL);
>>> +	if (!clk_data) {
>>> +		iounmap(base);
>>> +		return;
>>> +	}
>>>   
>>>   	clk_data->clk_data.num = num_clks;
>>>   	clk_data->base = base;
>>> @@ -491,27 +494,28 @@ static int agilex_clkmgr_init(struct platform_device *pdev)
>>>   	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
>>>   			      clk_data);
>>>   	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
>>> -	return 0;
>>>   }
>>>   
>>> -static int n5x_clkmgr_init(struct platform_device *pdev)
>>> +static void __init n5x_clkmgr_init(struct device_node *np)
>>>   {
>>> -	struct device_node *np = pdev->dev.of_node;
>>> -	struct device *dev = &pdev->dev;
>>>   	struct stratix10_clock_data *clk_data;
>>>   	void __iomem *base;
>>>   	int i, num_clks;
>>>   
>>> -	base = devm_platform_ioremap_resource(pdev, 0);
>>> -	if (IS_ERR(base))
>>> -		return PTR_ERR(base);
>>> +	base = of_iomap(np, 0);
>>> +	if (!base) {
>>> +		pr_err("%s: failed to map clock registers\n", __func__);
>>> +		return;
>>> +	}
>>>   
>>>   	num_clks = AGILEX_NUM_CLKS;
>>>   
>>> -	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
>>> -				num_clks), GFP_KERNEL);
>>> -	if (!clk_data)
>>> -		return -ENOMEM;
>>> +	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, num_clks),
>>> +			   GFP_KERNEL);
>>> +	if (!clk_data) {
>>> +		iounmap(base);
>>> +		return;
>>> +	}
>>>   
>>>   	clk_data->base = base;
>>>   	clk_data->clk_data.num = num_clks;
>>> @@ -531,38 +535,7 @@ static int n5x_clkmgr_init(struct platform_device *pdev)
>>>   	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
>>>   			      clk_data);
>>>   	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
>>> -	return 0;
>>> -}
>>> -
>>> -static int agilex_clkmgr_probe(struct platform_device *pdev)
>>> -{
>>> -	int (*probe_func)(struct platform_device *init_func);
>>> -
>>> -	probe_func = of_device_get_match_data(&pdev->dev);
>>> -	if (!probe_func)
>>> -		return -ENODEV;
>>> -	return	probe_func(pdev);
>>>   }
>>>   
>>> -static const struct of_device_id agilex_clkmgr_match_table[] = {
>>> -	{ .compatible = "intel,agilex-clkmgr",
>>> -	  .data = agilex_clkmgr_init },
>>> -	{ .compatible = "intel,easic-n5x-clkmgr",
>>> -	  .data = n5x_clkmgr_init },
>>> -	{ }
>>> -};
>>> -
>>> -static struct platform_driver agilex_clkmgr_driver = {
>>> -	.probe		= agilex_clkmgr_probe,
>>> -	.driver		= {
>>> -		.name	= "agilex-clkmgr",
>>> -		.suppress_bind_attrs = true,
>>> -		.of_match_table = agilex_clkmgr_match_table,
>>> -	},
>>> -};
>>> -
>>> -static int __init agilex_clk_init(void)
>>> -{
>>> -	return platform_driver_register(&agilex_clkmgr_driver);
>>> -}
>>> -core_initcall(agilex_clk_init);
>>> +CLK_OF_DECLARE(agilex_clkmgr, "intel,agilex-clkmgr", agilex_clkmgr_init);
>>> +CLK_OF_DECLARE(n5x_clkmgr, "intel,easic-n5x-clkmgr", n5x_clkmgr_init);
>> 
>> Why do all of these clk providers need to be registered so early?
>> CLK_OF_DECLARE is abused quite a bit today and the majority of the clk
>> drivers that use it don't actually need it.
>> 
> Hi Brian,
>
> Thanks for the review.
>
> subsys_initcall() / subsys_platform_driver() would not fix the failure 
> we are hitting. Both still run after time_init(), while the DW APB timer 
> is registered via TIMER_OF_DECLARE from timer_probe().

You presumably only need a tiny subset of clock to feed the timer, not
the whole controller

Can you just register those early ?  clk_mt8173_infracfg* does that for example.
>
> So moving from core_initcall() to subsys_initcall() changes nothing for
> this consumer: the timer cannot defer, clk_get() still fails, and the 
> timer is never brought up. That is why these patches use 
> CLK_OF_DECLARE(): the provider must be registered from of_clk_init() so 
> clocks exist before TIMER_OF_DECLARE runs.
>
> On the broader point about CLK_OF_DECLARE abuse: I agree it should not 
> be used merely to beat platform device probe. If the preferred approach 
> is to keep the clkmgr as a platform driver (subsys_platform_driver()) 
> and give the DW APB timer nodes a fixed clock-frequency instead of a 
> clocks phandle, I can respin that way. Please let me know which you prefer.
>
> Thank You
> Adrian
>> core_initcall() is pretty early as well. Can you use subsys_initcall
>> instead so that it's available by time the platform devices probe?
>> 
>> I recently introduced a subsys_platform_driver() macro to simplify the
>> code that should do what you need.
>> 
>> https://lore.kernel.org/linux-clk/20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com/
>> 
>> Brian
>

-- 
Jerome
