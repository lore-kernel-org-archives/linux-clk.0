Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38F722422D
	for <linux-clk@vger.kernel.org>; Mon,  8 Sep 2025 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757328921; cv=none; b=fnVKUlFPb1Fid7F4eVjg2QxSsE4fw2DHlHuq/Hf8zviFFGk28KvK8o6cuBk77PbCf2CO0IiftC7prgdeo2EToY6AsZvhORBv3ziNpyXyyd+KXrNr7snCIWX2Gjdq/3WYkk8vEE5AK4Ki2t9HqVyz56FKtq74sMBxJXUuQb4BcMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757328921; c=relaxed/simple;
	bh=zaNZRCRJ0Ys2b4J7IL/W4rFyxEh0uCxRutFrfyHwGtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZGNimku0xqhkq3IaWYacI6tcIC/mq3Ie5zE3Ym9tuVdYBMc0rUmnMZWo+YL8Mpw0Ksz8eQxPTrquO4BCGmJ6HInXDce02+Yxm/koC4OjcYdeXdUSXmB8OXCCVUFx1PFbaYfOdNZOqMnfFyL2oDxWBgzVlTw9a4MZMAPoWIXvbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S3AFd//Q; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S3AFd//Q"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso2790034a12.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Sep 2025 03:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757328918; x=1757933718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D15WYqEqCtCB7v610GJBwva3MsN/FcT88sDyZBQLmFU=;
        b=S3AFd//QyLUH6ONLkSRL6J9cOfAh5PI5ZDetDHZTHnHXYIHNBbDGtbleNMPY4KxvLj
         aWJIKG2BOcC6d0Nue/6oFzhIkFRO7kaIt2jVVdyNCvTcWkTyfsNFzocs6hEALhon9Cx4
         IgmR6rqd7Vb/tTd2MqL8bBSeMHBmxUfiKUiU0vAZN9UAjbO1gVxjLK6GLLz90eUn86Mo
         m5EYU9BEdebDQhctN1CpyIJv3y6tB8Svz1Rp7JtKJ7HxASrDG1INkCV9EkbO78OWUEXy
         fpVZP+rguypnfyNiGmxekF47YM+dNlO+CJnvqX9YmCsiYhXyGBuqV9lz9ncCvvSQGozm
         nKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757328918; x=1757933718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D15WYqEqCtCB7v610GJBwva3MsN/FcT88sDyZBQLmFU=;
        b=JVCDi1i9N3WZ4wKmnpzJIzoG9vic8EUi5W6uG0WCLKCqTwQIHYzxut1CaNsZJU/Juo
         y9i7p1ccU+YyIrEP03TVl87ww9yZNlUiFLZTSd376E+6nKDDquWhUOly1lBGOoNlkvxo
         sio96rNxw3XKZw/s6JQA4lSsNfQZCYKozUUOIQb+Vek1rUaMrsFvYWvzvDtiFfye947L
         IeumpG4x3ZAB33yJQ4ef+KzNjw0BqSaKV/8XoK41NHMFdBUHR1F1plAUrc0/CnG+D8WJ
         qlh2YjVImHLPXbApVVyjzKntVI99vyN/T5PgueQrIJabzAyMPMy8EcMCAo2c11ePHdWJ
         r+YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcVgakpwSt2gssX7/oq9JAnWZBinGFRjAgs6L70xuRgunuizJ+n6dnlZZQj0JfrGNQmhoGDGoXKUc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+0TlJ/i89z0b4wwtPn/Q1KtdhQ+1UefLEqQcRKroly6QzP13c
	5Giru5IniG0P0pbeYQdDT4olh73RZLU8hOLoPvemVspJBvrJ9ep1VhQDpDgHZHlESRc=
X-Gm-Gg: ASbGncsKkRCDwSxqXm9aYXJgTDAK1SxK3JIRWU7S6aIgmyGhoCbd9Yc5R9Gj0+bBAZN
	DhY2JFZCm/7FoE13pprHm9besBMYL7/siiES/GuoDJo6ZyrEyZ2MuaZBC+8vgg73GFFzGkEyoA+
	cWm50NqFI5FgkYLZdAz01oXpxcwkwRrQGXkxlurk043qEMWRX/aTVvFs5EisSUM3grs0E+2g6ct
	rn/cp9BzdkjPLDGQ384qx7hT9iseIYutXNqyp+OZEmly4yBjSlXbPuqh1hTK+B0Wcw/70B46FWp
	y9WzZLC5AXPhVg/RGbVzyrQIVDbbTW++5G7VNkRyD2W43LFd+KxssAHQdwWn8hoPZO97oO7nXMg
	4l0soFGY34m91nm3uReo/77JdrxogyEtQ
X-Google-Smtp-Source: AGHT+IH10y9VESvsaHZG3UuRMxdkRiSrai95h1SgmUQXtpdxF6A/nnAVrY3x0CbvcZ5YJbcxhlzjXA==
X-Received: by 2002:a05:6402:278d:b0:627:d1af:8c66 with SMTP id 4fb4d7f45d1cf-627d1af8dccmr3858818a12.5.1757328917870;
        Mon, 08 Sep 2025 03:55:17 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-626c8d8693esm3539727a12.48.2025.09.08.03.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 03:55:17 -0700 (PDT)
Message-ID: <8eb616f2-32bc-4715-8775-b1e896cee908@linaro.org>
Date: Mon, 8 Sep 2025 11:55:15 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] clk: samsung: add Exynos ACPM clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
 <20250903-acpm-clk-v3-3-65ecd42d88c7@linaro.org>
 <eafb409d-5b5f-4791-939a-5a3c1eb00b9b@kernel.org>
 <91407377-f586-4fd2-b8e4-d1fd54c1a52a@linaro.org>
 <32a28a8c-2429-4d61-88f0-b7e3e866f85e@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <32a28a8c-2429-4d61-88f0-b7e3e866f85e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/8/25 8:45 AM, Krzysztof Kozlowski wrote:
> On 08/09/2025 09:39, Tudor Ambarus wrote:
>>>> +
>>>> +	aclks = devm_kcalloc(dev, count, sizeof(*aclks), GFP_KERNEL);
>>>> +	if (!aclks)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	for (i = 0; i < count; i++) {
>>>> +		const struct acpm_clk_variant *variant = &drv_data->clks[i];
>>>> +		unsigned int id = variant->id;
>>>> +		struct acpm_clk *aclk;
>>>> +
>>>> +		if (id >= count)
>>>
>>> This is not possible. You control the IDs build time, so this must be
>>> either build time check or no check. I vote for no check, because I
>>
>> using BUILD_BUG_ON_MSG? that would work, see below the why.
>>
>>> don't think the ID is anyhow related to number of clocks. What if (not
>>> recommended but what if) the IDs have a gap and next ID is 1000. I see
>>> your code using ID:
>>>
>>>
>>>> +			return dev_err_probe(dev, -EINVAL,
>>>> +					     "Invalid ACPM clock ID.\n");
>>>> +
>>>> +		aclk = &aclks[id];
>>>> +		aclk->id = id;
>>>> +		aclk->handle = acpm_handle;
>>>> +		aclk->mbox_chan_id = mbox_chan_id;
>>>> +
>>>> +		hws[id] = &aclk->hw;
>>>
>>> ^^^ here, but why do you need it? Why it cannot be hws[i]?
>>
>> so that it works correctly with of_clk_hw_onecell_get() in case the clocks
> 
> Ah true, hws[] has to be indexed by ID.
> 
>> IDs are not starting from 0 or are reordered when defined. For example let's
>> consider clock ID 1 is wrongly defined at index 0 in the array. When someone
>> references clock ID 1 in the device tree, and we use of_clk_hw_onecell_get,
>> it would get the clock defined at index 1.
>>
>> In my case the clocks start from index 0 and they are defined in ascending
>> order with no gaps, so the check is gratuitously made. I wanted to have some
>> sanity check. Do you still think I shall remove the check and use hws[i]?
> 
> 
> Look at some users of of_clk_hw_onecell_get() - they all don't care
> about this and do:
> 
> 441         for (idx = 0; idx < count; idx++) {
> 442                 struct scmi_clk *sclk = &sclks[idx];
> 
> without any checks.

I saw, it felt a bit rugged at first when reading it, but not so more now,
see below why.

> 
> I just do not see why runtime check is necessary. This is purely build
> time relation and either we do not care, because the code should be
> synced between one and other place, or (if you care) then it must be
> build time check.
> 

I tried the following:
+/*
+ * Use a static assertion to check that the clock IDs are sequential
+ * and do not have gaps. This check is performed at compile-time.
+ */
+static void acpm_clk_build_check(void)
+{
+       BUILD_BUG_ON_MSG(gs101_acpm_clks[ARRAY_SIZE(gs101_acpm_clks) - 1].id !=
+                        (ARRAY_SIZE(gs101_acpm_clks) - 1),
+                        "ACPM clock IDs are not sequential or have gaps.");
+}

and then in probe() called it. It works in a few cases, but it leaves the
possibility open for the intermediate clocks to have unrestricted values,
even if last-clk-id == nr-clks - 1;

So to be comprehensive I'd have to combine a build time check with a run-time
check. Which feels like over engineering. The assumptions scmi and other do
don't look that bad now :).

I'll drop the sanity checks and use hws[i] instead of hws[id] so that at
least there's no out of array accesses in case the writer really mangles
the clock definitions.

Thanks,
ta
