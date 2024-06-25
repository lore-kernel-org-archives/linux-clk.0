Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F77316A945
	for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2024 12:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317677; cv=none; b=OW5CmsJ1ompgFnTa/cT21R9sAA+ZxOEJTaccINxHEDIoM5iUMeIGp2xEUjZlVMoeELqv04DSzULBpdmEDfhGlE/dVUYu35Pu0azAnp9PSsrjRC/mZFK5Kr+KUX5NXkX1h6BuaKKKqkhKIcu9GNyPJCGxDmk88GmHi42VYpw0Zjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317677; c=relaxed/simple;
	bh=G+BtkmivEpWKO42JZ/b2nYWC06K1BWJ8enlG6hWRiGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WkrtpBO8iVqdR49SwPYhYsjEqSKWQ6P75S2CBwflxsw7rM7Ds1e0xqf86qC+y4iEVRha4rPSxMNnGGb2+uMFZCnt9YJmnsz8ku+EYWqC3xBsNSTYgWS41ek5eavH6gPT4EAkZkrKt5ASi06+NSXFBcBDeYxIR/WXcpWlNI7ZQvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=h/gHlTGI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="h/gHlTGI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-363bbd51050so4309144f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2024 05:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719317675; x=1719922475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmpNHRRU2OSWCKd+hVEeWAEb1vupeZqAg8vsnXJHwhU=;
        b=h/gHlTGIDkFVEDFq1QHC6bePIxIIx2MqnlMCnhGfqXVYAJxJHaZY1ipDS4Xt/b5tAB
         tdA87XfdbEaUwquSKwsn6B9kKR/wuiNOLDJlcVue+jsJFYd01tKBev5ly+R6u9/5wLll
         aHH06pO5E6NIKeGN6V4YVStV8PObjoY+Hqgcc4EHGcg+Wmz91ec0069F/bxzcm4vzueN
         sc7v8FIgg7OZ0BTJw1Kxh11adZVuhM4nUUWXV7E6ZYi8E2DS7xcKFak8tH6K3ETDTAcv
         hbsPa8664U3Qz3kMy4WgfTv0MQsBFJJh7N0euKqrj+buN3N7aziFf4PjhlKkweYUYnfy
         u7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719317675; x=1719922475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmpNHRRU2OSWCKd+hVEeWAEb1vupeZqAg8vsnXJHwhU=;
        b=uIf0392v9s1Am58JuFwyYfnXO6P5pS3Qi9e98c8lP9wSaW2CVvn4lr0NHnoUj3UZqk
         +tXrzGeFHnVLvjTvLucR4HMo0lMMhvqA9NOI4ikKZldjDt+tj9rXC07T0kA+/KPzjzra
         AQj2vWkFH20vsh8GjtuTgVv3wTdntGsaUxJ8r9xXx1ikMG7rB9oeFHsdFfC1sci0XJZr
         b4TIV4rQErp3gxvzaBM9zraMEAS7jasntrGXllAQ1ZWUFAx6pEJZtlMGJjaIAPfrUxWS
         UQJ1lCEREyaJojjNEZJ2h594pwSFE/PQzSYxgEelasTvlZm4pamuO0QMj2741/qcFJLl
         X1yg==
X-Forwarded-Encrypted: i=1; AJvYcCXhKZSvh8VvkhUrMMvj0EfDmoiFk/lETKhdm5prd+3ZhMWasvrBv7kTu9DFWbwPovCzOKAd1C6Cbi3Z+ac0jiYHbNBHLcA9k6PM
X-Gm-Message-State: AOJu0YzA7D1VU8ufBA8avB15laAPavJTuKyXbWl4xJqNWYYaYq6ojtZz
	saAWGMt6u1dufcfsqIHvASoET5k42vM4VM2XPyCR3uVwWFqry7KiQbty9leDTxc=
X-Google-Smtp-Source: AGHT+IGAVzLeqxpQgHotNBmPQhFcmvugsk6GvG5kW90f7EiAkNWBop3X/RiZQeIe6Ry3+t47rKzRVg==
X-Received: by 2002:a5d:6483:0:b0:366:ea17:94de with SMTP id ffacd0b85a97d-366ea17953amr6038644f8f.5.1719317674869;
        Tue, 25 Jun 2024 05:14:34 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b32sm12798437f8f.92.2024.06.25.05.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:14:34 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 08/12] dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
Date: Tue, 25 Jun 2024 15:13:54 +0300
Message-Id: <20240625121358.590547-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
the version available on Renesas RZ/V2H (R9A09G075).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- dropped the renesas,riic-no-fast-mode-plus
- updated commit description

 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 91ecf17b7a81..dde37a209b6e 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -25,6 +25,10 @@ properties:
               - renesas,riic-r9a07g054  # RZ/V2L
           - const: renesas,riic-rz      # RZ/A or RZ/G2L
 
+      - items:
+          - const: renesas,riic-r9a08g045   # RZ/G3S
+          - const: renesas,riic-r9a09g057
+
       - const: renesas,riic-r9a09g057   # RZ/V2H(P)
 
   reg:
-- 
2.39.2

