Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357F5240374
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 17:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850652; cv=none; b=KI7MZZX72LydHdPmSyQzPFuvfYoLYQW/H0cdp/wp54Hki47KVclsCcRzxgl+KlK0roHa0KSVPPSYetBlsEcr/O+fll4Jg73scz0ELR1jeG2Z1fAxysAOjljrYxkeqmyzSEoI0hF23dKY//o+ALNLePqP7CAa/DRU5u1LlimNHak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850652; c=relaxed/simple;
	bh=jlwgcsx3LUvZUCXYVhjc8Lyua4wYz+90XYYggB1WV0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U23EeWTJcKBGv4vMuKQALs+0bwrj3Qjg2qIbswMJ0yiNfkRWW10SRDD9fBSY6YmXe/wiKPC/tQRPLHEBuxpPFCcOHYlM4Vb2aDg7vRp9vxYiLMf1oFs2y2Gfj7nB//F8hfl3OSHOBj7bGR7d/jvhBd1Dz0eIFETjC3L8zSE6j/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cs7DgxPe; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cs7DgxPe"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3ea065b79so4489677a12.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 09:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850650; x=1734455450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMj/2kdBQwniGBjdZnm5DjNL0YdrCH1deyApmD3I+y8=;
        b=cs7DgxPeXIsJnhodf4oK44aB8VicMtAoqzJfIKp+oNm1FDwMl8RTlVOk1bTCpU2kwN
         NXtrNd3IGDmMhIf6cXonlwsD1LCkpW5WKuLRhfyfqrDyUTBQ2muc4maR56R/r4+If36f
         2lHVOOFpXUmDo598BB58RYNWXT/QzJ8/3KKCmYQKhCx6T2myAQwG3VYC13nWzr3lF8PZ
         Pr4L+mMvQh+6TtdrSVzxe16w3v/IEsInGCQJJa3crQPSC8ky/4Ge6/WFq5E6T6BVxNcj
         wEt2dkGQ+N+mJlpfEpWLIasB9H3sPfLlweeyw9XQWlbWgfrJmMA2BEEGkEuOuA853D6a
         /2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850650; x=1734455450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMj/2kdBQwniGBjdZnm5DjNL0YdrCH1deyApmD3I+y8=;
        b=RueCI1HfhRBLl6WLlDdjxAIjIvWMkWuisxXDO6R4b8ih+DqiGZ87yvGUUuOAuJ9Cgl
         nfK4inEVV5hhWO89VZZaoFWBtYp9FLUSnmi4oc1Kl/WFg0TeDARSrWGnEc4F7GutnI6e
         bfINzwjRNJTH0WkEyVZi59w19uDMPKsapXNEb8+Kah7d+YOQLsOEHBX2Ed5wfzQX7QqS
         vQOoa6FMqiA3IDo06hgrqmtq45QkSRcgp0JZe5xg03qK+zRvikQy3Zw9ulxEdH8gqjnM
         EnwQ4vvWtd1W84OlZRYZJlfoaMbe9TM8E3bBxbFfVeGFXoLsEen9N3W1zy/GmyMr0O9w
         6l5g==
X-Forwarded-Encrypted: i=1; AJvYcCW/1ZWdGglG9aZfECgsWtHXIcP4qTaOr4ROWSieIx1KNWyZVtwc2mRUFH0BHIzfsDUMop5Ox7uhOac=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgJbL7xlbSkk0rkB4ZgUidVVIhpskoWRykYgx6Ffa+NnUI/GEu
	VLfR4SfcdqFhKS5TUbCfMITAyvhopF3zVj2uuMHuuPz1lbXjghntlR0aX7Ed1jU=
X-Gm-Gg: ASbGncuYXXbgZaiNk9FVH9V67lN/k2FD1YcBb3o0qgF1wTnZW+VQorbWLIt92RcUFbN
	3g4eOoluapqhr2WWTZdthWNUflIACosHNQXG60Gh1o0zSiu5c9p1SOK4gExMZiCiulEIhVHnBHd
	jqNA7qLMoUZDculOqqGLfkEH0Med3RMCRnTK6m/H1VMcwrbf4ZHSnewwcxcBGmVgOluHd3UF4RI
	EYo8wVj7zwafGMMVpY8OWjHNM58bfrZEK4gkrA8IeBbQmi3bkLwcbVIYHRjZum3jN8Yj1nl+dv9
	u9qcdQxd
X-Google-Smtp-Source: AGHT+IFXUw5ybDLD5qa89ZofGoIXkdy91MQ4lgB9QjSQ6ZzxsKHCx4/ijSbtTty6jRiH6OvTPqEZrg==
X-Received: by 2002:a05:6402:2691:b0:5d0:8f1c:8b94 with SMTP id 4fb4d7f45d1cf-5d418534c20mr6265042a12.13.1733850649565;
        Tue, 10 Dec 2024 09:10:49 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:48 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 19/24] ASoC: dt-bindings: renesas,rz-ssi: Document the Renesas RZ/G3S SoC
Date: Tue, 10 Dec 2024 19:09:48 +0200
Message-Id: <20241210170953.2936724-20-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The SSI IP variant present on the Renesas RZ/G3S SoC is similar to the
one found on the Renesas RZ/G2{UL, L, LC} SoCs. Add documentation for
it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index 5b42eec864f8..e4cdbf2202b9 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -19,6 +19,7 @@ properties:
           - renesas,r9a07g043-ssi  # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ssi  # RZ/G2{L,LC}
           - renesas,r9a07g054-ssi  # RZ/V2L
+          - renesas,r9a08g045-ssi  # RZ/G3S
       - const: renesas,rz-ssi
 
   reg:
-- 
2.39.2

