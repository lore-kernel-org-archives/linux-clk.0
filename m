Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AF221ABDB
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168667; cv=none; b=GKiN50pa66iqOtqTwXZEo0AwCI6eq04RB63cKY2MKgtzADyE3tfrvHhXUA4WKj2TovA5tbhRy47xSLgBCybS0Te0YvUxP0fdVRb2EdhmAqZ5WUDU8yESw00ptAAJQIvi7vQY36XhmxB3uti4a0uKkyfRCCRaxMGhbWudBD0bbi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168667; c=relaxed/simple;
	bh=qCh6oRLfLTgTThIJ6lv+09+QKw9X55onfRfdQJjsxHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAC2JsHFs8flgJbsO1u85t2VpSDpQcZjtdrGl5P2CCRWx2TCXb9g1fDOiJPnTQ+zzl08X9dxqsscArkznCT4IgausY372/nZ1SlhrfsXRMKgNeQQ8bnxC0d1fKqHBUDyG6MtRGcblxQTXmwVbcXP8U4+rvta4VZOoZbfBE1HcX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dnwHkSEP; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dnwHkSEP"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so3540698a12.2
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168660; x=1743773460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1w11rlVw/TNBQvhMqe/HobIw1/0AFB8/Oe+GpWOJoY=;
        b=dnwHkSEPZFiGk+OcEy/DAYW1ouVXV5Jwdra0hyPGewWDktilyifgmdREiwDoTi2P3G
         wLrJTMGpq4kKdiCCAd1OocCJ9qJFhvWx5RQ13Fm1EwPDa590K9EAlXIi5Z6+BeG9aays
         ILBUJN3XTkiQgn5uMfyV8Jjclg3sEDZToX493NPHKKb6voIDRYysyB/+IcrKRYOs51CF
         ReA3JcLGakkcIpnVFOKpxBV4K//Unf5f7rZ/0QPPLPEJF41oz+qZe5n2cN4kaxJEaiSo
         Q63oiqV0LzdZiyPB5GYT0HTxmnVYLECJS+e8ZAuGL3jrukIzKAP44lkmgGF6iHGARP09
         KxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168660; x=1743773460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1w11rlVw/TNBQvhMqe/HobIw1/0AFB8/Oe+GpWOJoY=;
        b=Vodx+HSUBt3FLqRAUDrsSYPnURITqhw85Kl6ALBFUR9h72VPZq5JRzk5OcIil4noS4
         cOSICaBWY+st6LdPIybRMS6vpoOv+Hx6NMM4fimsV5SfRO4bNukWGZqL7ieCLO9Yyvvb
         hMi4AuHvc64j75qQxRE1jmlGVoZGTcfKmylHUPnygP2T9lwiUO6kGenGpuMGRiyswGkT
         PaILJtzV20IJoi0O2Nix6zT+qP3iEUHgAIBuw6AfftLgwKzuEOGe38jjvugu2QcbGHjW
         znD0HX7hKJSQzCGZSWM9SgN5m+61QznBVztZVCOVf4agJ5O+QPBbaqZ+Z/xQyU5Ptqsr
         I1Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWfN0URVpLI0hdFP301v3tWwfYIBC6SboZbEiNacxBePS5npkwgWoy0u6lQFFtFOuPijA2KeF1mHsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcS2ugzC6/Jw8AUny6y9Dv2IO/cptjSxXGq5kQYYskrQ8m6/YF
	A+UOZA5zn1VMsO4wETBHvMTwf82Je4aSd4gW4Uec8Ay04M2vFapu5kBZ8UxZGbU=
X-Gm-Gg: ASbGncsCwx14jbX/ZL7j4jk8HvevYGAou6KKakeJNZdoY1Up0ovmmTfaJO6Hwd0E+ge
	m/U99zvQT/+CEtJfHWRkGasP5P1NuFhW+71rVxbXaQpIozg9HC/8UmoRnX2VvL+dzaVGBAOWBWd
	C73pk31EZmAF1Bx8zAhjgE8mcgVGpg/FSH0K4AGY8ay2z+/nCgFbIPZj1yI42s1BbLWrfFYzviM
	wEJwEU7/4AZSYstf8biDEz/HNWdtVoNdfLIjpT+RoWYQj8onrTI9tk+kXHoWfTTZmiEeaG1OiGF
	PclQMyFCpuVQgzzn7dY6JdcF4J1V2iBBt/VLFkIBKeiq6ZNaSHPIskxeWG4TzU+/jcLLqT2rOOg
	JUNt/WraBZkRf9ISuQC84rzNX7+XD
X-Google-Smtp-Source: AGHT+IEq06ryYPSRFnijp9zBT7TVwvuxmad5wvipQF5Or+uJmUZMEkHYbtpAEod3NTnJDeU/8eOeEA==
X-Received: by 2002:a17:907:7b99:b0:ac2:7ec8:c31d with SMTP id a640c23a62f3a-ac6faea0f0amr608739366b.17.1743168654961;
        Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:49 +0000
Subject: [PATCH v2 03/32] dt-bindings: firmware: google,gs101-acpm-ipc: add
 PMIC child node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-3-b54dee33fb6b@linaro.org>
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

The PMIC is supposed to be a child of ACPM, add it here to describe the
connection.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 2cdad1bbae73bb1795eccf47e1a58e270acd022c..5524f2af5bda2d29b5113f8fe14ece7f02366a60 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -27,6 +27,16 @@ properties:
   mboxes:
     maxItems: 1
 
+  pmic:
+    description: Child node describing the main PMIC.
+    type: object
+    $ref: /schemas/mfd/samsung,s2mps11.yaml
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: samsung,s2mpg10-pmic
+
   shmem:
     description:
       List of phandle pointing to the shared memory (SHM) area. The memory
@@ -43,8 +53,15 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     power-management {
         compatible = "google,gs101-acpm-ipc";
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
+
+        pmic {
+            compatible = "samsung,s2mpg10-pmic";
+            interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
+        };
     };

-- 
2.49.0.472.ge94155a9ec-goog

