Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608D5346E56
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775138676; cv=none; b=Hv49AR7MwHB1dLxNyBApzzHAfxx7oD6PEMWWolO4bi5ScE7/wnzb/DbOpaNUVvypVENfeYDG+nsXWgbrIfmgfcrn8jfF8Ps+M3Y+CeDmkBQDtnV84dUeTlBA7cjxGxprGkgxYOrsQyknx3Y51WIArH+lAEVgNcn4K0u63IUMnGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775138676; c=relaxed/simple;
	bh=DYqsTB1G0nLylS0Qpp3OlMS2cyI7ieHvhRKt3JrHusE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fNMXh2d9h2FXE8Z9/afBjapjjq8m/7qDloF7fBgA0dC8L0yhLDtm2erRl3xajvzpBaRob98Cl4aS5mxH8pJmpYz+FIjnXijG1e287r9DBPoWHvA1Eifd0F+dcFnQuv7h0UvoOna2kpZUNzNTr5Tmt4/J88lU4voxHrRl7jb/WDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N+Ep1pJ6; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N+Ep1pJ6"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a3c2261ffso680221fa.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Apr 2026 07:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775138673; x=1775743473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXHc9juVfDusbv47Rd8t6OKcCNL6xA25R2o3K3JKYTw=;
        b=N+Ep1pJ6uK0KD/HH3mfxTk4+NLIO0qaWNxgpVO4nFNGFm5OB1adO5E9QjcbfSCm9Pk
         m+opQv1JraqguFzzeSjEzKe43JvEMMkWdry4Aq62qjt8ZHmCCBg+OAcOxmf3gWcoTFzt
         KhqOMaMfs8jrTTIs+EPaCxkkAt/2zCl4PDQWqI3OF4P4/UwNxfV/YVU8wlbS9YyQbwoj
         oUIijUCbp1AOTehod6hkgBSI/1wLudYlwLmeopm/2rrfEl+Eep31MWiOWSPja09+BoiD
         kjrDfbFMFZl1bpXz4SEA7XUzr2FqhkT4oo/E8Ueyrk3tw9NGvN18/YK6ZqUz6wAQfdrY
         bxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775138673; x=1775743473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lXHc9juVfDusbv47Rd8t6OKcCNL6xA25R2o3K3JKYTw=;
        b=a/X3WWlqonLIE6MqOBemhkJEvzEB6tNCTJiTDkKtXYCMXle6NBtaeIXC+kHDEpUVNc
         k5MbgWZl2OixHgMFqk01lydLDqXHSziUSmdhrSeDhL1nxNFQl2wW/gSvCjYgpBaYAWEn
         49zpucmWwppAmSQ4FqvnxKZ+wUqOC2qYOw2b9IUy8l/HH399EuszfuuOefEvLNQkWBNl
         734vCyOCGTuPc9DVuDFTIVaZXmYrjDm+16QjVAnrL5uqEU6K7vQGPwmexAdo4M/Rkmub
         8FTH9Re/OAJrXyxFqf0woq9yaHZhSH7+yv+Z4/37zeckJzZbJhAEYLQo8oI1nTmx4Yjg
         TiPg==
X-Forwarded-Encrypted: i=1; AJvYcCWPl+NcvRtLUYA2hd6e0WPYUel8++h/Y2WrRK02CzODU0Ad5OAFZP0IW0yTBxOkWIO+0BIf5Bko6WU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuDdL+3hg3TFt9WtAVFCNFCWWnyMFTiZJHSw/v5SSxc4qWiPbw
	dm3p7ybbNUxRAJ0WY58BsDtI0lvDfSXPYIQ6av7KHTdTBrnG8mpvE58BeABP+82c3PCHSD/7jEH
	UXzTk
X-Gm-Gg: ATEYQzyW/4pIIreHmMC/pss7GU4a+FflbOfRmNomTV2tSYJEyK+fXcP3TYWbZxr5UGK
	cb9869p5hZyHPysKM38OpUOl7CSCE9un/zQhSElt2Mnu8T/GIf6Gphn8nMD//SnS2Yxep+zmngZ
	vGCsObSq8VBAmGy0yD99DGZ8NVUD57uMZ1yCnTEYjmwfhbkhSAHSeNexMF7fbNsbS297o3U91cJ
	GT+jxeqEoPIYrfCzNzi47I6Mk5o4zxMsMZJH3Ao/fnV2Ir9tK8DltKWvemxbBq6d52Q0yRam9xO
	rhjdO1kUAubcD7GviANlw0bPza5ECBT4TRM4ARb/218qZ2tkU9b4bY5S3Xfog58/biVxP5nno/a
	dRHOMAbpfQcs/i+G5bE4fHQ2Qxqf4eU+9LShDTvrQhH+96p7+to1G3483+wgjGBA65wYMwQDun4
	4aY6fN5ocUyGZWdC+K+S6qfpmwQS3WUA6phBBSSpmK71awiHc+46ZaMXVYYMHYCVkifzdo+Rst3
	MFWxA==
X-Received: by 2002:a05:6512:31d6:b0:5a2:a82a:178 with SMTP id 2adb3069b0e04-5a2c1f03c47mr1486574e87.1.1775138673344;
        Thu, 02 Apr 2026 07:04:33 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccbecsm692953e87.62.2026.04.02.07.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 07:04:32 -0700 (PDT)
Message-ID: <7b7b0c03-3c99-4253-8c30-b8179119e6d5@linaro.org>
Date: Thu, 2 Apr 2026 17:04:31 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: camcc: Add clock controllers to Titan GDSC
 power domain
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
 <9e65a64f-b227-4107-873f-5800cc79ee21@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <9e65a64f-b227-4107-873f-5800cc79ee21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jagadeesh,

thank you for review.

On 4/2/26 16:35, Jagadeesh Kona wrote:
> 
> 
> On 3/31/2026 7:31 PM, Vladimir Zapolskiy wrote:
>> Starting from Snapdragon 845 SoC CAMCC device serves as both a power
>> domain provider with a special Titan GDSC as a top power domain in
>> the hierarchy and as a clock controller, where the clock provider
>> function of the IP strictly depends on top Titan GDSC being enabled,
>> thus it makes the CAMCC clock controller to belong to Titan power domain.
>>
>> Today the formal hardware dependency between CAMCC power domain and clock
>> controller is managed by runtime PM in every CAMCC consumer device driver
>> like CAMSS and CCI, however this is terribly scalable to any future
>> CAMSS IP device drivers, and unfortunately it is not scalable at all
>> camera sensor drivers, which are also CAMCC clock controller consumers.
>>
>> The change adds an option to describe CAMCC power domain to CAMCC clock
>> controller dependency properly, therefore runtime PM management can
>> be simplified on the CAMCC client's side.
>>
>> The series touches only platforms with CAMCC drivers, which marked as ones
>> using runtime PM (see .use_rpm flag) but Kaanapali, which formally has two
>> CAMCC IPs, on the opposite end e.g. MSM8996 can not be covered by this
>> change, because camera clocks and GDSC power domain are not separated from
>> other media clocks and GDSCs.
>>
> 
> Hi Vladimir,
> 
>  From the camcc provider driver, there isn't any HW requirement of keeping the
> GDSC ON to access the CAMCC registers.

The change is not about getting access to CAMCC registers, it's about getting
access to the provided CAMCC clocks.

> From the camcc provider side, we are already taking care of camcc required
> dependencies(MM, MXC). Similarly consumer drivers need to take
> care of voting on their own dependencies(GDSC, clk).

As I've stated in the commit message, sensors do not belong to CAMCC provided
power domains, but they are CAMCC clock consumers. Access to CAMCC clocks
is broken, if the internal to CAMCC dependency is not resolved properly.

This changeset resolves it in a way, that CAMCC clock controller strictly
requires CAMCC top GDSC to operate, is it wrong? Shall CAMCC clock controller
driver vote for GDSC?

> 
>> Vladimir Zapolskiy (2):
>>    clk: qcom: common: Add option to link clock controller to power domain
>>    clk: qcom: camcc: Make Titan GDSC a power domain of clock controller
>>
>>   drivers/clk/qcom/camcc-milos.c    |  1 +
>>   drivers/clk/qcom/camcc-sm8450.c   |  1 +
>>   drivers/clk/qcom/camcc-sm8550.c   |  1 +
>>   drivers/clk/qcom/camcc-sm8650.c   |  1 +
>>   drivers/clk/qcom/camcc-sm8750.c   |  1 +
>>   drivers/clk/qcom/camcc-x1e80100.c |  1 +
>>   drivers/clk/qcom/common.c         | 16 ++++++++++++++++
>>   drivers/clk/qcom/common.h         |  1 +
>>   8 files changed, 23 insertions(+)
>>
> 

-- 
Best wishes,
Vladimir
