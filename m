Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A6D2DECAA
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 06:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943362; cv=none; b=p9XICzAesVd9PFpNY5XMcacH4ekNP62VtAtetpIvLZThMcLOLMEeE3QVWjtjF+BlrSyip0es2lW7Clbl0/uOiYwsjcdcrfZJMh7X2Gt/GnP4xlwwKkLx4rGQ5KETzXi05RjePwt+Na4z6vbFJhjf73tMBSHyDj/4gVzn+RGpzTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943362; c=relaxed/simple;
	bh=IuhePpDwW9vcsRvZZXVskNe/TnkA6rORionZyn8mAx0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=diuMn5CVg7AGSML49OPXhre5GTZcWjGJq0EqziVmLbqeKPNPezgl3CCTkSK7vihPNHIyLPVh/cVQOA3c2QwyJvmh1p2qmbH7qoqE0r9T8WJhm618ScvnH+6iUEmqIuCEpHcqz+j21PpX22CDRrH7ADv4RnAH84q1Wl6QbAoR/Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zKBlNSmA; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zKBlNSmA"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b6a29291cebso8809266b.0
        for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 23:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943359; x=1761548159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Czacv4czTyoltt/AnMN+6IUHG+NujxotRkdbKUYJy0Y=;
        b=zKBlNSmAII4Ekas7fQzlbz97M24xN5Qzz+W6cv1LVd+tIuXDoTC8a6LXfZ/quMtXRf
         Gx1Ke8hBAcStlXb9dHUcDApsfQInPb1BmZP8fz/whZ3unlwnBItFdB2/ZL66EruVnZkX
         d+5dvVZ0V5U96iOQob6Ac45qpqu+ESoERYNDwwMJX9/WlL1DL0SwMyY2DlfnL3I74tIj
         KJ1fPslyPq7UlXqDYqv4mziYi82BWK1s0ysKdm1Pd6KeKRCW+lej/2kHoDHrx8j6Vgjg
         5Pr79ZdidFQBcjQvVXpF1afDLOps3YUjAOm6I/e7AL6TQzPJEDnej5Q5JB0iFomLmTee
         aodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943359; x=1761548159;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Czacv4czTyoltt/AnMN+6IUHG+NujxotRkdbKUYJy0Y=;
        b=CT6dQce0nDTp7am5o2WU6bulcB8sbBvJQlxaNCZN6mmF0PHuFggDLt2nEymIyfjxfk
         x7Ljpl8txrXfpk/EIuJ0JYhx0BO7FLqlId1b2CxW+OQ77KSblg7+xZjz62wMPAJ/gNJ4
         TpUOhHI9u+Alqr599cSPenG9SEHbgeeXJ/gieXrJAvpghCGkfhCwvbeDyxTBkKAR8DaH
         hk/mYvfXC7DBTZZF+GhxqgxfAtXJNahBnaNZU67uwrosNWoskt7JYDMwf5CpwhK6Nt1f
         gp+1FxpcsTxVhkyGOdHg0wqpA1DL/qhZY122whRh3KOlrYd8ZlG9074hFQndPHOyrQGE
         4h3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5oNS2GBMMH1o39ZEKXCbJ1Yu8PrUKWRyhPdNy65UQJ4PjKmmJH+KAWRieJ2imhaRh4acLp+KLD18=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU/6alyOLjCIji6OQNw/Bz//xoZYlizpLwotr0YPYE19cR1Byw
	CgVqTBG2tOWQ6pXh1gg3B6TJomBFjlUr3tdiYKUlkVWD9pJqo5mMDHSmZwiYPIvTPh0=
X-Gm-Gg: ASbGnctZNOm+ksXvdY3DSD4YLAqW4ppbJ9FTT8Fcyg6ZDEERTMe4x8EDiNDgIj8I61r
	xMXztIZBb6X+KPh1QdOvnkgT9M9FmSCG4bNXCLxqZxIb49S6M25INmv+X5CZi/5Lqt53hpVSeX/
	z8bNd0B2wILX6LEiTZIdJhTmQL0LRt8G7IeAZB0g5Mm8u1+d+c5banL4fRQfcr5aMRAndLo4Ere
	ME9g9zC3qzbpQ6txnbIb9Op00IyoywwCeHq1RRhwunr1yMQtBXUXIKXlDZNWvfA4g2eexwIpCzK
	Ww+5W5AK1HMIo/VWwsf50q5YnaTV43751/t5K0Sk0a51EHyTsjzcnl7pB/pa39rSITAm0ASthy6
	lyHB7Mr57oeXiJ0IdiBxqJKOSfWQkmXRzAPzYL2lK3BeaR95cAEpCfPeABxkgVxhzWevy8MgA6k
	wzgOcal725OCKgmajZ7pmzjoWIt6E=
X-Google-Smtp-Source: AGHT+IElilp8owkCzZnU/XdgVG40znc7ITwT4r+CN9LxeRdB7kJwCrsiR6HU18MteHFSt74cs5hlHw==
X-Received: by 2002:a17:906:9c83:b0:b3e:c7d5:4cb9 with SMTP id a640c23a62f3a-b647395aab0mr764832166b.5.1760943359427;
        Sun, 19 Oct 2025 23:55:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20251010-acpm-clk-v6-5-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-5-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 5/6] arm64: defconfig: enable Exynos ACPM
 clocks
Message-Id: <176094335744.18498.3151941406927244021.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:57 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 10 Oct 2025 12:46:35 +0000, Tudor Ambarus wrote:
> Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
> implement ACPM to provide support for clock configuration, PMIC
> and temperature sensors.
> 
> 

Applied, thanks!

[5/6] arm64: defconfig: enable Exynos ACPM clocks
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

