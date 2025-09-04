Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD32200110
	for <linux-clk@vger.kernel.org>; Thu,  4 Sep 2025 16:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004423; cv=none; b=knFecmQoS2UfMDI+cYG4xVyB+sHWHLsftIo49vIJBfTv9gh+8VCgERVE0jTZvnrP9UYr5XSZ0fAymnRIEJWNUts/yup54aF9Q3f5oluxO/HkpgZGItW6KVs+7KcMWseahLUH9Cpb9n/0no7Mgnxq+eWO1AAbcVFJ/AE7R3H6oOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004423; c=relaxed/simple;
	bh=XyYgBJVgBAsJN38h3vgYTMUi63M/my5o6qAE9zBoffM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TmPyo4cPBLfQFKrPrPv9u+HExilVNYHAp8whBEJ6WOVjcIgKE84e95DbpXXZSYHe4AUnB9DI1LQgkAjlSftKav9TlNCSjFZOk+O0yEWnI6fh4G8xBKeIi7xpkIlQ9jlLhovUUqQUM4CNqxZQCDZbEowSrgeqtjt+RXpIFSXK5qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kgyaR8IP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kgyaR8IP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso9296575e9.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Sep 2025 09:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757004419; x=1757609219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/WLNsuxQtqsn76Kxw2dv+Lj7uczL3CnU17b0jUez3A=;
        b=kgyaR8IPxn5H+0BryabHkpZiETtEngos2DtgPQZP4Nqz7ktaT/7SAVL+3Nckd3T7sL
         tamIJ3BAR8Njz63x0yf7d6NdPk6za37X+yMFY8Y4dlQ9M67x+Q6lufy/1WSwqs98uGg7
         kmrmTdl1Fn+WHxkC22+nG+l3arD/UywZja6xHoY6CIYpiliMjyzF8aju7S0hCwi9A6ty
         OWo7cAB2IssKBYJ3U2QFogLaYve5mbnI1SBPkv6Beg6E1AySz4XgFbJJJMt9uCJnhtS1
         6kQ51C6Qe43qpFW5MlNGqkDV8Y9/ceQO0U4S5S/WwNvCTS9sx0u8WEkddLjnn8cJ75SQ
         n7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757004419; x=1757609219;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/WLNsuxQtqsn76Kxw2dv+Lj7uczL3CnU17b0jUez3A=;
        b=ACiUxHcPiNsueGYdFgPEQtY1sp7lmxC++2jrQsgyb5z708mrbZQNR5r4r/ZX5Smmmb
         XVG+YManloM7rVjChRB4ZsBZ0Xb9kmCdjV9Huilny0oBWbsd23iIS2dSUJiI/0G0V1+x
         Diyz9LJTwMG/IxN+ZQ/yzQ16kTrT0ki7HaEkybIDZcsKt5moWOX/LTfcHCWYQc912h7p
         x8tnrm8GTzyBNNsz1sMsudDulF5DXCQEiOPFj6zZxszLe/GlaQIa+6IQF14NrmIfhFpa
         SYl/wGgCJGMtTxOe9LNSU9DegHeJ+woZ+oEmRakUp/PPccqrCshUam/p9Cgcvinnh1T6
         cFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKpgCgggDasZ6wSpFhtQiVni8ASpkICWELMupjORsBtSMk3CgIqEE2OUBquccvOoQ6gZdPbBZmRmk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybjto9JsBspIcHTPfircl33imSLhAV2Ao7bp5m5b5yCNCjVsa/
	diyceX2Mv6YwC4HW3ZaSqjYkigO0o+qeqv1hmiWddKfllyzw/WGUioIJxUfpXwv2bP8=
X-Gm-Gg: ASbGncuVPnP7PCXq8LqOnTYdouLs8fnd1pVQA0djOAYRzWrVvvUXQ023LzsfTL//RH6
	7wt8qz4On+p4jBue/0cO5rthEFCepyevJCcdhXi7i+W2KL7LqE/AbAlATj7rIr4mGT2i8Vh88S1
	dOs3uRhMjM+mJU79hVSnUDOWkKQL9Rfq6FrAFhlJdYtZkNy7ULt/ml4oMsEbVXUxLFw5VDp/b8h
	p/1xxYbSBby0LWYVMorW9qlEDUDbgh4wKMeysORDldaDLO1J03piWm+YzPF/tYSq2IHhdIGMG6v
	EroMlSFxLyqjw4WWFsG9QYIur59sIRdz30ehhW9KAYNdY5sACVMfoj6uIDxQtHI0DxIZZUqGlaf
	L6RmFTgfvl3yAWPfBAZvTcW68TAm6KddXjKUFVBd4sA4+rn7YRPVEer0pFg==
X-Google-Smtp-Source: AGHT+IHQrf0VDJOnlLROwb3iKPchiTJtb5FWTd611Hy/KSG8kw1XqXuDzj8LP0/63OVGDYFX4XRwGA==
X-Received: by 2002:a05:600c:548a:b0:45c:b5f7:c6e4 with SMTP id 5b1f17b1804b1-45cb5f7c9fcmr59378955e9.35.1757004418578;
        Thu, 04 Sep 2025 09:46:58 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:f602:3644:5f38:7200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b7e7f14bbsm299010215e9.8.2025.09.04.09.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:46:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
References: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
Subject: Re: [PATCH v2 00/12] clk: amlogic: clock controllers clean-up and
 factorisation
Message-Id: <175700441776.3567508.13329203268479696099.b4-ty@baylibre.com>
Date: Thu, 04 Sep 2025 18:46:57 +0200
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

[01/12] clk: amlogic: drop meson-clkcee
        https://github.com/BayLibre/clk-meson/commit/e256a6602aa0
[02/12] clk: amlogic: add probe helper for mmio based controllers
        https://github.com/BayLibre/clk-meson/commit/480197ceece7
[03/12] clk: amlogic: use probe helper in mmio based controllers
        https://github.com/BayLibre/clk-meson/commit/d7c001bd76b7
[04/12] clk: amlogic: aoclk: use clkc-utils syscon probe
        https://github.com/BayLibre/clk-meson/commit/2aeeb649ead2
[05/12] clk: amlogic: move PCLK definition to clkc-utils
        https://github.com/BayLibre/clk-meson/commit/32ee5475f7e3
[06/12] clk: amlogic: drop CLK_SET_RATE_PARENT from peripheral clocks
        https://github.com/BayLibre/clk-meson/commit/cf03071b7c3f
[07/12] clk: amlogic: pclk explicitly use CLK_IGNORE_UNUSED
        https://github.com/BayLibre/clk-meson/commit/c3f369363a13
[08/12] clk: amlogic: introduce a common pclk definition
        https://github.com/BayLibre/clk-meson/commit/aaee6f3bce3f
[09/12] clk: amlogic: use the common pclk definition
        https://github.com/BayLibre/clk-meson/commit/b7358d14f176
[10/12] clk: amlogic: add composite clock helpers
        https://github.com/BayLibre/clk-meson/commit/955e18baeb93
[11/12] clk: amlogic: align s4 and c3 pwm clock descriptions
        https://github.com/BayLibre/clk-meson/commit/9bada5ff4bf7
[12/12] clk: amlogic: c3-peripherals: use helper for basic composite clocks
        https://github.com/BayLibre/clk-meson/commit/01f3a6d1d59b

Best regards,
--
Jerome

