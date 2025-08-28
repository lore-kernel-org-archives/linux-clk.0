Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6402B1A3172
	for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 05:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756359357; cv=none; b=VMYoEAGadrSRS/axIpClxmiddRvNtdQC24TLV+GYgHtjhP4kaBJZLsxm6G0IHXKj22nIy/cPDfh/1VVTBBbdPau8+IzVL9ApQ8yXE2JSwnY58smd/Of8R4vBPalQYGyxkt+lZMMQlsDbhKh422Z0ybEtBy9oDmSBkyqN/Cudne4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756359357; c=relaxed/simple;
	bh=rcAWr9JSebwJfCokBDML03Zmc1hKN/PsbbEvit6r3QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KtDX+Heg/KV85pbLsBwBoCirbDaI2Rszzv0ajG15llUGp4UrEb6JskeukCSV68tC74JcEJQ+PRQgcsiEsqsVwjIVrryU7nfqnoIXuTdOf3erDu3lzr4M1YNk0dV+wiApZVBPNjRuVeaDIAD5BkTcbYrUe1ukptVN4oVXq10c8To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MaUYOxv3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MaUYOxv3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b49f7aaf5so2570805e9.2
        for <linux-clk@vger.kernel.org>; Wed, 27 Aug 2025 22:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756359354; x=1756964154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVN6vmL2mzYorsNRnKCEmc0gW60w1iaICM1/zHjRYZE=;
        b=MaUYOxv3AXHaqpmdWy2tM0PWw8OFhZEKF+jEJbwScyJUD7C1Zr7f7tOywNzbXlZNae
         BiIauB8V9o/NsEfcz7RDot3hTxtTBdVSQY9iSNdbWA7mNJbStfPolC21qzOJoZhq5CAW
         KvpVpyCiy4B9h1uYnDOgbtyDTzvYVpdvzVaddzvK0HmDvTcYk+GRhZKDMJ8SdEuitENj
         dE+7bR/uzRI1FmM7iue+0xixWa9corVyQaHRs3ke4s8JldQvBIljiZM9Kop0rtZ9+0Qp
         awmeRRyVPeOU6vU5m6IVFa9IW7CgXi8XdR1WgFxINBbGxD+Fmmt5UUIQb/JmV/Oulh+6
         GaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756359354; x=1756964154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVN6vmL2mzYorsNRnKCEmc0gW60w1iaICM1/zHjRYZE=;
        b=IMVeckzzD+oREqX5cAsBMgAqv2VgxaSz8QkjRILyuGnGU/Y0zzOkJooMR2EtKlO0N0
         O6JhmspLuZKlkUYKvyyZRuh1GsjtMic7e/K2+MgnYGWRh0bq7jb81jrBPCmy+7pWqjoY
         dMzr+YvudB8N/5hrIItIhpKPIaeU/UmnQ8E2IOO7Cchksog7gfLNaWvnBLDazVvLBt/O
         H2IMtxdJeVJd1a3liUEoMFOjBE0GwRP7E4qAdZXC7YvlG1CDl/sTlvka8Y1eR/YEwDGM
         jOVZY2LCvm0LVhsUBsOTtxzPqYDigYzLWZNYnysaaZBJeBH+fef5N0VJ4EhYHdUgNgV8
         Hk6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6L7otu+mDmzu7mrZ4s0A/Bydd57zPbnJqW08LB7gRIfoS+DfGk0tPyiyyQk5Nw3rLHR+Iz10vC9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAuiwJDX9F8M7f54InTsMNQPDVN5GnPiBPm/c1N6gEm4JE+ERY
	8ADuTBqgR1+URQob97YUoiApz0oV2G174tZqMB4h/al+QlapSO2eETQZ4qCGDHk001M=
X-Gm-Gg: ASbGncuK9PUA5Kh0VsOYGkjFer9EBe6zhKIjFSHHs2a4kU1sJtqULraHiPR/R6MwDAW
	bXGcY9TviUlPfNanEQvfFDMlFXSL61/5SOuy7d6bRG9iYUS3v7+gjAQezPrGui9hbVUrgrSK0T1
	nPjwD207cVgOA2GD7wNsVis19L2Z59VUDfr2y7ep4Pp0cC1H495DITf3POwJFOSJzS+z0VYSjHv
	fDsBG59EpcLu2qsXbdVQuPcZtXTIG10GxvBr086oqILGxdUJKl/Y+GTYTGDUeco9gkg67LDBfnp
	PSKVY37qj5Cpk2a1dWHeRXfnuf+Fp9tYoNQJO9P3i2emJ7Si8WNhlj6lgaUo4aeP60iYBuEJSX4
	NG/9RrLBBZaaokWp93rrX5sUgi8mqAUZZIOEJqTk=
X-Google-Smtp-Source: AGHT+IHIR++z2ZTED5bprbyTQI3HdqS+SJGiXMbzBh/T/8B21WwlVZNnxeYMt/U1HQ0RYCeCpzMWIA==
X-Received: by 2002:a05:600c:1c98:b0:459:ea5d:418b with SMTP id 5b1f17b1804b1-45b5179f3dcmr185227785e9.9.1756359353745;
        Wed, 27 Aug 2025 22:35:53 -0700 (PDT)
Received: from [192.168.0.251] ([5.12.38.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cd0acafd09sm4483005f8f.31.2025.08.27.22.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 22:35:53 -0700 (PDT)
Message-ID: <407b0663-1f54-4cc4-8012-75d61e94e6d2@linaro.org>
Date: Thu, 28 Aug 2025 06:35:51 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] clk: samsung: add Exynos ACPM clock driver
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
 <20250827-acpm-clk-v2-3-de5c86b49b64@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250827-acpm-clk-v2-3-de5c86b49b64@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/27/25 1:42 PM, Tudor Ambarus wrote:
> +config EXYNOS_ACPM_CLK
> +	tristate "Clock driver controlled via ACPM interface"
> +	depends on EXYNOS_ACPM_PROTOCOL || COMPILE_TEST

I'll need to update the depends on line to:
	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)

otherwise on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:
ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko] undefined!
