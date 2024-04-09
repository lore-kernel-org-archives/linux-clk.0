Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CF2158DB3
	for <linux-clk@vger.kernel.org>; Tue,  9 Apr 2024 23:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712705824; cv=none; b=OL8XL0m6TLi7LsDNfyqv1NGgRyB5HUcStJLIo/sTTPSUY8Pd5eJiEjo7fgE4EzIMLxTW5fAG4AIqOJTAtFMHoo5k4tBWUj3rvlE0WHF8Et9Tno/gP4F6P+GpNy1bZKsvS/8zltlxXBEso0sysEhaFQaicbI+K/eCLngSk5UUr7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712705824; c=relaxed/simple;
	bh=h+e5fvJt2EaWgcw8KS2F0yKCq8DnQLW0iSRB9NusBAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JfRJ7qGj3VqiEBccf0w7UkZlxCTjh4CXt4r3Fmsh2T3WfucnhJBJQSaU5d0Hv02sKfQCxCaV81/ZUkmkHngx7zO+y1XMZlFrkzH4G5wW0eGAIplhrPoN2+T/VQEM4bwa0K/HrXo1YRhEEaqVdj7tKn0XwS57cf84xK9rxJI9/q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MFfzX6Cr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MFfzX6Cr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4169ebcc924so10775195e9.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Apr 2024 16:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712705821; x=1713310621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gYrn0x7gSGG0Zq/O+j6l0dU8abj1nITQX9daWRuGgbM=;
        b=MFfzX6Crm71ZcyljN9aTsIvV1fapFSPqXXgWu8VDtavThklmct7wQ2nEiGIMNtRXFM
         mLqUt8O9o3YjHqP9DD+B03qltNCfeXOohWKhTbNAF96vBKCsyWny45Fw0YrOZeB/B1ta
         CngUGYgfdIGjCwDLc3c6ZKuRshNlw1VgGpC6ppf3glmwmEloIY7tSPMVVe/7XzWfpo17
         zfR2DfataLEz6Gk4nMKwlhR6g/r3l3v1GiwJBSKkQYF0i4hwF9JD0D0uBc36Ai5w6CJ0
         bkwUjNKN/1qgclXxGsJqng92/zSiWRk3UQff/mounyg9w3A927vlcGQ2kkaTuMtqFevi
         XonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712705821; x=1713310621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gYrn0x7gSGG0Zq/O+j6l0dU8abj1nITQX9daWRuGgbM=;
        b=LuWqOzniXjvIG1Fcl0Sd2ADXH2WCU3LFbVjllG7lleIGI1p8vT8yTI3NBFPcjUQSgS
         DXzBFJI/C5CeCTaceXv19zQtoV+Cie1dU/LdonvVkrt7AfUPAGkaxSZtgY68MqkOwvOL
         DnKNS0CM8QEUBViroWz9X5HPsZ8WIoF5KrFpuGq9ssdHI7+fJMRTLjCKygfpUpiNQyBP
         jPvQsSjul3yBMIPHuvxzgcdPcD4OYu46Gr8UxVSgcF5DTF57n5gNePLw4bLE+/xAssb6
         bHbAIzvhRn7RXVafmBI9AkkQITKunLYi+thtiwb3XZ3E+knpdnSwLO4QkAGNwSizHjjF
         gj4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWan2OF4NfTneEJcj6wy1djY3NFQid1VISpOLIV4lN2dRzy2AsHAWf0bog0JuYG/HmZmQwabl8LRu+325mJBrshxM+94tXkyIkc
X-Gm-Message-State: AOJu0YxjJTGfFhE+TKQD+rD4weKrBuCFziTGa673E0rp0iuIWOqD6Cfg
	25hwQSp9cxD0fTvPvftmVm6l1OtGB14lBSGkOe3Kijyr53GTQr4PwEiN1s+c3JE=
X-Google-Smtp-Source: AGHT+IGJQnrTHEaPrdEriH4SBasEFssxXyLPx4aNYphkDFzcVtK9Su2Gu0LZkdSMraUYM05UT95/IQ==
X-Received: by 2002:a05:600c:1d21:b0:415:5fd6:44c7 with SMTP id l33-20020a05600c1d2100b004155fd644c7mr722669wms.27.1712705821349;
        Tue, 09 Apr 2024 16:37:01 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c4fc900b00414807ef8dfsm450584wmq.5.2024.04.09.16.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 16:37:00 -0700 (PDT)
Message-ID: <bf1d7f35-e109-48a3-8e95-e35a5b09b809@linaro.org>
Date: Wed, 10 Apr 2024 00:36:59 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: mmcc-msm8998: fix vdec low-power mode
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <c427e89e-7ec6-472e-8ba8-65d5721df62b@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c427e89e-7ec6-472e-8ba8-65d5721df62b@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2024 16:56, Marc Gonzalez wrote:
> Use same code as mmcc-msm8996 with:
> s/venus_gdsc/video_top_gdsc/
> s/venus_core0_gdsc/video_subcore0_gdsc/
> 
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8996.h
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8998.h
> 
> 0x1024 = MMSS_VIDEO GDSCR (undocumented)
> 0x1028 = MMSS_VIDEO_CORE_CBCR
> 0x1030 = MMSS_VIDEO_AHB_CBCR
> 0x1034 = MMSS_VIDEO_AXI_CBCR
> 0x1038 = MMSS_VIDEO_MAXI_CBCR
> 0x1040 = MMSS_VIDEO_SUBCORE0 GDSCR (undocumented)
> 0x1044 = MMSS_VIDEO_SUBCORE1 GDSCR (undocumented)
> 0x1048 = MMSS_VIDEO_SUBCORE0_CBCR
> 0x104c = MMSS_VIDEO_SUBCORE1_CBCR
> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>

I think you should explain what this commit is for and why its needed.

Switching on additional GDSC registers that the top/subcore0 and 
subcore1 depend on, instead of just saying "copy the code from 8996".

With that fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

