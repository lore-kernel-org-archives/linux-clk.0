Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92825481C4
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719215852; cv=none; b=QoLN3hmTT1i0cLkaICd/cvVMOEO/W/Ykp4RfJ3DS2x8fXUkE9mKCOAwuNsLKvURaJSZgMPoyLdlnYr71LgMR/VzcmT5STvT5zKax96P4J7uRRTPuSMRtGDFcrtKCv5Tvfd7b0KVJNoNHPcVu/jBba5oVImReagZU2OBvyXu5t2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719215852; c=relaxed/simple;
	bh=FFUMUVVqTCMRi5LNC3E6gl33cqGAV4cXK11cOIpHev0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Qaljl/GyGWCm0CjgpfjKBlNkjHR9NF6hYj8Qya8MdtE9oDTSoXdrUtdhfLSlEZbKECF7dniSa8KpCQ4ibGn24jtqwer74j3xtbyd8RyyMwLGax84FTHm5aPiKbAmPp1zydFHWPZFsas7W69UpFfMBtKCdDwZlcBbypc3WJEgCOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VAcpGIdi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VAcpGIdi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-421b9068274so35316005e9.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 00:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719215849; x=1719820649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkaBHpuC3DPU+3GGRecZB4kBIUF1paiWiYKZGEuOWys=;
        b=VAcpGIdiNU4lJl0oM8YuzJOwaF1Mcjg/ox2J9xZ9FQ7UvhyiX6I1IWTpAOeCoYBsRn
         5M2YWZ0G9YRWWzI9wEV3Y6R0WW3tdHUEbXzf6Ca8NsG0ahl/6YO7xAsv0fvammC0INnS
         UfO0bVq2x7rGV+N7cqP5hFMjzFpj3mBGB/GwwEf+c0OgWQHm0thIZC5yZ797ooyzCp7s
         kjZw5hcgIFbabSY4xkyPzKq05tn5uX8Er0jEFHlU+PioD5V0D6cy8ipatGiEW/UzqAwf
         tTiKbwBvfbL9rh7YuO3z/XzJ35cu4PUsA+p7EahRtfDoGVuKEf6ecjo/sgWvtZslXpIz
         8EYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719215849; x=1719820649;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XkaBHpuC3DPU+3GGRecZB4kBIUF1paiWiYKZGEuOWys=;
        b=Q7jxsIdnoEdvrQPWxENEx0KyifAA+hfBzhjZ9/8nwxaKlTcHShBH92HiTDdVMXNqX3
         JyZkIjG89th7xGG3NoOH2KDWCT+93d/5AOQRKYfRpMFQEqWCNwCyUNQBAn4rLcHxANU3
         2Bn6cvnw6agsuegUEseigD7NbHIrEAVKy/gOLlfhuN1tFPmSnZBFSwE+c9g6YBhIQlpl
         tYVmGM2eDvvQfHtIiJ7npXwXJsyIN7BcbJj1uEkL6dwXwRrmt3PpCKqmMHHC/r+mjB1g
         7aKTrCjr9YJKsL3eaf+lA55L+Iq+wzJOZUGNclY+JkJzamUwB+epS7ooPZhk/nq/D9AQ
         b+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXLa6DOxsRDBHkwL/xxG6M5a74ahxyG3Qh5BGFhA038a1ppwSyuo32LkRBVcuV0IzWeNyrKb55u9G7tstyJAQ1fYXn6WMotY6LD
X-Gm-Message-State: AOJu0Yy9VLPWn6NsvzrIcWhpY1iVw10wuuRbphwDnQv+AHUlUpkUYklt
	UDa+62N/0TQI1Alj28u2MmdjDLsHtN39oxHv/j/Iso6XnI92fi/k/57DQqmwerg=
X-Google-Smtp-Source: AGHT+IF6msK0az2v0jiwz2RmUc+bw2QJiim7NK5dx1B5XQlvaU6NxuzZ/pRAAiQqUtwNH0TtPCom0w==
X-Received: by 2002:a05:600c:3b14:b0:424:8c44:b639 with SMTP id 5b1f17b1804b1-4248c44b70fmr27066285e9.19.1719215848792;
        Mon, 24 Jun 2024 00:57:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74? ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248191116fsm129554925e9.37.2024.06.24.00.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 00:57:28 -0700 (PDT)
Message-ID: <c2c14080-25bd-4732-bf9c-0a9d385866f4@linaro.org>
Date: Mon, 24 Jun 2024 09:57:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 5/5] clk: qcom: dispcc-sm8650: Update the GDSC wait_val
 fields and flags
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
 <20240621-topic-sm8650-upstream-fix-dispcc-v1-5-7b297dd9fcc1@linaro.org>
 <tbslwm4xfknta4ufcvhxhknj3ypfi63spvm5askl2pqmuqssgj@v7a5oa3xfelc>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <tbslwm4xfknta4ufcvhxhknj3ypfi63spvm5askl2pqmuqssgj@v7a5oa3xfelc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/06/2024 23:39, Dmitry Baryshkov wrote:
> On Fri, Jun 21, 2024 at 04:01:18PM GMT, Neil Armstrong wrote:
>> Update the GDSC wait_val fields and flags as per the default hardware values.
> 
> If they are default, do we need to program them?
> 
>> Add the missing POLL_CFG_GDSCR flag.
> 
> I'd say, two distinct fixes.

I'll drop the wait_val fields changes and only add the missing flags.

Neil

> 
>>
>> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/clk/qcom/dispcc-sm8650.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
>> index d88eebb32575..2da3c11b0c3d 100644
>> --- a/drivers/clk/qcom/dispcc-sm8650.c
>> +++ b/drivers/clk/qcom/dispcc-sm8650.c
>> @@ -1604,20 +1604,26 @@ static struct clk_branch disp_cc_sleep_clk = {
>>   
>>   static struct gdsc mdss_gdsc = {
>>   	.gdscr = 0x9000,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
>>   	.pd = {
>>   		.name = "mdss_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = HW_CTRL | RETAIN_FF_ENABLE,
>> +	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
>>   };
>>   
>>   static struct gdsc mdss_int2_gdsc = {
>>   	.gdscr = 0xb000,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
>>   	.pd = {
>>   		.name = "mdss_int2_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = HW_CTRL | RETAIN_FF_ENABLE,
>> +	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
>>   };
>>   
>>   static struct clk_regmap *disp_cc_sm8650_clocks[] = {
>>
>> -- 
>> 2.34.1
>>
> 

