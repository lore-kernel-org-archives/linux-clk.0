Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4636128641E
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670979; cv=none; b=Hatn+LK86fe9GM9uAzt82bEW+u6CbInBKT3elhFiWMLaMcUp8FMDkNvRNcSlQo/xo76YoM/53GTAhAGVn3XY3qMV3lgWf71wLD3311UkPgqcXmOxJ4W3T0f+I5q5wiLVB8FRbUJhaxI/pfa/0qqqmDXgVRFIh6Qn0ZA7oAYWSV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670979; c=relaxed/simple;
	bh=Q1YVADOEM/H8yPrWBx2029EnPk6N4Dn4QdnUNTrIaLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q56n8s2P14rG+yZlwRqz5f1kqwHNtLGEotASQmAUcVPUj5M6YTQDq23nr8Ya6VVDFDrjX5xGHafvV4gc81jqs2l5bWsBK8tzg2ZRTBHQgA8q7lQxqmT8ndzmXdZgkV/wvr1euXIyNjCnXYQ/E30Y321ZnDjFQ6Ya34jhKCwxHjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Psx91NOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KuviuyRf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Psx91NOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KuviuyRf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K705Vl1341507
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 07:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fT/5fdSdZCDjQY3XGwGGBbsSTLW6mbYW5o6yxztcETQ=; b=Psx91NOD8vtG9rLK
	HMh93K2AdYpHIeWzSBAEE0C1EoeLpl9ZSdLRvDrE0WNTdmwHdl98xAinS1fVD3YS
	0JwjeK9G8RLTVKUQbs+csVjhluwAHagRV7vGk3L6m9MRICMjheYYbQJoGklAFafb
	zhApjtsQRhA8EomU4iosTF7sbSEgBCR19Sn4l4hPRUgar1ti2uuE2aEI308elXgd
	5MpgtF1wZonOLL68EfrxRJKNRjSZpWDTq9qKpa53YOLVB+TEFx1O0WOfw+BC8P6H
	RUN4dVpQ+eCGux0CGX2ipUkLY6rx6INj7Ixi+Ubw/jKk+/ukMHGhOn+fV4wmrZnF
	t1BQnQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34hcn5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 07:42:56 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12734af2ca4so1427357c88.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670976; x=1777275776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fT/5fdSdZCDjQY3XGwGGBbsSTLW6mbYW5o6yxztcETQ=;
        b=KuviuyRfMhsQQfDhKG7ni7PF7Wsiu+TVCb76j8GC8S0+9wI6bDJ/fB48UQomD9H773
         y8bb3NhQAfTo0cmp0BT98W0mh0hYXSxyuWYNKbnDKhT/xRpTh2UA4FkCfiB56WTaJ21T
         e6Nhgk3v2ELm6KD/OQz4zL+QTL+ZAFGtT0WEwN2JK57wDU2JKvR0Ys1xzr55iEdfgXe0
         2pqE1a6zEmf2xRa4q5Xf5ncvYKL2f+zMA3DpbiQJy4lrrUXZeUhNmWidNPYvkugezruB
         b9hOkEJtmjQdiFf5Fw3uxnse3pM8A/sRFL9Eq3GfXbiFNVCBuMOzxTuy1ra4uo2ObDrL
         E4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670976; x=1777275776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fT/5fdSdZCDjQY3XGwGGBbsSTLW6mbYW5o6yxztcETQ=;
        b=kiRWdZyOAI7LGVvNZGVx+o/LJfGh/JmhQnjJ0MOlCZv2aBDV+G+YnshcsKYU0qzInq
         FuNtvhJUCuzrP0kfdyApY+8wMyMZvjhFrXXxNydp/kgORBtdk7nEC7Wv0JL+93bBrqnC
         awQ/XXiu22FsmQVUaAcvtohh041iDWvV9Ede4kQ0sQ9K+ArB4J4lo3J0m7HjFlngVa/3
         WIWO//j0blE0iJv/R051qgGF7XFaPdiQjX4vZy3Vxc9FfRN2LahVIxZ3j3qPFrZWOYPG
         VtC9y6XNRSN1gf3tDfPSAOQAoTayGX3L8TKSsvdO2hZm9sif8RyXZH0WDkFlDakqS6gc
         ONOg==
X-Forwarded-Encrypted: i=1; AFNElJ91bsSljmvv+A0HK5OIOAvycyQpWXZHLzbWZzUPbfkmgFQYTZPrjbL7ajARPwT8IEQPvVuGT3vb6HI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywod5kOuMtVAi9rqHVTzA6v6SWc4pcJxjhXy8UV919kD3z0mRHS
	f70SfoP+HPhJZbRWqHzmMguH0+k1l4fw7tI5wsXskbmUcDW2a8GcLwvS0uRoQTmvdTufbJ6PU14
	QVuJnfV/MwiHdwqfoOIR/XCo59DKlJ7UUnj+hns3LztBdmgVRfRNWVcOTFjWJ5/8=
X-Gm-Gg: AeBDievkadSOAqj/lzLkzv2jWuhvDzc3GTsaNByy0qP8Css4pQnbD0yTRSsopVWQ6RZ
	d7+1VdGLNbUoUpw1F6wlJQGyjIh3wYhi+tAdcLZeax3S9MbGFxNWO5sHGnEj2Yj+dIzR3tidqLJ
	0o/XN5aQgpFeKAnz2n4ST8fOBzbwyyo2VkMZ+oa5C46yNe4ebXcZNnrwgZQ5wyXxhKTeAg0aCao
	sbDrhrs7gDppBxjXKb8jfyMBXUwHJivJblj/qKcdcCwBZilipCnLXF/9u1in/IO3RHvmk/8qt92
	VcLyTFJlNtM9R88eYQv2Rg5LhwvXvxavIdhoyvdZBXQeASZpnZmXRZytsQvR7UkXZFl2LsvTEiN
	Jx0Km2knn/+mg4XC2Evi8g+dI6V3n1fhsZAgm+NrDSBdwwCkJoSNOu7r7D/T3IvNQEsx4T2gjiJ
	sLsHQ=
X-Received: by 2002:a05:7022:fa2:b0:12c:11d4:61dd with SMTP id a92af1059eb24-12c73b39a41mr5122725c88.18.1776670975882;
        Mon, 20 Apr 2026 00:42:55 -0700 (PDT)
X-Received: by 2002:a05:7022:fa2:b0:12c:11d4:61dd with SMTP id a92af1059eb24-12c73b39a41mr5122703c88.18.1776670975346;
        Mon, 20 Apr 2026 00:42:55 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm19866217c88.10.2026.04.20.00.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:42:55 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 00:42:52 -0700
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com>
References: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
In-Reply-To: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776670973; l=2215;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Q1YVADOEM/H8yPrWBx2029EnPk6N4Dn4QdnUNTrIaLA=;
 b=2Ppw1ayWt6U+LCwDrGerHPiMKcUEYxUpE0Rh04Xf6IFO1CImct7kjsoQXcSH0nLaMpj9UmHiy
 ZUZX5kbMIKzBdfN+QvTLMUFlTACjPIg7+/NkUVnk10rk4lkyd7qILsx
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e5d900 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2TsNLSZGWbgVkw9tuboA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: JUL0bRlWPjOtF5IA7q5dS-odWbyxEuC9
X-Proofpoint-ORIG-GUID: JUL0bRlWPjOtF5IA7q5dS-odWbyxEuC9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3NCBTYWx0ZWRfXz8DBELWRfOo+
 cle2q1cxpJPb4qPB38cMExMT11BqqtYyCJmx6e1Y+IptsLtNcCINtKBpwyI8YYA65O3VRTJKZMj
 SVd7XwyYNa3XpUeEzVsvvptAkVoeaNpKDxsTlVs7KCpQYPdERFXOf24GdqAW9fyqv3QVBOZTZm4
 lIasKNJ9o/tAhqRgSbmtN5i/8TU76F6F5GIcQH6LHwyMm9F0U7wCsbhatmn/UqQWd5yfL65S2BE
 AKkvolN4VvXHJz68+X8Ili6gpiwsLR+rUGyWlRsTxtbiIwqCsAbjuWIePbdnBVJ5zaS94zD55HN
 +3ebqIePnTBUr03Z5Xxzjqut0iJF+FI6bOt0hWYQ5BiPfKuQ653CUOGAyjkMTzToLn5FMNjrZCX
 uXA+Wjlx3O/C5Y5rfwGEj2AJ+FCnzByDp4LuK+Y8GjTMYrCUVRM3sTkcS+CZZZLk/l2Tze0BDST
 fOd7vNRNYclXPhYg12w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200074

Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
required by clkref clocks.

The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
QREF TX/RPT/RX components, while SoC-specific topology and instance count
differ. Document them here for qcom,glymur-tcsr.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 1ccdf4b0f5dd..0cf612e6d7ee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -51,6 +51,46 @@ properties:
   '#reset-cells':
     const: 1
 
+  vdda-refgen-0p9-supply: true
+  vdda-refgen-1p2-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    else:
+      properties:
+        vdda-refgen-0p9-supply: false
+        vdda-refgen-1p2-supply: false
+        vdda-qrefrx0-0p9-supply: false
+        vdda-qrefrx1-0p9-supply: false
+        vdda-qrefrx2-0p9-supply: false
+        vdda-qrefrx4-0p9-supply: false
+        vdda-qrefrx5-0p9-supply: false
+        vdda-qreftx0-0p9-supply: false
+        vdda-qreftx0-1p2-supply: false
+        vdda-qreftx1-0p9-supply: false
+        vdda-qrefrpt0-0p9-supply: false
+        vdda-qrefrpt1-0p9-supply: false
+        vdda-qrefrpt2-0p9-supply: false
+        vdda-qrefrpt3-0p9-supply: false
+        vdda-qrefrpt4-0p9-supply: false
+
 required:
   - compatible
   - clocks

-- 
2.34.1

