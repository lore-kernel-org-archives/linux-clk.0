Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C827639
	for <linux-clk@vger.kernel.org>; Wed, 24 Apr 2024 00:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713917792; cv=none; b=OKQZfi3Va6AQ3JkwDmWsFrcsayyb1TZaqJTm7LPhRTRpOuX6hIoFohXC4Z+aRU4gQXVa3NRxS/KeOBzqe59i4zqCqB9dvEiSTQ5c8f/QXxy5jff1S49x5b8qmeKdY73YYRPs3uaioZ9Zz4XAdsO1cHDdNpXcP8oF9ActgMNONNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713917792; c=relaxed/simple;
	bh=vH8TUXVp14Y1tF11bj35c1Q3PKT0zOfhWqOZP+37v2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A8eSeucHjZppd2rldCV7EC+yrx506xkRVK7IorJySw0WTXfBkJd2N5QbvrrcgvhkB0LEOAybCLT4nuZhp4Mor+SnOSfA9f4rXvXvODomopYLjl27VZQUqoGcILd7E4oLFLjfaPNZDwvv4dBA02xhhlqFVjaDq9SQalehtnVmv5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ELrKbZA5; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ELrKbZA5"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-343e46ec237so5277069f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 17:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713917789; x=1714522589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K0pUZMSUM0wS5UBOCyyIVV0VM1ykC5stPfsCzESY0oc=;
        b=ELrKbZA5p7kvdH/0Pdqq7oZePBTdl7tySj0pi2cJt1AiQjeCaM6pmX6dF7B4Lom3NP
         RaqTV/iqLgRzCHL3Th0pwd0pmDp3xJjS5Vd+ep0nLcTyFPLmIEUDjPbMpP+QMaOpyoXZ
         oQ/NH2D0N7X0n6G/eIbY0vFVlZTEJUrqpracwU3I0QxhqxAZyvDS1IM1zev9Hb9HCGir
         Q4xAGaXJ3URmXp1FchG6+9MvdsW5GnnwziXdt8UPBGD9rT2uMfAkIotl6mGcNPsYgjv1
         UOZAk/GMk6FxtummuXsNU4zSLzWBs78dfGwVhTdbVlmYDgZu03milbMO71KQCTfFEaOa
         9sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713917789; x=1714522589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0pUZMSUM0wS5UBOCyyIVV0VM1ykC5stPfsCzESY0oc=;
        b=CEppWMvsH2pkrPuyaekUJyw0V1YQFWcLmcCmAV5wcw18yZ+Xqnq6v22sWiZxJbRpis
         y7iYHkaakat8fcodI7VeXP+b0HuZ9fksJ+gZLd/DO5d1cpOYqrexYpadNgDzJrq3rx8i
         ac2vt8ynl/LQx5c7FE5MCQgzn/2GdX9mDPDSZOVYf24C/cxF8LodqDVAmMpFt2bGWGCp
         lnE/pLkC1OQDDM2zAcjJiGxu5s6VzwXlIjD4ZKdQCiiaRZIJCDA0h6vRMrfVh5Ab9no3
         cZFDm1v1HJ29AaIGGyYkauqV6fhr4+e+kP6tWOdQtastf3my6tDAeorw5ZCumBuGeI16
         EZDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6wPWHy8AmqJbVptY+xFz9iN+hygt9fDwE2mgD3qblvkLH2Aa0VasDAbIinhydz2m+COJNFNIgwdylEvPetXwvqG18lX0DnYh3
X-Gm-Message-State: AOJu0YzcaJ9L8jKaWuLd5+T9qC0x574UxJV9i/EUcwhi0XSSf7bSp6mm
	E4g5Dwde+Y93fqE8SY77NRY6rXIa1bVEeDVzZ7pDcxbEM9mY71veWX+NknDTBqk=
X-Google-Smtp-Source: AGHT+IEBbsQv7MvHH+05WRyjPm/vcH5Gi/IkbhrXGGTHpSm/YU5rg7c2JJdbV16cVdR9Q8PVRh8I8A==
X-Received: by 2002:a5d:504e:0:b0:33e:363b:a7dd with SMTP id h14-20020a5d504e000000b0033e363ba7ddmr469809wrt.20.1713917787851;
        Tue, 23 Apr 2024 17:16:27 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a3-20020adffb83000000b0034b32e5e9ccsm5235364wrr.64.2024.04.23.17.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 17:16:27 -0700 (PDT)
Message-ID: <a522f25f-bb38-4ae1-8f13-8e56934e5ef5@linaro.org>
Date: Wed, 24 Apr 2024 01:16:26 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 RESEND 5/5] venus: pm_helpers: Use
 dev_pm_genpd_set_hwmode to switch GDSC mode on V6
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>
References: <20240413152013.22307-1-quic_jkona@quicinc.com>
 <20240413152013.22307-6-quic_jkona@quicinc.com>
 <5c78ad52-524b-4ad7-b149-0e7252abc2ee@linaro.org>
 <b96ef82c-4033-43e0-9c1e-347ffb500751@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b96ef82c-4033-43e0-9c1e-347ffb500751@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/04/2024 15:52, Jagadeesh Kona wrote:
> 
> 
> On 4/14/2024 6:09 PM, Bryan O'Donoghue wrote:
>> On 13/04/2024 16:20, Jagadeesh Kona wrote:
>>> The Venus driver requires vcodec GDSC to be ON in SW mode for clock
>>> operations and move it back to HW mode to gain power benefits. Earlier,
>>> as there is no interface to switch the GDSC mode from GenPD framework,
>>> the GDSC is moved to HW control mode as part of GDSC enable callback and
>>> venus driver is writing to its POWER_CONTROL register to keep the 
>>> GDSC ON
>>> from SW whereever required. But the POWER_CONTROL register addresses
>>> are not constant and can vary across the variants.
>>>
>>> Also as per the HW recommendation, the GDSC mode switching needs to be
>>> controlled from respective GDSC register and this is a uniform approach
>>> across all the targets. Hence use dev_pm_genpd_set_hwmode() API which
>>> controls GDSC mode switching using its respective GDSC register.
>>>
>>> In venus V6 variants, the vcodec gdsc gets enabled in SW mode by default
>>> with new HW_CTRL_TRIGGER flag and there is no need to switch it to SW
>>> mode again after enable, hence add check to avoid switching gdsc to 
>>> SW mode
>>> again after gdsc enable. Similarly add check to avoid switching GDSC 
>>> to HW
>>> mode before disabling the GDSC, so GDSC gets enabled in SW mode in 
>>> the next
>>> enable.
>>>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>
>> When I tested this out on sm8250 a few months ago it was broken.
>>
>> I don't quite see in your commit logs, how the breakage was addressed.
>>
>> Can you provide some details ?
>>
> 
> Thanks Bryan for your review!
> 
> In earlier series, venus driver is switching the vcodec GDSC to HW 
> control mode before disabling the GDSC by invoking 
> vcodec_control_v4(..., false) in poweroff_coreid(). Due to this, the 
> subsequent GDSC enable from venus driver is failing while polling for 
> GDSC power ON status, since GDSC is under HW control mode and HW can 
> keep the GDSC in disabled state.
> 
> Now a check is added in poweroff_coreid() to avoid switching the GDSC to 
> HW control mode before disabling the GDSC for Venus V6 variants that use 
> this new API. Hence during the next GDSC enable, GDSC will be in SW mode 
> and GDSC will powerup properly.

Right so the intention is to have HW GDSC control during playback only - 
and then revert to SW control when no stream is active, right ?

I tried your series on today's -next.

Here is -next without your changes

https://drive.google.com/file/d/1PFuLOlEp582rBQUvuwc9PNZUBxn1ioYf/view?usp=sharing

and here is -next with your changes

https://drive.google.com/file/d/1PHR4rZnWUH9Wp2B-itT5yCUXIMOMZrwM/view?usp=sharing

The first time I tried that test the stopping/stuttering was worse.

So yes the original crash was fixed but, this looks like a performance 
regression to me.

Here's the tree I tested with.

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-24-05-23-review?ref_type=heads

---
bod

