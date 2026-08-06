Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3030843F0BF
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012472; cv=none; b=dsy57T63KyBGCYGH3U1vDqTrxDv1cNsyrzR63QhshZgIx++Qt/72BEPuhoXQBuWzBZC4RPHOdNVaToTfCL0CRhc+Na3yV2SGfZG+zPZ26xYML+8yr1ZEUShr+g63KhasBCwco63nqSbK0J5QmMm8Ck72p2Hk+CqRB0rDEWMN49I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012472; c=relaxed/simple;
	bh=FKdRkV0vik5fotN949Ln2kZ8riKGXiZc629o1UfD1IQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P6mc3X8MS3+kDozDIJkT99zrHhcoo8LM99mF8iAfUZ27plMcYbF29iEMeGx3PFnNYy/m4rzyK/R7+BecQQE089vMtbo3MbSICIZPDRGiM8G4FeAfH133B6MheGy98P29o+mpm7WXfAbfqH8WhHBr2NxkDeTNgGfGafj92wRI+Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFsLlZ9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gkhe68fx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFsLlZ9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gkhe68fx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nffo865629
	for <linux-clk@vger.kernel.org>; Thu, 6 Aug 2026 10:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=; b=hFsLlZ9bQOR/NP73
	Cd4tzSExM3kqVw0Ez5dlZ7+911bEkvP0Yz5fCgogyvT/F2AvyZESrEUGIVGRn3TA
	oNk4JoRNGu8PlOLAlJbcWeFgkLQlIdFz2+Zku3fRDB9RNimd56XF9AlscEUgmYYW
	UboXg6aY95cEmusObuG+V6scKNIemWIyWA03qgq842S4M510bKOVdjq7/nGInXkg
	riONp9HpICmia23gAHOFwmPABrM0PJaMPWla3aFYMLrlT9FRtVECTLWPUyueuV26
	RCCdkMVN+4YSZhVGFyAYrvTWTM7f8SA65dEwaheOe1+3D2KTmqm+LCGJbo0xOU69
	Sv6Dlw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9f5bq2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 10:34:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484f26852dso2373988b3a.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 03:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012469; x=1786617269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=;
        b=Gkhe68fx0+ggaEkEND54Oj0nM3au09yrGwgdRXTvLeJi7JCQb0ZAOIr5q7qFutwJr4
         tDdeYF748H8Y63gI2EcpCvQu34jZ8rMrJYJ5qmmM6/wNGjNmO+3VYwbDyAUNdBD6S1Ce
         Y7i1V5FAjvftumYTSD+rKPJAFZWzoezs1ojkJVK8L1QwdA/PZxJGX+qznQgmX4tmWvZ4
         qWwAfRmLrIoGd0pzjApZaQ/71NPIqPv96GbjEYS9uEFGZcJpWgGZom+74h0FHfPF5zgP
         49km3BRZAFjiW3DXxHduWHM798ad2SJc/ZmaqOtFWdU1y/qvPNhAOpvgcmHyXXp3fBms
         NUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012469; x=1786617269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=;
        b=ZV4TWi9BuvXShQz2Hhnhp9xm/z2WiweGSVUMxge0lM9TM3en5v64VUCPinYC6gTQCi
         lo/+v71lPzPlOFo9zBNMqNTfKwufz3PGGvXpUUAop1ycseJCdcbjXMy2LIyxO7t6KyMS
         j3sn9tHTTHcyunCaivwLP0r2XkuUtO7aZzHvgBH2a157vna273ODG12/EjOD5jXXIztu
         zTpI1t73KzwAH/YgyDEj7vNIkAy3OnNQGnvPjprBfQRhlZ5xC6nam2UgFRQSX+ddDLHB
         FiYovnukojTCgMNpYjceMOFK3SCD7flYjMW4i4EbqOe0J8qlY6mSemMpqeCW5t6h2bk0
         f9fw==
X-Forwarded-Encrypted: i=1; AHgh+RrflPNpBM26n3T7qfrl909iO0nKsxeu/lYfTspCOwHW08kPTnee9HPmNaNDF15AKAGrWjLb56PFO/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YylFT/4CNLZeR1GcmL88SjT1TXMR+hIuWOyqTX+uuvK6rxNT9fW
	UpblOlTMp56zIddz0SDQBsybSr07t8WsCJbYd/dHShUBhsdVc51kogvuc9yBlYD2ZCj6nasZRrn
	InbLNcQLQzQXdpUmC2h17p8jlmIUsDt3ftX4F/+iKoDvsUxwtP8rnm7qjycuTJkkTsA5krAk=
X-Gm-Gg: AR+sD13V/A7nZ8AnCNgKK+07kt3Qk18Y3c3cRgVkVg+j8iTW+RXz3pbhbTBQD5u7p1F
	BprVAjs+cDnIaClUi6gMly/Ll2h87dy6mbwZV6IFr9qbx6x+C9PUJQg+/DZiU8cm97aJssMJYZH
	qcPa2KPRy4AQ5Kl+71ROzVMHQOd7+nMwfWNXzlsRETGZB0nLdbv7RAD7Tn8Fmzp7Gdh0oRd/3OD
	ssjl4rSbNnLY9hbDgaUVO8L43VaEeajDmjpHUskXK1NigHHF1SjuOqQpYbJBhKibyXHPe9naDdt
	+nw4GaQZIrhqQT3kW1ASnvy7hRjuB0BZjgg+C0ErNE3Xm4X5f6EiomB+iTXbLDM4TnMNfS+HhTz
	HF/36QxLstfYKWbn64iccq7X6
X-Received: by 2002:a05:6a00:b8d:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-84f4fd9f762mr441431b3a.6.1786012468726;
        Thu, 06 Aug 2026 03:34:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:b8d:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-84f4fd9f762mr441336b3a.6.1786012468266;
        Thu, 06 Aug 2026 03:34:28 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:06 +0530
Subject: [PATCH v10 01/10] dt-bindings: clock: qcom,milos-camcc: Add
 missing power-domains support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-1-6ba52dd14343@oss.qualcomm.com>
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
X-Proofpoint-GUID: NRJ0Xcu5NBG07lf4aMDRacvvjNW4Besc
X-Proofpoint-ORIG-GUID: NRJ0Xcu5NBG07lf4aMDRacvvjNW4Besc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX4P7fn+EJCf0+
 xTjh/StIqmrUArNAQnTE68fJyaf46JMdpErkWqdblAuLLtlb1uXTSw2QVud6pUi/3GQAUG12QnQ
 kI0pvPTu1ajmRV1YTeQQUH2NhFleWos=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXzUGNXY+tysvy
 IF1oK39X3ODRSG3nXv4vZ7H82XTMayILcHdEHoRvNogR0l2MwqrWS2vbXIZSA2ZoUdc1E4/7mM5
 uMteghVmUJ1spMgV0f9u+8HekTp2pFsCC+6XUVopfMubIHt9wN+tNdQh8Ic/JXyiGKrDb75HTSu
 IENsAemhNQYWP8ytiJ9NYW2PRekGlQLyEgMUBW/0xLzIkZj8UxVSmhRvDQ5H2p22GtK8Q+T7PVH
 drQZfMvhCxlRlEF8VRcZ2DMHWHUGn+6eeWQ58rgeKj83JVpjgMP1ISuD5iFUKFZqNXofOXdFIrI
 LOpiCP/a7K7QzAIFLyxnNaTYhBOADgTLCyRXz2AEqv19WW0PfmtJGtSTvk48rePcx+P43plBxnq
 r6INAx8ygmZs1idv8HYP3OqeiUbcOLS2Fv8foSzAXHBv+nHl9QanojuEEOSwY81mL850OUyvCVz
 oze5mfuksQq8kQ5ODXg==
X-Authority-Analysis: v=2.4 cv=d4bFDxjE c=1 sm=1 tr=0 ts=6a746335 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=90z41mPHMHFWLCXoM8oA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082

The Milos camera clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented qcom,milos-camcc
compatible, this is an ABI break for any devicetree using this binding
without specifying them.

Fixes: dbb9d53b7197 ("dt-bindings: clock: qcom: document the Milos Camera Clock Controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-camcc.yaml   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index 707b25d2c11e601384b9b21b7e73bebf72c674da..c4aba40e316ca746c7ecc6955823c7d1292d5547 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -29,9 +29,21 @@ properties:
     items:
       - description: Interconnect path to enable the MultiMedia NoC
 
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
@@ -43,6 +55,7 @@ examples:
     #include <dt-bindings/clock/qcom,milos-gcc.h>
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@adb0000 {
         compatible = "qcom,milos-camcc";
         reg = <0x0adb0000 0x40000>;
@@ -51,6 +64,12 @@ examples:
                  <&gcc GCC_CAMERA_AHB_CLK>;
         interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
                          &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
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

