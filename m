Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7AB1BF40
	for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706176540; cv=none; b=I6rYbJmE88QBbfAg9Ugge/Ud56GBzm+7mCgl/6V5q+K62BAQUnYg40sWONCsVxduwHuV6K8DZJNahjAzefKX2tinz6xZFTGE8XdfBzs83JV6Lbe51c2z2yKprHma+6w8nt0tjNRpppDNXVX5SdabZHxXbYbq6nx1Qw66Z4r0gDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706176540; c=relaxed/simple;
	bh=6lNqeaEksv1cualUi6+FAxuzKNDXiCPe52QpN8JpUzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q3uvWvlUYbGQIK3wsMVG2cxbCcPDXFt8u5lhjrABfcA0iyTraCrjkvGUF3PaggL/kt/YeF/feZA9OaHf1LZIaz9UgLh9o+m9q0gCWDLbChWCEMVBhCvzdzP8koO0OEMye/PYgAEiLjkz0OsFa5EEhVU99Vezl0WRndviiwxIRZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qfo5mEc4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qfo5mEc4"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5100fdd37f7so2590445e87.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 01:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706176537; x=1706781337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/nRRg0fCzYKQkswk6Yuy7lpWZxrjK5S0VOtBK9puANA=;
        b=Qfo5mEc4fuO5aWZ+IqY86f+85VTunzFdnqDzptj4PMyzY3LiInX5474DIYBYgahvAT
         6mycT1SkRuGZdlrWpZvHOUq7MgD15Y+GN9QkQz5RKu94kBWMXLxQmbP/p6yRzIC6MbX0
         s39C3cXT2WN6xFq08C7HMYt7shWqyd+zIB9uK1TNWZT96PmAf0qUltiMtNXVAaeJsSkC
         qumuV6Qo5leE1ghBVxyH51gZLvyGmvDB7MI4gnuMkliPhiQGfYUHB5N9Rtczj7OC3ee6
         UxlZscgVeA4PHxp6vr92ghd8Q3hzX2lLC6uWl0bhQBnJTS1OvKb1KZgaemqmfL1WlXpc
         edGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706176537; x=1706781337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/nRRg0fCzYKQkswk6Yuy7lpWZxrjK5S0VOtBK9puANA=;
        b=dCQwDCg09qxHAVAUkyr8IzKxg/P/7o7x5ledOdlxVTuI8JalOdrQ5JFYLru7fCiwKt
         zbmGIPEYkKX7zaVNeIdRSY60uFcOeX3wPYSnfGZ/vqgl5PPAd9Yu7LOZ34gRPFlHgcdX
         Nth1J/XBy2RUA+sOxo7sJC5PmXlwPnYK5uewK0gBep/2Eift7ArdvPt96slDaDwOySC1
         bSWnKt5lk5rfaoNZ+d0cHL7ojPm+OuSCqkoExgyxy5RpMd330qiU8zVLWftqsVV4TChu
         WjiezEyTKWEGkOtFGlxC5/6yiUg65ueD6EBf+wYoV5XzHkyxajmbuD6OUKlrcCkMGP59
         pWhA==
X-Gm-Message-State: AOJu0Yw4tVdzGiRiUcOPw9h+qje4iXTsVUC3QXIuKNZ9+pd0MVOkcMTy
	UqeG+nsDHVVad7MDN/fYG+JaE01x+Zn1Rfab5tDvCAiZ3m7GPR/Us95SDoevFtU=
X-Google-Smtp-Source: AGHT+IHk/moDiI4nmXXECSLzTb5A0yWjob+jLxVa9F5uccM2gYBYDUyV+b0NAmcXM6vNsnRosHIf1Q==
X-Received: by 2002:a05:6512:234c:b0:50e:8e74:6406 with SMTP id p12-20020a056512234c00b0050e8e746406mr578523lfu.36.1706176536902;
        Thu, 25 Jan 2024 01:55:36 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w12-20020ac2598c000000b0051007e2a2e7sm713457lfn.231.2024.01.25.01.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 01:55:36 -0800 (PST)
Message-ID: <5ae84692-b05d-4a43-aabb-4d2e7d9926d5@linaro.org>
Date: Thu, 25 Jan 2024 10:55:35 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: gcc-sm8150: Add gcc_parents_0_ao support
Content-Language: en-US
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240123-gcc-ao-support-v1-0-6c18d5310874@quicinc.com>
 <20240123-gcc-ao-support-v1-2-6c18d5310874@quicinc.com>
 <d31a52fc-9073-483d-b84b-1f02a5698a89@linaro.org>
 <77903574-696b-90f9-f136-be5c5d219ba1@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <77903574-696b-90f9-f136-be5c5d219ba1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/25/24 06:49, Satya Priya Kakitapalli (Temp) wrote:
> 
> On 1/23/2024 11:17 PM, Konrad Dybcio wrote:
>>
>>
>> On 1/23/24 17:34, Satya Priya Kakitapalli wrote:
>>> Add active_only support for gcc_parents_0, this is needed because
>>> some of the clocks under it are critical which would vote on xo
>>> blocking the suspend.
>>>
>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>> ---
>>
>> Is there a need to keep gcc_cpuss_ahb_clk_src around? Do we do any
>> ratesetting on it? Should we ever turn it off?
>>
> 
> The branch clocks under gcc_cpuss_ahb_clk_src are critical clocks, which are running at 19.2Mhz causing vote on XO during suspend. As of now no rate setting is happening but this rcg is useful to get the exact rates from debugfs. Hence this change is needed to avoid XO shutdown issues.

So, if I underderstood you correctly, this clock serves no purpose other
than getting rate?

In this case, I'd say we should de-register it from the clock driver and
use debugcc [1] (contributions welcome!) for precise measurements.

Konrad

[1] https://github.com/linux-msm/debugcc
