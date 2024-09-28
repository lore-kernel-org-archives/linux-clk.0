Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B7019E995
	for <linux-clk@vger.kernel.org>; Sat, 28 Sep 2024 08:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727512698; cv=none; b=Wk4jDWIuL5gVNx9aLBylDGA9RonNlnQrhgY2oogwGyYImDr0MtU1mC9m95gQTjEe7CkFQF+BeUCY0ZdkWMeRFmsDeh6AHBbpgLNbXWDqMOpWAuex66L6r803YkV/jPBcZtXbmsqx2V92Z2eGFp4LlNoZ9djROZzIdMg9MFUXLKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727512698; c=relaxed/simple;
	bh=Lja37Vxknt4vNnaSkdJb0D6DbUgmwOpWSwtN5vUK9Yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTbSFhKp5NTz9fyrxMVdx25OyqHakCYBx1nIR3wafRNlorsvbG3v0hvapLO7I7pZWQf5a9ayn3+/T0NKLUYVun0DlmEfzt9k3KXr4WjY1CfYvB8qdyYi8DwADXtGyZnPqOKmK3sD5dsRrDltas4pAtJApOmW2j9aH5tHkERFb/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KcutP+KY; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KcutP+KY"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8b155b5e9eso425930066b.1
        for <linux-clk@vger.kernel.org>; Sat, 28 Sep 2024 01:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727512696; x=1728117496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgBA2YgBzcVdnVEoc6s2KOvaf1NpbuG7MmZKT5HNBsQ=;
        b=KcutP+KYLBaaKxVBaMldgqD2POa0Pfx85E4rx5uo/bx0+6T1pw+rViVss5DJr8lKgY
         u1NHsUSEDDWH2D9n+ambUVGmBG8NhzS+In3x6tpqUxmTbCjnILly3+cx5XqTvvYbu+qP
         3WX4i/+zKzdKYuAt1wyESSeCc8yKo9CtebYOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727512696; x=1728117496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgBA2YgBzcVdnVEoc6s2KOvaf1NpbuG7MmZKT5HNBsQ=;
        b=b8pQ3Fprhj0lRKTcSlfitwHObphuwfltMECud173OxwMk9XuPz8TPB7mIFTMzCrJ8m
         RfudhQqZRBBFrsx2m/C7ifoZI5pULF6DQW9aupgkHjhBKA6MghrxFzEbdqANOaza1BKA
         8BJW1E4XWpEZhUWllmqmJdbnR0AyEheoU9huHLvuWt+dZb0MrDCQAyLgfbq3svWVfboQ
         oNF4zL6pNza4JcbsNo4SrPycKJI0ReG8Ns9MoBNGiZWJbSCvErEK/BfIUlG51DzBrCd9
         lmExula2oTmRhDk3lSw1qqnWA9DVXndpJ6I5OnRLV0EMdPt7R51k8P7Mb+2jLh9k4vuI
         6y3w==
X-Forwarded-Encrypted: i=1; AJvYcCUeWfuzB6twAyotGN9ZWCcoyhj1q7TPCC4omBx4CYdtFTWBAjEmCNfFfe0yqD4CKn8CU5+X2RP2vxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqNpxxNBIjhqa+sokFv1TIrZGS31AIaex3UDharmdSZ9E/p40q
	oPldw5XofYL3KlJWuqtNbJouDMh268kQthZn7/yzrdfwaqS6HdhpKb8NVYBxiQs=
X-Google-Smtp-Source: AGHT+IHW+mNjedKWSVNhjRyLls2JlxbznPHja/LY2bWHOSPBdNL3yKePDnTYBIPjvZtBQUPB/9/APQ==
X-Received: by 2002:a17:907:1c19:b0:a80:bf95:7743 with SMTP id a640c23a62f3a-a93c48f8a9emr546855266b.13.1727512695646;
        Sat, 28 Sep 2024 01:38:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2947a48sm223679466b.118.2024.09.28.01.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 01:38:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: clock: imx8m-anatop: support spread spectrum clocking
Date: Sat, 28 Sep 2024 10:37:49 +0200
Message-ID: <20240928083804.1073942-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
References: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch adds the DT bindings for enabling and tuning spread spectrum
clocking generation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../bindings/clock/fsl,imx8m-anatop.yaml      | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
index bbd22e95b319..c91eb4229ed3 100644
--- a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
+++ b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
@@ -32,6 +32,47 @@ properties:
 
   '#clock-cells':
     const: 1
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - fsl,imx8mm-anatop
+
+then:
+  properties:
+    fsl,ssc-clocks:
+      $ref: /schemas/types.yaml#/definitions/phandle-array
+      description:
+        The phandles to the PLLs with spread spectrum clock generation
+        hardware capability.
+      maxItems: 4
+
+    fsl,ssc-modfreq-hz:
+      $ref: /schemas/types.yaml#/definitions/uint32-array
+      description:
+        The values of modulation frequency (Hz unit) of spread spectrum
+        clocking for each PLL.
+      maxItems: 4
+
+    fsl,ssc-modrate-percent:
+      $ref: /schemas/types.yaml#/definitions/uint32-array
+      description:
+        The percentage values of modulation rate of spread spectrum
+        clocking for each PLL.
+      maxItems: 4
+
+    fsl,ssc-modmethod:
+      $ref: /schemas/types.yaml#/definitions/string-array
+      description:
+        The modulation techniques of spread spectrum clocking for
+        each PLL.
+      oneOf:
+        - enum:
+            - down-spread
+            - up-spread
+            - center-spread
+      maxItems: 4
 
 required:
   - compatible
-- 
2.43.0

