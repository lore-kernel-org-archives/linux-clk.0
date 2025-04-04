Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757FE54652
	for <linux-clk@vger.kernel.org>; Fri,  4 Apr 2025 01:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743731124; cv=none; b=K679U+iwMxYprs0NAs0/dK+Vqi6lO6dB1HwZzPMdPozFzlZZQNM5krCOsVg4C1f11UHqhAU8RzCUHdIVKf7tJgcWNx9Az+gnWdN8AdCKoTPLgG7Vov10b/lSj/plShE5eKb/OHMsDSbuzPhJtoNas7Qfaq2BIa1wpk2qgxto2mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743731124; c=relaxed/simple;
	bh=JP6AKaV4c6RL9Raq85GTSsXxMQ0cqI+v85EdlRj9uMw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gZLKOFiEHvgPaxYFEvhdlvBqLOrRCW3nOQ1hyzqebGQoxUOBQuCgRY7LNRI3niSf7iuWRdyBiGorN0hg4zcxLaA+8Zel4bwU32wyOzIk1zA/C7lq+3gh/czfBiwYVM7RTWM8+V1Zql3un3QEU5DwqyXBasNKpLgu7ma0NwLhW6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZyNxalpR; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZyNxalpR"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7399838db7fso1447018b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 18:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743731122; x=1744335922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYIA0N87xhRP/FjDDfT4iz9SD40PFBY0c3zy23Ct7oI=;
        b=ZyNxalpR+zDKtKtPsc1OAcpW7vkfj4E+VwiqRo/GNF+Eoz1lAXIMe/8UhoxusrAl9P
         D1QEyA5pN3hRir6OEusicLk8vYp+Ax3BQBNP7vTWWE7n2W15d2t6R4rVOaBUgfIURgWt
         JuhIsbr02CQ4PPDuZW6UrOjs3fG1aNhsa/fWGQ5xhcUXnNgty8Ro1G67ApwLtLJaw+37
         BGN214gDS6bCLdlvNn/5u1ts1+Bw1uWkrdswcbLEVpYYG0K0li2GaVnsHsklX8XrxtNM
         6Z3eFCGBoPMAYvRc1jQptZlH46xtrEl4wdsTj6s612eitgPHjlLiPUGFlD+a0zzEyr5G
         P1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743731122; x=1744335922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYIA0N87xhRP/FjDDfT4iz9SD40PFBY0c3zy23Ct7oI=;
        b=fYyumP6q88TIJ6zXRy2pBIOeFr20/YhzQ/ceJ40lWx8Nm+DbZt6dx+90yZc3izDJYz
         z5zFdusavAyJv4HfHUvzTc2ziPJBrRFIFM6vdVHGjkcQoEjU/pfSymWfDszPhRLPmK/u
         hgp0lNysuwV1v/j5NlEReeZjvqwG4gBNREWqtExIG1qrP+wTPdPnzImh4+YktkHY/j+u
         mDwEPPbUzIS+d4BDaZTSdFXewtRDqNyhDrRGPnW+sjIS8f50l3yI0BvES2sNFPAcsaMb
         5WmwUVAFCBCZ550/xUHWIR1e+Zk055Ouxwdle4o6vJTSkHZ/Ng7DkL9G6fhU+q03p0KE
         u0ag==
X-Forwarded-Encrypted: i=1; AJvYcCW4+Yw9E83pGxu3lxB+CC0m5vqaMYglU9itPns4mzY0eWnreBJap0XjvZ+ndaObDZIIH9BLFasoTTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzToqX7aURAYx5LZla60sAc60h3tcI3ZdbKMnP1aXhS56RGfsb0
	mhIwjLahrP5OhissvSgOKI79S+WnDgNI50dDsJMB5Ser36hjoU1JZleGI6ag2kU=
X-Gm-Gg: ASbGncvcPkMNiLGwNrq5IiDF6BUur6zE1Kt4ulT5n6GCYqXN6e9X0xUZap1u4gvSRNl
	gw0Q4OEPQeW1Mwm3LiCTKrmAK17i9QSZtjQZUYSI6HxrPOnuhryAmMpxvMaqRIO0V44e15esrVV
	2ujgJ/0dmHMiNE7RkEXSZeAztdhhJsGLl55NzSflBhpmeCd8XJFohk9o2qCxHBWHFdkBspZa72x
	OrF6dJxndyua3OYWoHYUBCXW7/6Cvs8jt3uNXKP5tN/RWjJeUHhiNbJT67bxyfoX1L7YjfR2UKr
	n/5/2e8Axtp+n5pkn3D3t7qDiuj6ZA47CmeWvjcToR6jdv9eyJrspLkRQrpnUtxUWOwlg6dDsiR
	D+aoIuUA=
X-Google-Smtp-Source: AGHT+IGUWvGCzCm24c563t3tszQcWD7Eqxr/TN4zH8xD6j46vgIvGdKnsQwIgKwAI0GN2sB6xtHpKg==
X-Received: by 2002:a05:6a00:2e0e:b0:736:491b:5370 with SMTP id d2e1a72fcca58-739e5a7772emr1705055b3a.10.1743731121712;
        Thu, 03 Apr 2025 18:45:21 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e3184sm2195304b3a.160.2025.04.03.18.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 18:45:21 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: clock: ti: add ti,autoidle.yaml reference
Date: Thu,  3 Apr 2025 18:45:00 -0700
Message-Id: <20250404014500.2789830-5-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404014500.2789830-1-sbellary@baylibre.com>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ti,divider-clock uses properties from ti,autoidle.

As we are converting autoidle binding to ti,autoidle.yaml,
fix the reference here.

Add dual license.

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 .../bindings/clock/ti/ti,divider-clock.yaml   | 24 ++++---------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
index 3fbe236eb565..aba879ae302d 100644
--- a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
@@ -55,9 +55,10 @@ description: |
   is missing it is the same as supplying a zero shift.
 
   This binding can also optionally provide support to the hardware autoidle
-  feature, see [1].
+  feature.
 
-  [1] Documentation/devicetree/bindings/clock/ti/autoidle.txt
+allOf:
+  - $ref: /schemas/clock/ti/ti,autoidle.yaml#
 
 properties:
   compatible:
@@ -97,7 +98,6 @@ properties:
     minimum: 1
     default: 1
 
-
   ti,max-div:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -116,20 +116,6 @@ properties:
       valid divisor programming must be a power of two,
       only valid if ti,dividers is not defined.
 
-  ti,autoidle-shift:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      bit shift of the autoidle enable bit for the clock,
-      see [1].
-    maximum: 31
-    default: 0
-
-  ti,invert-autoidle-bit:
-    type: boolean
-    description:
-      autoidle is enabled by setting the bit to 0,
-      see [1]
-
   ti,set-rate-parent:
     type: boolean
     description:
@@ -156,7 +142,7 @@ required:
   - clocks
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

