Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9AF295DB8
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313956; cv=none; b=hdUo2MqTJsxosi8Sz0uEyB56xz0+McrcoLyiS+uLOOHdiaZW+qgqD80oYcSVxSFSSt9UPW+Dxkiiv1euhrzViRXcTd2sfZ6rFszNqC+9uNth/NGbWmGUU57IfrA+FNxYkXLwmCZY76W3vCCn5zpVsjjRwRLNp+9S/P50ZlCQ7H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313956; c=relaxed/simple;
	bh=ZU+L9HRsuQDe88PKm6tInPPVLfT8JP5Bqdm/hv5vNlc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mUOQbAZDfP0TPwtBLZpsP+leX4os9o10SvqsMAca57GIlSk9bw+bt4pnnu6S+YphDh2OnFXOoV7STBqZnb+VH7B5+84UyRhIgVnLZiwWNUXOsApnqxg6+r9f3++G2Riey8hmbPbW62eYeVSPXvKFQ7+XEjCFWEESu/i7DPJtQHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pyjFK9Xt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pyjFK9Xt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so9840175e9.1
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 05:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747313952; x=1747918752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93NSiG1e0zBMLdXcPRXVb1UoRXanauxq8sjT5bMUUhw=;
        b=pyjFK9XtrtDE1rF0UB8WNs7RuSwJ7+AKtdGrvj3EG4mc1inZzPv86zFMsqVKhDQ2ws
         FeEtB7VIiurpiedqWyBJ4eWL6MKAwrADiKe1FRzgx0x1rQbzpSKWW/0u/MYGkdn//tv2
         lwnxnqrdynRwL/As8WvGxIFnLvWSuz6TujNBrk6yaZQ0Bv98sgeIerE/j/FDuhuN7PwH
         DpQof3y3pGPoi+PPzKBk7d1aaVgc0I23veNwoVOtYvkrYsfjwNnT6AufHadfiD2jlgyE
         L1L9L+REm4EUtFvSjDy2mmLgdod6h8Dmy97Sv+4Qdxiuhtch/ZjlKMd+rgIUs+BLB9AR
         1iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747313952; x=1747918752;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93NSiG1e0zBMLdXcPRXVb1UoRXanauxq8sjT5bMUUhw=;
        b=Ranz7T2eG8AYqOl7ur0IIDxJexdhHbwZUX3tmWZTBVa+Q3tFEfUz9Bi2PStp+6C1T7
         K0kfFuR4g45m9yRGmIFDh6D4smAYb1i5GG96d1MDId8Hk+1A6lFwc49EqRUWfwQ61qws
         Crsv4ApjzLahCL+Kg6AHsn3wUDBwlG7gj2F2mCG4LaJjtB0L/wh4RpTeIfiL+aba5EuL
         DuolqflZBGdiptFzWC9YVUbqlXR4F+sJ2VsaDpBQCqpuBHTQuasbB0NWtBsmfpXSyCSV
         a1d2iggL3GmaROs4H5AgYyaAQldg1/hj2sA6s+Q4xqBWLa77OdrhtIWiriOrZAYR7enC
         tUFA==
X-Forwarded-Encrypted: i=1; AJvYcCUW2WR7nIh5viZfk4NiP1ofGssi5VM2INcTcp4vbL80yWCN89YYViJJPPFa3AZsc28pZgn4Yt+wVLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrpCWw4K0VP46ZVkzS8fWbQzgIxrBqlkICCEQZNi5SLBFSD0DK
	Xzif2D8xKzKxxAQr/GL4xE9f3PuQtkXdmine6XkzGSnAee0PVrc3mVmjKQ7z0VI=
X-Gm-Gg: ASbGncv2BBi0OxRqPkNBlRDKkua7RZ0Q1v29vmvijudO+mCHD1ne4ZVZG+aU7CFr69l
	VLE/qqk9qzxpcndgb/WqGFj/XHsXHn9Dr5JuMUmZZZB8Vy79HEUTYkJlKtc+4yQ0xGPHKrzXV3V
	3OXpzJgWrhfbajHS5OCTKgdPoI6EWZrZYpIutH4nWvtjWtKTwiGYW834B02KCosyBvg5CNwCgR5
	V78XdROns85TpWXualj8q1m7H28loRBM/GEyzfFlTBTSdSIUMk2RryVPuUIdTKsF3Adiitfchpx
	PuwVst3eZul4mzS6FqSYj64MK2lMedc4CNsSHGw2w8V0EiamFwHFIMNWuJAahELz5A==
X-Google-Smtp-Source: AGHT+IHpy1rhqw987Tuz+RK9oDjiZ/Y3wtsR+06Hh2lLmeOPW+aVkSCgkOsbFAx/A5adDBQ/I/BpHA==
X-Received: by 2002:a05:600c:6612:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-442f20e1abdmr92975295e9.10.1747313952121;
        Thu, 15 May 2025 05:59:12 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:82b8:c32f:4d8c:199e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39e8578sm71180475e9.29.2025.05.15.05.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:59:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Da Xue <da@libre.computer>
Cc: stable@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250512142617.2175291-1-da@libre.computer>
References: <20250512142617.2175291-1-da@libre.computer>
Subject: Re: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
Message-Id: <174731395123.3761659.11544664862448009697.b4-ty@baylibre.com>
Date: Thu, 15 May 2025 14:59:11 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: meson-g12a: add missing fclk_div2 to spicc
      https://github.com/BayLibre/clk-meson/commit/daf004f87c35

Best regards,
--
Jerome

