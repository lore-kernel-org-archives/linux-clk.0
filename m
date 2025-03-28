Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A816E199947
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168659; cv=none; b=NJXdNA2Li4Bjp1Z4FJ4HM87F5g2nZBieUfpdpXkd622tgTiXPUchqqwcLAmxyTSWdgsI8qlkARw650HZLjNSDzv0NAoTnSWXIRyJ9q+jvRpPd8hIYe9kj+tkhtZYM0zbqkDUDpho7SaTQSwjV03grhkjXiiSU/6EuVwsk6dCGHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168659; c=relaxed/simple;
	bh=/kKGbU72t6bcG/MbYzH1J9IMMY6h3yl6j4n9mpTc+Io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CkHUlbMGODma0M73A8mgEnV/yD9IJwSxp5mGp2zhJJ07edSADqjKlg8th0CG1HhqTfxcfihsCoN4nceIK5584vPtYsrVg7ILzUGBGBL20Rd/7uoTpAL1+6n0BaJB6S8D3ueApVOMz2Eegq/EwEbCDOdpM7i7RBlUS0bbwmA8Udg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hyKyol9i; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hyKyol9i"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso4222436a12.2
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168654; x=1743773454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bj8t/d7ZCz8V074ZRQQT4KdwjDhZIZlUROdEW2RBy3s=;
        b=hyKyol9ijjj+RrmL1I93avp8cuFSZS67KKQ2D/viflQtzvyrSlTZci4wsLN+NmuEZf
         W03aMMNHATJZUjNKccmwPuTGZsdpbSZfw73FqhJQmPwJ5r5dS1c8Idq5+xZhQKg2wDxm
         ioWlg5+qIV/OJy2C0BTr/gMmt9Sbdje0s/ajYKEuBJGXAV6GyG6nuWsY1Y2GvJfgxfxZ
         LaSFtH29lG2NFTI4NLsJX9FBqEDPKPxZ8M/KuLK5kMJzwcFp/ORjZzqtv7Vlg26bthxa
         DudUFOthi72zo8MOw98E6dn+b5t0qSGbjo4crnhpKIyxVYNDMsRf79Yay+qw4vj03HRz
         yffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168654; x=1743773454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bj8t/d7ZCz8V074ZRQQT4KdwjDhZIZlUROdEW2RBy3s=;
        b=hQyLls9wp4Kqt4suO9BJua2KGg2YSpBorMeIPRuCU8RjbqaMLqI3z8wFylSCAa6JlM
         TgJTdjk9ARoMVEj8d99KhNwR6SKi7SwGmIYAqUY0S1LoHI1O4GoAF2ELgDwb3hmCwX4H
         coStHC3gRj77QiC4sf4nYhymnqjrgj+srA6hLTOMh3+PaU7er8Jf1FRQgLMfa2SOrLb2
         Ei2oMuS5XvBoKxA4fNDnclB7rF0Ul6IrZLpKMMixA/YPVWUzEmq9va2UOU0fZCcoRKap
         p+uplwhQwvdTyJiJWtnBSTW7JzKl/dT3E2BAcDzM9ADzAmRvRibWsyzMAP76+YFH+ak+
         kCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk8OvGsQkFMQIWmrGKBIUXmYPRUCFQ9am6BO2bHItkbc3h9LxIPW3DP5daP0hyRjOQbxUxdz7OQ5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLjzhatIT7dkV1tuKyJ/gG5/nmQ+er/vrnm9YLPa+LJe77n8A2
	WP315oeMCqAQZoDlSGHgnw4h+pSynlj0lyD4gKvzo4ODhn0d/kTZnv0W5JLOgHg=
X-Gm-Gg: ASbGncsmzUT5+Lb3k35abYw98H3vtzciHzabv92zNYWHXS2rPQXhVV6RkxhJ1c1Jn/l
	WlQoFosU228BD85y3fkBhGPgfy266TYwo/n/NdoR1G2AVnzvjGM3/aXHfPC1dSzUxLaDvwHncS8
	iOxBJOm0aERAl/J8zdVs7CYe9fC0w1QtlpQ9qs2NiL3fHtHPOHhifHDGAor+qBn0ITcY+0nXjLL
	6qrx7p9xPZdJPVNkCLOg+G3rxZI1+5nqpCBvdQQx/omb7w0Rz6eYBfo1gJuYbayz7WPkpBBwCXB
	VYfX/VR/cHGoxPx1/3pYhTpudaF/eUdrnSvzKFf3H96SPu8BBVK2b0w0ErEIN+4ZzijgKOmKcyQ
	iVEppnnn21qHv7bYw/+NGz4gTnUuM
X-Google-Smtp-Source: AGHT+IG5iLE7r81td49W0bBe07yr5W+PK4WyVyGMbJeUq+YUB/jGY98HLwkEVGj4tkqcJ2fbAud1Ig==
X-Received: by 2002:a05:6402:27ca:b0:5dc:63d:b0c1 with SMTP id 4fb4d7f45d1cf-5ed8f5f7241mr7187353a12.29.1743168653567;
        Fri, 28 Mar 2025 06:30:53 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:53 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:47 +0000
Subject: [PATCH v2 01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-1-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Samsung S2MPG10 PMIC is similar to the existing PMICs supported by
this binding.

It is a Power Management IC for mobile applications with buck
converters, various LDOs, power meters, RTC, clock outputs, and
additional GPIOs interfaces.

Unlike other Samsung PMICs, communication is not via I2C, but via the
Samsung ACPM firmware, it therefore doesn't need a 'reg' property but
needs to be a child of the ACPM firmware node instead.

S2MPG10 can also act as a system power controller allowing
implementation of a true cold-reset of the system.

Support for the other components like regulators and power meters will
be added in subsequent future patches.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* drop ACPM phandle 'exynos,acpm-ipc', and expect this to be a child
  node of ACPM directly instead
* allow, but still don't enforce, regulators subnode, to ease adding it
  in the future
* deny 'reg' property, it's incorrect to optionally have it for S2MPG10
* enforce 'interrupts' or 'interrupts-extended' property. S2MPG10 can
  not work without. Note this is done as-is using the oneOf, because
  dtschema's fixups.py doesn't handle this nesting itself
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 28 ++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index ac5d0c149796b6a4034b5d4245bfa8be0433cfab..62d0e9f8a4d39add50a986af1836cfdcf065ad48 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -58,16 +59,39 @@ properties:
       reset (setting buck voltages to default values).
     type: boolean
 
+  system-power-controller: true
+
   wakeup-source: true
 
 required:
   - compatible
-  - reg
-  - regulators
 
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
+        reg: false
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+      oneOf:
+        - required: [interrupts]
+        - required: [interrupts-extended]
+
+    else:
+      properties:
+        system-power-controller: false
+
+      required:
+        - reg
+        - regulators
+
   - if:
       properties:
         compatible:

-- 
2.49.0.472.ge94155a9ec-goog

