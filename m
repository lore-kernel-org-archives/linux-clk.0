Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA69A269D18
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 12:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756123289; cv=none; b=OXoKNM5Gf8RL6fq8FOpqa+udip+FH/sr1+cm/+CcsJA0QL/w5DZ9c1+zyhZus8Mv9gkfJ87YmJA9AdsNWLUXdW3rwYNtZ5pyEJYnPrgkgD/rJwhCbkQK/hrCR9uUHUQdSCcAibee7OtYCZUbpkH1ahuzp6w3xMSF+j2kXBajRKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756123289; c=relaxed/simple;
	bh=RFnXtMO9EySymNwVyAhdrrY0RQvFJ6yjd44teuvucr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eP9ptryntmhAtRjWpOU/mfIF/4VYmnxQ1Xy+vRmWKM9DvYKv/4wy391TDkpFrZzdEux9qIXscscPny7ogwBgyx+I4BnoiE/v/f6uMUlMDYT9YkMxsWuiTJr4Qpy5Ts0rTm+OwvRzJfMnPHhFt6d2LdHi/9ggSSHvU+5pvVyCbFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YRtzrO/j; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YRtzrO/j"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b0bd237so33034435e9.2
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 05:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756123286; x=1756728086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rRcckAhyKKIfk/Fgtz+kopwNbFInJmosFYKCEYbjFWg=;
        b=YRtzrO/jDKlz3r0pEj/sMPXB4DkzBkCQUs4Hmwo6OqzT8RueL3ftkhhQZpFlICsVrB
         sFXHrKq42Bo7RD5vsmWC8AToIzNUd0rk3lN8NrlFcc2ng0RRC6PudrifMGzEGg1YR5Qj
         6awUXTqk5M2lTDF7MvowAAJeXkf2kMw1r8fMCdBY/NP5Rq4UiecJUmVJhjDdI4P+fv7I
         5Pg22tUzVkRdjncv2ypuCHcVcJLc2FUnt9xFUbKu38jK5FocEHxuItIM/NlNrLIIs6nt
         FDuLHa6mgyUqTSTMw1sQTTzXxRgINKXkBN2wXUeJnQUScZzxFOVvhcgk/IxGg4xphdgb
         AmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756123286; x=1756728086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRcckAhyKKIfk/Fgtz+kopwNbFInJmosFYKCEYbjFWg=;
        b=BPovStt24xMYJWMFCXl/Nk3KsGKJC/yzImSvib+reFujM3PWBPPam+xVGBepTh5kXd
         0r5GucJqFmYZIBMHDCGmVVQ7d8gY/4MkFU2IPQOPWATML1KpXTHBO6WRX+O2uazfn3Pp
         Blvol+sKcWcvjaNodKWqQM7ZEOL/siSd2lDzXGbrm0GUHTuTemf/NYyYFR8UQbl88VEO
         x59AIljJT1Ae8iEasouIuLTHWC/AuPS3bT3Fs8CJ87qws2uEpwUhWh3Ne6D4c9p6I+a1
         3Zuq0Ny9ScdDOEU1o7GDCsXP7ymIBFtaKbw4b8HJzp72vpU3mBGr3DqpRJ6YgcIpz4K8
         IL5A==
X-Forwarded-Encrypted: i=1; AJvYcCUjJuBZwOREPDV1UDjMla+TPhq1/NhXsMUpkH3SGUwBrnsH/KLfphE4BivsO8PCkzTCbow63ymQsR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56E+ZTCWyTM6v/eAUzZ30Y+sPbeKvdYT5e1vvxldxivJ5KIeh
	yS2fa4BThFusw+YenXQ3th5giYtFUFR1wVhtXUt9kX/+ZRpddVNpb6jpIc1gQWjOzFU=
X-Gm-Gg: ASbGncuZmoFJKhvhsBIbygyH0pcz/1N37EP1/htGq9ZkCpnB4dXQ+WGP5FBQwV8051C
	exBhQXu55VI8TWzMWcw390VySwXsKoZxqEJq1DBpm845MHyezEGeMQgzpyckKDDjiuOMiN1LKaM
	hha/aQWInR7BwqCsyHggJDvzBKHewgSYJCYto7fnAXTbd7O+7DRiS+eU3L+tKVeNCNjqFNf+u/1
	YIp/zqfV6Z4Tnhq6dAHoYSyzx1GfxbaJ3hR8M2LikEBRGzBP0+PFBmAbhQxrDPn4ErP3rpjLEwB
	eiSm33JzLVxjmMduP8dRpSwAtmSlXVIpBB38gLp3xekjxv62/k3PBFHM3IlXdj29BDDpWP0Jl0U
	ztKQkHEPQn6SV4dcCQSUqTfNkYa1XggU=
X-Google-Smtp-Source: AGHT+IH62AfWArXNyegFI8zsNyQcP9qoQacs5w+PUV6JSw51oEdiaFXWL4IPdH3vJ0s3i8QgSe1+bQ==
X-Received: by 2002:a05:600c:3590:b0:459:a1c7:99ad with SMTP id 5b1f17b1804b1-45b6133ff14mr19383645e9.22.1756123286249;
        Mon, 25 Aug 2025 05:01:26 -0700 (PDT)
Received: from [192.168.0.251] ([82.76.204.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6300da81sm19978265e9.23.2025.08.25.05.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:01:25 -0700 (PDT)
Message-ID: <eb2416c2-ee1a-4770-803d-1d890e4ce238@linaro.org>
Date: Mon, 25 Aug 2025 13:01:23 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: firmware: google,gs101-acpm-ipc: add
 clocks node
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-1-6bbd97474671@linaro.org>
 <20250822135521.GA3487754-robh@kernel.org>
 <ebea336e-c43f-4519-b2c6-4f8812e29448@linaro.org>
 <b7bfe424-2cfd-4897-ab0d-69c8e92acf24@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <b7bfe424-2cfd-4897-ab0d-69c8e92acf24@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/24/25 6:00 PM, Krzysztof Kozlowski wrote:
> On 22/08/2025 17:03, Tudor Ambarus wrote:
>> Hi, Rob,
>>
>> On 8/22/25 2:55 PM, Rob Herring wrote:
>>> On Tue, Aug 19, 2025 at 11:45:36AM +0000, Tudor Ambarus wrote:
>>>> The firmware exposes clocks that can be controlled via the ACPM
>>>> interface. Describe the clocks exposed by the APM firmware.
>>>
>>> ACPM? APM is Advanced Power Management aka the predecessor to ACPI?
>>
>> ACPM (Alive Clock and Power Manager) is a firmware that operates on the     
> 
> Please unwrap the acronym in one place of bindings commit msgs.

Okay.

> 
>> APM (Active Power Management) module that handles overall power management                              
>> activities. APM is built around a GREBE processor.
>>
>> In linux we have an ACPM protocol driver that communicates with the firmware
>> via mailbox channels. It's similar to arm,scmi if you want.
> 
> Rest of Rob's comment seems valid, so this also invalidates the DTS.
> 

I assume Rob and you are suggesting to drop the child node and add 
#clock-cells to the parent. Then define the specific clock data in
the parent and create a platform device by hand for the clocks with
platform_device_register_data().

I think this works well as what's used in the kernel is just the
clock mailbox channel id, clock IDs and clock names. And these
can be defined with parent's compatible data.

Please correct me if I understood it wrong. Cheers,
ta
