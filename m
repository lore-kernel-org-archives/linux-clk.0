Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909DA1B977
	for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877467; cv=none; b=uOhPFBn2s+sG+KyUtJe9xPWlPKx6VwxWRJ5/GT8jVNL9M4lrCsdFhgrxUQp1E60u1WGcbFgJ3RkC4QxNznW/TmxnYjrA+JO/159ESZoAMIYq2nhaCQgC5L8bk7DbogmQZMTRzQnIH0urVuYa8KH9m0S8LgtYr+ZeFT8sgBVxhnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877467; c=relaxed/simple;
	bh=WQDlEA4GpM/nlNnUqcs2FoP4I+6UKVvP9zEfQZPdmqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nsY664TBWpyVqOgPHhbf2GbfT/lAj8qVq/Q5tMzd1T2E0B/KfTt9D9MKCBVqa/EcM6LQ6QpBbGyMT4kNZbnpyNmdLUSk9JjgrsgPQ10UVt9rSKV9Rf2W1++RvcvVwvPIPSg60glBMqfO+H3dhaAXeJGjcB1TpklEhiJcz9AKTVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rrEtfnx5; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rrEtfnx5"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d240d8baf6so29487071fa.3
        for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 08:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877463; x=1709482263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgwcmJEbHwniCv96XtudvMgmclxr5Q/8ZOend5rFD2k=;
        b=rrEtfnx5P84gk8Y2+bAaKiezuBVMHeA1qR1eODFVk09rFlWa+1tnUj8LIg1nq9fY6p
         W08uxbIiVY3EO2vliWqFKaVCsy5+CXiMO9Danwsr0Z6pJexRBl+o+OCEfW/Kgy653YDV
         c6N03gtI+NWJbN5l6Dox4YtyBIp58HDXxGNLv4kkzNki8hXcz7DkJ4KqAkKcZrxYLmpA
         r0E177smMtelB1tR0qBtY85reCXyk2rDda1YYYfLk1GfMuIlJMRJkO8Jz11VqJX+A9kp
         bYteuOkmu3I7OPo2CTrffOEX6WsNjiATke4TPhICXeEvh4DLkfR0wQRGzcQLOGtBrlb4
         1xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877463; x=1709482263;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgwcmJEbHwniCv96XtudvMgmclxr5Q/8ZOend5rFD2k=;
        b=Grkpnv+OwBqs9kPm2RABhRppwpdzQ2hNN4S0OvaRVq7CWk7bYPRQIyHq9UMucpXGK1
         urv44TyEe3l+SWIOlVeHFm0MLgKXhWVhBjBJzS21iubG2Ak3rYUN9U9UYEPiLaDpxW96
         pIdmRnf+Y0wdShgm8heNWjOuuIE73gyGbtHBp9l+rML+LP/aexnC065qjoaWhd2QfUAT
         Eezh/ugyXM/9wdQOW+VqHF+9eWdy/Viu74DcKhpVIw75oUdSqAKMAE/V7PUxEEYmmbh2
         IORiGE018rVHvnoq30AaYSkElH00eIXSwW0t8ziPdm6aeEmQQdOoHbVjhEQpCadsj/4O
         ORwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOSiLZVHnDpCNumV35nDuZyUolJhVCKamia+fD8zQCd0QtsHXJZZtJN90G3/ut9NjWlp8eI8CS8567y424Io9y8QmFWjXI6Tyv
X-Gm-Message-State: AOJu0Yyd2n294lWc2YJfBZXGNtlzHAIJBjHJF6bGU3WtrM9d4WcIFA9j
	VrXs4mdjCoAunnQOmu2y60eqhbu3ZXZnTeD9Tpk1Lpo9+ENl3W6zKbiUT7hfl/E=
X-Google-Smtp-Source: AGHT+IEZqsh/xRjheo0fvtQUFYidj/m+mltZb1/ZqWO52KipQWPGy0SOdCZKdfPwzifhxLGfnxM5nw==
X-Received: by 2002:a05:651c:38d:b0:2d2:3018:4cdf with SMTP id e13-20020a05651c038d00b002d230184cdfmr2219978ljp.23.1708877463659;
        Sun, 25 Feb 2024 08:11:03 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:11:03 -0800 (PST)
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
In-Reply-To: <20240224202053.25313-8-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-8-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 07/15] clk: samsung: Pass actual CPU clock
 registers base to CPU_CLK()
Message-Id: <170887746147.215710.9044270450868459212.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:11:01 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:45 -0600, Sam Protsenko wrote:
> The documentation for struct exynos_cpuclk says .ctrl_base field should
> contain the controller base address. There are two different problems
> with that:
> 
> 1. All Exynos clock drivers are actually passing CPU_SRC register offset
>    via CPU_CLK() macro, which in turn gets assigned to mentioned
>    .ctrl_base field. Because CPU_SRC register usually already has 0x200
>    offset from controller's base, all other register offsets in
>    clk-cpu.c (like DIVs and MUXes) are specified as offsets from CPU_SRC
>    offset, and not from controller's base. That makes things confusing
>    and inconsistent with register offsets provided in Exynos clock
>    drivers, also breaking the contract for .ctrl_base field as described
>    in struct exynos_cpuclk doc.
> 
> [...]

Applied, thanks!

[07/15] clk: samsung: Pass actual CPU clock registers base to CPU_CLK()
        https://git.kernel.org/krzk/linux/c/338f1c25269185cbea6e3dd966e5c859af2323f7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

