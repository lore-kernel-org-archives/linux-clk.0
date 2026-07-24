Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CCD3CF218
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887828; cv=none; b=Vt8SrF0pRNYRj0HTCmz4srBFh6P/gCbxTAnbMIBbcv5f5LbsQbHyjaNzws/wSv00HZV1NpCY2v607lXeyfin+aoJ8Ndmx9mywc4z7oFoDXbKlOKfKr491fFlZ/TD+YB/tCWAcGnPVyemp8KTbRLMIKq+D8hCWcLi2KpaswnaxOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887828; c=relaxed/simple;
	bh=3MohiFJRk7R/WUpguwJ0RoRbuy1k8TNuGFgJUfVj4ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ucbqeR1YjuqRVcc8z0XGPi/81lc0qEwxFmswtX3scYblcZIQiqEmrCYV2BhAj+OZYcI/csXWJkuNje9zLfb7pIvn+FQs6oVd7eQAOVjfPlt5kp5tST8e4qo+GebxM47wiAFmU8Z5S8K2AuME1xOAnGWmxR49A050KbCtoG++Af0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QR8V1CVy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBSpaqqm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QR8V1CVy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBSpaqqm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O9ME8q2754963
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=; b=QR8V1CVyfPCcFJ3q
	NK/egd/3MwAjBzPnIsTCy00mlPkIu8rHRvwKyxLqcJ4H9eVxBRpI6xzeg9RT6aHh
	bfby0ptjtPK6bXuqPo7kdRs0uD9CwXomaMqXQbJfjt6vszYUuSeDqppuLdxIIj50
	5fOLEUis8zaODZKMMkq0nEc1dghauNin2dn0JWxS5kpx7g0ctMUEszQfdMxzKnCg
	UUkBIUGqrjoY4Gf0FE6/JEfxtZeMb91yW/2gSJgbRGNfeb0YTO0iJPerWqMKrVvE
	sL4Bacpk7mHdKqavQYHLNH1VOtbV4y2IsarI7XCqn6vou/DDHNCIG2DBgv10Cyr7
	sZmk6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byr5tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:10:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so3884695ad.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 03:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887823; x=1785492623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=;
        b=cBSpaqqmKYXuK+kT/vb3uPE+E/96APXsRp5XIoSrTNNhWDkySPfVl6BsdH4uQ7THPA
         R/wEbL/ItJ5zubjh5gu6ATXNp/AKuwerfatZczHLCkO5y4N/Dw1f7smmgEffvtPFHrKC
         MruNTuAwmBjcsQdWZMOdw1jXHuQmZMVXBEimMMqqnyLJU7LyKONy8bxC0TNHqUVLt3yH
         +inhiiUoS9GCry6HGC3AwAbI5LPKDn9uTVzwvgaPLq39drQJ/RANVUNOELoRY8bYWA7S
         7QoNtOzyHPi7uNxDxw9ufucXncFoOJjOxddq5tWnm5xPvynVvQwSuGWBasUmVLpF+oZY
         yUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887823; x=1785492623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=;
        b=kTYNl1zRl3lEXaaJ8KR+y/hRGHG8TPoTRx0jtNdetN6Z/IWvDk76thxj+fyq6rx9g9
         5kG+wGxjWknSLDlNyi12j99XIczEwah8W+GXWG/2ScyKPoumDU0YDbfqr3BqXnAiFmjf
         6y+Z3hfTqpBYwAIRIpZIpeJ5Meydne0SUw6D/aTLvRRYvNK47e0xf22wnmT5FPGCGmgq
         5ms+bVpiOGKia2pJ7afEuU5ouDRDNiYoqngiQvRwj5VNs3SxPr9jdKW+jl2bm+Zsky/o
         2sib1/4tNhmXt8meOxgecOv1nSW08lOOTrS4hwNrE6yoJl26WE98NMOa8+U0MqwZtyHz
         j9Hw==
X-Forwarded-Encrypted: i=1; AHgh+RovPetdC7nLpT26l6PW9oTrQ02jpfjMw6Zd4cUe+/8Ls80Bw4ZyGBc6PM7xQObiDinrUhl9z4ZpPqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLYo6nH9+7LYN/86Kwx0rT9xkw1opri+uyWF/SuutQYys2wsjV
	U9hMb2mHapnEsusY+PAkWVtl4Xg40o3LBQDsfH7Bzp+6X8IhHZeV5TUkAYJaL9uZalzHQ9jVKph
	0uMv0vMtki7XYruTkAixr/RgtgLn+rEQyjKp0UndMSVOuIsQrGYE0FSbZbAsywpc=
X-Gm-Gg: AR+sD102ZlNXCgAMvs4Bvig8p62P+WFX4EYlYNKkhxL7QcupFuu/VLL/K4zQBFd+u22
	VRDMNbPLdFA1/f31+LqtXX+Bb6FxaK9psHMjKUzlFYeUklKAEZyQn7vJ+yS37x1ud1GZ9dnXYpT
	ZK0x+LwKcmBnz20jX4K3Sxw0MjpOp0CqKJOw9JnHIQ5U0JCdT5Go6BnJpgJtgQq32H+nC/YFML2
	0nbS1d6edwj5InLPdCsXd/gLcuSq5RgnWzN/kHJtvzEeI60Fzz3GKk1Ejevg3A8QYuMmAgvdbEC
	3pb2bpjt6iAO6XDMLH3FjNCJZ24+nQy4YfBJ7mdbPFfeWTNY6G1Nycw21LUV2BcO4cFEa4xip4m
	JpSXzklZHgAeAkYl7FrDQcaNO
X-Received: by 2002:a17:903:8cd:b0:2ca:52ce:6f91 with SMTP id d9443c01a7336-2cfa6c540d0mr77915775ad.27.1784887823193;
        Fri, 24 Jul 2026 03:10:23 -0700 (PDT)
X-Received: by 2002:a17:903:8cd:b0:2ca:52ce:6f91 with SMTP id d9443c01a7336-2cfa6c540d0mr77915545ad.27.1784887822757;
        Fri, 24 Jul 2026 03:10:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm47863705ad.79.2026.07.24.03.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:10:22 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:40:09 +0530
Subject: [PATCH v3 1/5] dt-bindings: clock: qcom-rpmhcc: Add RPMH clock
 controller for Maili
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-maili_initial_clock-v3-1-45b577241c91@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 40utm_QhQbFnnoCbMSiIChhmajuYiIpu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfXx6ImMaoiyO/H
 ztJrVUf9Je9RRpAIPg0Em2NGLvlHxMrQwElARqb8Fb2LpST4+65eGoCE7+wbotJ1pJEY8GXVvg2
 gu7KXUdP7RRsZR+nf8G9Yy6xY/dURbE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX/+LLeKlN3353
 kEyawEAps/OQOisaUMO1sabUPXZmhiskhJGXqNL7VUGx1MCowqsrpKDl5NgdjH7mOP2fl2rWuzi
 kCe86ALnVg/HuhIUTeT1+0l39A89V8xpDFTRMg5UPcgyfXPrCpVGFRGiCiSHzZHi7rxvUy6MLkN
 LZ5AXj2hvj2i0ZP5by8FZn98TuNhFUiIsAI9q7O9M3RkP5OKbMuXrkMLj9GQROFvH/TD3OWltJp
 bkZ3FxixFElUX4olPxsGzfGDMkMwQgfLYgEf/4yohV0iKOWhuwTAtof/vZB3AtWAw4IOptV6AJl
 Lr1/zLwHFy38Y2CVu4BJEC8FUV77DQmkdIpsD4Op15pfzVoE4S6BhrqKMZuSlIeBwzsfKoFfMB8
 vIoQHbkly7qAUDkbCPA1az1PNJfnYk5mnWTvnnp6sCd7YG8n4PkJlVLpko2KYvAwd2z0mD3L9vB
 I3elFYRgo5FfLN3sugg==
X-Proofpoint-GUID: 40utm_QhQbFnnoCbMSiIChhmajuYiIpu
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a633a11 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OozyDhJeiyY2DhU_uTUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240092

Document the RPMH clock controller for the Qualcomm Maili SoC.

Maili SoC is a derivative of the Hawi SoC and the rpmh clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi rpmhcc driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     | 65 ++++++++++++----------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b33860429527246484560823074f52a9159d..2b446aca5207c9cc2922635b0539f2d2f926ea0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -16,36 +16,41 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-rpmh-clk
-      - qcom,glymur-rpmh-clk
-      - qcom,hawi-rpmh-clk
-      - qcom,kaanapali-rpmh-clk
-      - qcom,milos-rpmh-clk
-      - qcom,nord-rpmh-clk
-      - qcom,qcs615-rpmh-clk
-      - qcom,qdu1000-rpmh-clk
-      - qcom,sa8775p-rpmh-clk
-      - qcom,sar2130p-rpmh-clk
-      - qcom,sc7180-rpmh-clk
-      - qcom,sc7280-rpmh-clk
-      - qcom,sc8180x-rpmh-clk
-      - qcom,sc8280xp-rpmh-clk
-      - qcom,sdm670-rpmh-clk
-      - qcom,sdm845-rpmh-clk
-      - qcom,sdx55-rpmh-clk
-      - qcom,sdx65-rpmh-clk
-      - qcom,sdx75-rpmh-clk
-      - qcom,sm4450-rpmh-clk
-      - qcom,sm6350-rpmh-clk
-      - qcom,sm8150-rpmh-clk
-      - qcom,sm8250-rpmh-clk
-      - qcom,sm8350-rpmh-clk
-      - qcom,sm8450-rpmh-clk
-      - qcom,sm8550-rpmh-clk
-      - qcom,sm8650-rpmh-clk
-      - qcom,sm8750-rpmh-clk
-      - qcom,x1e80100-rpmh-clk
+    oneOf:
+      - enum:
+          - qcom,eliza-rpmh-clk
+          - qcom,glymur-rpmh-clk
+          - qcom,hawi-rpmh-clk
+          - qcom,kaanapali-rpmh-clk
+          - qcom,milos-rpmh-clk
+          - qcom,nord-rpmh-clk
+          - qcom,qcs615-rpmh-clk
+          - qcom,qdu1000-rpmh-clk
+          - qcom,sa8775p-rpmh-clk
+          - qcom,sar2130p-rpmh-clk
+          - qcom,sc7180-rpmh-clk
+          - qcom,sc7280-rpmh-clk
+          - qcom,sc8180x-rpmh-clk
+          - qcom,sc8280xp-rpmh-clk
+          - qcom,sdm670-rpmh-clk
+          - qcom,sdm845-rpmh-clk
+          - qcom,sdx55-rpmh-clk
+          - qcom,sdx65-rpmh-clk
+          - qcom,sdx75-rpmh-clk
+          - qcom,sm4450-rpmh-clk
+          - qcom,sm6350-rpmh-clk
+          - qcom,sm8150-rpmh-clk
+          - qcom,sm8250-rpmh-clk
+          - qcom,sm8350-rpmh-clk
+          - qcom,sm8450-rpmh-clk
+          - qcom,sm8550-rpmh-clk
+          - qcom,sm8650-rpmh-clk
+          - qcom,sm8750-rpmh-clk
+          - qcom,x1e80100-rpmh-clk
+      - items:
+          - enum:
+              - qcom,maili-rpmh-clk
+          - const: qcom,hawi-rpmh-clk
 
   clocks:
     maxItems: 1

-- 
2.34.1

