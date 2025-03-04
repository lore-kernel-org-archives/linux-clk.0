Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398981D63F8
	for <linux-clk@vger.kernel.org>; Tue,  4 Mar 2025 18:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741113945; cv=none; b=KLeMMSPLWrACQv1nqLiIi28xhwWEiyFjn6WKfsB4AIqme3icaaetChladM/6QhJc5q5sLUGx/HmaK9MbQtyzzXjWHVxJQw64npFyI+Te67FfKz1oZmPf6pegDFwaAhmoaDECxk4uk4DqdSuAK6Nlse/aggGQi6YNv0zRVlQxO3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741113945; c=relaxed/simple;
	bh=XDngEG8wtWQvhvF3YrSeK4X7ZGTxQunF/E8GOiLPgSs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q6cJckTAHbYEZQm9l1eFZ03d7s9P04mrSicKDAxOvIO7FnXSBcPaY23s0xBtjeRFaRDlei85vLUZQuedmE5yFsIiT9DLjQ0YcgQCphy3Ojky3xY1z4TD0ZSe+j4zqEU0DHFywk8oKAK8gC06kecc+sWmwFosQu7gIA8eGFA7dL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OIPEEtSv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OIPEEtSv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bca569b3bso1858995e9.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Mar 2025 10:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741113941; x=1741718741; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dV66bSO3p7CPdI7VDIr32ThJ93exQDdyBO//zJP39OQ=;
        b=OIPEEtSvjEQKYEN6lP+MhnXchB3yuqvbxZuw+yyV4qZjZ6xywmlYzIWfEhreHir16N
         ZlkN8zhxQ2HYkr6GklDcABX1KSsyQZ6BcmePPSpLXrZKNIeG4m8Q0GETpaQ9Mg+ZYdYU
         kHF0KF0f1E5jWgMtaXFPA1ebyVwRXgFd0yD+w7aU+OLN/r4n/m0Q/eGHABqfnw+6zEwL
         AaodSbg513/2rY2e/Rin9VNA50P5kOClNpkP5i14cpF7wzfzICKb24nFTeuY/jCOOqPh
         YyeT8lZrWpUPF7fmJSY9Z/Egz7L1Xd3hdJXrbRyrYm7bqW7SLOXE2548DLBLDCeSrNuB
         /9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741113941; x=1741718741;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dV66bSO3p7CPdI7VDIr32ThJ93exQDdyBO//zJP39OQ=;
        b=sWgySUOnrmsv0uShj2btTkKesEF9xsz01qGTNQ46Myt5y0dOzUfCwXy18mpuN/TAu/
         8ZekdaakSH4lJRENp0kr5Oql2go5Z5IErMNveeo1mM1fGxIf8vRNd14QKuVj/BOYGOaU
         XXUgWqxFYUOjcic1dJW9b20SDH9PupHLO2MTDJgueKUBGNiKkWL7kM0QQTS3e4Yv4MFt
         THtEujphxVTzrSjQUd0AYGIfsbzsnSKWrX96XUVDymbTvEEUOIDPSf+HdBlOlw5ucws3
         2xPHCL2WjIELz1aGsiza7S1KeCitOJeg9B+bsUyjb314Pdt8YZDWQ3WO8d8ejv9mGMV9
         gapQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKJuV+KD8/Ee07gpHvxdrR/De1nriPb84tg2y1WTaXxNqg9cNq5/RxbFY2OpwDfPEWfbE7fpk0qqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtZQiyheQ01IriHAyrXjYNKC5+2q0BFeydlJQGjpLexzgpRS6O
	ovJzB1+y560ODMMl7A3RTAF5qAJ24KymE+1245N2kWu7TE6JqwDpE6R0x/rlVGo=
X-Gm-Gg: ASbGncuD1leUY2VW1n/H/DLPN9hvw1opujgdvnOuMuCR3ceswzzHszgUekgZMMO1IfQ
	BTa/SQ5YY0fgaUqulsw1gT/sn9A4P4noItvpLx3xFlR/TvoH5GDC84qc9t14jmx2n/mIdLw7Xmt
	YCS4xmf2XGPN4/63bFvCh5JAN+7gkZT/aaMGXIqa0S6JhYpOLvzpyVMr+yFVWKfjnMK9aarjWsk
	620QjwAvsr9tt61DrGHYP7mPI+xivS9LGDHBP5iJPBtOujy7ajpz0sCDNQK8v/oV/UY4fGIfW4t
	tc96RunOKg6nGNh0P1lBJhVfXCeXvjqbjrmqlWAJl6nqqScEiuwaXA6ftjNp
X-Google-Smtp-Source: AGHT+IHswIEyCJXZp7woYZZuJpnAXAHgU63OvcCGWQJRtFTY7jo4WjlXR0PIT3yu2UR8Js69fWovDA==
X-Received: by 2002:a5d:5850:0:b0:38d:e0ee:bb8 with SMTP id ffacd0b85a97d-3911641410amr1370787f8f.11.1741113941249;
        Tue, 04 Mar 2025 10:45:41 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6ceesm18229985f8f.45.2025.03.04.10.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 10:45:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] clk: samsung: Two header cleanups
Date: Tue, 04 Mar 2025 19:45:30 +0100
Message-Id: <20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEpKx2cC/x2MywqDQAwAf0VybiD1TX+leFh3owbtVjYogvjvB
 o8zDHOCchJW+GQnJN5F5R8N3q8M/OTiyCjBGHLKKyqoRL/MqO6nWxxxYhc4qTl2cVvRU9O3IVh
 YE9hhTTzI8dy/3XXdYx3eU20AAAA=
X-Change-ID: 20250304-clk-samsung-headers-cleanup-c07b8dd50360
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XDngEG8wtWQvhvF3YrSeK4X7ZGTxQunF/E8GOiLPgSs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnx0pN00BqtKjo8GLAIBcX4Q9OtViT91hhZMDba
 VZfjobaseqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8dKTQAKCRDBN2bmhouD
 14bHD/9SLqOUAS4O36jLepNIa7itVCkJE3SddDL/7+JXCH/HT/7ForYiv2Pw5ZCaP5FQHVs8rXv
 j8Wrrkh8F7rt6Io4KRK18qE84K4JC8GwEUCvG+TmryeajaUS6vg8ElbZ6zAHXeLIneWknMH6JRO
 xtciD4Om3JIXD0eWluwV7ZAbi4DYV9jhxZcY5YwXmJI+a+VLCbDSkhaJzKl/fwZO89r9FqXgpQb
 iJyp2P+UW+Wb1PyC8ZAJw/3a7V63Icadc/mzUKTiAQEqrHcPtnu2B8jwacPdrlo6bMuvT395Dq1
 odV6qdKw7WxIe5WFczs6dPRsn9HIOqMU2xKT4w9nkCBzBfTbR1Qqezp+DwcrYRTiNFUAaJeVF3h
 FwZ56GXbkyA+VtPJ+TqrLqVesOupSNLGsA9iNdxC1DI87ppon7f2/dIWNczjUhPAfsEdTCXe+j+
 GL9QRA+3ZvVi55tIjq95uk4ewxdWdALQ2L/n/7dLD1TnhazHewO1d/vOyJa3Pywp5HqBwDSKR7I
 8Kavj9bnXIyPuZUfXzn+yhFILJkyzY69PoYcXnCKIbD2WYWgMRuxKjU+o2AU/o80c4IUc2JGS/j
 Fke330DMu7cmYQ5rJV5yKYEXJhEZnVByMY16vLOw1jYACHQ62ZLsWqcXe9gH7H4iScZtUhzU4dC
 7Rdfp5W1qrpPmWA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just two cleanups, no dependencies.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      clk: samsung: Add missing mod_devicetable.h header
      clk: samsung: Drop unused clk.h and of.h headers

 drivers/clk/samsung/clk-exynos-audss.c   | 1 +
 drivers/clk/samsung/clk-exynos-clkout.c  | 1 +
 drivers/clk/samsung/clk-exynos3250.c     | 4 +---
 drivers/clk/samsung/clk-exynos4.c        | 1 -
 drivers/clk/samsung/clk-exynos4412-isp.c | 2 +-
 drivers/clk/samsung/clk-exynos5250.c     | 1 +
 drivers/clk/samsung/clk-exynos5260.c     | 3 ---
 drivers/clk/samsung/clk-exynos5410.c     | 2 --
 drivers/clk/samsung/clk-exynos5420.c     | 1 +
 drivers/clk/samsung/clk-exynos5433.c     | 4 +---
 drivers/clk/samsung/clk-exynos7.c        | 1 -
 drivers/clk/samsung/clk-exynos7885.c     | 2 +-
 drivers/clk/samsung/clk-exynos850.c      | 2 +-
 drivers/clk/samsung/clk-exynos8895.c     | 2 +-
 drivers/clk/samsung/clk-exynos990.c      | 2 +-
 drivers/clk/samsung/clk-exynosautov9.c   | 2 +-
 drivers/clk/samsung/clk-exynosautov920.c | 2 +-
 drivers/clk/samsung/clk-fsd.c            | 2 +-
 drivers/clk/samsung/clk-gs101.c          | 2 +-
 drivers/clk/samsung/clk-s3c64xx.c        | 1 -
 drivers/clk/samsung/clk-s5pv210-audss.c  | 1 +
 drivers/clk/samsung/clk-s5pv210.c        | 1 -
 drivers/clk/samsung/clk.c                | 1 -
 23 files changed, 16 insertions(+), 25 deletions(-)
---
base-commit: c0eb65494e59d9834af7cbad983629e9017b25a1
change-id: 20250304-clk-samsung-headers-cleanup-c07b8dd50360

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

