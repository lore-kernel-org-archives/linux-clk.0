Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A884E3396F4
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409675; cv=none; b=AjJ7ka2djGZIYC3F2xzPmZnB/v0FzX3m+jJxf7lv8oKfJZ60M+wTrdRr9DAcsCPT64QYSWdSxL3YwT4qvLRWuGAr1qg3fvpTwChi+9/MZ5XdbGWE4qH9J4R78Zqd7QSqmTGaKXBcUWymn9obswq90gSFmvUe5x53+hF0Rj783DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409675; c=relaxed/simple;
	bh=AMCItOgDdHgKRdx1GXTFHeaC4r97dyq4obHVbtp3GHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqzdEMF6Ohz/LWHIXAHkn4Zyjnlo/cjLGJLfPJm2KTIukqNw9vy8HKawNVwXaYhJ2kkK0z+TYPy8GyMAZ0ceK7cNKibLAFxMJiZzowZKl8zWpxO6yQkocE+3UQVqnzLamYsQoyvJQb3gaibypLwW6Nw28UkIWelGWbatGID4p6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ypKbL/9h; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ypKbL/9h"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-671c5eb7fb0so390710a12.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 00:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776409671; x=1777014471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvOfVZPOjPhsoW4F3DQC7Jn5+Am3jq15qDLt0sa1MzA=;
        b=ypKbL/9hVKV/zgm165L9uPUrp9LyC4sZX+h6STSboH+oGsxrbakQEQAdqSdUVGk/l4
         Tt2aU8DrjMAnoOxrKEWLURC2c7cFMbOf9qrLkjGVbb1Rl73ax7n0v1K6T2Tb9rc7bgp7
         iP/fCfhvk1I0ZXtR7KBYH1HiDIHAry+8A3eSK7x3HMciAYOdcJnxrJjIArmGiKeqKhnh
         gAQLUuhVKu1Dnya3bbl5cy2woe9zc4MWzr8sWns7tJbVyqOYRfk112bI0tiZFoJFmWR/
         6juvY5n/70YRUP5s0QvE4SP5oKbLB5ekAFftgCajuXGYK6gnHXWU5xiohE6vbabkbE7S
         wyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409671; x=1777014471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cvOfVZPOjPhsoW4F3DQC7Jn5+Am3jq15qDLt0sa1MzA=;
        b=RfOn7XNbo8FDlj+V6p9+Svz00AjxZ3sBI92bvFqe20VeATx0CKN3ifn7nNva2JSbYj
         kAELHDmvUdggxxv/OdooTeye2tbkgyHlUZ1dBD9gRoCRw7d+DPLUQFwawGzw3lSPJit8
         RQ3lM7qjfdK8H5Pn6jinQFKUUc0xPbgK8+/C2tE+OoY+2Pd6WgRJ5yL3aMHJUPQOHZHB
         w0Mjc604necfnGW5wK6TtV4hBcZS3W1N0bQn5cEWFjO1hoLEFTuQtwf40n0rHJIRBAIB
         N5JlCRZLAS0DUihIeO2vZ6DMeCh6p+8zv61qi0hmY0c1Gp5oLP+oC6D32jcgpIWHTRRQ
         xNQw==
X-Forwarded-Encrypted: i=1; AFNElJ+DG3jYNDjAKOgaBY4Tut6V99FEuoXwP+wzkhG/q4ZZzUUFyNfdfCGFb4r1ntsSbfP/dLQzcg/CVqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKvmgsoM4wRiJ0cmhhIXPrupc1OkkNyTSVBuWaQv/RTH9l+epY
	LSg3gqCbM7WHROhozdb9oaeC0T3oBnhc1fcfGYbyN1qaCDtYQYiBi7Wsuh03pzshsH8=
X-Gm-Gg: AeBDiev5iJP3EmVcNyiVk+02WwWWV0YeanledKiJ9eEh6v86G9gheUGJTm8UKKpnvQi
	23Onl2wop124rgzjc/auBwz4p+7CpDjc3xcOuoHSu3sAYM4Cy9z28weOPOoyzPpKqWXwNWIXaEG
	y999V8w+2YxaMnahW+UYhFJ8DH+7NPrSQPJHQfGkPXbnTZVoQlaBaIQU6IeBcgA7e833/PyzfIt
	DzvngRm8hgF6VQ7UtIPGmC12ytS0Nt9GCtDCF8jQaYWiE4LI5JOxBFByutdsPWye7NZzXsXCqc8
	/UrZbJYkCJAwcWVow0NnZ6NYPGqpDhi4+uNWei7/wXgPGWyQ/jpwRAdYs7f7Wt9iWfROz1w4nmh
	JQVdI0xyEoXsw5PBPi9d/5UpFb5KFRwlTexl1WHUSU/XMkYDSB+r75CZLzFJwkGPPLyysgGT/iF
	zX/QUH9b65x9cR0dOg77Eeph1xgbffoW1EdkLfFsp3DKwX33vQRaLzi/dDdaOmDtHnXhqa0nLha
	gVOiizR13MD8Wyn
X-Received: by 2002:a17:907:1b09:b0:b9d:e69b:58f7 with SMTP id a640c23a62f3a-ba41945c089mr80672066b.21.1776409670939;
        Fri, 17 Apr 2026 00:07:50 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdfd27sm26448466b.26.2026.04.17.00.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:07:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Apr 2026 09:07:44 +0200
Subject: [PATCH v3 1/3] dt-bindings: clock: qcom: document the Milos GX
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-milos-gxclkctl-v3-1-08f5988c43a2@fairphone.com>
References: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
In-Reply-To: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776409667; l=2723;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=AMCItOgDdHgKRdx1GXTFHeaC4r97dyq4obHVbtp3GHw=;
 b=hUIxkwNCfgNBT48GTiRI3BvsQ5rtFklAYZzv51cQl26o2DQEuT+YGDpXuqxrSQEZS2UEtKPQ+
 DXfgdvp/FGZBzOFwEIAp8Nhu5X+KFyue9GP1EMWKw+uLxVinjHuHvWV
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
Power domains (GDSC), but the requirement from the SW driver is to use
the GDSC power domain from the clock controller to recover the GPU
firmware in case of any failure/hangs. The rest of the resources of the
clock controller are being used by the firmware of GPU. This module
exposes the GDSC power domains which helps the recovery of Graphics
subsystem.

Milos can reuse the qcom,kaanapali-gxclkctl.h header due to similarity
of the hardware block, and also reuse of the Linux driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
new file mode 100644
index 000000000000..fbcb5d3f3e3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,milos-gxclkctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Power Domain Controller on Milos
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
+  Power domains (GDSC). This module provides the power domains control
+  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
+
+  See also:
+    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,milos-gxclkctl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    description:
+      Power domains required for the clock controller to operate
+    items:
+      - description: GFX power domain
+      - description: GPUCC(CX) power domain
+
+  '#power-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d64000 {
+            compatible = "qcom,milos-gxclkctl";
+            reg = <0x0 0x03d64000 0x0 0x6000>;
+            power-domains = <&rpmhpd RPMHPD_GFX>,
+                            <&gpucc 0>;
+            #power-domain-cells = <1>;
+        };
+    };
+...

-- 
2.53.0

