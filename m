Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7153955C6
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977784; cv=none; b=j9HBGdzYOI07xC4AHikTWi+eWy+X+yXL6A3lDmLMhGXARnxkz+5AGOLuCf1FFjF3/ewUfqIO+62NiPX6cVollyOxbaDWkusgWeWuTv88NIGsNkoAg+x3y4Sqaj4FsOS2wrKWws23UmY+DVwPKRf32Ok19/yzoWcfVXDwae4+VNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977784; c=relaxed/simple;
	bh=IIZw68wl/zgbFUJuSWJ+8Js+fM6YD6bI9jBv45CteyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RXasNjyPXxD14+4rCF/N7ebKnDWzYjcX29mTb4llKUkk/MeFHXoSfrF60rK1jEyJzA79WLDUytIGYv128Kzk7E1kEWvjNZQWzIX8tu3mBRPSXq4En9gwWXlpJSbhV5c5KYTj9sfiNoTiz3SPO6zNffm9zFVtBGn5RLCw7yQH5rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uqt+DPBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccmGrHiL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uqt+DPBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccmGrHiL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KI1l2959697
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 07:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=; b=Uqt+DPBqPVjQg8Rh
	O1c92CKhiIB1D31zY5kMDb+gysPIpFIzQYvUicrjJX6YFkkcQFdUyEvYTAVZX+d+
	xMMJ/lnhEzPXZs6/hKyfbxOtY54STqaRSmSOREu//e1BxW/KGaBGbZJMdY2r5FeT
	FY7D1cA24uGcjkZLnO7BdQXvWLRzmPydSgrsPWFZqhqo7v1pGlB9Luy/5cDmnkq3
	nPEqGTI25fLDAlGmj6VTfDq8fXbyqe0rcPlDCFxDQhhgyyWSwLEY2c3DznuMO9LW
	cWEbrGZ+QXqPaXWupkeHJFWrKsRCT6JhOtEXA2xjbZQiyaxEnEwRxG8GeuseA4H9
	BB66Xg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mk15d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 07:36:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caa9a3cf7aso2381295ad.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 00:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977778; x=1783582578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=;
        b=ccmGrHiLSZa83X4+Qo41pRR9tDo77hT/bhqKEFKK2K8D2jGQkPadqBszmSLhuV/8to
         x3239opp8W1amyYhDLpiSWABtkIj47r2ASnRdxklDv0gBeIZYnpWoiHFSuHxcCZHIOsT
         SEHLSCrlADl8qndYukpLNaf1wsAhis+hLARkVKtrRvMZ0seS8yBirf3hNJduFCQgOmdG
         gyYzvIMs+QyVpH4U7vddoI2YBOyA/qVnXTSxca4hzlv0vnqKO3uxAzs4ElNrygYa5UsJ
         SjXLgWqqFp1y0Qbq+7s32gv3OC8tFui42ZOHZQurDqd6tzQcxRFQ4keEZ9KgAqXE+3Pp
         luOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977778; x=1783582578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=;
        b=ahon3rP/aJn37CFYgo3SvIY/fd/EFqKTra3a6cJ8ZlSeMAaEYw6DaX7Uul5GAIXv4v
         SUb1hpcoenCGbgnKgc4RysFdMTOrHDphr5H+7obauTiUvcFr1DBtzPLbpy3W5WjY1aGt
         OqnnkLgoue/PsN3Oof/TQFrTPcz1tb+IE88sEiCyVDkcWGFK0NJxXfgdsM+4PKscWL8Q
         Pqpeg6A8Em4KlHXrIMkPZacYVm2HKgMapqrwFu10/dKB2AO2yLPzfRRt3SFz1DqXcskW
         WJ0SHPk3ZmBDbWHmdez05EhbUytJUjt0eHiPZoaIEyx5BXx2kSMgw7gCG6kHZ2tRqf3T
         me1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrzukHGt9dZbNQj2JBUs2DseYtuiwKdvEwUEzE315cFvOZe68E6SFBF3Y6wptj9aaWU+u3eo97NmIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpjEz+9zCn/yRTujtRawzw2WbW1+Wr/uJs8DWIUaQJTKQKEYHC
	pfzIOve1OpSidJWA3KMka57AFI2t7wBhQf91bWMTLk+4P3V0IyNYdPvpWto9QhH2rMWIJDGoESH
	WmGemOXVRv9DWxDfAc9pk8blIS9K8zji7wINuahywII5PFArta8Nh2QDmM7YeHSE=
X-Gm-Gg: AfdE7ckELet817D3Kzrs9Y2CQlGno4KuDhCjDuCE+lH++DNCP7fB6BLkG8DZdN1evDM
	pifjdqAXP9Ir01ueV6/zGceliAh1QWvgBq/mbhUKqWeEYbwqqgSbMHktTiverCzfgfUNT7hXho2
	weqhlFemE3VylbCFl1t2w48pkz3nc4KLr+TF+eq2fYR2GaINj2pWCQ2GdfC4gMS5hwcSGq8tDC4
	s09uDHVXYeOpK/nFekO9YgIFBeHrySmwOYOy+fvUvqjysu8HTpIBTvkEPKB3GnurzjiJ4Q8LjK7
	qQonFrOjIDG/DoxpTxFFNU60N5FcPDmoyiRATL/sRIuojfeIUThWZFRWFiFQBNcC+r/qW1si2d4
	M3jKoRCQ3XjSLqIVsbwOr47fsR1kqyz+surwu81nW4h/FWG0n8PJX8VSLyQ==
X-Received: by 2002:a17:902:e841:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2ca7e6996ffmr39874845ad.7.1782977777923;
        Thu, 02 Jul 2026 00:36:17 -0700 (PDT)
X-Received: by 2002:a17:902:e841:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2ca7e6996ffmr39874595ad.7.1782977777321;
        Thu, 02 Jul 2026 00:36:17 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:17 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:12 -0700
Subject: [PATCH v7 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-2-776f2811b7af@oss.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977772; l=1807;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=IIZw68wl/zgbFUJuSWJ+8Js+fM6YD6bI9jBv45CteyQ=;
 b=7wmyaXZcZxqklH289+3yUAWAyBTcA/URY/dEc6HP983ynw686PNOtey+Nci3MJoHFab2d2rnr
 XRG24QenDklAdmc2Pg3dXtg72hvMVytRSKUbakMu7hSQ6RhIGWGC7l5
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: USbwW5Ktf4_xciHgbCfEZKT3C2o_PZQt
X-Proofpoint-ORIG-GUID: USbwW5Ktf4_xciHgbCfEZKT3C2o_PZQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX0xgGfWpC3u1Y
 +xQ6Hvl8ZBOr+HbpL/9RZ2vZ2ZUuertfQab98eRcqj0mHanNsJvYguaNK2WjZdntP6ybUR1AAII
 WpAWc7/Qi0IOrsnoCoPiUiyz8ZL6a6+Qtdq3q78Fgej7G0Q5hJoCRuT4Zcr1jeotJiYF1ccz1iu
 skJy9QWwHbKc90VuVz51MJZEyJvFfZ6fR6OcFxZ3jUp47hgv3WKYT1rPPjot7KZP1ikhpSkcN46
 bun+ynEbsu676SxgKA1kH8+WtpwDrUEIsiKOu0TSCYsbSd7D/E/xofyq+WtySBNYBa+FqR5oY31
 nZWRXjXC0cMaAqd0aHhyy44DCIJjLSSiiKId9WC0DagEUCP2KaR0onewLlTpYgJ6fQK0OtAs/Ay
 BpYgqK8/jNhZZHQd4oB5WhNwEXNa0/PgkbMA2D/aTBEPOP9UZice10A3aMpAaR/8z5zJkNY3fS+
 iy3TP+Qxk9le9Ri7Hjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX/laGfR9oGoSP
 aajrg2HqavihnxsXSueUrHRUXiBG0GQTVjOD7YAONbq+iEj/7xvI+aemN7Nc074rS9KemOkGguw
 NPGH74vJJPkJj6tjCdd6OVfkV2cuhic=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a4614f2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tHEUkVd5BVjdM4dvyhIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020076

Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but has a
different topology: a single QREF block fed by REFGEN4 only, rather than
the two independent blocks fed by REFGEN3 and REFGEN4 on Glymur.

Add qcom,mahua-tcsr compatible and document its required supply
properties. Note that REFGEN4 is supplied by regulators vdda-refgen3-1p2
and vdda-refgen3-0p9 on Mahua.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-tcsr.yaml  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
index ec89feff89e4..2b6422627165 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -22,6 +22,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-tcsr
+          - qcom,mahua-tcsr
       - const: syscon
 
   clocks:
@@ -82,6 +83,25 @@ allOf:
         - vdda-refgen3-1p2-supply
         - vdda-refgen4-0p9-supply
         - vdda-refgen4-1p2-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mahua-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrpt5-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx3-0p9-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
 
 required:
   - compatible

-- 
2.34.1

