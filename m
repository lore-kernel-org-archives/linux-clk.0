Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3030D34750E
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 17:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803294; cv=none; b=HFGgexEeWglCQO6qzJhc0BwIcMDN6OQs7lbVtEwxKl8GhgcHS657g0ZuFlWM6rP2CHqcke8l1zY1x3zNC+AXwAiRHdjQNr6kCUs20QwEhpyblRLO16ram4sI9rp/YIw7U/C1AplMt9IcViaYKUxCpQMkhO6/EYiM2aeA0zMAQrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803294; c=relaxed/simple;
	bh=YI/Mex0URwAgKluiKtf+SUQ9oQRwcIZMu9IZBJRRJdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FWHfX2E5eISJD8phE4Q6+/opRaswmx8M1DgaqBqzNX2Xssic/gyO1vLVsYXHBP+EpzzMCZmSQ5fUZS/MzsL+lG+N7qVF/TvH16G6gCFRLJyGfPA2/Wyhiz6d6pNSE1LZF3dSB2AH6JTI6AMNl8V+uDbODd5zTVQxtG8Hbu/Wmc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BcAiT0Ss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khiLVkNg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BcAiT0Ss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="khiLVkNg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IHJdFJ436197
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 17:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgjqfnwWknIzSecqro1/qEn4Fj2XfAEkQHDgkyYnuEA=; b=BcAiT0Ssy1ECh7Il
	B8J8mEfxQrSOl9tk+XyhEEZn4K+k0nXzEGO8AAWID0HEOCiM0iEJjxjiGOt7BI92
	RDX7mqcF/U7GYw3S9uijXenRFgV9OAKVpM6SucyLCnWK1pP1RyS1xcJ1tgR294Dy
	fL9SEhfNtY/lo+JT8d2mvjfFtmZ6CCm/Sykvf+oHkwA0aZd70IY9hvgQdp53fKZE
	BvGEFDCRPakx5IOxks5z2GOBAr+G6SKpJKWLgymSlYYNlNEdYHJnnNWlgJ7PsST0
	NgvDMC3L9gyn3m+Oa3XKScD+dx5prwwpqfZV7nbD0nIPICeBVksoN7/KpH97yx2j
	XuSXZg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyr80be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 17:21:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b6f019so1347846a91.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 10:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781803292; x=1782408092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgjqfnwWknIzSecqro1/qEn4Fj2XfAEkQHDgkyYnuEA=;
        b=khiLVkNgsw6H6SWbmkGxqtl+xqbax4tr+K+pWFOS2WzH2BaRm0X9Wf8bscKoUyETHc
         O6rx/gnyICFyuzV4xfQAXVebrXC2eam2tfVrpCRGGIQujYj9GsVQq/5jddsYu7kWah2l
         EDlgQCo9fxK1I+r9laEVh8oXMB865uUvDXgOc3bo3WOXKPxgYF3dr4BQE5lvpHnbdMFr
         bjqKp/UqssgvARA1Cuw0d6rByJXv7iay0VEr8vpjbcCe2p42LIimb081jzQ28/pwd/ts
         uZnbeD4W6/OR/daBQepCilKPfBoPD4++n9BV0P8GczQxiJctrMereh0imyuauyTbynSf
         yCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803292; x=1782408092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sgjqfnwWknIzSecqro1/qEn4Fj2XfAEkQHDgkyYnuEA=;
        b=tGg+zprCCuHC6TQKoSAZ9CVUe5pypno2ELISChdrVVkXnq57uNS9jSvMGOoB2MEdfU
         Sg25hma+Usj5TKAi71KlgEoo5PCYATC0ed32WUC26XBTwNQnjy+Gd8Ue27hFGG0vixd0
         QrvITaHCrigtWkMgYfSmEW7lQCOHazUz/wR6DvGtMTmMuAc/mNJ0Nd2gZUUOdyRijDV7
         bm3g3LPMRT5DKrD9sY3THGUIlQ6PbPEKgHWHDCUBF0Qzh0TpvjQsfeKMkhYo3fau8N3x
         0fPZY+XEfGLllht/EdyLLJ627xSHeyb/GfLwxYpwhai3y6CNy3ZKHw3d6qz//CKFs9+U
         4xjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZEg3Jt+Qtr3IaKWKWjI9c1bpYFkbRkHciamloT3bB3m+2L5WHt4m/UTDjiiIFKhQlLTWbDmjXGQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbdtcjDxJnC4NmlSc/uN1DSesbLQbnLTCywXlMlXvZZmlBXoQi
	nOB4j3C9CnUQ8qEnEatV88RLWFef726IUQfipuYgo35rNitk8ACrCGu3VVhEw4Rfi5TFi6FkA1P
	rKxbptREoekEi0IWjMJqnQ0hyZThtm2uojM87Gta78rwY5T0AIpyILx3UAc9n9c8=
X-Gm-Gg: AfdE7ckAvZwndDtoT25ijN0JFmbdi8jemFmRrFmjnc+k7VIjWN9X+l5BjyNL+rj+kL7
	j7c2sgskqnPgw/ufyK+0po+0xBGPZuwT8SJV2kRFZ7wh5vZ6n8wOGqLbbY6AEmNqLTCnrK0dIO/
	Zj36r/+wnWCxqJkBVRc19dceanBtSHhk7q5Z3j9K1wLElUKuQ3TcBaOs2tgiIvrnRBIodztxk1e
	x4OLWGCEka/JFt3yvnT58BclbEeW1GeMj/s/B1AeUtlOIkCwDoypq/aAuTLJ3mwTIHBA80mWuKa
	+w6FGEVBraAFbry4c9fNokcbAbUWGSal7CpMP8uG9eb8Sb54FApOtl6QYYXYHys/9VjNmLLpXIr
	R0VkLzHXw+zafWGlGdo+WSK1sbOEFoB013Qk=
X-Received: by 2002:a17:90a:f94f:b0:37c:543f:b83 with SMTP id 98e67ed59e1d1-37d15dbec64mr385962a91.4.1781803291780;
        Thu, 18 Jun 2026 10:21:31 -0700 (PDT)
X-Received: by 2002:a17:90a:f94f:b0:37c:543f:b83 with SMTP id 98e67ed59e1d1-37d15dbec64mr385902a91.4.1781803291241;
        Thu, 18 Jun 2026 10:21:31 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm187129a91.16.2026.06.18.10.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:21:30 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:51:16 +0530
Subject: [PATCH 1/5] dt-bindings: clock: qcom-rpmhcc: Add RPMH clock
 controller for Maili
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-maili_initial_clock-v1-1-d6ede0352113@oss.qualcomm.com>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
In-Reply-To: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a34291c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OozyDhJeiyY2DhU_uTUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ttXdJ7_DPWKGR0wwmn4OOsW_66lk1xsy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX/C9mUTjLot6V
 M3tlioEMrSx/W3j0rKrZ46cMfE1IP2wRtecmnvAixiiCQwJAFxyyI7+yeiH8UdpLsUiX2IQdm7u
 8F0MIOqpXe9CF33t89eBGi52e0qGXMvykByT71upxcWHuK1/PyOIRuWoXOOK+6fZKmQ76rgY3t7
 acCaTTP/8td+STc/C+0sYEQotYL7IxVI9IezGnhPrtqAMHjU8hsiXX56D2WdcALmzVrUngJxrMI
 tcjxCP80tP8QL/xNt6iX8McpZWES0txi+SmVqHXQU2SwNfCr7wouNvjrcVo7bWr7xhuQrQLeye9
 XGE5rKekYIR4f4btBstmhoJBy1OANXuumCOzxpVgUJPj3FrRkMqxW7aOuJPcRqyLWnzC+/6Ng8P
 DSuNRxjnWcz5izFsHAQOrlq9rrByMojSp/wtWdS4SFBV9q/3z1fdCB5p/wztPWXZjJB8QszrYrh
 vTjLA4q0v9OC0ovtUcg==
X-Proofpoint-GUID: ttXdJ7_DPWKGR0wwmn4OOsW_66lk1xsy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX3ndBjNd4Zjcn
 rbMD926V1Urd/6hI5GDBYmXDkfXi/8ATtEwuOK4YOgQIP1oiuaoNQsx4wURD5KmwMHBbZ3IVU4K
 ihkeS2bGbxT22LwNO6vTvMNqOKBrB1g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180161

Document the RPMH clock controller for the Qualcomm Maili SoC.

Maili SoC is a derivative of the Hawi SoC and the rpmh clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi rpmhcc driver.

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

