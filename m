Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71F467A03
	for <linux-clk@vger.kernel.org>; Wed, 24 Jan 2024 12:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706099472; cv=none; b=sP+1ue6OJZdH3l0i5sV/tGsbY/sjNnk+FkXiLGZNTU8+/SXVcH5cxUdmOP5vbpWFvI+u9M8gk5ZnjvNJYpOBBwOIoVrkYnWvz0PFDleeAK7bkKx7j5Bt6zZtnj58sc3ArJqJYm+LKUfuP24rZJMN7bydYtnv41o1OJjcYssdw20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706099472; c=relaxed/simple;
	bh=HGWsXmRRlDIhC0sQuchJhH6a5jQ2k4OIV/TQJWpKzHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2Rt5NwmwOMeO5neIK+WLYOvqOtvm0EOYojIxmwglaFCoWEbtl3UpemI7M6qxLZFI0DvFx+bpLwIMqYMllSaNp8FoVbOd7Zt8NbQR/dreDMqX8fmLuLp9MHTYtoO1Tu7+aoegREr/oc6FpL+voc2V7cUPB0jbTMA9F9hQkDVa5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jF73M9Q4; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jF73M9Q4"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5101021c816so488153e87.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Jan 2024 04:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706099469; x=1706704269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LdjiQqbh/1oXBiNdWsGapL6yR6c36n54FpR74rtf9ls=;
        b=jF73M9Q4UieafQzI6sEXdQM6u0JE9razTFMha0kRRz7HSj0Hq5hMgnmQP6Shuepl9m
         TpA7Pqm+zgEg8mTVj/dptrt5EipuzYi+bPds8rvoy59CVLgRNhk4kH+PECXXJZ2xNpa/
         ioH7qZ8nDnRreFn1O9Ap0EOpORYvEquiT2A60kxzvmtKW/SWErBJTxoK57NDjFlj2p+/
         WKLRhyacfICqMVV8+vilhjTdXkkHSYGutnJFBQFmRZAyG0Az6Yf0t7WOsWFuIq9P+aVN
         ShRKQymTLqHlwhGWo7TBU7OpP8SMfJNObp9/SRCO+nMxPi1HDOxaPRVNipcegr3z6Egi
         uf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706099469; x=1706704269;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LdjiQqbh/1oXBiNdWsGapL6yR6c36n54FpR74rtf9ls=;
        b=Di2tTtdIHl/QTnLBJ/NQgc5DINxZaYa97437WrSVT0CrlF6E+bIVgZoMLV8BYfVDFl
         WeEXhdQV5IBKKSYznV5oxUvO7mRtTtIsARp/8IycSqePPGiquNC8DfHWclcxt1f45T1j
         ce1dHkyvUtoLq3bf/wvBK8mla8gpMhsVV6RYhsAX3zYebwve0/9BN0+1+GvSLNwE4fIZ
         G4I3OuigBEMHS4tZZ9dquc4BpBwRxlZ15sh+LA4/gB2mWlK/LSNmTZ8keZdVy01BVC/r
         K5tRp7bjs8DvWSRAWG5tKF3f5rfcQIbNZ1uN0PLjc/NQyu5U7Cl4R8AGAIuvESyPgAsn
         tO8g==
X-Gm-Message-State: AOJu0YyluRv3gpMVm4pOXZeALjwK4DazW6vgU1HLszm7GWUGPWImAr32
	KKoSfOPJazu9gbCaNNqBzVxEzvNEgv5kUFfykeuc1hBodUm1kty2RiHlilqv3KI=
X-Google-Smtp-Source: AGHT+IHpDqWPdRpP0rEoGs2KsxsSpaAv+BzjZ0bLk/qo5dYijws3/yg/uqhwIzG/KaFPWbcMqgQdjQ==
X-Received: by 2002:a19:4341:0:b0:510:cfb:5810 with SMTP id m1-20020a194341000000b005100cfb5810mr587925lfj.11.1706099468718;
        Wed, 24 Jan 2024 04:31:08 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p26-20020a19f01a000000b005100ed58b76sm207756lfc.308.2024.01.24.04.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 04:31:08 -0800 (PST)
Message-ID: <6aa58497-9727-4601-b6eb-264c478997c3@linaro.org>
Date: Wed, 24 Jan 2024 13:31:06 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/12] Unregister critical branch clocks + some RPM
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v6-0-46d136a4e8d0@linaro.org>
 <ZbC/QqfTvJ09KcZN@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZbC/QqfTvJ09KcZN@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/24/24 08:41, Abel Vesa wrote:
> On 24-01-13 15:50:49, Konrad Dybcio wrote:
>> On Qualcomm SoCs, certain branch clocks either need to be always-on, or
>> should be if you're interested in touching some part of the hardware.
>>
>> Using CLK_IS_CRITICAL for this purpose sounds like a genius idea,
>> however that messes with the runtime pm handling - if a clock is
>> marked as such, the clock controller device will never enter the
>> "suspended" state, leaving the associated resources online, which in
>> turn breaks SoC-wide suspend.
> 
> Generally speaking, HW-wise, if the power domain of a clock controller
> is being disabled, all clocks that it provides are being disabled.

Generally speaking, if that's the case, that's true.

> 
> Are you saying that is not the case ?

Dragons however, are peculiar creatures and it seems like the clock
controllers are not *really* disabled when we think they are,
e.g. due to RPM(h) owning a share of GCC clocks, or due to the
MX rail being always-on. It would indeed be an issue with
hibernation where the registers would need to be reprogrammed
after battery power is removed.

As we spoke off-list, I'll split this series into two: adding
common helpers and then taking care of 2290/6375/6115.

I'm not yet sure how far we can go with converting existing clock
drivers to use pm_clk_add so that the _AHB, _XO, and _SLEEP clocks
for a given subsystem are only enabled when necessary - if we
require an entry in clock-names, backwards compatibility goes away,
and if we don't - we potentially miss out on a devlink between X_CC
and GCC, plus the name needs to be hardcoded for global parent lookup.

For new drivers, we'll likely just require a clean solution (runtime
PM enabled + subsys clocks gotten as pm_clk through a dt entry on
the consumer).


Konrad
