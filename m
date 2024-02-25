Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ACB1C280
	for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877478; cv=none; b=hxIxrNcGvhFAz0QI3KCglC8rL9KKSwx9F/xLDYX4sufOfyjqMcsSW0icDyW7PmpcuLFQRX4MXGlDpL8+fTMYA/mII4oETA3M/sfcVV5qwPN+4LToV4he009xhzAoahA8ocSUM8apQNtbyXOSBBLX/xNub6D3kQEfwgyCiv4hOSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877478; c=relaxed/simple;
	bh=P80jgCoJx97whY8RZv7ltxiyxidW6ExA+D1/++A5684=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CU92rntKjLfMQExU5seO/LzMP/uyZpB2bUPBXWsXMSdtZ0yme13ZYWh1ZuMQE0XvOfOTtgVHewspGLDlqHdjbMe5yF3tvCOCROoOfjZcS5mHNbelbN1weRH3JVfJlY2xsfud6FNMlxqf95vYIQMpO3Ugd6IsqNhMvq0FHptrPjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eMacf//O; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eMacf//O"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d09cf00214so37503471fa.0
        for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 08:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877472; x=1709482272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzgKojf3trYLunnGeLiGp/WQF9mJK3e1ky7A6J0BwN0=;
        b=eMacf//OK2/Z+1jPCjCNCQs240fETw+moV7bNsSpyW6U7it6+s5eEDQ7cTWPw8XTWs
         NaFADShrjMOGiJXAmeyzAjytIWN6KLe4wMZ2PdgMxjbG3GxJ2l3Jyz2l+vRws/SN1xjr
         EHcGcjTsj2+KVWDBWnhYNwUvC0f7+j6FZ5GGu6GJV3ZrcITTcUZLRzG9uy+gcd+I2FjD
         g64gurCdvbHmmZAz3sGm1EIHq1PFFlMXnIIpSRmI+SshgcFlBUVc8Agw9QKo5ttEHMhU
         SBytp+SKRQIc/ahwkunEwkraN50+u6wGXc39CsIMOlF9o7aq8r66P2NGwlCXyFchhN11
         wfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877472; x=1709482272;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzgKojf3trYLunnGeLiGp/WQF9mJK3e1ky7A6J0BwN0=;
        b=V4f//SA4Sq6welUtNv3/jTugyZ6A5jCp/wnpUeYR3rLVMDfKy1F1ZVBhGPNDHvL98+
         97tL4xnEmn17kUZ1strE1VcQXAPPCPb4LR1A7aVwvssX0P1eWz6bcXWaVjsAGd2OVJf0
         kzxSxOlrTlunJ6hIosuhsrcElqwUH6Yzmt4C4JZ0JwICec64UQokJlWjq5Phn9p50lx4
         UwbVTvKPGaSI6uenlxjlU++j0mWx/TXSZg+J7LsjE0EdkqfehOcAWUxzqqfKxF+Dsgqr
         eLwapJIeFjqXH8s+YtMLVKZ8aNHIS2xWKzOodbBxdxl1SMxeEaH0ozMxQMZR7q/BD55E
         YgvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTMFNZm9Y/Z6jCDojVi5qUdheZvAOthxnsvrSXxIYLQnD5tb6/+KfGvU/wO8cgVT7i6XnHEAH4takjo4JnK7JzdJfAxa8QWr0v
X-Gm-Message-State: AOJu0Yyal/eW0xtGFNDFAKsHi/E5mAxEsRPUMnMp2pBaHYAJOnrvC/MD
	1URxYI67iD+m1RtTWR+MZZzBQyxxcn5SDnXS1AoG7rCta0FnaNYIPPijekg9PiU=
X-Google-Smtp-Source: AGHT+IEaAI1AU10HJTP05nLv6Cuo24RSPsM278RNSVdPqNxpfxcrIfDk93zPcr82zgNkjNqS+LG+7Q==
X-Received: by 2002:a05:651c:2211:b0:2d2:8814:e3fb with SMTP id y17-20020a05651c221100b002d28814e3fbmr1056659ljq.49.1708877472590;
        Sun, 25 Feb 2024 08:11:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:11:12 -0800 (PST)
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
In-Reply-To: <20240224202053.25313-12-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-12-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 11/15] clk: samsung: Pass mask to
 wait_until_mux_stable()
Message-Id: <170887747056.215710.9176001640764201554.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:11:10 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:49 -0600, Sam Protsenko wrote:
> Make it possible to use wait_until_mux_stable() for MUX registers where
> the mask is different from MUX_MASK (e.g. in upcoming CPU clock
> implementation for Exynos850).
> 
> No functional change.
> 
> 
> [...]

Applied, thanks!

[11/15] clk: samsung: Pass mask to wait_until_mux_stable()
        https://git.kernel.org/krzk/linux/c/152cc7478677dee6a11685585fd17efbce6e9db5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

