Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110A447986D
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246431; cv=none; b=ZYIUxU/OBMZlyyt4H5iToBxx/z4P4LvjxiGO2IIMDaUBsvEGTEkt0ZnOTEhjxyC6fDjL5+hQPLuAHApNrLxEjPraW6BVdE6NbO8Px3LfiQB0Y7JlrlqH/jVb32ZqAijKEN+HaW68EAKy/MUPFCh21wlEwPQzxnkpMfjMD3SKAnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246431; c=relaxed/simple;
	bh=sbdeSIFf42XZ1/Iy3ehWAYzn9v66wZUlaZKxj6o/PwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwaDeCfktvyrlInDcD+iXXwonZVQRrbMwK+WFWuQ6lOgQgNPsfAFY52TpH18mviGo5zOxxGqtbBzDu+Ay3aL9hrrNjVKq9+KG/Lb0Mn2CCA9VbTJTK/+fUYl7oI73V4DZ83JkhGMqPBqPouWVIwToTFtDCIVfKk9BxbLEKgkNSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=POO9yRyC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTXM+Fka; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="POO9yRyC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTXM+Fka"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3OiL2483683
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EiA9JN2AChOayXpT6VUHsEbFx7sPSB+rkBxar4m/h2c=; b=POO9yRyCNvagzpl4
	SwpF8LkhHYIUDpD+831n9gwBHAkUck6kfbvg2EFpu+9s8MekTDDQ0uUs5L6YKnGy
	ZTBtPd44LhXj9uqKGJHCZ9VJg8i2HJ6gfY8+39jgxvKpqX7TAugzTpwqdNPb5UJR
	4fKvsWGXlQuWZwoUdtAghctWwJhTD6jKfM801zf1pBwGKrhzpzcLq6R6jmvdfj3/
	t6xEVe1fbG0i/KrI4BwW7jxVGSHaJOFfZDWAe0MTzZ/K3+2M0LxpJoN+7odw8URC
	G5o68+CO/cuxw74BETWV1mQrwpkXGrfmT0/HA6DQEPFZa3bV+JFWnCdKCwfyYPPJ
	LJ/ccg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s904c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5329e965ba3so25388041cf.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246425; x=1790851225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EiA9JN2AChOayXpT6VUHsEbFx7sPSB+rkBxar4m/h2c=;
        b=KTXM+FkaksXP/vfH+zr5Jl0myLclIv0PqR+5qf41RV/dNueUgHAB4yD1fM0zW3byYt
         Tw3qm5o7UVUHyq+R7HiT/+e7dXGyIYM3/hvaMsmf70fii6OLj+SqIvHh3XiNpXH3cqpb
         bgfu6wu+3w5erLEg3+iPqgs1JL5d7f1oGUfqSNuAZkLSgWgsQKnC2+g1/BuD9V8Luq5z
         y8oyewawYEitRx7xWPfRr/C2IfQ+2MRu03qqj4gKZ9XRIVdT71b7X5PpqO4i3pRbv6Zo
         /M+aLDw43tisNJpX6GomtXLdNw8NKxerBKJjkMjUMumh413QsQA3OB6thIycqblf5wWA
         QtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246425; x=1790851225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EiA9JN2AChOayXpT6VUHsEbFx7sPSB+rkBxar4m/h2c=;
        b=em9apXRsIlGJ8JM+IdxauXqfx3ofbjQkaHTsB8yd840v2GZyL9WnB2fxOWKcu23GVd
         Jas6PKSUz0aEAiUhJa6OQJbJd9OFG62DPVB/6BRC0dRJ1kA7cjwGPPNPfnF8ZFUQ7k6D
         +j9gITGPoCQYquAIvmFfycbv1lLS7rOzDwu+N/GGXEcN+wxKjFOV0pl1AS+Q4+tGOwkj
         /i6pV037oCNqQz5qKIij8Nwfy9WbECfzrE27+1oOHWHqmwOw0WdDOW3/Z2mvPVZnuZt/
         UU7oED+5GH0zOPNK/avHdAq4aRRF2lTwvytidLKGMCrURmw2g+WYsy9p7/+N/HnZPG6u
         tLRA==
X-Forwarded-Encrypted: i=1; AKwUvBwUqBDtoqhym/tAHcgvk1qih5fs++LNeT1z/Hp9zhLHuCx871JkqvKE9ixFBW6NMG0B5qtYuiWPgVg=@vger.kernel.org
X-Gm-Message-State: AFuF++nP56GX4COaGdkxcjdROzxGnXWgoDy7lDDWDeg4+xWjtvlh6h+g
	yCYemDWi5NMZuKcx6t6ihXLBTEsSpBFA/qF2sxLyG25GDFxnUMnIL56l1R1sD9aqUx3X9MdBtOW
	Yo1TnbAs7uwviUg+mq/giuraJIwfaW/r1wvle85MohKgUujLWMPTd8QNn6J79poc=
X-Gm-Gg: AYBFou1dkI1Ga7TCkBa6FuNRZP9yjuvbjfVW2wyX/n7qJCZvSl1vbecURE59IhhA53G
	3Di1NwXBKlVbW3bNVovDig6yEQcsoRkpTijcV+ioU1lvyyzUA3gDDxvTY/3/aQIaALcaEep/fJJ
	YS58A4J48f6jR6rzndfAqnKPoWYp/XLPNbPDjuLLByNS6yrqVNL7GtESuEnix2YiZ1IlaC6VQVS
	1J2CKH/JBSKjm94PpvNH3Q6oNiKC/H02q1pdVRbHBr2AjRhNEVKmHgJdUElnBwiINyessZTST3D
	Fho+6RZfaJ4RobFI5Vlyp4rRxHYxMsj+Xo87imjhh/YvZeY84cs/mhSXNQV0ixCFRRNOnG9m+LX
	5nakMRTAY
X-Received: by 2002:a05:620a:371e:b0:93c:90f:b535 with SMTP id af79cd13be357-93c3625beb8mr245037785a.4.1790246425260;
        Thu, 24 Sep 2026 03:40:25 -0700 (PDT)
X-Received: by 2002:a05:620a:371e:b0:93c:90f:b535 with SMTP id af79cd13be357-93c3625beb8mr245033485a.4.1790246424617;
        Thu, 24 Sep 2026 03:40:24 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:22 +0300
Subject: [PATCH v5 06/42] dt-bindings: clock: qcom: qcs615-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-6-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=sbdeSIFf42XZ1/Iy3ehWAYzn9v66wZUlaZKxj6o/PwU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3febeHSbtRbuIkmKcx4U9mmWkjlXl54KszM
 WRqRh034oCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT93wAKCRAbX0TJAJUV
 Vr5mEACZZidrdevU8y8R5YhEnJ/ZUX9f7eF1CTn4xLUlhk3St0zLgtlw/pJ4O7TF0E87hRh1M1Q
 j176AdzfBchnyuD+0TFC5B+zNEin8LFlSEtgH8Eaw3APpM5RfnU3CTY8sOhDt5fT/DVgvl0jLMa
 dxrDAnK/yiTeQqeg1fEkNMbav4FSODWckaME0FCWYgbB/TeQO5/EqsucgaFXJlS+9r3BPHYISv1
 c1O9VTdTCNbfPndlfObWldTU5ull+tY1OFUxYczKechhJKyVVAupyXR+j0EYUgWuHGy/GZpbDCh
 glBruc6QGmzGDjL3bygCSj8T9PKw+FTeMYcrcrLpIkQ7fPUcU7M7meJ8isNbpt6zofWuSpEfvSN
 veWPQe35ceSPT+84hHSa1j119hKkf0bzHeCqJGrA9bUao3D22DnqPB0GLLdhVSpZ6MCpzBVOEMi
 5jCd5v5LitM2ZbBhcHq0zG13cWp3Izez1nGbJAamNVrNFNiDwj+HG2vp/WyHAP10685QfZo3U/W
 sZ+4N5PCXd9YaqGBYN/qTsmN/EDhNR1T52HB1yLN+O3uO8rgOM+EfHB2DQDkk3u4uUvNO2xvuj9
 /habb66WYp+86QcPP3MCfDt+HreixUM8dIN2YujsIj28VvJSzzbVl17w+6QbHnjJnASl7PWPPQd
 bwXBM41ewAEkRUQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX4YJJBrp4yAsz
 Ymh1tEaazCcHyBbKf/0onNp0Kdv8+oi4HgWBEwSK2XYurZMmTI2qen+0pXD2Oh0OnLrPMC7V3ej
 K0KwDefnxf41CFY0+reAXi14LzoBMpFxxzrEN5GCOiOcHi0QpNZ0dAAi07TG7TcbeajIMJLP9XG
 JlWnpGqsworgYGBdhlkhBU8P/JixceExMMoOvlxrNrJN2e8bRVsijNm7Q/rdHNMxIA8oGC6zNY1
 +OLUZtXb3G3o+ajOavfmOBai57AyfDeqT4m/9txUmqsqDgmF86dwIwbJ9Sxgb5BNjckShSnUoo1
 Dqrl2o6aCoZs9PFPWtrbrIo3O9XKoCQ4XZDmzJbi3F0ZMBjHkKumtLLGgdn3TQNnfve7tizzd5E
 EQRfCpmutCiE8m4ABoGR/PBqeHxJ4ahS2sG1v3Rd3WdjraXVELjICEETZx5txekIUGhRKPcGefT
 FC2xLXFCI5sHKraLk1w==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab4fe1a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX2/8KsTer2u0R
 viEPiPa0Y1KKzHPFvqkEPf3U1MnOB9XKUaSkkTSNURR7RJpwWKffGUpKZxHqpcQaf1eTJNYcRdj
 mCnx+LrLR7a3pOtfHNUADlggLS/8Qr0=
X-Proofpoint-ORIG-GUID: TP3btV1vmb6FvsBFespUwGz4w6yN4ykd
X-Proofpoint-GUID: TP3btV1vmb6FvsBFespUwGz4w6yN4ykd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the QCS615 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
index 4a828e102d25..c87248531563 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
@@ -31,10 +31,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -45,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,qcs615-gcc";
       reg = <0x00100000 0x1f0000>;
@@ -52,6 +58,7 @@ examples:
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

