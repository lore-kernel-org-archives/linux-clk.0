Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAC0283138
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 06:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757658202; cv=none; b=NKpCv/Y3GsHIMr0lllq1mmQQzEiXPmHTOpNDomrU0LIZ+d3veVmWd1a9sKE/KIOkFCFKWf8Q9sfIpnZHv8QBw92mWb+/7UrY2AJRWN2/W6bOdkhyew5g67vBgvW5B7iQR+yT10GcnYq1DUaBzdofilAj1/Fg1ViTjxWvcdEq2AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757658202; c=relaxed/simple;
	bh=46xAimHlyoqtCIymW4Sk64BpdypZ4GBfRwHCV5duIC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZGmH85mhcPlPuwTNlwWqc6O2aY9chGqRvgQsE2TfqvwR9K0iRVvsYOm08qHHV15W5WzAzHzuCGw23gKrJj/5xHP1DDnwdwj6o0JA5ojK/zkQGIfAwiFjVXUkW6yo8hmbS2o+HNx+sdUFrkWlsXMMzdJ2n4lay7YPYaDWUij0lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hkRAW/EP; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hkRAW/EP"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-570088480f7so205395e87.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 23:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757658199; x=1758262999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKEDx0Iw+vCQWDODFkeSgabLIP6pUpT9IdwmBh+eWkU=;
        b=hkRAW/EPElrpkNv+Bbn+HDT8gj1n+yAneum3/1cM3zM0jJMIhA+j8IAnKz35oh9/Z0
         wI/SpJvPQ6EmpsBwLiwKG1UC3N832MzBgkI891zn/xlB/Lgw5bD3cTwx2jREiNE02RU/
         HfC1JjQhcexhlwRflSF3IThzFZ9vIC+B8vNCB5uywQenGPTP0YzA7aJbDGgx9RfVXMun
         9MLILb9NvlhQcVzID0ZwFDWkcx0p+oqRTswufRyZ4jPu7iv8jpZBW0ykv3oILpzxU5lC
         960IYX8qhOJ378Mc477mwyF3Gq/fJen3aMOepdx3co3nvN0JttmbgJTChSAarawZylOV
         o0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757658199; x=1758262999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKEDx0Iw+vCQWDODFkeSgabLIP6pUpT9IdwmBh+eWkU=;
        b=V903rzpzkXBsugGK99/nLYiI26PpGRHZhEVtg0UhmHcHmesRydDiFbH6RPE52RnHA3
         mtr0WFYmbaJnK+Pt6PBqvYqbxPD2H/Q3oKPTmRq2SbmhlGQnDq69726JfVmkKy4v/yzu
         enPT+8OK6ambS7eBPCV4kZvosw3/KGr+Ahwb6FQGgGVtIiPIvRWfmyBrbSZZMQTgu0Mb
         ExMLNJ3DmtA86wEa1KVDOWY/zA+tVImCGC/GnNURNZcvzRcuH8Q78PVufwG5m4iJo6pj
         fWEiwEbTdAJAYC939JJ5hGoO0mPPjF/sHTjrho4bLqpkRZ+9gTd4vFhERMLc1OccZyb2
         HaZw==
X-Forwarded-Encrypted: i=1; AJvYcCXb5cFk90ELPIs77Bd9AaDKaFPTsoK969MbBcoQVgHduhFF0rZf4uP9yIcn0lfBMg3SIHAUCKTvqvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU57iB2LA26WEXRDkwX7Fz1RzgAaxLwl7+2VegiYm3f8E3yEqr
	JD1YK02ca+Gitcf85Fg5ztWGNwRBIOQOYM87XvWwe141va3ucCUTETDHitaxEyqddmo=
X-Gm-Gg: ASbGncsu4puXOdRrrkE6D6UlqVzHRgBv6ULqjbeXKbTM68trMa9r67O0mR9KYfJpzIA
	tAJEPUQGss6pqym795x2PeGzd5odYLXwd/ZettCy4O/xKoIJsct70+jDetQjp4K/jZnT/4iYwhk
	SHLZw1G3Xt63eIoYfMB6oblFKx/Mfv1TNKObAOZjqdQYysLLsrqjIUM8HHk1mE+IUR5ogu4x7s8
	JKTdbATFrFW8dAs7wSs9yrNjlxTOAXRycdgK1/5Jsis5CDuQKZcO3sHbX2R5iA71hM5XF9Z8XyA
	/uaLY+lOVjC5Tj/U1U6CXK7H4s8WnGAl1UAYb4CKAxTACwaBNGNgiJyfQyL+k9/MysZeXbOlC7g
	YGpXfvFZbCyKtFD+NKA1dAGD20XQRvPLywtxOCN305v3TOysOlHlOHpRA37V7j2IZcqxdbmc8TJ
	CI
X-Google-Smtp-Source: AGHT+IE6uLzngaA4lMyB4tnkRuP8sE8P3m558UkZVus+EtsNtSElE92g/spTLZd2SFI+K9qkH8+l3Q==
X-Received: by 2002:a05:651c:b12:b0:332:424b:210e with SMTP id 38308e7fff4ca-351339e1937mr2243141fa.0.1757658198515;
        Thu, 11 Sep 2025 23:23:18 -0700 (PDT)
Received: from [172.16.0.23] (96-132-196-88.sta.estpak.ee. [88.196.132.96])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1b39db54sm6644491fa.55.2025.09.11.23.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 23:23:18 -0700 (PDT)
Message-ID: <e90501b8-6af1-4473-b4f5-2fe1f118a5b4@linaro.org>
Date: Fri, 12 Sep 2025 09:23:00 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: camcc-sm8550: Specify Titan GDSC power
 domain as a parent to other
Content-Language: ru-RU
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
 <bsjcwbwvvw4eov4aaf4xk2bes4p4wsxvb53rsxkwhgd7bk44ix@wnbvksy6m3li>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <bsjcwbwvvw4eov4aaf4xk2bes4p4wsxvb53rsxkwhgd7bk44ix@wnbvksy6m3li>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/25 05:09, Bjorn Andersson wrote:
> On Thu, Sep 11, 2025 at 04:12:13AM +0300, Vladimir Zapolskiy wrote:
>> Make Titan GDSC power domain as a parent of all other GDSC power domains
>> provided by the SM8550 camera clock controller to enforce a correct
>> sequence of enabling and disabling power domains by the consumers.
>>
> 
> I don't understand which problem you're solving.
> 
> Are these GDSCs children of the titan_top and your patch is describing
> that so that when a client is enabling any one of them they will be
> enabled in order?
> 
> Are you correcting the description of the hardware? Or is this a hack to
> trick the system into performing the operations in order?
> 

Consumers of power domains are unaware of power domain hierarhy, same
with clocks for instance.

When a consumer turns on/off a power domain dependant on another one,
the parent power domain shall be turned on/off, and it shall be done
by the power domain provider (camcc in this case), if the power domain
hierarchy is set. The changes in the series establish the hierarchy,
otherwise the CAMSS driver as a CAMCC consumer is irrecoverably broken.

> 
> Please start your commit message with a problem description, then a
> description of your solution.
> 
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 

I've started from "describe your changes in imperative mood" section,
I'll resend the changes with the reformulated commit messages, thank
you for review.

>> Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   drivers/clk/qcom/camcc-sm8550.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
>> index 63aed9e4c362..b8ece8a57a8a 100644
>> --- a/drivers/clk/qcom/camcc-sm8550.c
>> +++ b/drivers/clk/qcom/camcc-sm8550.c
>> @@ -3204,6 +3204,8 @@ static struct clk_branch cam_cc_sfe_1_fast_ahb_clk = {
>>   	},
>>   };
>>   
>> +static struct gdsc cam_cc_titan_top_gdsc;
>> +
>>   static struct gdsc cam_cc_bps_gdsc = {
>>   	.gdscr = 0x10004,
>>   	.en_rest_wait_val = 0x2,
>> @@ -3213,6 +3215,7 @@ static struct gdsc cam_cc_bps_gdsc = {
>>   		.name = "cam_cc_bps_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> @@ -3225,6 +3228,7 @@ static struct gdsc cam_cc_ife_0_gdsc = {
>>   		.name = "cam_cc_ife_0_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> @@ -3237,6 +3241,7 @@ static struct gdsc cam_cc_ife_1_gdsc = {
>>   		.name = "cam_cc_ife_1_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> @@ -3249,6 +3254,7 @@ static struct gdsc cam_cc_ife_2_gdsc = {
>>   		.name = "cam_cc_ife_2_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> @@ -3261,6 +3267,7 @@ static struct gdsc cam_cc_ipe_0_gdsc = {
>>   		.name = "cam_cc_ipe_0_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> @@ -3273,6 +3280,7 @@ static struct gdsc cam_cc_sbi_gdsc = {
>>   		.name = "cam_cc_sbi_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> @@ -3285,6 +3293,7 @@ static struct gdsc cam_cc_sfe_0_gdsc = {
>>   		.name = "cam_cc_sfe_0_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> @@ -3297,6 +3306,7 @@ static struct gdsc cam_cc_sfe_1_gdsc = {
>>   		.name = "cam_cc_sfe_1_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> -- 
>> 2.49.0
>>

-- 
Best wishes,
Vladimir
