Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34C11487C3
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723110517; cv=none; b=jZCQFJgKhqp6V2lUP3xqcwuduPQa6BMNKGierhibc8zEwjuDFtPLD4pmJfPOoep0UnIL3xv9nneM2TB81uFR8Q2e7oT+awFK26fPUmAMN7r0PttY1ErbZRdKBnJ+YfgEssM7+VupKRAVTwgVhpCaYvS0UlVo5DJE2CfkZmWIBCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723110517; c=relaxed/simple;
	bh=Oz/4FlxMMsehe7Ce7PmjbmGoqd8fGJ0XyCfS5Cq97YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K3/3gQW7sr6yeEXz6ytQWSZFmdlm25FPlEKV+WqpP1LVDMOoL2l+BeSyJ7CLwJ+qE8PePPXuaoWJHqjHP0Af74HqLvBjjyEiGiE2dFW+bfd6uzti7KVVhaoub5pjliyACvOIO76OZS10DX4cbxz8clH7/gteC5N7oZiVr039iD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=skKLWAmh; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="skKLWAmh"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7ac469e4c4so122133866b.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723110514; x=1723715314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fD4Fbo0bLU0vBdFevb+9sQ5UqHYLrq4vOipE19dCblo=;
        b=skKLWAmhLk5POTtwZQ7hRsw9SNTCYJ2yZ5NpfEhxgTcw1mWeT7OK72VwIhGYbGSk7V
         KU18HBq8WppB5iKxZD0ZCnRWu2sqR38NJbf5L9LthiDZzHaNBWcRgB8PVvQ6bvPPMA7/
         iJjJxAmbmwtqpa/ur0f8mXZ6rELcQE3b1AdbzUy8Klqvur3+AqaVPzPS+JD5UgGWfxfL
         cAxm1unZJOJgMsi5DDuYR9dujC2TklzY1C9pAWm+2aHo73ZDkGINBfUzFmbnUr4ouQ3F
         2bBszitgZXcgaS9WG0Brt1GR75Rw8v4eDkEe66wiqwqP5J/In2BaC6gbcJSMvjuKPRCL
         HN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723110514; x=1723715314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fD4Fbo0bLU0vBdFevb+9sQ5UqHYLrq4vOipE19dCblo=;
        b=EFQ4GyeCLhQYH1xOaJRgN4AcyH09hgRguHyGSjYwItEdvU5wc82Ap719ZE65/wvoX1
         Z5HBiYEkYaowWv59QJd/78vLLdkc8p01mE65QYK0ZdUoMzDKPOnaW+3GGTHQlOcQp3gd
         QC/xPbor8Pnz3icpcAQejPqK547vzlY12lgsQVc9UdK5z+Bw/7UM3KmhfnRrxdjVpOqt
         F2Nl6S79Px+otna9R7VnR0AsNBN2zJu247s3DbGRGKmbPpB7RQT1cOsW0AO4Ccy9iGg+
         5/V981cklHk2Sgu3Yt/PhCW9bCL56hzUTm4X+r9qRBhHVzLs+k3R9kWCQzo2VS07Mnwj
         YG9w==
X-Forwarded-Encrypted: i=1; AJvYcCXwUqZVR00II4YcIlesQ310FKQ7BYBY+qTpAcD1NH4sd5gsPFVxEZtfV41D/Zzgnqllvov0CQrkg/apP5/FLvQvpbExDQer+lVV
X-Gm-Message-State: AOJu0YypTlh/W2YOU716roIUJR2QM85XURaL2z6yNVErnHT5cLmOWCM0
	E6l3ByLveZl2qz7N5s/pN6fTWIgkogbXMwdWgxEj8ekj62ACWv6PK/O8+v+gyM0=
X-Google-Smtp-Source: AGHT+IFJgY0IwRIPW1jKkuP1Rul52UIi5cW5qomgars0dlYdYtx6uT0furoQPy4Yo+tQkmj7tqJo2Q==
X-Received: by 2002:a17:907:3da3:b0:a73:9037:fdf5 with SMTP id a640c23a62f3a-a8091ed1fecmr91422366b.6.1723110514125;
        Thu, 08 Aug 2024 02:48:34 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e849a0sm719911966b.186.2024.08.08.02.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:48:33 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v2 1/7] dt-bindings: clock: exynos7885: Fix duplicated binding
Date: Thu,  8 Aug 2024 11:48:25 +0200
Message-ID: <172311048730.12963.13971450848126539088.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806121157.479212-2-virag.david003@gmail.com>
References: <20240806121157.479212-1-virag.david003@gmail.com> <20240806121157.479212-2-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Aug 2024 14:11:44 +0200, David Virag wrote:
> The numbering in Exynos7885's FSYS CMU bindings has 4 duplicated by
> accident, with the rest of the bindings continuing with 5.
> 
> Fix this by moving CLK_MOUT_FSYS_USB30DRD_USER to the end as 11.
> 
> Since CLK_MOUT_FSYS_USB30DRD_USER is not used in any device tree as of
> now, and there are no other clocks affected (maybe apart from
> CLK_MOUT_FSYS_MMC_SDIO_USER which the number was shared with, also not
> used in a device tree), this is the least impactful way to solve this
> problem.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: clock: exynos7885: Fix duplicated binding
      https://git.kernel.org/krzk/linux/c/abf3a3ea9acb5c886c8729191a670744ecd42024

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
