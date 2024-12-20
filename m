Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565CD19F116
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 10:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690931; cv=none; b=DLzhG9F4pXPK38bnswyjm+t6aLEkSeCgOvDwXiM+NvkPRqOtZKhk8JCGHT0J2ryD3zFXGzHCajES2+7HNIj2z4bhXkKNNirZfA1fficOPc4pc+5BOx7twI8GqSwJtNUpTwWSvy1p9d5fHE8ih+jMLegK5P2RvF+uRGGqkF9M7mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690931; c=relaxed/simple;
	bh=Xxv0jc7HznywivnV1jTwO9PWHKjhCWlyCEuajBUjZiU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=m2bCBWPPgIUp9PvM7Cm+Imi7i5QWmpouvjd0lKV3IaQfs3wqNd119hDXt8eLOfTR3/7fgOTlU6DBUtPJAOKjCwy0iUN6tmpdG+zq5x6537HZBiH6Ox8z/r/htIt6bffIwUAk0Oxi9t4jo7LId3mF0QCUtgSAlL8afC8F+aKoNSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g0eBBvww; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0eBBvww"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so2855934a12.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 02:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734690928; x=1735295728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Rv0UntN9peSVxfJzXiam0tq/DzIR6KqCCDtf23v9d4=;
        b=g0eBBvwwFDQIh3z1fldyT9dr2tyvYAIhmrdtg9ZuDZ1D3HrUr3p5JlztUq2X3cFzN5
         1BWD5dfNqYlFdSu/Ji7XKdqiGZnJO+Oj1tjJ8caGVQZmx7DE+ftV7NtyfKWNW60eeMtc
         E9bX4X22IGes9YLfSmIR0YbmbIdbJtFfawFePDb9GaIu2WT9SZaJ5JCh6quSf9x0n1yh
         F1Q6+ayYRulBtRUVWyygY+JKNxNwfBvuuUYoc1RcF+VDPp2fybX+vXN1CXK/rtp3U6GR
         cBGdHIR4PVBOJSR07nMXrvtPCvuPhjXaAjQA5rt/sAYNELmPnsjvIViPw3lB6z5viGXJ
         EiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690928; x=1735295728;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Rv0UntN9peSVxfJzXiam0tq/DzIR6KqCCDtf23v9d4=;
        b=hb5pCBoDgLtIG62Vh+A9idPFN27zTZDVWQ2fzVDM8UpM7hwmfGlUBFhI5P46ZwWYe5
         wfQY8GuXM6YdM/GwNGLaMNuqS8wGWdU29sisjDY0ARlOKTsy4RxkhnRkdnxHdOk+kUQA
         bYqrzXri7paqmw/MrI+cH9bU8AW1Uj4+rz747j912z0GOUuCedGreV6sShBo3qIK2RmB
         4KNpkiWW48f/k6mXuWvtAqxCkEotD22aO6sab1BseOCc0F+aX2j9W6NpbhtjouapJuZZ
         CPBtA4MadHsbpFQnskSDpdPYWmIptcuTMC4tu11FGv+ug6fqeoi+Ye4J8BG9B+t+yp3i
         H9jg==
X-Forwarded-Encrypted: i=1; AJvYcCUM+klQtXdZj0VM8rzH64jHBO6Gxqrmn/ETI7W4/j6B8cGz4VFDOYRXjB1rXFDka+fV/brWod/1aHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDLNdft1jkMnfUvNuHJhVClsVDg3y+PlukdZGIrEhHCgvq+dIQ
	lpUz5+fTQNN+Ss3HRSr9X40vhcq2vWiyeR/xxRf6lFmVLbSBocmOrG3m3tPKPh8=
X-Gm-Gg: ASbGncuXZPqWb1PH1RTe6c7getKhyDY0ORBuI4G7sfu+dupDrc4DgzNZ8Oj1HeoEwAH
	44JO+MSRkQLsHciW9tpxBhObMROt9U1n8rfHjkUyamtQH+l925CmxM+VdPN8XbDl18jEPMz8nmq
	3FAJoQ4CnJc+YIz5QxJFsWNP+bAVpIEpbpD06XDpMba/7qOVXeFm99E/szLx3NpTlrzkmgR6wtU
	zpHtJ07aL8i9VdDvyO/rBwn9wrcrc0hCu5pS1g7250bYuWM2tV161NhyMKgx7+9a1fR
X-Google-Smtp-Source: AGHT+IFAtwJ+blPxyb/enh4drXznLmMhq3Xg9jY4Fyo3nuW5sg/0md1T6M+1jUSvQ7usw39sxgNTWg==
X-Received: by 2002:a17:907:809:b0:aa6:832b:8d71 with SMTP id a640c23a62f3a-aac270283bfmr169199266b.2.1734690927584;
        Fri, 20 Dec 2024 02:35:27 -0800 (PST)
Received: from [192.168.7.191] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm164516066b.65.2024.12.20.02.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:35:26 -0800 (PST)
Message-ID: <72f222a9-32b4-479a-8307-4653bc99686d@linaro.org>
Date: Fri, 20 Dec 2024 11:35:25 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] clk: amlogic: gxbb: drop non existing 32k clock
 parent
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
 <20241220-amlogic-clk-gxbb-32k-fixes-v1-2-baca56ecf2db@baylibre.com>
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
In-Reply-To: <20241220-amlogic-clk-gxbb-32k-fixes-v1-2-baca56ecf2db@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/12/2024 11:25, Jerome Brunet wrote:
> The 32k clock reference a parent 'cts_slow_oscin' with a fixme note saying
> that this clock should be provided by AO controller.
> 
> The HW probably has this clock but it does not exist at the moment in
> any controller implementation. Furthermore, referencing clock by the global
> name should be avoided whenever possible.
> 
> There is no reason to keep this hack around, at least for now.
> 
> Fixes: 14c735c8e308 ("clk: meson-gxbb: Add EE 32K Clock for CEC")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/gxbb.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 62494cf06e7d775bdb18b2242c3d45bf246bdd0e..66f299f6fef1442ead5e978c1d3750b55b800c2e 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -1266,14 +1266,13 @@ static struct clk_regmap gxbb_cts_i958 = {
>   	},
>   };
>   
> +/*
> + * This table skips a clock named 'cts_slow_oscin' in the documentation
> + * This clock does not exist yet in this controller or the AO one
> + */
> +static u32 gxbb_32k_clk_parents_val_table[] = { 0, 2, 3 };
>   static const struct clk_parent_data gxbb_32k_clk_parent_data[] = {
>   	{ .fw_name = "xtal", },
> -	/*
> -	 * FIXME: This clock is provided by the ao clock controller but the
> -	 * clock is not yet part of the binding of this controller, so string
> -	 * name must be use to set this parent.
> -	 */
> -	{ .name = "cts_slow_oscin", .index = -1 },
>   	{ .hw = &gxbb_fclk_div3.hw },
>   	{ .hw = &gxbb_fclk_div5.hw },
>   };
> @@ -1283,6 +1282,7 @@ static struct clk_regmap gxbb_32k_clk_sel = {
>   		.offset = HHI_32K_CLK_CNTL,
>   		.mask = 0x3,
>   		.shift = 16,
> +		.table = gxbb_32k_clk_parents_val_table,
>   		},
>   	.hw.init = &(struct clk_init_data){
>   		.name = "32k_clk_sel",
> 

I guess it's for using alternate 32k clk source from the GPIOAO_6/CLK_32K_IN,
but AFAIK no boards never used that so we can't even test it...

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
