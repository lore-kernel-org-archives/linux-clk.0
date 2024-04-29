Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FB386AE3
	for <linux-clk@vger.kernel.org>; Mon, 29 Apr 2024 17:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714411807; cv=none; b=F3qDI4SYnmQsOzt7JL++twhLp/ZifCQDL7Ik1EvIlIrW1XcSpIav3rDZncdBy0VJdOBfjJcqFoxEqTUKDje39t4OXhLWWS/BvAW4g6CssCiMazh8txCfVJWQY/C5/CIv5U+VgRIBYuocYUMWatczCedfGQhd89xP/fRz1qsWKls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714411807; c=relaxed/simple;
	bh=EW6kZKQhnee/+u7Uh1ONzwe60Iv1cp1olLQqZFlNuL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DrA10mQllcd42rLMYi73ImeblV2f6JsBEIGPdw38N0c4BgE8bvDp7i50CrbLEyTSjPq9dbVso7dy87eOiEN7o5DTagCS+AOsLUY5FKsBdy7/XVgrmHndDS40jKhaTJNP86F9iFgsNFQZs4gX2sIaHR+YAZ8/aBVhf7rRA5Xhx3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ehmtYhlB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ehmtYhlB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57225322312so6389794a12.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Apr 2024 10:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714411804; x=1715016604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9Zpib5Bk7poFRJsSfMceDxizPwFYK7Xs1pErXif+HQ=;
        b=ehmtYhlBGxM24yxRKq2HcQQWHEw/nAU7bLEUBLPhbJosP4uZ0o0QFIJa+aLiT8DUvc
         56Iwdw2xBOrMh9sbIir6sAYluv1le4viyOT/Loht3/G6zC2DeFUixwk7MGVc7xahoidI
         Pjr7fdt6z94YEcjop25pxFcAykKcbXojTWpB5B64M4ftGS84ol99VYwjSAioAr5u0S/l
         zuwqt7oaflaozTRMgw8wsnSzXXWuu8jGlPBhar+bQIl4QfL3mOIMZz9GeheFkWYClJHP
         IsLI8PkklXPhelf1kWr+TsPz7a7bB3vG/hgHPif9rLePZ2p1lOXX/XzZVgjXTRyvlzTr
         Gy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714411804; x=1715016604;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9Zpib5Bk7poFRJsSfMceDxizPwFYK7Xs1pErXif+HQ=;
        b=X6PWWax5XPQ19WPDTl79Rdi9OncKoWV+NK9vCh71QoPpvuoPuOhowO0TUiggZD1wUe
         UoTgXZvq26bn4OaVB/ui7KAbOEcX3Ho5NMaRXPt06r9AeH0UIpYBSaEOYE5DB8DE3Y/L
         BKf6h33eBviGMTixFNYLr6yKvIm3ESFW/uWVCRzzGLZJmqSgnkitGcCTy49WY7t4t2RO
         pJjj1qa6o8yCd9SB+jTIprySMgsot4v44ZIpPDoupyfL64ko8JvkqubaBcF2F+RO0myR
         xA+0Hn2P7wA+BlI3Z7m0lxNNuyUvDKqNO5DEwfBkqO1MR69KVseQWFGDTYGP06rH0BVo
         EKrg==
X-Forwarded-Encrypted: i=1; AJvYcCWxEIAMaryfXymx3aunsEwIrufSoQqfLSvX77xljbNy7ZWJFMwijl3q6T0c1C/fEZQ39tPal/UhwdaLo+eTkbj4JE3zeg92F9cV
X-Gm-Message-State: AOJu0YyN8DVn1qNxuLJwuOsIEtLmNgn+o6/oc3eNdEOV9bxGlek6Lkgr
	rGlTXtoFMBgtGMi8F32liR9HC3sO5qDI0R6HMwJBSn3PUsN0iYEAPICZEQsNHOw=
X-Google-Smtp-Source: AGHT+IHp2mXYqvqQkWbaVr1BnjkMifTqCDlfD53aEUSPi59G0Ej+G1+n004plXgbLnmiVGUeBSlDWA==
X-Received: by 2002:a17:906:b03:b0:a58:c5a5:2050 with SMTP id u3-20020a1709060b0300b00a58c5a52050mr7789079ejg.53.1714411804208;
        Mon, 29 Apr 2024 10:30:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906298a00b00a58ed644d6dsm2770173eje.127.2024.04.29.10.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 10:30:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240429-hsi0-gs101-v3-1-f233be0a2455@linaro.org>
References: <20240429-hsi0-gs101-v3-0-f233be0a2455@linaro.org>
 <20240429-hsi0-gs101-v3-1-f233be0a2455@linaro.org>
Subject: Re: (subset) [PATCH v3 1/3] dt-bindings: clock:
 google,gs101-clock: add HSI2 clock management unit
Message-Id: <171441180193.306855.11401796662556688423.b4-ty@linaro.org>
Date: Mon, 29 Apr 2024 19:30:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Mon, 29 Apr 2024 14:02:17 +0100, André Draszik wrote:
> Add dt schema documentation and clock IDs for the High Speed Interface
> 2 (HSI2) clock management unit. This CMU feeds high speed interfaces
> such as PCIe and UFS.
> 
> [AD: * keep CMUs in google,gs101.h sorted alphabetically
>      * resolve minor merge conflicts in google,gs101-clock.yaml
>      * s/ufs_embd/ufs    s/mmc_card/mmc
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: google,gs101-clock: add HSI2 clock management unit
      https://git.kernel.org/krzk/linux/c/01aea123b11c7ebbdd64b2df3a4a5a7ad86a460d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

