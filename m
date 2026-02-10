Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097332C11DE
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 19:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770752015; cv=none; b=B7u0qnI5Fd8zTd+AyFbkfSteNstXJ8h1H9fGxnjUm56BjjM9MshqpgxfreItFoyZBQNkkn4623vArfJuZthqaCzmqjtJ4oyBvnTuGNu4Nj6x+AQl7jQoFEqDkN7y7oJAH0RGnfoVV/FiU9D2nxKCOFioVllYe3C1GhnbOE+r5/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770752015; c=relaxed/simple;
	bh=tOxwMlBPb2WjRRdQkXGGJ9FrS0pIDd5TW9EkQMWr8bA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c/yt9tCgtS6detvHIMfffUzLFbHxYP1q67903UI4wSdR+AlN3fmIdV7QcdtcJeN95kD6o6QWq6IQYuj4UcKcs03uP+DNGcHB+rWBLIsT6RLxZVKFjlcorN0az6X353hZG/h4lv482M9n+pwXCQCsD91UdR4RcBIiZTQMme7AkQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRvBhD3b; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRvBhD3b"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4833115090dso11256865e9.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 11:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770752011; x=1771356811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oQpYXC+oOVLX3B1mt394dx6/WutKhxIvgHdxTMSixY=;
        b=TRvBhD3br6yGkwnY1kR0jqU2aC4Y3BEULfogQNxQblXU86HvOTS7z9fkqHxugGxvUW
         v4Iw0Waeo8zJSz2LdA2/0WymCwYqWMZL+2z/Ux0GgbsmOemw/RY/WjUdsH8n4vxnO558
         S2Ex5eeCj0TPlI/ZNlsNZyRgj9FMRQdnY4ewLE7Y4mIFK6YHKgwwM1Vhl7rxQSOD7wg8
         6QPJe5U9HDb5cEKu2G/2SqeKTGxd6Rtg6gOPskEA+IpIyM4kAdFQTHW7KEqlF41jgRRB
         a9X0mjX1k4FdWw9+8hdLooEhA7Mj4aQU6DjySVX2jGa+fHhY0DnsOagE+d8XcF2L0cCR
         QAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770752011; x=1771356811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6oQpYXC+oOVLX3B1mt394dx6/WutKhxIvgHdxTMSixY=;
        b=fYmWlZpgwPHyCMEpMvj3W+jPCbmJA9sLeeJMUitdXZcmQFBeZfBVyfYSTCJOrignNl
         OQPfzkM7XoiJLxJEd1y5685fSTNlCZfsr2EKunH6Mu+qCiDnTl7k6XDyrVTOQtEqSxUc
         kOxT1iTOKLUEjGb3zL+d9Wa0alQ+fT0X0xoFRU+CtB/Xqct9pVtSSNyf5tcn6Wbbf6QG
         dtx+SkDsgdzIgEVTZ3bM5KqpQUEA+Ju3d4+jeuKVnhsNyVcz7T4PGUxQ6OKOSmUuboXo
         gcyQ3nqOAP/ASdW4bXm7xNF4s3lPpymi4u5Jj2535Pe2S54BU/IyKxMQQsBXOn3KPna2
         Mg0A==
X-Gm-Message-State: AOJu0YyWg499r3N4wzqSYLM2Q3hKuJDOe+VSYyH0XpAtiyreYQY0hzNV
	dvHGhNmj1dy5bfwSywXH75+O/ajeQ/4DEwZVw0Jp7nOjM4xGQxum4jmR
X-Gm-Gg: AZuq6aLVrsZvuYz+KwBWeHv65uEv4U9bNoRYmNXeCuZLDjsoQuMkFIoOGNCrhIYOCG3
	R6ECgqeYy7Hoy6JGwQcK1S8YMabWheJdVTQobMOD5Ol17VEZ5PPuN8eJrhWQM1IfO9SZ1tE6FRV
	zRWgy131IZovAmtqvfgz0kYcABpJYdZaKQi3X/x6UzAagGs4+Y3/wmxmWlMJJaq7gTVcAN7uTdc
	82NeGLbKuYnxPX9EVX6k+Ji6QRCd1DMI4eY0KXB0B3Pz7C6VYcWyTRhKAoQL+S7ObtlLS+4MIA5
	AynGEY2y4vdaQaVlla46sxCV6XBJZximLu6fWU532iKLhmxQmMxdkinoOxhBq1AIGaeOtwwMAa4
	x1kTEKbUKeH4Bd6FRe7prsLP0QDx33SGt2Ey5COch+kRynzC74QezZHh/VbV0/bcnTR/N9WITdH
	Buqldq8I625zPwl8yi+BlHJupZUV+JqCpPCiNnj3BMb7KaFsfibwziRiYyPuM=
X-Received: by 2002:a05:600c:6290:b0:483:a21:774a with SMTP id 5b1f17b1804b1-48320225afemr247617395e9.26.1770752011383;
        Tue, 10 Feb 2026 11:33:31 -0800 (PST)
Received: from localhost (39.31.66.37.rev.sfr.net. [37.66.31.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4c4sm143519295e9.10.2026.02.10.11.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:33:31 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 10 Feb 2026 20:32:52 +0100
Subject: [PATCH v9 1/3] dt-bindings: stm32: stm32mp25: add
 `#access-controller-cells` property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260210-b4-rcc-upstream-v9-1-17ca1db7613f@gmail.com>
References: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
In-Reply-To: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-47773

From: Clément Le Goffic <clement.legoffic@foss.st.com>

RCC is able to check the availability of a clock.
Allow to query the RCC with a firewall ID.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
index 1e3b5d218bb0..882de8608200 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
@@ -31,6 +31,11 @@ properties:
   '#reset-cells':
     const: 1
 
+  '#access-controller-cells':
+    const: 1
+    description:
+      Contains the firewall ID associated to the peripheral.
+
   clocks:
     items:
       - description: CK_SCMI_HSE High Speed External oscillator (8 to 48 MHz)
@@ -122,6 +127,7 @@ required:
   - reg
   - '#clock-cells'
   - '#reset-cells'
+  - '#access-controller-cells'
   - clocks
 
 additionalProperties: false
@@ -135,6 +141,7 @@ examples:
         reg = <0x44200000 0x10000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
+        #access-controller-cells = <1>;
         clocks =  <&scmi_clk CK_SCMI_HSE>,
                   <&scmi_clk CK_SCMI_HSI>,
                   <&scmi_clk CK_SCMI_MSI>,

-- 
2.53.0

