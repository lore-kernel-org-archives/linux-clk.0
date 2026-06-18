Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7933655EB
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 18:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806798; cv=none; b=H1FvN0TKRVuQXx4hDvTXwOeWM2qeTAmkAXTmtg0mbVzRIlUfv4bpL8uFYh1gKGdYvuy6bGMKxWiSQjdV+ln6TwjOYpGZRdc4IqqNQRzRTx6hACtbuqM+UZkBoFvNWhey82j5lpr6tCgJQSo+YQ5UbWxyRw5yVEqSjICQSuNglAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806798; c=relaxed/simple;
	bh=b4B2aAPXjFcZm4viQ8VErxMoAUkUXzajX1LKhP9+dGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTxKipXD1esapR6TfdUt4Sqi/TI5/Ml6njwFFugqB51YjxNkEDVwDXE6DMGBgkXtEMU97AOdsFBuPJhgIcYpmDcANHFEJPBMEBTPjza0rDrkyvULqxiqhBRmtaxw1T15XpYuHDsPOWyF8q3ZGIvM9QFUEit5m80hziqybR339Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWYMJoUT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWYMJoUT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49222fb062bso11629065e9.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781806795; x=1782411595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=je+bUAIFJJ6yiVa2DEiSRqaNrFgeBh92cBnao5ZfEsw=;
        b=ZWYMJoUTdljLj9kmLpels4RuXlDpJ3sBgp8xtiE4HO6npnp9kIgnGCuNyr3Hs+Ec/b
         bdQThxXNvyOlVIo74TFA/Mf2Sc2tTGalKwCVmmfNpd+IlaVQcWe4T3H452H/FM2mn/Ep
         ieDLjLdlp03vaOQEthPQu/ZwdekZBcsvN3ogUcy2VXpY+fdWVW3+hHrkbQsO+0bUVZMi
         ArD3/9OMPMhlFzpC13Oy6wx74kxzvZGA+sZiFpasbrNib4RXB55xnwaaWisxADBBz0nP
         Ara/zH5/brXH8e48edONgZQw5JVsOSmL8vSteuyX7DeOdn1xRQFuQVyLiQF6ihc7NDbu
         yRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781806795; x=1782411595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=je+bUAIFJJ6yiVa2DEiSRqaNrFgeBh92cBnao5ZfEsw=;
        b=iSTiI0UvirbjoJAGlTvBEF5ExXAMdcDcxuTvZM8N71AsAyWADwuPlA3tZ+vMEtdLwc
         6VfIbncgvzoa/5NBEYf1GOXG8FJ5l5W2M0LOG2hkfsqX+IG40vnlXRw0DTvno6nUtqsV
         HO2d3O1v/py/8F8NH9OTXm20DlC21XxyE6sA30jiib3bQOA99oKaYkJZYFoktwkWKDHD
         Qrx7IaN/xBeZmjakLmSsGVZYfo+ibmBT5xPZDoWKk3Cvf6q9TduQFgNUe47D5k6npak8
         1HngrB4URO/seGcWxAgogc3UZmzcn8SMjIMLOqSZ5nvKg+70dWTlYyfcU0NasbjfWGlS
         Dsdg==
X-Forwarded-Encrypted: i=1; AFNElJ/Oqy+hjFpMKjb/czyu2OUFVP3ieTqX3YI20craC+cuHljnOTifEAs9YCA7xCmCZJDO+RQfdPNmdIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdQOUAQwtYtv9cAr0lZ+yhRgQLoNEKyATLMD/b5NKzvgWxgVip
	6Icm1hcfJER94+pfItwWVKZF9mGhhzB5/AyOl0Gogh4fCVymi2mEMmrmdZPVW0YhqI8=
X-Gm-Gg: AfdE7cnFRuWc/ajwqgK5x6LiryIZId7rbRelFtcC2jGHHMyxmT5QkMgjaSWpiLOUPQh
	SRjX/FHdQX4qGb450Cw199r4IyhQAy6lELdh5fPGU1qMN5fhMciizOt+sV3yUzeBAd2S+Ij5NZn
	q3zmeP7tRfB88MBxClM3otpuFtpouwXj8c/jyCnmdgLQoHlbzepvANNT90iHbaWEn2dR/F8BT+I
	HnktH54vWPdUkoFD6SI08w0q3Xz25IqyaOY7fRnzdN1FL1Xh/H1nrq1l+suci3gN9MOhTstFuvS
	WQ3wg5hDnzZ88QZZajTQz21iN+3StEEKQ8wq9FFfa7gOh4wgWPSIa7bg9KwyD0EWFXnB1w7sf+k
	M6LdJm7AWdbkybMRj6pp/TPjapfmAlLeSnCVXwzTculetWc26se0GhTM+knJ1ScWYbY0hguOqyQ
	omq6+dnnOI61gVP7hCcqr2uhzjP5Njjl08ZOQrINqqweOi5j5C8iVSL+oO5CeP3u8oIZAPrj63G
	be0a94UCjROsQsyj2LLDXno0E5mmz4TjqupAA==
X-Received: by 2002:a05:600c:205:b0:492:2fa4:2563 with SMTP id 5b1f17b1804b1-49240e9a7c4mr149795e9.25.1781806794628;
        Thu, 18 Jun 2026 11:19:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3bf7:d534:a488:f67d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-465090c42e1sm869435f8f.11.2026.06.18.11.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 11:19:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 3/5] dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
Date: Thu, 18 Jun 2026 19:19:47 +0100
Message-ID: <20260618181949.3036280-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
operating clock for LCDC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added Acked-by and Reviewed-by tags.
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index c4863e444458..f6cb8d649a46 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G077_XSPI_CLK0		22
 #define R9A09G077_XSPI_CLK1		23
 #define R9A09G077_PCLKCAN		24
+#define R9A09G077_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 0d53f1e65077..312e563b322e 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G087_XSPI_CLK0		22
 #define R9A09G087_XSPI_CLK1		23
 #define R9A09G087_PCLKCAN		24
+#define R9A09G087_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.54.0

