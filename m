Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AD941A909
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887838; cv=none; b=MOLz5SPFcUDrWrWx4f6s03EEIXBpQQtu1KBzxueLqsPTBAra8i14fA2wGJO2ybvaSxnUoxtG0SI5DtB+XugNi4W8D1tRf3PYHG5B8BlSR3Ojnz8GfGFhSroFpyFu0F5+FapjlEMSgy14tO4jLMs6b4+9jRv5KtvBMVaO4WzgoUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887838; c=relaxed/simple;
	bh=ddVTMkhYQhjB6ZCGQhNmC7udHsSIhRwzbp49Q5QEPpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dzld4XgxqdyS6piyJESk54r60QVmIF2EHMbuf5oe0HfqMW5tJtFKhvdHTryDrml3bXgHUva23ZgTw7GT/8ZgERvNuM+dUXsWvwOhMGKmToTyRtG4dQF14z8/01o66Sc8hk1AP2GyjaIqL1Bxw3EzUPKZEkuwKRCkki5kYI9gUYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NtpvpQ5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USFAhGUb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtpvpQ5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USFAhGUb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lK8x2162943
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qU6D/rKZGQxFhAFuDv0NYmixXft59wlSQR6DyVjgq7E=; b=NtpvpQ5DKV2j/Rz0
	msAW+2hppdQOJuqzZxXLB1q/FVbu5Z5JWwABeMGb6MaUqn47r23YUpmNoZrPPQD+
	gwfZVdRhnppBTCAUCMVxC5Vc38mSsP8rRNkctDgp4UY3uyGhRvCAOlr0OBksQpyN
	urqXf4nmt1Rk3yHfSXn83Bo8sy/8nlJADYqc5KSGWBQLi/MRStHERqr4xy2qVtyP
	3RqyxQw5EpeakYxnJrMWR7/89jUJsdl2gnMLq5FOD6A/TAnoUhfU6uRM2Y4bcsys
	2JEDrqzHC/U+nNb4ndG5+QgX1O7kFtG13tBHeqjv9xBIfr/taxsIudq2cCbYzF8I
	bXLG6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vknr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:10:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so3423365ad.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 03:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887835; x=1785492635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qU6D/rKZGQxFhAFuDv0NYmixXft59wlSQR6DyVjgq7E=;
        b=USFAhGUboGV7AZ1gpkz+EDgvg+ODy5lqLn/uFG0+xbK7A38ZyvsWtvMofpzcGYkPLQ
         Li5nwBlm6HLumkhZK4AM1taL3wOx/Nl4tsqALEEwY3gWHJ5OSMrURdTF6XtxW3p25eZW
         suU1RrghQE5ksxc2qXMUe5I2C5XOoThyrqXnm1ukqIIVxlKm2+mAeACr07Dz7LVgIEgc
         uNDOMlCisudc4QJLX41qLmjwDIl+KXTz1arlSxtgRiJSXftj5NKwcGw/vrdLUMih27fi
         aMbKe+06HoCXTWRzVhGg653ucizlbNLbj9T1SzlBYMuePzvrU2vtL9pRaGUGWVVpEw/u
         hSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887835; x=1785492635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qU6D/rKZGQxFhAFuDv0NYmixXft59wlSQR6DyVjgq7E=;
        b=l1GK80lCD0SGiAT0EHPdc4cLAWbaueC4ayCuzT0gef/bnZiUozUuXFFN36jvRQwrQb
         KMZ6ATRLsigoANeSNbKWGydRHEx/aBVV+9ojO4Iz2TGwms6HlWc1wgBbOj6MZbUhJgdt
         nn3IiYxYroo02o/uWMFtpXaGC8flin5fubxe952Fowll6wM+wsLISkzMW5gmQ1N0koLH
         DgX1DzTGEbJQ/FAyutHTMhDnametKTimgT4kZmdBtUpkdmvjFOW7PjBn6DPd+5vZR3vR
         8GyWDUna3TO55v5gVUgVS0mUfcl/ZnHv8GzrC6RO58N2Z9KNgvUbeK1MhjMznwsTZ6nD
         aJgA==
X-Forwarded-Encrypted: i=1; AHgh+RoYB3a0ZuBfhUHWSDRJAdDt9HT9yNgFoVXrLYQo5KKvNUCdCmt/RSCFxiX1EfFxJbFFISwDptPUIE0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya2oXC/cSAlctZTB59tKSyDWrOyFMCPbBPx7aPecZza8OSGxWP
	hGiLzBXog7so3HjUv0MaHVWYtyfXG0vO7HUCr7Vpec2S7SROXwNcGuIj5ci4/Pj2diW+I6xFtju
	GJkDby9KHbdTHDCi+cxWgzxt8zATip/s84EzgdRCP2mRgpz1x532Sp5iTEXdH624=
X-Gm-Gg: AR+sD11c9rLeLFtv8jjPSTGqUKrnp2MmuJeuPvBm/CaEUFeMPu80wfpgo3+DRZH8Q3i
	BNZuP1YO0pRPQBWqjyFI5OO8NmJza27AN5lLqECb+YpWsWD0QLDwbfFiRg8BEUV2GoX0xsLhhfp
	hxv+jYw/3rIPMUNkAYx61UvE6hOaLpShVBHrCAzFkbU+7tPbhCO1biLR8n9VQPS0BzXJ7S11QvC
	om8Su4KCTPRcd+uRlhEdKDoQR2zZw3iNO+ED6VnsOVbriS/nsj7WtOAmESQsZBB8LqWqUR66/ul
	YIMKS2LMrjF+xOoNmRU1Nf5okj7rEKPMhIhe/Dx+JIMMeeYldHaam/UKm49NvxtAhtLW7kCWjL+
	z9LCxI2UOKmkGs8CuSwIbvbi5
X-Received: by 2002:a17:903:2282:b0:2c9:c083:cd50 with SMTP id d9443c01a7336-2cfa6b799eamr80891325ad.17.1784887834568;
        Fri, 24 Jul 2026 03:10:34 -0700 (PDT)
X-Received: by 2002:a17:903:2282:b0:2c9:c083:cd50 with SMTP id d9443c01a7336-2cfa6b799eamr80890965ad.17.1784887834104;
        Fri, 24 Jul 2026 03:10:34 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm47863705ad.79.2026.07.24.03.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:10:33 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:40:11 +0530
Subject: [PATCH v3 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-maili_initial_clock-v3-3-45b577241c91@oss.qualcomm.com>
References: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
In-Reply-To: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX9yuQJlPnRUv0
 28CxhcXSzTZvbO1mSM2+Y07rSFUchM3/WiUTwpVuIAlZXRmLMJ6aEfUZkeWFkVUG7SvwGNGGVIU
 wDQpzW2OB1ZvK5OfEMhlUoeomTMuqe0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX7u/eLUrQM/Cs
 MiOQzGZjjCww4OtFCb4XboAantozDzI9ippX2hWg06Oi2HvnP2ylpM4Uu5kQaoxrX/uFLHM8xHV
 fptAx9T6dGQxwmtnkykkdBl5YSv2+nya4KkEAW+NLXjfVqCdqF38ETb3r0af+mVUuTgpuQTV6ap
 ritDX08T207EgQ6/lQyJ8hBLNFfmWmHEU6hvgTj/CD6TF5EwOQvSUVVJ6qFZQ1eLz+2GgxEaJSo
 WGaBI9S1caGJ7i6X+Dina4h5NoMDWfTmOWBwosA9mjUZsbYAZS7mZFVTHYL8x2Eaqg9Nn6djKUk
 i4B0BwJmQfJPeU6PWdMpqFvBqvfX8VVIalD9d/bzTp81pItTO1wwUixVZiZm83uFSCQwGdO0w0/
 +fI9y7qMzR8UHztvSLZ3zaoIxdu2PylZntbfbJkrV2wEOq/oMpJOe1Ip7TcwaKkk42qYoJXHnMj
 vV0r+M8bzWBITsJcQ8w==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a633a1b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4s9NPNi6RWkeKLmGOYIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Xd9HFBCw-uTQ9FTOAFoUlXpw7U7GwshY
X-Proofpoint-ORIG-GUID: Xd9HFBCw-uTQ9FTOAFoUlXpw7U7GwshY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240092

Add device tree bindings for the global clock controller (GCC) on
the Qualcomm Maili SoC by extending the existing Qualcomm Hawi GCC
bindings, since the Maili GCC is identical to the Hawi GCC apart
from a few additional clocks.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml    | 11 ++++++++---
 include/dt-bindings/clock/qcom,maili-gcc.h          | 21 +++++++++++++++++++++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
index 4f428c0f7286e83683a65cbe60b2cfeff67f5b8b..2101f4e4bb0d37f5cff42290f88c2f816038c402 100644
--- a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Global Clock & Reset Controller on Hawi
 
 maintainers:
   - Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on Hawi.
+  domains on Hawi and Maili.
 
-  See also: include/dt-bindings/clock/qcom,hawi-gcc.h
+  See also:
+    include/dt-bindings/clock/qcom,hawi-gcc.h
+    include/dt-bindings/clock/qcom,maili-gcc.h
 
 properties:
   compatible:
-    const: qcom,hawi-gcc
+    enum:
+      - qcom,hawi-gcc
+      - qcom,maili-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,maili-gcc.h b/include/dt-bindings/clock/qcom,maili-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..9bea90adb988ed9050ec30550d8723ede01ff6d6
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,maili-gcc.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_MAILI_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_MAILI_H
+
+#include "qcom,hawi-gcc.h"
+
+/* Maili has below additional clocks on top of Hawi */
+#define GCC_QUPV3_WRAP5_CORE_2X_CLK				188
+#define GCC_QUPV3_WRAP5_CORE_CLK				189
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK				190
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK_SRC			191
+#define GCC_QUPV3_WRAP5_S0_CLK					192
+#define GCC_QUPV3_WRAP5_S0_CLK_SRC				193
+#define GCC_QUPV3_WRAP_5_M_AHB_CLK				194
+#define GCC_QUPV3_WRAP_5_S_AHB_CLK				195
+
+#endif

-- 
2.34.1

