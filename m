Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3DC47DF8F
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246450; cv=none; b=i8Rll6TNiL/HnKn1F4kwDIKGO48z6SAT0/oskA2yZvHjydi9BOz4+7+ymm8HF8wfGjb9CPzmfuO0zBehNIhtdrzzcOkADs/t2rTO37EmC6xCPhOvPlbPCQ6MhfwFYDEX4vG/Ao2UcqMGc0uWbfi+ASzJUeSpWxfKLIHH8/y27kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246450; c=relaxed/simple;
	bh=NWMd+DqbZOzQAKNtE/2aEsfe301Dt8pJ7SgbBO02K3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BFuL4j+5AQpI8KyGHz8aaCb2KUk0xA++n019G71qppOSS8j+jghuEAwwgVnxdvgkC65rGMN1HqoMCJWRJJ0WSnuOjU/LrfIdowP6GvMZgNAQ1OrPDNNV7mvRKZdRHlJsmP0iIn9YtuoO8Hd3zLwcbBGUJyoWOhnE5g5ZPVdLmK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uu4NEgXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQbVDgjO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uu4NEgXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQbVDgjO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3koN2483994
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KWCB9Qky8dWdJ7gszJJaDezqu3VIyPrxhUCDshmp3G4=; b=Uu4NEgXhke8dLWsQ
	9v27GRmHnWK1rWov8wLDig5+IFPFdb3gxEGwnDnjhRTnMT9Wj5mfRS21aHNzCxlV
	wKtkLoP7cDyWfzzC1GHkpawX4Ke8osr/uOIRasQro+bYbT3DB+9apVYyvG1nvgVt
	VxCLh70WcU0y3Y/qUdCAJWztkNw5TXOOO17YW0fJUZBBWqkP3Zpw0TpNp+nEdJ4E
	6nSwr39C9K9UioOx8/sVpOvmck0WdCOhkTUTzTaQtqJBzLqURmiW+qSMV+3cIfHm
	IYR8L2OBWXUkvmZM7bydgP97DVG0Z73AjFoPRgraE8Kw7kmQ9RvcymJzMjDLkjQ2
	2Rx84Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s904df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bfb2da664so457979185a.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246446; x=1790851246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWCB9Qky8dWdJ7gszJJaDezqu3VIyPrxhUCDshmp3G4=;
        b=eQbVDgjOTFNvX1GthJg1qDj+yOgO+H3hhVnAecSoIPFjXVCumntgR3o15jWlKGld3t
         +rytTxXi2IcMQYit7cSX+Alp1UKuzPqNtQcMoU+LJGIrqqzZCn2HLosNAT3E19xQfKLB
         mnyklP6hGFPPz8jxsMHHATzcOm8M2A0TtLnLq/Qgp3uuEidqxOVg8tmQGheueyRFpC+4
         I4r6ItySKw9mLgfRLu0h7q2OIP4Z6G5Aiu5sk3NQTIOECQwqJdm5ssL0Vwj6FGDCdIpL
         kAUj9rqPSPAS6MWm0x+yloFms7s+mHGjq+Bwg4L/8FDChQcO6lTbl+AZ+J+O+SxuQPqz
         ANAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246446; x=1790851246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWCB9Qky8dWdJ7gszJJaDezqu3VIyPrxhUCDshmp3G4=;
        b=geZva7w4stUBImxqLhXKhYkQvAylnP7ao9aEOPiwzIWJ+d00uFT3aGqQPlL12ayQWA
         5Hvnte7ZE822qkpxTaYUhbqzEqvYJJZtxEkjYYucEdqIggBdBgxAyJkxHdU09FJbpbW4
         lrxR4kOrh/DXla6yOIQmduhuK26Ne56bT80qLYH5TvZlBgfITlBEwr+kv23HxXwV05V2
         3AziFrgp3mJYkuHTF82ceVVRmtzmropNxllkcXlXdFtnbLLrkxvMNdBE172IqXXoDx1n
         DGVD2EHHiGoRMaFGvuYn9cEbnzPTA3wyxxopi5kgsEHayrY5TOMJ/DOtMdLJ+uyBPDvt
         a0pA==
X-Forwarded-Encrypted: i=1; AKwUvBzui7cRxuRoQyUzWm4QYlqzH363eqU1mt7A8zHKwoA3JfnOabix5Bsu5qckpp6XcrPpLfnOiPpaIRA=@vger.kernel.org
X-Gm-Message-State: AFuF++lZJAN/vkRjkloHnmq3LMufJ7vqFRHmW+A1EToNDH6zwsDYIhfE
	vl/+ouSAGHDN6mrNcBu6Qldo3NtramJt60zAITkmWT/W5gpEO1zBwghC6ldrgBWgt6Q7AmV3fbH
	3/jATuASO32KTF92SKzirSWD68sgfjSbiT0vGDvlgGQo73lSd4heePDfe2UNzME4=
X-Gm-Gg: AYBFou0RTsGZkq8G8S1TrxbNuhmid2kj340EZMF7VuUqTe7oqWVlviZ3D+c8Z3gUBL2
	YuE104EVXGUh1WLzY0a1HUX9E+JNKaYYk1RfuRwaEbftFUazQaKL2NXuEUEIMnFf+begrhtCbbS
	DgK5YfEM26Jb25OmEeGdosj+0zNXMaMpQe2sfCTeB1/52nnnQ8cgaZ0FCmkbn/mv7nIhO2sI5ag
	X/LNwDNrfHZ+6pZ8Qn4apJjfrCs/eNsr6BJMxl53knWbRTwlnNN/xnDv+qLxB+jFIshJZsOO5Wh
	gksXF8jw72Bgnf+IzkPIb2WTi3a8wIX9qmIofc8icgL5Mz+IcUipuJ87sABnHWRoViEvgh5dulc
	9YSR+lJxJ
X-Received: by 2002:a05:620a:4890:b0:939:6a:a71e with SMTP id af79cd13be357-93c362a6e78mr229984985a.21.1790246445801;
        Thu, 24 Sep 2026 03:40:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4890:b0:939:6a:a71e with SMTP id af79cd13be357-93c362a6e78mr229979185a.21.1790246445099;
        Thu, 24 Sep 2026 03:40:45 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:29 +0300
Subject: [PATCH v5 13/42] dt-bindings: clock: qcom: sdx75-gcc: Add CX power
 domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-13-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1946;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=NWMd+DqbZOzQAKNtE/2aEsfe301Dt8pJ7SgbBO02K3Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3mFdn7fjyByZ8E9iR3trdYh6+oFwBSKF1Bt
 qty+6t+P0+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT95gAKCRAbX0TJAJUV
 VuDCEACWmhRZoCCU/4TN0tUAi23VL13th2JnS3gIGdPvnMjLuZqcZdjDinx8I0pDsPy0oBHv5YP
 WsxeMCJlQFBn0Uxg/aZ0OzX5RoSY4UYmBsr1pygy3RmE/NU4S8EHVHT9y7y3XP8nZ1ZIWATBWHY
 aaQievPn+mh1LG8CaD7NZ1V0MSQaWM9AY7TXRLV6o7VJKwfGD6hP5Ro2yA2yAJm0G598jIQPvvB
 iTywxxKMTPcvz5gT7eYJsqKE+52nPwjg7zHfmvE0EDjMBS2Ky4IwjiJcQUom82UyT9jj087VnHx
 07FK/gfmrS4vOXHhQetnYrmoSrQZMnFR6UEZGa80JCIeIcGpyiw8uyYXhGvURJ785L155Y6BhLQ
 GKeCZZd9uAdz0c1iYXzcn5/Vciy/2EvWDdJW9Rmpt4TVBux8HRV9+nrSJrFgRpjPpWHlLs/+mXQ
 y0Vu3jwwfwpLrsvTlky2dkL8axt1IrElJSyAaSy4pNel/xuzaiOeCgugxJNIAs80VODd52Fz1Ss
 Q4qQNwAwxvpaCm4jPKaBSrGqRvYzy0kDsiA5FNAIiCJS7dwo+Vpt0zcJI8GtZbz28JQ/Kxq9FZk
 0An1D44tPhy31+8wLOylaEBwLYQ1KQnnxMYum0qK78GWsPXB/ukmz/NHfJOOBoCOTt5vdSoenA2
 R0TalCGiRWAdvqg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX5kSA0rHQMdH3
 Uf2Hu8CDJ8cu+rMVQ4Z2AbbZyCAQ1LOCAZKS9R1Tq6Hne2l6fLCBNC4itcp/j4f8NZfpdxorOZl
 R8n0H56FibRf7lWNOZMRB6O3gJt1a2Mvnqed02svdtzBMYN5VbkqarqBjdrnIsxjHrl2W2PERJX
 RWhapKIGboiE5mY7D56wDZJs13UhNNXSVQInjb2jCEpgjD5Z0dZP4QvjAni3b/njs9J7j61of4Q
 uLBC5fCztlZeprDdiMyEc+dXpmBbapVeCUTch0aDiLt1NoJJxtHO6C7ff3FUxEqRcm4l3/2jpS8
 c3fw2rILgs5tuM/zwQ2ENsp79eBy6u4VEhcm2Rv4YD9Ozi/g5TTN904na0RyeHe9fqcTZ0vs3Rs
 nCIU9r60bEX1o4wqUCyO0BbNxevoszV7wbAf0GMj2+CZ8flvgMlXIQ9tI/Lf7T8VO167jWhorul
 3xYTO+VtVtutomK7cew==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab4fe2e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX/2jCvYmEl6RH
 WTxvFBJn0Jodlor87SEccVwY9mVFp0G7OTqROURuqr/E9pnHsEqXpXsxtVCRM2utrOaAIC1nvkG
 kGFp35/UOX7su++YhN0e2/mSVyqNPag=
X-Proofpoint-ORIG-GUID: 7-H7cLJZKMBsVOSmrtd2TtgwvKChtPlH
X-Proofpoint-GUID: 7-H7cLJZKMBsVOSmrtd2TtgwvKChtPlH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the SDX75 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
index 29a0b29bcb81..75a38e9f3248 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
@@ -38,9 +38,14 @@ properties:
       - description: PCIE Pipe clock source
       - description: USB3 phy wrapper pipe clock source
 
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
@@ -51,6 +56,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@80000 {
       compatible = "qcom,sdx75-gcc";
       reg = <0x80000 0x1f7400>;
@@ -59,6 +65,7 @@ examples:
                <&emac1_sgmiiphy_mac_rclk>, <&emac1_sgmiiphy_mac_tclk>, <&emac1_sgmiiphy_rclk>,
                <&emac1_sgmiiphy_tclk>, <&pcie20_phy_aux_clk>, <&pcie_1_pipe_clk>,
                <&pcie_2_pipe_clk>, <&pcie_pipe_clk>, <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

