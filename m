Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D234D4E4
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702601; cv=none; b=jwZKO68ymO0lDdm+0BmrUnN4KhyPl2YIhlvLfLsiHmWC/e2GyAgBetiezdkjKXItQnC9CU8xxXQK+V1dudM6r1/DofyOsl+l7vX5VQwAX4LP9IOGE5vVIH0VgtPO7xrBVTiF1+RvZILHDhAhch5H4Ty9I3S8OBwvE5TgCkqzK+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702601; c=relaxed/simple;
	bh=gTZNOtKDnKUOv6o5sjbDTRiBE2xXCavZB3UDmODGIEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=htv1+GrF93q0cH46UBOZsmB4fajBIPTm/m5U4moUiHhajz5brlcbgzuznbbDw/TbSW/jb60EpzWggpAuKYaebuBaY69qViGBfcD+Ku1hLBAFYQJ6szam4nnV6XKZMe5ZF20+jcop9AixjTLoWKRUcDbvZLQl2UMuGW7qTkWdMJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCTvEwE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhMsIzT+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCTvEwE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhMsIzT+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFZt7Z084436
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gw2GewNU2bxw0H7FSqVM34ZT9I8vF0lXH6p6A3gDyM8=; b=oCTvEwE05VtiJeqU
	WxWAVO+lOsDgBLF8vpJGAXPZe837qP+tlNlBKiQMoGqgecYi9FjCdZ+UnhqV6o/d
	vFdEsV1QUqt/N4cG1gJZDJb2PWFQPC2aZxSo3O8ZtSnfgj9HyuxhSsTFgWRN7n97
	TSWfjAJgYFz7WCYR2JQWuOLD55e/cevoMlNvjBxCAdyX+ZRWtS1diDYm3PndZos7
	JBHfAzD27/oSpUg0CcxsJgL4mbHkr9Yschubxf8+934RlKoRvafISpocifRTw2o1
	x5l5S/v/2dfZo3jizVK7Yu6Wrs47DPRl6ttbLcekuzuhVLLnv1WNPQUrzkr4aWzr
	lzReNA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81hmtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:29:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f74f0e3c6so2176105b3a.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702594; x=1777307394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gw2GewNU2bxw0H7FSqVM34ZT9I8vF0lXH6p6A3gDyM8=;
        b=GhMsIzT+DHSWC4zhu1vmqyWX1smyWq5aP2kVkELFNYxvA5d02pMFcKsi5Ny781AzqG
         WhFlKv+gMP6gE3sBLMMwgd33CmYeQxIGAEUBzEVzsnkDcPyC9ED5gsSnlTrvPqXc8LLR
         z+H2GPz6BCsm5/dXhmnYM1arBLjsSx2P0aZUSoUk8Grj4B8B+omY9BXiXoVIryWI96E2
         voGwvH0+V9qPGyzeXYxRINCvinKVJbuyFKLfjuT/uUh9ENjRsNSAGLqszHPTdNMaIc02
         ADV7C13CUgb43wwNZ3Kk3eG+kJyOZSCXah6q9kvTURfOL2iuImnJIsWXLuc9JCcai8lu
         AIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702594; x=1777307394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gw2GewNU2bxw0H7FSqVM34ZT9I8vF0lXH6p6A3gDyM8=;
        b=FeZGY6WN51QwGCZ1TP1zOJDA6BoFC3ytotPGGC8HKutiofpl+F3UvX6MBaxiZoi/Qg
         64lDCkclU4gNVjSQY0otvT0KmpydAUf0Y8UkgrFDO++qG2d7f92sV8XKxFnH0ZIY94D4
         OCSB/qF/Ek2vAhZPtsjfoRryoHGSiRkzEFUBMcd+TZV+ByaS2H+cfRiaz+isQ+Biwp/n
         wWQueIu7AOUZ6Klzs6zVcTNJfODmgawp4JdMPHkfEXDzNRoRqfwRnSCnAdwmsE/mWFz8
         MoP8tjA4Hse0In0z6+LDZumm9qHxKwplrHG9frTrXfkO9QCKwxnUvY3d+in7xr11pr2e
         mw5A==
X-Forwarded-Encrypted: i=1; AFNElJ9leRMeJ6ohydUZwauAWFRn8OCrDidBhsN4l9pyG0SEqWzOmJdup2OCZ4lReDsgrOMYr8/k9mkyOjU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa7pxzq/g//SsVJQW1ioCdYOdXe5KVIZDutFImK8O1MYEf6hyz
	/mRDbblvWTpUo2TV4eNu0fpPckqtGfSisvStAjKa3kjPKOIZRQ/ZkhkbYYusmu10YWrwC/1pVJ8
	tUKOqc/m/fmdKzrphTqKhzYRFtIvhd6rIcPOt4QKIvH3XUlgy2KS1ypr/hWv/2Vc=
X-Gm-Gg: AeBDiev7C31/GZ9PL5dfU8Qkj81jWNjbzzy6xNpCLr6nL5JeCxF9lMexKyL3uc5e5dR
	J/LJ/a+H8FnCSW5VF1ryKSzOnW3Ol3k7ndToBIEmDHnK7xC4BUdCGPNTYj58xghRhaIQys3WmY/
	pdDrdfETUhoJWyRhSXpHAG9uVyZrR7VER4WYDuGc007O2Ja2h/zyzdW8M24j3bLwzZoABRd6fqJ
	P/ZaNM33YL22j1MEG7DifBuOwl4bKNH5kHvr7MZFHL2Pm0lH76jz8WKuy1bm/g5NaoFLrA+WbAs
	dXTJ38pRpCb1Yij5MvHVPK3OnQMUcfagIQ4Uez9L2PmLef5C0Gll/WDCoNBFDr5qxM9QbBcznr4
	ITn6P6cKLKGzEKU2KbF0jUz8oPG2su5m0OEoqxRIFefYj7iqn5p7za9x4HsLTfBo=
X-Received: by 2002:a05:6a00:368c:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-82f8c7ef3ebmr13956901b3a.9.1776702594261;
        Mon, 20 Apr 2026 09:29:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:368c:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-82f8c7ef3ebmr13956859b3a.9.1776702593711;
        Mon, 20 Apr 2026 09:29:53 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:29:53 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:55 +0530
Subject: [PATCH 02/13] dt-bindings: clock: qcom,sm8550-dispcc: Add display
 CESTA support on SM8750
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX96o29Jymxo5Z
 m5vmWGU0VW9eoQa7QYyOihAbE9OWYERkvo6klWBA7X13h8FCmF0dyRK72dTuzMFjtSqnnxZIW0z
 M46GxjcWn0xMeVsmWRvg1mTjg+s72+CC2ZIGmi+WpeTEFA91Ny42UTqeWiyxVfB01vq/PWdVpzF
 47Y3ZbTdRo5f57rgJjQNTfzE9ABqbg5NtK0fIwDj3udj90lQ6f0sluA+BXEXOPSE7jzqMQwggRs
 svhIwpVxsp2nNpoCEeaGlc6OX3mCZIXle+ZLPLCaO5HVp4G4nz6/dxK927yGLB17lUZtRxRuLjm
 fdZeOupMPlNzosGwCnrdUkPUfxKhtpCAw/ctfMxwIwaxd3cll2G6M7ztW2B89TOcUMT4amX6NvU
 Hv/7KQM4npsF0nWNasZX+3EYp19PwFBOgjEdQahJ0unI5nkwo1WnDyvEvoKbtGTrTYA89k77wky
 ipWDeBcjCvD2SAdKneA==
X-Proofpoint-GUID: zCDi1nltT1iQc8AXJZJDBhWK8WqxL6K4
X-Proofpoint-ORIG-GUID: zCDi1nltT1iQc8AXJZJDBhWK8WqxL6K4
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e65483 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NZKN-6T51pjnxkzzoysA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159

On SM8750, a subset of DISPCC clocks is controlled by the display CESTA
(Client State Aggregator) hardware. These clocks can be scaled to the
desired frequency by sending votes to the display CRM(CESTA Resource
manager) instead of programming DISPCC registers directly.

Add bindings to allow the DISPCC node to reference the display CRM node
for sending votes to CESTA hardware and the CRMC syscon regmap node
which is used to read the frequency look up tables provided by CRM and
populate this data in RCG's frequency tables for CESTA controlled clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-dispcc.yaml         | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index 591ce91b8d54dd6f78a66d029882bcd94b53beda..3e049b2160a1781c866bb30b29f0da5c9e156b61 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -60,6 +60,18 @@ properties:
       A phandle to an OPP node describing required MMCX performance point.
     maxItems: 1
 
+  qcom,crm:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the display CRM (CESTA Resource Manager) node, used to communicate
+      with the display CESTA (Client State Aggregator) hardware.
+
+  qcom,crmc-regmap:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon providing the CRMC (CRM clock) regmap used
+      to read frequency LUTs (lookup tables) populated by the CRM.
+
 required:
   - compatible
   - clocks
@@ -100,4 +112,40 @@ examples:
       power-domains = <&rpmhpd RPMHPD_MMCX>;
       required-opps = <&rpmhpd_opp_low_svs>;
     };
+
+  - |
+    // Display clock controller node that controls some clocks
+    // using display CESTA(Client state Aggregator) hardware
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    clock-controller@af00000 {
+      compatible = "qcom,sm8750-dispcc";
+      reg = <0x0af00000 0x20000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&gcc GCC_DISP_AHB_CLK>,
+               <&sleep_clk>,
+               <&dsi0_phy 0>,
+               <&dsi0_phy 1>,
+               <&dsi1_phy 0>,
+               <&dsi1_phy 1>,
+               <&dp0_phy 0>,
+               <&dp0_phy 1>,
+               <&dp1_phy 0>,
+               <&dp1_phy 1>,
+               <&dp2_phy 0>,
+               <&dp2_phy 1>,
+               <&dp3_phy 0>,
+               <&dp3_phy 1>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
+
+      qcom,crm = <&disp_crm>;
+      qcom,crmc-regmap = <&disp_crmc>;
+
+      #clock-cells = <1>;
+      #power-domain-cells = <1>;
+      #reset-cells = <1>;
+    };
 ...

-- 
2.34.1

