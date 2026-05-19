Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED093ED3A8
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 22:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779228511; cv=none; b=ItBZregL9zkwTcpsUXjuEu7wYV1t86Y27dF8q+Hy4yInhk7izZigPcc5rx9zG5YFdEIMuPJooDOgZpzVo4TxnIEqwu/LIMR8JTjmQR0Z3jHJHqinTk7oykXdfNMRek/OHUjwCH2boTC+5QjUWm+AgJb6NXxLz+iuJopdnCo7Xi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779228511; c=relaxed/simple;
	bh=lDs5Cfur32hVT0EqCXkjR5FWXarqhbEOLI5RNUfKF7A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UjNHCGRhysE3jNv/6t+/bDc/cL8JF82zJSUezSez+QwTkcwEt7Vp57qgOFIZnmmzahubbXcIVRCBRQ6Idj2fYcQEqNGxPbxTKM/+mYMtx6hdnZM76hRautaABBT1R3H+9uJZi4tejEAaG4ogYu+G/tAdWO9OHqdIBK7VfmmA4lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHrd+a4l; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHrd+a4l"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48d146705b4so45126675e9.3
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779228508; x=1779833308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zf9iiOefjbtai4lpZb0pjdeUtGQL3N0f8U40x/Ratvg=;
        b=jHrd+a4lkUYPmIUgRDc/XTTUzMlxP5lcobx7qN17Q4IRzlDL0mSE7UP2xdKSqReHBN
         1yr7GvgkNQbOzCnrwt6o5jONWImBi5tZbQPEnlpPv9ysKey/WXlKCMzOWY5o2htziuW6
         gR0EeAYrzA3tLOLpmZvdXsUrkztpvjGbM0y85zA6CwZttEcusbAp+fajcWUOwpo9GgcQ
         kIHy2yeGJOmLUEuqp4bjz2g9rFtcdalj3QXM87TJUI5yfMes8kqU+HErH2y/DKIjTctz
         LRj1x+6Y71tzVTkED0QqwD7XdIwuQHX2NmIk8jUEEdyt3WPLCIO/9tzhxlnKxv2NmjNZ
         iTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779228508; x=1779833308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zf9iiOefjbtai4lpZb0pjdeUtGQL3N0f8U40x/Ratvg=;
        b=euB3y9DA6i7w3r8hOE7m2L+gjLowO4875ZyIPwFkHb1vOy8HhZ0XQCzRfI0kzcwgdI
         dqmI7LF1tYP0SHO511tBlGvXEhRA1HGtHOUxyl+bWGUR1IjWw+Hf6CTpoEZ8gZEPy4ur
         ZJD0gDxTo67mxnMUsa2Rr4bhVD+q5GOxuF+NB7qGHFh0itmhvjnW6yv5nO64FgMv+ksi
         PpLikhZcg9KDm2AX4OreF+AGBG9f62oS/VhRnjjKxeKjHiFD/AKFjtD1uuvpuI4jUExC
         0WjEngO0vvfqe76mmC92ab2+tc2NXTVMjRZsOurSf75nM2xL6haR66ewat/KvR0VYaZa
         2Dvw==
X-Forwarded-Encrypted: i=1; AFNElJ+ifua7f6KNW/vwkJT9EwTkmkjp8wAjMdV5KT8WsDXn+qayn+SMtHPP4b/cXyFJiB55Ka1hOCeZRPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbeqUN8XARvATo+/nuJJ0T9M8pM/pmkxAa0hfLB9nGX8/RSpwh
	Sz/4Lgz5vn1R6X75xwuCqgLwkdGsNezhVLBB14jofRyk5Jg4iH+WpAkw
X-Gm-Gg: Acq92OHftjqAVtMTY4MoQbxEwQLte+YU4ECsAuufZPI7AT7kRaRC9KmfvsREFA388Mp
	IWk0FpEaI9TU25GGI3XpZyuhhzqwxMwKYobY+hnrbeTTN6XN42/J0yA8kFNS0VR9qcvT6U0gVr7
	a2+Q7FlK17xxgQtQpjWgwfZajYHtwkHWyk/wxrHIFKVFcPRIjDYfbE5+BO1n0RhMK63Df2V12v+
	GuehuNyt65SlT3ldxtuVB8DDipxwiM5Le5TPwHVkahOwPRCO74fBE/+tPECY1aygK1v3x5XZb1m
	IdttiMWCrwlpo8deG+ZzswCSzuUdcZ17DlqSs6Nnf8PQwlmiRb22i+vQzuj8EM8KQcvdQSnSjUc
	GOupPougo5pETGj/7wU/z2tdh1WjSjB4K32HbOmB/vABt7PZhOKAzXcSdKduPMC/J6Re9T5fhOC
	4xokayTwdYZsemt6aPK6umwF8i9/wkZCxTYk02+XZz4+wf+JXqD0+aM0XSNG5k2V0UgX4nt6RvK
	JlQgeOhqQ==
X-Received: by 2002:a05:600c:a406:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-48fe632a02fmr276048075e9.22.1779228507861;
        Tue, 19 May 2026 15:08:27 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm118304005e9.19.2026.05.19.15.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:08:27 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 2/6] dt-bindings: clock: airoha: Add PHY binding for Serdes port
Date: Wed, 20 May 2026 00:08:07 +0200
Message-ID: <20260519220813.28468-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519220813.28468-1-ansuelsmth@gmail.com>
References: <20260519220813.28468-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PHY cell property for Serdes port selection. Currently supported only
for Airoha AN7581 SoC, that support up to 4 Serdes port.

The Serdes port can support both PCIe, USB3 or Ethernet mode.

The available Serdes port can be selected following the dt-binding header
in [2].

[2] <include/dt-bindings/soc/airoha,scu-ssr.h>

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/clock/airoha,en7523-scu.yaml     | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..913ddc16182b 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -23,6 +23,7 @@ description: |
 
   All these identifiers can be found in:
   [1]: <include/dt-bindings/clock/en7523-clk.h>.
+  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
 
   The clocks are provided inside a system controller node.
 
@@ -50,6 +51,12 @@ properties:
     description: ID of the controller reset line
     const: 1
 
+  '#phy-cells':
+    description:
+      The first cell indicates the serdes phy number, see [2] for the
+      available serdes port.
+    const: 1
+
 required:
   - compatible
   - reg
@@ -65,6 +72,8 @@ allOf:
         reg:
           minItems: 2
 
+        '#phy-cells': false
+
   - if:
       properties:
         compatible:
-- 
2.53.0

