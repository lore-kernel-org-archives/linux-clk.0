Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F872137E
	for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2024 11:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714044341; cv=none; b=VeQAXkUH6C0osNp1cSKinHsT22hkACVK70lg6S2HuXSTxonxlJj+R50+WCZWD63ZknFG26q03q6/GJaTXCjE4NBnq9MzuKMbrymzVHLo10K7erSlvDEdbyKQrM/OSz0Mbl9OPsuvtOz0XjpTLMpuHCnINLNYnVobbJSBz7pkDKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714044341; c=relaxed/simple;
	bh=fwNLe0kMBbLWPVEoSUuvx176ZW4tkF/rQ4RzbXjxXRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWP3LAoJ4C0VqUKPU1jwSyWx7P+ygu6FYNTnUbXoMOePFL1SSB7Wh2yzyRg6ly1Emw4Fz8kYvKt/ADTa/RzlztqMJMlG7bHQMEWhGrgN1x/2b4ruIGIj7bqtTQlsOlstudIA4E45Nn+j9XS6R4AvSnPNSW3B8FeSsMycxGViF5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=QhtKOBzl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="QhtKOBzl"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-34a7e47d164so652684f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2024 04:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714044336; x=1714649136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LyppFXNax+/kEzh5AnWfKH+3bLs7/N1pqFNlZERxN4k=;
        b=QhtKOBzlSsmQ1AP7rUg7Rmyf+KAie0Kj4nXdptPfYtXLIPM38q2CUrIyK7AZAzHh5k
         d1Ybe2geJd0Wuv/wbfo7kcL/jnpKhdCLvvcZ1DLubmpbMZuMIDd9P/tjgHkWCoL1Ck58
         ULcpMX4pakZN9XE9udQ7l+WoAxv5/pqwT6zzvSu7YPanLStU535V7vkLfvAQPPEomvPz
         WFm/4bPbie36FjdKwWb02KM9FP4DfnY80Ha/6lNO6srnK2QW72FRvUwC8vWE/+/Ud4Do
         T1yEaLJNeTkdJJnbLswUSD7SryrTLmsr6vFEEenvYS80IJQ7aQe/I6uiLicIkD6l36PV
         HmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714044336; x=1714649136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyppFXNax+/kEzh5AnWfKH+3bLs7/N1pqFNlZERxN4k=;
        b=MZfs+dhfZu9SqTVG/D8H/DXbi/o2cK/Iiw7+aEWlHv8+/Gin4nsvRs4q7XHNpqVbRg
         LUphZHsocP7orbOVPB2u9wv5rHdSsEWghZexLf5FM2ZgZjF33u5+hPfriT1RI0pPU1ua
         YrE1DX8h/CggIuXhwSxrCPZP9+erfcFSkhS2nmD8knZ5tsdZwqhYsygjKuvkc1jkJLpK
         juLIjYOMamp8LM/KkGe4YD+RQdQ769IsfEE4zrDSdDWxlYKjH7P6lvWqIZrKGcDJYhBK
         +9JucejbQ4P3g4VSQfaPthw1djz7FyrTuy/Ex1lOMXZjGMON5OA063dq92FcNPfkOmMI
         wsrg==
X-Forwarded-Encrypted: i=1; AJvYcCWpvDpUwgRFaVjKZ+uhR+noIu8VLW63TodP/a4Mhc2QYn12FS4ElLfpTHGgtrll/+yHCaADnMAhUetvk2AkNKYtL1Z94SO5NaLd
X-Gm-Message-State: AOJu0YwwyUJRrp2WI6avPVPQdQ06GZvOyyd1zIsJcY09sjElXTEeWES+
	2yJr69cyngT+bSWpH56KT9DgV9lJpcBKVZu83M3uwq+Po4hGB1Dd2mfLfa4quZM=
X-Google-Smtp-Source: AGHT+IFFR+7svg+5NdeiakUxLZ03suBxKz7h1mQ4mQSnUeMnn4a0n7ob4+CjYL2JbkCZTANYKUMGEA==
X-Received: by 2002:a5d:60c8:0:b0:347:d352:d5c2 with SMTP id x8-20020a5d60c8000000b00347d352d5c2mr4159132wrt.13.1714044336135;
        Thu, 25 Apr 2024 04:25:36 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id t11-20020a05600001cb00b0034a21842accsm18995477wrx.86.2024.04.25.04.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 04:25:35 -0700 (PDT)
Message-ID: <2394efa5-713a-421d-84cf-f6c1b2ad26ac@freebox.fr>
Date: Thu, 25 Apr 2024 13:25:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: mmcc-msm8998: fix venus clock issue
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <c325691e-1cbe-4589-87fc-b67a41e93294@freebox.fr>
 <22628ff2-6128-4ac9-89e3-d978f57be378@linaro.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <22628ff2-6128-4ac9-89e3-d978f57be378@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/04/2024 21:56, Konrad Dybcio wrote:

> On 4/10/24 13:13, Marc Gonzalez wrote:
>
>> Video decoder (venus) was broken on msm8998.
>>
>> PH found crude work-around:
>> Drop venus_sys_set_power_control() call.
>>
>> Bryan suggested proper fix:
>> Set required register offsets in venus GDSC structs.
>> Set HW_CTRL flag.
>>
>> GDSC = Globally Distributed Switch Controller
>>
>> Use same code as mmcc-msm8996 with:
>> s/venus_gdsc/video_top_gdsc/
>> s/venus_core0_gdsc/video_subcore0_gdsc/
>> s/venus_core1_gdsc/video_subcore1_gdsc/
>>
>> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8996.h
>> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8998.h
>>
>> 0x1024 = MMSS_VIDEO GDSCR (undocumented)
>> 0x1028 = MMSS_VIDEO_CORE_CBCR
>> 0x1030 = MMSS_VIDEO_AHB_CBCR
>> 0x1034 = MMSS_VIDEO_AXI_CBCR
>> 0x1038 = MMSS_VIDEO_MAXI_CBCR
>> 0x1040 = MMSS_VIDEO_SUBCORE0 GDSCR (undocumented)
>> 0x1044 = MMSS_VIDEO_SUBCORE1 GDSCR (undocumented)
>> 0x1048 = MMSS_VIDEO_SUBCORE0_CBCR
>> 0x104c = MMSS_VIDEO_SUBCORE1_CBCR
>>
>> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
> 
> [...]
> 
> 
>>   static struct gdsc video_top_gdsc = {
>>   	.gdscr = 0x1024,
>> +	.cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },
>> +	.cxc_count = 3,
> 
> Marc, have you verified all three are necessary for stuff to work?
> 
> I'd expect 0x1028/venus core to be absolutely necessary fwiw

Considering the absence of public documentation, these register offsets
mostly boil down to cargo-cult programming.

Thus, using different code on 8996 and 8998 risks provoking the wrath
of the embedded gods. Better, safer to cast the same incantations.

Regards

