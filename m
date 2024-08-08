Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A25718A6CE
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723110523; cv=none; b=QSA2XyJJy0YDvQQ0NKi2DG/w6NJZtgzfyiqiEsfC4O2icX0ZAH4YvIwGpLQjOra1CDVGJJusGLtMFvyPbEOBc3QkGovgBNQvzfdjZn/d9T7baneLHMTEnL1in9w7EAukk672vJlh6tPPP+NRehz4zoVbfpHh31BdQmA2egi55p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723110523; c=relaxed/simple;
	bh=T+zH2BgTs6Nf9Od4NpzImwUSRTMC/ptukpQbdQB4pis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ETqp2JVSGatbbYU3q9f48BG8h9w7Gqd/SdDB6aBID7P57AX2BLDizhR05WzHeEkRfgg8cHCrBW//RtugvkUvflhsA7bbuVMfn8BTr1hFoOyi8v+fY5B0mQgZLO5UkglGrnDCv+uVb4umDaToXPcY8kbvUhErIMM8cPxB6uSIVjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eVE3oVBC; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVE3oVBC"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5af51684d52so913804a12.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 02:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723110519; x=1723715319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5ZPOCd2ys4aq2QG+W66XIhWJ3hLTGW0abklTxDzsPk=;
        b=eVE3oVBCedTbPFsDAx0PtxVRDkNHRDzNdu2ARfckCDjAleuMG8wv+f+KRmrbr7rcGK
         91ATy2PGEc0tr7SD0Q+1IMA6QRZqaaptY7bGAjgka9rAKucao/0ZsOhFDweoajW3aJJo
         Izw21jKdCRwqQZYnzu0YmVpu0FQo492y5fcU7OXZPxt31Vl2unIRYl4pkWsa3BaEXzZP
         HIjGhm/8Wtqf//SXLybI2ZAHcTrKN9X/5/om9vixkoPff7sGbysd3FS0ysGgaAs9apD9
         LzQlUXjCht6X2nj1qaDaywFb6xZIEpIZhJqplmdOKDTRrPt9xmewG1EVMeAp53HaeZf9
         HLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723110519; x=1723715319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5ZPOCd2ys4aq2QG+W66XIhWJ3hLTGW0abklTxDzsPk=;
        b=X/aHahoU59nzkx4q+Wj9TN/51zcVogZT00jDjCz+DkFkt1/s9TwjSa4/vPgg5Mtd0J
         vhlU7QHZgamTNXOoALYLL8XuNb1sLoIs6nHQgOLWwtifhV5E1IsjWrdOp1EbJGx/a4Kc
         qDLTIqV8F47+NhuqTL2UvbkUCy8LeqI2rYrOWvC+/NxHL2xp7+xuMT+i/EwQkuMG1OlV
         Xz8XuCsvTN6zbPWYpfH8mvuozthBhAutmoDQCot8brJSP7gqZkpqKjhjJeUlJ9ZBSpFL
         xLOs++azkWTo4rz1pxx21lle9ndoxUctsxLvNDLhhQSs1ov57akS4ZzuoJiKEE2g6UNx
         WIjw==
X-Forwarded-Encrypted: i=1; AJvYcCUOJlS7mmcAOUnxOadKzrxNPZNVX4FqKcmrENcylsViIqdFQLdVi29ySijRikJZ38l/7unc30ippQuHq30SkvrcjzmV8e1+ItwM
X-Gm-Message-State: AOJu0Yy9yAfz2h6/4H/1oMik8bRnMDGZVfFGk5zey7cNaZ0GYnzow+qC
	d3uqk2zK+WXPhoadpgU6T5qzuXhq3Wt5U5rit2JMKyq7MoV3viwtybTAxkdfL+E=
X-Google-Smtp-Source: AGHT+IHIAfemOxK3Z14hz1PDOFK8L359QZw/rvItiO3sxRls0UpGZVwKzIX8CSey6QGV/gcesGqHtw==
X-Received: by 2002:a17:907:5c7:b0:a72:8c15:c73e with SMTP id a640c23a62f3a-a8090eac7a2mr93527566b.55.1723110519508;
        Thu, 08 Aug 2024 02:48:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e849a0sm719911966b.186.2024.08.08.02.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:48:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Virag <virag.david003@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 4/7] clk: samsung: exynos7885: Update CLKS_NR_FSYS after bindings fix
Date: Thu,  8 Aug 2024 11:48:28 +0200
Message-ID: <172311048731.12963.13183436852631483399.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806121157.479212-5-virag.david003@gmail.com>
References: <20240806121157.479212-1-virag.david003@gmail.com> <20240806121157.479212-5-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Aug 2024 14:11:47 +0200, David Virag wrote:
> Update CLKS_NR_FSYS to the proper value after a fix in DT bindings.
> This should always be the last clock in a CMU + 1.
> 
> 

Applied, thanks!

[4/7] clk: samsung: exynos7885: Update CLKS_NR_FSYS after bindings fix
      https://git.kernel.org/krzk/linux/c/217a5f23c290c349ceaa37a6f2c014ad4c2d5759

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
