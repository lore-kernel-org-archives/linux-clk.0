Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBC520E003
	for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504988; cv=none; b=Gv11qh8g+W+Lv8PdK9lGnPdGYL4FMYbJ60m1xDDCYBi241RwnqQyf2BGa2UcgsXVVHwe/R6LrojGligi+eilM2NwxQ7NYBzVzCc+O699fBvvFBf+hEg/+QdioCcuMMJ3sHCPQ0zrfEkJtyMu5j3/HfBBerWnKdVhBJWp4Pe3J9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504988; c=relaxed/simple;
	bh=exW6eK3eaXk+DXlub2dHP9Tox8AThO8iFMIJzBh5YXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I4NWR/9wgLgVflMFtIeTT8gPHk8kz2IblzvJU5w/T4K0PTbp+qey8oPBPwruXvOqrdK+sDIBKipdXm/9TSShZUp2Jd1g+ug1r8M1pAPaRqO40X1LxW4LL0oHHdL7s8gT/Vad/uZ//HfaA3A8Ks2XWS2/4XhKIPLQRGhDBcSYSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KEjLizSz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KEjLizSz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4316cce103dso85846645e9.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 05:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504985; x=1732109785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um0kOcEA9In9ecd/yltR9Z4whYJVqjtgwtExr6i7tVQ=;
        b=KEjLizSzR8b0rn3gF0ImGpD6YJG1n4Zzp1UgMC8aRtv0KYhFcbNudANr8VGYJ6J1vo
         tAmD9zf32ZApQ+sZh6fe/AD6W5tbTVR8FAgCy1aIkIpLKdCXltxAOS7hUSYw5mxbfWNd
         0v+BHH1hVdqkOz2JHWVeM+S2E5D9ZP7+eaBrBTfK3wWikJHa9tdamVsD3kmMyE3gKfkA
         GD97EtoLMbd00GyBsOZmPhfKE0+Jl5PkAKmRuU0vf2KqZYaUGWYPTYBw84weDjAGErGl
         EicNchyLAP7qaImFCAe7BxySG4opPscntuqHYiKbsKW+rWtTSqeWQaGFNcNm+X0ATm7C
         puog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504985; x=1732109785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Um0kOcEA9In9ecd/yltR9Z4whYJVqjtgwtExr6i7tVQ=;
        b=TP97UrBzXbXRufooHoO6lD5gvpSOlrv0Nru0QXM6W92BW3vRfJ4fgR2LJbR8ebdfG+
         yfitsURqA4tzJ3El3ZxUzSzAvwpgqjEMPpPUfDUBC7ssGr0yZuWN/ksTP4gEYrzJ6D4d
         UFsAYh1PZm/qGNcta8wrcXFQkMVdQaclCbC7/TqWDMKD12Bb4cU/9eLu8W8Q9kwd3gMo
         Ry5F3K7PaBE50IThF8VWJ+xtiFaqm/aHLTnVUsvjKdj7ZIRc5TbWf3xmog2Hgb4LRf++
         CW9W/qyXckhK3HAFFwA3qjoE8GIGWMjw9atCgNPGGNyAB1eTFUf/9P41menaIQuUvmwQ
         b3lA==
X-Forwarded-Encrypted: i=1; AJvYcCXmTSTgpLyXWJCedDUKOwaLv0zBbZkVu20EoAVOEsxPy6+B8YIgKNUnNwdBqLjrNTgi4hxRH6lribo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoK02ea2DTD7KAxHOPSn6qf4eq4ORbBtwTiRAd+HhXlFBHczNA
	dC+yB6iR/tEnsX10dFWVxtxN6ypgkM7DmmF1tvye5IdRhWgX83bAn+DwsfcK1PY=
X-Google-Smtp-Source: AGHT+IHruw+WkNL7bCkO7isKLwDz9qR5vna8+fxDLeEPt204ctQzamk/M+Mn2zf6E0gzAvPUU1G0+A==
X-Received: by 2002:a05:600c:4683:b0:42a:a6b8:f09f with SMTP id 5b1f17b1804b1-432b7518d0bmr204533015e9.23.1731504985256;
        Wed, 13 Nov 2024 05:36:25 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:24 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 20/25] ASoC: dt-bindings: renesas,rz-ssi: Document the Renesas RZ/G3S SoC
Date: Wed, 13 Nov 2024 15:35:35 +0200
Message-Id: <20241113133540.2005850-21-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v3:
- none

Changes in v2:
- collected tags

 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index f4610eaed1e1..cab615f79ee4 100644
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

