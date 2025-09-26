Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393281DDDD
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758878180; cv=none; b=rvPdqT3XoNbNmQ9OkIwAbjXurW1OGLGoallPxjp1/80pHLGy+qsCE55gEcItwLsERSqksrie/s074V2kqdsrwzDRzJxwsGXAZF5AxgPNfunlgEDweaz5tYnCT5OjZuxJeWjbNg5P/PQfxPb5i7onSxeXq5FI/A3K7ULHpIfFDhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758878180; c=relaxed/simple;
	bh=N5Nn5ASoUV/CLfe1qwCVq4qrqLwYCl62U+RpSnol/00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QRJNDwfzhuiQYY+kOtypQ5GVYTZtK3/mPjivQ408gWLRIujeFc/DxVbhRRBm4u8LFiQQks5bj9Rhq9de9pGIF0cyeByugMhc73XrShGBBWs6P7MQFEaR8m6V1GTqsi0USlCp1CZd7x6BIIqEgKAJaHf/6SSLRgS0yfjcX5SbzGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ck/i/8K2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ck/i/8K2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46cb53c5900so21035955e9.3
        for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 02:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758878177; x=1759482977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CYShG4odej5vYKThNx262uoG6FdT0LyVmxecSIMK0Uk=;
        b=Ck/i/8K2Ewnx98L+wvIm4R8/2kMTphZr33Pqa7U5ZqTRQ4T0IDNz6Nx1+SQkGJPuKe
         ypN9xR35cjX+1tx2U7nFqCxuc3UWDgvCW7IjdN5sTC4mCHT6gSH9pl1hazQMiSNDpocf
         Js7yP1qILy+YOJuh7DtZcKyoW3YGis/3RGWEWUI5pVWtNHKvIwhY2ixNOrR6GzAHmoZF
         1gJB3GulmFjLTdLuMv59DXa2jN6VkbpjiesbPBIMi30DkJo22Q0bZ5nZhd8BN/gwN6xV
         wzPAFI0nDlqYgtqVWa9BMjWhXR4/Z51hLi2dfu++tEHb9tlEpqY0TYbO2unjUtngHHGW
         LdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758878177; x=1759482977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYShG4odej5vYKThNx262uoG6FdT0LyVmxecSIMK0Uk=;
        b=Sm3v4uI/7AJRjdO4chIUHdZlrlQbloP3QDGdRUmIzFL/MHlFfCIHUGpGHlgHXzfM2m
         NT3761Ya4HlFg+suwTB16Xuv9OF7PVX9LDUzrz9tHYhBjM/8gD/bVfyMRYlKOkpvaQAV
         YQStP6sp1tvmhgrgBkE2+/SgkheHIpfIRwutOJewoAabVbAJxlpbqmwhboVaf99DqKlt
         VnJP8pDcIba6dUaXjTz+xnbExrBpRxy39a5BlOJ+jnRiHHwCl1SHkX5JkKO13Mr1D22O
         YALdD4pXn0xjAOWwR/su+GPMfURWEJiNwU1ooBI6oH5fd4V8oizP76icVCZ++xd6zb7c
         R2ew==
X-Forwarded-Encrypted: i=1; AJvYcCXKUAJVaXBTvV4j7wqI9c7zqPf6cqJ0bUGRXrLX2lhfU+4KIK+UsQ/qb5wJcL22jOjRrk4V9t31QQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsyVv+21xJ1f9nfjKQUwZtCROuu4D5F5Dmek+lPhOZMTtpK+Xi
	yM4t0PXCO3wY8LB05wT5nhiUTI6egREPnRYATBvOv4xqzTjq+moqufS5OFNI7C+GLqM=
X-Gm-Gg: ASbGncvK+OBJhjcPGjfHGq3KSZaZxVfMmm7/s1Z+tsZeuwAm9mMvpiwC53D8z17x+wI
	HouN1uiXJZyaPz3OGxz1L82BuWbHiKQ3O4XCITMeOE258xlhoLSsOauCZnjW1QeWY45DvJxZ6ca
	y6X2I/Vb3ycmB7Jh38spcnmxuShIccQ+lwGDa7Fv6qZZB6bgWLkIZQ/eiePm+ykbPMlyJLNur5q
	qIuPEJtp51sVs+5P8ii8Le6HT3P8KTYOHSQfdNGsMj81OSE5Xlx29sqiaBXAqkjZj3dv70T2TLY
	gc0VmKuqJPaPL96n8idAejbllJNirO2Rg6G2d3JCWN6MsfU66tS06zuaPNaMRDVCS/LJCW4kEav
	J5i7ccgTpu7jUuHI5KYiU2xHBEAsPRu6N
X-Google-Smtp-Source: AGHT+IHWIpWJkFH6MgSaK7Lwa2sAdlk8StsGUnX1BeyXoXscm4t51npqgFevzyhLcqPW6OMTyJKXjg==
X-Received: by 2002:a05:600c:8b33:b0:46e:1fc2:f9ba with SMTP id 5b1f17b1804b1-46e32a0d5e7mr75187965e9.25.1758878177511;
        Fri, 26 Sep 2025 02:16:17 -0700 (PDT)
Received: from [10.11.12.107] ([79.118.185.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb71esm6152127f8f.1.2025.09.26.02.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:16:17 -0700 (PDT)
Message-ID: <ec25789f-eb79-4a52-b93a-3005756cb572@linaro.org>
Date: Fri, 26 Sep 2025 10:16:15 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] clk: samsung: add Exynos ACPM clock driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
 <20250924-acpm-clk-v5-4-4cca1fadd00d@linaro.org>
 <798600a43825818bcf828da7060f38105f7f3225.camel@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <798600a43825818bcf828da7060f38105f7f3225.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/24/25 5:00 PM, André Draszik wrote:
>> +	ACPM_CLK("b0"),
> The last one should be 'bo' (bigocean), not b0.

Oh, yes! Will change it, thanks!
ta
