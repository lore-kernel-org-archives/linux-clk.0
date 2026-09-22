Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D24F48E0DE
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102707; cv=none; b=F1kMj/uRERbt4WXytGP9FFUizBgMD6suT0Uo7r2fM6mXpfruJ0mOaSP2NoVw8dpso8FM68pGkViSzVOGmUCSX7wMbOi7Tuoro+EBdxn/Uy/LfzXzSHmjIo3ig4EVWjoMVyVOk+6svpGqYE8mIZFn0Ey/ihFtgyMc1eFMwGFBZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102707; c=relaxed/simple;
	bh=IHl96VfDfSLC8aLKVP1o5N9BHbNNzUMjoemjAMwnB/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBDLcnDCoBOs/3v3lFfuNUuBP5T0xcjYSDG1bT0dRZPqrZDx+Jvvs69xhU+N7GN7GXgDdNqpqe6JeaMjR+Y85IMfdU+R62g2eWYaWdZ6lG9UQiWC/S0pN+OFEccRmbX2hY+0ZTIfJUIJ3eqk5eEQ8o06v88H0vFzGARMyx1ICxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfqWqFB3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLqJ8NXP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfqWqFB3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLqJ8NXP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7CmA368041
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eEmsPPYN19I
	2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=; b=FfqWqFB3ULldsfn+q7fem/Pbrq9
	x/eu+G6pJGRmDai0e7nNnha634ATzEsQb9o/9mISrYBVq0V3WPqscFv21CRLfTEb
	emS+cV3LVV1sUSm/UECict73J8jl0/QTTY9KBEhcIGb+q+VwIuEKrg+99dcRclW4
	2z51dsmdgQH7bclEIa3ZVcHAyOZESA6g210xkidhb8qa0j1OlyS4AGsYHP+RJtP1
	otXdlDWPUC9AVNDvOvLKZ/XUgT8mJtKTyvqmZ1RvWouNCrEkcqr3Of1BVa6VYQ0n
	7LSHUh5bRQ/wiyFAimKqiCxhO4fUeVIbvq5swLLqo7lZ2sXXASE8/BlFgNA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnta8ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:45:01 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c83007a11cso120176e0c.2
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 11:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102700; x=1790707500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEmsPPYN19I2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=;
        b=CLqJ8NXPUJ+VHYixExMTi0A7o7xCByrNvUKkJje2jh3QUObfW/8j7qvAM6/PUJ1BQn
         M4Sr1GddjUsbssV4xE+WKytp6BMVFR1JoE+dKGpXKGlvOt95RlPRvytWVFjnxI+pzIpv
         jDzpgbo6+Istj/A0b2X520jZo+PqoCd7cigNHcwxJFrV8H6uAPlLoeBU89aUVTn1qNuf
         kyf/61DPrskNxM/Ca7YQdS/UzwVgJw0eNpCUL6rJaSkj05Q2Sxq1128oVm7MnO5wUEJ+
         VdY3Sqt5xa9ijZFzpkcmYx5qsukJ1nHE7IwqV+jo283cm9y9OPX0WPa107KUEWh3+QfE
         aWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102700; x=1790707500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eEmsPPYN19I2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=;
        b=Mhs1U/sRSjjZoiWothDq6fh0E/2E3COWQC6afsmoTYlGgj+blRy/gKS8augMF0uvSh
         XsBbcvMmQjWe5eTSeN0N4r0p9cKlm8z7BkBdowkx4wT4XgqdREaznv41JoGeyOOU28Th
         f1hOaxHHanGVSdOYqO1y5LwIvp7+xvEziu8rLcf7L7UWqC3rll6oqYplBKGxZn0wV+Uz
         DkiKrXv1pFw7VqW2p5oSaHefajMUeutkdzpbvwuwJVyRVSrHk6dSBQT87EebZqTPxXg9
         qDYjLcc5YNT4f7f5TRN/mF0qemYJ/LqYu6wCHKSxzS/26M1Q1DsvBbuoNsVwaoPgfx4f
         xeBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1Yy9nAAPHS2GGSMZCwRKw6yQsg4RtMbEzY5+j4dYv5HIck15pTkfjwWEyuEN6bgkrTgBYV64v2ck=@vger.kernel.org
X-Gm-Message-State: AFuF++n0axEmPJh+FiklCgVy9Vtq2ddzFfRvPwP1v8KKjeCRjAKKYhKI
	Lx6oY+5JACPC3cUuO90gIvwBYjXZEYrUFTVqdZnGZEAk7RKQsgR/j5CTWAJkb5sFTI4Gi04wFwo
	X58CVVxi0Ri1csIE+Kyo02np5TcL6TIVCaWX7XKDa3vZdr72oGz0hxN2xyAdIshU=
X-Gm-Gg: AYBFou0fZB5izM6hpPbhw99Z4Mv7teTRZdzc6qq9gGyosexrtxUzeRh+fDWE/j+MNYb
	NXoTdJIs2C8FDaHQLSwHr+Svk9Opkdc5zi5/n7vYooBQbRE43/2ZnGVZbjVrljatF0L0CmdFQTs
	cNhm1vWLwk1a/QXyjxcVjAlug4pzltW4ymSOTgqVeEjYwRm1FRg5QT80Iz7+dIiwmAGuun+0+lN
	TAvaIFGprmY6DsOGLiLrLVoSJsJILnyvw8hwN07mQLmAciXWfi8RXnlKuQLGoHvDdpAB7jLskUJ
	cm+Wsv4ept1C/6bTvZoRb+dn9utU0vHCi1dnaz27U1mg1e73CmtgEJwLvDl+W7XrmPJyKFjxXcE
	PNZjyAU/hqY2o0Px67IjhZtgPtKUPH9MzVlrR9XKQzC0PoqSbnA80UlnCO6z1W+5l
X-Received: by 2002:a05:6122:d05:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c9f15812c5mr813162e0c.3.1790102700093;
        Tue, 22 Sep 2026 11:45:00 -0700 (PDT)
X-Received: by 2002:a05:6122:d05:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c9f15812c5mr813136e0c.3.1790102699722;
        Tue, 22 Sep 2026 11:44:59 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:44:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] dt-bindings: clock: Add LPASSCC and reset controller for Glymur
Date: Tue, 22 Sep 2026 19:44:23 +0100
Message-ID: <20260922184425.56114-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GOixvZ8GvmrwP734j0pvIoGSR8z0GpYa
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2ccad cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-l7Lzzg0JijIaF3KBckA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX67ZN6lRLvgGn
 h42eo5ZsoZG+OK5kJIMiLZQ4zXqjF2nfWMIe9qvBJtQYlhHkFyFWAytagH86mqkA3TkNP7dLYbo
 VMqFhbdzFqCCDYbsRGHFi7N7S0i3y4QWrTcdRo7JA8Lyv4cavOhmZ7xAGQHTIbX8xsjJNZcIRkH
 E9ZjiFQzkv14Bj9GUX+4ZaQa0bPtyJ7Vz1eVQT8wCds38L5gZRCUv1XfznNGV4o1C3IUeftznKD
 ZgyVbzxPxkjIUEDoTpmLWoR2SmSUdlAU24N4Eav6/KjF94tN9VcFB0QiVonBPovs5O+UFGlKuQK
 363p1nG1Ka1PVHy09v9Ge4wb3KOWAcW+ZTQ8cP3ems9E1H9+XbftErkDEZfUsCbzO3PgrWVwnRE
 4q9HxmiFAVISDrUItVVAe+Yb02MtRXJ3O46S2v/rYijJn9VAbFsB/bqT/bguSY4GjOBnB2Bs6dM
 S+c+oMwWmSi5UFdD40A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX9WsvIZNpHDpx
 IWc9aQogHCTAA6pg/EhlhJJ+A1shYkmMZN3xVRiO2DzsXrx7MRPsHNAEk35TV1n/Srw/AHfMH/l
 Dkkdw+MfHJwzjlWhglOH9iWGaZPA0Vc=
X-Proofpoint-GUID: GOixvZ8GvmrwP734j0pvIoGSR8z0GpYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

The LPASS (Low Power Audio Subsystem) clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-lpasscc.yaml | 10 ++++++++++
 include/dt-bindings/clock/qcom,glymur-lpasscc.h        |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
index c047c0174a93..916ab1b3dbee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-lpassaudiocc
+      - qcom,glymur-lpasscc
 
   reg:
     maxItems: 1
@@ -47,4 +48,13 @@ examples:
         #clock-cells = <1>;
         #reset-cells = <1>;
     };
+
+  - |
+    #include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+    lpasscc: clock-controller@33e0000 {
+        compatible = "qcom,glymur-lpasscc";
+        reg = <0x033e0000 0x12000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
 ...
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
index 3006b12e385e..3fc8e7313cab 100644
--- a/include/dt-bindings/clock/qcom,glymur-lpasscc.h
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -13,4 +13,7 @@
 #define LPASS_AUDIO_SWR_WSA3_CGCR			3
 #define LPASS_AUDIO_SWR_WSA4_CGCR			4
 
+/* LPASS CC CSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
 #endif
-- 
2.53.0

