Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815886;
	b=CgQhqGB9mLK/jNeMEXHL4+J3cCJe8CpyD4P42GHSV7S0PZYXy48hiiGSZ58ga3zi+PtQ
	 IMbEYsj5ysOk/CMUl6WDmLLSh0JDWYuK2rpRuj3z1ICags4Ty/SWsQorapJ2/ssrZ+E85
	 PARH6pfT9Yk2hL9SgKk7ryDPiLBu5j4UtgcsQIO7U3IX0/JNx56Wl/3fSk+UiV3i98HIM
	 +0Z5LxJTe9JmX/EVRYjzVrRxwqUcf44Xbu2bW9OcrQU4nKpdR50L040MQ1FvXMLCrXNPJ
	 kYMPAeCkio7zgxexrJp3TLQ7U4YqVhW/jGRUrQGig8cHqix2EGoZKfLN5xxUjrYNipg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=TDKWR0Bggbyju/TIs5Ee13LupgHgIQxhXl50fDo0WC4=;
	b=iRLGYLowDef9wHSvZi3pen3SckDnJ0ydIKdnEsCSexxLwKq0JeP9/cc7Q8HrCJK7Myt5
	 JSZtH6cYgdGonlNKgp1F2Ijrwtkz2uA9S2+Hrux+t5KpfB1fpTzBN2yfkQsXlPSfIvNou
	 i+p6DOtZqQmezTYtZzcNmB9jDex6pgEyt8/zjebXJpq0Bn8jfpsXiAemcDpMTqsMt2WDC
	 KMoPq1aswNHu4CZtI9buufH86OKrJdQ4uLedmeqmE0mJbrZ2/kHdzZNinOYwJ+R09PkPM
	 3GfNixF9c65LQDarSgXF5HTEegdmWS1Denil+jT9rYWOIUfWhQclw6JEFSo3wdD2aww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=npM0ztI0;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DE1606A329
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 07:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52DE1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=npM0ztI0
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so24697185e9.2
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 23:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815885; x=1795420685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDKWR0Bggbyju/TIs5Ee13LupgHgIQxhXl50fDo0WC4=;
        b=npM0ztI0LtVYqRZr0DvMeWHn12SVbpxpx0lBhJuPYVwoOtOUleaIirc27/saVpl7Pk
         5P6PuQiAYXxwv9IRM14RmMKA3MG626vssgDaUod24rvIWt7sFN4DfreQmPamluL9YUHo
         NVIkyNOkYCTlknxGWHKdZNwHfGr/ktvnhRPVqu6GYc6TIIxHHqS6y+gFnCx6QTpXsADi
         yQ3Dx1Ke+gI2gpCaW8Q6i5l0yU7wX0kl3JEcUVYxH3kcsmH6erRbxCRU1NdnNdrHmSak
         RJrvIVD73aBFAaet1WSVN/miz6hjkeY41MEvh+yyS6ssJi/enN7RbzvbBE6GzYRrc9Pn
         vI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815885; x=1795420685;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TDKWR0Bggbyju/TIs5Ee13LupgHgIQxhXl50fDo0WC4=;
        b=YhBdTf3NpD9zIVXK2VreOwmfqd3CZc019dgXdU8fuBeNwYKniE/tft9mQ7YGRNFa23
         ACMUhYS/4Jjcx4Vwj2yVh1/D/Ztqrqs94HMtfYhGnvp5OGCeK75F4/VDh1zl834mM/wS
         8gRpjq/Q2hGJnFCkJY+K1C8SbvnKNBv1G2cOk43o3ki4G5g351IIKGJJQIHR5yaFpfIm
         RTrI+/UL+SC2I7IW7nabJpjyCIbfXEJbMNEhIUbCHenyP7LK+DpPz37mLe3b9Kiy0pvs
         79BZa5fb0QlBotNdXWUW+6TZL0QDjGFISW0I2vdXpNDyhhpjUqxufi0HiOz0u/DTtCc1
         JNqw==
X-Forwarded-Encrypted: i=1; AL+hErEw9KGu2n2oisaruodVW1Em4IXIwRXSmZ8vTzI+92zflWHRuDjPziwQ0ODyCK+00gS0XckqR4thodU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+8bEpBT9zr81ofrCn9RKlKPmhLx1ZQ+V3PYGCu4lsuZUGrcf+
	CGXvJJH7ylT81bkDIcK8defRqD51WFWvDUjZ8+Y/LCNTb84oRuZn1kf8OYePuDTNnYo=
X-Gm-Gg: AYBFou39+wdg5EigubQNBrbP18BJw9sTBzpdwy4XtU9l0BCa/fuCauQVjfLH9XnBywr
	9cLEarK0FokZ/JTHLGS3lXz4F53dLdPcKZzch3FbX5s/wzgFK+fmgYz96Zv0F0tP7O/Vogiw37V
	SkHjhFnUWpUwvIJ5s404xDamX0IFyLEk70/OM7SX65V1iVVzX33O8ktKTTJtrbnU+OmvKpjYmLK
	LM15iRPyyvxyzfdoj0w1ZaNqj7+DBAgzZR54kSYlEgyATo0fPpbL/j2M7joJhSaxvY6pJ0j5cv2
	j1uWdAssO2CHtEKt/SdulTOulkxuH1ALnVwYGsoZIGxjuFWDOr+JNcT+Wl2wAFRfalXpfOAZjUu
	oyVxUJkUNRapgluRl5sRg03VSK0lNUJxfcjAhORpF0Gjuue5nX0kRIMXR07xPTzdyx6NTiU4cqB
	3pwHbHpe1KxzqjQPi0hL+4B2jkxGL+4756hne9hsPDg8Kq31C9KZgM3MBDJ7N9h6uAro5LT9AOM
	SOZe3NzaQtpG48IhzT1XPQSjw0Hf25Gm2pAiu+X76N5jAFxgZhI8RMf6EC7bQc/IC3bSHj6ES+A
	4XtPykgYVRoIa0bURbhGnjUkwOu9HdEVF1Otat2K7JtcU/X9W7ynmv9lK6cNGk235D9XSriVEM/
	rE1WgM0QX
X-Received: by 2002:a05:600c:5395:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4bb55a95d09mr197195635e9.15.1794815884566;
        Sun, 15 Nov 2026 23:58:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm19888971f8f.59.2026.11.15.23.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:58:04 -0800 (PST)
Message-ID: <2cda0533-111f-41dc-aed4-7e2b72b0b927@linaro.org>
Date: Mon, 16 Nov 2026 08:58:03 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 16/23] ASoC: qcom: lpass: enable the right codec_mem
 clock when usin LPM memory
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-16-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213502@kernel.org>
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
In-Reply-To: <sashiko-outbox-213502@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] ASoC: qcom: lpass: LPM clocks not parsed when only
>    mi2s_lpm_enable is set
> - [Medium] ASoC: qcom: lpass: unchecked mem_clk enable and leak in
>    startup()
> --
> 
> commit 6968d3f5a8288f5418d4e48725abed1263de22d5
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: lpass: enable the right codec_mem clock when usin LPM memory
> 
> This commit adds a helper to select the codec_mem clock matching a given LPM
> buffer offset and enables the corresponding LPM memory clock during DAI
> startup and shutdown for Codec DMA and LPM-backed MI2S ports.
> 
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index 4bbcd59ebd602..302c31b23090f 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -89,6 +89,17 @@ static int lpass_cpu_daiops_startup(struct snd_pcm_substream *substream,
>>   	unsigned int port_id = mi2s_port_id(dai->driver->id);
>>   	int ret;
>>   
>> +	if (is_lpm_mi2s_port(drvdata, dai->driver->id)) {
>> +		struct clk *mem_clk = drvdata->va_mem0;
>> +
>> +		if (drvdata->mi2s_lpm[port_id] == LPASS_RXTX_CDC_LPM)
>> +			mem_clk = lpass_cdc_dma_mem_clk(drvdata,
>> +							drvdata->mi2s_lpm_offset[port_id]);
> 
> [Severity: Medium]
> Can mem_clk be NULL here when a board enables LPM-backed MI2S ports without
> any Codec DMA DAIs?
> 
> In asoc_qcom_lpass_cpu_platform_probe(), of_lpass_cdc_dma_clks_parse() is only
> called when drvdata->codec_dma_enable is set, whereas the LPM memory resources
> are fetched when either codec_dma_enable or mi2s_lpm_enable is set:
> 
> sound/soc/qcom/lpass-cpu.c:asoc_qcom_lpass_cpu_platform_probe() {
>      ...
> 		ret = of_lpass_cdc_dma_clks_parse(dev, drvdata);
> 		if (ret) {
> 			dev_err(dev, "failed to get cdc dma clocks %d\n", ret);
> 			return ret;
> 		}
> 	}
>      ...
> 	if (drvdata->codec_dma_enable || drvdata->mi2s_lpm_enable) {
> 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx-cdc-dma-lpm");
>      ...
> }
> 
> When only drvdata->mi2s_lpm_enable is set, drvdata->va_mem0 and
> drvdata->codec_mem0..3 are never populated and remain NULL.  Passing NULL to
> clk_set_rate() and clk_prepare_enable() is a no-op, leaving the LPM SRAM
> unclocked when the stream accesses the LPM buffer.  Calling
> of_lpass_cdc_dma_clks_parse() under the codec_dma_enable || mi2s_lpm_enable
> check would ensure the clocks are acquired.

Yes since it's a no-op, it's fine getting NULL

> 
>> +
>> +		clk_set_rate(mem_clk, LPASS_CODEC_MEM_HZ_NORMAL);
>> +		clk_prepare_enable(mem_clk);
>> +	}
>> +
>>   	ret = clk_prepare_enable(drvdata->mi2s_osr_clk[port_id]);
>>   	if (ret) {
>>   		dev_err(dai->dev, "error in enabling mi2s osr clk: %d\n", ret);
> 
> [Severity: Medium]
> Does this leak the prepare and enable references on mem_clk if enabling
> mi2s_osr_clk or preparing mi2s_bit_clk fails?
> 
> Whendai->driver->ops->startup() returns an error, snd_soc_dai_startup() does
> not mark the DAI as active, so snd_soc_dai_shutdown() will not call
> lpass_cpu_daiops_shutdown() to release mem_clk.  In addition, neither
> lpass_cpu_daiops_startup() nor lpass_cdc_dma_daiops_startup() checks the
> return values of clk_set_rate() and clk_prepare_enable() on mem_clk, which can
> leave LPM memory unclocked and cause an unbalanced clk_disable_unprepare() on
> shutdown.
> 

It _could_ happen, I copied the cdc-dma scheme, but since it's ina new file
I'll add the checks to avoid that

