Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87F584052
	for <linux-clk@vger.kernel.org>; Fri, 19 Jul 2024 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721383164; cv=none; b=dOqhNC6QwcxizS3PfQsiNWxtALKU3yTul3RSbwY4ywvYJlvRckidHGPWVL+IGQdMAG8gouLdPNa+l6AomXjSouQiSvyKYheCCKEJwlslYqSDQkltXwnlpjoGmQ7Z7YGwxoTh4U8jx2BrkyorYof2xTNqdbULWVNtrAE7lG/AZX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721383164; c=relaxed/simple;
	bh=V6mqUysaqIx5mgYSvOHoHHHI6CiKNq3o2BCQQ9QDSI0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tOvM9oOBXEEZ9Fk+CMSHc4dN0I0RJBa5Mg7t4+3BwCqpuWHTaBanr4AmINBu5FMqy2od6ApdYbxJ9wrXT/Nj57fb0v0QuAYesYCr7PLxjykKa+ijZ76p/yFEtgX/YqISrqWPUR+zoJo+Ht2XJ4oPfsmR4Ah3TuP05tzZPW8aWEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LPnkPzaz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LPnkPzaz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-427d2c8c632so10065445e9.2
        for <linux-clk@vger.kernel.org>; Fri, 19 Jul 2024 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721383161; x=1721987961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvh8/xfKA+zRdY4hgtgtHozql8ySrob5VmWjr6iNG6U=;
        b=LPnkPzaz3D29dnKyaPsFAzsz5ki9uy7yaU9nFI2MuwnX+xB2kV0HEQZE23fMDoMcJW
         /ui07XxirXFiX38kUBIjLrMZwiEPs1hIjLQnilUlptr+a8GptXxd306sXB2l9l4eEW7Z
         qrTJ15Z5NyfW0T+6NZyfmn0lp/19hYyv9EhQ3Vu5DWyPs9sv6LwYd7w0vXV/dUG7bxTD
         O2pIwW3mJ0oCwsAvFDUq89G4Nk/JGnd2vpMsrWJKVNaBL/nYnljdZd/AeYm17gkwtH26
         oNqN5wbKh5Kz6aeQ5aorMDwzzPjjmxpV3CVeYtONCGX97m+vAzcl08UEYxj/vLfL1i4o
         Cqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721383161; x=1721987961;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jvh8/xfKA+zRdY4hgtgtHozql8ySrob5VmWjr6iNG6U=;
        b=eX9r/x9mym4n0kUYjOnwJIgz/OOEnc+LwKQ7MtSEwG5x+QCcKTW85z/VXP2wFaQDwY
         H8X4UPj9bz/Eftxa8CVrjoBj3eqyjnIWZQYMjouE+2sjkpDf7D1dH15Dsb6McozYu9Du
         Sk4yhC0v769tEc898j+slK32qdGx89Ap4xe1meE0fRfDhQJKdhyEROISbBwj/t9UdPud
         //bGxc64vsaL4OWQZTxeyeZHRG1aPzP3E6TFRceOiCK+5VByGOb0T0K3mNaHysW6lQk5
         OFyw19WNhRtZaB5H6b2ZCTGu/hk9QW95oR/eRy2Aoa0plqL2nDG0DeUgY0CtrAI/7ksE
         zULw==
X-Forwarded-Encrypted: i=1; AJvYcCW/NRbAeMYvn4fwD+EWXR7GP+lyKffSbV6xpgveQUqpl8K/4ERPo9/dvtQXD3waDC4tJquJNCOZhslmMpSgEtoD2EkjZy7ERLkE
X-Gm-Message-State: AOJu0YysppnNPcolgCY5swSukltwxLPEzXGIg5sWiALWovbw4EEmCmSs
	vg8jGHKcfXQKsRoLHVzTbCz3eID5bGn+GDZ5+6lowMW3tDYqbhDzEWqv9G+anu4=
X-Google-Smtp-Source: AGHT+IHnpCzPkbxshMVv1KoN+fnybhzCMURpeMHEhZNW1ByqOggLul2Q6EJT/ENFi9hVU6uxNALleg==
X-Received: by 2002:a05:600c:5123:b0:427:98b4:624b with SMTP id 5b1f17b1804b1-427c50de722mr48983265e9.24.1721383160970;
        Fri, 19 Jul 2024 02:59:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ec82:adbe:8be7:588d? ([2a01:e0a:982:cbb0:ec82:adbe:8be7:588d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687869447dsm1151425f8f.53.2024.07.19.02.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 02:59:20 -0700 (PDT)
Message-ID: <56ee10ee-55ec-4943-a57e-f88ff2f54318@linaro.org>
Date: Fri, 19 Jul 2024 11:59:20 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] clk: meson: axg-audio: add sm1 earcrx clocks
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240719093934.3985139-1-jbrunet@baylibre.com>
 <20240719093934.3985139-4-jbrunet@baylibre.com>
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
In-Reply-To: <20240719093934.3985139-4-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/07/2024 11:39, Jerome Brunet wrote:
> Add CMDC, DMAC and peripheral clocks for the eARC RX device found on the
> sm1 SoC family
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/axg-audio.c | 32 +++++++++++++++++++++++++++++++-
>   drivers/clk/meson/axg-audio.h |  2 ++
>   2 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 2426f3dbb7a2..06dc1e1f45e5 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -753,6 +753,9 @@ static struct clk_regmap toddr_d =
>   	AUD_PCLK_GATE(toddr_d, AUDIO_CLK_GATE_EN1, 1);
>   static struct clk_regmap loopback_b =
>   	AUD_PCLK_GATE(loopback_b, AUDIO_CLK_GATE_EN1, 2);
> +static struct clk_regmap earcrx =
> +	AUD_PCLK_GATE(earcrx, AUDIO_CLK_GATE_EN1, 6);
> +
>   
>   static struct clk_regmap sm1_mst_a_mclk_sel =
>   	AUD_MST_MCLK_MUX(mst_a_mclk, AUDIO_SM1_MCLK_A_CTRL);
> @@ -766,6 +769,10 @@ static struct clk_regmap sm1_mst_e_mclk_sel =
>   	AUD_MST_MCLK_MUX(mst_e_mclk, AUDIO_SM1_MCLK_E_CTRL);
>   static struct clk_regmap sm1_mst_f_mclk_sel =
>   	AUD_MST_MCLK_MUX(mst_f_mclk, AUDIO_SM1_MCLK_F_CTRL);
> +static struct clk_regmap sm1_earcrx_cmdc_clk_sel =
> +	AUD_MST_MCLK_MUX(earcrx_cmdc_clk, AUDIO_EARCRX_CMDC_CLK_CTRL);
> +static struct clk_regmap sm1_earcrx_dmac_clk_sel =
> +	AUD_MST_MCLK_MUX(earcrx_dmac_clk, AUDIO_EARCRX_DMAC_CLK_CTRL);
>   
>   static struct clk_regmap sm1_mst_a_mclk_div =
>   	AUD_MST_MCLK_DIV(mst_a_mclk, AUDIO_SM1_MCLK_A_CTRL);
> @@ -779,6 +786,11 @@ static struct clk_regmap sm1_mst_e_mclk_div =
>   	AUD_MST_MCLK_DIV(mst_e_mclk, AUDIO_SM1_MCLK_E_CTRL);
>   static struct clk_regmap sm1_mst_f_mclk_div =
>   	AUD_MST_MCLK_DIV(mst_f_mclk, AUDIO_SM1_MCLK_F_CTRL);
> +static struct clk_regmap sm1_earcrx_cmdc_clk_div =
> +	AUD_MST_MCLK_DIV(earcrx_cmdc_clk, AUDIO_EARCRX_CMDC_CLK_CTRL);
> +static struct clk_regmap sm1_earcrx_dmac_clk_div =
> +	AUD_MST_MCLK_DIV(earcrx_dmac_clk, AUDIO_EARCRX_DMAC_CLK_CTRL);
> +
>   
>   static struct clk_regmap sm1_mst_a_mclk =
>   	AUD_MST_MCLK_GATE(mst_a_mclk, AUDIO_SM1_MCLK_A_CTRL);
> @@ -792,6 +804,10 @@ static struct clk_regmap sm1_mst_e_mclk =
>   	AUD_MST_MCLK_GATE(mst_e_mclk, AUDIO_SM1_MCLK_E_CTRL);
>   static struct clk_regmap sm1_mst_f_mclk =
>   	AUD_MST_MCLK_GATE(mst_f_mclk, AUDIO_SM1_MCLK_F_CTRL);
> +static struct clk_regmap sm1_earcrx_cmdc_clk =
> +	AUD_MST_MCLK_GATE(earcrx_cmdc_clk, AUDIO_EARCRX_CMDC_CLK_CTRL);
> +static struct clk_regmap sm1_earcrx_dmac_clk =
> +	AUD_MST_MCLK_GATE(earcrx_dmac_clk, AUDIO_EARCRX_DMAC_CLK_CTRL);
>   
>   static struct clk_regmap sm1_tdm_mclk_pad_0 = AUD_TDM_PAD_CTRL(
>   	tdm_mclk_pad_0, AUDIO_SM1_MST_PAD_CTRL0, 0, mclk_pad_ctrl_parent_data);
> @@ -1232,6 +1248,13 @@ static struct clk_hw *sm1_audio_hw_clks[] = {
>   	[AUD_CLKID_SYSCLK_A_EN]		= &sm1_sysclk_a_en.hw,
>   	[AUD_CLKID_SYSCLK_B_DIV]	= &sm1_sysclk_b_div.hw,
>   	[AUD_CLKID_SYSCLK_B_EN]		= &sm1_sysclk_b_en.hw,
> +	[AUD_CLKID_EARCRX]		= &earcrx.hw,
> +	[AUD_CLKID_EARCRX_CMDC_SEL]	= &sm1_earcrx_cmdc_clk_sel.hw,
> +	[AUD_CLKID_EARCRX_CMDC_DIV]	= &sm1_earcrx_cmdc_clk_div.hw,
> +	[AUD_CLKID_EARCRX_CMDC]		= &sm1_earcrx_cmdc_clk.hw,
> +	[AUD_CLKID_EARCRX_DMAC_SEL]	= &sm1_earcrx_dmac_clk_sel.hw,
> +	[AUD_CLKID_EARCRX_DMAC_DIV]	= &sm1_earcrx_dmac_clk_div.hw,
> +	[AUD_CLKID_EARCRX_DMAC]		= &sm1_earcrx_dmac_clk.hw,
>   };
>   
>   
> @@ -1646,6 +1669,13 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
>   	&sm1_sysclk_a_en,
>   	&sm1_sysclk_b_div,
>   	&sm1_sysclk_b_en,
> +	&earcrx,
> +	&sm1_earcrx_cmdc_clk_sel,
> +	&sm1_earcrx_cmdc_clk_div,
> +	&sm1_earcrx_cmdc_clk,
> +	&sm1_earcrx_dmac_clk_sel,
> +	&sm1_earcrx_dmac_clk_div,
> +	&sm1_earcrx_dmac_clk,
>   };
>   
>   struct axg_audio_reset_data {
> @@ -1853,7 +1883,7 @@ static const struct audioclk_data sm1_audioclk_data = {
>   	},
>   	.reset_offset = AUDIO_SM1_SW_RESET0,
>   	.reset_num = 39,
> -	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
> +	.max_register = AUDIO_EARCRX_DMAC_CLK_CTRL,
>   };
>   
>   static const struct of_device_id clkc_match_table[] = {
> diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
> index 01a3da19933e..9e7765b630c9 100644
> --- a/drivers/clk/meson/axg-audio.h
> +++ b/drivers/clk/meson/axg-audio.h
> @@ -64,5 +64,7 @@
>   #define AUDIO_SM1_SW_RESET1	0x02C
>   #define AUDIO_CLK81_CTRL	0x030
>   #define AUDIO_CLK81_EN		0x034
> +#define AUDIO_EARCRX_CMDC_CLK_CTRL	0x0D0
> +#define AUDIO_EARCRX_DMAC_CLK_CTRL	0x0D4
>   
>   #endif /*__AXG_AUDIO_CLKC_H */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
