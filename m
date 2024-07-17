Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B234F17FABC
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 11:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721217020; cv=none; b=cDhqG5aL2eqfb1UDRUG0wJ/2Vkb01BcKbaa3R6AIZMD6WspK9gT6VtEeiNbN3YS4b+YdQZAfgCyeTC0tnN03PJXZaGRJuQ6LL63k3RM4PCBGByj23NRPTisljZOYmSHsoyBOzGHvFC5hALq6lObmDWsIRRWel/wTiu6Ldp0cihs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721217020; c=relaxed/simple;
	bh=JVaK0J/PZCJIrlXBQZhWas1UEmJYDEVgENMBtAexwr8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=smyt6iNReE+bdYhnYvP02L7g3DqPPAJYysIlGqhTk3zIcpI+8E33auM1ev6+jPIom8nJvh31trt+LTBglEoYhKODcOMzxJ/YYgB0P1Glu5wI1f2Rxgca5/EtUigQ2PiiQTHdZ9BdKy/tmaD8Gnw63cTZfEUe1BjcSumxlatpW9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F6ugQwuJ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F6ugQwuJ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-368440b073bso32934f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 04:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721217017; x=1721821817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZyWxxmZgO29JkoC4TRc4yeVnGhqHgmh3XgcrnySTFg=;
        b=F6ugQwuJOdeG0ARoH3SHSCFh+s9LLZtbx9NlBDEoITFFtdwbXDn/Jqm9R4SKUalqth
         C21Ogjq1TLvp7aRyxRRdKWZHTpht4DnekRBnAdj/l19TBQUHBnzCySFYFYsrE5AY8ffl
         YG7vM7n4Q89QzlN/O7gsJ4WfVxlVOoAxyxTW9Qkh8+CVtvNB5jiIA4OUkR+v9LiMxgxt
         bUBH2UA0DQmuvLZ3RPdui8Br8VZM9EeT+KIutN1wVx3OFbKpegeKUHaYqoxt5xBf7ofI
         DrxgCocv1SB+VgvnI3CTF0qnL1vZBuR0/Ut5EYpa+T6SefKAi6RNPSqzZLAzvKgLh/4Y
         VZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721217017; x=1721821817;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aZyWxxmZgO29JkoC4TRc4yeVnGhqHgmh3XgcrnySTFg=;
        b=MyTUGKem2a0O33vPR0qBYVXliyWk7ZWvp3PqhwxOGd0rsyFT+nauk7WSk4f/LfLvhu
         W3ur3catJ/Izp2OAa32df9wYIrfiWO4VESHmlcW6cad/5KOld7ITVVjdMg9iFtOAOVHp
         4oAOaWoT7di9sYVaJRO1QbCS/RjB3UF17GQ6gWoRbw0zI03eauwlii63TM66aSZL3619
         rOEp86fkO/ejb0jq5JYznZIP5xzaz99rOPpYjmPfvukeuZfxE1YKsZxA48QUdRR22TbZ
         OvwWTkhKbKU7RG/kB/D3jAeKwAfELNjDgcQGS5YzQJtA9cO1EwVv8mYx+HmF0v+ATF4C
         G2iw==
X-Forwarded-Encrypted: i=1; AJvYcCVWucrzDrQvqfqyblYw3qDEKzbuLHYmPNzFKP5mBQPHA3/+MRxN52F3RK5G2q9lcW9gvdjY2IY29BXJLNIzpyalqfJuO+YpNqcA
X-Gm-Message-State: AOJu0YwYdhDD5sGtoJ2QNYpQxz1SsQEHlWh/kqqOaBLMuhXUpUVEGA3u
	VuAo1vMb93GtKIJp3vmE5p2WIXkIwkFekmAmDj0eJ+QoIdJpB/l4+93ogDS7UJI=
X-Google-Smtp-Source: AGHT+IEcgWXCyK0u5lje6xRBdygs3Cs0EZ635zARQLDVm418TfcKnE5nvtCxsO/FvQgIKp0ailMPiA==
X-Received: by 2002:a05:6000:1848:b0:366:df35:b64f with SMTP id ffacd0b85a97d-36827357473mr5056741f8f.4.1721217016937;
        Wed, 17 Jul 2024 04:50:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d? ([2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dab3ee4sm11596014f8f.7.2024.07.17.04.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 04:50:16 -0700 (PDT)
Message-ID: <774f2efa-74c6-4cff-be14-e1a4a518404f@linaro.org>
Date: Wed, 17 Jul 2024 13:50:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/7] clk: qcom: dispcc-sm8650: Update the GDSC flags
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
 <20240717-dispcc-sm8550-fixes-v2-4-5c4a3128c40b@linaro.org>
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
In-Reply-To: <20240717-dispcc-sm8550-fixes-v2-4-5c4a3128c40b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2024 12:04, Dmitry Baryshkov wrote:
> Add missing POLL_CFG_GDSCR to the MDSS GDSC flags.
> 
> Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8550.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
> index 1604a6a4acdc..eebc4c2258d0 100644
> --- a/drivers/clk/qcom/dispcc-sm8550.c
> +++ b/drivers/clk/qcom/dispcc-sm8550.c
> @@ -1611,7 +1611,7 @@ static struct gdsc mdss_gdsc = {
>   		.name = "mdss_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL | RETAIN_FF_ENABLE,
> +	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
>   };
>   
>   static struct gdsc mdss_int2_gdsc = {
> @@ -1620,7 +1620,7 @@ static struct gdsc mdss_int2_gdsc = {
>   		.name = "mdss_int2_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL | RETAIN_FF_ENABLE,
> +	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
>   };
>   
>   static struct clk_regmap *disp_cc_sm8550_clocks[] = {
> 
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
