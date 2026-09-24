Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5623647D46D
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246447; cv=none; b=Bj1mXjIjRTOq52tZA6bSKzpgbjvrkvqabDL+1RaEiMYSAHBXIwYzOI/wZ/VBSlzW1iu6KyQsNNVYyDaMEtqAg70ovDlBXueaXDTy88VxhZL8wuoyU9psmAIFFtxM1/qBDOdMpw1wP6K2qvKgOeMYXc1EgNgINM6SmNl8uEkPvos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246447; c=relaxed/simple;
	bh=ZQ3HN/3ivnmGnMkFWTAt0dnTEo0SkbB4gMVEvHouFJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XIwBhPO1/+3bIwL25LnUcVw0Rf9nSc5qFLyBir0Fep4AiGR42NYnszzt/OqGcaTk6wJGrG6alRb71cEr05Rx7RwUkICJ/bN5keMl2RnRnJ8n5yNws/peEK07WFLx2tIBuH/+7irEpACxFAnMRkz9BGRw+qZyGgnf5fudTIEN1/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/JnPcVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7Zb8FUs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/JnPcVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7Zb8FUs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1R8V2858020
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+NOU+nF3bwsk8Fr1FxwE0nIa7N/ko06+VXhW9ooymbw=; b=Q/JnPcVEfLMMwp1y
	ZF20+xr7wT2PvruOgFSZFx9cMTLq1KvrtmlywDMsyAlHYNYceTR/zoZVQRo+vgsO
	VwbObDxOdzJ6EBSk8TbN9BRuDf1eskOL+uamLFRVQB2z8Zuadvr3B50LXuZyUGTn
	L2B6dItWbeyfCVxpoDsTohTRKzpBoD4mi1nCUutWZ0+WN5+Nkp4rtAj9B3dQc0iL
	l5UVUDIe29nfu6W6BKAJ62NK5s+XiA44iMXqdyEPTVhc6DoM7FIf45a2XelYWFHe
	R1J7D/TwXG38jA/zz1fFnGfP726YDP6cj2vSSeuxtPsCGzYPqCNhkqARlcSCBgCS
	Vi9IOg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag578-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a05d645acso370044385a.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246443; x=1790851243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NOU+nF3bwsk8Fr1FxwE0nIa7N/ko06+VXhW9ooymbw=;
        b=g7Zb8FUsVXYQfeJy0/Y3nUa9sa0WjLyjqviEjLt9trqrJhp4Kl/qb9qXd2PCCkyKOP
         Vu2zt7jt2xr1wNf8ZHmxJnwg3qsenrXA23KdmLRCef56z1aqd/UMWNN/98oBu0cJchwt
         mUn8Gz2UBTETK7Y4lVnSd6XDhVSg3Sp5HR5JES7zlvBtyiR6/O2DP3DbstogiKxKSrHS
         1R/WN60JRC6JeNAUX4LlTe3OwCZ7f65fm2sxFH5FuKB8kvsFTZthbf9FRZHhaUCPLLvB
         aUimEdrKuEegpBOSBUNuUZGESqIOzjxrzhJlqMAPWZB/Tr2LJLmAYKFZ4jgwBuj0Jr/M
         fcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246443; x=1790851243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+NOU+nF3bwsk8Fr1FxwE0nIa7N/ko06+VXhW9ooymbw=;
        b=g+BwmaIAJjc+vl/QBadeo+UZ4Coye/H47oI47wPDUkICfpJISEm7p3lkHoxe4qF7bX
         LJmSQfjHqgWYwUbP6zBTQP7ZJuSPl2DIrOXSwEBLAe2DyfhyJ5NStfJrI1Bl11TVLJKs
         u2H/B/xprvXwI/0eqgbSEkXQOROIXQwXdbXFuzFUwoEnTNduygJ6rDR6XQ28QydP/7bI
         T5eyIDl58fOlOYWN5D0/WGFo/9vG0yRGe4N+IeG7lv5Gd3Lisdw257WX4/qnrrbuA/BW
         jwe5bXmWTmoGwyjgU/j45VvtnrghsosaCCDlH7Rw5tCrzoXFiip3VgJVGg1rcPu+C5I0
         /0Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxH+7olnoIlszRvZM3rTMGFgkeznbni822OBPmZ9ibESRaveGSPbZ8RSwvVngKyNZu8BLiUzbp2GR4=@vger.kernel.org
X-Gm-Message-State: AFuF++kGvYtka8mMHegKmyy10x3n+COSJ9KwMrcZEVHIeCBLNIJ3iCgS
	RF14CSj6qF0ZAw49AglP2Ism2ohNZ52dHQcnRhq8VsvOz9UGF1zLqnCeeJY0qzCivBB/wgNLAtI
	pjwdnQ+hGFOoiDV6+Wqr182tuyNf0HCtYtfX5e4/LAioEu2mjki9Ro6U7Bd7dl0w=
X-Gm-Gg: AYBFou2lnvd7krXoQYDHwkHiDEGGecd8o9us+YLWLgVy0hX6Q4EZj9swDpnvgwRvzw0
	ZehR1xL6SaxU1A7SuzqWnlDCG/yvCAmRJjhSIQAQVhx6/OxfghVrbslBSb4aqjlArsZPx6rayfS
	nPiSiBinsJpvDSh1fsdI0b+v2JxSEY21YYVQTQJiO3+w1Smcgn673KVFcI0MfPYqZ1zc1nkRZuZ
	4gD53R4VPkfqx/guxpnvEaYHE+yTnMmNvkQfVWJHz4KX5bYzpe0P8ELmM79FYBgV7W6y8pIGb2R
	Ekcf90TFdcjBXTjuxt1+Gzx2xWTCpdLT2Y9oi8u+wkrzrx/0rTgFEhDjJ9Tcdv44eSYDXY/hIaK
	q4MEou5xR
X-Received: by 2002:a05:620a:c4b:b0:939:d38:3ab8 with SMTP id af79cd13be357-93c36248043mr215198785a.12.1790246442910;
        Thu, 24 Sep 2026 03:40:42 -0700 (PDT)
X-Received: by 2002:a05:620a:c4b:b0:939:d38:3ab8 with SMTP id af79cd13be357-93c36248043mr215193685a.12.1790246442249;
        Thu, 24 Sep 2026 03:40:42 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:28 +0300
Subject: [PATCH v5 12/42] dt-bindings: clock: qcom: qcs8300-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-12-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZQ3HN/3ivnmGnMkFWTAt0dnTEo0SkbB4gMVEvHouFJI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3lV+iaEqjdhPVQ3WfkkJjk3YELVo4BpigWt
 tv0IQ91j/6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT95QAKCRAbX0TJAJUV
 VlohD/4nW371UejE5bWpOVK1B/yZlvWnlFe39PKpoVt2axjlIccIwRrq7ySl33ofEIlAFoz+CP6
 qSWzq+UN8mXwetHwj87cat4kHSgQJ+UUkg43K+Tz7G+32BOqdXnRggeJmxPUa/88njF3Uw8EeWT
 iLB26i55VJTEZN5T22wFm8aNKqQ4v6LCdvHAj4bqFjvs76IgqLKdaBGOVyuVqfYGbUJIEUBDEIz
 lPTo9sURDz+T/PVjLqB/1qWFXzr5Z4AU0BNa077Hl3J5IBVPZ8mZ6fqcHXbWbqz8SR9gOB9DzEI
 CGqK63jjuYKAemwSxrcCIb94T4WMr3OlO9pViuz74D5tH6EVHic7BO08jTJ5loSvyFQJqW0VI0W
 fxc6nr66ZoqISEpOJ7CswXmv79fw+SbyxylEsWgthuBCYy0n4eq801GgkM07xdo+kFBVxsoZwGU
 TGlK/ydUbAsbsed/Z+y2sFASBai5cHfjVUikCROcly7fyB4WTQyGtgCOFxLefjRl1yMpwGVElkz
 x0XrsaHk6735ZxO26KYerSxptLR70wyfw+1qcBprwgjwCst6tpcwKiFoGc/5Yyink1ISoU2+mR2
 QTnQP0eEBwamcp4XWL8l4o0hvwc3+JjETa/o8mDYccYsrWhA+OMORTrebbrxQZauivxHhsDPMkP
 Ax1HKavw4OrzpOg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX2kHqTjVAZ4in
 Ekb7jL9NPjvs8Bxt/KiI6CrJcFVtCa+07Mr/hKSJhfKmtDW4SsMp2VRkaHNw5fFSNbSsr5SqmOZ
 ChOf3QWdnyTYOV1aRzTv+sd8a+ujkrwc2ghGdotjUIvWyDXnh1TTUExI5YqPiDcxQaYz189OeAV
 8dcY5QMTkzXGE9gKR5T0pOP+DXkSBfgVyeDHEYt97SQqPJir1uTdEekzv/naZVxbqGvJk1nWY0d
 kAFSR8McZgewix8JfGdkSYE45abS/6RY3q8uaJsVlkwBMr4b26VmrjiKjGv4wuJlkH9H2uyUhz2
 Hx6fvYY8Ge3HYIUopBaKLq+Eg3b2zoH1LMrFqHJWWOOpfzpPutwwF0zxCaNMY/bqSMnqZdQI9xH
 LxmOViM+kcIAuqAQo2lN+UOBjlMwWj7tRTuVxK0XB1XMugN0PGn2c4HhSJGVjYcrMECsi9VqrEX
 6vByp4oa+k0URvkzILg==
X-Proofpoint-ORIG-GUID: _cpFizujDELMJ2y6u2w5sXNrdrZ2Saz5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX4Mu5cmxqNxOP
 vRZ2Y9MnzBa4E00vtepXqVHrYah07PI1P9g30FJdqeJRgghbFNcC/9vFSnWGxsyOf/+PPszuWIa
 G0JLzQuDr5VXX0DmK0w7yqtvwV8mZZs=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe2c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: _cpFizujDELMJ2y6u2w5sXNrdrZ2Saz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the QCS8300 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml
index 081bc452081f..a2f6e97f1848 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml
@@ -33,9 +33,14 @@ properties:
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
@@ -46,6 +51,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,qcs8300-gcc";
       reg = <0x00100000 0xc7018>;
@@ -59,6 +65,7 @@ examples:
                <&ufs_phy_rx_symbol_1_clk>,
                <&ufs_phy_tx_symbol_0_clk>,
                <&usb3_phy_wrapper_gcc_usb30_prim_pipe_clk>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

