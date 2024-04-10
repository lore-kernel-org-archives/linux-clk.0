Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4631815ECD7
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712752040; cv=none; b=GCLDTfB644rLBSO/Doun7YSIJuT1+XrpcZYtXURxZfXFTsP7n3lw7HdZr0OilaaGNH5DddrtX8IzdHP9hgwaKWRLh4Zx/g4oP1husylqLM/Kg3VXF/8m1vaonPpu6prZ/T/dtKwyGX357f3TEEWGtHu1rFz2HaXZBQOQCQZj2RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712752040; c=relaxed/simple;
	bh=2Dn9zwoluUm9lOlv4owEz3lfChsm2AnVOIaAhDO5O5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UlmVlndyFkKKRZzMWAvFzc4g6E7coUEfMTntEFVbilkhRFsARlVsWXIRM5Z/MqNFddI0e2DyB260pexEGahbkkiXwBH57TDwZ0lXfHgN7Cs8lHESdMk0eF6Zs0X2nw8QfRcHxYs0ddYn3objaumqpAFPXW8WhLLbT4SxMnX7Zt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hjI6RZ4V; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hjI6RZ4V"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-416f04059beso3601325e9.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 05:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712752038; x=1713356838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzM8sQ3uQ3tHjk4LJ4TPWYY/Gu5/y3nmRsoLKfwtupQ=;
        b=hjI6RZ4VwVtAd3D7YuqJ9oBycxE88ajzGlNkXpwdJ68FnWuQAOYXrwfPpfVxHZnjNE
         lXeFVR+TdjOFF03j+9ov47z3rzg2Kz1A/RUYcc7F7buBfPf5QAF8zxjMUhck09uDWcGl
         2SSFOkh/ad7LOHcPbpq1TgGWyr6HApGYKcm3gTd9oUIqSzFfend5F3zrstkWlzxMC+UL
         f4rHzw5ugyydnERUYeto2/85dHts2U8DWMlbhT9c434Pfw+q+L8vpDqD/0TefH8IDv9q
         efxDxFuA786ySICbjPtkjlIxqA0BEqiJA4XsSyFI+VXQhYGExI8pk5HLy7Y97kesQNRB
         zmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712752038; x=1713356838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzM8sQ3uQ3tHjk4LJ4TPWYY/Gu5/y3nmRsoLKfwtupQ=;
        b=KLGSM/ZfImKkpGasYjgxtc5vMKHfQESn8fpfujG+MCf7evRl3LdAtqiW82fpXjGerj
         23nGo2+NOaDVJNQttMESgJamUKixzUF7Vuq0XZ3lVfGYY4zDB6vA811prkP2TyI+RKMU
         HLhgfJxvS1qO64DCtL/WPYTKH+Ec9TKJAtHsqN9C333jA/pijuMY1rdcmwaxa7Hy3PLG
         0SX0L/+WipiX7ICtd5whd49ltmGQGGavHsvYX2PVWR8SmxDBI2kzkygyyH0E9QF7GHeg
         xB1b6Vqrt4d/tB+JRsTdIjRVr1aAKsvgwS0PKsejNKEZir8HxbHpkUk34O/8SLXKcyOB
         mKnw==
X-Forwarded-Encrypted: i=1; AJvYcCU8MLgGjMc2PLvimID0exTy2kl3BKKUT0bTzAyNLytQTrqefo6He7gRq4cq7dkF64XmNYJe5NUbYOpTQjwY0fhOmkdGDpoUy7Er
X-Gm-Message-State: AOJu0YzXM3Vt23JovUW+eFLGK2BqQt4Yr2JfhOKRvSZsoD7f0V4uwKxK
	x9uBor8DIqVg51Y1JvVUV/WerGVrIBGimUew24B9moAW4mnyBIwgSUb8apC/Kvc=
X-Google-Smtp-Source: AGHT+IFRk5kC3MaMRtaKkbQqvr24Q262P3CbvQNlYZMqaD37NiQ9554hIb+fg3ZHw3VG+HvK3hTdJQ==
X-Received: by 2002:a05:600c:1c8d:b0:414:8e7:cd60 with SMTP id k13-20020a05600c1c8d00b0041408e7cd60mr1592969wms.8.1712752037726;
        Wed, 10 Apr 2024 05:27:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id m2-20020a05600c3b0200b004171f151a5csm1679446wms.16.2024.04.10.05.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:27:17 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 5/9] dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells = <1> for RZ/G3S
Date: Wed, 10 Apr 2024 15:26:53 +0300
Message-Id: <20240410122657.2051132-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410122657.2051132-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240410122657.2051132-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The driver will be modified (in the next commits) to be able to specify
individual power domain ID for each IP. The driver will still
support #power-domain-cells = <0>, thus, previous users are not
affected.

The #power-domain-cells = <1> has been instantiated only for RZ/G3S at
the moment as individual platform clock drivers need to be adapted for
this to be supported on the rest of the SoCs.

Also, the description for #power-domain-cells was updated with the links
to per-SoC power domain IDs.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- updated patch title and description
- kept both 0 and 1 for #power-domain-cells as not all the drivers,
  device trees are adpated with this series
- added a reference to dt-bindings/clock/r9a0*-cpg.h for power domain
  specifiers
- dropped the changes from examples section

 .../bindings/clock/renesas,rzg2l-cpg.yaml      | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index 80a8c7114c31..4e3b0c45124a 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -57,7 +57,8 @@ properties:
       can be power-managed through Module Standby should refer to the CPG device
       node in their "power-domains" property, as documented by the generic PM
       Domain bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
-    const: 0
+      The power domain specifiers defined in <dt-bindings/clock/r9a0*-cpg.h> could
+      be used to reference individual CPG power domains.
 
   '#reset-cells':
     description:
@@ -76,6 +77,21 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g045-cpg
+    then:
+      properties:
+        '#power-domain-cells':
+          const: 1
+    else:
+      properties:
+        '#power-domain-cells':
+          const: 0
+
 examples:
   - |
     cpg: clock-controller@11010000 {
-- 
2.39.2

