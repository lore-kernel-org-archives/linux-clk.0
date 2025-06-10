Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB5322CBF6
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556832; cv=none; b=juYAZx7gm4UEllfK8FmFmE2932mQKgAVpQxE60ktJRE2y3lXJ3Z1Klolc8H2kKe/5qhjfeYmd2R9JBqsN8KrFdPSafBFDq64dWiCvavDrOISDkVqawXgB1cAAcYYqq/s4zekODwFpdyCYhDUeRymZCx1GKoEHD+7IUKpsYXDveE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556832; c=relaxed/simple;
	bh=S0mmtyWzjsCqCoDn/rfa6q0q4/Eq8txn8/ryBYyu4Yg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jZGC00N9hO+FGtShB7kNKOlzlH1wiUEXO241QXGtPkIfKDV0NDYch6O2AbeIStDNC5uqP016hsB+40gXOokinQ5AjCqwlmPg4ZqZEU3Zyo+OH7thPUfDA+Cc7S4EjF4hQEk+hU7QWFAJhgGgnWt42Z25zzdXbh2FapZ6J34M1OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WBmxVEgL; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WBmxVEgL"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a522224582so3283910f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 05:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749556828; x=1750161628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Coo2JF5+cM4uR2kYnPgicZ8fGjo28sh0FAgXwnCVr+g=;
        b=WBmxVEgLSleax5KYgdtSDwVa8pLAPoDnYNYcifvVgZ+I6/bdBlVysjtV+wq0sSWU+d
         4BAlVHsihRaOJIpwjQolM53uYZ+Kh+UZqnzC2clBuXoh8kp3N3vJWTjdiZlf6ugCNTfb
         NOq3sVz6Q1ujKYpQ49RyKSKB+6JjZq5UduHLC7Iq4rwC/7vWv55xFj0GjWIDYUofn4v3
         eb0C4YEPGCHz4MCOO6DZCqkJA5LeLDgA9Ls5md145PLRnZXliOumT0zJt/dSf7Bp3XEH
         f5SZDSaUuo4kabDka2djYR21pYxzKQH+QFqiC5s6/EwWoqDgWqhgRQttuNQp4FbprvxN
         wWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749556828; x=1750161628;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Coo2JF5+cM4uR2kYnPgicZ8fGjo28sh0FAgXwnCVr+g=;
        b=W8cXHnzSjfI0DZ/1H+IH4i4xoLjVbX7bFOVnu9QLOihlGKoVBPCMNuQp878gIXnIXl
         rqL5cwyLNYXgi3Pmo5xTH2cb/5VM3fPJm3BVQe4lTwNwOYBiRdn8c0LnZ74IemhKa4Ri
         4sBe9E6V/ItaU3h5zp//7h/IeLG2C3bqISvRSvY1wpuTXrP7SifMA9hM4Zr/PxkBp2hK
         mNZRWnOVgpElkXBv7Xz2v7JbmIlTPbcttYOS4PxWnihWRnyXxPnFmfCAdNF+rD9bxVhi
         vx9cyadxq82TeyLsN8hwjdFi7No9DLZJgJVLdKukbTERxXbAtdb+BiMpZXoM4ttm1oP4
         LS+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuyJ8TugYkHIbAgUcc+CptBkyCKV5I4KSkDvw6toKlluA50mYQVF683Qr6/SDGmRe3mDSgYnvAuTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDAEqfuNyXPpRkfh+Zk8Ahdh7IorIXW963YVZe3nj6a1iMy0Ap
	dSeD8Zzp2VFbMb0SRBVwgoHbL5Q/ZfduJDoycrv7UCUMbTyoTu9OeGuxw6xzbp/dJXs=
X-Gm-Gg: ASbGncv4vxbm5GbjmElOIxyrtQiKYy8o8uLyvfc4lRtQWaHwLwP4tD2fL+xZmpjg0Zh
	1E4unh3EczEYwoKMLYRHkD4t5aI4kyK0JKG1ZBLDziA8DegVcA+r0/ypR/AG3nYZ1tYlO1eQU17
	MnTHlKcbCcGgS731TRr7gBO5Vesf1OQRY4pY2ykwLVuv+vCUR/31WCUiEjo4MMrSEP6RvhiaHSx
	uyITuCykXNH28FvjNa0Hv8TxpJCr3uDbsJe79T5TH1ke1a2eZLs1emIIEfAGzD9xBL0xFzMwLHP
	fGaKYE7LJ/MxX6ifBLjcvp+2iDtqxwm10d8/Pg6qA8s7OCUNAQPi6q5m5nFtgM/DhxgC1PO4xa3
	A/yQ39UN+yJWkt0/ej3CiiYzBnCGuCKZYDVd3
X-Google-Smtp-Source: AGHT+IEWr+i6z74M870LqTluirn8Ed8XIxDY0nZwNEMv+tERVcE36PmtETT5IrjEiWDNl9FBSWUs8Q==
X-Received: by 2002:a05:6000:4287:b0:3a4:d41d:8f40 with SMTP id ffacd0b85a97d-3a531cadb25mr15530954f8f.46.1749556827388;
        Tue, 10 Jun 2025 05:00:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14? ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323c0819sm11927794f8f.45.2025.06.10.05.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:00:27 -0700 (PDT)
Message-ID: <c3c3826b-ed90-42b1-998c-7b482b0cb051@linaro.org>
Date: Tue, 10 Jun 2025 14:00:26 +0200
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
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
 <20250610111019.osnrknvff7tlvrfz@umbar.lan>
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
In-Reply-To: <20250610111019.osnrknvff7tlvrfz@umbar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 13:10, Dmitry Baryshkov wrote:
> On Tue, Jun 10, 2025 at 02:52:53PM +0530, Krishna Kurapati wrote:
>> When USB controller enters runtime suspend while operating in host
>> mode, then wakeup because of cable disconnect or a button press of
>> a headset causes the following kind of errors:
>>
>> Error after button press on a connected headset :
>>
>> [  355.309260] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
>> [  355.725844] usb 1-1: device not accepting address 2, error -108
>>
>> Error on removal of headset device from usb port:
>>
>> [  157.563136] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402
>> ,iova=0xd65504710, fsynr=0x100011, cbfrsynra=0x0, cb=6
>> [  157.574842] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF],
>> SID=0x0
>> [  157.582181] arm-smmu 15000000.iommu: FSYNR0 = 00100011 [S1CBNDX=16 WNR
>> PLVL=1]
>> [  157.589610] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
>> [  157.596197] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
>>
>> Enabling retention on usb controller GDSC fixes the above issues.
> 
> Could you please clarify, if there are other platforms which need this
> change? Is there a chance of switching all of them in one patch set?

Since sm8250, sc8280xp, x1e80100, sm8650 are all affected
- https://lore.kernel.org/r/20221102091320.66007-1-manivannan.sadhasivam@linaro.org
- https://lore.kernel.org/r/20220929161124.18138-1-johan+linaro@kernel.org
- https://lore.kernel.org/r/20240801-x1e80100-clk-gcc-fix-usb-phy-gdscs-pwrsts-v1-1-8df016768a0f@linaro.org
- https://lore.kernel.org/r/20250305-topic-sm8650-upstream-fix-usb-suspend-v1-1-649036ab0557@linaro.org

I think sm8350 & sm8550 also should be switched, perhaps sm8150 also ?

> 
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>
>> Note:
>> The above mentioned issues pop up after I enabled runtime suspend after
>> applying [1].
>> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
>>
>>   drivers/clk/qcom/gcc-sm8450.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
>> index 65d7d52bce03..f94da4a1c921 100644
>> --- a/drivers/clk/qcom/gcc-sm8450.c
>> +++ b/drivers/clk/qcom/gcc-sm8450.c
>> @@ -3141,7 +3141,7 @@ static struct gdsc usb30_prim_gdsc = {
>>   	.pd = {
>>   		.name = "usb30_prim_gdsc",
>>   	},
>> -	.pwrsts = PWRSTS_OFF_ON,
>> +	.pwrsts = PWRSTS_RET_ON,
>>   };
>>   
>>   static struct clk_regmap *gcc_sm8450_clocks[] = {
>> -- 
>> 2.34.1
>>
> 

