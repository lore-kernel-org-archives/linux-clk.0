Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E263AEF4C
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962857; cv=none; b=hGB8usOof9l+PSbHt5tC16UmIpfqbx1Ylwkvsoc2D7+XGYvgO2Rd7vG6V8kWzDVid7NY8Q0oguv6fvoYG4IDVYZCO2dt/SBRJ9IE0FTXtSv1KpWVahDzd8IhX/c/rg+Vv8/16n00b/XnqghVe8RTJZKWKWjUAt8mKl1SsdSJtEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962857; c=relaxed/simple;
	bh=M1Vtwv7dD6jz1weYO+KPGRu/3yG8JHsMNrT2B4YP6W0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fR9tTpASNtYPeOvv2J/NejRzXyaJIlaq7aVX9h2y9aKUsG84PHFN1Royst3AeTNyvm4pKNufEC/EA6UnCCF2MZeESt21l1FFasuQO5zxm5+GIeN+i/Mt5nZ/Hn3EFbRHuQk3H3bFRq9nvEhOerTA6wzrZuCQliVa3ZsUUITZzXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHdKia9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBTJgipV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHdKia9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBTJgipV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vUq83203244
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZaR8B4PaV/wqzFpiMwRE2Za+f/kX98Hasw4Jda3t7Pg=; b=KHdKia9yVO/cLQyW
	R4M7gX+Eu9iW6emgtz0AorsOhXvEphsYkQttuCqbYSCbXy+d8ozr2CNqGJn4mmP9
	DPKQrSIvd03VCViQ/yD+BU+YrsiyfJahCuSlsLGWA0GQh4U6qpJoaO/eqM5u9T7n
	1yE7Vstfw8L5FriSh/a5zlBVzH1t7huM3Xfd4EVIHoeJWjeOzX6QlfcxssZeSI8q
	AWLMbk3+xWtiv6rA/aaPUYrCc66A0QdXe3EZNT41EszsYmOKiXh33tRMmw837uDP
	ys4S1A9HuAizEuwSLx+UhpTzvSibShiEpLOkmHJrgfr6mouzi+J4W2T49NLyYTEK
	akr/iQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjb0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3663d5e9b9bso11958890a91.1
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779962854; x=1780567654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZaR8B4PaV/wqzFpiMwRE2Za+f/kX98Hasw4Jda3t7Pg=;
        b=aBTJgipVSRyap0kJuAb1kKZn2KaYq98su2OuL4exHKX4wMj6p6HniPWrcjUUflO0AI
         n+s4Ponw3vt7B6ksP36uxF83qqndgNpYEpkBH9co2aJkym3LS2P9J/mdjSUCdbH8QU6O
         wWDzE7UczD7i2D72mlniArpeChAV8XZ7UNB+hvJtQeyTFpYKWBvq0mQkuNTFYcG3V12I
         EDp3Gl56IGhxooTmByx9XdFjisN93F90wCsxeztFfYFZtjerjYmQgp2u7DcN0bx3HsLw
         iOhrqaNg7mNNrm8wmZEhQVIEygc5eKJDEr3EQ3ARkgr5n2U83OiZHGJ/2mH8FT5qPsdk
         6utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962854; x=1780567654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZaR8B4PaV/wqzFpiMwRE2Za+f/kX98Hasw4Jda3t7Pg=;
        b=Cy/4YrKTOTYSXndFTRmcH8izfbfv4KrhlQCeSbKe5s3Tj/e3+9+4peDcCr4ASyOEbv
         uz18fcHh5UpP0lDS5dEMLPUoZIpMga35ofqkrCl+DUCFL1pXyzHt7m+BKuzcQn7tSD3b
         nqxuQc3B5dxIZxj6PVMJtLPEyDf7r+cruEg1WJVqJJAq06ci2KrjZ/s7McD9xf5NB0KY
         eYpmcpx/yt6QX3vqG5Np3YXbGFJRa+YqfXhh0jLSomkHSnEf8mCV0GH5y07TqisRKCAN
         hQdPaHuJN7/TF8Pgi6ijkYyVrQtQ9Ui5yQUc9auvVO3cNdIYPfBD0LmR0ktFLMu/3UtA
         i/Yw==
X-Forwarded-Encrypted: i=1; AFNElJ/6Jn2M7OwAQGnQtfaXOu6lgSYA44b4xEhPZtB4IbvlXXjfeGGIqlRMJTIYNDj6xIlRFhGT5pmN+tI=@vger.kernel.org
X-Gm-Message-State: AOJu0YymAJTp0Wp0PE2YTQfFcMlh0FolpeI5GmW9n9c/VOaMsRXqDJnD
	bZOWXbkDMMLL934adKywXMXWagMNzoSkHJFOkED3t3+jn3iMWewagNWQc0K9IvnLqUm642qQfFD
	Z/42CYrZGDJuWgQ7Ho6Tm89Wp8U5GDEECNjFLTFM5pSKKW7NLA+MaqNGdXi6+beE=
X-Gm-Gg: Acq92OHaKa8pxiIN3K8ftxaBa6sqLbrzLXutMvnamx1kq4SNBhe+Y96kkcwQVuc5L8C
	usBvYCwmw64ZFdEAXnGW/mFdJr2L7eaGz3qzoWwLe2s0zYIRIthRc4xSZ0GzIkVAni4yKUpPJRo
	+P9U3cPNoyECbP33UE2N/IuBO8/Fyvlg0hCbOOMnbIqODevr7lT6791c/8KfHHOmlVKBvTzd3Z4
	N/jlhpySiMjG7EVzLf3s6B2TtstMjuDiTwGMbgd0HezUiQwTMOUFo9b7HIp1JY9zB2eSkjjLIOI
	3auDtlD6D4wTjI2PBg/p1bVne7ZTADPnObPyYkK6yZbuTz/hDCVirkwb2x0x8lKQpR6WO8ULm8r
	QxLdwLKNS+eDf+Zqjq9fKBKlr/Hia7xLuyrrTTgBNhJjCu1AJ2vrv9F2OTEs5Ixs=
X-Received: by 2002:a17:90b:134f:b0:366:3ac:f725 with SMTP id 98e67ed59e1d1-36a6788d912mr27070480a91.25.1779962854564;
        Thu, 28 May 2026 03:07:34 -0700 (PDT)
X-Received: by 2002:a17:90b:134f:b0:366:3ac:f725 with SMTP id 98e67ed59e1d1-36a6788d912mr27070427a91.25.1779962854005;
        Thu, 28 May 2026 03:07:34 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b7e38af60sm575296a91.1.2026.05.28.03.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:07:33 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 28 May 2026 15:37:03 +0530
Subject: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwMiBTYWx0ZWRfX93AE/WLh2gDU
 f03sR82msM7J75tF+ljiDHsmrrBSIxXZ7NwKcqi9LTEkcmFTJCRjwXusSnTfBjXieCyBOEUEZsS
 Tutiv3AH/6c2JJXSXN6nIBPDIDsOa60cuzYcOG9IJI0efpkcPPBHa/qLj11hy4w4EKn82XQG6Vc
 xKv8RjgXlsWePOECqQx8e6gkqSw1G3dofwLS/r28+oveRhs4k0nhD8/DSO/3uiPWnE3tQwWcNgr
 xuToG1A6th2B2nt9qnYgTNt1+9zcekYsssYfHS36i1l1UbX4wiVAQ2rybSxopZfziQvITP432S4
 OjTxLo8htsl5RJYeHc344XqpZpPAhoPKXVsbFooCWsPUOIvgjPUVZyL2zViwaOU0YaqhiN//BzC
 t+AqtNIPIoDE7ZyBqdvFml1sw620k4gcl1DdXIMosASl9qzb60400dTtHxECq5v8rcrxs8tOvsi
 ItlaJHpD2ZyTLwG4hPw==
X-Proofpoint-ORIG-GUID: hbDWlXGR2cYMRREx4rYYW9mqnpN8ny8l
X-Proofpoint-GUID: hbDWlXGR2cYMRREx4rYYW9mqnpN8ny8l
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a1813e7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CblTgZ0dn44HXzuTGlIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280102

The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
but has minor differences with the number of input clocks. Update the
existing QCM2290 DISPCC bindings using conditional schema so that the
QCM2290 requirements remain unchanged while accommodating the additional
clocks required for Shikra.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,qcm2290-dispcc.yaml        | 75 +++++++++++++++++-----
 1 file changed, 60 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 4a533b45eec2d8e7b866c3436bfe6f80fcd714fb..b24095814d9e67a355321d9013e144f245077322 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -17,25 +17,21 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-dispcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-dispcc
+          - const: qcom,qcm2290-dispcc
+      - enum:
+          - qcom,qcm2290-dispcc
 
   clocks:
-    items:
-      - description: Board XO source
-      - description: Board active-only XO source
-      - description: GPLL0 source from GCC
-      - description: GPLL0 div source from GCC
-      - description: Byte clock from DSI PHY
-      - description: Pixel clock from DSI PHY
+    minItems: 6
+    maxItems: 9
 
   clock-names:
-    items:
-      - const: bi_tcxo
-      - const: bi_tcxo_ao
-      - const: gcc_disp_gpll0_clk_src
-      - const: gcc_disp_gpll0_div_clk_src
-      - const: dsi0_phy_pll_out_byteclk
-      - const: dsi0_phy_pll_out_dsiclk
+    minItems: 6
+    maxItems: 9
 
 required:
   - compatible
@@ -45,6 +41,55 @@ required:
 
 allOf:
   - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-dispcc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board active-only XO source
+            - description: GPLL0 source from GCC
+            - description: GPLL0 div source from GCC
+            - description: Byte clock from DSI PHY0
+            - description: Pixel clock from DSI PHY0
+            - description: Byte clock from DSI PHY1
+            - description: Pixel clock from DSI PHY1
+            - description: Board sleep clock
+
+        clock-names:
+          items:
+            - const: bi_tcxo
+            - const: bi_tcxo_ao
+            - const: gcc_disp_gpll0_clk_src
+            - const: gcc_disp_gpll0_div_clk_src
+            - const: dsi0_phy_pll_out_byteclk
+            - const: dsi0_phy_pll_out_dsiclk
+            - const: dsi1_phy_pll_out_byteclk
+            - const: dsi1_phy_pll_out_dsiclk
+            - const: sleep_clk
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board active-only XO source
+            - description: GPLL0 source from GCC
+            - description: GPLL0 div source from GCC
+            - description: Byte clock from DSI PHY
+            - description: Pixel clock from DSI PHY
+
+        clock-names:
+          items:
+            - const: bi_tcxo
+            - const: bi_tcxo_ao
+            - const: gcc_disp_gpll0_clk_src
+            - const: gcc_disp_gpll0_div_clk_src
+            - const: dsi0_phy_pll_out_byteclk
+            - const: dsi0_phy_pll_out_dsiclk
 
 unevaluatedProperties: false
 

-- 
2.34.1

