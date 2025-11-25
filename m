Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF9523A
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 07:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764054374; cv=none; b=V7+4wislEsSk2HE7ia/aWDeaXkglK2DxR3Mbr9NlFE2vGzf94hJh3yeOo4m4jrmn9Ied6R+qP+ivp8nts+C2X79M+WgYaWK+A15/AjN0TMSA3cTfZL5rGG6mMX0m+xC8dl9JKlVxoD2cOrFyHYDs+E9vXkfwPzVOJ0U/wFvVsXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764054374; c=relaxed/simple;
	bh=Pmh3tnqQxKeS/SEMGYgGDVSJN8Tg/FabFKdMF6JrEEQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pVRZTLuY4UTAAjnG877pDGlxQjRjBlJKilWmqXuc1Q0dCZJkB+gNdzpr81UYwD4/T8eoBCf4/sOERZI5Yh2AsMhyIDkyPf2j8J2swz2Qwg4A7NFPmb4mf/0Wua6BKo1Low6IN7U6YuPCEXsgWBEGxvETo+3M5AS8cOiAzog+ldU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O6h9KpG5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O6h9KpG5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429c8632fcbso3186366f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 23:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764054371; x=1764659171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEm0xkER5A9fvC8M611AVTHN4OE0WgnQgh+pWroZoTU=;
        b=O6h9KpG5dCXZfxaEg43qw/WNrbqJ2javhXtYa9/xnORRiyNFRd/10VIbMfRLrws/uq
         i8Rj7qN+a3VFv7hMJp9T/eL2/P+8l8n2zEEjUNP0HWbSKhnl/oBfTZ35pulTcsBjXLR+
         TzuccdBoPFnKwuPNg3AgTSzK+JM3AK36tQU81UnrukUDz1+4PZ36t17/jPElFjglSF8Q
         f0sSg/3L0Zv/+lmVpg8sMajdVFdlXDmn6QVe1y1apvOeXwrMBnkWJtzTY+fJUK7WFDfL
         2A/+mptd/W0CSXwSJhyKef6zRjGMQoMb0XDatQjWZLxvDvYlV9oks+0PYjwKYrlm3M7m
         0UDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764054371; x=1764659171;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEm0xkER5A9fvC8M611AVTHN4OE0WgnQgh+pWroZoTU=;
        b=Hgr3slEQ0nCt2mLuLHjH+j/1dJTzQtJEoc9Wqd35L/bSCImzgl+nolWRa8lHUw43PT
         CixMJh08I4DMHsB79JYRvYfovaDb4zLh6MjkDaWRIZd2Lx5pvKF0yANrjcXoNsSqUgBy
         gsdSD9SXip+DdhIsWn5qjkd8JcrGWwVl8EY3rnvrfhDvy8m9oc9kctDHiqzfCchEtY7m
         Vbl8AwjhICkSF5t4Lii7SEz9+aQBbH9Z0QzC8MN+k3D20ajXQvr09v8h/rD0pv/7zCev
         ehk1axQxlF+Mp46lbHm/Ov6NIbNXz0wcz6PcNulS6fKTXiiyyvjRgWPWLIQ8RlN9vnw2
         /upA==
X-Forwarded-Encrypted: i=1; AJvYcCXRzTQwskCROjEwJy5KJkl4aU85+mSARBl40yKlaG2TKtMHAMrM6RcpGATrPUXJneb0caI4/O4fUyA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1HxqgMJVMkXyhLL1rNETZipnGIc4FJWg63DfBuUjdkHwGi1jD
	gPBkYsixa59ZuvhzdcHV5pr2ukePyeBs+rVxpDVt4w4QZGff0k65XUUyPFDNZwVbhhA=
X-Gm-Gg: ASbGncuxO4hocYSrxP3nqxhSnrVf9Zew7SGlXggnvthf4ESlX6EjgvW0vobh6Cy/dyM
	QcoF7jKxAv+NEfEiAd5ZbORRKA7o0b6Z2VmH/K/EW4wc6ojby5Bl6RCFib+IvdhqZdYDpM/+c1y
	rrtqg/I54wvX5rdnCVZJGXG7cnS1EN/QUgZKXZ+KWSscyEvq8WfhXsAIIV//RM36z8oA8thL+NK
	24/RQo4RSrEtjrFVTiIWOPBMg5OdPF95hVtkLle7S5ul7fV40PSzQkZ32rEE3vpDszpCgRO5Smu
	/QjEPOPtXJVfGi51F5suHo2t1aRhsPYqIrg06fSKkPQl+euhVnx2hPFIlIaBAxq8BDtRvHNKT//
	sUxQ0myOQaUkiPTNTDJPN5nrRbYrZGzxTg0rXhUNx8H2q2JTBi126ZGtbVH7DnJsp/i0rR+Es/J
	Ohpp1kL5RQNBpYq5VVsySx4BT/bTqRqelZhNbgBBPZLeAoEIbiB6DfeEvAbO3ZFmg=
X-Google-Smtp-Source: AGHT+IHSHFMY4Ju7/Ym0lfE9c56GU1AZP59rAXfNrVOGGYtc1Si8CFAqa69njaVqAPt9294ITeFN6w==
X-Received: by 2002:a05:6000:4012:b0:42b:4081:ccea with SMTP id ffacd0b85a97d-42cc1cf3c2cmr15083426f8f.35.1764054370539;
        Mon, 24 Nov 2025 23:06:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:dea1:baf7:4d0c:118e? ([2a01:e0a:3d9:2080:dea1:baf7:4d0c:118e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa41d2sm32500921f8f.22.2025.11.24.23.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 23:06:10 -0800 (PST)
Message-ID: <c150b3e8-23ef-4c33-aa10-1047717d67a4@linaro.org>
Date: Tue, 25 Nov 2025 08:06:09 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
 <20251124212012.3660189-2-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20251124212012.3660189-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/25 22:20, Vladimir Zapolskiy wrote:
> In line with commit a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops
> for SDCC RCGs") done to fix issues with overclocked SD cards on SM8450
> powered boards set floor clock operations for SDCC RCGs on SM8550.
> 
> This change fixes initialization of some SD cards, where the problem
> is manifested by the SDHC driver:
> 
>      mmc0: Card appears overclocked; req 50000000 Hz, actual 100000000 Hz
>      mmc0: error -110 whilst initialising SD card
> 
> Fixes: 955f2ea3b9e9 ("clk: qcom: Add GCC driver for SM8550")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/gcc-sm8550.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
> index 862a9bf73bcb..36a5b7de5b55 100644
> --- a/drivers/clk/qcom/gcc-sm8550.c
> +++ b/drivers/clk/qcom/gcc-sm8550.c
> @@ -1025,7 +1025,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>   		.parent_data = gcc_parent_data_9,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>   	},
>   };
>   
> @@ -1048,7 +1048,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>   	},
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
