Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004101FF7AD
	for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984074; cv=none; b=HbAmry5WRXp6AOuXTaQPGSXMenmg0lhzW85DEH2JdnORp6kZMP2XdxQzqICt8NriRijRiAdkebLD738oBaPE8p5aWqDwe2+ubJQZUIsZVXr/FlF3BGHeJ53hH0jU8euJlz1DOWaIBKyVl15CJX7tjEcoMpMXjEUJbY0JfKtID84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984074; c=relaxed/simple;
	bh=IUbaxPS+HQnJ43himjlEznUpNzuts8QFvAEId8JRW6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKiT0qkkounP4HG5RvBuooBFglAJq0dAcXqMruggw5Vq+gdsHA4Xktg/n+EWS7InNfQCtRjuqqPQNWrMczb1uGlBN/6R1jisMD3A7H9Q2u4dsy59G5XDkeWBrnvOBhclold39WPO2fkPVa+3Ufne4wqvoLU3Ie6m1IO0vJLIno8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uQbHqjSm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQbHqjSm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43658c452f5so2777505e9.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 05:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737984071; x=1738588871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lrk19+x0xCyWtNAM9zqIl3MR0fAbQ4p3LHFnpdDhys=;
        b=uQbHqjSmL3xY6zOmgponX/GjfcHJVTbPqMZ3SXL4jNsl238sUGEDNNS9etdIemPEqk
         fu9g279Ktu7veueqXUM7YmwotHehJgfSL43vMD7czk4ox7B5Clo4CovdpnxPDrrL+Cvh
         vEKgwLn/zDNs+a/n19P+/zSU0aou247ln6Sbeuqqp38OVklvCJaFmAhRYZEMpr9Ejmh4
         evSeeHWffJIKHjg7YXfgCNX5fyr2ODPEmLsVX8NKElrbBL2uk1JD6zuRePd3OBuQTzQF
         P7wAnrtvr2yzoiGGIizlAVRndxyaFia4VFoS4YcI0FdnnesOHVwdKQB3s6BtbIzPac3R
         xAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984071; x=1738588871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lrk19+x0xCyWtNAM9zqIl3MR0fAbQ4p3LHFnpdDhys=;
        b=IeSTzSM8SID+qDTkx+XvDLehkEK0Acr/+r/xnKif2EFrRQzxuspYISBeTtKUtMQnuf
         UPEkH1Ej/NG9Mu2FrEV6yQ6Qo0rf1ErF1j26rbW2t5ChPIz8k9O1xBeFKc6NVapfQhG6
         BGEyzDBd7zZ0ZJEufapi2/3vhHnTy/3Odw8LEhPsufQ5uITgb/er2eMcCl+BOMrJmT9O
         h0X/X9t5uMMzm9ACfJo5hMqpCQil9fZRw3fgoDPKy37C4/e8k/UJz84U6/4ToowKCtk6
         Pz/VwMTCZ2GMW6mMLQ1/wUIeZvA8H3wed/yICfgwTLGMYrzsG1MbLhLV45uXgAPIcC/P
         5Hrw==
X-Forwarded-Encrypted: i=1; AJvYcCXX63j0sQISRV936gen8zPMKDqlux9q+RY9RLpz8yp9iuzfVjtDtudwyCAPF04+Mj5aOkZpJblNrPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqdMEhWzBqh3byscRC+qHca2TXngRMuY13Z5JJfOEe4pxAl+9d
	dnws3VM4aZdhKvrFubwX/WJ+LKWfIdbR1tfR3bgHN5JDRhagvbPRIzF00DPbHo4=
X-Gm-Gg: ASbGncsIowPRRoGRuXFtjzwA7961GEqhZwaryC6th7+uhRIR3suDxhp4UaUicz2xB78
	kXzfqbQLvzvKEgTrJwTe6JWuVJhLpBf7K0C6q3VRokdkh0mKL3Luuxc93pe1b60LB2gmLAq/lq9
	DOS/nHu46tTf1qqUKVxtvBQvOBczMX2Nk8EOWEWqtqqlwsoFMiNtIRodI2DZEI6MabK6kVao4XH
	7g06hkj+DtDsMI2XNlnX3zYdnosrZ7cpu7cTeqzgSJLnq2kUwrSwiOIG+VQW7UqvOGVXA0ffhS6
	cepKkhMIxrFgN5508Q==
X-Google-Smtp-Source: AGHT+IFQ3yteVkt9TcZzs8X17uQXuOmJxl9Leoqq2TKqJE6nDiurSR7kDwbdcXBuU+CbDYLyoR4UeQ==
X-Received: by 2002:a05:600c:1f10:b0:436:fb10:d595 with SMTP id 5b1f17b1804b1-438b1763eeemr80946485e9.1.1737984070644;
        Mon, 27 Jan 2025 05:21:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4b9977sm132386105e9.25.2025.01.27.05.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:21:10 -0800 (PST)
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
Subject: [PATCH 2/2] drm/msm/dsi/phy: Use the header with clock IDs
Date: Mon, 27 Jan 2025 14:21:05 +0100
Message-ID: <20250127132105.107138-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the header with clock IDs to bind the interface between driver and
DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           | 5 ++---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 1 +
 6 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index fdb6c648e16f..7541ffde6521 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -6,6 +6,7 @@
 #ifndef __DSI_PHY_H__
 #define __DSI_PHY_H__
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/regulator/consumer.h>
@@ -85,9 +86,7 @@ struct msm_dsi_dphy_timing {
 	u8 hs_halfbyte_en_ckln;
 };
 
-#define DSI_BYTE_PLL_CLK		0
-#define DSI_PIXEL_PLL_CLK		1
-#define NUM_PROVIDED_CLKS		2
+#define NUM_PROVIDED_CLKS		(DSI_PIXEL_PLL_CLK + 1)
 
 #define DSI_LANE_MAX			5
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 677c62571811..9812b4d69197 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/iopoll.h>
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 2c3cbe0f2870..3a1c8ece6657 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 1383e3a4e050..90348a2af3e9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 5311ab7f3c70..f3643320ff2f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2012-2015, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index ed8192d56b06..305042c29b2b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/iopoll.h>
-- 
2.43.0

