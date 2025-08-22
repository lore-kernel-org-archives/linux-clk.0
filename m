Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47671EF0B0
	for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755875026; cv=none; b=fo/ERdxWYeUSO9MU6j8hq3HEqG/a72FtRj4mEIrhdPdEqWyJAypTOHNUjyrGafq5bUfIRRmrr0dnuM0HMy/4g4vu+JOZ9+JsTPtORyAyS14CStg/KCVT1uGCBd5/PdnoeI0ZU28KIRyEYid4ydZEXllKwSwngMVkcmET3TxpKWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755875026; c=relaxed/simple;
	bh=cevULq5F47U5pn1UQxro5Ou3EUsPb0j9aD0QUfQ/gUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/0e0Xqi4aGZPokjGHxExEAol93R60a2JN1iaPq1j5fUoVtKk1kpWxPqQUpcDFCLgJ2E/SGYcxx9cqTIqHANLpCIsedOm3+dtlPD449SRrYvDwWRObOJHK+HJtt+uwpyogqVpv5Ty9s0nC+MECMCNsHqNPKQ7H+cG5nORJvwZIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nZHOyjjo; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZHOyjjo"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afca3e71009so501223366b.0
        for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 08:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755875023; x=1756479823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wWh8PyGxlWxe5MHSxxwSqq6RuwtxVFP35Vd46MU/svw=;
        b=nZHOyjjo2836ZM/zCSCZmCOnl2oGlnhFz000cUAeipCnpp4SovKuqPAtiAANZEJPok
         NTEBSMhDb4Z2mFQFW6XN3E1MflS0cWcom5wfeUIYsDOyMGHoA6kZt6k7bCG+IoXAr0wV
         6wZ0othq0dYvNYG500kCi7B3gC7njq+2lPaE90oSmnMH2sePsqkg5Ud9lNnA4l10pV0l
         57LRG6g+6n0a1XpKcsXThb7IK/jHciwQwTyk1MKdO1RWPaq0hCkbABJpBZURgUQ6VGGV
         7R47MQKKu6/yKU/adebHOkKyRRGDDKJOspVT0hBsAOAgNyTpYkv9b9ZfGIPS9iH+D1k5
         4efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755875023; x=1756479823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wWh8PyGxlWxe5MHSxxwSqq6RuwtxVFP35Vd46MU/svw=;
        b=WdTuMXk9/sN84XP6Wq5hxcMBud54vfguau3DL3JeRc3H10Rl7wGoRLqqV+SkGYXS2Y
         YM4t7xNpYEHbVWPTTnMNrq0EuNm7q/jVxdFiHlTAuUvhak4BH9QltPQnBjp8/xcqJphU
         3Fn0a7zAnfq/UJd5fArZuE9LzdUgqWPK5y1oXMQs/I2TFES3JssJsh4O5Kt6NVeF7vCK
         2fGCfg3m8PEtOYwiarNZQDUG1Nm9jlKsu0S5W4x2W/+9RVvIgHENF4jLhtNLQyWFgg8E
         8MqZnz76n3v7hwZQZAo0MBr6L+b6jgB8Cu9BcURCMn8mmugDEKg/PGKSMWkBhw6g4NMA
         rC5w==
X-Forwarded-Encrypted: i=1; AJvYcCUOAnhb2JA10nhCznEPKB1k1e4jD1l8xBjCZzkNG7oyoXqHL9Q+G7mSnB+B7UCYAQX3OCKPu/RpkeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyihiL+p9VLG3HshYtKHzPy55i4EMJvNfMPQkXw2bfJFg6fZreo
	nRfJDfeXZYeV6MlYWyIPXNz1wikpThy81ghMOrZ/HhxiEdrFihXXUFVJKhRD4wt2/sc=
X-Gm-Gg: ASbGncv1RUnKJgY4ErFAlW+rcjOP8Z17pFRKPutOn+QNOEY28nFZM8EtDv8tiHd8z8F
	Ix75tWGht5CHmMQfyOAyzqMmpzIB+i278dsaWnApcTPrxc/UqPF5L+UtJQIUOfOW8enZ+DQgibX
	TPIXKN7abjA+KzEnflTY94EG3kF/zC/Pp1nPmfMa+1ZXwIYQDhzYYfO6aiYkQndJweRduHsrKUI
	2WP1IELBiDAsG3vcFEfqGbJAV9975vjw4hRYllrhC5cJAs6ztUNiNNwDiM395GZspooCOB2s6Zc
	3WW+Rx73fcBaI0qR/paY1NkzJJ064MZUYIo5R8Ji+Cv6Y4CGcwxohsF+KqkUDC4olqsewFP65FB
	HC0+DAGpzQjZ3bP+RsCLGEfD1ZOkiWv1M
X-Google-Smtp-Source: AGHT+IHFLMYgpEsUwExR4khNq/wCqpieQpwMLNU5LCmqz1CCYVCENyfpLn38R54b4utgze14geVJgw==
X-Received: by 2002:a17:906:7305:b0:af9:8739:10ca with SMTP id a640c23a62f3a-afe0b497404mr587666966b.28.1755875023083;
        Fri, 22 Aug 2025 08:03:43 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.104.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded539d2esm621862866b.113.2025.08.22.08.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 08:03:42 -0700 (PDT)
Message-ID: <ebea336e-c43f-4519-b2c6-4f8812e29448@linaro.org>
Date: Fri, 22 Aug 2025 16:03:38 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: firmware: google,gs101-acpm-ipc: add
 clocks node
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-1-6bbd97474671@linaro.org>
 <20250822135521.GA3487754-robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250822135521.GA3487754-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Rob,

On 8/22/25 2:55 PM, Rob Herring wrote:
> On Tue, Aug 19, 2025 at 11:45:36AM +0000, Tudor Ambarus wrote:
>> The firmware exposes clocks that can be controlled via the ACPM
>> interface. Describe the clocks exposed by the APM firmware.
> 
> ACPM? APM is Advanced Power Management aka the predecessor to ACPI?

ACPM (Alive Clock and Power Manager) is a firmware that operates on the                                 
APM (Active Power Management) module that handles overall power management                              
activities. APM is built around a GREBE processor.

In linux we have an ACPM protocol driver that communicates with the firmware
via mailbox channels. It's similar to arm,scmi if you want.

Cheers,
ta
