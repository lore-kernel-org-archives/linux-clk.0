Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C7D1F4265
	for <linux-clk@vger.kernel.org>; Wed, 12 Mar 2025 21:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741813225; cv=none; b=BzBOL9ejQ2go1Kt/SM5YRnuE15+exQRgHvF/7X2Xo9LNIjq84fYJAa4ivp6E5aJjC/hIXZUw5Ztr5Uj06u4EI1xjWR1Ib6q4GsXVePGCz9X69CmefemJpBPW4lZkrY+yxthfMyqULLTBhj5Dh91n830F2xhm4NPYXE8XbSxEhIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741813225; c=relaxed/simple;
	bh=ScuDkmShn2D0Kq8ggB9Erkj9flGtVscDeBuMOCChZIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kc4ogLM8O4uwmxulM84eHorXQf5rkEl4dD7YsdWQ+SPuTcP9FEO1AjlncGtWlzbsAu4IedWMJcYamF4k1n+ZuV6YVGbLjQWij3QDPz4SnrO5r8v6z9KCMcXDsQiQWtx+RpRHaIO2Ap4OpD+wuPWQ1FDdb9Udsat9L4ZuCwAi/DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E9m+/Ne5; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E9m+/Ne5"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso65380666b.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Mar 2025 14:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741813222; x=1742418022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOnA+cmYlRAwYleIWz9JDxBsHfen78RX1YLWTTlffOk=;
        b=E9m+/Ne599eetBB3EUwzPne+s2W3qRTHEnv9+eKJoXmRepUJXndsUg2h7/p/fZw8zF
         fX9Ex11yrqrwJjLQFaHE20gHPtN5SzdvHtDs3LM/y9LstCH/RgV5iPjiOyJuyKjRaTv5
         cADtM9rltKYd6FsfQsSvBtytvkaO6T9AX8EF4J2LPix8MB1Rv14YNGFZ4ZdzUkJgCdVR
         lapH6k0n+8LM8TMMwO1+VUzfvnq6XiRg+fOksCK83FVgp5DUpDhGB4QR6ycedV/v96wo
         Q+OeE9/hQghVTohcBszFg3+dYDZhS07rUw8xlNd7l79T+E8r7jRmPwWoQsx9IHtwjQ8r
         Qplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741813222; x=1742418022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOnA+cmYlRAwYleIWz9JDxBsHfen78RX1YLWTTlffOk=;
        b=Hw2OqwIYFkfgo+FG+v5Gu6QV9r99FK83vTSUD3VJ/nwDQRuq9Kr169DcZERkqgeyM2
         M8Ep5EMUmhEzDvAbvArWJSYSPsdcs1Lp4t58l2Hq+mh12Hb0BvdOyxjf5VhZL6ipvQNz
         X+g9kquJPzDjxYyHs7sXXEZ756QxwdWv26Sgf53sqyK8vQFYhZ2rBtAesPfOFfr8a8d4
         E2tx8WqvnvKKIlYYKjwpjudVltR3Ss11GBpymoudpIV3ILmrpZ76clOzr1PRAN81rmdO
         uSkLJw/Mvh9KiSly1kUaf9gzg6QJVvf3VnMMzwU1E6LWpU1BOaziitf9lONonPOayVvr
         Ywqg==
X-Forwarded-Encrypted: i=1; AJvYcCWk+9zaRydwRDllDKmtsc+tqYBCQ6SxEng9AVFi5bxQfCuPYPGmf2z+dkKmI05F91AzVKa6nBNDEEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQSo3mbFEqqPshA5aOij+GZeTHC64ej13aLv5zF8aCW87F3K9C
	87XnlH/PYWVYkmlSfNboFqgSZY0wyJYvTk5jNN4Db2+ZuBulN3Eo2kphItQ85jE=
X-Gm-Gg: ASbGncseKl0kyYvpOC2ESkvqepwC8LupmUxOdou6R7HuDsak772RTNd8FokV3n+/qIC
	GXzlsSJwwB1KO7uiBzlWAgHLTrKreSHDiXEkwvrs3x1bdxkJ9Ymk/2QFrchQUcfLDyZ+OXXopgn
	m3//Gpa87c1WXL7SRoy0SVxoT48Lwtj5yEjRwV7LWn4Zs+Hmsfzr1Ot5IB/gIWyaidE+OTLtAAD
	TbY+OltYFSq/t9V5GDinYxtbygJzzt2m78XzGRPwu84L2OIcW0EPaH9lZyj6PJXXCE7GG05rPZj
	YeSnC3U50yzAy9jJeIxOvXYXIE73lRkG2Bql1ni68RrPhAynfMCmkiGM1wTd8PsomQoql6Nnob1
	HH4wU2nojjHEkvUwq/GyDpiVg+D6zQ7rRh1n91JbvWsg1LiUw8WgjZ8VvNSYXzBFav+oV/jXAw5
	t4YJatcSGSBe+C5l1tMXeJOeEVFgPqnWWz6OVnPBqLwQ==
X-Google-Smtp-Source: AGHT+IHh0iXxxs/GZwfYJs2dwZU3bN+0fVe/CVUJtTxBagoFSg/eGO0RYs1ORkUa/uu+I4VnRXWFhw==
X-Received: by 2002:a17:907:9691:b0:abf:6a53:2cd5 with SMTP id a640c23a62f3a-ac253035876mr2957964566b.48.1741813222026;
        Wed, 12 Mar 2025 14:00:22 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2773e8641sm779855866b.165.2025.03.12.14.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 14:00:21 -0700 (PDT)
Message-ID: <8ba6a6f6-2e6a-4945-b7c8-89f9ea7792a6@linaro.org>
Date: Wed, 12 Mar 2025 21:00:20 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2025 23:53, Dmitry Baryshkov wrote:
> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>> domains.
> 
> Are those really required to access the registers of the cammcc? Or is
> one of those (MXC?) required to setup PLLs? Also, is this applicable
> only to sm8550 or to other similar clock controllers?
> 
>>
>> Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index d02d80d731b9..d22b1753d521 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3329,7 +3329,8 @@ camcc: clock-controller@ade0000 {
>>   				 <&bi_tcxo_div2>,
>>   				 <&bi_tcxo_ao_div2>,
>>   				 <&sleep_clk>;
>> -			power-domains = <&rpmhpd SM8550_MMCX>;
>> +			power-domains = <&rpmhpd SM8550_MXC>,
>> +					<&rpmhpd SM8550_MMCX>;
>>   			required-opps = <&rpmhpd_opp_low_svs>;
>>   			#clock-cells = <1>;
>>   			#reset-cells = <1>;
>> -- 
>> 2.43.0
>>
> 

I think both of these are required.

Its a pattern we see again and again with videocc and camcc controllers. 
The GDSCs and => the hard-coded always on PLLs need to ensure these 
rails are on.

---
bod
