Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9F443E08D
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012479; cv=none; b=HWTiZ8asEhGKV2+8hBSLWPBau7ac8VOOftDujGLKk6KRidM4BOTkInLJCZO7tSmIjZrCus1RhK4EpkU4cUi+KZphsi/HlYCVuXJwyUHr+BOmT3xUsjdTyLIpeq9S/azR8rNlHV+slAJov825lnoQsIYSkBZ2ywavzK6Ms7w7oqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012479; c=relaxed/simple;
	bh=YGVvXMXUYLnOZMf8Ms5rV1I/iooKVaJYiXlCUiVTNGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fnVAdJ8V0ANPLVuokOJRHYr2RmJBBacAXdtuuEKOr+iJolWcQAI8CMae/I3EgObSy5B9B0F5lzusOL14gmtn7XOA70hPXtYk0k6XpOMIBJB14ssm4/IV1r9Qv7MUcc4kVzIwXkacQNuVk+w6893dqY2RlW2g+MLQekWkNyVPvvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAPh0i8W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVQQLviz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAPh0i8W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVQQLviz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nfet865623
	for <linux-clk@vger.kernel.org>; Thu, 6 Aug 2026 10:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=; b=DAPh0i8W3FgR196x
	rOKHkcP37K/wFCxjXlrgZXx5jDZejmVpRP+PoFDOfG4sDlP5srBAipWsf7l7142p
	6RrtNzyjofp4RNs7y1h6jE4h0q88W/oRjRSgBeD4EAeFlnofakahuFZGYV/MrNsW
	eM6mOWA+6hylQWsS1e/5afgpzROFJcxFZqGMqE11bTFaMcgzD2CQNRRO5MgX8iyv
	zE+xqgJs+/aWLDoaenR5ocGg110q6s/B7OQsOLgsycyQYwXPWGQRPJWCLBp/8zOG
	qWhuba8y4VZW52D0MIL6ik4tbZuEobLFVeQuR/q3pHbNbUHrWMrp+RVZMvkQ9SvU
	5NYVDg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9f5bq3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 10:34:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e048a801dso2805777b3a.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 03:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012476; x=1786617276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=cVQQLvizFxR/Hp2Ig58E3ezs8Xex5HolaUO5VTS7IIVeebbzkvy4XGfsnMJ+mbebTU
         9KIKP9020WweulVbQI+xVfAu8KLoX6EMSk859ReuZAZHmZd1gama3NK32jNHBJmQaLW6
         MOmHfw98HEQcLr39SwG4v1LezprPUSXSqoX71MCnRfUbJBgChMc2TUWROBL+RkrzY2FB
         GKhk5dUoTMiE/NCqpD1YYhDpv1WjGaULBcROTbp1H7pliiPEqQWmFRuHRj1Fg2IZd+Gh
         F8lng/0JCvhfB0EQ3NoBkIGz/t3A1+r2RJWRILeRrKKslY1jc9IrC9VoDjqcmdzhmhb0
         dZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012476; x=1786617276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=QFOBkCafRD/YJ5QFrPDtFggKdgIr8rcyr03KOZWKC9n86qoKsEaqRgDDyWKLdU205U
         yDTjBHlYInTlLE15zbzOai//QKWfHB7hvtEQioH5uJCGFSE86NHm98C7QHjiFIPxBI9B
         fj6OZxT+yfvQvxz5Vy4mgnf6YXzD/Q0IecBUYUVOx3f/USzyvOEhj/UrmwXi6xONPSqH
         /qk8Ct2fVrkZaQ1ozwGSJG0DInnHpfmC7z0BHcwhqoPc6kLC7Cnygl5IHLu0uyhCF0UM
         I9UIFp9JKoRiZfvhnyMs9t5KDqtyNbW5avA+Au+sfSJh4u1xz9tkWtU617u5apmcUnph
         79GQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjnwaDhUrdJpXV7LQ5RLMfGQDcu1/FxgJOj36DB7mGevW+aMgNWPl/vfqdkRq91WBsr0d1RoPZwsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi2zBAUyX7hnNSpFPEzZmroSHnfdWsFA6dugQ5nKIyK6Qp3WUl
	OJEzuzuwpYMWhua3iFkaRCLIeYICvX++4NDSNZizlRrqerckGf7tAbKRoYlde7XIgpn0C78p1TL
	ArOGiMHqA65JUK2sWEWHtg+XdeIj7McrchU3MX/NkYcsSe96qbLSDT8mqj8aWcmc=
X-Gm-Gg: AR+sD12royFAgpDUZyzc6E+B8U+v+EtTqsFxUDYPaEO5LDF7A/OYY5n1jx0v5bUTadh
	u7vo62DSqEdSNFqye93mgB9uPHBiHRXUydCyRtLZRascZV9fShbdnMpCJYeyRqIqDzTaf5KfAWi
	anLMPQCnqlw4CRaP0kr8w319Psi6COjK8SQEvACuzByfHaS7tkTnLE6SMlNtJFrmOafnxVDHaLJ
	OKVQ5en1XYjjiddY9fbWQyOB0uXvp/pKbjXNh9MJDHy3w3PGp+iQsGUWXKFmEfVkpVU6fASfl2e
	WPcwIkKrqKXMRMMrSDqkwvSd0BzG3e9MFaD4PQO3IWdG7Q7mb6ZSvRVgXUQXJIfSocg1UZUolzq
	qMTapJwJ36o5X7XV8XiTAXN5W
X-Received: by 2002:a05:6a00:aa0a:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-84f2e0070d8mr16720037b3a.21.1786012476096;
        Thu, 06 Aug 2026 03:34:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa0a:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-84f2e0070d8mr16719942b3a.21.1786012475666;
        Thu, 06 Aug 2026 03:34:35 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:07 +0530
Subject: [PATCH v10 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-2-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: KbyxMKiyuvqrCNpuXfMGuojPpeiXMM7y
X-Proofpoint-ORIG-GUID: KbyxMKiyuvqrCNpuXfMGuojPpeiXMM7y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX98l4TYIDubN/
 LR406ExHOsfelPaHkeT8wapyh7nl6Zs1BihZjHNd6/q3+me+rKede70k3rWZq7P4uGIZjWghqT8
 OgWIuX7PTvqsoPWjmUprcZV6P4pToJo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX5fSliU01lDMl
 1HZInIjD22GASJRGz8hy/k0i5ZRqqMsX+dKINFrC1kSgABt7aZgejX9/WwN31fjLC2h1HZVdkiC
 6QKVQQ3B3GqaWczF6lg2e6831QYJHRS+I+OkipNGJGtMjCZbwc1N9NC585p25Q2nrpaJKw83wt5
 +6r8+1C+a0TM3ZLMEYkBEi2ATPdiFaHOf3bCrEftJcSe1sOVHBTBkY0tK95p/gXOzcHT4nrFcct
 2GJMOi+1d10p039on8tpQIp2L9kiIIi/NmfflpxOXjx0foKCQTKn7volNSTwKbtYHQFhaJrBemQ
 I8ejJFs0zBOx0rOeHtuv/0JWtSchhIX9SOV+4RreLI7KeQJcPe4FW9agZ+mD22c6v2T4nKmutlO
 3SjeUkz3qIQNMcYLtqcOhc5WJELXoJRM9CjgM1cDHPYJOz7ON5Uesw9Uag5v9+ws3cm563PV+0U
 X7H7SRHAIk+AD0KP3kg==
X-Authority-Analysis: v=2.4 cv=d4bFDxjE c=1 sm=1 tr=0 ts=6a74633c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PEPMgF9El5tgKvQp_-EA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082

The Milos video clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented
qcom,milos-videocc compatible, this is an ABI break for any devicetree
using this binding without specifying them.

Fixes: a4937e974186 ("dt-bindings: clock: qcom: document the Milos Video Clock Controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-videocc.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..4d8d109cd304ef0f5afc5c3fc7961a6156003d4b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -26,9 +26,21 @@ properties:
       - description: Sleep clock source
       - description: Video AHB clock from GCC
 
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: CX performance point
+      - description: MX performance point
+
 required:
   - compatible
   - clocks
+  - power-domains
+  - required-opps
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -38,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@aaf0000 {
         compatible = "qcom,milos-videocc";
         reg = <0x0aaf0000 0x10000>;
@@ -45,6 +58,12 @@ examples:
                  <&bi_tcxo_ao_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_VIDEO_AHB_CLK>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.34.1

