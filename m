Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0173230ACFF
	for <linux-clk@vger.kernel.org>; Mon,  8 Sep 2025 13:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336999; cv=none; b=Ye5hXtcQ5zLBOuLcGtCaUZL3QP/24OTAhyz9CnE0VNpBa9xx3jZYy1Vd4ACMbK7+TFxImJP6gam7CoaNzi7sVFK6D4D7LdG+jfGc3LJ7toxlOny423Yy6W6TdvFHs82OFhVbas/fYp9MckCIsJMG/OcARAgUyn/mPFMgwyh/HVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336999; c=relaxed/simple;
	bh=pAfvTI2eDT3Y+iAtVMV5uRX+ZV51LceKOP+H0ibBlu8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FJAqEmC11gWmJgglM9vCdk0K4TWVt60J8hKG0/ubMC2uL5x9HtIF0spgaj+xBCaRVgHNNrImuF3uaugypZZQ339hEPWFbwmaloB1J27imLOoNbCamJkVTRzEaHJ3SPLXn4jsKCoS+t3M8CE3ksCmNlmVk8GooIvH0mUN02SWgFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ts2d9DBk; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ts2d9DBk"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3e537dc30c7so2729596f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 08 Sep 2025 06:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336995; x=1757941795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pAfvTI2eDT3Y+iAtVMV5uRX+ZV51LceKOP+H0ibBlu8=;
        b=ts2d9DBkzqSdIz0teqB9nt106GFKiq/C/wCQjCJi2vZcnHlW/EZkXB+SQMnukTXpw4
         TRy4zBckKKoxcf0Bh3lj0YQkx4ZQS/eKo3Pd2+xz1Osmm8DJ7Ay7+Va38Ma2hyd7e7Lo
         oxli7edCr5oFtLEjlT14nFzTOgeafZIB5S/W1ztDdMoZz8VOzZtULZB3AwleB+mGptxH
         EpvqM9DsBkwrqeUi4oUhI+Eu51xuw50iWcdC5pIn/gJCzXFNhWXLWpH/oSc1/5dTmsba
         lrwbIdDEfZKbo74INQNqVaZGg9Vdf3prUtPx1xPTdVYOvLMul/oDMohtdLjTZ9zSkxLa
         NV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336995; x=1757941795;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAfvTI2eDT3Y+iAtVMV5uRX+ZV51LceKOP+H0ibBlu8=;
        b=hClAagIyUf3NG2E3nmvZPk86WK13FsnsNakA/DLO2Ni7ras7dGVcUpLzF11b3XJq4x
         B2ULV0qHGYbY943IEou4OMIgIhjpLbdsW08wdiM2xyz2D52kfmxVuPCIlQYF5TlxViNM
         wnZSvv+qks2zrQJ0wDwZaYYhZ6LTQQo280Fw3WGgh1XAW2iwXYJe10hqcKIexUSiCk5G
         nvg51Sor0+yjWvBAm/bY3acrTKaKreO7FAhVnTf6ypUh11Eu830xCkuoxk/J4rWTn5zX
         DrF/fWolHNwo2xSzp92mJQQlXUO+KhFJdjnifwusleCavElv6FB/pSdcmNGjzdBxAGxz
         psXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9pgCNYqkE6zabeZr4IJPIhwEi+X0c6IDpny3z9/BwsX6SfLtBILBUUJ4pWJ3VeNotWuNlkGvnmIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFICQs5uINN885NL8WGGcreki100FyK02F1Hu7AsnpndvXI54S
	vF13VZVhCc/3lmbHLB8QY8OUZF1+lYjIvaCCS4J+D3Y1IiCsdVczh/T8lDY1xpMyJ68=
X-Gm-Gg: ASbGncv5fjdiiBzJUp2nl47OW/ztnxlzlQv7DarENiHVfmU8X7ew3/EZYQ1z8BPHXgS
	Fxc1XS4BAsSWkKROmskjyiJTNdgr6vTwEKFgo+QPXX5XXpzsoIzmYYIlkyLfm0jjvMdB4nYw/gq
	MyHQxyUzztNXM4uD2h9q4yBzPxJ6kKnN3RjRh78RmGclh4sKsp5kNdVgLkdMD2xv9RLmxrHvowz
	LNqTJzcZny2UuQ7L+Wu2ArMbPwiy+ry9slQ63hWoPdrzCKpSio4n+Fad8RqODcM5cuxvsX0Qt2b
	F5hRlNx7PWqfTpwtzqisLuAiwiFGg5SPpg8yb55lIMIpCpQdFvTxGwKKUg1pE7IM27qf6m6LKe0
	I0Jul9nGw8YwuSI5JeV/o8db9OHhRcA7kbbGY8lw7sOQ=
X-Google-Smtp-Source: AGHT+IGT3YByOFHcB6lC7G62qQvZRz06xWjMoRfPXsn5WeauTpW4Im04NQNHPZ7gXpFlsp4DKnDeXg==
X-Received: by 2002:a05:6000:2184:b0:3e7:47c7:9d5 with SMTP id ffacd0b85a97d-3e747c70e12mr2636788f8f.21.1757336995072;
        Mon, 08 Sep 2025 06:09:55 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45cb687fe4esm214421405e9.23.2025.09.08.06.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 06:09:54 -0700 (PDT)
Message-ID: <34b1ca27-8cff-496b-978f-24d2fb135c26@linaro.org>
Date: Mon, 8 Sep 2025 14:09:52 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] clk: samsung: add Exynos ACPM clock driver
From: Tudor Ambarus <tudor.ambarus@linaro.org>
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
 <8eb616f2-32bc-4715-8775-b1e896cee908@linaro.org>
Content-Language: en-US
In-Reply-To: <8eb616f2-32bc-4715-8775-b1e896cee908@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/8/25 11:55 AM, Tudor Ambarus wrote:
> I'll drop the sanity checks and use hws[i] instead of hws[id] so that at
> least there's no out of array accesses in case the writer really mangles
> the clock definitions.

Having the assumption that the clock IDs start form zero, are sequential
and do not have gaps makes the inclusion of
dt-bindings/clock/google,gs101-acpm.h unnecessary, so I removed that
as well in v4. The clocks are now defined solely by name in the driver.

Wanted to emphasize why the acpm-clk driver will no longer depend on the
bindings in v4 :)
