Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AC54189AE
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 08:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979849; cv=none; b=MHlsC5fumQeASKV7k0jO4FLN3rDeyfbF4GS2swih2II4zhXCdNo9wxXT/SVdadArDQIgnrLCiV9YwXHaGJnWToYECStbX1Bub6XtXjnZfbkP5x0GXoXGQkoz7VFxPRTcj2+uoQFiQHcPtRVruCnI4DGRuzLmOwwcuY73lmf6Hg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979849; c=relaxed/simple;
	bh=0RrokHtYa2cUv4xV/HjfdQdge3X2ED1AmM/T8cwvnI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aKP8Mwvyo3W6Ki5Z5kP3pIM3GyboiE2dEhcCQQ285ab+df8Pv7Le2SH/IpTc2yvCptkrmn+qtGiZeuY/JlwMPmPqC62fn2pW5TFQZD+9MYtsCHHBzq62jHYnD+XsAQMr0E+3F4hk2YATgBCaofkE0Bl1xz0nTcdlIkkMETtXWO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Z+AyNf5l; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Z+AyNf5l"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46ed4f66256so1283310f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 01:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979846; x=1783584646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYGMlfq+GfXXzZc3hVZ9rsCaJpaLl9f+A3Em9EwRMIA=;
        b=Z+AyNf5lEUjIOh2cv5/Dz1beFEy7GWCRBmOAvqlTdtWQIovBobDWjO8141bekwTJYO
         VUbTORa/7csr/q4Xc4KGsCsRWYxicgYrpWiV4Q7sieCfp8nM4qpqRJlgoPLpQXjpZAZ0
         A3dA1oCGu44CjliJB3uuifKdKPviGySsQp0Uj4DI+YC1ufg+XaGNtj7vgH3uS0Yg3Li1
         GzRs6A1yoOojXaSSeqBlBvqDPfjIkm3ghMF803odZO8vZr9XvJPgVQQZ2wz5fyUEongq
         nfGO+ihuvhbb8VlYBxtZ2yHTQOipfzPZBs5sYGcwoS+6IGiqOYmgcab0UpXH43+qXjbs
         rjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979846; x=1783584646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TYGMlfq+GfXXzZc3hVZ9rsCaJpaLl9f+A3Em9EwRMIA=;
        b=XYAx5y3G6AF8/DrFWKUkGQvQN8YPFnF2k9tUTVNigABRkurhQ2qTnSEFZun+4/RNWV
         Qg03PVXwo+un8DrnGCubg+9kQ7NnS7oBngklqqx7YDHqxqqm7iW2sLGRYayg7n0rmsGh
         UCfjT2LCyHdsjPJuQiywaHF2/gWVt2PqdfZ/LGBztxRUQ/JnIpUCW0TodOal6BScivZK
         4MKAAfOIP32IvMkCtDF48XL4Rk4zvpCKO97AzG4yePbxgqRpETyquus9TzWu+y4Pz76f
         td1DJ22VmQt91/ccxwwLF+R+XqLGWmVEyv3aGSkKHqT2f0qOdZWW5ktafMJCRDpsLFmQ
         uS6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoCbyerbPVE587FqtwxdV489LyVrLWN2pSIfr6+s4F48l/c/p0TjZ7D682zBLqeBek2zQdddWICvwM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz83qpWIJzTN0OX4mPRaahiNDF8sn0OfALjHBpD5uQCrKacyuv
	3XGGXEYwaIC8NyfFwoe5hhtf/Lh9sKD+ZicePldEq6k3ideutO4EJmZRGhUFmr8Sc/Q=
X-Gm-Gg: AfdE7ckzF5LS3AGw0wwv3ld1zNGNCRsQfp01Xn5j15tz1dJqzz57Q6mXA+xIO7Pb+cO
	WQLOu5jXwdn3iSSwyZAGFjgUkkEaAI5vMb4BgrLmStMqxMKjUycxMQ5hTz9GAkj8iulmgfOrSwX
	vvQxvk/sfOpIuC33nUfTnR9/eNp7xsYp5dxFqKKmYDhANRzSlLJ6eA422kvzJnBAWmo4T7v7uKv
	a+KhJOz/nISRsg2iCBGzS4en+nVOKJJS387uDVy+NyFXIPR9RvHV+QJG6tfCDXnt5x1lg1XaO8m
	pnwRS2cBIvwXyYo1Uu80Y2rvaX63lKZrdLpoeDPlUz7jpegNDw9kqfnC/gOCxPbE5Ot74MfdPiW
	QPh5GrIbiy4W2AVFG+t2pxrG9kGiqBmKugxyULnM3cIZXztRjupEe5rtFZMyGNHZPZq30WeazHU
	6E2SDDjwOw5VVy/kN2V0GH9A==
X-Received: by 2002:a05:6000:601:b0:475:c578:b619 with SMTP id ffacd0b85a97d-4775bd0ecf9mr6698699f8f.30.1782979845774;
        Thu, 02 Jul 2026 01:10:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477de3dd46asm6536252f8f.36.2026.07.02.01.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:00 +0200
Subject: [PATCH v3 1/8] dt-bindings: rtc: sun6i: no clock-output-names on
 h616/r329
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-1-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0RrokHtYa2cUv4xV/HjfdQdge3X2ED1AmM/T8cwvnI4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz2fMF2sbd/orrOrcVKsxCiTA6ndgnw6zaG9
 gF/0t0uH8eJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc9gAKCRDm/A8cN/La
 hZHKD/9Ta2ZnK32lHMVoKaep+EmFCig9bncFhk9h9fFDao10aAE8gADLH1+PGGugqeUWMjQqMEm
 AC+KCbuiAbunDWvJy7SFsEIg24VljmT1jCYsb1Pb2zIcNCvmIevcWSEG1mHYPZFLVvtNC0FGaE4
 U8dfpLU8EVw4V9CYpYOHJL5h+m7OQuj3XmhOCrt9m9h5AQ3bJ0CjHhZ9G7vnXcmI075jZl9PctP
 nhj1RCC+Fn9VPOEGBdBuM/ck8l6KKzu64UCJ67YTWch2/STBZMvdhjhLpr7JQgOih9K7ZQbX3QC
 b0Re9Wxuy6HqmKb+cCBASAuFEnOUEXW8ErKD9/GDdH7KIKcZy8PNlgrtcbicP31Rx8EDCme0ndR
 TzuPFzT6iuVJ4+WyIJHLwypT4Q/VKl/3iOrB6EJ07PC81E4GSHAvUQ1xhAYs7HuTUMjviDnu4lG
 iHRlgi9rKfnXjQRwH4ZMI7cd4oF4w24b0bZW4gdb023lqmtml5TVHGw51QgShFWaNYsIaNV33Rf
 b4h7ldNt1wZrf2lynVLBMs4iVD+Z8k8902KQ5sNQpgwpxFxWqmBYsHjN71NSY4OCh9gTk/GKT2+
 WFefYnLwMEdOO6L4A3LXeoY/1UCryjYoOPm7YzQz/2FB9t+z8CHv015xBiQZkqVtedcPcujP+a2
 xRBrmiLz4T9INZw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On h616 and r329 chips, clock output names are never defined through DT and
are not meant to be. Just disallow the property for those chips.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: http://lore.kernel.org/r/20260629125305.0DF981F000E9@smtp.kernel.org
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 9df5cdb6f63f..959a012c626f 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -175,6 +175,18 @@ allOf:
         interrupts:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-rtc
+              - allwinner,sun50i-r329-rtc
+
+    then:
+      properties:
+        clock-output-names: false
+
 required:
   - "#clock-cells"
   - compatible

-- 
2.47.3

