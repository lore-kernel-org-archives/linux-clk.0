Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D961C5F37
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 14:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734703710; cv=none; b=XzNKcpSjGRlpLG8u48tMWSuVVnziaCd2JsMFqlWO9cL/CEKIEODLV0MTanpFS8bnJCiHKUR6555uWResREued8X5tUQDzodLw7Gsxv+D64lVmtwlUMesHsremfxUAXIDPuN/YFfj/dNpVoPH13GrrEQ7aG53lZNvyA26Pdiivf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734703710; c=relaxed/simple;
	bh=kdpV/1xfTuaatySHSN6ZAPx6uhpo/oA5zrymbcwkZYg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UL45GPSF1IFeIxWR2MKMb226/jszPgvtb04ZYicXyqL3ROYfkbKI8erBiFZqSDrZ7s0itS9qkBmJlqV24CrggpaiBomgF74+kVoaHlZGwJ0+Aq/jBr5arXT4RltKQjil+QpQpielWt5UOTEx1eSXiXOuck0jwRVKO0iB7GEWSWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EVSScW9z; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EVSScW9z"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385e0e224cbso1115203f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 06:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734703705; x=1735308505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2OQDSxlIjkv6IYB32QqjLNdXWxA9l5+c++JHu/xF9o=;
        b=EVSScW9zR7JexEOHRrI1rBNeuxA2pVZ5uP7IfCOKAG4UIIBxTua4dwGA1AKS3WV+PV
         H0vmXVnt7Bd3bl29OOvJvl/NOiGFKFH8IBUA2oP/faiFTbkajF1yfaWwEnow8bHgR0FV
         K4mV3s19wLEgYWqU93bJVX7xbERqcFbC+snL3Ym71k0q4Kj10xn6JkeIXL8m4T6CZlpI
         s+8ioxdvbgvBNLYyqkpgh3Y4zs/5hMG0qUi+fzocB8Xwb51gvCaw9dUF5AuOWBTrfxOp
         RSOH9ENGPdnRRsK4D2+HB0hSALj6YBRU285rVXsGR/LTo2Auf0q11NYoGB8tDzCY2lmM
         Yp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734703705; x=1735308505;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2OQDSxlIjkv6IYB32QqjLNdXWxA9l5+c++JHu/xF9o=;
        b=UQT+Y9YffPZrfj6Ux8uuzsSfitXjJkcchQWmxLGx1mwm3fxzVwNgrbXyB4dasaq81+
         kx73rO5Mhqa6vMWaMFmuEblmKmfYDUbHYFeRzOhyGOrWxf158iereMFjOIGXKrBiZ8JP
         FkRP5cm2khfZN8yrpj39OK1AF6O6S3V0VxS53I0AtuuI3b1A9hmHW0mW9fsHtqQCVzbW
         ctNp6Pv4gFonO6jFXMDc5cLzyNJeuyxSsh54K+ngeN9X9O2EYR+WRAXmJQb+J2CwrG27
         H2ThLiFkUCnZvfG5Azdp+qmG02vgsKtc/UOIsuFSKDG78Qa1jBsiOiF1JJyrTWg9erRo
         HOkA==
X-Forwarded-Encrypted: i=1; AJvYcCV4E/3zNB3xTYBqRwUoiUUwP/648QqTzPaUfAzhs0hpgN6fdxx14l+MrWOLWFnFeYHAkA+3uE3sGeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU3Cn4+olxeBI0kqteiRtb7M5ouspEafgAv3wetMt+EcTMu4Gi
	wuUFWr3+I9U3qz5OKENzBxnHFl09OrqLup6HUM8UHQRIMCPLCi9tRxauah95pLKfNcAhyhwDvHW
	s
X-Gm-Gg: ASbGncvM3tbtH3IPaewiaj6o0t3JQxe09MilPhgKWyPDL0Ktg2MzdvqM/FYvpYjHrMh
	4KRg4N1TSC8KEbeWRKiqLP6zU1zUlJ1i+LnMgHjkfmF2bF+29J5O7TAz26SW+uThMCEVjHF9DA9
	BcGipAW+SX5MDBOhohSRWSwf8ZVlFyxx5ZM0yW3MVQEqAzcCBSzDu6RulVewoRW7Va8khpRAncB
	S4aSH9flLaCSOskWFuPITThZI75ijNWse/7fDgSygGoQ2TJSkQmnLQXCf7XN0JseKA3yNc=
X-Google-Smtp-Source: AGHT+IHaVoo3sOmtyWzw4UW+4I/j953uzAjZoTRNej1wZU+3u9kyNjoPkTcRqItKHRuM4B6rwHxI9A==
X-Received: by 2002:a05:6000:1fa5:b0:385:ed16:c91 with SMTP id ffacd0b85a97d-38a221faf85mr2931306f8f.24.1734703704952;
        Fri, 20 Dec 2024 06:08:24 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c84722dsm4148880f8f.53.2024.12.20.06.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:08:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
References: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
Subject: Re: [PATCH 0/2] clk: amlogic: gxbb: 32k clock fixes
Message-Id: <173470370410.3067219.1883604095856278984.b4-ty@baylibre.com>
Date: Fri, 20 Dec 2024 15:08:24 +0100
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

[1/2] clk: amlogic: gxbb: drop incorrect flag on 32k clock
      https://github.com/BayLibre/clk-meson/commit/66eff51d972c
[2/2] clk: amlogic: gxbb: drop non existing 32k clock parent
      https://github.com/BayLibre/clk-meson/commit/1e1fd26ed4ca

Best regards,
--
Jerome

