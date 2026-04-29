Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18459381AED
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 17:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482171; cv=none; b=dYTYdsKY9QEMzd1Al8NlOJTSAB3wsbG9FJEphflrYolR3dukFjIOlyJ05HnPCGNMKrdKTjNIiYS8rHupG+tSiLYC52C8n9RINXPBppnS5Dk4JCDcs4Pp9yQ7x/wL8INVAt8EZWHMxfWVwVwKC00ytviYiF7tWGspZjY46uvuR3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482171; c=relaxed/simple;
	bh=oP0CV+puQtnqAudPjWQ6eG2kcGlvGEf4j8WHFrP4gG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YgpxMTslAKRu+EsIUdQRdKTqn3GCqO9oH4BDkKCYehA3K0nOmyudbWWNuwTgrmQxv/elP19MicU5j9O+86BzUMbEwxRkA969Q0tD8QuUPkk/Yjy0cFzmyZ7ynu+aRavVjH0y7/e/WtXBOI3MP99nGZ1lGcO8JpLGSj4b+bYIIZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M8ZDn9J8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M8ZDn9J8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0046078so115811965e9.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777482168; x=1778086968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0DSk2ikmD/TKHxP326DjLJj6TQaKaQdWjt46lW8P0oM=;
        b=M8ZDn9J8Msr3NDylCnVIxwOwQz08PjGveWyRb7/XjqkWB5UDx082NPsg34OU9g6aPJ
         TqcQJpVTaakQuUf9Y2g6yj5Isf7op9kV6MbFG6wACZofFn8TMj35e5KyPoSFl5pwuuQH
         6sBItpme8djYXD0GoY5kYPmKOhFpbKCPS4EJ17m5wVjlZBSMk+CDzN8c5Zr0jz5tJdkS
         u9taszG5vc0LCQ2EzpSe3MoyXYj0Uv4DSNEEmOVtt5oJTf1jy6mfnPWkvb/UkjmGs/D1
         NN3BAwVUlMXWaxesZAR6VG/PGwIDyqYgC2PevACW14bE7u61kuE0DbDN5FruguT3Y4Zz
         Mqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482168; x=1778086968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DSk2ikmD/TKHxP326DjLJj6TQaKaQdWjt46lW8P0oM=;
        b=a7T7fxSzBypRKik+3jQidULKfpEEmClX3NYyLOhFTTYN5oRncKPJ6wwYu4pBENzA2B
         udlCyyWdnh3ook+4AMBxopJcL9RRiOG0+LrLucFWe2PMMyv9DYZ6M0HN2mmCVMrRFLb0
         qWIMQDvSiNA3yS3FoE5lgjmy8NLCY2Sla1Hqb4i1qXocpdoF2WpcP+PAV/0Lz8QyzIjH
         zONbiJ/KLxCJLeFsWhhaE54HuFmwl7NxFm8hwJFHPhY6oUdXAxLRCyDwqQEgjORhP0Za
         GRwB6nRAIsW0wLfk90mb2gs/mC751cpyVFXPoAoiRKvjsL450sAtWJKMrylSPNsEGt3R
         XtlA==
X-Forwarded-Encrypted: i=1; AFNElJ/ghlhRDxBvkSI/uQXM4OAKP0ZHWpkFZoT+OMGe/B9ugVLOmxIXk9rwE/5rFuISQhRcOzpO8mcEs9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyIBPczi4LyaSPB2p73iqNNm4mO4yrnbCZGECkkSj3cIsNNS5Z
	l+C+ydcezMvOJ/9V+GYKD+gNMj5z63oGmqw8TG7hiHdk+BGuCy3oCqk2qlGM4dyqiuw=
X-Gm-Gg: AeBDiesdzx82NQ8gksp8gxKFgrEmhgzMmlgD1GphBqw28lNCmMP60FxkJJ64W5BeB+8
	gkHIqfZBNEoH5K2qyDzvrb1krgmAiPersdt9NFAKWeTdFxo1s3c4tZwgh1MoWxq1aKoKyuA/3p4
	p+aSOMFYTjMuHYFuJcJMjdk2+2N1W2HiiKvP6cg1LY0wtW7CuwlkmbDLpWGL0a1I7PEVRZA9E3M
	KKgzyJYA4CVHbBCkCNCS7qmfTg8rS+/q3M5R3aoZU1ZVDWVMpiuOGNKJPy5DSZRCzB7yw8o1t0C
	94gB80ocO4E32Jt4ss5I3RyfrBF/pKF8rFRBRdd+WeKPXbcItCivX2HWBBUmEGTfE+ZnZbFKe8T
	HxbaAkoH2ViVcJJliblh29viy1DdBsDYlqcnmmc6w7dlFlXYntPIe0w0tdLzgxnj0tWmJArPk1i
	8ABLcqgZpOzyrFMwPlWMIrtNvd6sLKNCEIRtL+9KyTk48=
X-Received: by 2002:a05:600c:4f0c:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-48a77ae5386mr141380935e9.5.1777482168330;
        Wed, 29 Apr 2026 10:02:48 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b3d481fdsm7255405f8f.8.2026.04.29.10.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 10:02:47 -0700 (PDT)
Message-ID: <83c64dc4-6dd8-4edb-8acf-3c731048d73d@linaro.org>
Date: Wed, 29 Apr 2026 20:02:44 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] firmware: samsung: acpm: Consolidate transfer
 initialization helper
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
 <20260423-acpm-tmu-v4-2-8b59f8548634@linaro.org>
 <a63d4dc7-b01a-4da2-ac1f-6679c9030db6@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <a63d4dc7-b01a-4da2-ac1f-6679c9030db6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/28/26 12:25 PM, Krzysztof Kozlowski wrote:
> On 23/04/2026 17:22, Tudor Ambarus wrote:
>>  	acpm_dvfs_init_get_rate_cmd(cmd, clk_id);
>> -	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>> +	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>>  
>>  	ret = acpm_do_xfer(handle, &xfer);
>>  	if (ret)
>> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
>> index 0c50993cc9a8..f032f2c69685 100644
>> --- a/drivers/firmware/samsung/exynos-acpm-pmic.c
>> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
>> @@ -58,16 +58,6 @@ static inline u32 acpm_pmic_get_bulk(u32 data, unsigned int i)
>>  	return (data >> (ACPM_PMIC_BULK_SHIFT * i)) & ACPM_PMIC_BULK_MASK;
>>  }
>>  
>> -static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
>> -			       unsigned int acpm_chan_id)
>> -{
>> -	xfer->txd = cmd;
>> -	xfer->rxd = cmd;
>> -	xfer->txcnt = cmdlen;
>> -	xfer->rxcnt = cmdlen;
>> -	xfer->acpm_chan_id = acpm_chan_id;
> 
> The code is not equivalent. RX bits were always cleared. This should be
> explained in the commit msg which would also provide a proof that you
> actually analyzed if it has any impact.
> 
Indeed, my commit message is inaccurate because I claimed the
acpm_pmic/dvfs_set_xfer() were identical.

There's no change in functionality: in the original
`acpm_pmic_set_xfer()`, the RX parameters were unconditionally assigned
(`xfer->rxd = cmd;` and `xfer->rxcnt = cmdlen;`). In this patch, all the
updated PMIC call sites now pass `true` for the `response` argument.
This ensures the unified helper takes the `if (response)` branch, which
performs those exact same assignments, preserving the original PMIC
behavior.

Will update the commit message. And revisit the other patches when
splitting the firmware patches into their own set.

Thanks,
ta
