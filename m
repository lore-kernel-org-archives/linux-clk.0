Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2D92D9782
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 06:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943354; cv=none; b=osK/MQfI332KBNtzjF1eCpKTlgibqrkWaOlE851xJQWEwJKOWiH2npcuRBFelmXUHrPio8GQ7v0zSiyBQFJYfv56NeaWFj6feDGR4W6jH6qNJYEKy57E3ceBQXANEuC9910qOgGwOoGM/AIvUe3Bi8vZQ4/eWWjpJevV7r6wlZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943354; c=relaxed/simple;
	bh=IKZ1q6LfIYFaUJY0dyFQno0dTQoazdrIq/AGAGI3qVc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QkV2RREuu4FDKOxvvRzb1K6vgDDUqpWwVNoS4RL7zGaIGdU5YLN4BrW/Kx6vkk25osOFjSHcrETUL8NLHPwPiB+YIElFJsrDPiy3G2bVWByBxCewDIhyvXCi0oVblawEFFkz/iCL7OPav/DWiyVIOg7zGNZwTpw6eHScM/x2h/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s3C7y5ti; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3C7y5ti"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3f8d2180feso60788866b.1
        for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 23:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943351; x=1761548151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06zgkTdvLdS4MNITPMlUpp0m9/L1LkTY9remEcOcFr4=;
        b=s3C7y5tihsoPIL89q5f/2OMvqHvqK/8wDNfPkGjWu4yawYC4cTTA6YlRFkRo9B9qEr
         rmmtd1ylbPvBpO1JatrK2Yp1DCyWGKkjbvQdguyLiy5Ft2J8L8HMb3AjYX2sYVD7ptLN
         J6QjQ52MYQPKDVOJS4KBX2ij3v+sFHL+YfynPsNY7gtT77FPEzPYmAJcu9Xcxh6eIlwg
         ++xpJBNojPz0wUIaRZZbBQKqlP3p4NsSTOKc7QzrL1KDerc0l0USM2yoWao0X9pzAiEu
         TvvcB1ODyNSm1uJ2cuymCJlERI2D5l6CvRfAbjAzvDCKe1HygsJo5lbYgSJwhpprYpvC
         AtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943351; x=1761548151;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06zgkTdvLdS4MNITPMlUpp0m9/L1LkTY9remEcOcFr4=;
        b=sGnXqcolm7nPpkrYxjd5UK0Fu/P5BHi1TAmhUZ4/O+qCgHev85DB/aYwWTFSCHzlWB
         qQUhhNWr0QUGG7jFg1u6Q9pimVVEPIO1dy7NVHLy4XQB55C6zuttJyZeencN4l8rGswb
         OEyz1fk6nGfd0th78ez/igirF3joI0qH73+bHGWcQfPrZS0dtK/6O2E/zJ6evhWKxNcK
         ka6jTw782jAIAwKMTceSvxfbKFFy9y7TBcMRbAzogQ7fo7V2Pzxq8Zoyu5NkNxACeJo4
         BWNjdefHjNPVh88Vmcx+rCV82J9WwU0IYGB4FWWvl1PP0wT5mXdLf2B2CCQIKZu4nNNJ
         ZJ4w==
X-Forwarded-Encrypted: i=1; AJvYcCVSmp3MxdUMXLhYjXNepUvgWQzj4TC3KlRXoHwSEl0YJmcWOIiZM81DkUeXRyKPSzWYRrgdALDXPUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfollxYIq2H0toUzels/I11KZjvv0uDeyPSNJBIG2ei4X+/e9f
	YJB98yPL2FSEAoDTSWcOm0ZLM4pR9RiIAQpeuevervlS2DONRRMg3rd2awMafamkBRw=
X-Gm-Gg: ASbGncsju8NrBOR+6t6v1Dy8PdpKiDl9HgTJMRVZKeYO3JYFv2jyrkTUDyExIhvgBA1
	Ft9FDMk2elK7bo5ncGZRDKgc8wCWQjQMhp64GK19NFwTtEiGjW1p2mB5aBrtmml9ec+VjKPXOWt
	j3fkvYbY5gSjv6A3ceXBxNOa+5fBnbO5B9/Om45YkHNUormBT2Ugx5eCsgOsdNkpqE/5ufi+dtu
	G+skbOK9Ke98EpX5YT14+rd2+cMbqtNkqftNaN6ZTdDzNy1u+bJ4g7QuMR5zfhjI+KM9JJ8mEBA
	lv0jDPws0nKNNu1hqfz2mANycpO926WmMZzf7Ic4jq/Ffs/ynBnd251vuGVVUiNd7LLoBT6mG5W
	qD0HbgKilmn6uvROYO+g5Zl7VvCotpciu7k/MqHx9Rl8x7ZHqW1ZkOBdXizkHgz5b85UUZ7w7on
	mWl2irzyNLO6W87duYy5VCUIp7VQI=
X-Google-Smtp-Source: AGHT+IHAht6KxB0Ngh4X743mU/9uv/8gNjvcOQoHdUUnr/RK7iqnks8KTRJG0OT6ymzSEGD6XZTvrw==
X-Received: by 2002:a17:907:7f8a:b0:b50:891f:66ae with SMTP id a640c23a62f3a-b6474639388mr840879066b.9.1760943351216;
        Sun, 19 Oct 2025 23:55:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:50 -0700 (PDT)
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
In-Reply-To: <20251010-acpm-clk-v6-1-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-1-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 1/6] dt-bindings: firmware:
 google,gs101-acpm-ipc: add ACPM clocks
Message-Id: <176094334888.18498.257368855953115301.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:48 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 10 Oct 2025 12:46:31 +0000, Tudor Ambarus wrote:
> The firmware exposes clocks that can be controlled via the
> Alive Clock and Power Manager (ACPM) interface.
> 
> Make the ACPM node a clock provider by adding the mandatory
> "#clock-cells" property, which allows devices to reference its
> clock outputs.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: firmware: google,gs101-acpm-ipc: add ACPM clocks
      https://git.kernel.org/krzk/linux/c/83c4e3c39b2b55afe56ed0d14b93b5f219350c81

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

