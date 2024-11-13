Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0920D200B8A
	for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504954; cv=none; b=ZCSGd0uw0uQ0ehA0+Cf2KOrj7ckErU+F2EvCxv7i7TTMNiCu0UXN8BjRxJFc6HTgQKEMxP2Bfm5M8GzUTg57g5rSm+AkqJtl4jzFbUFxW2IKM2ESVkyIUFzd5/O1iBoF8IrtEDjbUA1AaxXiKj9zDUboVKL0VwiZA2ruHl7loGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504954; c=relaxed/simple;
	bh=hvPyCBg0Ub380Oer84TP7TBiOE9lRasIFgVz5JcxaTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VjKvi9lMQwkPrcClzKrYAA0hWjxQIB/psX8JX+HjKTNZ4XinAAMhghG4TsN93yMIzS7W5dONz4dwCoJg8/H5Ud4p9q2oQasFq6fRfPoXpL0PnGPk25xfe2j9+Brk6gBABlvLop/sABQA4ubDwImKIm2CiOCL5514tEl/ou67hg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YxOyr/ar; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YxOyr/ar"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43169902057so56607465e9.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 05:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504951; x=1732109751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M39uGs9YqOaYwvk+mW8A+OZczlIwAy9DMfbQh/7ugtM=;
        b=YxOyr/ar/UEJJkPC5H7RfwYV24srrsCd8k8sx/Wsu9MmWlCOKeORpJ/7tq/YDm2ctf
         ELqCkjIHc3E/PXIugfgjUThbJFG2UV+lLxINfdhCvfa7MkQ+C69HamGwT8rxgyQCXfNT
         ohX0jq6mv0dZN1a/kvg0eznOhxA6nUGsXvKzLKFP5OCwWhn+tiZv3EOFzHglYbJ38lNY
         s5enT2XD/dMYElBhPpooHcmS52qJunftvMFvcGekDAuXsjzb9Aq/C/n6x5F5wlYaedLa
         3aZzTRnQ3wPw3lVwz9fZJOhy5NhdHa+NL/zJQ5tkm/1q9SzNidwVAVW17h6/k9W39+cB
         JNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504951; x=1732109751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M39uGs9YqOaYwvk+mW8A+OZczlIwAy9DMfbQh/7ugtM=;
        b=ngLhEZhqTThhp4GvjyvUi3WH2+l4YlpS6D5iYo6rBdTq5pud5y1HqjYgyXfp3IfIGw
         6I95Us5Q3gmuGIH4PvQt5+2LAy8U4juUGSRi8OWG1PpKuxg4RmeuGDBmPNEklR3wDPkF
         zf9SnIPkVyeclxRgvNIjITOY1l6GccsDe02luG4RMrlZfE0CRtMKZY6f+zMiSRXhzDvo
         abuvvlH4yoY42odkx6b3jIpOwxHoM32naEUnZ7MDoeFy19nTDUvzcyKkXk29KOiKM63S
         HG+6nDUhvhSIdiIkET7WhRmRgW51nayqbmwt9AMWguUJfaLgZv9I02/nsSZRIM52oEoA
         j2Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVWzBZml247++2AEAmGDh28mwcT9AztJf1sFkqjNpRTfwpbMyn2rfquf077fIpUKr8xiIfTtdo5GNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEzGZsI1zQwPGyJZ8G8xM+bHcKJ/ETOuqAYQBacs/0v6o+hpk4
	YUyxjJ4FYB7vtbc7dKGEjnl6t4dEKVrCiVvEy+bOUXXOwefTzXDbdJVirSE9aHk=
X-Google-Smtp-Source: AGHT+IH2ugJaSPEuNVTVb2TRcI8mLVkS7FRoCthfFGJrkjmYo7s857ZhiNnPrsmgApA/a3Xpwba8AA==
X-Received: by 2002:a05:600c:1f13:b0:431:55c1:f440 with SMTP id 5b1f17b1804b1-432cd47dac2mr60776305e9.30.1731504951418;
        Wed, 13 Nov 2024 05:35:51 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:35:51 -0800 (PST)
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
Subject: [PATCH v3 03/25] dt-bindings: clock: versaclock3: Document 5L35023 Versa3 clock generator
Date: Wed, 13 Nov 2024 15:35:18 +0200
Message-Id: <20241113133540.2005850-4-claudiu.beznea.uj@bp.renesas.com>
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

There are some differences b/w 5L35023 and 5P35023 Versa3 clock
generator variants but the same driver could be used with minimal
adjustments. The identified differences are PLL2 Fvco, the clock sel
bit for SE2 clock and different default values for some registers.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- collected tags

 Documentation/devicetree/bindings/clock/renesas,5p35023.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
index 42b6f80613f3..162d38035188 100644
--- a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
@@ -31,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - renesas,5l35023
       - renesas,5p35023
 
   reg:
-- 
2.39.2

