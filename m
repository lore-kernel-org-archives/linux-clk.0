Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F7521C185
	for <linux-clk@vger.kernel.org>; Fri,  7 Mar 2025 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741359851; cv=none; b=j1GogfShVE7/6tZ8cpyTF1iYZOqcTX8IGMqZDmpmNJ5ftv8aSZQJ2mXX9d0I40RQpUi8XG4DJ8knoRQ8sWxqdR/E8AdsexRFlZmYzMLYHD0tAl1MEOpiHeZdnE0PTVDGYqI2WYo0GWjSJSgfZCAObQcQVN8gUpOE8BkQoPzEzf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741359851; c=relaxed/simple;
	bh=e8ChYfB2JWMNrEuzMXT2LNRFntJeGVEoJBRw50gUiNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FDGtN2dvPJY6afk8mVDUQwDZFHySw/demPrwtKNwUQ+vbYw8+wiktTBYTQo3q/QHZemFU8WjgLZhiIE3dn1sLf6QSGT0WxNuw1kwtODTOEaGxxJBTseJDitAzh5kENUxvowZsQzOHvBrWPuCS+RAwUYqZeCq8Vfvw9VIdPvJmxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G/twAOnT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G/twAOnT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43bca8cabc8so2095205e9.2
        for <linux-clk@vger.kernel.org>; Fri, 07 Mar 2025 07:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741359848; x=1741964648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ELG0oVhA+BqzmcxJHQfLXvm4d36xTv4jodb57FoDL0=;
        b=G/twAOnTT7g4uD9xrW0acvPGkyTePwmSQhe3wVuG/IckVaOy1J0SyVWQc4/dLe1zfY
         QXV+bm2D1uIlA/iyp1Tp4BnhKrbmf4Ia64sDNlnoH4yq3hPU//BYZ3BNyzRsa4gJ4WFR
         23EswCJ+CkM1f1FcsyDnq0iZTQFc43wFdkKcQteRgV5YRuG5M+xkwX7u9dbTfn5dHk+T
         bNbX8JvLglBIfLCw27178Z/azg4GvuWGGa6ct+JO3QYpc3KFCHAck/tA/gFN6BPMQm9y
         MZNpiyiNtWnPuCPoJrWuGGFMgX3jqbl/WXTH6LJPBzj0/YCo/2dizxBuKRsuVXxfW4Ks
         CHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741359848; x=1741964648;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ELG0oVhA+BqzmcxJHQfLXvm4d36xTv4jodb57FoDL0=;
        b=JylYrBfBjN4sbcU+ycNN2FZJ5oS5N2W07LftYQX6rpIfkqx9eulMXS/TFE89SVZUeT
         Eug0upZ1x1F4D22I6wKhJ/l9E8GzfuRycL8tQiU2yt7cQ9D7VEWBpavySAOlZTzMcFQ4
         NmEHpkywqDxMAv3+UGaBYWrBnJ75aIIgwY3eJXu3IbjRPQiW3JKzcidylx5KeAIF10R5
         D1GxeCSwT3ibj0IBnnhUIyZFwkJRaoZcW69Qh+v6kmIsbYm6tXvX1yrZAOmEa/rBGWfl
         IbdAULDn7oYvaJ7RX5X0CTTU+MPRGzDBr5Co7g3vELqO4IRcNFPP4F1AGfGRARZrTn70
         a/2w==
X-Forwarded-Encrypted: i=1; AJvYcCXNZJn4SX3vCwsXV+bgNK1rpxcMrflSfVjx8K7gyhxweBftIVrxoUcj+vPb8fPHx2k6VL+mwemzP6E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5fC/KiZrHE9VsC5KIVKTvosNxCbPZ+PUu3/QiFHTuQwhd73Jc
	jbTuAzbjy+WksBKTQlsFWmxygWAx9OSi1CJtK9D6AtuLLg7I5ViEXuWVlJmkFW4=
X-Gm-Gg: ASbGncvokBZuoTjDKMp/0arV7+E2Ruf8+HxS2eC0XEnQfzD/i4UsuYls+0/Vj9WnWWk
	fZkptDUm9ZRgizh5z43C6BSJLr9AfcM7KSoI3nXZB+aXsa0/mRyR074pwMNRMJD5kgR1T3ujpEG
	SxT81MJa2O9V/HtdGOGSqDqqY/E/nHys4RSd5CUdYb6wYadc9tDEVwTF8bWpYT8iz+fHeGmp558
	3HCu44xP5eK6bHI71WrJXjF8Segcz5NQklrE+c3wjbEIwyuHzNVj/Bh19WMRBhk9wsN0gkb0Re2
	+uxaTglTLpXmVsXX5q/h7h9t93Pe8rEdV95C1hsEZ61HgcZIxaj4oy5TaiqL
X-Google-Smtp-Source: AGHT+IGeiraKGeEqa9VGhWaeeNF9N+Kf66ORaln0VM6PqpULNSWjc+LqFVea7mhvmFHlhfc4guuJvQ==
X-Received: by 2002:a5d:584b:0:b0:385:de67:229e with SMTP id ffacd0b85a97d-3913a8aeefbmr51698f8f.11.1741359847652;
        Fri, 07 Mar 2025 07:04:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfa52sm5444573f8f.21.2025.03.07.07.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 07:04:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
References: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
Subject: Re: [PATCH v2 0/2] clk: samsung: Two header cleanups
Message-Id: <174135984582.202251.7619477733984588971.b4-ty@linaro.org>
Date: Fri, 07 Mar 2025 16:04:05 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 05 Mar 2025 21:03:42 +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - mod_devicetable.h: also clk.c, clk.h, clk-exynos4.c,
>   clk-exynos5-subcmu.c, clk-exynos2200.c and clk-exynos7870.c (Tudor)
> - cleanup: clk-exynos2200.c and clk-exynos7870.c (Tudor)
> - Rb tags
> - Link to v1: https://lore.kernel.org/r/20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org
> 
> [...]

Applied, thanks!

[1/2] clk: samsung: Add missing mod_devicetable.h header
      https://git.kernel.org/krzk/linux/c/f32f5b0ec0f6eec0186de0607ab12f9cb1ecab73
[2/2] clk: samsung: Drop unused clk.h and of.h headers
      https://git.kernel.org/krzk/linux/c/017bbc922a09630579ff7b5b314fb186b8c0efcf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

