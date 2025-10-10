Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C582F1FE9
	for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760100412; cv=none; b=bGizM8DRlK2XRqLytLHza6CVSJV5XZijBsxBe5GKpB3CLEUqYk9o7grlwS2jYfM2ywvB0ywElJHiyV/fZMQ6+CBF3sxRA52DDHqTuqzQ3UWW+Onmd4IR79LBAp5/lMreobZgC2gUUwHThZTzIVDonXmVNq+k0GziTFuP48uPo7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760100412; c=relaxed/simple;
	bh=g3mKjgBA5eOmM+lFx4cmUAPX+2oV/GnRecyAQho2Lnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ETzlhnt5Qg+/Ax17Z/30Uq4g7wUn1gwq+E0JKnMgVbEviAjjpN5irFvF/bX/5LpcU4H52cJo8Yo7gC1pEwGW8FZbCDHiFPEYncw0uNzad2yzf2X+BMYwBcxfw2NAgDXrGJtUYDZapwkHwjYd+AYkFsg3XPq/KyZDZqdTgtH3n/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XyX41Wqy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XyX41Wqy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e48d6b95fso18887985e9.3
        for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 05:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760100408; x=1760705208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pI91YBUn0ODEJ37uAPOBfrBDVY8tx0luGRG7kO6Mtbk=;
        b=XyX41WqyW6BugaY898VZBmSIZQl4cJakg7dvkTLYDBdufG9ltARL6bwvI4VkI3VwAP
         IAJK+8olzsfwJF61pLKJ88kL/mLFzsjxWxSSWvaYMCr/5qEZ/fqvuO7wzqnh+8SUc1q0
         vDKDbbL5ZeswYGt856bA6J66S/Qu5qEJnhbixUHvjnUXmE7gf/7j/muj5BI4qdE/F67Y
         8iXS5hH7/H2tcDya966bbQ230ilJmqq9+uoLJ7ydVhIC5SqStNJi5iboEkwlcGWQBUjB
         th18Qpm+Q4qKg/SLS26KSeM2fGGCoET0zlwS8SE2z6oQh48kkdun9UGzGDNr3mxbTqmw
         j/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100408; x=1760705208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pI91YBUn0ODEJ37uAPOBfrBDVY8tx0luGRG7kO6Mtbk=;
        b=bTsBIheXvgd930tFb5/VDs11bhYL/c+RR56wdCtwIgpkdgPYyRgmZOcrlMJ/rq82Do
         u6kqs4QUe/8+hJHxrbJmUKkPpp7xhjPaLY1oXmeovdBygXsPFKWR3wK4ZJHdVYba3rtR
         8/IcLEiKt7/8T6IN5vbgED9iFdGrGzJwrufVOAmy9iAr5qBhN+qgjbnklYnV16ETdQ0K
         qbVwX0eSZvxS88YzGO7/OyrRgEOKZc66uqkYLfX57ukqTQRsCDhWH7+mqT2i0ZOMrBXB
         Athqs7pmnsIjN32Q84WvzWWyL8mJVZaP2Wm4GflFa+q87AEZNJWSxVuurkMAVqmZ4Qqi
         B59g==
X-Forwarded-Encrypted: i=1; AJvYcCVaO0E7HmAcdH2vyUE/1GfccpqvZpnDZ2JT8QZMcpvCukUf7MCCW9/53l9yUovmFUC3+Jw0yik31mM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ20QmUq3JQWd5o+N6E1Nf9lFdZlq3VgeQTQ9ZtEINW9ioKty/
	9kGIlHXHTCYYRaqp5gLt25iuzko+cE4hJuucwZK3lFz8d2rheSaOGtk5ICThC6/3Fps=
X-Gm-Gg: ASbGnct4xLT20Zi+rjPz+CXciImz25Ktyb/4wwheZdGgveahxoX3H0fu+oWuepCbRVN
	ZVKMnwg187IiAeUevB8Er9qw9pr/+NvLXI/D+qC/jTCAXWGRLp6/W4wpYSM6S50679Ylj9TQprW
	Owo9tIoEiDDpx0K0m9YNO1WVOLWKvcCW77qr0gDtoenPRt7QQ6n0HPTxz5TiHB5vrYkWOTL7utG
	uZiYC9Vk4t61XYsvq2Ultmna+wwNA4eHwr+ZmISgHILaKl65/FhZt0HEEctWl7vt3+A+CVneIn1
	/2QnlRaW0VKe7YgaAYx7GE1am7JAdixdz4+ppDGdISqPPvG4V2Myg6NBasUHhum+RL0N6vRQIL0
	l531QGI2SA13t5HjElZ79wZ0aNeMj8lQy9AQTG/fB9ypeb4H+Pqj5s3i8h3iEihJNFPXfZkgHBU
	JqgL95RHgjDR1SM1PBhqLX0Q==
X-Google-Smtp-Source: AGHT+IF4DKpiRzWSCX0rNDuTrRqKdF56LpWr4xVHOhNz6eYaEJ8Bb9XyBCJmGVJ2NHkQ9GmAaWccdA==
X-Received: by 2002:a05:600c:548d:b0:46e:49fd:5e30 with SMTP id 5b1f17b1804b1-46fa9a8f4e3mr83469915e9.6.1760100408062;
        Fri, 10 Oct 2025 05:46:48 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484d056sm46376895e9.9.2025.10.10.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:46:47 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 10 Oct 2025 12:46:35 +0000
Subject: [PATCH v6 5/6] arm64: defconfig: enable Exynos ACPM clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-acpm-clk-v6-5-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
In-Reply-To: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760100402; l=946;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=g3mKjgBA5eOmM+lFx4cmUAPX+2oV/GnRecyAQho2Lnc=;
 b=NTVzlJxWw7xyeoGeBBqzM/8gvY/1az1ZXvATM9Z29dX7t5LcuktT1BATpk+ooyP6VGq7mm4+T
 lssKF7XBzBZC5cew2mcDdiAvlteaBf9sTDx/nJY7jNJXG2Iu7gwaeJ9
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..646097e94efe7f1a18fb59d5b6dfc6268be91383 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,6 +1458,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

-- 
2.51.0.740.g6adb054d12-goog

