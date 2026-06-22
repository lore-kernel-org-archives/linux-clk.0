Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4078D357D09
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105098; cv=none; b=lqhWCf69WObV810dleg1HlekImLOvpjT7p4oWDzR4l9Q2Nl2+tbNwjzmS65UfYZ/DmHv2rURhclgIuySBgTru5+ET0NwcME0nrzFktJzNVSHG1TvCHUY0CUyf7gtpwiJXNbOg4ujR5z5sQJNylBGbfLWUqulNyUrR9FpcsDvZvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105098; c=relaxed/simple;
	bh=8DTNYS+P744bOozJQkgvmvf0NFM53z+xQfE4jjKNjX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lwus3Alma9kDAffHb5ev7GHBhN+7LDx16qa6Isr6qCvqp7UwybIrsAckJ8NVL9wKlbkIu1XlIhpkMibj61l2H8D2lYrePkl8Unic573HmQcChxYlq4Nbe01D9ts2DEDhBzr8NjNCoKY4WlHHkU31xExZ40LbhcZz6rMjwkSlaaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQ7nqszH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtAlKWL/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQ7nqszH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtAlKWL/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59OTg3786739
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNtxURgF27LsFZz4oh92b8xVTH9R5tBU1x6VEmvTsDk=; b=mQ7nqszHd9LYH8SP
	BDuD5bGIVn1qxJF9pLkhT1wpJuGgko4IcG4fWIQPfEm81ElYw4ibqEDk4gnV9Cu2
	Zmubmg343+KsV1O/0pyMKQW+cc6EOuWE//i6Z4qpF3q1+Le/X+gXnP5KLRxuVFB0
	GnSSawgp/hwmXMA3zewqAvy1sSq8w/Lu0hqzpHJJ2gtbSrIx+n3vRbtBmVkAyMOm
	wJhlkSI9d9CUptXG0W8ak7LBmxJHUUB/CbtcmVxhj7vbUz3df0PYASuYB+nbPZ70
	8xdDSdNwjI5nJ3MtyqoP4BAKcQgNoA4njnO+yKdjHcCiade6oPZe/eS1zW/MSsR0
	vZzdpQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewkmecq1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:11:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so2421911eec.1
        for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 22:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105096; x=1782709896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNtxURgF27LsFZz4oh92b8xVTH9R5tBU1x6VEmvTsDk=;
        b=YtAlKWL/b2QWOJj9dQ7mYRtmKAwNyKMRRGZYxG/Rb7mZLhjukHBR1Xw0pBzRU5JGwF
         R3xPJ4xKLth9NcnHoQhjVLEC2bRiZINKr1zKv/xrMBZXYj2xYCQedfmX94ZOR7COMWtZ
         1GKz180kEGBnQFA96jMwzfUOQiaLMZGPG/Ma/LbQZc+Qh2yhDwX4JA9KCQ7wUpneSDiN
         cbFL0tLXJh/dJExC4DZZohcGEjYXjZi22m+wzd/Aa1l/l5Jo6UkDemsoTdegFAPSYOak
         8GL4hvoM8o045Hwkq5l1UrpwWOCua01NdBSHhiKyQnGstdTBNwxxe/74kFvV5H1B3yXw
         aD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105096; x=1782709896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNtxURgF27LsFZz4oh92b8xVTH9R5tBU1x6VEmvTsDk=;
        b=LoT1is/mTzQSnbkrIHhtjNnCYcULaB/8s0TMFn5iaJTkGkiAFPzfpnxellyz5Kr2kz
         p6s/1ILPD/nEE2l1norgeSUCixe9ofE70EBd4KIsMr867gyePk0Q1OL50bZTVeFWFCxE
         8wN9IBTFSvVDGUVbHTmrJJND6g3iTFWQRkmpl3N5hftCaKmp/VQrc/kUU91m6/g/ugbu
         59yubZUHsaaRiO6sRhVZ+UZXkbydF3plxYH28I/cHF0pKVzAq7uuZBhMGr8yu3BNgfh9
         iy3eDsbiMZVY2MBLqRyjy2ELKWS6oPo9WGg16DB1OFLuxFCGwbWJM2yOH3ZkXK2OPhYh
         XlTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwkZkcPpLM65DWJVMe7YyXLHpu45+0xjTr4s+DNKCVLPs8bNmTlGLSNdE2VViDCqgyzMp10SsWWc8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0/RAEi0odsR/9smLFgBLJVvHWzlzGB0rWGGnV+QR1Raj8a9O1
	lWpv+8Y7W2HkLFa7HIVQSke7r+HoGAy90D19Nj0DOStK4MkFya+/FvZm0OArpDFtFIgU/A2XLa6
	au5NLOTAqcLQsDBOTNDvPDMo3B2HwEvmMJ4XdCg6JJ7r3gr+P/rytLaotb353xRY=
X-Gm-Gg: AfdE7cmG+QKwe++E/izQZJ2tJe+N7F7j4jwKEtn81GhqQvwHI9IIIJsChubWEPVBmWE
	pKicEZobk10QmklqeWu4wcTSQ/vV10V7BYDeQUaJuHKGDndVH+2HJuNG0vBw0cBxR5ZjlU5/TTV
	Y9fpnVwLtPYU0FU/h7NAnl+U3IY1o8xmWTpYEWWvN62Wl8e2yJi8+CmsLd940eFua8Z8Qf4QM7k
	2Vv6an6/tXvbbFM7SpD5eTyMaw+CAPLFmLhaJprYJxVoIiWHrwQGp9qPTZ3h8/WkcB+v4ByicgG
	E5NgwSOzDqEkqwe/DJDSJXc507NK/mejCRBwG68b5JWzF4P1L2XWI1v5nUwuPoJSyekhroeWE8U
	NyOeQurEdNKnZAN6fcgfsduwTFCj0DgkkFrVjJ+7POBV9Z1k3oy+TpCN+Bw==
X-Received: by 2002:a05:693c:2d8d:b0:30b:e4a6:1ab8 with SMTP id 5a478bee46e88-30c0ceac786mr8884475eec.13.1782105095826;
        Sun, 21 Jun 2026 22:11:35 -0700 (PDT)
X-Received: by 2002:a05:693c:2d8d:b0:30b:e4a6:1ab8 with SMTP id 5a478bee46e88-30c0ceac786mr8884450eec.13.1782105095310;
        Sun, 21 Jun 2026 22:11:35 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:34 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:25 -0700
Subject: [PATCH v6 2/8] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-2-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=3510;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=8DTNYS+P744bOozJQkgvmvf0NFM53z+xQfE4jjKNjX4=;
 b=gxa6FLaSvv07V0PsJuGw6iKWlvIpksvtN6PIz4l3pwzBE+lc+R9+GJU6hC5KyszsZ/7vtAMuR
 t94d65KWkmLAOt/RAubyj1uWYzki6aVJaY+AeCsmqtVd/oT2JswOgAy
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX5yny3Vm+7pcU
 uC+aYi/UWylqEExODDU0kgmljFQhOW1fReXczq0ooLEY95+WOd4sAicr3YS3BJdy7EeLwImBMKe
 tHwBH+kOhx9Bg31omtRBf74ZG57rcxEX5mY54jkCo9tGQ3RfEQWvb2lF1+gUctz1wiDG9rJYjwU
 aV6ERgPvRl6BXY0u7Gb04kygEEvwBv3/JUjWQaoB0TLMj2a37CXgVKmTBBXo05lPZwIg4Hv3jaV
 bVW7RHGAwy4jpCgZUfXUlUhcLKZjlGgmNHwq4dBdiEEsdPspLO9S4fxJyLZ6VurtO2deqtJIrqj
 tCCjSBaHfjzxt8DRN5B0m6whL6fwU7ZUp6Frw4ZDa5sQ1szs3wjNpw1oCEdooiQN/NuavKxgZOL
 ae4v0PDDHukpk7TXUopQszmnUdbNY1U/HTeH8ypTgWJvWztTJ1WE1cZwN3zbj1xTtV1LKuWciVl
 mnKG3T97wJDowKWE9Ew==
X-Authority-Analysis: v=2.4 cv=MtFiLWae c=1 sm=1 tr=0 ts=6a38c408 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lXSjqk9dN1moIixwM0kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 8hAyhnY7z9MzGqYwXBH2zRksBAjciOtN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX0y5K6P/AjJAO
 SK212pYZoMwGAgeD4HkGQ/DNhvURT3ZxbVy3bM8VIWCwYXROkxQMBpWZwlNUFDv8JzSgAT3PYr4
 nsMN8eDvrxG3dfT68rBH7x2L+kIySL0=
X-Proofpoint-ORIG-GUID: 8hAyhnY7z9MzGqYwXBH2zRksBAjciOtN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047

Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but
has a different topology: a single QREF block fed by REFGEN3 only,
rather than the two independent blocks fed by REFGEN3 and REFGEN4 on
Glymur.

Add qcom,mahua-tcsr compatible and document its required supply
properties.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-tcsr.yaml           | 68 ++++++++++++++++------
 1 file changed, 50 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
index 16fc6ab87f9b..2b6422627165 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -20,7 +20,9 @@ description: |
 properties:
   compatible:
     items:
-      - const: qcom,glymur-tcsr
+      - enum:
+          - qcom,glymur-tcsr
+          - qcom,mahua-tcsr
       - const: syscon
 
   clocks:
@@ -41,9 +43,11 @@ properties:
   vdda-qrefrpt2-0p9-supply: true
   vdda-qrefrpt3-0p9-supply: true
   vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrpt5-0p9-supply: true
   vdda-qrefrx0-0p9-supply: true
   vdda-qrefrx1-0p9-supply: true
   vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
   vdda-qrefrx4-0p9-supply: true
   vdda-qrefrx5-0p9-supply: true
   vdda-qreftx0-0p9-supply: true
@@ -54,26 +58,54 @@ properties:
   vdda-refgen4-0p9-supply: true
   vdda-refgen4-1p2-supply: true
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrx0-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx4-0p9-supply
+        - vdda-qrefrx5-0p9-supply
+        - vdda-qreftx0-0p9-supply
+        - vdda-qreftx0-1p2-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+        - vdda-refgen4-0p9-supply
+        - vdda-refgen4-1p2-supply
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
+
 required:
   - compatible
   - clocks
-  - vdda-qrefrpt0-0p9-supply
-  - vdda-qrefrpt1-0p9-supply
-  - vdda-qrefrpt2-0p9-supply
-  - vdda-qrefrpt3-0p9-supply
-  - vdda-qrefrpt4-0p9-supply
-  - vdda-qrefrx0-0p9-supply
-  - vdda-qrefrx1-0p9-supply
-  - vdda-qrefrx2-0p9-supply
-  - vdda-qrefrx4-0p9-supply
-  - vdda-qrefrx5-0p9-supply
-  - vdda-qreftx0-0p9-supply
-  - vdda-qreftx0-1p2-supply
-  - vdda-qreftx1-0p9-supply
-  - vdda-refgen3-0p9-supply
-  - vdda-refgen3-1p2-supply
-  - vdda-refgen4-0p9-supply
-  - vdda-refgen4-1p2-supply
 
 additionalProperties: false
 

-- 
2.34.1

