Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6841487CD
	for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2024 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016745; cv=none; b=qAqvOxKMcDJwd3SdFOmtJYBm9c4QjIzVa9SBfP2ztsgAQ69daZkGiSp21FfhkkHpofCEpdQYYRy6eM/0LnjiZ5jpSBhGFRKk82Ms090AGUk6wn/mp9xgbVaimSfjJwspDsDARTvziGak3K0yBrF2Y4HtkIyHCg/MqvVcfVRWNcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016745; c=relaxed/simple;
	bh=YPL5Rcw9NwOwjZl7LuLRepPy6/WVmCF0fWjOw9gg3dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iQsyYA5sja6IpDsXxj7TUnzK9XyJwbyTljW65fM0yV2oCdJ7z3tLnkIHPHiYJnDXAP4lpncjp7ut0yHKRmeUeFHWG+uoLKwuTEIFsRdKh00ia3GnfB6qdqpiH1lwHQKDz874K85v5JywjpGPU1r97DAtpXXrn9mQ6ay2sJYLXIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a0mqSv03; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a0mqSv03"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so1021609a12.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2024 07:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734016741; x=1734621541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5s3jzibw/eg/WW/zvL3ff5i+HaWQ3JQi8QuJHkqXcc=;
        b=a0mqSv03NhGMAY9goch3AVMxSSeUVBTgkJSplOMMZLWLJpi3ROCEJu+V7z/4PZZowa
         PYlk05w9TUM1YoLGMnUTBjDY06Q40TLDDW93OBjBpt4y+iQiu637dj5tgFZvztN02afi
         +zbjuVwyGnsGO85k3mYlCyrFq+17NQI8dt6sWmeTsuIfm8FBYZXVRw/y5X9XimQzVZjU
         6u1lfBNZRXdyZmzvolXNw9KwmqcYSu4rAqOkASFq3rQ419wvlWoIYGaCBRaK/YYWDTO4
         lQ9yqKepS0RiBqoz+1AA3xe6fg3wcGwMQTWgsxMO8cqrvRkmdwEA3ZDHxGMTIBQXCscE
         k2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734016741; x=1734621541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5s3jzibw/eg/WW/zvL3ff5i+HaWQ3JQi8QuJHkqXcc=;
        b=HbyBZFw/y0W2NC3xmybZLSCfIdM97b9nlkqtm8tvO1hzEEpl4itsbhagKjLlvg+sJr
         4nb+9aHWevk3MDBlW+O4Dd0E9GMOuYrfNwCKQMXY/L74g/8hCYdtVajScdllJUd5AKnX
         wD+VzmkLHEG1bf0dx/1ux7F2ohSTiAY2Zr9A9mOOdLNVOAZXH4vWMwdqezbjwpWyslVP
         uTsHCa1OlgoT0bYaXYnZhHZ68dne+1iwpK+kmNFDksIBB/QeZxKLiFXTiFlKfVrBUYF/
         7BwTb8SL52Pa7QxLiKv0AkheUT+E+8pFhjowLMVazO4HF93Hn5D753oeqMFuM3vixVil
         yLXA==
X-Forwarded-Encrypted: i=1; AJvYcCXOUu2RFzJR4caWOIm2hlJ/v15lVrHgXJclIR23qQe0aLLIBWlfUa2tYe3eooXbvh46TYI25NVbaDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrESsSR7PgcKuaDdXMFPleEv9UwWSt8dgoQqQGvz/BXteOPxM3
	8uxde6UUWEVG2HzASRqO4ZyvcYdyrqQyokTQkQq6txdWyXLmEg2QYSPKkIZHmT4=
X-Gm-Gg: ASbGnctz6gf0czz68lCTrnnFHsP44fl7ecTO0nZ6axHmPv06wqsl+MMJtXWjy/MeICi
	cCHbdOkv2afv69PLKgelQkXMOtnwAoADTV/ZJFKDyIulz4rqg0SOj2zkE/h6+y5h5Jy8VEIBreq
	zABhSd/lG37Mh10lqPL6OrfDriA15VsX4qIOwleHV7f1ZzJg//b8CuFcPJCU2BybUcL3AQq4iyn
	xvcTLm2S1C7HW6YW4euEFKhrUjTPdvC9bXo3BLmycCIRv+ezVFw+2myDE5tdZEc3TcHiQ==
X-Google-Smtp-Source: AGHT+IH+1eH05FyuvRpMmJ+Z4vENHiIUCNWjM4MAUe8J599EQaMvlhkwlKUCZlQTLZmum7gFLPpFcw==
X-Received: by 2002:a17:907:7856:b0:aa6:2b8b:20c6 with SMTP id a640c23a62f3a-aa6b11a0dd4mr666606166b.20.1734016740937;
        Thu, 12 Dec 2024 07:19:00 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68fc81ccbsm546363766b.138.2024.12.12.07.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:19:00 -0800 (PST)
Message-ID: <aa060993-3171-490f-bcb8-48ca0084f06c@linaro.org>
Date: Thu, 12 Dec 2024 15:18:59 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] clk: qcom: Support attaching GDSCs to multiple
 parents
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
 <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-3-5d93cef910a4@linaro.org>
 <ec2d1916-45b5-4b90-ade2-3fdc091fc0b8@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ec2d1916-45b5-4b90-ade2-3fdc091fc0b8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/2024 15:06, Vladimir Zapolskiy wrote:
> Hi Bryan.
> 
> On 12/11/24 18:54, Bryan O'Donoghue wrote:
>> When a clock-controller has multiple power-domains we need to attach the
>> GDSCs provided by the clock-controller to each of the list of power- 
>> domains
>> as power subdomains of each of the power-domains respectively.
>>
>> GDSCs come in three forms:
>>
>> 1. A GDSC which has no parent GDSC in the controller and no child GDSCs.
>> 2. A GDSC which has no parent GDSC in the controller and has child GDSCs.
>> 3. A child GDSC which derives power from the parent GDSC @ #2.
>>
>> Cases 1 and 2 are "top-level" GDSCs which depend on the power-domains 
>> - the
>> power-rails attached to the clock-controller to power-on.
>>
>> When dtsi::power-domains = <> points to a single power-domain, Linux'
>> platform probe code takes care of hooking up the referenced power-domains
>> to the clock-controller.
>>
>> When dtsi::power-domains = <> points to more than one power-domain we 
>> must
>> take responsibility to attach the list of power-domains to our
>> clock-controller.
>>
>> An added complexity is that currently gdsc_enable() and gdsc_disable() do
>> not register the top-level GDSCs as power subdomains of the controller's
>> power-domains.
>>
>> This patch makes the subdomain association between whatever list of
>> top-level GDSCs a clock-controller provides and the power-domain list of
>> that clock-controller.
>>
>> What we don't do here is take responsibility to adjust the voltages on
>> those power-rails when ramping clock frequencies - PLL rates - inside of
>> the clock-controller.
>>
>> That voltage adjustment should be performed by operating-point/ 
>> performance
>> setpoint code in the driver requesting the new frequency.
>>
>> There are some questions that it is worth discussing in the commit log:
>>
>> 1. Should there be a hierarchy of power-domains in the clock-controller ?
>>
>>     In other words if a list of dtsi::power-domains = <pd_a, pd_b, ..>
>>     should a specific hierarchy be applied to power pd_a then pd_b etc.
>>
>>     It may be appropriate to introduce such a hierarchy however reasoning
>>     this point out some more, any hierarchy of power-domain dependencies
>>     should probably be handled in dtsi with a chain of power-domains.
> 
> If so, the description shall be found under Documentation/devicetree/ 
> bindings/

I agree, I don't get your statement here, are you asking for additional 
text ?

> 
>>     One power-domain provider would point to another via
>>     dtsi::power-domains = <>.
>>
>>     For the case of GDSC on/off there is no clear use-case to implement
>>     a mechanism for a dependency list in the GDSC logic in-lieu of 
>> already
>>     existing methods to do dependencies in dtsi::power-domains = <>.
>>
>>     A defacto ordering happens because the first power-domain pd_a 
>> will be
>>     powered before pd_b as the list of domains is iterated through 
>> linearly.
>>
>>     This defacto hierarchical structure would not be reliable and should
>>     not be relied upon.
>>
>>     If you need to have a hierarchy of power-domains then structuring the
>>     dependencies in the dtsi to
>>
>>     Do this:
>>
>>     pd_a {
>>     compat = "qcom, power-domain-a";
> 
> Please remove spaces in compat property values.

Not real names but, sure.

>>          power-domains = <&pd_c>;
>>     };
>>
>>     pd_b {
>>          compat = "qcom, power-domain-b";
>>
>>     };
>>
>>     pd_c {
>>          compat = "qcom, power-domain-c";
>>     };
>>
>>     clock-controller {
>>         compat ="qcom, some-clock-controller";
>>         power-domains = <&pd_a, &pd_b>;
>>     }
>>
>>     Not this:
>>
>>     pd_a {
>>     compat = "qcom, power-domain-a";
>>     };
>>
>>     pd_b {
>>          compat = "qcom, power-domain-b";
>>
>>     };
>>
>>     pd_c {
>>          compat = "qcom, power-domain-c";
>>     };
>>
>>     clock-controller {
>>         compat ="qcom, some-clock-controller";
>>         power-domains = <&pd_c, &pd_a, &pd_b>;
> 
> IMO it's a very fragile scheme, and like I've stated above at the bare
> minimum for future usecases the description shall be found outside of
> commit messages, preferably in the device tree bindings documentation.

So I stated above "Not this" very deliberately.

Thou shalt not rely on the ordering of power-domains in the dtsi.

> 
>>     }
>>
>>     Thus ensuring that pd_a directly references its dependency to pd_c
>>     without assuming the order of references in clock-controller imparts
>>     or implements a deliberate and specific dependency hierarchy.
>>
>> 2. Should each GDSC inside a clock-controller be attached to each
>>     power-domain listed in dtsi::power-domains = <> ?
>>
>>     In other words should child GDSCs attach to the power-domain list.
>>
>>     The answer to this is no. GDSCs which are children of a GDSC within a
>>     clock-controller need only attach to the parent GDSC.
>>
>>     With a single power-domain or a list of power-domains either way only
>>     the parent/top-level GDSC needs to be a subdomain of the input
>>     dtsi::power-domains = <>.
>>
>> 3. Should top-level GDSCs inside the clock-controller attach to each
>>     power-domain in the clock-controller.
>>
>>     Yes a GDSC that has no parent GDSC inside of the clock-controller 
>> has an
>>     inferred dependency on the power-domains powering the clock- 
>> controller.
>>
>> 4. Performance states
>>     Right now the best information we have is that performance states 
>> should
>>     be applied to a power-domain list equally.
>>
>>     Future implementations may have more detail to differentiate the 
>> option
>>     to vote for different voltages on different power-domains when 
>> setting
>>     clock frequencies.
>>
>>     Either way setting the performance state of the power-domains for the
>>     clock-controller should be represented by operating-point code in the
>>     hardware driver which depends on the clocks not in the
>>     gdsc_enable()/gdsc_disable() path.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/clk/qcom/common.c |  1 +
>>   drivers/clk/qcom/gdsc.c   | 35 +++++++++++++++++++++++++++++++++++
>>   drivers/clk/qcom/gdsc.h   |  1 +
>>   3 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index 
>> b79e6a73b53a4113ca324d102d7be5504a9fe85e..9e3380fd718198c9fe63d7361615a91c3ecb3d60 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -323,6 +323,7 @@ int qcom_cc_really_probe(struct device *dev,
>>           scd->dev = dev;
>>           scd->scs = desc->gdscs;
>>           scd->num = desc->num_gdscs;
>> +        scd->pd_list = cc->pd_list;
>>           ret = gdsc_register(scd, &reset->rcdev, regmap);
>>           if (ret)
>>               return ret;
>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>> index 
>> 4fc6f957d0b846cc90e50ef243f23a7a27e66899..cb4afa6d584899f3dafa380d5e01be6de9711737 100644
>> --- a/drivers/clk/qcom/gdsc.c
>> +++ b/drivers/clk/qcom/gdsc.c
>> @@ -506,6 +506,36 @@ static int gdsc_init(struct gdsc *sc)
>>       return ret;
>>   }
>> +static int gdsc_add_subdomain_list(struct dev_pm_domain_list *pd_list,
>> +                   struct generic_pm_domain *subdomain)
>> +{
>> +    int i, ret;
>> +
>> +    for (i = 0; i < pd_list->num_pds; i++) {
>> +        struct device *dev = pd_list->pd_devs[i];
>> +        struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
>> +
>> +        ret = pm_genpd_add_subdomain(genpd, subdomain);
>> +        if (ret)
>> +            return ret;
> 
> It's needed to rollback call pm_genpd_remove_subdomain() for all added
> subdomains on the error path.
> 
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void gdsc_remove_subdomain_list(struct dev_pm_domain_list 
>> *pd_list,
>> +                       struct generic_pm_domain *subdomain)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < pd_list->num_pds; i++) {
> 
> To be on the safe side, and especially because the order on the list has
> high importance, please remove subdomains in the reverse order.

The order shouldn't have any meaning at all but I agree the removal 
should happen in reverse order anyway.

I've tried to make the point in the commit log that we 100% _shouldn't_ 
rely on the order a pd gets added by a for(){} loop.

If one PD depends on another then that dependency should be expressed in 
the dtsi with an explicit power-domains = <> from one domain to the other.

IMO that's the right way to express such a dependency - via an explicit 
statement in the dtsi not a defacto outcome as a result of a for() loop 
in gdsc.

---
bod
