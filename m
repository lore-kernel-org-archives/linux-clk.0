Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF41C12D1F6
	for <linux-clk@vger.kernel.org>; Mon,  3 Jun 2024 13:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421121; cv=none; b=SPsouEx1AY/mEYkKt0o7RehvnopNk5icQXqXlKw0uUvdvhhHA+D/+52iD0m75OuToP9SGpZNod0VVklhKIOo3jAWHcEQgrys4u9vnN8t/30njoI+oUxV+gx2UEhKmwcJ650uL3rjH4kvFlpN9gUXoAtTBrIB2cSPrftDAekyzWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421121; c=relaxed/simple;
	bh=RoPZ7OtHwd67JQKS3Bxn9QyWtOUZRPsQ7lKzHfuSPnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mSxeAx6vfLLrxTnGRvEbclqrvPhlMHT99r7khgtgfL55N+GJ18p6ftNuN6dhTM/mL75xjqhvIxACKHp7iA9kvQcv/r2rL4Vftd6PUq6kf0qORm/oVTQEn+wn1Q6sz1erooJMACcybLORfPQkfYpG3kbzlYc/ywF6PL3dB+5Sjis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZgcVGsgW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZgcVGsgW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4213373568dso22683985e9.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Jun 2024 06:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717421117; x=1718025917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2P2nwrZKdBj15mvgcJuR9vi5zzVRhf+Cue2wFYJyTjI=;
        b=ZgcVGsgW2uqA7nd6s4HgqFRZSie5quyjR95ztOnoG33HLZ8yAyPdFOja8lIrlaAmtI
         soSfzyYA6zW2Rt2RQPrlFX1etsFT2zcCam56fig7qsYsWhNEMDhhGuW/NuJ2mEWQYGr4
         ata0f5yFBk1O82LQCb4SvGkVsKdlSMg48Lx6okNsGby3s/C8PGC8KIEfFym9BAHIYDlw
         n65OQMyV2Cd6C67r3kyPr0TPKFUMDazoZtYL/2sHjXcCa31r32NhQMFEJfMa2pmMXvNn
         mXCaZFdOB+VmiwSjKJzcSffC+7NYCmmRNrkkLAgoxRetVM3dmQQlbnZ8VhcQsd7mLoOr
         TKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717421117; x=1718025917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2P2nwrZKdBj15mvgcJuR9vi5zzVRhf+Cue2wFYJyTjI=;
        b=f8uQGnySFzsuocPEIJv+oP39yYg+UKmQ/vSOxyk2h1Kw/oISJ3F00ZKP+fFTutcgVb
         adHvUZVK1Bt5GAYIFOc3Z1906aKo21LCYiUti7xDThowGeyfYNNZGwMkZXRD2+ilEUGU
         X12lFvCKxxrmu2NaHtRh3HeyG5q8p46JjtMInq2RPwTOCTg9EAs4zVB+PlhZPYozfGqj
         2pBKdSyPC1MCcAF1eMld8YrKhcrEQNvYu9uVH5Ho+B/F4gzVvzjz5UmMfjwJJU9MaxT8
         DGgdzx5tenG1hPWbDFYYNxl9Z0YXGiCjFKFTC5n2+CchuygHT8ovG6ufhO95JKryW0z0
         jgpg==
X-Forwarded-Encrypted: i=1; AJvYcCVrKl86NUVmndd20IdTee48tGuiqzg3umPAgRw1hvSe9XHt576IXzW3+WURNUzvExXpTJzuz30H6YTUO3Dvk8gc4UrUtNn1dP6w
X-Gm-Message-State: AOJu0YwPeaJNejnyJyQQeSULi22RQzRwe4lax/mdlgC9nqTP2B76I7US
	L8/1zr6OC3jo+SF7GsLII9bIx7YlNMcod3Sus+taIQhBKKgIyn7M4brV2ESmR5Q=
X-Google-Smtp-Source: AGHT+IHCoCO6DEuGsOccYDm5/ZkSHsUmm7OTMtTgMzLzeaEljHePUFoXDVgzjeY4+rVjXEay5zGTQA==
X-Received: by 2002:a05:600c:4595:b0:41c:97e:2100 with SMTP id 5b1f17b1804b1-4212e045524mr72536285e9.3.1717421117078;
        Mon, 03 Jun 2024 06:25:17 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:638a:e591:7142:7b85])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4212b84de44sm117381195e9.11.2024.06.03.06.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 06:25:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	Alexander Stein <alexander.stein@mailbox.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2] dt-bindings: clock: meson: Convert axg-audio-clkc to YAML format
Date: Mon,  3 Jun 2024 15:24:44 +0200
Message-ID: <171742077914.140081.9416853265361727678.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240513224552.800153-1-jan.dakinevich@salutedevices.com>
References: <20240513224552.800153-1-jan.dakinevich@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (v6.11/drivers), thanks!

[1/1] dt-bindings: clock: meson: Convert axg-audio-clkc to YAML format
      https://github.com/BayLibre/clk-meson/commit/23dc5f7e181a

Best regards,
--
Jerome
