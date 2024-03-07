Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB80130AC4
	for <linux-clk@vger.kernel.org>; Thu,  7 Mar 2024 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820482; cv=none; b=hGnz1sp4L7dGQhV9y4jj1invaiSClehgpx/73IXLlsrKRXRB7PvRIIk6ptxX9a2vMlZ66mEEJ6neJ3kzYhGGefyKgO/rgUMJ5ron9tIbeidB6LkOwpL10zxksJVD8IdbnZl8ytRkDMfD797Lw2KOK4EqUSiX1PKOQ/WV187Rhpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820482; c=relaxed/simple;
	bh=3usch3mCWgvvJ6H5R5X6oq5FXSb30XVMv2OyWsabZfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hmnoGGm4Yw1qSckETh82Nb4gLVroXSYAxTNAnVwDmBBNsRxCJKjZf7lBQmB+s8YCftr/Ym3OsNLzAQa1waFkWOZnB+7O4lR08gGgWFp+MqSdEnasFiGGdEE2o8Vcz+mpVX4v7OViSldN7/2sBw4XUU3oz2Hmgk2ZU99V8qQRTpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Gw6LuQok; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Gw6LuQok"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-565ef8af2f5so1088993a12.3
        for <linux-clk@vger.kernel.org>; Thu, 07 Mar 2024 06:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709820479; x=1710425279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Xk3zNFnFUzpml7KGgUK7K45MWH4y3FpUUdHLQX4xnU=;
        b=Gw6LuQokrVPB469+q/bu2TszRpT0vwMKfq4ohcD28MbOp903KNIAF4PFx9pe3rOklT
         +xh+mTk2asWn+SUuDyH7GbYwJkj8v4aLtnsD77noD3cglCIJ/1Cs0KQlFLzm3Xd3FbNQ
         lAUuE4qe8NohR5pObMx5bxO6CpLCSYzzfj2oQ1N5JLOMFf5MSjaIKCCUsfaKYu5p6HQV
         tgFxaxcdMFrCnl4pgpbdJK2RVxkPuKV1kBR//j56FWKT8VEbJ3neHjUl1tzsCN61KZcd
         uGst8Roxeg0eMbtI4FStskemIbNPb0zBO5nxyPzdneYEO/0Nls9m70aMoKCHbV6QO3dh
         ADBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820479; x=1710425279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Xk3zNFnFUzpml7KGgUK7K45MWH4y3FpUUdHLQX4xnU=;
        b=GccscJ/Fedc2C239oFZnuZQ17+hCkbPWEtQEPfG8bROG++weop6yL2TJjiEAVV8F3+
         sXNWIocb8bd/fr6DgnvSAdtGhoaVVhwna93sEU2g7wY/icfA8frKvWgU6eICvBok/2iP
         v6pcy4rbvvWkDGKouFXt9awQu/+moPYtHqLb4Nen3adSGVpgX3K3UXz8a3ZXhUTz0MeI
         FsGUo+PDNK/mv4tyRjwAmUlnHsKUM0EepfnZCL+dfLT4N4ipV7ZNpa1+JhQB+CVEJS8+
         bTOjxPcU2RGo4HvsVUC+DUGUMNDPDlhrNErxD4Z2z37rCnIknhlAf/UFATc6EBTFwoa6
         J9Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUZ7Sl9Wi5XGVMqO/8Vjgtu7rDuXLPFKcJfVeWYrcKVT69XJb1FKBUQwIlsG7Mf3x3K2jrHiXh0jkq0g4yFS5gq1HuW48rIAhBf
X-Gm-Message-State: AOJu0YztkhFpIG82zrnuP3JANSc4Y362AJzDWRcoosODFZ91spxL3AMp
	ELPkTbc7TepoD4qnfu2M6Ji+2dm7Lf08C7eQfo2tCyFkjaHcMcN3RpRnBN/mL/E=
X-Google-Smtp-Source: AGHT+IF4uSgMFXE0S3KwjkWMOKk9nfRhLnZte+1lbX3QiiMoJnySddxGNBc99SYjhDdP4MGl7+64gg==
X-Received: by 2002:a17:906:16c7:b0:a44:d498:c6b8 with SMTP id t7-20020a17090616c700b00a44d498c6b8mr10869042ejd.40.1709820479684;
        Thu, 07 Mar 2024 06:07:59 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.38])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00a42ee62b634sm8200648ejo.106.2024.03.07.06.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:07:58 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 09/10] clk: renesas: r9a08g045: Add the RZG2L_PD_F_CONSOLE flag to scif0 PM domain
Date: Thu,  7 Mar 2024 16:07:27 +0200
Message-Id: <20240307140728.190184-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZG2L_PD_F_CONSOLE is used by the rzg2l-cpg driver to check if the
SCIF domain need to be powered off in suspend. This is necessary when
no_console_suspend is available in bootargs as we want to still see
output on console, thus scif0 domain should remain powered on.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/clk/renesas/r9a08g045-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index c64769082f5b..86d80f357645 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -293,7 +293,7 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 	DEF_PD("scif0",		R9A08G045_PD_SCIF0,
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(1)),
 				DEF_REG_CONF(0, 0),
-				RZG2L_PD_F_NONE),
+				RZG2L_PD_F_CONSOLE),
 };
 
 const struct rzg2l_cpg_info r9a08g045_cpg_info = {
-- 
2.39.2

