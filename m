Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196C11591F6
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712738679; cv=none; b=Fns/j0JqzZCTlra8xRnt38ZDnMQd78udTcRWo59fFnTUS5f4jm1FOd5E+fd4FzuisBRpB7hlNSIrX29tBrimRdd3qdx0cTNsA+kMf+vOrdyfhPMWAfys2qFCvjdHhOpEvkTvdmXpLPvcerKIJPvtU2qkY93lxl0xfzsISHJY3AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712738679; c=relaxed/simple;
	bh=wqdmhZDJTD58YPzPxG9v4gcOLesOm1VOYY8puJMyNf4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ODLi1LaeEnGas4t665fcRDjwE5ENOpTn1Sck8dpwbFMCc2H019qPtIam5HlZCSMilJ0NH+YdFRc+chBh0h9b9R6c31+atuSEQzSIJkdqrqqsn5qBBSej2TNHMikH+OG2g3bLigB5Lg5MwBuSdMNJkuGWbvjlXakSpTW3f4sKhVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3H1nLr/H; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3H1nLr/H"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-416c4767b07so4191405e9.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 01:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712738675; x=1713343475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXrCNXWIgPaFh0QtuAJvo+rsWblvd0ADI99YH8byk0o=;
        b=3H1nLr/HXg3WM+g+ei9oHUpQPwVOeiaYWw1vGM64KgOCPuryIcWG3gYROrGLxfap9b
         1fCPDBNWtIzKe2Fx9rpkbKaXOnMtHMD+dsXM4gsbRC4sRxlxuM6TFwUWerce+sQxq1/A
         gE/Vad4dc/E7au8UwERLfvIw5O5gwQL6fmKOVRar3q+iFXPgEJulwoUtwMoUg438LAlR
         Ls1sjmPn5eqHpCCQGWVkbv3kuTwSneUqlTs1hcAUTSxQ1H2lv3nq4ZmPAdKjSQ3yCw64
         +zrNaUTFvLs5oRwcoxHv4x8uTd7GRAZlB6wOG9PV+c16S9iDi3JiTEWtkrY1+xTsJepX
         7sPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712738675; x=1713343475;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXrCNXWIgPaFh0QtuAJvo+rsWblvd0ADI99YH8byk0o=;
        b=J55Om2/3AeXXMkEkzonut8yFq1VYExIcTS7vbAbl2otu1HGGfwlNGl7EqWINIGyHsQ
         u8x/ZUFZSal+lCBRaVOcjirAGFUtgC+SE0IJab8msED3nGmwoVanLNpEnKK84ax2XoPl
         2B7kKjGn5mCoxD1xv1JjQqBAIQFhklxVhMgq2/DwPXe/Jg0dRMT/hSqm/MW7VnE7dPCO
         rlcYlE3WCbUukJ/B5hfuJtOOSV49tqBpKprx43C3b9EGHc20WpZjY1cYKxvX5vDs5icC
         y3GOowAr1PywnHW4plj2aivNPBsq6qCFeQNLFiu1O2ihe3xv19f4i0y8oBHXx7fqmf27
         rBCA==
X-Forwarded-Encrypted: i=1; AJvYcCXamooI592UoAU1vnM4glNb23bLxwzaC1+D+kGe52XuirDyRC+ieu3BnjfcGzBh27ZnDxZAIhHMCzPWgGbNSrTPCSphNx9ZRhEy
X-Gm-Message-State: AOJu0YxRHOrHj6CFv8izGCF3jTWTEo5/aVozqBxfOed72QE9fYfExQLN
	mLfev+nAfPAyVMzCj7LOEONggsUJrXGcfeAPg9qiH8XdnWEnc7igfu0dwGiUnkmD63hid3SUyAb
	3hdI=
X-Google-Smtp-Source: AGHT+IHe2X0O7trL5Pg/N7aJNVS5U+dm4Rs/QIlLSTeBZVXFLzWtij6sQgRwdxIn0sbsxOB8JhZ8Vg==
X-Received: by 2002:a05:600c:1e0f:b0:415:8651:9bae with SMTP id ay15-20020a05600c1e0f00b0041586519baemr1464364wmb.41.1712738675386;
        Wed, 10 Apr 2024 01:44:35 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:49de:129e:d25e:c803])
        by smtp.googlemail.com with ESMTPSA id t1-20020a05600c41c100b00416b5e6d75dsm2066078wmh.1.2024.04.10.01.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 01:44:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 "Lukas F. Hartmann" <lukas@mntre.com>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
Subject: Re: (subset) [PATCH v12 0/7] drm/meson: add support for MIPI DSI
 Display
Message-Id: <171273867421.2243434.5037326499046523723.b4-ty@baylibre.com>
Date: Wed, 10 Apr 2024 10:44:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

Applied to clk-meson (v6.10/drivers), thanks!

[2/7] clk: meson: add vclk driver
      https://github.com/BayLibre/clk-meson/commit/bb5aa08572b5
[3/7] clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      https://github.com/BayLibre/clk-meson/commit/b70cb1a21a54

Best regards,
--
Jerome

