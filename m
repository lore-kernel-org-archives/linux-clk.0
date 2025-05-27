Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1E7269827
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 11:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345068; cv=none; b=bJ5OiQQg0FIcvkH51Y0/wTIBWvM0Vn+DE/jzZAI1VqFYXyZcbUbD5rO03lq5vomr1WeHxM46pBfaDkA7UsSNlckbdAVAPTz6MHvpgflLiE5KXHvLP/mqIL1Nx8W/npJ0hiZ7ys7YUf3xBUnduEm+I3y5t9X4Zd2muI+ep0FrX7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345068; c=relaxed/simple;
	bh=JNetTBKeCVzrpVSgQrKDXh0nn73Cmuetb65CN4hLZuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHH/IF3r0cVSz0blB6I1ZeaVsQv2yXfWqdR4YWsv+GN8HMQKJHsfEbdEn4kmVD+XH8tRs3V5OwwnOLdP68EQaT3q1MfiGekCtKvRjoFQtJyTugGKGS+2GVocwGIElnFMLJGn5qn7YyupP2VeYDIcnWLKzG/z1bjMRgsuwsI4jhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Lx/gSGfN; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Lx/gSGfN"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad89333d603so78378166b.2
        for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 04:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748345064; x=1748949864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aELTmlEfKCAByNhR0BeCy3DVdg3Hk/gRSgPmB0KiggE=;
        b=Lx/gSGfNN/rqyZtjWoBBuXeEtZI0o7NicpioRvjsTfcSWe0OfBgdkhcvvDFGCJ/4a/
         I6DbIykAeVO6cRBurn5wmpB7lPcPREaSaHIdGI5XeAs4FtPdgTSsSD3E+STLviSLdeDx
         3jos0EEeq7fjhNUWPZcdztu0JzTgbY/Bn5WIYv45oQ54EuxMhRz0M/Dx3qRuz5qi8z0a
         B3HBx6hdhtmJVtaTTTBqnGXVEw0Pw3naqkAORvDKv6UrBFPJLMdenT+Jj+KJJIdO46kQ
         Om2gx7YJTqIty3+68hrTaUoHL/GKwEz+h+m5Cp67lywE7mOofn31rLE9fZqrhio9GynA
         DSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345064; x=1748949864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aELTmlEfKCAByNhR0BeCy3DVdg3Hk/gRSgPmB0KiggE=;
        b=d4zzKmvQRpTIQDI/cUnkikZIcmtSvtydsxFGnGQde5EOVOk865c2Iya8n09tiI+xz+
         oDSm0wR3WjvyYjUsT6Vo6TrUkzMcV6aucOM6OPMnmrCCsSRQEX6BjwWEy0AJLfCz+cu6
         4OWr+sQxzNXX1dkoh7HvblduwFX9alB4935h0zFVZvXiiza7kkNNNmmG8tY4bA4WYQzM
         wdQiViYwPZzTPHV2/flFUjoqH+wOhVW2fcRiYPfNQopSPouqAxppEKwxJ3y9RSVC7we8
         fCl5xugUrV3Pr0Zwmb8Z+ls/db3smPGXGLysQnvQwkvBiuXLsPVGNqDfvbqw5ls21eKX
         CuSA==
X-Forwarded-Encrypted: i=1; AJvYcCW5JXshyx5axvAwkwSusF/DD3te5sNPCWY1itEwh8G0YU9XlVg84PU2NB7x8uuOvzbxreutXhdMDt4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2//l5e8j6yF9ashI2fUK17IbsgQIbIlutvIEks2aTWgDn1YR2
	kaawLLBTX3UtpjdC/lWUZr6sFx2Wl0vEWQu+BfZed9kWIvOd+BwukRbZcdxCiB6azlc=
X-Gm-Gg: ASbGncsl3hWnKJTxt1WP4QhRsiZZq18V5qGgur1BE2mS2D5DKUdIYWjhLAo8c1VXE1l
	21brJjRLsGwSGm5QfYkZipCaX0IMVVoX/Xi7qgox/TQ4Uftx9nQIlwjMjPfWKDlLfpzsK4Uw/hR
	fU0iNeCA72qx3zs8QMuXSooTYIVWWWv3eWZfLq4VIenpU5cGsaTPEPd50IzrJKaDv3xz36xYLS5
	/76EnIZ94UUwVmxBkYOdYqwCeWFLngF3bvMXBGo1cahxh8khSyv6NMTncDyKM1/a1K4EHxE2V3y
	Fk8BEADq9WUaF9EyEpVY+16rcA0LPL4zUYrT+2mhKfIiqT4tq9OCN15BbPpF5qMeOZumsnJuf8t
	zNJa4
X-Google-Smtp-Source: AGHT+IH0qBe+DR1WbAi8SJNopWYn7T60qvkLsrw0PuKe+GwRXeTQ2TMf2+Xjj+q5wrNMTSeGjN4KfA==
X-Received: by 2002:a17:907:72c1:b0:ad5:2260:e018 with SMTP id a640c23a62f3a-ad85b2b5dd5mr1077079566b.44.1748345064416;
        Tue, 27 May 2025 04:24:24 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438403sm1807297466b.123.2025.05.27.04.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:24:24 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 8/8] Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells = <1> for RZ/G3S"
Date: Tue, 27 May 2025 14:24:03 +0300
Message-ID: <20250527112403.1254122-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

This reverts commit f33dca9ed6f41c8acf2c17c402738deddb7d7c28.
Since the configuration order between the individual MSTOP and CLKON bits
cannot be preserved with the power domain abstraction, drop the
Currently, there are no device tree users for #power-domain-cell = <1>.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 .../bindings/clock/renesas,rzg2l-cpg.yaml      | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index 0440f23da059..8c18616e5c4d 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -57,8 +57,7 @@ properties:
       can be power-managed through Module Standby should refer to the CPG device
       node in their "power-domains" property, as documented by the generic PM
       Domain bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
-      The power domain specifiers defined in <dt-bindings/clock/r9a0*-cpg.h> could
-      be used to reference individual CPG power domains.
+    const: 0
 
   '#reset-cells':
     description:
@@ -77,21 +76,6 @@ required:
 
 additionalProperties: false
 
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: renesas,r9a08g045-cpg
-    then:
-      properties:
-        '#power-domain-cells':
-          const: 1
-    else:
-      properties:
-        '#power-domain-cells':
-          const: 0
-
 examples:
   - |
     cpg: clock-controller@11010000 {
-- 
2.43.0

