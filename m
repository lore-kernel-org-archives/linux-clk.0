Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E09437BE70
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 08:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142706; cv=none; b=SG1COn0TaEyPImS1L5cTp5K42WOTZKdn37sj11bVkfUK6Rl+Hlxtt/Y1gkwZ+Gf/K6HuVww9INueAAxikmRIINTegnzwKOb+57ClYNeVnNZXE3kxSl5p3TnZJzDrO5QUQ/FgAsnpQVSfod3S6rQ4sq2l9FOl41Ygek4EyeQRV5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142706; c=relaxed/simple;
	bh=HY2FFHE79eV+IA11Pb0uI+HdibZTIMlzEsk5dl7xDDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mg2IY5aHL0yIwxQTI7LB18ZImIDMOAB0WuadBp80LPTbSKWYLFXjUg6y0ZKW5jwduIenVv8+WFa9k3pVVcG9psNv7j2VkgyWd/Shvu/nAN04QNIYV+FrTzQD+aMsVFzhc+vuGEs/fejM7pXFapgEq1a1Z+ls32n8ig6LvyBg8Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x1WqBmr8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x1WqBmr8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso3081145e9.3
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 01:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778142699; x=1778747499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tKBAwkvhtjuXDyDqChVpUmkpaBFOZ2EpVTKNNIDAY9E=;
        b=x1WqBmr8W+rPaJzpnPyjsGZi91JIQgFmD4s12CR5HgHdtsMqUpWiqrsOZueDIActya
         SMaqm60Aab6ihyJ3aZqEPa9IVpbFYUf+vz5fVA0E3YYa0o2dX94gTLRKsR46xqpKNtQn
         Kj7Wk93oxNSoZwA1pwhyy8Nqy7CcZ3cjTv1Z5jn8TAcr8jQoa1ZUH48Eqllg6UlonYFL
         GuBMqXRorDT2PEPsltgji1HzRs0ZqyhVZNFhxjtr5MOR05HxUjDJssBtpzCsiY7h05MH
         uSNqe6TIL7ZNGRN421C5/0EDz8jCioa8s0SR8aGIJUBAvnzzmq+dQNN9gqjeV156xVWK
         07kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142699; x=1778747499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKBAwkvhtjuXDyDqChVpUmkpaBFOZ2EpVTKNNIDAY9E=;
        b=hIYxmPXCV2qDkoddn78U1MT0WoLdqv9Wxm0iALSPLvDd5V1BSk3ifxf7Zd+8jln0K6
         xeCxxzVSGQwyctQYIzH43HftCVM0ydrRJBuTI9bFEZp7ZoNmCNq/ciuwdvfrffUiZncy
         grutDaIsXHycT+9WXPlEs1mKvRULWDZXBMyTEd3Jeta4tHUiVi770+YuA/05/+C197F3
         OI/cptMyhXW3t08UW7iMlk/uT6rE35AXBImxDAjkn4/XNrJhXfaCBUOZZUevlEqxfE0N
         WYeePeqVIhfl0QVKVW40FhLRiwXXu0hj2HjVTQ948gUAtGi2J2/ztq7wTlmoAxZ8Es0e
         +jdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZVVzqD6T0GIRMTHsvis4HNZtogkb0fovZjnb640NvS+Ej278ZD7bWrUpqhdk+aH2l16A6G10gJZg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn8Uwb+XncFxuZE77taXa9F77iWB/hfc7/6shgV0YFgP9Qovfr
	mdKnBQLQG4t5lPdM7f5lFYRituw3wqp+fv25hNW/pmUnvawEV+Tp41xhnzx7nmxkkv8=
X-Gm-Gg: AeBDiesTDpo9qd5be20C2AMpzn7BefBHTFR5yPZdls7xXwWrpIVaRylm1/tXh4xza2X
	8Npx9JrUbOfDznhOwX9YDUbAPY/WeF0ZdqEyriI1mTFFwMCgXjCLUfjCHy601QEia6SlOUn+pJN
	Myk+awXizzRRuVtRtiIvjNsI/WhM9VdGdY/anEQ3/ohcbnNdn/p2UjM/tafUnVftP0LptAtgz0C
	v2nHVuebWwyzAnLmmtb+T31MX5FoP+0kQ4oXNhw2ykj/e4c1kIk/LFeu5czYZV2aankMBOfIN3x
	W6rjmxAPr49KLOs/sBPVJw1BFU8mjTWkXc3PI9sqtrYT7Lig5D4DhIgRq9HQLEcpjNP+7+S2Esi
	C7TASBYQOerkxtt4d9aSNeV5pVIuwo2wrew+9bktHn0juKehrqnvIarcKGgZTiVNra61o4534nH
	feGeJQqk/1Kz2BGUbgtNNVvz3UITrTdgO5sB/+hMPzV/4=
X-Received: by 2002:a05:600c:1e8a:b0:488:fd7e:1063 with SMTP id 5b1f17b1804b1-48e51f4cdcdmr110121985e9.29.1778142699031;
        Thu, 07 May 2026 01:31:39 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53895effsm103806205e9.3.2026.05.07.01.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:31:38 -0700 (PDT)
Message-ID: <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
Date: Thu, 7 May 2026 11:31:32 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/6/26 6:13 PM, Alexey Klimov wrote:
> On Wed May 6, 2026 at 12:39 PM BST, Tudor Ambarus wrote:
>> The Thermal Management Unit (TMU) on the Google GS101 SoC is managed
>> through a hybrid model shared between the kernel and the Alive Clock
>> and Power Manager (ACPM) firmware.
>>
>> Add the protocol helpers required to communicate with the ACPM for
>> thermal operations, including initialization, threshold configuration,
>> temperature reading, and system suspend/resume handshakes.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/firmware/samsung/Makefile                  |   1 +
>>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++++++++
>>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
>>  drivers/firmware/samsung/exynos-acpm.c             |  12 ++
>>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  18 ++
>>  5 files changed, 298 insertions(+)
>>
>> diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
>> index 80d4f89b33a9..5a6f72bececf 100644
>> --- a/drivers/firmware/samsung/Makefile
>> +++ b/drivers/firmware/samsung/Makefile
>> @@ -3,4 +3,5 @@
>>  acpm-protocol-objs			:= exynos-acpm.o
>>  acpm-protocol-objs			+= exynos-acpm-pmic.o
>>  acpm-protocol-objs			+= exynos-acpm-dvfs.o
>> +acpm-protocol-objs			+= exynos-acpm-tmu.o
>>  obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+= acpm-protocol.o
>> diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.c b/drivers/firmware/samsung/exynos-acpm-tmu.c
>> new file mode 100644
>> index 000000000000..c68d60b4c0b3
>> --- /dev/null
>> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
> 
> [..]
> 
>> +static int acpm_tmu_to_linux_err(s8 fw_err)
>> +{
>> +	/*
>> +	 * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
>> +	 * capabilities. Treat zero and all positive values as success.
> 
> ACPM_TMU_INIT returns capabilities inside designated error field?

yes

> What about other messages/commands? They just return error code there?

all the other commands either return -1 for errors, regardless of the error
type, or 0 for success.
> 
>> +	 */
>> +	if (fw_err >= 0)
>> +		return 0;
>> +
>> +	if (fw_err == -1)
>> +		return -EACCES;
>> +
>> +	return -EIO;
>> +}
> 
> Could we map these return values with better granularity instead of
> returning -EIO for everything else that is not minus one?

I think we're good as we are now. The firmware returns either -1 for errors,
zero for success, or BIT(0) and BIT(1) for TMU_INIT to flag some capabilities.
I can't tell if there are other commands that return capabilities as well,
or if there are other capabilities for TMU_INIT, I don't have access to the
firmware code.

> 
> Is this error code convertation applies only to TMU protocol?

yes

Cheers,
ta
