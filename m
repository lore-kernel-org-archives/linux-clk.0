Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ACC237A28
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 17:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850613; cv=none; b=Ct9jsxuhDZeBY9psiUAqjYNU492kGa4Yu0dYMPYa3Bhf6xpn2qj+WrrcNN2P9V0FWSYCe3+s914xo+809RLeV6m1cJklUYl3GZ5doqhQ71LEJUCPSPnoUkD/6qOMz6OU/gYMlIzHwDYuna6MNjT73nbl+7cC6kunRH2aAoE+0lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850613; c=relaxed/simple;
	bh=28M0DwDkMWfh/cCYd77FlED8MgZgXdkVNsI9ruq8oCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rPVPnbQd4R09QfeftdfoHt7vWZpEGf8uV+xevi6RTzItbpmSsWeUt4LxbqFsyib8z7lvHNopkmTDKCx9hB/fM4Rjb6DdhW8dtmiJY8hUCGlrNGG0QgSe+ZL1Qq1njfO0lzowyoqma6djGpjR0OiJOuCzezVaZspmbsg4K1+loN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MQzjBXDp; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MQzjBXDp"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cf6f804233so7354852a12.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 09:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850609; x=1734455409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehtFOxPVmrl0HXvdtrtv9cXQJbKgItgUhCJ0+pIiLcI=;
        b=MQzjBXDpRt18BnyVhFu9LW0hpGwvvwgHbxOjUiClJRXR5FVfaLIcqTvY+AH+LG3Kym
         v6A3midGaWsqoE1p7IqYJmQlSfnloI8iql6JSIms2HdJ5zZNEm663ModvEElq7Lihl3M
         OYgG5fJ3Tm5LgkoTXe0ZwLfAJg0Qb3N8/3+eWq2pg7ZQe24Er7zOp/5n9fCv6pOfwhWX
         N90AH9dvQZem8yoXZKO9Mbsw0pqeO1fqEn4x4SjZG6fE64Btrjc6mzUPACvHIr8ojC2f
         yoLrRyr9hGVHj17l9COx+a7NKAeIFVYt3z1bb2wf6AZ1Hlo/+7TMnth9iS9asdpKEm3o
         7Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850609; x=1734455409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehtFOxPVmrl0HXvdtrtv9cXQJbKgItgUhCJ0+pIiLcI=;
        b=kLFkUyriiUHlX6aK2+22riwvFeW6HM4YChj3KqOaRLFjpErOtDCI5jg00Jxg/FMJv8
         YFNnrHMMFpNem0tocDuHIAcWNHwIFAIGMCQpYJFOLpfi4GSvd1L0VXsCznGhmp1b0hg0
         aBF4zvXbUe9mo5E+kQ2jf/0WDKRns8W3+ILDr3yOuBiU36Psa7rF6Qa5b9nh6WFxUoXK
         vXrtGtmNZXDyXQhFTJ4HD59DN4BcsAoitcENU0QGjEi7aY37WVWyQpW1RzWM6SVj4mxf
         fZi+H9NkXW518eVJqn5XhbIZHUPM3E3+DgCHDbKJ/Rhb5fm5978BOTHGVqsVsK7RtkMh
         y36Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoS7u6EhRzokn2ovdshmlqcIv3vQQhZebz13a8umSssKA+TTwTkWqSE+14C8CrdkP5bds5aZu9+z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsgPSBGwZmphUk5l7YSEdm3wPox9qwUZsdj8CF/4vNXiZ9B2Kt
	kQoMGUy3EXhzt9HpzzgaQOKhABQGmoYVZ9J9k4Dr1p95vqOxeE0uffe5YzhL/jI=
X-Gm-Gg: ASbGncuDajpKsW160eoFyFnHGvvMI+deLeNNNIhT66B0J6vCuJK5qN/eLzleF2IYbvy
	Ci4hj74io9KlimR8hfin3f4n6YBh/D9ExmmmVoNd/F+cA3hR4pW5GF72yy+nA/RyExKuSxW9JPs
	JZwWEmZ3ISvednuFK0sfqPUjs0fI+igl9fThsFWTfZyxBfG1CGVAOhxypeHTSLTFvoR8NAq0Uw1
	5lqY3dLyO0pW8aHch3T2WN84oSr5VXx3LjKsyt1TbEF55EzG2M7uPir4gYaClre5wjaRzRpvcNN
	q7rDs+rJ
X-Google-Smtp-Source: AGHT+IFmnNKXXAN067E1UbwhBJfMpK5O10AWTX9+hlwh80SSPAEOWU+7C2pI3MGNxXbuHtb4mGyh4w==
X-Received: by 2002:a05:6402:1ed6:b0:5d1:3da:e6c with SMTP id 4fb4d7f45d1cf-5d41853e70cmr5928380a12.10.1733850609561;
        Tue, 10 Dec 2024 09:10:09 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:09 -0800 (PST)
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
Subject: [PATCH v4 02/24] dt-bindings: clock: versaclock3: Document 5L35023 Versa3 clock generator
Date: Tue, 10 Dec 2024 19:09:31 +0200
Message-Id: <20241210170953.2936724-3-claudiu.beznea.uj@bp.renesas.com>
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

There are some differences b/w 5L35023 and 5P35023 Versa3 clock
generator variants but the same driver could be used with minimal
adjustments. The identified differences are PLL2 Fvco, the clock sel
bit for SE2 clock and different default values for some registers.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

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

