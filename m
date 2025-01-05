Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DEE1CDFAE
	for <linux-clk@vger.kernel.org>; Sun,  5 Jan 2025 18:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736100943; cv=none; b=G9cqoMTeQtKS+yhZkgkeJQWwVOYOY0A9RCO4P3AQN8NidMutLbQG9RhZuVRSJ0Pvm9yONqkWpNuDndGB/ctpxFdsXogA+SIvGZ+dmX2UkbENRAq/jYbAm0bMtk6ekaI1djpYRqV+Kbfrh26MNueoch57NAOOdUtdefWqwkapERA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736100943; c=relaxed/simple;
	bh=yOiVkGwEdMZydm8mezT59eqr13KDSeir4uRipppy1Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hqihujdYi2YxCtVFgxdiO1F7DYbPc00DcE9uhsZATai/X68evYmw5zEraNmc/yP9fyv+AIgqWyT7BWkm54BCRTqC/lnCAP5oNLbzZ3tQ+AK2Ow+EJwgRiSLZdTjDNWUhmd7k/JPwwKgDdGm6b8ELPUyl0SmT43CMqHQRNpaVLXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=HTBW8RLZ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="HTBW8RLZ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso169690066b.2
        for <linux-clk@vger.kernel.org>; Sun, 05 Jan 2025 10:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736100939; x=1736705739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBSWyldngVnQclvBLd3GqHALlVJ1Kxh3yvgFvrg0xjA=;
        b=HTBW8RLZzDaJtfRzAnBA0x6LLLOMzPddLL6YT5kTESOSAWpjhrP35VmttHyFkYXKdF
         4dbTchOaiI5U7g6gXI9wriDQauoxdlBeQm6VHf9SBcb+7PErTf6Dixta89E3KcU2ccvY
         WaGKuK53HNicptqa8R7VkPU6JebsnFy30M284=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736100939; x=1736705739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBSWyldngVnQclvBLd3GqHALlVJ1Kxh3yvgFvrg0xjA=;
        b=kKiyZ2T6ji/LPGha+LGq0n/o79eq6OgWJcftxYQiEjUR4GKl+OpgZBmI6ZmrCHrgco
         LMvUkGjnMAyT307ATQEn2EV4qvT44knsoScm88LvGSXBvta+1Tc3MMe3PFQN9+NwQMU0
         OizBeyCFjIU2liapvIGVvQqe8Pbx2ybMXFilyX3lv99fccx47PRpTVrqXvj+V70zhLR7
         gUMEGZpveSSQjT81/xhQ2+v0sgIBb/nCb67DOy1K77n6NadPAR5qk+Uw3Xtz7PKXN99s
         5tak79WqlBg4di8s5FeEAD11pu4U3YWZHfKSxlIyoAkRPwZZAoWXOAzM8U/UvOQ+zc1r
         9DKg==
X-Forwarded-Encrypted: i=1; AJvYcCUcZgkhpqaPYR3zQULfhNYmG5hoVMZDpPVUJZiCcptgIR50AAmA7Qehvwv4eMSgNb6YQkdwiaUSZdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS79sPsc9wqrolm0B6yOjwoF/J8Clrfhdi1rs0Uh0ETqmv9JOQ
	ThFX/1zy+OICIeVGVgu9ofGvdF2kxor+c5pGdIneBa22K1d2XJYCwbhC7aiA2Ec=
X-Gm-Gg: ASbGncseidfuP13sN3E3+a/WsqO+TbZZxhxwo0tYKu6SAxl4jPfOfed2gP3fG/nkgXs
	TagAHtF0lsqWD6ba4NaAMkNg27Ltn1W4TgummM3Ov4zSb1N5mfg4l2iqrLj/huyhZ9JsJc4tN+B
	EWi19eouUXL/QIb1d3asDB7CNS89udeYUqUTkxPI2dE+w25UXTemke8tS9srVbm+BqDlwj6tltJ
	fneqMhZOTD83D1vROfmhhdcCK0Z7hapWM+e2G64sbMoODJzCJcThaYetr+1vlv1wSCKJBb5nnK6
	731Xh3wTR0Y7Hm4i1SLb0gkr8R/4JhdANr2sL2ChKSvI9L7F/Y41uV/h9cVi1ddJivdUnqKydnX
	jMszKnpdI9sNdN3XlAQ==
X-Google-Smtp-Source: AGHT+IEouP5DBWHZTHTQqFEZUf+3uEYRS8Zu6JvRBqEkbBu3GJtaa/Q5Qj6PinpQXdyRMCSrqc9f7w==
X-Received: by 2002:a17:907:3e90:b0:aa6:abb2:be12 with SMTP id a640c23a62f3a-aac3354ff4dmr3925314866b.37.1736100938804;
        Sun, 05 Jan 2025 10:15:38 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 10:15:38 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 4/6] dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
Date: Sun,  5 Jan 2025 19:14:16 +0100
Message-ID: <20250105181525.1370822-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The addition of DT bindings for enabling and tuning spread spectrum
clocking generation is available only for the main PLL.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../bindings/clock/st,stm32-rcc.yaml          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
index ae9e5b26d876..c345d3ff3fc4 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
@@ -77,6 +77,26 @@ properties:
       Phandle to system configuration controller. It can be used to control the
       power domain circuitry.
 
+  st,ssc-modfreq-hz:
+    description:
+      The modulation frequency for main PLL (in Hz)
+
+  st,ssc-moddepth-permyriad:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The modulation rate for main PLL (in permyriad, i.e. 0.01%)
+    minimum: 25
+    maximum: 200
+
+  st,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      The modulation techniques for main PLL.
+    items:
+      enum:
+        - center-spread
+        - down-spread
+
 required:
   - compatible
   - reg
@@ -97,6 +117,10 @@ allOf:
           const: 1
           description: |
             The clock index for the specified type.
+        st,ssc-modfreq-hz: false
+        st,ssc-moddepth-permyriad: false
+        st,ssc-modmethod: false
+
     else:
       properties:
         '#clock-cells':
@@ -118,6 +142,9 @@ examples:
         reg = <0x40023800 0x400>;
         clocks = <&clk_hse>, <&clk_i2s_ckin>;
         st,syscfg = <&pwrcfg>;
+        st,ssc-modfreq-hz = <10000>;
+        st,ssc-moddepth-permyriad = <200>;
+        st,ssc-modmethod = "center-spread";
     };
 
   - |
-- 
2.43.0

