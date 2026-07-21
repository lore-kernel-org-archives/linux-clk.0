Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1F43FFFAB
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 02:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600095; cv=none; b=VcIFPI1DPqIHA8Tl+jWXWSiJiTw9NbB3a8DJ+nWKtnXdN7aVROAOo1GLJqJgXDbypZJao6RzlocPvilzJhQ6Y1CmcSNlWV36YT6yPyG0a6qlzi9IQnThuIZ3vEH2tZlZ+bIrONdDLF7ZhoNmJ7zhmiU2j0EgaLM+7VHwNHto1xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600095; c=relaxed/simple;
	bh=tTM7ZUO5l79xlSlAd6AQmfbSdjjCjN8UgweVaG8QZng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXwPEF+rXY1T6jUQtLHxuObvORTrCxQr7C0qG7vVI+8ykw9TpsJHOT0pgcZPny2DoE8Eg45csvPExygR88OueMRGLBo3mi37A/8IXTnSSKPg0TRyzNmQL02xyJwIEgpk6n17EHXvBA+BziicIyzwQXPaOMYRLnwI8nbbmmUYdw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8iPzetL; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8iPzetL"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so4736060a91.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 19:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784600093; x=1785204893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6qD1eCX8UZOQGibHra7bJn3ga0Dq+Abt2SRuAhtEeA=;
        b=m8iPzetLHIZHb3hYWgzVGq5Ilpn0rizK11Y1TlMJy35+vSkmiDMAsDLsMCqEJFGZsH
         VfggjzBz1caC67KNOaBT2ZdkdVKk9yPrh/SiNbB9jsbIwtdZoSbumJIkhs0RKOK3pZ4h
         DjiYMUhfPwKJ46wAcP8G4Z9xbIRIMa3/I3z3mGwgP4xibCZowPJxPZ0Dyv/c0MdGG+we
         EXn8Omv7wn/m3TtmK2INeL0mZNlJCCEEjh8JQom++/TJXqSz0aKkYfGi11koAah6NyzR
         tVndwledBRj590bbv+ir+BK/cnjb45jSyis2XtnjAfHyRuyy46hpQnIy7vxuu6CxbCjl
         2eBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600093; x=1785204893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z6qD1eCX8UZOQGibHra7bJn3ga0Dq+Abt2SRuAhtEeA=;
        b=GuwW3vUB/sGLOfTDU7s65P2USLFHXkCA2D5CRctA4mgHIGnyp8Ul5vWHacEr+gWvxc
         qelYMmrlVQtRRrKGMeknRSZUCjLvY0kChPpXeSNftw9vuMvEEsVMAP11rFrGeZs7sC+j
         xPry0y9UAnq/A5fCwaw0m8XZIYRs1eZGogpwGN5TcML/vK7kbHimkJpbJZO2V56J0yUU
         XbnSxsNiTNWy+9WSmFx8+R2e+uRR0IBjERaf1RozDC09RZYyW2O8sWGxBi9vmSyNrzjD
         GGeVtV2Hkf+opuCqSst5rXrHKjshVQe8DNLS1Xl2IHOvrgr+LhmsWA2wPkKXDKPiKEZW
         0iGQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEHoXGZXUWOywS5EyjQaEjK57OqeCaPj54fbfLFIBZ29ilpkViZSpO4qfhJLhS5ymkPSl4aRHED9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRSaC9cWLWYs2V38eE2NEJoaWcWGouFGHa8uoiDII+LY7n5bLm
	pX660bynUELxrJjczC6tNRIJ4zqeRUMLvP7F2zdaCGsAsWnyr9tNhTHC
X-Gm-Gg: AR+sD13TrAYlO0uSarjwkA/jWbdiuSsPCy2Lnvmg0MqIJSAeM3cZ3jYTkfwTlf2RrXX
	2i2fvuXF9usihRLoeaIb8Xj3NCZWkpmFTBYBq0FUPcGiuPNTvSjWauuW2ojSkE9yTNN/XtQ2FaA
	AOtxbbzHVZLYxbh7xWBa086h6jrNu5CWN87oCFjFVwOuJJj15j67BwJcbtSz6fM7tsj/VkF8Idv
	WG3Na09eMRDV6p8SmCEzh7Uv++BvfhrBSzDqKDFaPGFQt2uMeJXzoGxxBOY5eJWw8Xu5ax/0ybR
	D+ttznv3CBlV1S3LR0oss5NkpUXXmiWBdNnNMbeykh5gF7+2Rz1tuIsRbQ6rtMo2gwP5FJxnljb
	nmyz+D7pFruTKCr4RlHvUTiw3cOATVkMo1+oL0DtOoYbuIOkXu6u5db9D95GzEZch6mpmtCUV0y
	7i9ZcQLw2n2bP1ijClMHILnPpzW55a6/2U2W3ndLyebSGRUbf3LstnJkxt9JqnlPM=
X-Received: by 2002:a17:90b:3ec7:b0:38e:cb1:8ec9 with SMTP id 98e67ed59e1d1-38e4b585bfcmr17200761a91.42.1784600093473;
        Mon, 20 Jul 2026 19:14:53 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9235a4dcsm586241a91.12.2026.07.20.19.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:14:53 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v4 1/3] clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq calculation
Date: Tue, 21 Jul 2026 10:13:54 +0800
Message-ID: <20260721021356.288506-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721021356.288506-1-a0987203069@gmail.com>
References: <20260721021356.288506-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

div_u64() does not modify its argument in place; the return value must
be assigned.  Both ma35d1_calc_smic_pll_freq() and ma35d1_calc_pll_freq()
called div_u64() and discarded the result, leaving pll_freq holding the
undivided product and thus returning a frequency orders of magnitude too
high.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index 4620acfe47e8..bfedd45bd04b 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -92,7 +92,7 @@ static unsigned long ma35d1_calc_smic_pll_freq(u32 pll0_ctl0,
 	p = FIELD_GET(SPLL0_CTL0_OUTDIV, pll0_ctl0);
 	outdiv = 1 << p;
 	pll_freq = (u64)parent_rate * n;
-	div_u64(pll_freq, m * outdiv);
+	pll_freq = div_u64(pll_freq, m * outdiv);
 	return pll_freq;
 }
 
@@ -110,7 +110,7 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
 
 	if (mode == PLL_MODE_INT) {
 		pll_freq = (u64)parent_rate * n;
-		div_u64(pll_freq, m * p);
+		pll_freq = div_u64(pll_freq, m * p);
 	} else {
 		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
 		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
-- 
2.43.0

