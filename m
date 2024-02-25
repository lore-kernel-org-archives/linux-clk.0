Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06201759E
	for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 16:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877458; cv=none; b=r4V8VKebdyLpW2yAeHfn5eattOkBptnKRBAYGEsl1iQCbe8Bkg2LgmvYN2Ps0AFLPjIEkBIoBxxJIDOy5WNYz+lV/NrGEQMlLYlF/Td7l2qBveIvP8O7AkSV3VC5bLLdVhImj3xYlEmtGi6fBD3P3Q3PkfXC/a4SjMiRQtbZS5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877458; c=relaxed/simple;
	bh=TyHcB0dGMLo+vpH3FsETA6ho9nRIZUIMh3EY+giPVOs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d4LGYYunQl6NQZiFRG1+MZLrL2KWOFAHbzYGyALFjKotqoCw+JdE0bXYztG6QFaETPlC7TbaOfCa6XSjxoYf2QMn4NZnX9GaDOLQk36Q1CxXEA3YgaXdbibr3TadFGs4epT4dWRXHh+YmrmKE81dfZ+yqogyeQGLrPt/G1Tqgew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQtRTzY8; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQtRTzY8"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d208be133bso36680721fa.2
        for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 08:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877455; x=1709482255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsMTaBWSoQvKTw8PXqopEDazdmQVOYa6vIXgCYwTsVc=;
        b=ZQtRTzY8mTsPIYr84YWqHqS7EMycDuvjInlvaU+EGjyhCE6DyovHA18snZgVndwILj
         CQsaeGQZp1aEXBZLl0iXWPnwjZOYpY3LfOLA1NHpJ1Mj5OsnyQFlV0N2sNQrOU68WUs+
         vuz7bQhoW8HSTZw1cIPvQyoMnjBc6MZSbjELPRLj9tjYFGm1yJ5h4eSPigMQKInb79Tb
         b0SJr78adGNaJvbtXa7lMIX8PbB5SlhuHTbhbtuJgrbJzfIwqkDz0k7RmCEl5q52Rfkd
         uVtw064IHTocOwh5STcAaDUW3b6JX9J53/zJSwHFTRQBE/owiM4u69RNQOw8vOOuQ4Uq
         vs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877455; x=1709482255;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsMTaBWSoQvKTw8PXqopEDazdmQVOYa6vIXgCYwTsVc=;
        b=bqw/7HAneIBhgMibYa/uQsOpCqL83HGKz21kGdYtREWWwx4AsxRy4pykQfx7jpw/+0
         rvyGHVztHLUWuOMgQKDRGns1QDoPVlCrxDTfrhuTPQM4IvbQ005e8PWCQLZflAv3Rbuz
         B0jJ8bYuc4eV41bw8wbfhB0LzeESUOFiGsF2drUM3oPAo94MDEv5wC3EgE0r5tEDSXtv
         NMvr+P2S6ZJH9e2WQlKlbmqYmWyrNqH3/QdvUlpbF9Yw/yEDRecAvcvJwWARcTC+ixjv
         uoCilJ8OhH47r0Z2jMM9ka0Z2N5LPq1UURvXHdqyaoBx2FH52O8pvYtadHsH9SyGCxCf
         lpGg==
X-Forwarded-Encrypted: i=1; AJvYcCU5a313TukK3moQe/c8aaNhUltIvJeGlKtKLnaACxL50BKtAu/rBnJmVftIEDImVFhvZa25nQ6anQMK/DQ9l2WghhUUaeqdcQXx
X-Gm-Message-State: AOJu0Yzu3rgG/CMKPt2WBSQZxsCa+tqNKW6W7Lq4/kOxTaR3IR2lcOi2
	mqBhQiLQcOtdmLPknYWlW5XpuYM1cMXRfLbUDxyY49m954qS7Z0Zk5tR+Bo1Hls=
X-Google-Smtp-Source: AGHT+IEwJ32mFqsaDiozmjM7M94ym1LusN0fZdXuSF4NZ0A15Cye/UItZ7bGtwk7w9CIqCAFilxLIg==
X-Received: by 2002:a2e:8515:0:b0:2d2:215e:157c with SMTP id j21-20020a2e8515000000b002d2215e157cmr2729011lji.7.1708877454974;
        Sun, 25 Feb 2024 08:10:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:10:54 -0800 (PST)
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
In-Reply-To: <20240224202053.25313-4-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-4-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 03/15] clk: samsung: Pull struct
 exynos_cpuclk into clk-cpu.c
Message-Id: <170887745282.215710.3873782882089335493.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:10:52 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:41 -0600, Sam Protsenko wrote:
> Reduce the scope of struct exynos_cpuclk, as it's only used in clk-cpu.c
> internally. All drivers using clk-pll.h already include clk.h as well,
> so this change doesn't break anything.
> 
> No functional change.
> 
> 
> [...]

Applied, thanks!

[03/15] clk: samsung: Pull struct exynos_cpuclk into clk-cpu.c
        https://git.kernel.org/krzk/linux/c/a36bda74ede4c33dfa95482b56058f13fb64a426

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

