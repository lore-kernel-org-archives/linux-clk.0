Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016881E0B7C
	for <linux-clk@vger.kernel.org>; Sat,  1 Mar 2025 14:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740838418; cv=none; b=mc2uBC1D9J6HZwb4ziZTeOSiArKPjzAXncKwxURP2B31vpSmtATX2zd3Es5E5iOgClrq+oJ4tJH4la6TJDwI/ONLV4w1f9yFv9SUOE0ig2NYXWVYPspPaJRKtVpewQe6tGmB7ypzgRJpyHs80u1ptQaKuyFMFTTUCpgKADAupcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740838418; c=relaxed/simple;
	bh=kaLeNKCrV3DUrxPBC4orfb5NQSWt3UDFoXv2KQEv8y0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oseBbaR+zOfVPuoXx56i8rqiO+dQudcAX6TPGOQWfysREGF2UqSci6RiYz6WMgyEo2xd6n18U5YviRpNWSHJL2OpRl3Uq9NJGxfXwAddVJnVGFd9u4z2rEMm0zs2kydmMqk9uQ6IvXmT86GLcBFLtYS6DsaLtvZTyORiAx76jeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WLP38u8Q; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WLP38u8Q"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de8e26f69fso661513a12.0
        for <linux-clk@vger.kernel.org>; Sat, 01 Mar 2025 06:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740838415; x=1741443215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF2SZUIZ+BCUsqS+/yls5B4+IVbjBfE9IjNCznqvy2o=;
        b=WLP38u8QdiBjjb+kmfdvdhkkjvRGmFrdwKM3h7QyXEnbsJRNFXkDPjjnU+IIIbiT0r
         5Ff1sjD7QNhhymMNyxbgwUauDLRxwqnPYU6p9H4FMYlfuzZdjkDKDv2QBmhKVkA9OdJT
         VUaRZBubYyTTq5aGW/9QHhJ5NlsyJLrhZa1htmCL84q6q3bdY7IXyKG5ldyPqmcilyS2
         OnkPfKxAOSEtRSBnP9ox5ar4/ZMO6LaKwlFVhBNzhXacKgY2jvcCxVTsXkbkBKZCh21p
         DW/86jI8REEUM+FW7tZXrjJGZSlUAmLlnQnvQMhf0uVKY0L/p/wwqFZ08+e7whs49l+B
         YUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740838415; x=1741443215;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF2SZUIZ+BCUsqS+/yls5B4+IVbjBfE9IjNCznqvy2o=;
        b=H/NBueSm6UfjV15/KllxF+olp4bj6Bkzw66M57ZwNlrAc+4FF4/ONEpUauHBeREwzC
         hj4Yro7dxFDhuVOMFYmAFdqS2L0niVe6mPZ3GORJWtZ7+eMjExxvpLCbJSq79HgM2kRi
         DvdpdcT7TZRzUnrjuI6v8sfn4bpZB45OIFGC4KGU4Ci5OHA4mvdBQzqszOMPJHZB0+e6
         6ur4ymQlmBrGCAAKnWIs/69u/tZE31SNaLj93rIPlAfGfJQOLUi4lvwkej65jKqYD2ho
         JKntokUhASgAkgY8/C4SUebIpQzIrwenMb78gwysNIK0f+a0HHf4oupvVyu3Xwm8/vkL
         L/Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUMJ94T0qFzrS53T/64OBY4oTVDWK00+DK3z3l4btYsVdNwo8cDnUBpE1HZbBFeYr8dzsiT0lwK+Gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgvFa8R0+lK2VSrM7g0bal30jDTKx8goNhUWPumGKQWoMql9AM
	OxLf6X8Dkmcc1lF9KEXP/kinarlDqngiiEHrQp4bDhfyKrtKWpHNjnpWP1JE7DEZLbntKYMjwao
	fnmY=
X-Gm-Gg: ASbGncuuadZnQWB8ld572MpIzgdxKnRhvR9oISeVh4pilg9u+WKOEjsD61+EptXCyiv
	+F9oTxQsLs31gBmIGcpRgOwig7L47W/ncMv7et2CqYYMZnieXFDW5ffFlK58nkmGMRG2CC0RtMu
	rvM8P6hooNHhZPUgSSvWzXfnExOb5LJwCT4+KSKre8h2fTlUjZ9qGEDnYp3IMEqiVOxD8b6E0h+
	tBRSrkl8kSVrizLBX7bvQV8Ev/tyLNeTyJuQrhsd2fRV7myGcTGh4/jIeRVrHEfNXmUb7qZ2Un2
	pTvTKyhbGwb9Hv4qxDS1Yhyv69M2D+8gw2iZKx9iwez3SmCisBSz4+LiEQSn
X-Google-Smtp-Source: AGHT+IEXjfOAsbzmDdwBeUYHq/6or4MctOJ1aDy3KgGo+cF5AzBxwpd05SEBfk2hys/UsQO5ckCxQw==
X-Received: by 2002:a17:907:3f2a:b0:ab6:b8e0:4f25 with SMTP id a640c23a62f3a-abf25fbaf6fmr324049266b.4.1740838414804;
        Sat, 01 Mar 2025 06:13:34 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9cbfsm485532366b.14.2025.03.01.06.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:13:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250301-exynos7870-pmu-clocks-v5-2-715b646d5206@disroot.org>
References: <20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org>
 <20250301-exynos7870-pmu-clocks-v5-2-715b646d5206@disroot.org>
Subject: Re: (subset) [PATCH v5 2/2] clk: samsung: add initial exynos7870
 clock driver
Message-Id: <174083841272.17657.12697906967603393824.b4-ty@linaro.org>
Date: Sat, 01 Mar 2025 15:13:32 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 01 Mar 2025 09:27:13 +0530, Kaustabh Chakraborty wrote:
> This is a basic implementation of the clock driver required by
> Samsung's Exynos7870 SoC. It implements CMU_MIF, CMU_DISPAUD, CMU_FSYS,
> CMU_G3D, CMU_ISP, CMU_MFCMSCL, and CMU_PERI. all other CMUs depend on
> CMU_MIF.
> 
> 

Applied, thanks!

[2/2] clk: samsung: add initial exynos7870 clock driver
      https://git.kernel.org/krzk/linux/c/4149066a5e958963f7123be51d3a65d336045c21

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

