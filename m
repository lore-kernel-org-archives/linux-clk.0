Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC2F1BC59
	for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877469; cv=none; b=AhfhIl+fWv23t+Kzv9/P068pzTS/gyVYqZqBRzLep7LwGRn8um1jjUcs+Fya6C0qXBm7T7X1itASQQN8ddlAlaYhe9YgqPDQZxNlvK08WM77zPSAMuEcHL5YvKrTt1ram/xcidOhEZx4G0kCuOwWcDdwG6JgWdiFAt4SNboYEVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877469; c=relaxed/simple;
	bh=OImZzxRqWq0Hy8uoUc99i+uWNHocpXLxx05b2lbOmTU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ja4LPvx+PpodIfLwnTexvO5ZhHV8b+ypP58a2hngrly64m+0fPrwbPHn/G/FTSkvLwUiCCghi1WaI6cTN4bN2TBXcBiazqgWN6qteHDjnbo9FsUOSHukY7Ugx6a9APf/fW7wO92T7t0bd8FkWaqGrYetxspsHBz9nYHUq+OT39o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i9YbAza+; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i9YbAza+"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d244b28b95so24105351fa.0
        for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 08:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877466; x=1709482266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsW7anGeVardtQxgCdo5zUJ2yaqlHTpbcfofD71oKhA=;
        b=i9YbAza+B9aCz5NifqtillHHqF91M4BPTiYkBRn45hY1zTPWBOyU6y5RBobWe4SBnX
         4mDjrfKbToeTBtXO+PyD7YYxRmdFOmPKPReAjsev+i7grNmSdIk/vVMJRKhDK6I5UINV
         LLcAKbLfDtUKp26sqUjvbIlrOEg+a+wc//QfwJcOLyeCVDesQsIHOYgyVsMSHmUluYVl
         8ArkHd54ksLEHlBYmqvSOYPCaHsh4UiH3cvzo3tZo4AyNlHKFl0d/4xJf7oGyWzQmx2t
         NhX95DE1h+io3RIii72161kAWoGDN/9qU+QaBBdTCD4Z6LXQnZUpIyHn3h7ZmWL+D/Lv
         LUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877466; x=1709482266;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsW7anGeVardtQxgCdo5zUJ2yaqlHTpbcfofD71oKhA=;
        b=dZSSJwaqqZhxWELeXAwBYTQq7BN3TcrZ0/H1PKK1LAUdE3cecbMzjnw9voNIXyRy8Q
         pR2c1xrdn3FOQI+5xe1HW9k/z7DJIF2DsVpru7p1mnb0D4kxfZBHPqCOKoJsCnt5xb1A
         guHauBQwyZsrs4OYlo37WbEE067u9uB/tV+ZbIxPyefEol8F0DT6lGXLvI6HZtUQ2GWM
         pyIHZTgGbDiwQV1M1rMMNs2F+j7oE98UBuBXHLUu8L8vblpH/2ababKuxDqrlgLVByGd
         dhXg2AzfwbcXbP9sJ82sBdcD7wBn/2UGVYB9Fec5QofkojNkNj15re76/bD7PPltXJ5r
         7mGg==
X-Forwarded-Encrypted: i=1; AJvYcCVo2jkBgIQ/BpIQo5ZM3IKr4ClUfPFWHij5qBWwj3EBeL67ZHdKqx3hgV6dJ7M/l3E+PQ+gXJPoi8LDHj+aPyIWO/GqE+mm7sPB
X-Gm-Message-State: AOJu0YzkdsRF8SEowRWFbkj3Ma+J6BCyK9iE83ZisjXk4alF7IabHEYm
	TiGi4gd6OMvOmmaok9pZ3hBdffvoAjGJAtCRi0HmnQupI6UCFTsqnuTUymHwabQ=
X-Google-Smtp-Source: AGHT+IEW8O2yVnz/fwk+kMGucyrdKIQTzJkHrhcvzL/XtHdX6aAOYUcy5nGAgVP81BMsmp0W7O26sw==
X-Received: by 2002:a05:651c:124b:b0:2d2:5126:5a51 with SMTP id h11-20020a05651c124b00b002d251265a51mr2426405ljh.19.1708877466334;
        Sun, 25 Feb 2024 08:11:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:11:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240224202053.25313-9-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-9-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 08/15] clk: samsung: Pass register layout
 type explicitly to CLK_CPU()
Message-Id: <170887746389.215710.4982831598538068214.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:11:03 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:46 -0600, Sam Protsenko wrote:
> Use a dedicated enum field to explicitly specify which register layout
> should be used for the CPU clock, instead of passing it as a bit flag.
> This way it would be possible to keep the chip-specific data in some
> array, where each chip structure could be accessed by its corresponding
> layout index. It prepares clk-cpu.c for adding new chips support, which
> might have different data for different CPU clusters.
> 
> [...]

Applied, thanks!

[08/15] clk: samsung: Pass register layout type explicitly to CLK_CPU()
        https://git.kernel.org/krzk/linux/c/6d7d203ca6914e84166a00d0f0bdfda6cbce76a7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

