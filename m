Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C3B47A894
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246441; cv=none; b=LCZaj1D/3dtpUd6Sb2xTxehwqWLYEVqnmJ1vzFrFMoF1gW3XI+UyuXDkW+RclRZiIMuvStAuEuF/d3itMQMyzuqIUsMiC7vs0xtGo/19q9hLPdjM4RyrFPyRyWyAX76d/bBX3JyLvjCja3kUkH+AWDFYVzRvkAq4ylDNe3ZfskI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246441; c=relaxed/simple;
	bh=/GkuWioc8EmlLG3OhgcLeY/qF3cuJPcE3d5ehINiuok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vDrvUwxVKOcpN+dzzWEjoUvNB3fHVSXOVseXknjBrCKmewNzwGnNufojhw1MIw4KglegMcqZZBnMi5KuPcK1JMpPpDC3+7UaW8JEM5BY3CC7oNH8fDJhLUhH72XU6qX2FqEil6WdVFJwlsF2Gr9bcqhMRX6qg2I9SX0+ROZgGfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1nq8bQ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1lEsjy4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1nq8bQ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1lEsjy4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PhYS1270219
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QMnK3BU0x8u3Ow42e0wy/Iz9sWsMqtB3FpvcoguTk0g=; b=O1nq8bQ2eEVGh8wu
	0bl9Z6F9Fw32dA0E2VZRCbxajc+GmiIXfu5WSc68mcrS+MwOzvjZDbGjmi0Hzt5B
	EELjf7Etm5vWedt9WtNRy2KisR5ug0KG/VlSigs971caumg7pY5vnZESIKvvkwEl
	42yADg2gyHL2KkgWsWJ2744V6By0i0Ef2SSDNIyrjsqnJ8JZ90huNMhLLcPGGis6
	jMz0BybstY/W9b/oGNCIvMH1scmCMaE57SWdyaNcPL9XiZUo/L2KgZDQjmSYIdtj
	QaP6ucC/1jDdPIhMLrFDAjAxtD545bpAxJV42k0CZNDxiRwvR68MAbeCpGI65eQQ
	6JZHew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90ajtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f925ba4eso350379585a.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246435; x=1790851235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMnK3BU0x8u3Ow42e0wy/Iz9sWsMqtB3FpvcoguTk0g=;
        b=R1lEsjy49iWbaNrqo7mvRYWV/SpCW8M8WhZtvnokNxFRXPNz1bS8W2+oNd2OLUbGJq
         S5IRdt10Gif0k3mIQoyJJG/WDv4QOwlwq46duqI8A+r5XLt4LREMnRYsXNOo+/rzLzRM
         0tPkUxlL/lA7UtT1oVLH3hTKkU+1LPhob6QqujamiMWoEZDcYhWa7yRSr/FlLHUyM3VB
         kVoJKIWlQeailRiFKDU89j97r7kOTJGgmV9h0ONHyL1yb+PK+1/l8RuybNRREGBFl3hT
         sSboxwgcAmOtgwzFP2gaUwzQxVUnVIZ3QnWmHxw9pQM5PdwIYwGjpIJQvxxoH7WH45lY
         CbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246435; x=1790851235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMnK3BU0x8u3Ow42e0wy/Iz9sWsMqtB3FpvcoguTk0g=;
        b=qCkhIJfXXWswwerXtQF4Th12AZnyV2PV+OwiqoXmfBmWlvOlWJz6BcPy/1gcjeWmXP
         4IlUgEqkpo7rDh6Wn95wVhEZGQgpYm2Gd81SAJnIVaIejkVVH3rQsfaWkVAZFd3NEDOY
         ejqqg5U8B8591SHphtZ1s6LK/Ui5FMYWFPQMXIhOPxXxFLs0QYRtaGHWRS0Hzlzn/CaY
         fejV2ZD8nfcyzouzExberPiBZLQRKJvMKx/GI663L86krYd5Pfnt8XI2c1CSeHaAlmL3
         8zwyb+Vwkka7/nYIVb9MRRXHKHhpxDiqQA2JhgJAzBZMWvVoXC7J2l2jfpj3DNzceCny
         FVeA==
X-Forwarded-Encrypted: i=1; AKwUvBzgJcg0bmMImGTn2VOAeGiVO0C5UGQWUr6tGtwxxMCci8SrxAMOBwF8NtLAI6tK5dXZp1dwForqshE=@vger.kernel.org
X-Gm-Message-State: AFuF++kPgfhccCBY3pXFq6C3q3du81T9gMYL1ZU0rPuKIpPoVA9g4jno
	vZqWXEyNi5IRNTdNHEIhou6KpWwCL1bnpEUTwTp6xNesk/Tpg8X68gtawIBdPKGRqU8MWsrAwF4
	sJyLmXJnCS6gIgdxXuK7wNidYvKzHJYb8zGG2TF+04escZlAkuka/G8J01ZPFVVI=
X-Gm-Gg: AYBFou3eK6dNRPtyFnYPhEIC39BhHEVs0Kgwa6jNVwCM+uMPcoh8n15+JcZY0cqc8c/
	YaKvtF+SyUpyzFP3NyEt353jvmzW/ahIt5L707hswU3lJ6dAQ1695ZbD/fFyMrDOp7dULya2jr0
	9VVNQSse5Ow9iCN1MBF0QpIkGHTDfR81wra5ymKH/E3j840B4IxL2gdUlMpLAt2C7WOpqt6wVO/
	Fs9UELLzdrOK1ZoDC9meqSRxvbAwEoNNRemzDbKTbbJDkqJaB5HmnPD061j1IEiNB07qyC850Dz
	JRQ5YCEyCJPf0QRU/5waoTvgmnR21b0mvltTBuzVeLRgSmbeoBTLPkD1lowbalRRUAtPAo54YU4
	RyIgEVRdw
X-Received: by 2002:a05:620a:4148:b0:93c:2c15:e51d with SMTP id af79cd13be357-93c363d6666mr216465785a.46.1790246434473;
        Thu, 24 Sep 2026 03:40:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4148:b0:93c:2c15:e51d with SMTP id af79cd13be357-93c363d6666mr216460785a.46.1790246433838;
        Thu, 24 Sep 2026 03:40:33 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:25 +0300
Subject: [PATCH v5 09/42] dt-bindings: clock: qcom: sm8750-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-9-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1901;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/GkuWioc8EmlLG3OhgcLeY/qF3cuJPcE3d5ehINiuok=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3iS849P+AfG8Zuc04kIJdWro28qL000OlnP
 cN3aR8Z3SWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT94gAKCRAbX0TJAJUV
 Vp64D/9s5YJ0v/ehu2LuE+H1lfTvrwbE3H1S7+TteZ7YAXK+nqta7ztJMGHbvD7jhk2qwZ5nIab
 YQPjc6pXmlSWgOWne/VmlrgvL3grhlkCChVDtsXyAch0KAZaIRV28VTvRssrYHXz/3OTRHsXPC0
 OeTDTYY63suZiXTDrolsuLTUPpQtNdNvWfD/riO4r5n84lxTLZpe5yUbZvw6nQ3+qYMrwZONWWw
 GZj0o/PdIh3hodK6lG1Xtn59nQUtD1EiuxPDN/qFuPcMJxIzx+ZqgK1NiKP2/80NIHWeWGJTW8t
 +hlFtvT6flLMTWpO5jqfKIjgrFc3XTH4tCFBOeKwXdnE6YsBFz++qgEDI8g502DWvIM+kwDI0+B
 ONwB7em0q5hSxH/6wuzyH7JYRXBwyaWbzmjHBRp++MOKe9iSdXz7Kv5T7O9sISp1Us58wdiueqE
 /ScXYKQuwI4LenDPRSxZVYa2GWDOcR6bN6EeHeLVgHD49WefzvNmWu+W9wwN4xVLhv3XZYZu8wR
 oE72XU/utDoM7DiQSQTEa1ldcZ/0JDN4nyP9hPLT0KNruvQPoFz4SVMqkr1+HShE8Nte9RnpKsX
 Sa9AyW6FpWGm9a60+5PbScPPxf6x2Pn+6brVIyPvJuPokDAQ0tqMZ8tPmFsK5h6Li0zBy1My1rw
 YnBjNQ4C4hJ7aaA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX281ajhzLCMuc
 5KJhRHD3uHtMkOS8KoNfMF2C7aN/HbVGcX9hepboML0KSfDEhWL7yvjn+7PMq1OJwP709V9hbWB
 mxzqaNzdYMEdGOuBhyXe3Pn1OspzRL4=
X-Proofpoint-GUID: DKAAirTm8-EOy4bHiMB8wrBrkCRWx4Bq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6puNFCo5TeUx
 GKD5O5DEPR4MB4oeipNtiTfCJbYjUaFmrGwg34EKPpeBHdYjOnw0e89Z5cuvppXyzNQbVRyUebu
 DRdrRAJNTkcUYiGqCyVY/720fzGp64xu+vz1SaGmQGvwi3vhoBB/ouHPfjRk5RSASffbnPokKF9
 hgroX86/qDdK0ysGk0LeP9zmMWZe4jJ/ihOISc0dlQ5FCz7wIIlNdjb8TCnra92eJajmEW74pcZ
 8BaGOV9pFWDjgARMWS54UGyfcHBqMAnf6CUyeuHTmsRgc8MHB4PQI2sCqhAL5BGawCEuvWjS8O0
 BC2vQPWWIrkkFkQfPaLg8OUMPr0Zz2y+3o4nmBcEnvtKyvnEvEeOWap0v7aLVJUBPfPUkluN0f9
 nNxDpTTWwYovGlexyzyihlGFDcBuc/Q6y7jCgUe0iSD/omsjcNNgClI5Lb+YE3x8NKNMRXU2WQI
 M6A3z5j43nOmSRbK5hQ==
X-Proofpoint-ORIG-GUID: DKAAirTm8-EOy4bHiMB8wrBrkCRWx4Bq
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4fe23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GDSCs provided by the SM8750 and Kaanapali GCCs are supplied by the
RPMh CX power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Fixes: 342d2a607450 ("dt-bindings: clock: qcom: Add Kaanapali Global clock controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
index 0114d347b26f..59da3eb2b073 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
@@ -34,9 +34,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -47,6 +52,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8750-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +64,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

