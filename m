Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5F53B389E
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909232; cv=none; b=G1zh4zsjEacm6bbyrZs1MnqI4KnKz5OxNY2fY63416qS3VlSTaV/pZF0yCOneN9M0lmDbU6ixUVuP8qUMMV65uPBzTI8L442oYnRc6udrnZHl4ZT4V6CtbR2h1eGTShs3tKAoDywHqcydZKpmsacuK2dh2/qfejLND+SF5RJuzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909232; c=relaxed/simple;
	bh=i+oWKZOb/p/8kF51VJZLbmBSUaMxGA1MMQ4mIXAG6Es=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RiFt7H94XoNORNPyUFwF+roWe0wlr4nr6x0Wy+cboqQ5uZV74xiY96+9avvOPkmCXYSU7fdYZE9ubfgMt2leA/bFa9a8iGXGpWjrzNTImsoKX0Fs1CDUqQpCPkElwfjChu1y56aJWBcaOmhcc0noCpm9C7dyM96zPk+Pk7xICys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jli0MbXZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jli0MbXZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso3980495e9.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784909228; x=1785514028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nhf9VFdcJj67d9mnRhCsj+1NVc5VUfS8waKbVdijXcw=;
        b=jli0MbXZfPvgv+B9kQMu0bX97NCWZFcO4kLNJ3dPyURiWSffP3ywksuZHOitI06IPB
         LCKEIltQBwujGdsQGeP695YsQ9yGxLDZX+A+3ZfLmgtitJwS+h0tiBCgwM2nH6bwnDxL
         Iv2VT5MZPCGpR7Tz3oOfl/N2NXZeboPPvAH0ZY6PYsku3lZoCfni1IkteN9LEEaE+Xbe
         PgwVeKrRr86/8T68N9hKVDnPHILJqltA4YPFjPCITwawHKHUF4DHWkE0seGfjER7isjI
         MYY7c1riSOAQsL0nmc9tOiwv4wqFFR5LoW5g6/jduQ+nOONz17PwgfycDwxTB0s6M3jo
         bnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784909228; x=1785514028;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nhf9VFdcJj67d9mnRhCsj+1NVc5VUfS8waKbVdijXcw=;
        b=avap6z47X4nMbjuERWFrRiODdL0TTEYYE9knPPfPsNz011lqDh5Wuv5pQQmOJuqysU
         0v2Jy70Ch9qdvHLg+Zw9gUcR04L2yGi2WkDblPGv3dyh4h3O9ApR0qiNuXUpT0MXN5XQ
         bdXltCxyngjhZWJrZ28NGKu//l85QxLuaDaZFPjcii1xTCLO8ms6hx5RxpfMABiHKamz
         B0ZXjOl2KfCQbRM42dVuqvUSMMM8tZ5vay2WHqaPJ4yf2hcuREYzcv43/asYeKOrRAdl
         X6BHhJdlwc8xvAcMYZq7jKaqMnfWHTVmPuo2/2i9y20RmGHotiDFm2/JOHRT/53iLRAD
         HQtg==
X-Forwarded-Encrypted: i=1; AHgh+RoWSwtbFmMsHBig5S75/NI7HL9bPjIf/MAmisUhguAYc58QCXBE9RbEAvSM/iM1ltH8teJsfgdLEQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpG1eEFJKben7vFX3H77cOFb5WoOwINAAcl0YkiwbarBkEsOHd
	0aeIfzJIZdNMPcvanEBGjxFzDlHuCNqTMstXCdtP/eYsiyJzVSiFvaQyncZBdgk2EJvlxziDLjc
	cKtTS
X-Gm-Gg: AR+sD10s7cllkB19ZVs8SHJPy6JUcqQbaVmAJWwxsAM1qnqvJiNcrWQSUM2l1BGOItT
	wlH3Agx7RdK5F+WASUMlMFadeM73nA/0bHkO35lY6lRN3Lunvy1izi9vi5Wh21zuibJ5QjyFB7l
	OGjGeXAGMn140AREh5bTwQ4sBXQbX7RswPKOSJckx9Hy2d4rgdeNSZa9qneZdfvioEl9Y1XbqU+
	8GlESs7voAeC8RYehvDZLssOS1Cw6vnvCbq2FZGdb+Q94UT7//t9qjyf8A43vgGQOyYvuVhqfVJ
	b0jQR/x9kFsOQS/pXgntijrMCifudJNWl2oapn1xKjesPI1V4OE/LgHMU3H7GS/K4zbtx5lscPi
	LEiM1CkBM/Neun//T1yowNKQ3fxj+j1gBeZU/iGE/dVTD1Y9+9xE+qErot2zZck7bnOULoWasgx
	B0
X-Received: by 2002:a05:600c:47c4:b0:493:e983:806e with SMTP id 5b1f17b1804b1-49573cb963dmr58020255e9.3.1784909228253;
        Fri, 24 Jul 2026 09:07:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:cd72:3055:a9af:4365])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-496b487a3e5sm734285e9.14.2026.07.24.09.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:07:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Brian Masney <bmasney@redhat.com>, Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260701-a9_peripherals-v6-0-9630f39879e5@amlogic.com>
References: <20260701-a9_peripherals-v6-0-9630f39879e5@amlogic.com>
Subject: Re: [PATCH v6 0/2] clk: amlogic: Add A9 peripherals clock
 controller
Message-Id: <178490922597.2801722.3885834711328764674.b4-ty@b4>
Date: Fri, 24 Jul 2026 18:07:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Applied to clk-meson (clk-meson-next), thanks!

[1/2] dt-bindings: clock: Add Amlogic A9 peripherals clock controller
      https://github.com/BayLibre/clk-meson/commit/33972977d632
[2/2] clk: amlogic: Add A9 peripherals clock controller driver
      https://github.com/BayLibre/clk-meson/commit/f905fc7b7a81

Best regards,
--
Jerome

