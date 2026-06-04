Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747D13BFAF6
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 05:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550800; cv=none; b=BGc2wnQhZPjDrE5kzV8FGfM8xXLyHYm87zJQ/zTX9zCdCmxhoMgWl3EXHK9+vnthgLoVbdh2OB1dtT+VZ0SD6NUv6oPz5kLq0E5/VzvEa9xr82T4b7lYh4Jc+lCbuC+46T4dZxzZMovWJsAr6eHa3SJnyHL55ra1FFCE1AE/k0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550800; c=relaxed/simple;
	bh=B5z29ywrBKYbX7HkV5T+1ROTV9fAvOR3TfGmv4njIVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lWciqyr4rRcmvnWfAqlfe7b7AiHk06qGg4u7UUJbqPmalHEMT/JZRsTVpzhLeTH8auvuc/oi5Qg+7+QPOsx2n8uWHZ/mlOUxDeoMyD+w1lvOxn2enq2O8MA4qOT+jRrQP9tjY6pebJs/lIcJuE/71rEftqKf/p5xTeceTdZrbfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRmE5MB4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxqKUiMk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRmE5MB4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YxqKUiMk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542NCHe2260834
	for <linux-clk@vger.kernel.org>; Thu, 4 Jun 2026 05:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=; b=bRmE5MB4NDUX3mYC
	eddDc3+alG+LNsu50nSnawTmxqiT9Kw5IlvjUhhxY3sCgiErhkaJ8/UP8ZPHqtbi
	+wpjGriTF+PDLYOMgsIu1cIggPK0XC2r2Vmh/+DGYACwTWFX5NcOr9oP/KH7Sto4
	5VguRwM28dXHMJSByPz76EijkwrVvicVVE/7G2fW6HOqVzxeLAROPctZSEo1YyWr
	ife7tD1TnLHHT0XO2d6HWu1pN2q7Rgf0WUjDn32b+j/OoTUu8pgk9n4WPUD/TawM
	AdhtXoUv/IsHWs7c1bMXX+QD28NvsWRqk5bvwOEU8VL1ZOAAp379xsWva/fxzaLx
	znVEFg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejr2mjga4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:26:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8422f987f2eso559145b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 22:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550798; x=1781155598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=;
        b=YxqKUiMkX1f2Rw3TT+qGXgclgo9Omk2EH72plE8t/bZnig+0v8RcqCQvZjpFxuf3B4
         Ljsp62ptXGwusdSsq95U1Tu4jo08OWul6wPY+r7Ls6WEkpCsQp5QvdZcFl4tOJmNyBJx
         CdvjnWmau/pKqQp4vnf1V763iIj5R0vSU5uQazVkOjJUaABWSg1GzvF8gZlL7LFcH1E0
         RakHVz6v/hr9kDw2oYkLO3rK90IzZmrn2nmnSw4GsEkXkgJuvsAP3UwYLrYF4wUUdiqr
         Jb8HjVvJ0NwRI93+f6dnAmZ8WpXghY2VbTM7XdG3AjRKD3dugw8Dx1mU98c/6C1lkkQG
         W6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550798; x=1781155598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=;
        b=B6u/5/iMVjChIyV3wIxCKZefqL70/nAFAJhfRRbe6hNUkRoTxop4ueVKmloOszpJLr
         u8LQD/xMU/nDo70X6s+djqBCF9FFB9JYLnLfYtwXLIzS5nbemLygkQFCkBsZ4hTzHj34
         pkB3KrylYSu0v0dS/aryubK5t+TW9J3lN9Yjyw111+IQd/idsPwYBdSDivwobhux/w3K
         VexleuftPXB50ufpBT48f01OpomDsEURzGePLk0uqX7unB2sxDE+YB5wZCrKociKuFCn
         YmLilWln2isYUxVtJrcLen1Q6Y0I1u8vUDJoaCeysbW8FRIG0Zjvbnu4kNF1CZDyXNnu
         h5CA==
X-Forwarded-Encrypted: i=1; AFNElJ/IveRYK7GCkqPnWVLyMfJm9Yv3uUhEBND/61TmWPYL9TUIWarje9FUmp6NhGd/2WfDPWjYeHFQMc8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Yv4WKxXTWq+g7GG3tb+iMsl+QcUIB1he3Jvupxw37LYMFZRZ
	Pkfc2DI4+OPj98qsogebYGC+Tx06SE7DM9Uqbcp/naCklCJ1/iyHDdc/c7B7GG1Zcx+OVRjbGl/
	+kfV4lx2Xolqg4A8OqhBBXM4rakVl1rHQxwz/598ePFQY5GkfUmsfgb4WIzqqHBw=
X-Gm-Gg: Acq92OGBYp40Ofmkk5lFscZcAFHf240egbQXy6mvYcOIRk9yInGlHuQz3Gp5/br8b7z
	ClBztWGrjYBiqH9nxYnXiNqkOyGr2WvHK5HF4Ig03Gqe76ORQjr7e8RY/gB7jBCVkofNRNGa02o
	TUG+XrZOzO06n41OcWMxDkjBpyTRA9xMbfHH/+eU+uuLD3FhElc/tINc2L/pkB2M22kwN8I5FPt
	bHmdjKIl97vHJBvu4XsQkQPlhtz+EOOhoHcHxj+Hs3VFJ/ql8/1cvmTvgtRuCAtGy1moHIDT7Qj
	c1U7RnZnfyYMCTnhK6uSa0PDpF9PJEbUYbcivCj4eGhrsSFoFuvlMgRRwFCN4zkcZKQ+PgoOryi
	v15ccN2OmlcMDO5ZaWyA0AXBUZnimHfrVOk6yR+wPyGnD2Oayb12aBosC3Da2fkE=
X-Received: by 2002:a05:6a00:f0f:b0:842:670d:f6dc with SMTP id d2e1a72fcca58-84284e8e3damr6205874b3a.27.1780550798192;
        Wed, 03 Jun 2026 22:26:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:f0f:b0:842:670d:f6dc with SMTP id d2e1a72fcca58-84284e8e3damr6205862b3a.27.1780550797778;
        Wed, 03 Jun 2026 22:26:37 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:37 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:08 +0530
Subject: [PATCH v4 02/13] dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1
 PHY and sleep clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-2-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: dCOs5HYB8GcLWOCzQvPDYldeadnxu5UD
X-Proofpoint-ORIG-GUID: dCOs5HYB8GcLWOCzQvPDYldeadnxu5UD
X-Authority-Analysis: v=2.4 cv=A91c+aWG c=1 sm=1 tr=0 ts=6a210c8e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=z-ZRDpFp9XMTG1_t9IYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfXwT75El9NfOv9
 NLtVFDbCmOJACBM2V95q758NSVAhI3XdWmmDD8c6UGBS0ZAH3ULR2BCOizzrMgj0f1T5Up821DD
 ebhb9Un8pSg8Gyf8PCnBIZEzf2uSfcQ5SbizEp4GIWO6oQQvRNuBiK8V8G4s1hZwc/Ii3MQd7nu
 9vwn27aR+QoA6lhiICYYrbju1qHhhjj6K5aT/77KLnzALec+52v/AoX9QlRy13ZHW44/yL82057
 +5l7Jvq22zynPaImUP4nyiqhZo9DfkCqdrWaEgZ7J2tNJWGvbWHCc6V41ZQl8vQZFIYcy0vd8ZA
 cw8GvQUKEWwGmbOkh9Qz1H4iB6S5ndW80EPq0xEmvwzInUDPIoyiYAB+TwsEllBA3x4e2r9HbuO
 g4RFdDdXyvG/+Fujl1Hj9wGSOXFXEE20HZJbFUeFDG0uc5ySYTQKhWcYb+4I12zfyLS2URJJRQ/
 x6b5hj405lViLlY6I1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050

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

