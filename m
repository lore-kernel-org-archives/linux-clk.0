Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416BE25BADC
	for <linux-clk@vger.kernel.org>; Wed,  5 Mar 2025 21:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741210953; cv=none; b=b2qFww7G9h0M6hwvCyBEOVuW2OeWdmCcODO2wjd6ZpaJkre6KGPS820R5sIrux0hEy4Pur/nMWzaCYMhSSZ11BuA55HF1R/X06tQvxlO8Q9bLBMsEvByrKVZ+vXM6GB/UUFP+78g66wKHo4H57lXIRNNP/s2fMuTWrEuBp3A8DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741210953; c=relaxed/simple;
	bh=k2uk7mWRxQ/F2xpJkIMGDONFAxPuJRwjbtFcXicz32s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EKJJJ7n8Us2pIEHKhqTEXxyGIzNla+nRTy2M5doeB/wEK5QV4kW1h2N00QyiptveZ1mgC65LkhfDHi/DBEQNFYqDxv+7x0hPhnh4/TmrUnkHPLZ49y5lSbW8aprMe83Pxt8YuWx4zGJA0MgmhzOrL7UQYzRJPZ4EWp4yKO6d6AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EOgXLIQV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EOgXLIQV"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bd4ccc4c8so970215e9.2
        for <linux-clk@vger.kernel.org>; Wed, 05 Mar 2025 13:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741210949; x=1741815749; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dx/4ooZvaFT+M8KdTIK1XiMnsARRScY2O0ollC2/tl4=;
        b=EOgXLIQVOlKM0QdjNXsELshgamiKFqqQnMakcA9QGr+Gy/Kw5s182dLz6cpL8G3rWR
         kyYgi2ZolalWay21WGCJ16KBtWE4eteeARQrI8AbZGJuGiGED3YX4zsjJimHiyk6Jby/
         dajVr0C9ZNC1WKOTzqagQVyzxyKhqqKHha4dYEigpePVvLiCIefoW2hB4t1sLCN+UBuc
         pBkTQQ4xNxPfW2pPB6+bkt3Z3Xt/GzOaSUyr0pdvORFzsWBs7dAgLeeLA3Y9m/iaHBW8
         CBTa8aCjZPq+3hk4Qc9ejn3fbyMc/RqBvUIyJYYPDvBqrmlGlmthkUNh6aohOS/3r9Nv
         52Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741210949; x=1741815749;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dx/4ooZvaFT+M8KdTIK1XiMnsARRScY2O0ollC2/tl4=;
        b=XAbHTdDdOgKAk8H8GbbWUyuErACOHgERyLOFf94yVBA/zFGrHWGC9qPITnF1eoxIy/
         Jm7rZUaszx3pDMq2UuG7vRDN07mbMCy0RcgaNlx9lBLmPTTSqePcHD0d/KXqpnw8HFpf
         Gkkvk2CLpNRzoaB11PgWM6OVEiYUvt/6CE7h335YUB7+meptyuXNRhO48CHjqEwIpNV7
         3FtAFTi1SkYyme3/nVnashMEia0mbgRWTLB4FQaMHe66DVYnv25grw7jL3+K1G3BLOqY
         LlcYL+9fFpBEVAgHEfrzfYES3NjqQNA1u2LkiCK2Ps3EkNN1/ay6uUQzRMWVhTeorTXa
         2M3g==
X-Forwarded-Encrypted: i=1; AJvYcCWozx2FqNmhwgd7qEhM8P2mEak6CScZCNhSca5ZoSaNLf3YkHYb1mbXpKjoJHFaC1mH1rcmaJubLvc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Zet1CbsH0wp4/UJZpoAeMUJo9agMAkXoyATcYCn3vu2rp17t
	Jf/sfVQXzW4XAk8rUOdBhYyeig2u+AiqomoqlZTnOPuTYsNAy4Lgh41Q+2bF4g4=
X-Gm-Gg: ASbGncvsybqAmUdtwmHJz9pQK7/UIja5X1ULfPXg6g+mWJqeXCxPkVztqpMcFsbM/N7
	f2uOrLiT+QthQCWFoVGfJNZuHxx9Hfk2Og/TpLXCq6ZAzH/u2xu5WKI2eRF8npG5QzWylaVqvrX
	LqUCBv6zD1ujSGoLevV/o/oymMLlb2+PX41+0czFMho3tA3Kd9UV8Otw6CFcohqGZYw4h01y5i8
	pM39pMI8nv79yX4zybNNsXbbO5+ZSQ3Rtw/pfmE5cNy3suj2tZzJqQnmZUmo1x1PU/CnQ3YBVdo
	zZoLgtFGyNwjqLxIeCXXd6tddybhOtIOer4fUf6+5d4e1P3bcal9a2ltRKFC
X-Google-Smtp-Source: AGHT+IFREm+ICSfjlEdNUiEPLWcefl3c9UzEK32TYGiThbSwcX7n6Z6/6dtE6UPv+HGxobHUcMeeDw==
X-Received: by 2002:a05:600c:3b03:b0:43b:c0fa:f9bf with SMTP id 5b1f17b1804b1-43bd29d536amr13669625e9.3.1741210949411;
        Wed, 05 Mar 2025 13:42:29 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd42c60c0sm29215565e9.22.2025.03.05.13.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:42:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/12] clk: samsung: Use platform_driver_probe() to avoid
 __refdata
Date: Wed, 05 Mar 2025 22:42:01 +0100
Message-Id: <20250305-clk-samsung-ref-init-data-v1-0-cd144b4fe31f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACrFyGcC/x2MQQqDMBAAvxL23IV0q4L9ivSQJpu4aFPJWilI/
 t7Q4zDMnKBchBXu5oTCh6i8c4PrxYCfXU6MEhoDWertzfbo1wXVvfSTExaOKFl2DG53ODzJB+q
 os2OE1m9Ny/f/nh61/gAXaDbdawAAAA==
X-Change-ID: 20250305-clk-samsung-ref-init-data-6b2cd242409f
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2492;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=k2uk7mWRxQ/F2xpJkIMGDONFAxPuJRwjbtFcXicz32s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMU46xTOaW9Mx5SvsNf8OBwaIINAwGWUnN5Al
 LJJACRkiHyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFOAAKCRDBN2bmhouD
 1yQFD/wPvK/fXWfnFoQ5KzU0ZRW05q3ts2QXZIiTdKGXLc3CKntkVUH3UZpKlMaQLC5RriiVn8U
 sfrQPgin+l0ndNTJJLVgmCKzVjM3wHc5ILrf3lcDhQ0iA+89THZ3YErFGdM5YU4XRZswaGU8rnb
 W+Jtd8Snv7xPCokt66TzH9oUWuenh3INTE9FA9xDwNNhHsWjBpHgbHD4JGcXut2pIEkbwuZcDZq
 jf+maGEGE4nDmySK+XWFMp3oGrj3ebi1Yl/AKluuB30J9azwIfRQ9ghr7S/T9deCb2UHtwljOzf
 NzPdDZZc9VDcltu2AY/UqPqIskoeWjY82WaFG8QZ1StijOsH+JjWrYviMTfJoMBGkFAFLfNJJAr
 Is6EVr1xdlnZNHCPTJvuAtFz4FUgI31tlqeiHZgRKxlSF63ptFi5DDXXr3oaSTg48m1EH7TQMyQ
 8TM3ShIGMBBY1XOxJ2v+dv7bSqgID+TIkGRO4ijaG7QpHwIlclk7zQzzVScV8bZZBaxOQtYyrLJ
 xbpawe4TKVQWBI/Qbe7cQeFXhN2y1YjyJPQebLLj1W0D3R65SBCxyb9rvd6VFQUqrDOyThS8DoW
 UiN9gj8yNwhyDb/Vn3mkmtAKa3+TamDjU9+NiEw1n8/+2b2Iepw2qpEeAsT0jWBySIzk2r+4xLp
 cJsLzmI9I1xXJJw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

RFT/RFC because testing needed. I tried to do the same on exynos5-subcmu
and it caused weird oopses which even KASAN did not narrow. Probably
because of multiple exynos5-subcmu devices?

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (12):
      clk: samsung: exynos2200: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos4412-isp: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos5433: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos7870: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos7885: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos850: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos8895: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos990: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynosautov9: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynosautov920: Use platform_driver_probe() to avoid __refdata
      clk: samsung: fsd: Use platform_driver_probe() to avoid __refdata
      clk: samsung: gs101: Use platform_driver_probe() to avoid __refdata

 drivers/clk/samsung/clk-exynos2200.c     | 7 +++----
 drivers/clk/samsung/clk-exynos4412-isp.c | 7 +++----
 drivers/clk/samsung/clk-exynos5433.c     | 7 +++----
 drivers/clk/samsung/clk-exynos7870.c     | 7 +++----
 drivers/clk/samsung/clk-exynos7885.c     | 7 +++----
 drivers/clk/samsung/clk-exynos850.c      | 7 +++----
 drivers/clk/samsung/clk-exynos8895.c     | 7 +++----
 drivers/clk/samsung/clk-exynos990.c      | 7 +++----
 drivers/clk/samsung/clk-exynosautov9.c   | 5 ++---
 drivers/clk/samsung/clk-exynosautov920.c | 7 +++----
 drivers/clk/samsung/clk-fsd.c            | 7 +++----
 drivers/clk/samsung/clk-gs101.c          | 7 +++----
 12 files changed, 35 insertions(+), 47 deletions(-)
---
base-commit: 7ec162622e66a4ff886f8f28712ea1b13069e1aa
change-id: 20250305-clk-samsung-ref-init-data-6b2cd242409f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

