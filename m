Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B75207E16
	for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 18:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734375236; cv=none; b=iRZfmkDiY5WWlcTZE1omP/H7USNPOU1gi3a5VAGh2JAbmxjHNRF5y50hzRLJc/71BDcgxX1RQ4RN0humF/ifu/TzyfptCOsCbxslqD7EKE5JANCx1CXVMwVrhAA65m5PtJSJfGNxP6hp72EvHm/ZmwkrMO3S6WBRLq95THgR//k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734375236; c=relaxed/simple;
	bh=WL+c9MsMLCftMhyW+I2h5TrtsdsOlsdR2umauGA3zpo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CKZDyDXOkkdS3Hyt0xhj3c72iLhWgFCmpiwXkPAMOt90Dwo7uFp/Knd740qRJ84nktETbsG9cIR6KtcruO8CrVZH7obfeCaqWbmnGTit7sUYIC7X+WIf4upelE2Pm08HrwYwm2dugfXhsMOxhtVQ9FF/o9J8HmnvaE2z811e3bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o0xqpOrZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o0xqpOrZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436341f575fso31519505e9.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 10:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734375232; x=1734980032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9TdY8wDAQIhgT2ZvDa2oy0Rrrdx753hIU59bQKGYyc=;
        b=o0xqpOrZlPFIA4H9bAE+hYiZwJ+SoEz3eNc+pgQA9rrM7Fkdc0av2mlc818RCvAGwE
         gs1sRRWfUuMp3gKzSXzjfNuk3DKPcxj8jaHZcvH1dAT8YLOB1gNH45Kr64nRNVHYSmxW
         fQtHC7Kxilk+phxyhCi1UmPcWZhzhwit7CzoAIH9OvqJ8Wj5nlxgE+Feq0mMUUV8dYk5
         iM5nvzvxAx/PUa/M3JOnLElfX5w2c22HM0s/jYKFhxlb4OddiV4ElS6iR5egNuYXFijo
         WCdPdY2J31Dufr2aIo6d/tVAKNGk3eOw7Zg8w2B/UqDgzPoJbSBnHmYqSYWeyFHZA1En
         A9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734375232; x=1734980032;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O9TdY8wDAQIhgT2ZvDa2oy0Rrrdx753hIU59bQKGYyc=;
        b=nIazpBTxjbyd4vE2Me2p0Ott8J9K47XLDnS+3F+wqBDhkFMMeHZGnX0+E2WrbII161
         5slnaIOo+wp4Ilhq3Z6bt4AORKB8eLrEjES8bYYrdvJUzrLjN4DRKlYPW21vvVRfPvRu
         g2mmk6fNn5X1alYe1P4JJD8ib01BT3laMC0TGgeV86Fs/FOKHxEOhk9BAVixoKV/Zpya
         MQr+24IzOShf7BJZvJp2P7No0Q2pasN0+P2m/I/zVaaQf1TpPJGg43Cu8G6m+RtdueYY
         Ah4Qza9zNGDLFXdupyDgkDQ8R2cPV4bNSNiG+GxdJVf+6zVIqZLqhYm/KrJ/avh3yjPY
         V32g==
X-Forwarded-Encrypted: i=1; AJvYcCULRQBx5VWIYHBK6QmFrXHt+gJpCSjZZOSwTn+4mn/rafvGIDR4O4wH6DJgcpcT/OE9/BGpmDIADx4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy33Nz6j81yymuEJ0S8+xQdELh2AUpwzwjXkKwMOXEby1gPgqA7
	mj+h40rzpk4BprzV0xQ5mw3QrgRZuhFaAcuO5xeJTlyft81NfQqULtHX1poVcI4=
X-Gm-Gg: ASbGnctI6/xWd1Dr8zIhIdPMgxcQobT3nwL5VosE1/PMoFbXrqz50HtvrDmDRZpkcjV
	JmydSpessOp+iD4YIc8XCvuksyOIqyjODiz/+5XMX8Hcp6g1IhkaLyAw1Eu4Df9Idf+1FLxQVaE
	oPRVQBD2/Bb2+pOgA4J7trKql+SpMyspftRBPPfcVeM2jlBk0ZT1KM1YmEwT6JbLw3d0iyfs4b+
	m9Cpg7qfB4OMXiycJUwAcLLAizAW0PvkDKHMinkiC6jpiTrvtIwUoWVwyYsFBXW0l77ulvfPXzO
	Th09Lit07L5JcHKjgbgwCvz55TBb9nwJvQ==
X-Google-Smtp-Source: AGHT+IG59oeD9k/rUOCvesGIKAV/ezj83uuhcluTrje5318wlJogWM8odJk4nxizFM14ZiA9HZnziA==
X-Received: by 2002:a05:6000:471b:b0:386:3835:9fff with SMTP id ffacd0b85a97d-3888e0c06c7mr12974884f8f.59.1734375231995;
        Mon, 16 Dec 2024 10:53:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8b75:a430:7bc1:919b? ([2a01:e0a:982:cbb0:8b75:a430:7bc1:919b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c805d489sm8978020f8f.88.2024.12.16.10.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 10:53:51 -0800 (PST)
Message-ID: <5c8691c4-4a57-40a9-9da6-00accf3d1a4f@linaro.org>
Date: Mon, 16 Dec 2024 19:53:50 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: amlogic: g12b: fix cluster A parent data
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241213-amlogic-clk-g12a-cpua-parent-fix-v1-1-d8c0f41865fe@baylibre.com>
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
In-Reply-To: <20241213-amlogic-clk-g12a-cpua-parent-fix-v1-1-d8c0f41865fe@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/12/2024 15:30, Jerome Brunet wrote:
> Several clocks used by both g12a and g12b use the g12a cpu A clock hw
> pointer as clock parent. This is incorrect on g12b since the parents of
> cluster A cpu clock are different. Also the hw clock provided as parent to
> these children is not even registered clock on g12b.
> 
> Fix the problem by reverting to the global namespace and let CCF pick
> the appropriate, as it is already done for other clocks, such as
> cpu_clk_trace_div.
> 
> Fixes: 25e682a02d91 ("clk: meson: g12a: migrate to the new parent description method")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/g12a.c | 36 ++++++++++++++++++++++++------------
>   1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 20be7b037c07535bd2115f6e70404a95a7832756..4e6584377e43fa7c9956017ddfcd3f295fafd686 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -1137,8 +1137,18 @@ static struct clk_regmap g12a_cpu_clk_div16_en = {
>   	.hw.init = &(struct clk_init_data) {
>   		.name = "cpu_clk_div16_en",
>   		.ops = &clk_regmap_gate_ro_ops,
> -		.parent_hws = (const struct clk_hw *[]) {
> -			&g12a_cpu_clk.hw
> +		.parent_data = &(const struct clk_parent_data) {
> +			/*
> +			 * Note:
> +			 * G12A and G12B have different cpu clocks (with
> +			 * different struct clk_hw). We fallback to the global
> +			 * naming string mechanism so this clock picks
> +			 * up the appropriate one. Same goes for the other
> +			 * clock using cpu cluster A clock output and present
> +			 * on both G12 variant.
> +			 */
> +			.name = "cpu_clk",
> +			.index = -1,
>   		},
>   		.num_parents = 1,
>   		/*
> @@ -1203,7 +1213,10 @@ static struct clk_regmap g12a_cpu_clk_apb_div = {
>   	.hw.init = &(struct clk_init_data){
>   		.name = "cpu_clk_apb_div",
>   		.ops = &clk_regmap_divider_ro_ops,
> -		.parent_hws = (const struct clk_hw *[]) { &g12a_cpu_clk.hw },
> +		.parent_data = &(const struct clk_parent_data) {
> +			.name = "cpu_clk",
> +			.index = -1,
> +		},
>   		.num_parents = 1,
>   	},
>   };
> @@ -1237,7 +1250,10 @@ static struct clk_regmap g12a_cpu_clk_atb_div = {
>   	.hw.init = &(struct clk_init_data){
>   		.name = "cpu_clk_atb_div",
>   		.ops = &clk_regmap_divider_ro_ops,
> -		.parent_hws = (const struct clk_hw *[]) { &g12a_cpu_clk.hw },
> +		.parent_data = &(const struct clk_parent_data) {
> +			.name = "cpu_clk",
> +			.index = -1,
> +		},
>   		.num_parents = 1,
>   	},
>   };
> @@ -1271,7 +1287,10 @@ static struct clk_regmap g12a_cpu_clk_axi_div = {
>   	.hw.init = &(struct clk_init_data){
>   		.name = "cpu_clk_axi_div",
>   		.ops = &clk_regmap_divider_ro_ops,
> -		.parent_hws = (const struct clk_hw *[]) { &g12a_cpu_clk.hw },
> +		.parent_data = &(const struct clk_parent_data) {
> +			.name = "cpu_clk",
> +			.index = -1,
> +		},
>   		.num_parents = 1,
>   	},
>   };
> @@ -1306,13 +1325,6 @@ static struct clk_regmap g12a_cpu_clk_trace_div = {
>   		.name = "cpu_clk_trace_div",
>   		.ops = &clk_regmap_divider_ro_ops,
>   		.parent_data = &(const struct clk_parent_data) {
> -			/*
> -			 * Note:
> -			 * G12A and G12B have different cpu_clks (with
> -			 * different struct clk_hw). We fallback to the global
> -			 * naming string mechanism so cpu_clk_trace_div picks
> -			 * up the appropriate one.
> -			 */
>   			.name = "cpu_clk",
>   			.index = -1,
>   		},
> 
> ---
> base-commit: 799ce46951dcc75682223cdab12fdc905f2fe735
> change-id: 20241213-amlogic-clk-g12a-cpua-parent-fix-64362495fc9b
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
