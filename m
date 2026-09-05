Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A415749EC5F
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622360; cv=none; b=mARMapHnNSaanMeBAF+nT2ZOjFo1hXx61kyP+3JIqrd5qW1VnIq7I5blqTMLq6Z/gzOCvBKPwmWAssl9jdO7Zb8rIqSzXXZSsKpHx+UycK3+JVAKDKrgGfdesyOTrX8T60cIqdD0X1AB5fvR5N55VnK79U/T9gbrlysUHWI/3GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622360; c=relaxed/simple;
	bh=auj2UAs4nlHOJt9V76E5i5rzlg7fiUwNv3w4PwDwU8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SecNXqwF04Hi1kft2f+m7Q7KLk0wj7qkGvdEH1ak7NoVNNiGYnVfenGaK8CxJoy7IlnvEZIpQvxBxPvYUiKsUVmeJAd0EdHM5gpQaguLA54QUvFd/ugjKmoNE0mJ9b0xaWFYhKZlGShQDV0AFqv8kA7wrbO9DDreogIqFDlBAQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so1398544f8f.1
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 08:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622357; x=1789227157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JskkGqhdaY1l7i1ogeLg1oSPtvCeMbo2iXSDE4yNEI=;
        b=k2Z2BjsyL534FqJrhBwO8O5czw4vSFzzdW5Ea1CcptyI+RX/d28AVAd2MJ878PdSDp
         dRrsge+fJkONKuLsIP24FW1imc/gEYoYpsWoBu+Ah5Co+qsY4Ucyq6XBjAQGYIp4AR+a
         ccpojBt6EkHa++vxMUgx9FeIRBaMNEBVcbA1a/RLzvQsLV9oTaDXRihMhI2RyVpOFQMH
         BaRkQwFvmSoAFCEZSyD+eDdeOV9X39psBeN/U+kKSsL2zj9arER9+2H9KlXW3wO21Dd3
         yYDoR6yeo4emksE7tHEmoKSVhOrTboaUd0sETfKhQwADEp3rAvL8imToN3+qS9iRML6j
         mUIA==
X-Forwarded-Encrypted: i=1; AKwUvBwF2Di7bypCrkCzlcpSega10YaBKzQle8mJ8K9VsdmzE6oNNGGBtn5saudrLXH48YamibGL5RPXej8=@vger.kernel.org
X-Gm-Message-State: AFuF++meXI85etf7QMw5UKdwvfxbB/CFNScz+Wk4RK603EYqFJApX8Sd
	kbgXdJ2s+O4FF88P03/+Lh+hkAtonHfIGWMD4ePZloQttb7/SnPLe3Hu
X-Gm-Gg: AYBFou1SPFWKeDzRKzF91OPoU2MvlrK6R/WVDUnnqOhSdQg+zRgYnxKVbOjvPJSAzmd
	yNtS7n4FfocVdyWR2Rf5aX4E3bsBUbuzwQtdmKzb8E0TyW+pGeUapN4xBj5Y5HTEeU1P+hPhkH6
	bRc1G4md+hsgGDhpVEsK8WlX8oXxcwZQLv/DFUY2u7usvQ6F4U6gIKCgrF0zJy5ocmCfiw3eLwB
	9zT88yxUuHb4jbg1hGvEa7MZOLPT/KCEYUhxkn7TGr9IacsixPaXzqesMHVsuyIqXyBUmN8wxaP
	qBLKJOtfMRYZZYEu2r/TYbMkGHsSAR4yqupyT/FPquEV58q33diJP/at6vuG9jzcwftTtHWjtQW
	al3Rz6dTCOyYZEbPyoNoZ4xeu2rbDGh5OHTCfRuRG1K9FuwxwMphD2uUcl6/nFWntYMEEf7eFdw
	VFyCPGmdmdcsna01kxz0sdZ4SZwxsYsIz8+YewfpqDrBm9UELyZW5wMTGRktLY3mV9C/Kdk1gyI
	pVwhi37xu5Y+SmwVelADmi0q7OX/gSthOxe
X-Received: by 2002:a05:6000:2584:b0:482:b813:8315 with SMTP id ffacd0b85a97d-485872ac3b1mr16135052f8f.21.1788622356748;
        Sat, 05 Sep 2026 08:32:36 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:36 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
Date: Sat,  5 Sep 2026 16:32:31 +0100
Message-ID: <20260905153234.133217-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SD/eMMC controllers of the T7 SoC are physically far from the
NIC_MATRIX bus fabric, so the hardware design inserts a pipeline stage
in the middle of the bus path to help timing closure. This stage is fed
by its own gate clock and, when that clock is disabled, a controller
that starts a DMA transfer can never complete it.

Allow a fourth clock entry, named "pipeline", and require it for the
amlogic,t7-mmc compatible. The other controllers of this family keep
the existing three clocks.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
index 976f36de2091..12342b1d78e5 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
@@ -15,6 +15,23 @@ maintainers:
 
 allOf:
   - $ref: mmc-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-mmc
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 properties:
   compatible:
@@ -38,13 +55,23 @@ properties:
       - description: card detect
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    items:
+      - description: core clock
+      - description: clock input 0 of the internal mux
+      - description: clock input 1 of the internal mux
+      - description:
+          clock of the pipeline stage inserted in the bus path between
+          the controller and the DRAM. Without it, the controller cannot
+          complete DMA transfers.
 
   clock-names:
+    minItems: 3
     items:
       - const: core
       - const: clkin0
       - const: clkin1
+      - const: pipeline
 
   resets:
     maxItems: 1
-- 
2.55.0

