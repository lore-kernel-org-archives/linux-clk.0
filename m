Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF0E5C5E0
	for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 09:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003705; cv=none; b=iCUs0xdFLaZ7IPSDTPwUYl6hkvNgN8E7ke7OfITp0vI67rT+qQZcA9lI5TxX6kQqsLYOIRFtEc3d5PaUHUzHiIKZt2Kcp5qlIVXdiMwArTD79L0ORaocFi1GBxwVtvRIDL4cKvGOMsPkNrpZ0p7Xh0k7lu4GsEvBkFsDNYSRJOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003705; c=relaxed/simple;
	bh=LDx4x+PbphlW2IlWmkbie/u9O6xlW/ljOSnG6So+pg8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e0JvVd53cn0D8uC6rRDdjqjSVMbwUEiHRrSm/Zx1cLHuvmQXb2bVXHg5atEp2yx1YbzfHp/+9qxBBibPQESUwy7Jnyq0Okr+DdN7eRPX62w4nYMZYn1QxGs6asuKNZJFCPvMJ7lmZbk+4/7SC0sQqtUi30Xw8qYNnVPTo1B88Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W+isd+PV; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W+isd+PV"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3367a304091so4476687f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 01:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706003702; x=1706608502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vp9Qkxpyl0SLEsF0UAyLTjA2Ib2sT1Vds4gNvwsTHtA=;
        b=W+isd+PVkpKZAZlJa/La6hQJ7aq4WeQScSZoiD1yvp3/b0RelDkyDhprN99bfNXMKE
         G4swfqKBPYvUnBZb5bOX7sg+AypvpQKYMAmLb5Xsej2gIYd415XKIAVHiyiR6d/3omrB
         8bwlwOKK5fJJ40w/AEcIAAMJ3EBQz8Al8mfQdNdyiEnssyOueMrrtVUEzoFwaAPEhl2B
         Dq5jP81DbALgm/+LboaqOE7mlA7OG0x8Xngj/qEcc3kd+S31Zv4LKSFVeo3WFBojHVjV
         ME23vCcgPF1T4Vmqg2wfALxPxbTcPZRo26IKnw8fidmUWIeBVdiwGl5hYmNNGmxLi5Jd
         Hu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706003702; x=1706608502;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vp9Qkxpyl0SLEsF0UAyLTjA2Ib2sT1Vds4gNvwsTHtA=;
        b=D2QH3WGgNTPGwIMfaAjsVk64z7+uky75KNRd4Dp7EvNyXkqyMP+KhlceH3YhdvzUVA
         k3is0mzQDC/w6AsWZ7ZXh1rZTJwPs7qosT5YGNDl5ii1A8c8p5jOn1LPhFoG4/01BG8i
         4noIhyWla5qHTrpCJK9Im499gQHdLMnrRtonMF/LadIeh6bnKsUI7Si/d7pEwghMNJq+
         Y4qGCqYX6erCfgeeZpfud0CCRiLetDRT/YP1UtS/iZ8k1aw2p6qBxOAoYp9KNFCQv5Of
         kEBS1ngDcY2tVZrxz2HR+jI9G7s/+2mkkUbM4E1RDLtXafFwuQniWchBZFoaSUTDhCYq
         mUGg==
X-Gm-Message-State: AOJu0Ywuz0QPiQ3gHiGoiuAIppL/T5AcNjGfBLbWrgmnbjsbWLpQPZXY
	AhrSFUbZwCp2Rmr4kSdRQi+qy/lNgL+2BJEkV/p3kiJj53PXWfeZ63R+ccDo2K0=
X-Google-Smtp-Source: AGHT+IG41tP9StehDN0qHxWlZ79Rb04+IOcVI3mvK2WoSqofs3q14dkzZICzZdniGGR2Pr8wx5ufwA==
X-Received: by 2002:a05:600c:4b27:b0:40e:78ee:cb61 with SMTP id i39-20020a05600c4b2700b0040e78eecb61mr235679wmp.94.1706003702005;
        Tue, 23 Jan 2024 01:55:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id l34-20020a05600c1d2200b0040e89ade84bsm21649964wms.4.2024.01.23.01.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 01:55:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: andi.shyti@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 tomasz.figa@gmail.com, cw00.choi@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 andre.draszik@linaro.org, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20240119111132.1290455-9-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
 <20240119111132.1290455-9-tudor.ambarus@linaro.org>
Subject: Re: (subset) [PATCH v4 8/8] arm64: dts: exynos: gs101: enable
 eeprom on gs101-oriole
Message-Id: <170600369957.35728.5412696474700042763.b4-ty@linaro.org>
Date: Tue, 23 Jan 2024 10:54:59 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 19 Jan 2024 11:11:32 +0000, Tudor Ambarus wrote:
> Enable the eeprom found on the battery connector.
> 
> The selection of the USI protocol is done in the board dts file because
> the USI CONFIG register comes with a 0x0 reset value, meaning that USI8
> does not have a default protocol (I2C, SPI, UART) at reset.
> 
> 
> [...]

Applied, thanks!

[8/8] arm64: dts: exynos: gs101: enable eeprom on gs101-oriole
      https://git.kernel.org/krzk/linux/c/c68efa676ca8febfd36aab50fe747c072c224d52

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

