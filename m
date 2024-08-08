Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C70F189BA4
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723110522; cv=none; b=RLL4WAWlNeIFPcIwXad45rM92u7B7+msSEAeab/gLOT10e46FmLh3t0KpSkgzywp9KesmHbfXv9O7R+eM3/b9B1HJCUM+TwoO4GHBVn7CIbnCRPCDw5rSSqCcNOTzGffd8JfZ0uhQBrJVJyEbYIu05rMdDCZ5t2bQiUNx0jzaH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723110522; c=relaxed/simple;
	bh=tYgAmU1dlhccZqcNUyi27/tGhXE4LKclbQYuSvQ45g8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SkoTHDTKT7mdOdCDYdrYh2SVmqm9B61eNxHoxMP654cHsSGl2coB4P2/0dfGGxtCYQf4TNhlTiDeiz62IH4TTOrJeTFnyESscF5Rz5x7gBk605OO2QuwKQ99cN/9PUQ/5vSVqLKUUDFFldjLfGtz4IPgzYgreqkvcAtMk09TEPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xEzB7Yfy; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xEzB7Yfy"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efd08e6d9so861107e87.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 02:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723110517; x=1723715317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0BJ7RL6i1hu6kypPK6EZLbNRGROSmLUvIQdzrrc9Vg=;
        b=xEzB7YfyAbCtOqfasdMK2mPr80KUiiXnpFiotnk9HDQ6VP5PyeTljYrK5Akw3gAwlE
         kryC/TFtVfBVcBDqeqCJdafQDkdNmUwLFyZYGLUFFEzpjmHI6REcVtwBcWt13pDkEo4G
         tNU7mPTGL1eOzGParZqzHcW3lGJcl/6MO3D966Jx3RYUDwsDN84fFkiEQRfyzi493LIJ
         FdeGAGM+qjh7Qp5w4LdR3oRoGtPbeMzY89EkmAH9EWSy6efDiIOF77ixjCZWB+LSbebk
         Kv29DpXo2JpleLx1J4Cpy70GprnzaylYsapCCIF4dR7CP+l4YpOJ78zLHhCIMubEEkYh
         eyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723110517; x=1723715317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0BJ7RL6i1hu6kypPK6EZLbNRGROSmLUvIQdzrrc9Vg=;
        b=tllwP1pMys5xKjBbGJoRrA/c02VNdOjHTQJ5IGBVPRedw8hY1IJXrniVYR6c4RNsaD
         5tfReTCxD6WbSyDP9s5ei1Ef73k8jktDjDz6QbacvabC3ATZP6jaxLYljUiPowi77HQl
         oJmwwL6+hQ61HMyjHcAsGnkzt2mkUM0UZ+y0/f9nK2GHCHw0Z5GmowFdPd07Nnfg7TMl
         +qbUZPgWuaCcUeUSmbzSEFJ7ojmxbW73WLwT9nKY/f43HfMpPYU6Na6oZOnvtA0MATzB
         PMDpgWHN29PM0bpzGzwFwwudMDqVPWRezSbMRvAD7q0Zih0hV3b9Rfv87w2XETGA2V7J
         9dXA==
X-Forwarded-Encrypted: i=1; AJvYcCXztpP+oTPX1xwztWvDJv0aPXQelIE+2Bf/ReOmjmKr4/hkuGc8c9EvsvdbLAH8a+rHHTgM0lCx+pNtUmajjHZkijoV7VO55qVm
X-Gm-Message-State: AOJu0YwurO8ADKAmXs9DArUOACppce5h3LDPsuNMjMe/kPSbGCcIJjTW
	b83kQUelaP8ViD49rbEaPQtA7bdegzb48Ng1wjAOrRYhNe8L3/WdyrIHPGHjUdY=
X-Google-Smtp-Source: AGHT+IF4YjK8zrHFMoWt/gQTkh4LphPSnVEM0mvSyWZxJgihuSSukPuWz2bZ7wqSvD6BqPRZW734cA==
X-Received: by 2002:a05:6512:3f04:b0:52e:9b92:4990 with SMTP id 2adb3069b0e04-530e584527cmr1083412e87.32.1723110517476;
        Thu, 08 Aug 2024 02:48:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e849a0sm719911966b.186.2024.08.08.02.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:48:36 -0700 (PDT)
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
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 3/7] dt-bindings: clock: exynos7885: Add indices for USB clocks
Date: Thu,  8 Aug 2024 11:48:27 +0200
Message-ID: <172311048731.12963.1935261580196077122.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806121157.479212-4-virag.david003@gmail.com>
References: <20240806121157.479212-1-virag.david003@gmail.com> <20240806121157.479212-4-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Aug 2024 14:11:46 +0200, David Virag wrote:
> Exynos7885 SoC has a DWC3 USB Controller with Exynos USB PHY which in
> theory supports USB3 SuperSpeed, but is only used as USB2 in all known
> devices.
> 
> These, of course, need some clocks.
> Add indices for these clocks.
> 
> [...]

Applied, thanks!

[3/7] dt-bindings: clock: exynos7885: Add indices for USB clocks
      https://git.kernel.org/krzk/linux/c/b9dee49cc6f9efa97eee059d03b704dec0f45658

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
