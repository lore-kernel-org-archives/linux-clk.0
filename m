Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40873E8C5A
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338135; cv=none; b=KQB5MhcE2owuacAAVrSPkvLPGKydUF8qrhd3svE4msvk4fRPIzyWVZefPALVCugQVT8sAD5D9qoEYHoDQp+EXbg0OgHoNJUhH+9ZO0xMY/bNwhlJrv3p2tZ51qW44wWql+nEdrcw7Ugqr++54EYfqjolfS8SRg5SAuel7Kndb1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338135; c=relaxed/simple;
	bh=B5z29ywrBKYbX7HkV5T+1ROTV9fAvOR3TfGmv4njIVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DYoGKCsSm4KUWHAqhnSgiVNJ0HRZUVbv/Q6DPxcGmMS+axCUgTFEfOAOmaWFcCy4tbVBd1+2VhjNbzSziPMP0WBSJDHuf/pBXxQfcEz/A0cq29vV1OfUOWyoOg3cjNrrf0IEK3pFTzWQzlft26NYXvYz3oVuo6aHDXSQD0OFQmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itk9Vcaa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tu8dpUxg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itk9Vcaa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tu8dpUxg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651HMFkC334662
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 18:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=; b=itk9VcaamUx9pmFR
	2VCZwTylg/UUaEMJ8FiCUYmPWk/DxgEG/PGx7R3aG2xYceUcjG3vjbYtJPfncyz3
	eEVJCvMOxTDQdmCcG82w/SbiG8m5kI39u3D2QU3mn5Vg8AdwvemEHyHjr7EpVN+N
	sXPNup9q2TRhl432NR22cI1yDERbPF5u6TzRiVe+MW5su8Bd6J6CsYjOzXqHG60k
	73CKkcOtKr/co3LIxhr56acnwJSkl0dqg8Q8tU/FUiFh4Vr2MZy6P5pW6/FBYy+J
	2UKGCD/x0p1hD56gexKoQ/rBQdtH4qBHoeMU6IUKX4f5o6RDCDlFyaXzRjEoWEAt
	tR4ACA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh8tft087-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 18:22:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bc02d28b6so2769249a91.3
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 11:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338132; x=1780942932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=;
        b=Tu8dpUxguEiApCNU3suiF0uNXDpqLCNrKzOXumkZisx0POOcRbLpaZ8ChbFo++0aN8
         74nWm+9jMgOp2kkgVXp59pNY8rXXhzTYQTvgwYJc7Sx4WjstOmrWStV+ROWVyEL/xroe
         TqeJOo3/78GKL/2bfOQXF5qjhk7cugxtFW4WlBFee26O403CvRhSlP2ypMpnVmM8X2Zg
         1igHTCU5bXTzy7BJeJaZt1+5mGAShGDjD4blbp881jFG6jz3JA3o7NzVHmnXq2q9Pbmv
         EqelRjBwnzlEhO3exv174SnQOHE3DXVS9BQtJlyiNyrfVkbe9UGXs20RYlLASX+G8BrL
         gbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338132; x=1780942932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=;
        b=NImK1BD0XCwCSo2VzyaXD/rgC3aOnKhbyyNtG0YmUgMMRiU2tTnpFCUc143AQQ+cRU
         NEFMRs93JkIKQ2BoL0wJ5g7fSYQfEexX1SEqZ2ialzfZkdoZvjBE1vyk5aEy8EwNCxoo
         1obY4Z/+VbZoLRPcPMAfdlsOdZv1JrOCIcJlXZXeKDoOr7fKUCoiCyJcbnCruOwDCifk
         tSYD9tkZMLfiir9MfDV9uMHEHstec/tKt0zeVluw9HQc6a3vznGHqh+nNxE3J8xdpeif
         GtgoB2sm3VC6HM1C+wPtB7mskVrgGXgylHW31jdaodLe8EGWM3Y7MtcUqa3qkj8K+BCR
         Xk9w==
X-Forwarded-Encrypted: i=1; AFNElJ9SZOgCaHWeDOCMBdMSzP/z4XPHT+IZ+0NkoeCWLvT6CtuK9WejailIsuf2I3HYHQOjZi7kULWSw4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTjz9pK0y6lPuqbiIrtcNZcObCppxD9JrCbW8HGtvyiTpjjW/h
	Uc8irJebbsoASiapu3SBCXHFCq4JxtqKwEFtFHUbi3bxudxXuHBxeaBtG2G30xWPqQINEuAe7Zi
	VIrbBdpbcQyqrxcOPGJw5tTey2j6tSHDzJYnQkjfk9QT8CQBxn3gYIqWVsF0aPc7Ase69wwQ=
X-Gm-Gg: Acq92OF7zk4CN8vxxX+qtiSRAV9a8DNFKxdwBjWIhXOsAWZ6n88m7yW3oFunlhxveMB
	6xLcYY0/YkUTduZRsbo6RtKu+5Uo2mmCHrrBhVhXjfVkAis30Fe/d139qlQ4LrLwCjD86RkqZY9
	JAbzERN7PhWK5YI3NigtvhxTQhwb+wfVrToqVmfQF+SfgWFtYoawbhvrvuig0FdZqzslaJ5Kebg
	CiYR4UwREOMAYDB8tMdTMzAdjapra1F8hYdMuh6H/PTo3iHZWoYuX9Q/ZzbB9BOOijoeWspuapK
	XnKgU22N8zG8Nm+0rTxz5FHIHMVFE7CvuiwwlOcA/xmpiHCoCh/Eh4pXf6si+9BhPS2uokljjNo
	4ziB9JhUhdWXK1cYOZ7d7GXK8WrM7zal3wZobtaOPWUqVjwT7MNBFcHYTsrykxDs=
X-Received: by 2002:a17:90b:5704:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-36c501c74f8mr12420762a91.18.1780338131707;
        Mon, 01 Jun 2026 11:22:11 -0700 (PDT)
X-Received: by 2002:a17:90b:5704:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-36c501c74f8mr12420718a91.18.1780338131265;
        Mon, 01 Jun 2026 11:22:11 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:10 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:24 +0530
Subject: [PATCH v3 02/12] dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1
 PHY and sleep clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-2-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: jN8D1ltMJglmxDH3rjBWEi7-YyI6Vlo-
X-Proofpoint-ORIG-GUID: jN8D1ltMJglmxDH3rjBWEi7-YyI6Vlo-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfXxojm+xq9yneM
 1ZUlIKRSngxLvxhYaJdms1K61kLFOfj1f48jqLQvC8I9SUensc1+rNc1d5ZvWHtv0oEOpx4GVLF
 FmrZJJdVtH3xHfGa65wz2P0xQPjay736eS4QdteA4GDZNRdQ2TLws5lcMmSgNgrMFiZnHoTCXWE
 ogllOhT6e7fsYolDj8bpNRHyltsxqb2SRRhkmXyRet/4iMHGeCqaGTFPzPh4YzuPxWDGM0LEZl9
 rcoAbJmyem2MUslE4H1JG7AcIYG+hhAIMulRrKwToSK0sJ9y66OfnlDeUcYNo/takvvlVcBRmBZ
 75elefQWkM6xSunMoJ9XXquzcHOp7eMirrlYJkq6eFpjFR33htCIWTNHYLa9ouIksZOuhCcIClF
 W8gilgfdI/51TlUWtE7r4ZeyFV3K20/AWenCOJHaxutrxbuIhp1l0fVEMdPVBPw6I7BJRvzbZd+
 RpK11YoH1VggERU/6Ow==
X-Authority-Analysis: v=2.4 cv=P4YKQCAu c=1 sm=1 tr=0 ts=6a1dcdd4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=z-ZRDpFp9XMTG1_t9IYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010181

Update the QCM2290 DISPCC binding to document additional clock inputs
supported by the hardware, including DSI1 PHY byte/pixel clocks and
the sleep clock, alongside the existing clock list. This is an ABI
extension, and existing clock inputs ordering is unchanged.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,qcm2290-dispcc.yaml          | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 4a533b45eec2d8e7b866c3436bfe6f80fcd714fb..24f2cce033f6e109b65a79553fba5295eb9adf3a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -25,8 +25,11 @@ properties:
       - description: Board active-only XO source
       - description: GPLL0 source from GCC
       - description: GPLL0 div source from GCC
-      - description: Byte clock from DSI PHY
-      - description: Pixel clock from DSI PHY
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
+      - description: Board sleep clock
 
   clock-names:
     items:
@@ -36,6 +39,9 @@ properties:
       - const: gcc_disp_gpll0_div_clk_src
       - const: dsi0_phy_pll_out_byteclk
       - const: dsi0_phy_pll_out_dsiclk
+      - const: dsi1_phy_pll_out_byteclk
+      - const: dsi1_phy_pll_out_dsiclk
+      - const: sleep_clk
 
 required:
   - compatible
@@ -61,13 +67,19 @@ examples:
                      <&gcc GCC_DISP_GPLL0_CLK_SRC>,
                      <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
                      <&dsi0_phy 0>,
-                     <&dsi0_phy 1>;
+                     <&dsi0_phy 1>,
+                     <&dsi1_phy 0>,
+                     <&dsi1_phy 1>,
+                     <&sleep_clk>;
             clock-names = "bi_tcxo",
                           "bi_tcxo_ao",
                           "gcc_disp_gpll0_clk_src",
                           "gcc_disp_gpll0_div_clk_src",
                           "dsi0_phy_pll_out_byteclk",
-                          "dsi0_phy_pll_out_dsiclk";
+                          "dsi0_phy_pll_out_dsiclk",
+                          "dsi1_phy_pll_out_byteclk",
+                          "dsi1_phy_pll_out_dsiclk",
+                          "sleep_clk";
             #clock-cells = <1>;
             #reset-cells = <1>;
             #power-domain-cells = <1>;

-- 
2.34.1

