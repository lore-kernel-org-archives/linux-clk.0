Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDF41FE45D
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028049; cv=none; b=DX24+/BeSSl7D29dWl8RsTyyEYFMr9pDg7z+D+ZHb+zLjd9a+v14S+83zqRxnsLVmk9i8M/SdYyDFmS9g2DqlbQMVUe9XGf+3CM3QUg60gy6oOKqS1U0YHhiZWLWh/2e/7BJOuCL5vE+4PlfSwZnJh5X0/BCPwGMZqLuVj27UpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028049; c=relaxed/simple;
	bh=oXWq7ZKppyOqoUwMd00YgZ68r0g8MU/hDohRVD2+w2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhJhl/lPXZdupw7yMCD2ITvz5THSV7qn4tZ1tehE9xg+fI9tY3064jXeen1iSmX3amu1VPNoUZFEKwerJFWPBHKYtGepLV4QY+qSL6hEXB7LDc5tWSi8iFRtk0IsuxZyb07nMjnnwfwSbQEtx2QeknUCkKhUr9AafXtcftrlrug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PCtwohfE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PCtwohfE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483bd7354efso14274515e9.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 06:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772028046; x=1772632846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v83nX06CFNonzs3aaey88JZD1iHRYlh5Rsz4acoeN6I=;
        b=PCtwohfEdvCchQQCABCeY8lYDYrQzUvCap6M+pc/f5Xtd8yZ8XPRj658kB7HPnXrIg
         9l0uQfwKzEcMxwg4BKHWVjDH1x3+xNZh3LUXMjYvLR/6bE4cEFl1rUkLd1jpSTXReB19
         qmGazQrohP3AuHigkoudW4hJN48GmSKbc2Vk5ADAIzoPbMw26+KnkYJtiB/I6GyM9gnq
         JeWyJ9/Vlp+AKXr9MpcfhTnRWq1mPbkXFnDAvcpBZb1mfCzPr65HdkhO+kugQDm1rNNg
         YsVt/zqT2WC9rOPDz5TyP9IGMpGUTrpR6mGOp439w93duG/xsPpkJp+8ISrsTcFy5oKE
         CgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772028046; x=1772632846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v83nX06CFNonzs3aaey88JZD1iHRYlh5Rsz4acoeN6I=;
        b=d7PFEKldXBY0kGMqChPJmy626wShsmsfPt/X5hERe8kKzc4Q9GWnxh09A9xOF+cqlI
         v8Z7B8Rej1Wr6/trO5LNrw4kWXIP7y7uE9CqkC5cmgG/tCak4FzXulM90UJyUyRvD6lS
         18wyoKsUDIQzq1RChT7giP4+ZooHbOpQEdiBdiqJAyCJJjt86TTDFl08X0PaTVfmqv8X
         Rfa/pGjxsCTIJ9+echfeaz6Hmx23snn7NYhdo0hquBtouPQWUYvWD0bibF9J9md1/sxw
         Pvk+3ad161E7ZnnNCRC2rXfUnEzYEp+DaF/k+N9IOAi3TYt5+9CPFz4bJcPqw0nDeXI+
         bn0w==
X-Forwarded-Encrypted: i=1; AJvYcCVXhQ5AST5ny3okolBfyLykPYLFyfjM2kqJtKDUrln4AgXb4Of0C3TK6a9X/KUvuXdcrTVgLscYJWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCLE5SBXu/VJ9h9p4pRWMLEPNRwuaFJod4AbDVuH7ZxK1CNd9V
	lrHRlyMUdAGJPhFq03poRXoXOcT23RomR3G0iLVmd25Vn19+mdXvRWQdhcPUvfHMJXA=
X-Gm-Gg: ATEYQzyWCvg0HEl3A4mKNMOg2U8JJtt2zRgvVIpFvSvIPtpeBZuRxauyVoR/2qqdnUE
	lNfnJlA8mdnVZgajXZd1sFfx7djWWOUL5L8KKxld414IzCtJQs0zExca7A/K/AoTxMER5EqAfTY
	v0qW7NgTDcPEFoVtEknoi5gJlGOegYAo6MahVVVGjA7Hq4xDvU65u9v3VF8Ggyxri9kTMYy1AzT
	BLz765yQxvQCEFEhZBtwHHDQ5UwaMZsXoSuVAMKcN/+CbmUmhrGSIp4sjYTYmh9BSo2uuc4nsIc
	3NfrVZ1mWO/t2ddHQk8XF/F+tMWiliKdg8jl17w4nlAI9p0jSkpZVnJqwRuwWTupV0lS9uABuhL
	9HGB+mjiCKrvXxJP6yyvfHw8sHJj0d73Rc6Ev8Kx6YsCne2JlK2fzRfeY+U5KODFeFChKkHWGAr
	6fB3cgrQvcXr4cQ7sqqe0n1OhLUI3/Go04
X-Received: by 2002:a05:600c:3e1b:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-483c219b659mr8852985e9.19.1772028045947;
        Wed, 25 Feb 2026 06:00:45 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm35367670f8f.17.2026.02.25.06.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:00:45 -0800 (PST)
Message-ID: <279baf9e-ef05-4217-9357-94d21bd93978@linaro.org>
Date: Wed, 25 Feb 2026 16:00:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: exynos-acpm: Drop fake 'const' on handle
 pointer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
References: <20260224104203.42950-2-krzysztof.kozlowski@oss.qualcomm.com>
 <b083e950-f54a-44aa-b587-eec2cc10460b@linaro.org>
 <3e5001a6-ea3c-4304-8db3-bbe616eb4015@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <3e5001a6-ea3c-4304-8db3-bbe616eb4015@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/25/26 12:48 PM, Krzysztof Kozlowski wrote:
> On 24/02/2026 13:57, Tudor Ambarus wrote:
>> Hi Krzysztof,
>>
>> On 2/24/26 12:42 PM, Krzysztof Kozlowski wrote:
>>> All the functions operating on the 'handle' pointer are claiming it is a
>>> pointer to const thus they should not modify the handle.  In fact that's
>>> a false statement, because first thing these functions do is drop the
>>> cast to const with container_of:
>>>
>>>   struct acpm_info *acpm = handle_to_acpm_info(handle);
>>>
>>> And with such cast the handle is easily writable with simple:
>>>
>>>   acpm->handle.ops.pmic_ops.read_reg = NULL;
>>>> The code is not correct logically, either, because functions like
>>> acpm_get_by_node() and acpm_handle_put() are meant to modify the handle
>>> reference counting, thus they must modify the handle.  Modification here
>>
>> You are right that casting away const via container_of to modify the
>> parent's reference count is incorrect, so dropping the const from the
>> handle argument makes sense.
>>
>> However, to address the underlying issue of the operations being
>> writable (e.g., acpm->handle.ops.pmic_ops.read_reg = NULL), I think we
>> should also decouple the ops from the handle struct and keep them strictly
>> constant in .rodata.
>>
>> How about we apply your fix for the signatures, and I follow up with
>> (or we include) a patch to do the following:
>>
>> struct acpm_handle {
>>         const struct acpm_ops *ops; // Changed from embedded struct to pointer
>> };
>>
>> static const struct acpm_ops exynos_acpm_driver_ops = {
>>         .dvfs_ops = {
>>                 .set_rate = acpm_dvfs_set_rate,
>>                 .get_rate = acpm_dvfs_get_rate,
>>         },
>>         .pmic_ops = {
>>                 .read_reg = acpm_pmic_read_reg,
>>                 .write_reg = acpm_pmic_write_reg,
>>                 // ... other ops
>>         },
>> };
>>
>> and in probe:
>> acpm->handle.ops = &exynos_acpm_driver_ops;
>>
>> This way, the handle safely reflects the mutability of its container,
>> but our function pointers remain fully protected.
> 
> Yes, this makes sense.
> 

Will you come with a follow up patch or do you want me to ACK this and do
the follow up patch myself? Both options are fine by mine.

Thanks!
ta
