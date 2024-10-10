Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287D51C1AD8
	for <linux-clk@vger.kernel.org>; Thu, 10 Oct 2024 08:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550508; cv=none; b=KkUi1jIQHvNopAOLxevOoN9JRHVpjeoGBUsbP3uqnsY8UbB1qidJr7UR0fpuKPoxPloz9q0tOFWGmSI25x/9wxMTOwcVUfPsou0IFrIUEL59YJA4kr/JEd6BN+ewUpIo4G1Mr94lqzxiCUnYhwXgydhywgQExTKV1gQhnk9BtSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550508; c=relaxed/simple;
	bh=5Cx+4eot+xnIUAD/9oPz8ttDeh/qqSFRet/nf/SXMfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=URCk1RexIVJpK5vnxXhrGIOl7LZ5iwALko7Cz33UYocWKhUAGPkLeJGR1hiraeUiSPcsjQZe8NB5734jyuZVwAyY9bStCg2VHV1mLJ122IPY59APqUgXwj0Qr3utC6cf0xkHqxeCN66i9yDSriZaXlGKqvcquzogAts7pjjdgpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=deCwGo9c; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="deCwGo9c"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42ca4e0014dso1084865e9.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Oct 2024 01:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728550504; x=1729155304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgOR4E9IFq32loq7SFGtPsR1wH/Z5vkFIo/MpY40Tqg=;
        b=deCwGo9cOJCdCJMj0DzNHzkZKuGpVu1K+Xg8FvronNPQUnOoQqAlpE6QBZkJk/wt61
         oZSEj5GTEIM/ZL/ROM8Vu0XcOhruhXorRNy/w/FNdIeOtnbjrki24Qk1LAKhdOcQIApU
         M/Ch5UeznRGZTGtqgIOD1ZnuKIOYXNOQOyZA0nAi3/Z9TUcQ94idBThvT/2L6p0fC2OU
         Dag877vTk7WQUqxn6hmpKA5OnJDcSW/sFXKmkGy5On2d9B14FLoaRhLjwdfAL1ey2oAQ
         F9tuxUSp9iUUaD8nq8hUdBj2Dc+3AMuqNB70dMQwKj34Y/WQJvwR2SflOtY3pnZkXYN4
         t0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550504; x=1729155304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgOR4E9IFq32loq7SFGtPsR1wH/Z5vkFIo/MpY40Tqg=;
        b=ZkwpJAQJIwiTQBi28llO5DqjCRPmeJJa+3dS+TgTTkg6eYDEWcmU8M5N5vph5PAGw5
         kbq1+IgqwzQvhtj3wb5y1MgQ2ZxOfpBDNzhRDzV3W6PwlVdFU7s8eMvvURIzQz5vQuCp
         HTn4PI2xcy6cABuE1M/48bhQSnTTFIty2OOWacN602yZlkskQmb0DXr26557hswcEusX
         eJHHyHDECKC/2xZq00hJtNDV421Sm6WACkkZ7ANnap05M17wQ9dZZA2Dq1kpC1MRtIky
         l/muidKYtJ5ROXiX3DMKFPCE4x8kIwt+WY+DS7P7SsMh3CtzkyCS268+untetjYpgAkO
         DEBg==
X-Forwarded-Encrypted: i=1; AJvYcCX2YVpn0XTveFxfmihm2f+9Xr0Gwtqu/e5sNYQkKyvrK2w70PwBEibUrNnxwOw6BLsb7C+yRP83RSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJlSx5mFOV3yW3YMC7IMTl5zoc2Qu4AYQRuQJqglhWIrfXlVzm
	PkDKwXJ3JAKpf/soi8tLgwET4Q/o66/Mrh/rM2isWfBOd8R5C8F8ZLHSMhwVmcs=
X-Google-Smtp-Source: AGHT+IH2OTiB+QZPXTSj2Xs1QihUyDxM68B45YoqASQPr1RF5iEjSHbzN1GfHT1WymhYm0AgaUhmVQ==
X-Received: by 2002:a05:600c:1d18:b0:42c:aeee:d8ed with SMTP id 5b1f17b1804b1-430d7488fc7mr21015825e9.7.1728550504481;
        Thu, 10 Oct 2024 01:55:04 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bcf5bsm902012f8f.32.2024.10.10.01.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:55:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 2/3] clk: samsung: exynosautov920: add peric1, misc and hsi0/1 clock support
Date: Thu, 10 Oct 2024 10:54:56 +0200
Message-ID: <172855049020.142350.17701587570659888437.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009042110.2379903-3-sunyeal.hong@samsung.com>
References: <20241009042110.2379903-1-sunyeal.hong@samsung.com> <CGME20241009042117epcas2p3805b8b5f3a65ed1ee39d5244310b9581@epcas2p3.samsung.com> <20241009042110.2379903-3-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Oct 2024 13:21:09 +0900, Sunyeal Hong wrote:
> Register compatible and cmu_info data to support clocks.
> CMU_PERIC1, this provides clocks for USI09 ~ USI17, USI_I2C and USI_I3C.
> CMU_MISC, this provides clocks for MISC, GIC and OTP.
> CMU_HSI0, this provides clocks for PCIE.
> CMU_HSI1, this provides clocks for USB and MMC.
> 
> 
> [...]

Applied, thanks!

[2/3] clk: samsung: exynosautov920: add peric1, misc and hsi0/1 clock support
      https://git.kernel.org/krzk/linux/c/5e830d3c97d50d619ea8eec04403e87ff7538c76

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
