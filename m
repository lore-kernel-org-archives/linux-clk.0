Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06BB283FCF
	for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760717662; cv=none; b=tF4rbk8lIwbHSTwX1F+43TTH2TS2DFMmvu5T6RNH5wyYtb/CiTxhghIeepWG5T9+74Bo8s6wLjrZ7X3nwCb5rSA2FFdT/xJm/1S0413R02P8mEFy7KEf1KZhqFrlLfWAXf4bA1WOI/e5lPA4yRo8YH3mxKrFavSAdBUAIFRl5Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760717662; c=relaxed/simple;
	bh=oxHS6u7FeboNBttWQlQCkoLj03pi1x2TmYSFQR57jhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8MlGT3ciusdsvczzeRVSobVXbtE5J6mbUPnhwr11aeEDMBRWwSIGgk69UoM0gr6xdTp18KO/I4x1ylRfkb4+g0RL0fBfraMdrZO/JuPCHXYSH2/cb7OKtyyAAKLScyswFVWnLfwr8TJKJzQ3lDMcd0ghRTEGBj1kW4WdtN9mW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5H9fOme; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5H9fOme"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b54f55a290cso310039366b.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 09:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760717658; x=1761322458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/0xrgYWwbL6uDm6bWRd8Dfjm9NXSGd8s9gIV76gFCo=;
        b=N5H9fOme9RthmD+DW85Wkzdr73XsdociiRB0zb1pLi1WJCZiLY6RaDEZOtl73EV6ct
         I/udWKLcPwq+WiLhuNYtCcqi1GcNEOxIPTeDo/3vStx09k0ob4SQ4W9cqVxDI8uQKfU5
         v+R4C0TIsguDQ2eiZOzwKmjdTnXNT6xZuyrhLOtStD2BYRKRQUzMJeDC/XPqb2Feajhp
         fpxmoX0bDs0zH2eMGL2dfvtfGLJwUC5RR1zmC2jviyfncvKL1TzOwOxv1Du16+vNL7JV
         x/lbUIJbIQOkZOoCfzpaDkibjS1KNkPUJcav2zb3jaBG+zzPSwmVhDoh+WkEW1C9Cnbq
         LNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717658; x=1761322458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/0xrgYWwbL6uDm6bWRd8Dfjm9NXSGd8s9gIV76gFCo=;
        b=IkkgQc199HqAgWXqdSy8RjKysVfsjYKYUOmoMV5YOvXmTOjIWzeoxNkAlyxgSk6i46
         SKyWDXKA9ExNnsy1cc/qYkESYuUX/VJte/Tb2+/qq94gheknoPtANaAu45Sa11k+ObFC
         wG7kvfJ2cnWhYfoe3AqJtNNbi+mj8Y/b/1ZuO4+vMw2guci3TAcTpTLgXudjfpXuJT4k
         JK6e8yPmjb+kaExkVaIOa/Yd/JqTQlp+RtA3VzWmFfpCn/Y0tQslPUcaq1PGBJ8GrFuA
         tD2USl8+x7UQdqGux5G+U7KFRUO2705f16udZKVrWozKyZ2nfxYnvuoRlGP9m6inigY6
         S/7w==
X-Forwarded-Encrypted: i=1; AJvYcCXbJ8CWfqDvz4nJVYU8dvgOviSUPpbCOpYEaGo7laozc0MrDtY9GzJwaO+PqKyKXwd/DU8mWCHi2xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaOf/f7ptik/J82/TfeiggcollRCSIKNpFPMdhmoVSF5xRgoo/
	tTQbiuz3dq0IdxxWE884YtaRbHEIYqHjxE9hSDJ2ju2cwrCe7WiRtVT/
X-Gm-Gg: ASbGncu/ukAHLOLNZmN7v0BbL0YQv9O8PhzaJquV5AU/0W2wuTfjvH6SIJUs5V9O7LR
	vCNN2LJfhJay6Kvr6H4I71zf92Cvh2RYIbPD0PN7Bj1p5jD61CTWkwkxVEjjOfHWi59uOBS8Fml
	HWxa9Ik3ibrW4ocywJzjL6AVGb5prn3TXYWJgMqBxkIaBQSSM96XdVgFg3K7x98W7PWjCkjjIBT
	7eZzJ3i5h4IvvFHUiw6bgEwORrwpJbqt6rogv0SmfPlkP6mW2TH3tJ5pD3so0GZYJKmxEOFKfyt
	mEiqy8C1+YlO+b+WFpmzD4TC8msJoNgFRdYOC9ZYcQ8eVnmo8vqCWNv38QSwPGR//iVLC1zU/rS
	E2cb7UBJ8RkJBShSlwuFnhH5AG13Y9Exq8BTJYBOIG7bLxhovEflld4+3XmW8xRbtTt/4/cyH8Q
	Zzzs2VFqugkg+dmTWtx0dV7QsbhHvjpd2F/m/hQ1eR
X-Google-Smtp-Source: AGHT+IEvX2NLEl2JEWd8maw6vu+Cz/hVCzCLPJGWsXutTdMkKS8cKelXvHyzoaBlWYedD/QgQ0uDEA==
X-Received: by 2002:a17:907:a46:b0:b46:6718:3f30 with SMTP id a640c23a62f3a-b6475128af5mr477286966b.51.1760717657887;
        Fri, 17 Oct 2025 09:14:17 -0700 (PDT)
Received: from ivaylo-T580.. (79-100-18-255.ip.btc-net.bg. [79.100.18.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036706sm9606466b.41.2025.10.17.09.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:14:17 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] clk: samsung: clk-pll: Add support for pll_141xx
Date: Fri, 17 Oct 2025 19:13:30 +0300
Message-ID: <20251017161334.1295955-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PLL is similar to pll_35xx, with the exception of a different
Locktime - 150 instead of 270, as with pll_142xx.

When defining a PLL, the "con" parameter should be set to CON0
register, like this:

PLL(pll_141xx, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
    pll_shared0_rate_table),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
Changes since V2:
- rebase on next and drop the unnecessary new line
---
 drivers/clk/samsung/clk-pll.c | 4 +++-
 drivers/clk/samsung/clk-pll.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 7bea7be1d..4700eadad 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -278,7 +278,8 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	}
 
 	/* Set PLL lock time. */
-	if (pll->type == pll_142xx || pll->type == pll_1017x)
+	if (pll->type == pll_142xx || pll->type == pll_1017x ||
+	    pll->type == pll_141xx)
 		writel_relaxed(rate->pdiv * PLL142XX_LOCK_FACTOR,
 			pll->lock_reg);
 	else
@@ -1497,6 +1498,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1451x:
 	case pll_1452x:
 	case pll_142xx:
+	case pll_141xx:
 	case pll_1017x:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL35XX_LOCK_STAT_SHIFT;
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 6c8bb7f26..3c7575cde 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -51,6 +51,7 @@ enum samsung_pll_type {
 	pll_4311,
 	pll_1017x,
 	pll_1031x,
+	pll_141xx,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0

