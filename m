Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C551E9B3A
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379393; cv=none; b=Y+ph6QdfIKbiA6dcdQ3IDKEwnkrAWsylFsFYevjpla4P/AWDX5v+XDaH+FJDvrKHYyUV0SKnzB+Xk1hWmGWum4UHdq+nvrjQn8ZvnfQzP+mjGkWhQslgH4V3BjyrV6lICSgEW2PDDiPjsuGKISOATdOsXKSNCJv9E0g/scYBoqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379393; c=relaxed/simple;
	bh=g0E4F8674D2m6OtmzWH25tEnm3jJCsC0/R8WR+XNFKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZEh5/2dWJaETUhoz7H8nsLsz7WRVLUI2VtTGl0gjflAI7fkipPtBvgViFmFhUX0KS6ofCUGfnSuT4cqNQTOIyiOkeg+hL3xjMNzws0BxXKMA7utBkB1ecVaEJY0Fsj5fn/vA0kKfovG1m/vgmtQQbrYSRgs3xCaJyMVzKDiwxZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzDwSa62; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYT0ge4e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzDwSa62";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYT0ge4e"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHXNr501914
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cxFIKcsRQTXS8HxFCAZb+qVsqo4wG4SsyGlor4rl0rY=; b=AzDwSa62HnHSNjBa
	ttJLsu9binLSHD9L75vOud7QS797BdPVkaQtBNUMBUuBli+nLy1r61qGNKrWWtnU
	/6BKApcUA51NQOJxBElUwi1MtbRQzg3qS8oVale53chtjjUU8FZ6E/C218vewURR
	BoFR82Pj/ewot03TGahXtkVnjMDlqPFzQfBmp0FlROZ631xtzQJ7YQj/L+u6oRse
	Im/2n5Y9DRjhVRk+cdgrsOrpil7IMZPJAt1O/rlLWMkU9+er/BODFVKUBQp0P+qY
	ZOsbnRLPt5FxhGCmb0N9nEJRxUWjDHQFAwzWPGNlukOfqX0IAKfpPAuMVZMwKmQ1
	cYi25g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c68sdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:56:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so11284904a91.3
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 05:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379391; x=1784984191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxFIKcsRQTXS8HxFCAZb+qVsqo4wG4SsyGlor4rl0rY=;
        b=VYT0ge4eLsMl3MoKWb9c8vFAwApd/HfkVxJofA5XUZHZDYjxbf/o9/nsPlBkMd+Wpv
         Fzq+YltEaZpe0KkrFF7S/9fhgVkCW/npbUbh54KuMqZ17ggUMhLo3DpURN0LqPfGWk6n
         hpzcKkyZKn2hKj7Jgfx8FcdZWLiMkUmJF5oR2cXo6i+gFg4BFMwTFn18Y+DJmnQRlfDs
         TFi1HgdbXYZfBqGmJFqN9/FhgclCHtbuBwC8npKAul0VyDmVe4yJG+Cg1pMU6d+Pm76F
         bBIqB4vyKGaCBN8hP8MMe9C/Ib+yf6WggkhOL9WofbyxVyrGoMGZuSxUtVD+upJwj3KE
         U/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379391; x=1784984191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxFIKcsRQTXS8HxFCAZb+qVsqo4wG4SsyGlor4rl0rY=;
        b=LOj/Z/POwSVos5DTY92LGXNh8b/2yLUdrJAyRLC+iJL4mhJtzTKZvA6sLq12lC94id
         wQbWe5+9/NvLrM820sHraVxphxHmlUr56lyKGhma/iYdOxFexu8UeHko4kuFoBUXvRK1
         SFD+DyIHssC/j3iWGC6I6pBi9F/sD2He30yQ+kZVevPlo0DjNdWyaKsRWTVIapSQC1ou
         34i8vwMFh9sPzhfNZHWw2f80/AszvBQiN/pfmaoivNlJxN7bM0WvvNnkqPhvI1Qml1LM
         Ed0Rr/jHOLJEJ3z+Li89IHzBGgf7n92H3EWb6ay/6XBkx4g9/eOoSF1Qu4bZPyVPSaPB
         ohQg==
X-Forwarded-Encrypted: i=1; AHgh+RosC3OfyDIgmNNVIEqEiBp5pSOwf0DpC6068oNc9G07jKSEGU8ZpACREoiDnZMttT/IV0njcUnR1vE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIrqTv9WCcrYP56AGx0LTSYUoWF2geclDvehaqt3TBMPcpazQt
	MWhC2FnAlPTRxr8GC3+7BFRW+ZbcmIqyn9BdbbGbmsNU+h1DqAig+5+h9eMMVZgkWf2FM3LCxX1
	xCA0Hb1jFmOodadWtYhZG/mqt0JX+DYBsGm2aW2M2CY1GMkGJ1AZch4UoOYneJotmMmrPCY4=
X-Gm-Gg: AfdE7cmzYzd9rYYzlQwHHkxyXfDcfrFtca+UzRmW1yhjpXji7dDTv2R+TRtX1Mv8ezY
	zsc7SxTCi5vRBluf5f0YfpnaFr/fCRDJKXEQTtHQJ9bC05WQu7guYkVpls06Xu9gP13D/DZ0pez
	GN1TgKCWYTkVFfQB/IQm2DOfXeSVOdAAUYnXJisYtzWy9H1RYMzDVTHKoKaIr2Uxvm4QPpoJyY7
	m7IDI+cgnpyCwoNw9JN2wGKS7QUa8FavmPl05oZXp5BP4oYHXDUlH9LiYPeZny6OfxZjLHYXTxc
	kwNv7QZPIRkunAqGqU9i93yv5FGy8aP344xCFcx295w/4PAMGnef/aCqbfmnaW4OclfnMaj7GQ3
	lMHQWH9Hq27NlOdb6iUXj80huonNaPic=
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b21 with SMTP id 98e67ed59e1d1-38e679f4c4amr949645a91.23.1784379390439;
        Sat, 18 Jul 2026 05:56:30 -0700 (PDT)
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b21 with SMTP id 98e67ed59e1d1-38e679f4c4amr949619a91.23.1784379389982;
        Sat, 18 Jul 2026 05:56:29 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:56:29 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:08 +0530
Subject: [PATCH v6 01/16] dt-bindings: clock: qcom,qcm2290-dispcc: Add
 missing power-domains property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-1-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: VSpNFfvka9OaOZgaZpHPfL2kTXCcAVtX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX9706jAXfGUJs
 Z30G+boCv2HwD+JDdpseH1HDgKlm6rKbQkNqh7KbarbSpr1OGpOKXwPn7tdaNF0smViZWArAfRq
 J27veKfc1FZY1mo3EkIsWUaf+sMBhPGr1+NqaL8y6kGeALmQzOfbm5AwoQ22zCtRqug0yxAYRV6
 M53piUZOK29J4M2mJdSZtrIC8t8N17D7Pq06YBXcyK/hP0ZEi3YWVVm1wI1fkg/wfFlxou2Norg
 rAImOluHUjBS3TyKsaOj/MbJ7V8ealIo+xwQFYBdv/HeCa32gu4Tch/RLIQ4jaeqkaDSK+OCZTg
 wVK12ZOcUprGJ8qkAEQWenZgzETGjnQiqDtczJ9+k/1Tadpmnu0doQG1qo2S6TwpTSEV/6J5pzk
 7wQ/wXDUiafrhOzBvG0tQrkyauuViXmhiBAttZ4MIHS1HTDwWZjvARDy25eHID3Anmj7kvKp9JH
 E6Nt8SIgoaa+sEQDLIw==
X-Proofpoint-ORIG-GUID: VSpNFfvka9OaOZgaZpHPfL2kTXCcAVtX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfXxLtCYp7R8/lr
 o8yQKjLlKCeV2GlQ77MokkBw1xJv5trGpQRYfJf7SKvjNQ1gB4Hhd3EXiFiAkgD+SS/K/Y5oOrI
 CiM77KcBEyFMwpYvzGPgGsqV3CbSH8M=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5b77ff cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=v1ZIPYeosOrn89kA6pEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

Add the missing power-domains property to associate DISPCC with RPMPD_CX.
This is to ensure the genpd performance state votes on the GDSC to get
propagated to the CX rail and to avoid the rail under-voltage conditions.
This change breaks ABI, as the power-domains property is marked as
required.

Fixes: 85cedb4e0c9d ("dt-bindings: clock: Add qualcomm QCM2290 DISPCC bindings")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 4a533b45eec2d8e7b866c3436bfe6f80fcd714fb..e9c2326adfd285444257b96f5adc68e27213281f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -37,10 +37,15 @@ properties:
       - const: dsi0_phy_pll_out_byteclk
       - const: dsi0_phy_pll_out_dsiclk
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -53,6 +58,7 @@ examples:
     #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
     #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
     #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@5f00000 {
             compatible = "qcom,qcm2290-dispcc";
             reg = <0x5f00000 0x20000>;
@@ -68,6 +74,7 @@ examples:
                           "gcc_disp_gpll0_div_clk_src",
                           "dsi0_phy_pll_out_byteclk",
                           "dsi0_phy_pll_out_dsiclk";
+            power-domains = <&rpmpd RPMPD_VDDCX>;
             #clock-cells = <1>;
             #reset-cells = <1>;
             #power-domain-cells = <1>;

-- 
2.34.1

