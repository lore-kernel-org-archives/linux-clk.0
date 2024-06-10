Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AB474C1B
	for <linux-clk@vger.kernel.org>; Mon, 10 Jun 2024 10:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718015559; cv=none; b=Px6vlpUiQJUnrJbJf1aE18ClvDtD97qptNxmI2QqEOAtpLGS6RezhbvIeXcGw4ZcvYIxJgD70uUPPrSX6yW4mc4w316nFwf3TPoalj9I0a9HGacW1SC2ClY6H8kRP25Oar6KOrsyfmuFfs2484/hdLHJ2L+KzlvrCWQtNPKxoy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718015559; c=relaxed/simple;
	bh=OcNCNxQjyElxIcrEZhK8KOZ1sEwgrkb9YkFTm5vr/ks=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=auKGWwdowZ/Jk19OSTlbAH9SGsV3Q8q5p99VpG1Qe5511a9kkRuLqatb1va0/7Vcqdm5xkR7oA6EfyEiGAKiATnjqJweoQqz7I86UVmPjG8+Z+jAQpMj8Q9Mt99PbH0gzcyQWgDELRIRr+R4IcIaAT0rvcSWOM6RWgZ4wjxeOrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FpdsPS7Y; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FpdsPS7Y"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42136faf3aeso25260105e9.2
        for <linux-clk@vger.kernel.org>; Mon, 10 Jun 2024 03:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718015555; x=1718620355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXXg9qprKu/qiLNvKW8mzWq7DARUrTSzjJdZFxDwHKA=;
        b=FpdsPS7Y5OZz7a0VchLZejedd5yprC9uzWu8lo54DUrS5gMrgtPu4pKm//9joJcbHS
         +ZDtu3sN98Kuti1EFdNbil7xNyFfsEiPBEEHBKaqiADW01rrCNB3TKPYgMRMt7d0mMIw
         WQd9V+H4EViTcxiS8IHPab1CeE49QSQqFoRh/DtMdkKvA9Z46UHhnL64kRXYNqQ93Rvx
         G5b0bJg1v14Rz90O5FD1MxaudpIchkyMtSNx9dykFgmiQgwyTteflPkUWeznXPL838BE
         cS6KcDdyZw1uRpSYUntiIJ08dzTq7f5cth/UcYF3eM/gmYJIfZucrBCU3f+Aml6AniZq
         KJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718015555; x=1718620355;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXXg9qprKu/qiLNvKW8mzWq7DARUrTSzjJdZFxDwHKA=;
        b=EQWAoAFkzIRkXMTngJ2jLSlLQRjSR2V3JfiBkRPQ1Q9t+kaKHNjX6/hFmFI2SPLADL
         uupi3PZgKJRHEPTzMP2tgKQ5TlL6ZuVLznw1YWbKjcCXDeb33XJVV4yQ4H/t4v/a/bss
         CYHq1TwyWg8G+dSynT/IUZ5sWSSdzFUWaO707dPB+LhY6BYFnQEVKeyTqDID0pad6T6i
         9c4rI5vpPGjZCe7Pkm7uyirrTeuC0EvPWvZwLMCPh0Pxr1+8VieKVFy4FFqSRZUP26c5
         hiJrNUHoSVI0SyYCU43AXOTGqo4G29t6Q5w7bDnAydX5VvTXUWNed2l/vQpXw/KqGYU2
         5cqw==
X-Forwarded-Encrypted: i=1; AJvYcCVxOE+GbD6ml4jn/5E8oa9fUm8u9QC/a7LR+Xg1Z99HlaCdQ3yaxszY+Pot8K+R1VzVmgnjsrL5RCLf90y82nJAGwCWjWqiy0W8
X-Gm-Message-State: AOJu0YyJKk3GofvRIhyaqOVRZdcEFFPL9CRN5fsXrV2d+rmn96CneXQM
	59Y+/0F4gkwLLMohTZ5mg0QTHqlhP0490E4juxr/EKzpQ7gB42BoXUAjEOrL9NU=
X-Google-Smtp-Source: AGHT+IE+UMWspFxOkW0VMFhc6ufITIhWfVtf8wdrgpK/+aRYj657WAU4bd9S2VLhpwjXlkDwo9fr4w==
X-Received: by 2002:adf:fa4d:0:b0:35f:18be:227b with SMTP id ffacd0b85a97d-35f18be22e2mr4263828f8f.14.1718015555378;
        Mon, 10 Jun 2024 03:32:35 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:afd3:66ee:5486:4249])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-35f2774bb64sm1136213f8f.103.2024.06.10.03.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:32:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com, 
 martin.blumenstingl@googlemail.com, 
 Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240515185103.20256-1-ddrokosov@salutedevices.com>
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
Subject: Re: (subset) [PATCH v3 0/7] clk: meson: introduce Amlogic A1 SoC
 Family CPU clock controller driver
Message-Id: <171801555454.91134.14151750531513287014.b4-ty@baylibre.com>
Date: Mon, 10 Jun 2024 12:32:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

Applied to clk-meson (v6.11/drivers), thanks!

[1/7] clk: meson: add 'NOINIT_ENABLED' flag to eliminate init for enabled PLL
      https://github.com/BayLibre/clk-meson/commit/d4c83ac16c65
[2/7] dt-bindings: clock: meson: a1: pll: introduce new syspll bindings
      https://github.com/BayLibre/clk-meson/commit/96f3b9787363
[4/7] dt-bindings: clock: meson: a1: peripherals: support sys_pll input
      https://github.com/BayLibre/clk-meson/commit/41056416ed53

Best regards,
--
Jerome

