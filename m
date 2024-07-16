Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A705617CA15
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721132861; cv=none; b=HbEHQvEt3R1AaKSLE8MlphyCNttLgEHmXeVkMZNm3YXljcI5+P52XaJgZ1pZNI4Xr0+rg7NPNy9m6RGZLt7xymeF74j7UtnZnYjY32Icy8eK2RqHc+zQnAY+4CBjcENHcWAmNwphmKoHxHc9MXtOifaoZdkRPccujRFuAC4DcPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721132861; c=relaxed/simple;
	bh=noE6eKhFkhL3IVR0lAAzX4kMn+2KYTqP7aoIRc+XoIQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EDQS0oHuRZQ8S/Pv7xXobY/TZEfMjYX1ES9x7icUPrAdllTo+GC1GChdjXNxQFb380QEuWioNljNN1smI2kFoObaUGygB6CLC5j5OO3wWrcBtQY9oNk0AzrJlh2kiNBYjGzp3C4KLTretPYWolXOzVi/SkBcsPCr4Zd24wYZsGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WYyo+/J7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WYyo+/J7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4277a5ed48bso40224405e9.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721132858; x=1721737658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qm9ABS7iFcDinPgaH1nBEt1SBECgZpBDBS6YVK4EY1Q=;
        b=WYyo+/J7crdSm9XzkfPxjFIGYT35o4J8MbbmfbQdm3fVJ8HzkVCLKm3wqeLOQYx5Zl
         H6GzvPrx54P+SHsUB5M27/Zcw2Vxyc/CLVPW8aAd+78A6PEHAMOPjcEh/4hwb35NYLKW
         eoBV5chn+4FvOOXlTyoWAagjNUoDmPyeEHG6qD5CW5WMjVi51xHtfXXKrkj9iueNjsAT
         wtrw57qev/zEP2M2GoJQSklWFIbe3qvThZMjnvN4ZCmn2Oc+bGhqh8NDcovgmt71qvUJ
         pbSAdOAHGDfkxAao3aN7NEKHk761M8Pj1bT31lyiWyxg2lsyYucP7DVJlb24X/h4JXdx
         vp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721132858; x=1721737658;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qm9ABS7iFcDinPgaH1nBEt1SBECgZpBDBS6YVK4EY1Q=;
        b=GbIp+HeEekGstlSZEBWZ1z0WTNUyxhri0kco844JV+SmyzQH2AhlgRyd9+s5+mpPbv
         MICBp8CdcvsA/Ki7nT5XpBYFO7qvhoO8sGfoZaOaj0NnuSZSU4RJzC2NMeX7XQhWMsd1
         zh0R+Bm0HgRImEO/RatPr1l8SR2Xd6+8iuQh1WUUsI1n5lvM7OQmPlx4x6CsZFMP5gou
         zTeJoKTG0dw/GmKnlR9Ai+UJ6zKfJXk6zGKCptZmmPA8nF8e9IiofazA16My3MMmsf++
         k9I/zhHaY3IUIGfLqQTcMTlOvq+C7vEH2l7AUL9HBTrZAmSr6DIEn6kG2mpUWP9dwelh
         LzTg==
X-Forwarded-Encrypted: i=1; AJvYcCXkgPHBugDxJ9d63gFf2QJsQTZxMVYFvkR26V6ppnrZ096XjHz21vf1WLGN4mYOruJ3QdRHHPaeFAxkhmH83lh2sIYTF5qrX/V3
X-Gm-Message-State: AOJu0YwAvMGcewj9xEjrd57YKZkF+FcwNNS9GHxOgE7FAoHHu/TpqSir
	hLumyPQuUWQsGeqwp2/635glhx7llOjS43oTvRqapoYIpk3CAXp+lFOakCnjA+Q=
X-Google-Smtp-Source: AGHT+IHKhh5ttvcVkXx1Jjz8EBLUVPyKaDzcUwgeI6czkJaWIzlx4l4CsZNKslWB0xRhruQYfAaxWQ==
X-Received: by 2002:a05:600c:4ed1:b0:426:6861:a1ab with SMTP id 5b1f17b1804b1-427ba73df6emr14641795e9.39.1721132857764;
        Tue, 16 Jul 2024 05:27:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f5ba:a94c:e43a:d197? ([2a01:e0a:982:cbb0:f5ba:a94c:e43a:d197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427bb9988f6sm14072675e9.1.2024.07.16.05.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 05:27:37 -0700 (PDT)
Message-ID: <8b10fa58-4375-4738-9f7b-3299aeb00d36@linaro.org>
Date: Tue, 16 Jul 2024 14:27:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/3] clk: qcom: dispcc-sm8650: Park RCG's clk source at
 XO during disable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
 <20240716-topic-sm8650-upstream-fix-dispcc-v3-1-5bfd56c899da@linaro.org>
 <xzyphnxzkul77qrnxvxayzvschlwkhzun5jwom4pxeqsoxzbpj@k4o5cnitwc7z>
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
In-Reply-To: <xzyphnxzkul77qrnxvxayzvschlwkhzun5jwom4pxeqsoxzbpj@k4o5cnitwc7z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/07/2024 13:40, Dmitry Baryshkov wrote:
> On Tue, Jul 16, 2024 at 11:05:21AM GMT, Neil Armstrong wrote:
>> The RCG's clk src has to be parked at XO while disabling as per the
>> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
>>
>> It also changes dptx1_aux_clk_src to use the correct ops instead of
>> clk_dp_ops.
>>
>> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/clk/qcom/dispcc-sm8650.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
>> index c9d2751f5cb8..80fe25afccf7 100644
>> --- a/drivers/clk/qcom/dispcc-sm8650.c
>> +++ b/drivers/clk/qcom/dispcc-sm8650.c
>> @@ -398,7 +398,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
>>   		.parent_data = disp_cc_parent_data_0,
>>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>>   		.flags = CLK_SET_RATE_PARENT,
>> -		.ops = &clk_dp_ops,
>> +		.ops = &clk_rcg2_ops,
> 
> Should this also be clk_rcg2_shared_ops ?

Nop, the only parent is tcxo

> 
>>   	},
>>   };
>>   
>> @@ -560,7 +560,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
>>   		.parent_data = disp_cc_parent_data_5,
>>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>>   		.flags = CLK_SET_RATE_PARENT,
>> -		.ops = &clk_rcg2_ops,
>> +		.ops = &clk_rcg2_shared_ops,
>>   	},
>>   };
>>   
>> @@ -575,7 +575,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
>>   		.parent_data = disp_cc_parent_data_5,
>>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>>   		.flags = CLK_SET_RATE_PARENT,
>> -		.ops = &clk_rcg2_ops,
>> +		.ops = &clk_rcg2_shared_ops,
>>   	},
>>   };
>>   
>>
>> -- 
>> 2.34.1
>>
> 

