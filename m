Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175AC28134E
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 09:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548096; cv=none; b=VigEnP46I07wYKgTFNzNJi2izyaHVbFGXthSyP/6+w8wfrazAfleEfKIIFxCKwPNq9D6qCayEArH6UD18HgtdP7X2jq3HlvY9BF4OZ3OOR8xTXnip/QrUe5PxpA8DMGwzmyN4bOvBQVoe154dQQ8bDSjbuzgxu1jA4ITm8eiDJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548096; c=relaxed/simple;
	bh=XUIk7Bdw8E80v5bpFNR598DwZ4V2cA3+ophOGVTknx4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oygsC3P/bscQPk9120ZcQGfw063Kz9cBWJMONf36uJEAF1lt+n/5sp/udZsT4QySjKwzpbtmsV8F9V+qwWNWu3eatr9ILU2HVhhUIMny5AC+iaYPI9mgicrp9IhBs3EezqoWpcfrVPNztdKaHwA2NDll+N+0ae/hV6rn8NR/g0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r2gXuDDG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r2gXuDDG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a54690d369so1795794f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 02:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749548091; x=1750152891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qjiCyEztD9opOLbbfERWUUIfACksihnoJ6dNpfTVa0=;
        b=r2gXuDDGUDLfjw3jSP8uHwn5iAXq1cPvhzh9iGPEsJwqlFyhEm9ZmV2Aa94tSpT5KP
         lqPnKCG/0Vzg1OWYc5fXpzAwlS3gekIn6qNKjEKkQwIkZa3EKLb7Gjy4U7R7C+LZKw4T
         RZkg2f4hehHADqYLRMiw6jSUhWZ31y+T08xQZ5uy1lQZU7+k78o2e+mi1jDP/lvz3363
         sO2j/ZArYMy1uIHvZEv75LBePKFL/KIKjrXb6zGgLhYBQ5aJ9N+BsiguCLIeKzwLkOGY
         +96mUnDRqEitYy4L2Bc8UFB/1FlAjPxtz73cYeUsUxTRhv10tpxw4+trSWqfegtLj34k
         c/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548091; x=1750152891;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6qjiCyEztD9opOLbbfERWUUIfACksihnoJ6dNpfTVa0=;
        b=n2iMrguJ4JJXtLLGFivwdnMtxABqjbiZT/LToMDEuuCOk7mc6Q2UZYMKCtZ/TFUmne
         R7GypYhzBJrcLC8YxyCkY/FeZN+YGGpLUkMkpD0XSI+0elX5Z49g0Z9Bmtyzy1aylufw
         nAk0PowdYERPe9S8HiXO4VlPaVkMXItonrAgnS+D+dvE0lmObcfyh8ljG60wWoHhvhLi
         1OsdmMFPVUugj+I9ZT3XucZMn8GQJF+cii1yj2Q8j3Al0MyLprCP702QXfsXKv28Gvsd
         mPR2ICOIpjy1Cz7UJNAteQ0RIpUFqnK7Ii3v/86jvq5rtdOfXn0mI5tnCOcjVeOCOOiu
         6p3g==
X-Forwarded-Encrypted: i=1; AJvYcCVFUbsyHAFHoY6+BQxrrQ80lnfJck+h6cjCoxc2Pg+NxyPu0L1MudKTz2LpCRFoNiQjs/kZHGZ5J7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQBoqVKEAoDgU2RDhRDd6svGgT2qNfpGQBo+aVg7nq4M7Ckx6
	sB7zKx7XKIX/V75Tec4q7Njm0EY+Ug7Y70VV4IbRO7/vHsMQVLbUfvU2g2B7P1kaDng=
X-Gm-Gg: ASbGncs/bPyphTZhqZg7WcnnBxW3RxAu0P8Qcvi8SNbqbOrnwGhJAmkhsx7l7/jawF6
	4juBCNvR6hK25ldqEhXuPUEWI9NrMp6Ftp10s7/XV7X+baEER+/mPGd5CMfpbpvcHrYwTIt2NhP
	hJqjEIO46HL9Xbp/6tgd00lbrCl9JNPHCOzKcVhMxLGwbkG8Jij3OshQPZPkAzNcs2rD4juXq4w
	Lo2bfaSBE1vbrZHPrQIY2bdZX0NDnS396ygZHEaMRNG0B2fv1/0Z8al8QO7tq8Fg1Dm2jOjgNor
	PlJ2JyypzdvHc21P7fLBxr8/sf9l6/Ec2CCrAQClhcu9piDV4jQyrk/7kwTho3pngeN1PWB20Ty
	VOUkOpo+rB0LB/UAFmojzhUNuYPmB2pTpmpzY
X-Google-Smtp-Source: AGHT+IGxYDa2RcSwYGiwKBk4KBlxyIfiHs2wpGxhwXlMFqt0eszMWqbB6Md+Cmed4LNRihsS/tlUQA==
X-Received: by 2002:a05:6000:4013:b0:3a4:fa6a:9174 with SMTP id ffacd0b85a97d-3a531cb54a8mr13732949f8f.33.1749548089574;
        Tue, 10 Jun 2025 02:34:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14? ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323ad414sm11939108f8f.31.2025.06.10.02.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:34:49 -0700 (PDT)
Message-ID: <2570d61c-a0b6-4dd5-a64c-37b95c6f5023@linaro.org>
Date: Tue, 10 Jun 2025 11:34:48 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] clk: qcom: sm8450: Enable retention for usb controller
 gdsc
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
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
In-Reply-To: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 11:22, Krishna Kurapati wrote:
> When USB controller enters runtime suspend while operating in host
> mode, then wakeup because of cable disconnect or a button press of
> a headset causes the following kind of errors:
> 
> Error after button press on a connected headset :
> 
> [  355.309260] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
> [  355.725844] usb 1-1: device not accepting address 2, error -108
> 
> Error on removal of headset device from usb port:
> 
> [  157.563136] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402
> ,iova=0xd65504710, fsynr=0x100011, cbfrsynra=0x0, cb=6
> [  157.574842] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF],
> SID=0x0
> [  157.582181] arm-smmu 15000000.iommu: FSYNR0 = 00100011 [S1CBNDX=16 WNR
> PLVL=1]
> [  157.589610] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
> [  157.596197] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
> 
> Enabling retention on usb controller GDSC fixes the above issues.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> 
> Note:
> The above mentioned issues pop up after I enabled runtime suspend after
> applying [1].
> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
> 
>   drivers/clk/qcom/gcc-sm8450.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
> index 65d7d52bce03..f94da4a1c921 100644
> --- a/drivers/clk/qcom/gcc-sm8450.c
> +++ b/drivers/clk/qcom/gcc-sm8450.c
> @@ -3141,7 +3141,7 @@ static struct gdsc usb30_prim_gdsc = {
>   	.pd = {
>   		.name = "usb30_prim_gdsc",
>   	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>   };
>   
>   static struct clk_regmap *gcc_sm8450_clocks[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
