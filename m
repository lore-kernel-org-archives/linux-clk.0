Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289803D0939
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 10:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212085; cv=none; b=Pjugool5cjL6zHSMB/dcTiy7Zck16b0+fRGfWV6d1rw6kTQJmGsUXHdQcKAVZW+CRD50J9ERM+b45M1g9KlR5i9BAE66i/oaKpJUvwdeDzBo40NcfRW9Qm8h6e8oTwSXjt+1DRR59TqlgshNWTwHSlw/r9GaDIEmIuRy4MfLge4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212085; c=relaxed/simple;
	bh=VbFUEQ9DMBQd3nId7u9wGiI/I3xbIkiPGekb/pHPPSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SI7nai+3pEngPRnKpH1CWqAm+f8V27gZo2mfxkwjuEttMPTpiySp+CVQcLDIm7u5UlOjAceG27Jof15ynyVilcyhATmevhuYjA5q/hTKAtoKlv50u/OlKZCAzbQmYWdjpDBCXkT/9y3AzDi2UpKay6BH4eNjNvXquiR/jXEU6g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFpMNnsc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xv7Vq4Ai; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFpMNnsc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xv7Vq4Ai"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAseLa023925
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 10:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWcWdfbqWjmo3Hmirb/T4Zsz8/hT0nBX3ivX4r/x8OI=; b=GFpMNnsciqAxY5Jc
	3U+xg9yhLgRx7AF33mipe7GyPTQF89WIuBx2xT6NIav6Bt8TkjL7j/VsNcXXaCzs
	vI0J8rMAPo1mRjoQKIN65AUsw1B3XQBkxGiQt6ezi5bYzXHz1CEFIktPyq40nRRz
	nfqSujD4ysc0rNA2aUX6VpMQ9vcfkdE+Gf5DylRIxcUg7SixHtZcJ4C19c205A6s
	qpv7goUHHwSXoNIO2JN91brxW6hT9QEusNxuvblhEac51ryza5IHylsmc059knzA
	OZAjlYp9BrK3dC3wZp4EowDGNZHMkS4KbC50bM3Aaz1D0W8jH8yob/ZYXW5aYctB
	F2Wvrg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvs4rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 10:54:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6a9bbcc53so57025005ad.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 03:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212082; x=1782816882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWcWdfbqWjmo3Hmirb/T4Zsz8/hT0nBX3ivX4r/x8OI=;
        b=Xv7Vq4AiYe95TlL0ch76m+8vbgTPFHTq8GctuCE43I8N6STrZ8rLxDUswuViJAq0ic
         +7hfhBCPQfxBcPltPP4sL8atXew+WIz7QTeuu2TggsWw41h/W+uWYYT6CHh+TQ28H2bN
         KQuaUcFGw5NhB/baF63LHufrZaWxMuqwxFBwATawvjQSM1mMuVgqPzyazB/TtjvUALdW
         eFiZb+rKL1xamakDkHfXHhewEuhyGuZVn58atbRLJEMPxPGKhNuJm0GzMJ0gCs/mHyGA
         sQrSUVoroMKyqWtsgeh6neA2PveATWsZnmUdn9VvtyVMKuk9gQBdHOiqypekLq0XsLOq
         JmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212082; x=1782816882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kWcWdfbqWjmo3Hmirb/T4Zsz8/hT0nBX3ivX4r/x8OI=;
        b=cqzZ4m7YfHuPm7MjJxokuNa0JZ9f7LfdrJdSbXzH4gUN/K3pV3+wuOrYOezi4F9RhC
         VUghhf8JbsxmRexKCAZvdV0f5VbRvT6GHpPeDdlYzrHY+KXEVxl8We704DNtwp82kZgf
         a0P+C/D+keE79T/z46qvgIel4/RWYqjuEFTvoCpZ9F0VQxKvgBLK4YysnfFbF4UZJnR5
         c2qDhD3r9hPTxAzaauTp0FMN7AmhMNSe/MdySsmdcHEQWEABWTO9/i985WWWhN8cGm/D
         75/4dW0OlkdY1ackJEiyZ1r8OtGU04nNPCl6Y+BnQch975YTSKlWw6zqJtRJJgxq3Z5a
         OpKg==
X-Forwarded-Encrypted: i=1; AHgh+RpVIBcVEbpmBGLH+bhFFn5xXrV2RjQ3mSVJx7yRuuFMnkApuVbvRASiZ6eahFaqOZ7aexPRUpUmQ3w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7vb5UPLUyQWN6SIOQucTMQzsxMgg1L+vYKnSdFqTSZymFUc7z
	eVeUMtlsUO9qkWhXHNtl3zUAyrsT2K6KAtG1BLOuMBlTqMYyYLpxMKUwFL3bOpGeRwe+UEFSYKY
	XQSK75CMd9+hr2NSw34+QWscDsMN4LfrIsx6PfU95TgXg00uFKGIltWR8kJ7FjWA=
X-Gm-Gg: AfdE7cnrQi+VsDgJplckSjCW9vKt+W4YbgiYfrTEb8d+BVoCmOa6vkPovsc1kv6PDn7
	urwzNgFgeZFd2DdHS646za3MfR30C4qujlPe7YNeOgHel6uivjobWL4sUS/F2TEP2zbnZiSTKR0
	cyLMylS4pHOnvrZKIWBV0XAefqxNNxjPFTvsZKXKt9hlroG4uIS7/IwyDXXIXTDctRbW11IKDVh
	7JiUUq4LoaOYQpN8YjMpTBh2ZsBHH3Z1Nod1EPxcUY9Gb/liQREZL4pDJp7PkKcvNqFAxeJJ8H4
	u0IRj4u+IFri844WrjcApyYZrqc25KIlZqYJ0s/L27aztZ71Cun3USPAOOWbGAaSSj+ag2MLOnd
	7cr8mBzDgCn0Gv1V74qgdU0/ltaPDVTlZknk=
X-Received: by 2002:a17:902:cf03:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c718f856ebmr209223555ad.34.1782212082078;
        Tue, 23 Jun 2026 03:54:42 -0700 (PDT)
X-Received: by 2002:a17:902:cf03:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c718f856ebmr209223375ad.34.1782212081625;
        Tue, 23 Jun 2026 03:54:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm105788365ad.37.2026.06.23.03.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:54:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:24:08 +0530
Subject: [PATCH 5/6] dt-bindings: clock: qcom: Document Nord GPU clock
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-nords_mm_v1-v1-5-860c84539804@oss.qualcomm.com>
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a65f3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gsTgLEnmQVXtJsNGj50A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX5YWDBO4n7YZg
 yDshHF/vdbQr4JzJt42fU6DeIawi+MdAjdDl7BhgReEfSHFn+i6usBnV3WIjyk1+T+PN+qDJ9OD
 /RQJeRD/MdQduw1f8y4AJ0h/hkRIAZI=
X-Proofpoint-ORIG-GUID: 5OPWyeAUHrh7aLOEOufdlDoxTzDhUjLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX2AVwi9+fb+Jm
 R+bHCeRE19hPsWK+Mtk+sGJsgCERjaP7siJUlpvKMe45b+n8GDszFkpXl/4Cj7dzo6tSm5Fr7cX
 a27OrM4mxtqvtExwjBhx/NC7WjNebZVX5I6417IIvlAa2rLZWUV889euMbpbhbXxBOB4X1QNbw+
 pePwzy9mc60I5y6ASYQNkU8IxrYjdeheV/p1wSdS53+vwDMUwh9lr5qf191CQTzD1wFrnnCTGUK
 bYpgxatnR23WPsH5NuAJ8MDMs4F5lGFNW4qszdNACyoFI3F/H/dsc316FhpSznbj8Mb/4RTN6No
 raPyw29QZN6Q0/x4UhhBt38f10/c6qm/TBI67f+PUHP7jbCapo43Qma9Kf1yrNx7xNLDcSah9Vb
 m/Qczzl6orDpMM+lTs1KuINrqJ/bQz+uUP1sE2QsAhmZR6V4AOdsSiO/RYIQ9tHxOrjiqZ6r0Md
 LEe2n6VSWfxo6JHN/pw==
X-Proofpoint-GUID: 5OPWyeAUHrh7aLOEOufdlDoxTzDhUjLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230089

Add Device Tree binding documentation for the GPU clock controllers
on the Qualcomm Nord platform.

The platform includes two GPU clock controller instances, GPUCC and
GPUCC2. Document the compatible strings for both controllers.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,nord-gpucc.h        | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..ba85692240e07a4ed8e69c6b61847c5601b32fa0 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -18,6 +18,7 @@ description: |
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
+    include/dt-bindings/clock/qcom,nord-gpucc.h
     include/dt-bindings/clock/qcom,sar2130p-gpucc.h
     include/dt-bindings/clock/qcom,sm4450-gpucc.h
     include/dt-bindings/clock/qcom,sm8450-gpucc.h
@@ -33,6 +34,8 @@ properties:
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
+      - qcom,nord-gpu2cc
+      - qcom,nord-gpucc
       - qcom,sar2130p-gpucc
       - qcom,sm4450-gpucc
       - qcom,sm8450-gpucc
diff --git a/include/dt-bindings/clock/qcom,nord-gpucc.h b/include/dt-bindings/clock/qcom,nord-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..a673e4854d6606315a63d2e35aaef07953169c66
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_NORD_H
+
+/* GPU_CC clocks */
+#define GPU_CC_ACD_GFX3D_CLK					0
+#define GPU_CC_ACMU_CLK						1
+#define GPU_CC_AHB_CLK						2
+#define GPU_CC_CRC_AHB_CLK					3
+#define GPU_CC_CX_ACCU_SHIFT_CLK				4
+#define GPU_CC_CX_FF_CLK					5
+#define GPU_CC_CX_GMU_CLK					6
+#define GPU_CC_CXO_AON_CLK					7
+#define GPU_CC_CXO_CLK						8
+#define GPU_CC_DEMET_CLK					9
+#define GPU_CC_DPM_CLK						10
+#define GPU_CC_FF_CLK_SRC					11
+#define GPU_CC_FREQ_MEASURE_CLK					12
+#define GPU_CC_GMU_CLK_SRC					13
+#define GPU_CC_GPU_SMMU_VOTE_CLK				14
+#define GPU_CC_HUB_AON_CLK					15
+#define GPU_CC_HUB_CLK_SRC					16
+#define GPU_CC_HUB_CX_INT_CLK					17
+#define GPU_CC_HUB_DIV_CLK_SRC					18
+#define GPU_CC_MEMNOC_GFX_CLK					19
+#define GPU_CC_MND1X_GFX3D_CLK					20
+#define GPU_CC_MND1X_1_GFX3D_CLK				21
+#define GPU_CC_PLL0						22
+#define GPU_CC_PLL1						23
+#define GPU_CC_SLEEP_CLK					24
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_XO_BCR						8
+
+#endif

-- 
2.34.1

