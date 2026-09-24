Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221864718F9
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246434; cv=none; b=aWz5NnI1DIXmWnWSrNYAZL7PosHH1ke4BLSSNNOJcuHD+vcDKuvNDgBF3KIQwq1JApswyMT/MLXjOXPGYWSz6oVP19rJz4yBQFOMxH35uiU2UyDe4hyl6yvorpTnEBA2n6t7STwcDuiw6N2f/skdVVzMZEDgHjlkbbrc+/0Ed2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246434; c=relaxed/simple;
	bh=58V6i2zx9JlKRMOzs7ZMIuq3pvZfn0TCTADKKyQzG0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X0JW3g0HaVDjB9D05N2kMnnMb11l0Sj6MtQlbJEhYAcT1rf3/glnNVmiezW5+vBLfzqxeUrRbsYctCisVUjBT3FcUedfS5CqraoSx9zZN5TsytTkSAcowXoLXTXtBcOGQIf+4hPg1iw1IhvnxekU9+4HlUSN9bQsVIa6NCTuOEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMzCMylE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P683YWBc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMzCMylE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P683YWBc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3Wnh538578
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uf/QL2Vr4XlivNd+DCAXvfo4McHGw2HB7d57MYD6yhY=; b=fMzCMylEz8xZ2Q0d
	FS8HsP3whf1Wu4jl/xVaqVQ49Qy7oMPrD9yY9+JVs2jAZOwbdaePZ/4LZuN+0UA5
	D+GMZidInknxte28+4fGBSMX+z6aisB279V1wS+4j5fAw7SbyVD8c2eXp/QZklv1
	LrY67A/tYnpLttAgO2bK4XLsSd1BndJ5fmOUYendmdSgMt2j1B0kmSdf9ZJK2raL
	XzXXlkhIcv+XK/76wpBhrOAsCSsC+vCB48YUSSt7bADr0czKUICx8WjNvX7i8gzR
	UKca9DLW4wKnBu/X8NFZfQsWGlfuOCpy7uKjbPx31KrbHzAMKtwvN511e3NEb7n1
	oHsEZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc84cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f248907fso180189985a.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246428; x=1790851228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uf/QL2Vr4XlivNd+DCAXvfo4McHGw2HB7d57MYD6yhY=;
        b=P683YWBcBCqZfS0je28aTI3o9+MgNP8h1RndwXyc/cqzNHblBwZO9FJLdIBPzXdP+4
         xBuwmyXBSJLnZop/U6/zUu+3fjDpyiOvQjimwveODSRTTOKr0zwiHJOVGlMjAAhrTRrP
         tyqJyii1ceVEddXmxy6DRW4BLlR3lfo8hbxIwCwzIRsroD66fUw3XXH9WrKqQNhE1Gir
         lSyBhUqMbJh6vD6GW6rw3n52RFXnpikWuyL9NmHjWaBHwjcjrVA2SUCCPqi7zZqdQfFW
         2/qxRkSrkTb5RuGulGhSN+ATUMJ86ouXG95vSdxEK6VJNbx19PvzkBDZaT50JAwSiOi+
         cAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246428; x=1790851228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uf/QL2Vr4XlivNd+DCAXvfo4McHGw2HB7d57MYD6yhY=;
        b=zmlE7WSclqCTFJEiPt/uCv8BR43XJStvp53C5L0dbrGFkuEGoT6PEyxzUov77iiMcW
         wFtiYXh7IX/4CoQIuAMex+m3inrg80nK+ig+k/a92y/5QNnwAyGRHTqEIooQBrjFv62t
         5seZYtIFtxxPfysWVD79UYcPfPrVOn0zSnSD4XfMXe5tMW9B5/ueUegUUqoXfNA06yEP
         QK/pTlnyHnrI1AHXcw7956H3g/KXx6NJe8xl7aIAzdunn7y6wr/tiPoAEt3XmHzkY4do
         jt5XTsdFOk8BbSDx5Pj4RAasLJKmTnx9dNt8g4daAE5XYmx6ZeVhROJpoEW6jClA18Qq
         eRBQ==
X-Forwarded-Encrypted: i=1; AKwUvByo7AJqKLGhSx56e1hRMRqw/r9BVe074S95rdCQof2nop8o5rLi29C4X33QuRCoMpRnAobdW+hFDRc=@vger.kernel.org
X-Gm-Message-State: AFuF++mdayhSgl42DZDx3YnrOj0EedQQFhuR3wixNPwdbsZTpqNzGFB/
	fxtFXrVCgZgItd7DNVM8dOlLpma4Yi63RyjcAfcsTCibM6b23BoCDSacAW2q1VEuyuRWUu5kll7
	ilhjCkpx13PKD9YfvRAiafHM8w/RIvkvTmbnxUtFJXPv/o+dq95op9Z2ujxKVoUI=
X-Gm-Gg: AYBFou2dA7dwu23+SYLc6jyJgsHfpNzl7UHYPpLx0SpCjp5ld+nEoiDNIPV1OBgw1G2
	LU7rs0aItK+58IKec5o1cOBVmJHxHaKitYbezJGrRJ7b9BdBXtWrJxgMDH9QzRu4DY/AiBjQIlL
	Su6mnPWI0Ljx577lrT/9uitmtxX8GoqdyGKzpr8pZOrSElropsJR6PP+AOEaFUtVN/kCGF8ZKp0
	WcDNKDMci+UGcujMvwXunFgEHCmKPvPg4yu3Dind648KGl9WUDYEE2p9BC5nKZvn46D1gegUQMP
	EU1UodPedgrcYcLT/Ua0DqIuDOSn3ozuSMvEhswJX96A8+JjxjjWQWpi38iaQQM0yV6tploVzX2
	CTNAlV8uu
X-Received: by 2002:a05:620a:4802:b0:93c:2223:7dc with SMTP id af79cd13be357-93c363e9b2emr235246485a.48.1790246427759;
        Thu, 24 Sep 2026 03:40:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4802:b0:93c:2223:7dc with SMTP id af79cd13be357-93c363e9b2emr235240985a.48.1790246427136;
        Thu, 24 Sep 2026 03:40:27 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:23 +0300
Subject: [PATCH v5 07/42] dt-bindings: clock: qcom: sm8550-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-7-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=58V6i2zx9JlKRMOzs7ZMIuq3pvZfn0TCTADKKyQzG0U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3guu9qhsSlKcDH4fvVYW/oNECM0kkcwruzW
 MUpI5Xrg9qJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT94AAKCRAbX0TJAJUV
 VvOeEADHLbFU20gR/0G41jxOtVhAVmA8w/7w5BjwPwxu91G2MT+CJfRddkuT1EJEJgTrz9nynAG
 l6ertp619tQvXXu/C8K1U9KSiq4C/DyuQro3O3LkyypJW3UIiN2Qwf29LduS6ofQDjyD7k0ru9o
 Y66/7vwbsyN76+kp+ifmUxkhO1yPW1qtU0Pl9VyQPcOG0YjmFnS78wVMF8XtleZU3bCwIE4ThNE
 uh+enZin/XzbdNe4CjMKWCCQjOOes1hj3E1o45eje5Hr5whluxcKYU6zBIHFN0RXcuMgzI+rpvP
 Zm14+CE1tA0U/1PjZy9oiG9w+NtkoU6XUtF4Zlw5BFuEiIT+ohW5HZrbgygxcAXQcqOuhVPYfFh
 A8AsnEItjtZ2KBzr56ti3DKtECnYHFbOX624+OQZO1NRYd+8da+fCRL1BxkBVQhgTJYi6QFBAae
 SMyaXHku+HGz+6lr86kPaMSa+y4zYZLzwE2TMflI14eaFiQuHFepMrVv8HHytmto2aSQUAgnOPL
 joAGGeEXs8XbtPvFjpMzTBiq3nCl6JtOypM3vQT37hNtncpZwtc5hBnCqKUYMZN5ouqVjsqkTsE
 ARZKNFpbs8QdNtXvdLqaYSE59Jv50sqMv1yYC3E0mrsc9kLLGfsl60gSzr04EceYcjdP7CWeLcz
 CchQU3vHyLLfy4g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: f6XGwIQBk4GxBLhHGkbf7CbwsK2hnqH5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX5UjYZ/DzQj0n
 ukZmtz11Zv/1fZ0BsbqKnA/djYcTvFIF7aPQP2pFvP5Ug0vIrWIancQUd4UK1csMXduJ0neIwML
 JqQ2HXSc+xDAOta4PiuJx6jfR1dHhOecUhYsbwskuDVvhm74Ae1dIabEa06pvV7JmXEzQBQwGjb
 SKNbyDEn2l7J03s5c8mSWyyFyhVMxxiXf92m8b4GNrpXKvfo7zkn/Rhmqm7ElqZ2SQXPJP/sfCH
 X20X4rm+FfIRwj4YJMAwBw0ZfTVbLqX5394/dVCP1wilQQde97XmFunHLYSC5Xtc1ZtSi9QxcY1
 lrWo0YqNEv7f/yovQIcr0FPQqarh0NgDcVfivHT2V1gTh/OGq203tk3NQAoS22nWnKyMiIA3a54
 EsOCcq96757lm+6odHfoKPRZx+ebW1WNQ3nYlrUsIOF/s4naCA5hHFGJW0D+j2U6CDZTdY7E8gV
 NILgjD047CylRIbaNkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX1LPROeh9BnYR
 BBROuawHjCByrAeFojnXtz5YRGrJBP0wd6ii7gyrjQfj0RCqLyzTSPQP3T14bHpSzGNfOqKzXiY
 J1LNAJ5nuMQi8bCTusoUCUqRXowLXG8=
X-Proofpoint-ORIG-GUID: f6XGwIQBk4GxBLhHGkbf7CbwsK2hnqH5
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab4fe1c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the SM8550 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
index c4e9b9bb63f5..f9423aff5dea 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
@@ -31,9 +31,14 @@ properties:
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
@@ -44,6 +49,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8550-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -55,6 +61,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

