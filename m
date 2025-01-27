Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C6818D
	for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984072; cv=none; b=U+4wuZdAt3j3p/PdwZjVMT6v4fRzRU0MwRk5d9lD8veO+fvgy5Oc+mPEEp9Kx7s9kUdyeDbc24jI7IxxiCbUiio77Mdpz83P58//+yHC8ViSo9gfNCZJKVYJewiGXEQfyY/VoalTme7iapepn/xZQfqnM5KEqoWIcF1BOFSphI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984072; c=relaxed/simple;
	bh=Ngxb6CRJg7Ow6aP/LBJWxZeYdq9qdffG1shfNRm5Db0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cdW+AYjGCSLCYdjS0UFSM36Tin3d2chNpsYqul1RFArdTAQNvQolFH9kFsdOLKT8WISl0d4f5vHW+SPC2e0UpmbPNPk/IbTcKUhpYUQL4ebeoJvwsPL2VuIN7CXdrhvh5UYefd8jdYWuPh/z2XiaOTLshw5LnwQst/U5LLcJcHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E5FqEXAI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E5FqEXAI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so7026735e9.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 05:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737984069; x=1738588869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+klEMk0HAOeZBAXubltjLaVWMvzRQNoO88wNMjjAFMg=;
        b=E5FqEXAIJ6dtBLqtAuo0rflmtwwfcUT/B9DuqGmB7ZNl3A47W+3cFZwZjaAJ91k6po
         RGy4lAHsMpGZf+IOSGBmcOQUkvqM++B/CyxPA0O0iyyWojOTrwUxzVPm8/NB4Qb8IM52
         l1F7kNC1AnCvwVrdCQZDcDaVsjz+N6ZIZXO1YnpvJQBa7A1P2sLci2H65VUis9Am7MsU
         PIL1fbVPZNrTntX1uCXBFnu9EDY5Kkk1UGDRXNtMh3osIP0Mxh7q2N/RH3KqAKE31nPm
         wtOM/3wTv+bHv+sSIZvarVaG1+l76qzfZTsxR+/ILwx6ZYlbinnMTfOqrU4AQKmMZ35k
         +q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984069; x=1738588869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+klEMk0HAOeZBAXubltjLaVWMvzRQNoO88wNMjjAFMg=;
        b=FbKrN/IiSLvewU87dKiJ+QKmZJ+vbqklouiSDEFqO1jPmAjltbgo46yeSCuOMvz4V6
         0pasXEMNJ63QRNVwa6O2KbJweNh4kkB9CsUJ48xmAofUNalnAahPkvL5RYGUnA+Jpmoj
         HSxhBuePDtsmq1vcQzLEiZ7ilAZtKQVTipF5EEIvw102BVHx/3KmY+qM5RD1+H54zN2L
         1RjJNK5j5bQIdDFkXYdNL53cSbCJG6Vtdqcjb2zBucAeunjZ8FyNc0ABm4ljqZJj7i/z
         WE6hHff2ehmh3aaLVtGLphb6LQtgvL+f6I4tRlIcwJ+rL/+wy9hkQt+7kWQycy/USx9S
         3FsA==
X-Forwarded-Encrypted: i=1; AJvYcCVcDMe4h0U4PQyzRg0oZzbQGku66pN9SNVq50JsopvndbZWvcG4o5bgT9EKL0LNlPzhbe1fAibqZVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo808xWSNzT87MINDOb3cYC9kojxz6/o6nqntuawYkawnVI5+1
	UGOKmNOEmwjK+hI27SZ7REF8vLlAJFNu8abre4tHHH5rWsopILKKivpF1UKAgKI=
X-Gm-Gg: ASbGncs0ViTCXXu0FhlPH3r1kiAyncSccaU2T6H4FL6D4EbEkAHSp4NED67t5ryMQ+O
	akZCQj8kEYYOZnZh7Dq51pEtchRjijrLkwhebkGSw7pvjJv8ljg5detBIZbYDfY0cwj5o72uDyd
	azNQ0DnnCc8Hxo0c4Lh/Z2FZkp0uUecbBQZRV5yBIh+MOPBpZN3J3SOoRdORWSZDYFlHCxTC68E
	dKjfbxilsUVqX/r45f3Hyv1INp6nY20/4mQyD8/tzG1PrlZleSHwcLVeccd/EiPWyHfiNWAGC4G
	7GtSWlmrMkd6TGrAcA==
X-Google-Smtp-Source: AGHT+IHXp0TkSnUcKeJc7jgumcRa74yvba9PnZUCBYFw4tCqyzZOJvhurHlS0rdMsNnSl5Phd/c0+g==
X-Received: by 2002:a05:600c:1c0a:b0:42c:bfd6:9d2f with SMTP id 5b1f17b1804b1-438913bde78mr147472595e9.1.1737984068879;
        Mon, 27 Jan 2025 05:21:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4b9977sm132386105e9.25.2025.01.27.05.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:21:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with exposed clock IDs
Date: Mon, 27 Jan 2025 14:21:04 +0100
Message-ID: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
two clocks.  The respective clock ID is used by drivers and DTS, so it
should be documented as explicit ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch for Display tree, although with Ack from clock.
---
 .../devicetree/bindings/display/msm/dsi-phy-common.yaml  | 2 ++
 MAINTAINERS                                              | 1 +
 include/dt-bindings/clock/qcom,dsi-phy-28nm.h            | 9 +++++++++
 3 files changed, 12 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,dsi-phy-28nm.h

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
index 6b57ce41c95f..d0ce85a08b6d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
@@ -15,6 +15,8 @@ description:
 properties:
   "#clock-cells":
     const: 1
+    description:
+      See include/dt-bindings/clock/qcom,dsi-phy-28nm.h for clock IDs.
 
   "#phy-cells":
     const: 0
diff --git a/MAINTAINERS b/MAINTAINERS
index eb75c95f6c45..30103e3918ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7398,6 +7398,7 @@ T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/
 F:	drivers/gpu/drm/ci/xfails/msm*
 F:	drivers/gpu/drm/msm/
+F:	include/dt-bindings/clock/qcom,dsi-phy-28nm.h
 F:	include/uapi/drm/msm_drm.h
 
 DRM DRIVER FOR NOVATEK NT35510 PANELS
diff --git a/include/dt-bindings/clock/qcom,dsi-phy-28nm.h b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
new file mode 100644
index 000000000000..ab94d58377a1
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DSI_PHY_28NM_H
+#define _DT_BINDINGS_CLK_QCOM_DSI_PHY_28NM_H
+
+#define DSI_BYTE_PLL_CLK		0
+#define DSI_PIXEL_PLL_CLK		1
+
+#endif
-- 
2.43.0

