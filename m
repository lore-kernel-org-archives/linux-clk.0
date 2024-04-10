Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17F215957C
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 11:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712747922; cv=none; b=m4HmmN281iaVAmzT9gdSyLwpv6YCkg0ZkVDT5dQIXAUiNbUiTeZrehEgc1M8m3mnxN2wyzkDtvnR3oANnjKit0aDgDImb16aaFwVAn1PnagM1eMep2ubbq8xTLkYuWr5yuV/uwyV/xkw6RXyjs91d0uZAhZrwdi2HYFGM4MenT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712747922; c=relaxed/simple;
	bh=YxEnTnHB1aa7lrwu5qSTZQyyCrPlpqr9h0tNQAOgFSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYqBJtG+QEid9um9I2QMOk4aKYAMZmBn1PoPoC+j1VLSg4CsZ0OwiWpIPn3YmTm4oeMhSjPBGTA8mvOaLPZqgbP/huG8I1ojKpc/gTnXJcqqmUOfNXNoTLCg/nureNBrNoo7YeRUBLDm4m9YsVvvPS7PcOZ7LpVKXCk8ZCkjmDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=lOVPpHFR; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="lOVPpHFR"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d8a24f8a3cso24298601fa.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 04:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1712747918; x=1713352718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mlUh/9HYxr9WDC+IOtMkVrTM8E5o44WwLHkm//03KdU=;
        b=lOVPpHFRXNicaenPhNiTUJNxRJEImUOAe4x/vBMHQ/WCHGC/OfjjyFNKHGJZAVdHjY
         n27rEU0g3GktWObLt0Udsbw0NZcTEBzrkxGh/WVKIKPQ2DEMDjjKEyAqCN0Blj3QMCGF
         JqKVizUN8Eh47R43u4vz12GWIF1KAH478uJTk0UXjwuRGBaNL45nLi533iurwxMU93fA
         r02/z6JN0jUasWIKjGfGRB3vKIA7vvh4F73RLV3RFTzmvTW4Xwm7PVu7N/6d7rU9iaEK
         hLnHQ9kXseybFmAFWwxUcw6S4ykDsqSKcAl6lh/XLbqKAZPeT3diXlMww9mkmgQ6INOl
         CJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712747918; x=1713352718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlUh/9HYxr9WDC+IOtMkVrTM8E5o44WwLHkm//03KdU=;
        b=wwrOPQfrxDo5KoMGDYeeHoUAotzJuh8qU55XIVUR8RFeQ5mcwzL23Zvv8KUbnI1X2k
         l4BTsxibTU7YuUPeSWE24WFFgl1xSYyERp3HPZc6YP1jPffxB+VHonHCO/CgWDcaQcnu
         Rutn24t3ATOxP6+Pi6S7HfXDqw5O2xoZx7WkbX5alES7wbTsZ6ZhD8tg5clwJh3Cx3k1
         eHoiG2S0m6dtKymVCSwFnAK9a8LjdEQBBPHzRaTLYXQgWyA7YpdH0jx4wb9IEaypa7q9
         MkjbHbgYyJF2xbQxO/sqpz90tNSZvlLqNJbXzssJxrgBd6FvqbLREttgn5dxOquQp205
         whqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR54IRVDaP2fiRRI1FoZkSP7FOpRZeeqSlUFtLttbHSCpPVzOZzAbLY+udGQ5fyg2vMlyux+gIpWPPyhm2i9wfuTwpoFODKbzS
X-Gm-Message-State: AOJu0YwCvkfWCaBM0f6c/Ol24tCRNIthzBrwWq6NrqfESAu9tvRSSFLM
	4t/RwepNch3MTztTG1Q3TWKzx4RHAzXludFMHdFs/0KLDzrBNQxagjEN/0Q/jbo=
X-Google-Smtp-Source: AGHT+IEW/efrx9l5JQWtRkubDDKZETYoQdnwMrixNvz2olfPJ//CbY7PXwT7EBJZFOar56TUeJE8pw==
X-Received: by 2002:a2e:990d:0:b0:2d7:1152:d40c with SMTP id v13-20020a2e990d000000b002d71152d40cmr1678697lji.5.1712747918051;
        Wed, 10 Apr 2024 04:18:38 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:bfb2:9137:62d7:74db? ([2a01:e34:ec24:52e0:bfb2:9137:62d7:74db])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b00416b035c2d8sm1993794wmq.3.2024.04.10.04.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 04:18:37 -0700 (PDT)
Message-ID: <dac9a62f-f1b8-4456-985d-a5dac9e80de8@freebox.fr>
Date: Wed, 10 Apr 2024 13:18:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: mmcc-msm8998: fix vdec low-power mode
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <c427e89e-7ec6-472e-8ba8-65d5721df62b@freebox.fr>
 <bf1d7f35-e109-48a3-8e95-e35a5b09b809@linaro.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <bf1d7f35-e109-48a3-8e95-e35a5b09b809@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2024 01:36, Bryan O'Donoghue wrote:

> On 09/04/2024 16:56, Marc Gonzalez wrote:
>
>> Use same code as mmcc-msm8996 with:
>> s/venus_gdsc/video_top_gdsc/
>> s/venus_core0_gdsc/video_subcore0_gdsc/
> 
> I think you should explain what this commit is for and why its needed.
> 
> Switching on additional GDSC registers that the top/subcore0 and 
> subcore1 depend on, instead of just saying "copy the code from 8996".
> 
> With that fixed.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Superseded by [PATCH v2] clk: qcom: mmcc-msm8998: fix venus clock issue
Message-ID: <c325691e-1cbe-4589-87fc-b67a41e93294@freebox.fr>
(Changelog: updated commit log)

Regards

