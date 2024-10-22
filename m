Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC1716C444
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 08:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729585182; cv=none; b=W821uQjHuLPVrfjTpWJgpzIQ+b0ZirzIa/jQACe38QLfTtUF5WATC2DCKhuXgT3sck++aj22gQccZHc2GPAQDNDNvLsICbnwHemKX69VJivsPkgSASCyPBmXgRN30616tM6AMwTbRwa59XGlJZHx0VB/nMhoyOSo4JT8GkBsp6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729585182; c=relaxed/simple;
	bh=nDEq6xflV38Oys6mIGHJEcOdSrdQnYTmfgJUgN3pu2c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D6Hgm0i7E6nFPL++qJugCnwhCppg7JB/Nf0Z20y50VcFP8xuN0+L4622F4aF8RRoqLY2Bh0f6CBGeiHc/3Sud1Jdnek5Xfa9YLjLUg+PLfi9DZE1CF2Cg58wEdJqg3jveJmJpui+NRCUSqYn+Z6fd85Stdv3VxMmZRTjcydDrQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nYfqMRqc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nYfqMRqc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso26092235e9.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 01:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729585178; x=1730189978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL7mVxMp+9R/aCr51mmHchZz4EvxpV8Oo1TSu+Ak7HI=;
        b=nYfqMRqcr8Yskxe8DXd8sKjQ/POixyZja21U/M3/b0/FNN4Bc63PoJjLwY9xs4v+EE
         UjhGwwiVlSLgNugY28fsLsYjy64+bU95FjhsgSk9P6SdOQQM1v3DlMYG/sraL2M+vUgb
         2b5mUJS6CVEhW14zZH96PLfh8kOzjGAaLb/SyF69S7E8CG0jHSRr9e9wXGdesX8B3Sna
         1wYPD81GI+lCNE83oaNmHOYW0yCZ5c2gv42qUJU2sBgV0/GhltyVpXPccggEBPaji+8v
         jN1JEPVbv96wfJO67N+P4TKioK4ruW+UHUWIg5pwi7UIU4sJpahUVZqQkGtqizHpPgos
         7VWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729585178; x=1730189978;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FL7mVxMp+9R/aCr51mmHchZz4EvxpV8Oo1TSu+Ak7HI=;
        b=o/0d8iwI6/Be315TFuorlVznv0U1Ht1AgRmM84Y0j5bK0/tsYkiXtXal273WoZScl0
         BsWl3Daph3Z3sf09yXPY+Fcx9YsGKSVLnjWkswKAb/fDZufx9VuZLQbMHtWCSqzgFd78
         4nWgEdQVcSkCSDZp3gj//JDwoZz/NXFbRcewbWLYp2s4gUPYrk/ay72zqaTStU3KPXA2
         Lw86vdD3F1mXy2SkJJGVjkiKt+viMzW0rk9/3Y5PLT5Z/TYI6gGN5G6DkFaHadz7bUFP
         mrQiB/fg3P+kj8JBa7rB/FjwdNN1E6MFVYqBIXzRmlx2LQKLQeTtMIik+WrKjFcTNu8R
         t10w==
X-Forwarded-Encrypted: i=1; AJvYcCXN/484OiuoghWhcVzwifWyjjr0AMBp3jCPMj0DcWgTeSQsB7tAB0tPpj0dEIGVTMWP5lgXyO7Q4qI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSHgEFbj5BWiZ78BDCU7q5ti0gGpwip0nOokBvTRqhxBaAfoe+
	iQHrT/8ggKqLGz0Bi7Q9jUL39lBa9nDvKOgoovn1sKpk05R+Lnyz3082SZ161VQ=
X-Google-Smtp-Source: AGHT+IE5vRD2Vte+CM4kdc57GSfq9BMFWtI/WIUONZMXx/Kfa0SAtSqvVmqF0g9m0UTtA9qWK+DO7w==
X-Received: by 2002:a05:600c:4fcd:b0:431:6060:8b16 with SMTP id 5b1f17b1804b1-4317cb09538mr14288875e9.30.1729585178324;
        Tue, 22 Oct 2024 01:19:38 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:ef1c:ae40:1300:20c6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37ee0a4b26dsm6074261f8f.45.2024.10.22.01.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 01:19:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241008-meson-clk-rst-aux-v2-1-682ab9151f4f@baylibre.com>
References: <20241008-meson-clk-rst-aux-v2-1-682ab9151f4f@baylibre.com>
Subject: Re: [PATCH v2] clk: amlogic: axg-audio: use the auxiliary reset
 driver
Message-Id: <172958517664.9195.129752834617236997.b4-ty@baylibre.com>
Date: Tue, 22 Oct 2024 10:19:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: amlogic: axg-audio: use the auxiliary reset driver
      (no commit info)

Best regards,
--
Jerome

