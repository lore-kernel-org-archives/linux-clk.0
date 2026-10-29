Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278470;
	b=rwbseKduJmDoQP/ZmIyzX00h/KL0ttFFhBmAm74kFawWyTv8fOcGSn5F9Hhb0ZEAUZnV
	 c/P2uP7/lXbxu1KjPnx+X+JEdziGz2fsjszn4QEYXU8sGskGTYnXrhZfYrlakBJvYW2fm
	 YryAv8sZkKpZFhMVo2+oP5CM9hJ7KFTw7AUl++asG261vjKvtRlF3TFFlBaPvwN1/aJQq
	 FMIOJOkDnw5nMYthjufBC8Ze9az6KwhoIfBnLnEUow9GzysGk+mwApbv+7Y2S8hy7sFVl
	 5mndcWMMH5tMe8TXsl3kwPAKxWxE1mExxIoVgRFd2xBxRmTF6swPw24oRjwRGmTzGNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=3Pl5KEszsxbSEkrqz64pMGPD6Bkbga9OOvIN3MFGNLg=;
	b=c+zxu+zch/WBOFeTNFoynbG4Hw9KbpyBR4uAT24asEdqgMkd7Opt5CmRJmB+IJgGZ2Ok
	 K5oLuUucEJDvan0UhwCZXL5XvUl6Ndh72hinOZTpeSqCow7kqQU7fWpda9cSR0IFLezlB
	 cbVIaFqd6nM+HPINC1CS/mHBfBeT9XkB717TWf1f4mHwGCdoFrb/DzS14qp7mUR5KIfGy
	 u42MqeF2ZRe+YSlgZD5WoZe7Ie9iS1DL+UOlFlf+n5nYyf/8ItzhhQ+PKCqDHb/CKWHoE
	 oOY+tKipiOe8l9OIyM3uytCOqwjMm+erypEPf6af1RsVPPMg3CmOs7Oz79dWlnxlv5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="a2/GUOHg";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EA5606A339
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 12:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5EA5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=a2/GUOHg
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d885929so1610601f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793278467; x=1793883267; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Pl5KEszsxbSEkrqz64pMGPD6Bkbga9OOvIN3MFGNLg=;
        b=a2/GUOHgM5+ewuUzOwHFnVfpqrW6kglZHhsqcf0ZezD/dsaTdRQUju6f5bzdp8Xkmn
         cxiFbRGwkYg89QK6g+Meh2O3HZFHiA6OLt5ZIDaa9XKH8RB6LJFAqD2fLiZB7ujebcFL
         VSMFXkdE1trmHAMPI8qSUOV/EXtB3u/8dCfaCaltZzOZ4bfCtdVf8u/QjXUxQaTieu5L
         FxwKLuM/LgV76Q3UA5KUShW9VAC/masaNu19RTMrlw3LhtVZ6a9e0DI2cWn0C56wrfOy
         avCMwK8iGWK7bbUQxs9VN01vuiVTzkKDwy9cAh8/3QQJ+K/rR49QIRHYBZ43i3UsZ9pM
         AI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278467; x=1793883267;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Pl5KEszsxbSEkrqz64pMGPD6Bkbga9OOvIN3MFGNLg=;
        b=NC1L0+ms0/QPrrMJiuBxJyrfkvA6CGqppZPPPiGUMak0qTDCZb6Y2uGg1EVOmLud7D
         qTCPxFPVQ5rOao0LR5Ez2v8Uz9iqIKXsuVZZV5N+Ocu8gtXGFkGlKEO0CGUjJxMStEdi
         a1+jRZSbs0Dm5QQk9UZlLAOk1dV/Q0Z/R9W8moyIB1iBwdqlfBaWYQTWZqEuHxyis871
         A4+RJHhOmyr3BQ9KGwxv6WpBxJJqFoWMgJ1LaZrksPBu5SugKB5pH1hERHLM2j/mtgtY
         FF6QUafkeQ9N/0v9YhMByFbLihdTlMxU/pD0kuQdxs8BCZWsUmEcCFEt7B+MbR8s2uqT
         9uPg==
X-Forwarded-Encrypted: i=1; AKwUvBxggw4UmS8Fnn4HRNiSj1etFrtP1izIt0IZhe56n8c3SWxFULmLNjjLRyKcVCFCayGArGF51fX3G1U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkH/yuwVqQDghEdpe3YRICbh2gJnLYFs03qsbT8Meu6N9+yoCY
	PVdFLtbQG72yykVeOUI9hfuXfHqy00gqQrthxiGOoaHXeLFFgNVtXTwUTO/IICNi5eI=
X-Gm-Gg: AYBFou0YoWGpK8Vm/r1WPmbktlEx4K+0hwE6bKwHJabMq/a/Qc523Icj6GMCSXWH4nd
	M88TnWVnVkrC09i2WKSDfkH/3GQf0wY45/8eJ/NO7pusHoxQsOxX3UDtxiyv3sDzPSojbnZe4GY
	ndO/mWnaCSKz4sRqF/GCb+4p9UdeE8IUIRfKIvZ95YtryE9WCzUzkPuXQLMYHfKZZtPdNtUobWi
	J41yAZnpS0exYp5BmSzFylpMc9vnOR3ex4eGe+RQ9pAU0GrLkkRB2zPkHlmNexhxasI0mzWFelE
	6RpUB4YLTWtMz3AojGjhjOAQsHaQIQFMG3AkaXxCRD/ybLKvbE6DJT7sB2NDamm0BkdaMb8TQnI
	IcZsE1Uvl0P1X29rnNG9tEig+QXBHkPIe9AgeXXye+H3FEpvB8nym9EzFQ5Gzwur9ijs18P/Pm0
	kUU5R/T5JI1hAq+x+nhIOHua/9LA0HfW/BU4CTg3VbzYyKA19A65ja5QZEiejhRTiqg+MhTKHjE
	/CxWWQ403q+T2He67Rzm1YvlBGq0tKokOHFaMq+lNowq/8hbnL0Sb0VhpoQ4cbN5MxSzUMvAFgq
	fnzgiRsMxpe83wit+QuEi9gZoqqCIPFuYqS25zITexXwDjCIrQsIS8nhhTstLtKQ9NTfQ8TBwk5
	g38Z1CC057cHRcmynbnDi+MAPbBjsVIONWW+owSU6IEYcB9jlRV1uTnL9peBuIGT3npg=
X-Received: by 2002:a05:6000:46ca:b0:48e:679a:4aeb with SMTP id ffacd0b85a97d-48e679a4fbdmr2549385f8f.3.1793278466836;
        Thu, 29 Oct 2026 05:54:26 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm35034622f8f.11.2026.10.29.05.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:54:26 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/3] Fix rate rounding for Meson read-only dividers
Date: Thu, 29 Oct 2026 13:54:18 +0100
Message-Id: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0K6dgwtkYgr72FYtGUKo2DJFBoJ4
 e4WvICLv3jJz/t/FQGZMIhbtgrGSIH8O4E6ZcJ2+t0iUJNYqFyVMgXmMUyMegDbv4CxHfQI7KG
 hSA0yuAqxuBTKGZQiSUZGR59j4FH/OMzmiXbarXujozB5Xo4HUe69v8eihBzsVcnS5M5Uhb4bv
 fRkGM/WD6Letu0LaX4K6uEAAAA=
X-Change-ID: 20261026-upstream-clk-regmap-ro-divider-f9ee3532fbe1
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

Meson read-only dividers can round a requested rate using a divisor they
cannot program. The clock core may then adjust child clocks using the
wrong parent rate.

This series uses the divisor already set in hardware. The first two
patches add a missing /4 entry to the GXL and G12A HDMI divider tables so
that all their register values can be read correctly.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Changes in v2:
- Split the HDMI divider table fix per SoC and add Fixes tags (Jerome)
- Add a Fixes tag to the clk-regmap patch (Jerome)
- Add Jerome's Reviewed-by
- Link to v1: https://patch.msgid.link/20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com

---
Carlo Caione (3):
      clk: meson: gxbb: add the missing HDMI divider /4 alias
      clk: meson: g12a: add the missing HDMI divider /4 alias
      clk: meson: regmap: use the current divisor for read-only clocks

 drivers/clk/meson/clk-regmap.c | 34 +++++++++++++++++++++-------------
 drivers/clk/meson/g12a.c       |  3 ++-
 drivers/clk/meson/gxbb.c       |  3 ++-
 3 files changed, 25 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-clk-regmap-ro-divider-f9ee3532fbe1

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

