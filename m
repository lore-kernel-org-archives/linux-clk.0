Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F47371063
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142826; cv=none; b=FKWrWvEEC5Pymht7zz+TeBLppqdcIYZEvXurhyT9XY+ogvjhx2VVGU74xYlIZguiJzv7Oaudc/CSw+E8jMJdo4VMhmERpUlY8wNx7XkxFJq0ULmtCnmUNne0daDeGUzUT5qOisaqxtbMwf4wrhD8M+UNwyPwLN75ByKhMvDvl0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142826; c=relaxed/simple;
	bh=hz+cNuphYh6KctNuqq/sr0jPhnDlQYgLMJefeaQQJQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KOKwF7VaIQd/rt4+HFoSp0i7pUexuGZRTfl+Ejzj3jxlHmFQocON6wBEr4GJBXQieiNsT8nzGSwqhbt4bxCSzj7fnSSyu2Lpgx5QgEh88F+qQ5krDvpOn6H3q35K6ai+rtJs+iqZ175uKMwUYXKVnUcsA/VWnFCxrqDSlp9j65Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQzrPws0; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQzrPws0"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7bd5e373d07so5229217b3.2
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 01:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142821; x=1778747621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvsb4xAKNE4uvpqV7KegL5UeBwHdlxGrU0IdXDSSfC8=;
        b=cQzrPws0vQoL8Ol0o5jhHXB3lUmPUP+5BsXTh5gkChFo8TlyOyRJIpevwZE53SLlx3
         HqBKHB9ucdxVtNnuveD8zVoxO1qjzXhJ8mNpX72NOp2TmzOeSM3fFYRyOsGElbCJIFh1
         cUd5DSGympqBzL75EX5yICGhAm1YWxEOiwGWdF4a/16LDB5FvlpCdqgVDDK3TVlTdNfB
         lEmtFTWkTqxQTnml/mwOyIoQt6PZH2oOwJd3NXrQoVXWprDrXgZzee/Izz4QlQOtrQzH
         7bIFLcAShu3gLYjJDTRKCQaxIOgRGoiCI2Kk+7smkn0pcwKeZWmlwSprJRyAUMb28tb0
         tlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142821; x=1778747621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kvsb4xAKNE4uvpqV7KegL5UeBwHdlxGrU0IdXDSSfC8=;
        b=ngQIu/RzoWFbNswWOWXMtIQkWMSw218w3HgQBXG6lmTqEO8SMkNYwuRCq2QviPLiZY
         zq8Uev2eGEUB5JG+je3/WKf/F2/YgIi2qACwEcrQGv3iy8hT9zJDbFKjj7ZChMvb0dSq
         +jiBPnqCMuCcmjeNkR7WBb6VDPRLGME97ocAitcj8O7SIbDFLJct0fYsGSgsgmPDM22S
         Bwpkw3ma2Q/T6Q0wzLQ6WvyeaLk6U8HtJYXarLl1kA1sRC6kBnWKjF97+gpORHpNmZkl
         pKR86MZg/hIQGNuJ81+9qTQ2tsJx8y5bC+magjdQJJxAyBb8I323v9OHP8ekps+1bCiN
         WyBA==
X-Forwarded-Encrypted: i=1; AFNElJ/vNatQpejdx7+37MUarvXCLRlK5kwOmYk6AEHJXrcqbPpy0wdAEkbIo4MYvo5iBFdpFrJLCWo77Xc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3s0e6RJpjqwpfTqPAEDP7U4ec5BRwrZ6rYDjoftyJkGGI+7EH
	64GBXwPrVRORzAwSkcGGt9q5M2SXx5MHsZ6JKrf1aIq/8Uumx1T+Zrlg
X-Gm-Gg: Acq92OFqMkBBJIZ/dAbiz/T4LXQkQbCI8D3qk6ByQe46p5F4zyomZXHWxXKO8qWGx5S
	9CmB7AxQ5PCYW6dSveZ2Yuo16Ajg7p+7OIa5Vj4jkMsZKvtfR+lcSCSABuXQbxMZx6TZS18LsOA
	ZZ9v+Tmgo6g9AbYNAn4uhohsfVlkG81QfriGDyX4mVxn4q/aHUetg+hXTuJ93aCqS0xpyxl/mkw
	WLajpMXsA8TF7E/7JqJSkKpBzP6HKnAKgXvSa6s2lwz8+RbpdDVUreN9zAPNmVqxSZE7EbbizbS
	LfaEAQb4uSUFUJknKuBx3ujmiI6OFCazlrC8qxz6GsFu6Cg0yJ15YuUjgO8GDiiQr06MjRSMu6S
	WmqUHtW3RdP+kaT7McaGvvLPaB4HIwxk5FHNNtuq+F1XdOwQHlsZOUmb7Ldk2TmsTa7URBTE1H8
	e98nzwUpwYnqE65CMO10yNerpwWVDfiHD7OLt4u3+g8JP7E5A=
X-Received: by 2002:a05:690c:38a:b0:7bf:f88:2e0f with SMTP id 00721157ae682-7bf0f88440cmr1443227b3.25.1778142821098;
        Thu, 07 May 2026 01:33:41 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:33:40 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:16 +0300
Subject: [PATCH v5 1/8] media: dt-bindings: venus: Add qcom,msm8939 schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260507-msm8939-venus-rfc-v5-1-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add a schema description for the Venus video decoder/encoder IP in
MSM8939.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../bindings/media/qcom,msm8939-venus.yaml         | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..10a50a410748
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,msm8939-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8939 Venus video encode and decode accelerators
+
+maintainers:
+  - André Apitzsch <git@apitzsch.eu>
+  - Erikas Bitovtas <xerikasxx@gmail.com>
+
+description:
+  The Venus IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,msm8939-venus
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: vcodec1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: vcodec0_core
+      - const: vcodec1_core
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - iommus
+  - power-domain-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
+
+    video-codec@1d00000 {
+      compatible = "qcom,msm8939-venus";
+      reg = <0x01d00000 0xff000>;
+      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+               <&gcc GCC_VENUS0_AHB_CLK>,
+               <&gcc GCC_VENUS0_AXI_CLK>,
+               <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+               <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+      clock-names = "core",
+                    "iface",
+                    "bus",
+                    "vcodec0_core",
+                    "vcodec1_core";
+      power-domains = <&gcc VENUS_GDSC>,
+                      <&gcc VENUS_CORE0_GDSC>,
+                      <&gcc VENUS_CORE1_GDSC>;
+      power-domain-names = "venus", "vcodec0", "vcodec1";
+      iommus = <&apps_iommu 5>;
+      memory-region = <&venus_mem>;
+    };

-- 
2.54.0

