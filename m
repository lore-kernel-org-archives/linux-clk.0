Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663C5282F01
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 08:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781599143; cv=none; b=agnaRpw1QF7L3CSSBJQZEXNx2EBaDZdmFcToEDE/B1x0sFW3rV91ckbvDaa+FFHp8fac9nVpTSMTCRsup48ijhu/T/6UAMzN3kRZGKx6NYyObx+WXQwpeYGyBg/D0xDsUTivHXm0+Ux8x+7PmsNehDEtT965ZMiJyyE/Jn0NMZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781599143; c=relaxed/simple;
	bh=k8aQq5wGmFAB4J4lBgkr9j72Y9UninjoFJHtA/6CKlU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oszOMj/pcI8ODnWgfq176S5wMg6rRe2HGbVjsWUzpqM8w+0TRTp8OCPYuzLw4+kBvMvfVTECcR4vk4BNwDwkSKVsJqvvr8/8PMmcrkBzLBbMvi9cNAtYXC8czhiMxL9kgbelm5NjME/UEeAJQE0ZgAwrqRCe2h5fqPmMvf4uZNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J7OZ/uPb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J7OZ/uPb"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so26906485e9.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 01:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781599140; x=1782203940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTZp3Url2zZDdRq9wvwMvf217hOXdGlg4G7ifVPCt0M=;
        b=J7OZ/uPbYioBaElB78mQDC8gLuglE0SIflZu864FX+21Osctd+gkjzlUrqNWORzpxR
         OIDofk8l2k3i8E8nCtN+MtlehMgE9BQiggK5SCDy8TMNWUq795eSwo0bRunt9OPTivnO
         A1GO4Icw/4yTOsDFycv0G8zAegc2SBABQcXb2wHquEALpuU2AcPIJUpRi4A2BPeckiuR
         FtEKDlfmyCbXPgGB74M9IzWexkAm1POuDWUrMdkFtVYgrXIIXkpqvk68YcrQCrNBtyG+
         C6PMzV8A5c8o1gJyJNynwnMYxyF/YHiibeQF7fZq1nhtIwBGXbJft288cPp5/Mvi4Os4
         THAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781599140; x=1782203940;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTZp3Url2zZDdRq9wvwMvf217hOXdGlg4G7ifVPCt0M=;
        b=G/ei0QxZsy+qvHY0sg/FHJjtjshIODYY/7FEXN/n9t05aGnwOAseLQrXhnYsq/k+Xn
         kE1vxgWpuEYEBq9StBYweIO5X0fMNBIIzge0Hh8IxNeNiGCo5ZubIyZyEZHhf5ZC4o52
         pCWEKyPPIMnLyoxealTKx49y8LVQ4cQXcSMQBh4z6v6B2c2CyGwrNHB2eJswkIqxUja8
         NGJ44VIH7W+PH7Gp2Hcp4bSkphbvF5nyp8BswQYm1Z4FU+YWRFnCMfEhCO3PjM2/F/L9
         iAyLE0dYv61ZLikqthXhU8ua02i2KX2k1dQEv2Iq10+wX2Db/lxSNqDV4I9gz+CJtHND
         X3xg==
X-Forwarded-Encrypted: i=1; AFNElJ+Y4a1Fgvz+H1hqBNUKe/LDEUJ3vieDRU2CK6WLq/CB28mfvxKzy1ebzR19EP8lJulmpozR8wablug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya6AxDgn3Nt6zSHgs/bZeSybdrEyE3boZP4BLnNNen5D5RcHeB
	gIYZgqAmwK5LLMs65xhhcL+bwOyv84BlzHD4Ekh0tZWjl6LSDjLLMctzq0CF7Ras1XI=
X-Gm-Gg: Acq92OEoMB6x7njXfeKtPr/pDPo+5SXlI4X2YakFgPvo9oXoo7OYQvt0zaL3gmhPHYN
	pUdksjSmbNN3jxUyw/PmRH0UgnOJqi/KQTrXMK+SN44uBVX6YSBrqxkYcnHHNvpRiTMQP3GBui8
	mLR+atpcQzwTCg44PIoh2yPdLWs/URph0XDUmqQ3l9yhNFFxJ20fLKjNLENHLxa4B8Myuy+0unc
	/IorxFa3UduQDjPRdrXMhM112uUNDHwNHMo85rickgdLjoef6epT8bKFHJbyCUXsjWpFHleqmGV
	7zFkeWAvcY97xVVcHNBR8ZNdg0KqY4k38zm/7baVazLmHPlVj8gBVwx1InyV0yPkKhOiVA0Mw3/
	Z6Gfqo1NrzbVHTyM2KwSePyl9nr7LmI19gL4pxlU8aow1QSpQE677v1LckDYuCH3B+pdyfe1vnp
	cz/fUo4lVYTlcS1GGWBN4wlzjoxXO8JQ==
X-Received: by 2002:a05:600c:34c8:b0:492:1e36:8c4b with SMTP id 5b1f17b1804b1-4921e368c91mr191827965e9.36.1781599139730;
        Tue, 16 Jun 2026 01:38:59 -0700 (PDT)
Received: from [10.3.4.22] ([212.133.41.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c10sm42736575f8f.21.2026.06.16.01.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 01:38:59 -0700 (PDT)
Message-ID: <50b8d6e1-7038-4752-a200-441736dc7135@linaro.org>
Date: Tue, 16 Jun 2026 10:38:57 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom: gcc-sm8450: Add missing
 power-domains property
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
 <20260615-topic-sm8x50-tie-gcc-to-cx-v2-1-6b5752dd4747@linaro.org>
 <1d4f3e4e-ec9e-44d0-9e4a-651b6920015c@kernel.org>
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
In-Reply-To: <1d4f3e4e-ec9e-44d0-9e4a-651b6920015c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/16/26 10:36, Krzysztof Kozlowski wrote:
> On 15/06/2026 18:57, Neil Armstrong wrote:
>> In order for the GCC votes on the GDSCs it provides to be propagated
>> to CX, CX needs to be declared as power domain of the GCC.
> 
> I would be happier to see here short mentioning what is the effect of
> missing votes - do things work? - as justification why required
> property, thus ABI change, is justified.
> 
> The DTS patches gave me that answer, but should be here as well the best.
> 
> Well, don't want to stall anything here, so anyway:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks I'll update the commit message with the same explanation as
the DT changes.

Thanks,
Neil

> 
>>
>> Document the missing power-domains property to that purpose.
>>
>> Fixes: 72a0ca203ca7 ("dt-bindings: clock: Add SM8450 GCC clock bindings")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> 
> 
> 
> Best regards,
> Krzysztof

