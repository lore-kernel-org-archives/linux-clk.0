Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64DE2727FA
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767979650; cv=none; b=Y80VlnIO0D62YAtPYRwxtWZ7mkNM9hKSFJLGWaAwCCAh7NLft2eORndkHvUK/sY5XaDpL2cHyNkq9QM8EXQ358O86MTxdiTimOuEu+eheFwnPnEmzilfsSD6Z3ahwyKdww5JlfEnUXoRIh9zqxkPkAgUJqkVF3iRXw8TWMBes6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767979650; c=relaxed/simple;
	bh=dQ8+G6khD/ZNM/TecrfQYmpPhVS7xGpvJdnnEly+U8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lepCgDK9lxiwplAZUv3T3bxVMhvVXW3CgZ3V01lU5xt4Pkay5pFMFnPh7jO1kXcOQZEbWW4XuYEqfvWdAw/4qiZBsxboCtg8OIvRsvE5YfHGmiF5XwB4s+5zwNvhl53v/9Uj7bXGzMsIbPmxYE03FQ32V+/UR7ZY18978bg9ypI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hSO1yL7N; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSO1yL7N"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-650854c473fso3061859a12.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 09:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767979647; x=1768584447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qMbxn84Jl9TQP5MwrwezHAHZlMSRbojtKzpjXnqIQo=;
        b=hSO1yL7Nf9RoKn2z/cuinwJOnV35+F3gsMW3zDMhU8fjZ0PVehbAxxbIv0ugVemY8+
         GGCFmdry9eKC4bfxCc2qeJk2b/uZtkYkT8wBttF8KCOiZEoizEhZThu5luFeiu4HOVuM
         JoEg1EfDLHuWvULPBDW5gOmR6R2qvbLE+pJBWlC6frVOmqyAdwAQ0NPeRVIOD6piaCiB
         rqp3jd14cFWyT//QrzeBk+bXM23KaQVT2MmD9A0Khflq4BfW6CcKWpjN1cHY8GuZdWfl
         xWbREMw6dH9QwNzOUozuj9AkuCg2VoMGnlUrQbk24pUVExjqBDLOieuKossMx87FqLlx
         XCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767979647; x=1768584447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1qMbxn84Jl9TQP5MwrwezHAHZlMSRbojtKzpjXnqIQo=;
        b=Q+mP59t0cBAqMYCu+4T3Qa3IsxIDVuV4PS0RQfdsoYe5X60AK3oDaaN15+FYVY7J6X
         xdXkiwYTXDJXs9O8qZ3gUZupp8bMw8Ta89mLSnaf/FXLetalgQYydg0HjOUFdfJcnj1x
         7JhHmrHMwcyu5tRTEA7uVFRwRWd7TdRr6IGzEWh0dC+ZsvEMajCVIbTGj/ytBgyo3aho
         4YOO6Rl4tG/txEq5R2YjDqnQm1CeWrz48NC/3e07tm4jC1llPJOd/4fM/4vRsfPBD41k
         6TNlAj4pdOcqMZ7O/XqK/qrfYjPzQeDGjRj3x9M/OOYbAKDiCDRg8n/p4CG/Yw+sT5M3
         jh8g==
X-Forwarded-Encrypted: i=1; AJvYcCXZCmyMiDgk2bQwaa0AqMhx7nFt6BfrMb0Z1FZPGbMpHyqYcdE9BG0LTJXWFHj+3BIP4gAj/L+4xPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YztLiYl37wTdM1myTOOebQxS6gW/mfwJ3cnAtDQkznacbDi1F2q
	1l18NWyN1kYjqkhHbrrZbXRQ8prSmxhPvzKvIG0hoAJLkdbC6++oK7FzdtAInX892U0=
X-Gm-Gg: AY/fxX6xdnc7abERW6qCmVCQlm9Hvbu69tNXy/iR7CGX1NfW2bA7CyD4WsVjEoIIXvK
	TN+xQ1tqN5+e0zfX6Kdpfdtc1egUqhqmHCO6Kn0pzPJlUNKXsrOq6jHVIPgisFcolSgUpQkNSjo
	rvCGegdZ7MgZJqvgVDorchmsnv/9faDISGzn1Ravvc5JlhvLMJaFjhUDFUDafxRUZz7b5y+k6qz
	S8yAriAEBGrYCJ3VoACXWYp5rtBjR83NlwDzJevYr7A86eq1Cx297my3vGaa28zyS/zV3J510ah
	ZTJCm0LBvfxbseoIxwIbOfoLmUQQB7C2fE1hUuToc3wDxqCN6vVFihBs+PmQphQ40YGW6hFlPUa
	JQtAFVt8a/QOgx8czVlD4OEo9w0rcWmEl97cZDUBgIV6M67TsUQuVdACpSuAYEeroZyjVnjMnma
	GlFvmQuX44bI5iK+00PO/tO29vWvdPZAzeKyRLtX6N7EW7L8SHdbUzqI/RAY+cHYA7KurtDfS7Y
	s2kag==
X-Google-Smtp-Source: AGHT+IEQFDUoZhgENEiVUAoo2+KHd3ui6TPKSJqlq7mleu8Y7U5CJuhztcig0ROQZrAkDu29qDQM0g==
X-Received: by 2002:a05:6402:294:b0:644:fc07:2d08 with SMTP id 4fb4d7f45d1cf-6507bc3d3c6mr10607406a12.2.1767979647276;
        Fri, 09 Jan 2026 09:27:27 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be651a4sm10642182a12.16.2026.01.09.09.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:27:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 09 Jan 2026 17:27:23 +0000
Subject: [PATCH 1/3] clk: samsung: avoid warning message on legacy Exynos
 (auto clock gating)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260109-clk-samsung-autoclk-updates-v1-1-2394dcf242a9@linaro.org>
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.2

We currently print a warning message that the IO memory size is not
compatible with automatic clock gating for many Exynos-based boards,
including legacy ones, even if not requested to enable automatic clock
gating in the first place.

Change the test in question to avoid that warning.

Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mode for CMUs")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/8b2c412d-3e1e-4be0-a9d5-ef67f6f0d409@samsung.com/
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 06ea5deef4ee2ffb87dcd14102561886ea80b7bc..417ec1786b5e77e17dda4022b417c1c6b79c59ab 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -462,7 +462,7 @@ void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
 					const struct samsung_cmu_info *cmu,
 					struct device_node *np)
 {
-	if (samsung_is_auto_capable(np) && cmu->auto_clock_gate)
+	if (cmu->auto_clock_gate && samsung_is_auto_capable(np))
 		ctx->auto_clock_gate = cmu->auto_clock_gate;
 
 	ctx->gate_dbg_offset = cmu->gate_dbg_offset;

-- 
2.52.0.457.g6b5491de43-goog

