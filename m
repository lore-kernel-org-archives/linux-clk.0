Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BFB2F360E
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672012; cv=none; b=NJYRmXrCr+3S/6iCxwyOSbdmIurzEnX8egXLFSpjU10gIlelco/k3CC16Ad9+PsIaC5QhXZX6EhCMGuTO+YzQRhLjmI7CC6uVm7V9nR6Wu6XQMjDt/eQadyy7PpeY9P2MHKjBT9GqLyoKds3G5bga47VFYhVITLHOru4L3MMLuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672012; c=relaxed/simple;
	bh=7YSSYEotnwWDz0WQadSEh4yzlSbSon2sW/pXPzqpekA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqKl1c5LD8ArFSiopxzKe9Cg3PCj6vxGvpcS71Ezp1hHOFkNqoEHmE5wLNBO46EOUKIzPTyN7uJYmzZ+u3gR4ir3z9LZxmVsyipMM4yDc74Xuws7FCrpn0bOtOqoheqbkqbpZpbrib5tIn+To0e/GuGm89JUNgqImA7RYJMNx1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PdhsiESP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PdhsiESP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45dda7d87faso11989425e9.2
        for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 03:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757672009; x=1758276809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hN/qVIMctC3YPj1IaROqoLTbIv7ZPRR1zi7mYzUdMs=;
        b=PdhsiESPfNIzsm9sqRQ6wORkRNIVVfWc8fhDDEehrCh18LXAW3ByyiRRUd65dghE8e
         nyc52aJyKklpYDpOxRY5suX3sJPoboEJy2f2GhIjuN4BZDwFzfXCwJv91gm9OWCUBfm7
         UJMkG2cRYYsbagG9+aOF0uxQ0VA9KdMddsjeofrACGVE/Ekkuk8p5LZS5Vtq2QoYierW
         tuu8V0ojt3Qy6xpY0osVzORL+U/RayEV7NlKUvtKJpUQ428s1sAoBKvKzw9GpoPNA+EZ
         fZXQEuPXRmi5tJUZEQTOjRIwpBMfXn541hXm0h5qJKPBenEZ+eW3IIyjs8Z5VvCoakSx
         9dhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672009; x=1758276809;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hN/qVIMctC3YPj1IaROqoLTbIv7ZPRR1zi7mYzUdMs=;
        b=mxFJVW6rQqs63jUwrrN///E4bcitVaaerAeU+EqIHdFgq2Qc6C600isuvPcBNCAImI
         ynXOAKgrjGKsP4uji1noWdnwQQtfp1+KNTFoYgyKPcAPRf60f+duKcr3cakqXb5mXD7R
         hWROZDhoaQJtSAF2bgdgUd3b8/glnznaw06OIQRPh3bzr6R0YMVyRDAr2Vczsr36EWzF
         q7dmF4SbZxfvSTWbN40naxZvJjP48+rd2Xn2wVcUpraJv4u02h6HWeAMXJwL9PhfCBGt
         LMmXxjWIE/Ct5IlBSeOxFm2NsfOZqQJrEXptqjdUqmeo7oMQZuSMGnGMHbWlUla/+s//
         g6aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwBTRmCGa8KUQioxsvYi0ptReUcTEoUyQGvTLG6d42+CLMCv/eWkPyT0qzFpSj9HgRUrainsrkxqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpeRgGXZpgs73XAocWs0RqlAdHvKQ4ijg+JyC1G1cQ1lJxSWm/
	l8v7y0XUaIjfoH5Jt9AKdG+a0DzyoaZY/7yhICgCtzQCywvmWtnfw0cIPD9+2kT7Qd0=
X-Gm-Gg: ASbGncucgj9IxJFcd1AGRFCZrkOAl9SsKtgfMtaSGS3TUWGlplcnIiyTViWKqoyJT2a
	aPGvJznA1mZXtFWjSMTLNVcY4B1b1S5NmEcKWjK16/rme9WCO/+1+jpaJTcR4g3p9U4uc/pTJ5t
	hZCBtEOxfxa94rQWSgYnnkkdr+oq3xq4A/+mJ4sGhHj0Fqce7nJ/1VBn+6UOQzchKATFmFVRfjQ
	7zvlCZ+YVGVNTKe/No4tim7XsaBLeuKqj2jn9uw+9Lb8j854IAfWU+bqz0DHtsDpFcChAA7AOkA
	Y0oud9aW+nS3p4HDvEklJjmdP1Rj8qnma547vUGwsKXdLX6NedYVzdsvbbyffbMJqXyto4vfsot
	LJTB/YKzdCBGluhvsMBNJooOGpDVRacqsM7k7lvSSDk0f4cyWK6NYAveavN2JHHrbEs2O70PKVk
	Vx5NTepikPWPGZCPofwkw=
X-Google-Smtp-Source: AGHT+IEFCg9ERw6mHKnZORBmThBFfHqVD5ZdJKuGx1uKOuK+P5u+fYpQu9TUH7YFEflDpqTLjoHNNA==
X-Received: by 2002:a05:600c:6c94:b0:45b:9afe:ad48 with SMTP id 5b1f17b1804b1-45f211d57e3mr24116895e9.16.1757672009153;
        Fri, 12 Sep 2025 03:13:29 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1455sm59377255e9.24.2025.09.12.03.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 03:13:28 -0700 (PDT)
Message-ID: <8135e54a-7652-445d-9c15-226cd930aa86@linaro.org>
Date: Fri, 12 Sep 2025 11:13:25 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: camcc-sm7150: Specify Titan GDSC power
 domain as a parent to IPEx and BPS
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <ilbxHd5Mgx6B7mM9zuoCveOseTxibuVat5l3Y5QtqYOyaZNWLHlAgTM6oWPFK77aF7TEoHa6vGb40GqIJx--ng==@protonmail.internalid>
 <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2025 02:12, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM7150 camera clock controller, and it should include
> IPE0/1 and BPS ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sm7150.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
> index 4a3baf5d8e85..0e072ae39ec0 100644
> --- a/drivers/clk/qcom/camcc-sm7150.c
> +++ b/drivers/clk/qcom/camcc-sm7150.c
> @@ -1846,6 +1846,7 @@ static struct gdsc camcc_bps_gdsc = {
>   		.name = "camcc_bps_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &camcc_titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -1875,6 +1876,7 @@ static struct gdsc camcc_ipe_0_gdsc = {
>   		.name = "camcc_ipe_0_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &camcc_titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -1884,6 +1886,7 @@ static struct gdsc camcc_ipe_1_gdsc = {
>   		.name = "camcc_ipe_1_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &camcc_titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> --
> 2.49.0
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
