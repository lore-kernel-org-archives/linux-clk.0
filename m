Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BCF216E28
	for <linux-clk@vger.kernel.org>; Mon, 17 Feb 2025 10:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787543; cv=none; b=g4WGU1RpounSFjpKg8dGbw4/PiK630TnFfByNiq9HL4GeSMekM1g8QX3a+G7ZRslp/46StXzq9moNX3ctqlWlZUJg8I9u2FRHplvmo0DPmpCtF/femI7OSGgJ21siF8Uax6JmoI8NEoDx5iGzUfpFYAhWzLLC+Ypmrwqhoh6lHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787543; c=relaxed/simple;
	bh=6aGtaVpBLW3kX82mTVYH8G/6ueq7kvdSb7JTLpAZZLc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LcEL3ayET0svL1H8rRn2s/BMnNxUjnH/Zzq7oYbVUbOx3QE0XcFq5jYjOLr4ymj+5E4U6uZL3a1xZbjPHdiGJVvxNA2tjRNnsGfraO/L12qbT4iJM61n0KKv0MNwy/SU5YSzTpyVjobREVITExic6luuw+ipDbt+oiAaxwIqv90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bgbWDzl0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bgbWDzl0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4397dff185fso9299355e9.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Feb 2025 02:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787540; x=1740392340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I16xu1ecVLtS/758jqaD8vtXmxaLQ5I+Y1leyu/ANx0=;
        b=bgbWDzl0YMN13FktJuVGVCN4x1e4OQk4q605e0tnV+NHr8DMp8x3r8EP++thgdcgz/
         biCxqVMH4kggn9jnMbmtA4EgMyAgMLJ60VmfB0qF3zH+VxqP7sjZDu3P3HuYorNJw4TN
         9wkwEi/C380Kt33h1fvFWQIgckv9U5TiHwae8k0AKjoQvypnI8GNcGpXFy3FpcHs50n9
         NoEQAYZRvC1vr1iiIOPCC8DLI4HHTmZLxXY+9KlDzw0zgbgiCVrj3pSg8kwTBIy8nd5S
         wQ6LoPpxy0ueRrbBGFKnS/N4z7szEmtcHRo4M7yEmohz5/M2an3sTJdWoPLHh4Wr7Twh
         IzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787540; x=1740392340;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I16xu1ecVLtS/758jqaD8vtXmxaLQ5I+Y1leyu/ANx0=;
        b=DyC0xqjoSxZr6NyQdyR8zJlEb5CoINGFxzwwaEi9iL5u7ixCyq5/cYtFTxxnBhHWn1
         /Ung2LoioiO1/qBqlbpghd7TI+dUHWu+XCxyr/SNQCWRfuTux6wQOrqId017kGSW6VJL
         Nb/QrdeBvHnlNInyTek/U3i57+kbW37yJmOaRp3/V7puS+8aCoiVHHGfjVUso7koV6TH
         QjA4OlPH7qWNiJ72ij/NKbpW81QQ8qG7aHH534lKWNUGLvKcw+M0z0ORUeiNBfrrl4fW
         pmq2Hpxs55QiD+UaDwUeCfKmQU96xfbwRt7d0fDxHjq0gOvOoIDxwh/G0H+nxSE9c4e8
         qo7w==
X-Forwarded-Encrypted: i=1; AJvYcCVpOtOt0yG/T12fvEBCpdyIfITDmJO/9pK3QiTyV3hqIM4TbhS+wZwzzePyjHiMyU9fPX2AGpw7yg0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj2HsYXUgJAOf6K3LbMMsqsDrg5PmqLza3vCBa8WpxgofHBjjz
	mshp/FbJkFh/TwI0ouDwMxxSQ5IiFWBe/hRxUtKuu5NOUVY05AvsyObJOD+RVMc=
X-Gm-Gg: ASbGncsf/DaLxRvSX8Gxvfx+dthWXPuU90GJ6a2BqcxU3QEbFOE/KzyBRxbkVAT2xEL
	oz4/N2zs2goJaIEch3uOHtzOz/3KH/xdQplBDmMKjTeMmj0X41oNB3bEg3Z1LNjaAPrtrZxofGh
	ganNla3mViIiFvXyTPcS7YGi0kAUcY6vOfUC7PL+NvDJC/1naiHsyFAFC7tIqpSfAQHkf2hmfr8
	1BpiO4eVW03QefeZS15mmMtonmsP9k3V8Apc/b/mJeCSSFMOYXLnGevroikugIExojDJI3KHrCM
	YG2N5PBhjVOyMPv+ZyLLj0Fh4S9PzC3xAQ==
X-Google-Smtp-Source: AGHT+IHCqlAmBeWIh3RQpDK/wqa/aOOAMFIkBi6CvjLI3mDlej3LMKvDj2NLspjgKzRYrxIEx1isLQ==
X-Received: by 2002:a05:600c:3b0f:b0:439:8c6d:7ad9 with SMTP id 5b1f17b1804b1-4398c6d7da4mr9647825e9.31.1739787540052;
        Mon, 17 Feb 2025 02:19:00 -0800 (PST)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43970c8fed9sm35658385e9.0.2025.02.17.02.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:18:59 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 Daniil Titov <daniilt971@gmail.com>, Dang Huynh <danct12@riseup.net>
In-Reply-To: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
Subject: Re: (subset) [PATCH 00/10] Initial support of MSM8937 and Xiaomi
 Redmi 3S
Message-Id: <173978753882.27418.10124969396742370731.b4-ty@linaro.org>
Date: Mon, 17 Feb 2025 10:18:58 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2


On Tue, 11 Feb 2025 23:37:44 +0100, Barnabás Czémán wrote:
> This patch series add initial support for MSM8937 SoC
> and Xiaomi Redmi 3S (land).
> 
> The series is extending the MSM8917 gcc and pinctrl drivers
> because they are sibling SoCs.
> MSM8937 have 4 more A53 cores and have one more dsi port then
> MSM8917.
> It implements little-big architecture and uses Adreno 505.
> 
> [...]

Applied, thanks!

[06/10] dt-bindings: nvmem: Add compatible for MS8937
        commit: 07d914dd683f9ccb62a530fad76c36d5d4e6d894

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

