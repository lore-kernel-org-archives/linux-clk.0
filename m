Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824399;
	b=TP8EaQySMDiA7M/oHomVgBJOCZwwYpw0dggSILzw+OsJJUdQUv1iQHrH/pq5cNkKbjcL
	 xxfGV5BHHKfM4pDJgchM4H0kKmMKGd5ydG/c8nzMTnf1GYzQr2wl4+FamNke4igfUkWXM
	 1Ror2y/mF3eyCoul3NH273wPPXT/WXpJadiWJMzlFWHrZC9KXlurALR1P9lC56uZSWP/k
	 N34blrteOEqGk02a8bW2hshXokCeYdwivzfM5g3DE1KLma6JMDyHJjFK0LD7F4I3ZRg6A
	 cBIio117u1KgwC8nG0+QMPUrL6i+bXlr68EuLt/qiEr7UyABkNuhdbieU57UNPTKWMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZtCX4xQXTEPkv73DiejIQwicvHDcj4jWWQYQqoWbQC0=;
	b=n2rvd5L5DiyAEKiNFeUtGJc1mfeAE9CrMH4GXVxArJstTgpoVIvm2f4+PzBgksPUcmJ2
	 GdO91RnB0DyIdGBFj/f/7RHSFKtMMe9l5q+VKW4olBy97JPtFrvXW6ERYFcmCQF0eXeOw
	 ScPcUhcnMdI9fdL1EGiYwCkDpgI9rCx7ThmjJszSfsza7bd49LKV0FVLSuW6vr25LCwik
	 hqKFr8TbKzEMPmwWYrKt2zbpA2kIjElQdyWVgqrdE6fXVpAcosQtrBeLMl3k0kHBtLtW8
	 xRJchxOqCc4Ltcwg0QKPgFHm32H5lQKVr5biYCeQsR/132j9AgJYt0FfwBw1gw8qkog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrdefy10;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FT77magM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A3C606A8AC
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 10:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A3C606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrdefy10;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FT77magM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGA4KCp1228008
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 10:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZtCX4xQXTEPkv73DiejIQwicvHDcj4jWWQYQqoWbQC0=; b=Jrdefy10jF+Pol4f
	Z+88dFBv60zuPaXXMoYFbGDXPgfDbMBOLyu7PIyKzTGFTKIn6ZsX5Wi0nT/kSDK8
	auqWu0gMqa5Cpr7nJ17/WAlRpGzJu+bwQl9YwL3LKkB7mf66hoNDPLq2mdr4w/h6
	w28nmzYBzrqL7t7eLTSWOssmlpbeVwlD6jj6rdYkz1CihDpHgjqoMOE/CvGfHiy6
	O+i+diBeYyERliMASPaq8nbK/3eJgT1gDEnjSZ9FnHUTif3M1O0zIMAbbzbwMZwk
	WHaq5vUbDt0TNjwnDaeC7Mf/l7A1d24O3jo28eRTH1CO6oHdhcun1yxYKwwSdNhb
	sq1pTw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqg1v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 10:19:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso2206568eec.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 02:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794824398; x=1795429198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtCX4xQXTEPkv73DiejIQwicvHDcj4jWWQYQqoWbQC0=;
        b=FT77magM7a9D6n1olYcEnaphWUFMRT/wA8rx7Q5b894+bgC4tM+8L4m2anafEfQFeO
         ABP569TDwYKUCOpebX7l3ZPI7bGpEXF9aZwSXlDFmoucTrlvbh3404pjkIeIWjUEe99U
         Y62dqfdxVg9Z5r3CXoFrMqjse5YWdPX40NgPQMF11EYolzC7jKKRx1slZ53c64wH3XHc
         nVjFtq/H3L5JrivjcMZAVOMuFo6EWCwpocCn2OiHfwmoThTxB7TUEhGr5r6PI9AzSlCk
         e+JaEdaN4qPui4SR1prHPl4KVpyGNPhBpNisR7TMqORaWwiu5aUFklNgy5vnyufNcMP3
         UErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824398; x=1795429198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtCX4xQXTEPkv73DiejIQwicvHDcj4jWWQYQqoWbQC0=;
        b=LF66rwauS2KHBBXhfOY9QwRN0B5aMMDZRtc5llFvG3Ru3cc4443oXPv2wjbxlZMn9z
         02lRXYGv2tVi8nnWUl9DbKxyjv76W+RM1AuVLMX4dAc2l5zhFvzwiuR41gzziUY6wVCZ
         cfGxxMLLAGIimAh18tWbpSPN18JXm/JRM4MfvzkzQGy79GUHne6wZ5QHu+HQp/N2CcC2
         gldyKZ2m9iy9L5d9mA8qywzt6LlDeLivC6ASw5VhZSp5hmjTzgXKrHLEx0tKQgG2HXSU
         fPiV87ufSoG92pdJMfBfpgeAIE/M8Ky9Z4GVAiyFoshV2i8Vtl6yIsBZD97gcZJVrxu8
         j1EA==
X-Forwarded-Encrypted: i=1; AL+hErG0Xj0GxZSdxtEsGfwHIw1lLGnw9H6Q3eOHIjdO9+3iUYbbJQNMOWTUn9xoLEvR36FssLKlqx7X9mI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i+MVVXJkcB25keU19MQR/SMRmgiJx20tD18ulv8MMnFTUKQMJ
	q1t68JLgRuMgolRLtrNnoG5JeM+LlIMmK6DOiH9FjON0OnD2+yWY6PGosMxdDmUTwKZAV9PM0yE
	30czoCygnmZrAAt6yJ3+y9jYJiSlbhBcQEdD/QK5wmTGMEHtsJ0kowIBFR4e2elc=
X-Gm-Gg: AZFdTZdgMNq6M9qZL93pd7gyXhJpPk3Qaa+xiKkvlyalr4mxDxjDy2LsMbJ4JxobK8R
	kqG0QYmTUUeLlcbGgeJxAaZPJ6Meov2JHsXOSswbbN3MyZY1jsoT4XhbanEiRzNm4OeYWZQzAjQ
	gR1ibDH2yrckAiCV11g7Ur3dnPd/X2CYtXwSWg0mFfo7Lpt/pHEt+VjLiHq39xKEnzsG3b5IASm
	g718PIOucTNwZ3w1E4JV4GBG5i44pJOPSi1gsifR152mgvpy1N7OSxFekuLNN1YThaIArHnNcTo
	EKRfV1kWwEUXy5jb4WPmL32qlXJhPYQQAobu/AEIAabtwjgyqvwD8ngdr6JmTldxRKQAj4LiEC9
	D+M/gVdKabSwY6Wsm5bXHlShF2b/IGZo9s6bTu6WCAl/BfmBaxvbn9VNZDIa4nQ0tElmswyb2g4
	TTb53e5bahH9aA2zJL
X-Received: by 2002:a05:7301:fd09:b0:36d:4570:a32d with SMTP id 5a478bee46e88-37963953f0amr10216805eec.2.1794824397559;
        Mon, 16 Nov 2026 02:19:57 -0800 (PST)
X-Received: by 2002:a05:7301:fd09:b0:36d:4570:a32d with SMTP id 5a478bee46e88-37963953f0amr10216771eec.2.1794824396845;
        Mon, 16 Nov 2026 02:19:56 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm32599557eec.26.2026.11.16.02.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:19:56 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 02:19:49 -0800
Subject: [PATCH v3 2/4] dt-bindings: clock: qcom: Add NSS clock controller
 for IPQ5210 SoC
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-qcom_ipq5210_nsscc-v3-2-1eaf92698379@oss.qualcomm.com>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Luo Jie <jie.luo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794824393; l=12425;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=osDt9Wx7l8Dwz1s9gshsRSw/jihamPUhGKdWi/poDxE=;
 b=t0XyA1Zs9Sq39Vl1rI3dTGND2lWe3o9b7AjcbwzTGOD6k3Ito7/o8esqlpQ4ygQ2/naTMsIqV
 9co/g2OdRTcBIac2/Ku067F6ppm3Qkk0uP/7kD+hfAIHvnABvBQ4Kgr
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afad8ce cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5BNNu1SJyhHsDrVplQ0A:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: FwVrIDWBpM_BiqbqjSkxO8ludtcNbqUR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzOSBTYWx0ZWRfX9MdsF0tE14iI
 Kojm5WLWC1r3dU1ukbJHJXDw/pamYofTLlxxXLXUiHgAOzkmpLg865IHCL5kJbenVRIslGV4sbT
 e4pRid6Gofmvb3MrDp6tilK+bI2dGlkzNySDntDf2Rce38h1KU0aPT2mPdjFebqQsIZoqMMnLz5
 xDFJYf1LgnwjR+e5w0wiSlgh7dwvhOfqEyTqNY85S1qhtU8dLO4p9g0mmUkOvI/byGO1wAWyX1M
 oo+CZ3qmrqE4rKWu2jxP2F0kc4EwWv9JXh1di7X6xHY607G/H7HAthkWzq4HG0iQiut26kJKudL
 N+kDysWTG+3T4cXX+aqN6eFD8RKGbt8sjSJ8tS/KZzS6CC/obOZLaXFTwPb4iDXhMuyvGtdimw7
 2XxrB2G2rzhjx364fFOlyDAByq+h0ZM67PSx/iCTCvcHmMgulL7d9EHdFDiV+s90xZZQX9TTFuS
 nLmCd4UPh1uFLzpmQ/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzOSBTYWx0ZWRfX5QbHqGocYnwh
 KpiH9GxrdscCJ+1vKWctdq61ekFopJGU+HtccIny8csjewPgJ37MEZTPY8J4ZLNDrcgqugWV5My
 YhNEaBYTIdvxWfW8Be2TRKGi1lZCasg=
X-Proofpoint-GUID: FwVrIDWBpM_BiqbqjSkxO8ludtcNbqUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160039

NSS clock controller provides the clocks and resets to the networking
blocks such as PPE (Packet Process Engine), UNIPHY (PCS) and EPHY on
IPQ5210 devices.

Add support for the compatible string "qcom,ipq5210-nsscc" based on the
existing IPQ9574/IPQ5424 NSS clock controller Device Tree binding. IPQ5210
additionally exposes a pair of EPHY-RAW Rx/Tx clock sources used to derive
the clocks for its integrated 2.5G Ethernet PHY, so extend the clocks and
clock-names lists with "ephy_rx" and "ephy_tx".

Also add master/slave ids for IPQ5210 networking interfaces, which are used
by the nsscc-ipq5210 driver for providing interconnect services using the
icc-clk framework.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |  47 ++++++++-
 include/dt-bindings/clock/qcom,ipq5210-nsscc.h     | 106 +++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,ipq5210.h    |  18 ++++
 include/dt-bindings/reset/qcom,ipq5210-nsscc.h     |  60 ++++++++++++
 4 files changed, 228 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
index a35bbc7b1924..0064866bea82 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
@@ -4,28 +4,33 @@
 $id: http://devicetree.org/schemas/clock/qcom,ipq9574-nsscc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574 and IPQ5424
+title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ SoCs
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
+  - Luo Jie <jie.luo@oss.qualcomm.com>
 
 description: |
   Qualcomm networking sub system clock control module provides the clocks,
-  resets on IPQ9574 and IPQ5424
+  resets on IPQ9574, IPQ5424 and IPQ5210
 
   See also:
+    include/dt-bindings/clock/qcom,ipq5210-nsscc.h
     include/dt-bindings/clock/qcom,ipq5424-nsscc.h
     include/dt-bindings/clock/qcom,ipq9574-nsscc.h
+    include/dt-bindings/reset/qcom,ipq5210-nsscc.h
     include/dt-bindings/reset/qcom,ipq5424-nsscc.h
     include/dt-bindings/reset/qcom,ipq9574-nsscc.h
 
 properties:
   compatible:
     enum:
+      - qcom,ipq5210-nsscc
       - qcom,ipq5424-nsscc
       - qcom,ipq9574-nsscc
 
   clocks:
+    minItems: 11
     items:
       - description: Board XO source
       - description: CMN_PLL NSS (Bias PLL cc) clock source. This clock rate
@@ -42,11 +47,14 @@ properties:
       - description: Uniphy2 NSS Rx clock source
       - description: Uniphy2 NSS Tx clock source
       - description: GCC NSSCC clock source
+      - description: CMN_PLL EPHY-RAW Rx clock source
+      - description: CMN_PLL EPHY-RAW Tx clock source
 
   '#interconnect-cells':
     const: 1
 
   clock-names:
+    minItems: 11
     items:
       - const: xo
       - enum:
@@ -63,6 +71,8 @@ properties:
       - const: uniphy2_rx
       - const: uniphy2_tx
       - const: bus
+      - const: ephy_rx
+      - const: ephy_tx
 
 required:
   - compatible
@@ -77,6 +87,8 @@ allOf:
           const: qcom,ipq9574-nsscc
     then:
       properties:
+        clocks:
+          maxItems: 11
         clock-names:
           items:
             - const: xo
@@ -90,8 +102,35 @@ allOf:
             - const: uniphy2_rx
             - const: uniphy2_tx
             - const: bus
-    else:
+  - if:
+      properties:
+        compatible:
+          const: qcom,ipq5424-nsscc
+    then:
+      properties:
+        clocks:
+          maxItems: 11
+        clock-names:
+          items:
+            - const: xo
+            - const: nss
+            - const: ppe
+            - const: gpll0_out
+            - const: uniphy0_rx
+            - const: uniphy0_tx
+            - const: uniphy1_rx
+            - const: uniphy1_tx
+            - const: uniphy2_rx
+            - const: uniphy2_tx
+            - const: bus
+  - if:
+      properties:
+        compatible:
+          const: qcom,ipq5210-nsscc
+    then:
       properties:
+        clocks:
+          minItems: 13
         clock-names:
           items:
             - const: xo
@@ -105,6 +144,8 @@ allOf:
             - const: uniphy2_rx
             - const: uniphy2_tx
             - const: bus
+            - const: ephy_rx
+            - const: ephy_tx
 
 unevaluatedProperties: false
 
diff --git a/include/dt-bindings/clock/qcom,ipq5210-nsscc.h b/include/dt-bindings/clock/qcom,ipq5210-nsscc.h
new file mode 100644
index 000000000000..62ead8d9b076
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq5210-nsscc.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_QCOM_IPQ5210_NSSCC_H
+#define _DT_BINDINGS_CLOCK_QCOM_IPQ5210_NSSCC_H
+
+#define NSS_CC_PPE_CLK_SRC			0
+#define NSS_CC_PPE_SWITCH_IPE_CLK		1
+#define NSS_CC_PPE_SWITCH_BTQ_CLK		2
+#define NSS_CC_PPE_SWITCH_CLK			3
+#define NSS_CC_PPE_SWITCH_CFG_CLK		4
+#define NSS_CC_PPE_EDMA_CLK			5
+#define NSS_CC_PPE_EDMA_CFG_CLK			6
+#define NSS_CC_PORT1_MAC_CLK			7
+#define NSS_CC_PORT1_RX_CLK			8
+#define NSS_CC_PORT1_RX_CLK_SRC			9
+#define NSS_CC_PORT1_RX_DIV_CLK_SRC		10
+#define NSS_CC_PORT1_TX_CLK			11
+#define NSS_CC_PORT1_TX_CLK_SRC			12
+#define NSS_CC_PORT1_TX_DIV_CLK_SRC		13
+#define NSS_CC_PORT2_MAC_CLK			14
+#define NSS_CC_PORT2_RX_CLK			15
+#define NSS_CC_PORT2_RX_CLK_SRC			16
+#define NSS_CC_PORT2_RX_DIV_CLK_SRC		17
+#define NSS_CC_PORT2_TX_CLK			18
+#define NSS_CC_PORT2_TX_CLK_SRC			19
+#define NSS_CC_PORT2_TX_DIV_CLK_SRC		20
+#define NSS_CC_PORT3_MAC_CLK			21
+#define NSS_CC_PORT3_RX_CLK			22
+#define NSS_CC_PORT3_RX_CLK_SRC			23
+#define NSS_CC_PORT3_RX_DIV_CLK_SRC		24
+#define NSS_CC_PORT3_TX_CLK			25
+#define NSS_CC_PORT3_TX_CLK_SRC			26
+#define NSS_CC_PORT3_TX_DIV_CLK_SRC		27
+#define NSS_CC_PORT4_MAC_CLK			28
+#define NSS_CC_PORT4_RX_CLK			29
+#define NSS_CC_PORT4_RX_CLK_SRC			30
+#define NSS_CC_PORT4_RX_DIV_CLK_SRC		31
+#define NSS_CC_PORT4_TX_CLK			32
+#define NSS_CC_PORT4_TX_CLK_SRC			33
+#define NSS_CC_PORT4_TX_DIV_CLK_SRC		34
+#define NSS_CC_PORT5_MAC_CLK			35
+#define NSS_CC_PORT5_RX_CLK			36
+#define NSS_CC_PORT5_RX_CLK_SRC			37
+#define NSS_CC_PORT5_RX_DIV_CLK_SRC		38
+#define NSS_CC_PORT5_TX_CLK			39
+#define NSS_CC_PORT5_TX_CLK_SRC			40
+#define NSS_CC_PORT5_TX_DIV_CLK_SRC		41
+#define NSS_CC_PORT6_MAC_CLK			42
+#define NSS_CC_PORT6_RX_CLK			43
+#define NSS_CC_PORT6_RX_CLK_SRC			44
+#define NSS_CC_PORT6_RX_DIV_CLK_SRC		45
+#define NSS_CC_PORT6_TX_CLK			46
+#define NSS_CC_PORT6_TX_CLK_SRC			47
+#define NSS_CC_PORT6_TX_DIV_CLK_SRC		48
+#define NSS_CC_NSSNOC_PPE_CLK			49
+#define NSS_CC_NSSNOC_PPE_CFG_CLK		50
+#define NSS_CC_UNIPHY_PORT1_RX_CLK		51
+#define NSS_CC_UNIPHY_PORT1_TX_CLK		52
+#define NSS_CC_UNIPHY_PORT2_RX_CLK		53
+#define NSS_CC_UNIPHY_PORT2_TX_CLK		54
+#define NSS_CC_UNIPHY_PORT3_RX_CLK		55
+#define NSS_CC_UNIPHY_PORT3_TX_CLK		56
+#define NSS_CC_UNIPHY_PORT4_RX_CLK		57
+#define NSS_CC_UNIPHY_PORT4_TX_CLK		58
+#define NSS_CC_UNIPHY_PORT5_RX_CLK		59
+#define NSS_CC_UNIPHY_PORT5_TX_CLK		60
+#define NSS_CC_UNIPHY_PORT6_RX_CLK		61
+#define NSS_CC_UNIPHY_PORT6_TX_CLK		62
+#define NSS_CC_XGMAC0_PTP_REF_CLK		63
+#define NSS_CC_XGMAC0_PTP_REF_DIV_CLK_SRC	64
+#define NSS_CC_XGMAC1_PTP_REF_CLK		65
+#define NSS_CC_XGMAC1_PTP_REF_DIV_CLK_SRC	66
+#define NSS_CC_XGMAC2_PTP_REF_CLK		67
+#define NSS_CC_XGMAC2_PTP_REF_DIV_CLK_SRC	68
+#define NSS_CC_PON_CLK				69
+#define NSS_CC_EPHY_RX_CLK_SRC			70
+#define NSS_CC_EPHY_RX_CLK			71
+#define NSS_CC_EPHY_TX_CLK_SRC			72
+#define NSS_CC_EPHY_TX_CLK			73
+#define NSS_CC_UNIPHY_PORT1_RX_DIV4_CLK_SRC	74
+#define NSS_CC_UNIPHY_PORT1_TX_DIV4_CLK_SRC	75
+#define NSS_CC_UNIPHY_PORT2_RX_DIV4_CLK_SRC	76
+#define NSS_CC_UNIPHY_PORT2_TX_DIV4_CLK_SRC	77
+#define NSS_CC_UNIPHY_PORT3_RX_DIV4_CLK_SRC	78
+#define NSS_CC_UNIPHY_PORT3_TX_DIV4_CLK_SRC	79
+#define NSS_CC_UNIPHY_PORT4_RX_DIV4_CLK_SRC	80
+#define NSS_CC_UNIPHY_PORT4_TX_DIV4_CLK_SRC	81
+#define NSS_CC_UNIPHY_PORT1_RX_DIV4_CLK		82
+#define NSS_CC_UNIPHY_PORT1_TX_DIV4_CLK		83
+#define NSS_CC_UNIPHY_PORT2_RX_DIV4_CLK		84
+#define NSS_CC_UNIPHY_PORT2_TX_DIV4_CLK		85
+#define NSS_CC_UNIPHY_PORT3_RX_DIV4_CLK		86
+#define NSS_CC_UNIPHY_PORT3_TX_DIV4_CLK		87
+#define NSS_CC_UNIPHY_PORT4_RX_DIV4_CLK		88
+#define NSS_CC_UNIPHY_PORT4_TX_DIV4_CLK		89
+#define NSS_CC_EIP_BFDCD_CLK_SRC		90
+#define NSS_CC_EIP_CLK				91
+#define NSS_CC_NSSNOC_EIP_CLK			92
+#define NSS_CC_CFG_CLK_SRC			93
+#define NSS_CC_NSS_CSR_CLK			94
+#define NSS_CC_NSSNOC_NSS_CSR_CLK		95
+
+#endif
diff --git a/include/dt-bindings/interconnect/qcom,ipq5210.h b/include/dt-bindings/interconnect/qcom,ipq5210.h
new file mode 100644
index 000000000000..44f8d35a372a
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,ipq5210.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef INTERCONNECT_QCOM_IPQ5210_H
+#define INTERCONNECT_QCOM_IPQ5210_H
+
+#define MASTER_NSSNOC_PPE		0
+#define SLAVE_NSSNOC_PPE		1
+#define MASTER_NSSNOC_PPE_CFG		2
+#define SLAVE_NSSNOC_PPE_CFG		3
+#define MASTER_NSSNOC_NSS_CSR		4
+#define SLAVE_NSSNOC_NSS_CSR		5
+#define MASTER_NSSNOC_EIP		6
+#define SLAVE_NSSNOC_EIP		7
+
+#endif /* INTERCONNECT_QCOM_IPQ5210_H */
diff --git a/include/dt-bindings/reset/qcom,ipq5210-nsscc.h b/include/dt-bindings/reset/qcom,ipq5210-nsscc.h
new file mode 100644
index 000000000000..0616a3623897
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,ipq5210-nsscc.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_RESET_QCOM_IPQ5210_NSSCC_H
+#define _DT_BINDINGS_RESET_QCOM_IPQ5210_NSSCC_H
+
+#define NSS_CC_PPE_BCR				0
+#define NSS_CC_PPE_SWITCH_IPE_CLK_ARES		1
+#define NSS_CC_PPE_SWITCH_BTQ_CLK_ARES		2
+#define NSS_CC_PPE_SWITCH_CLK_ARES		3
+#define NSS_CC_PPE_SWITCH_CFG_CLK_ARES		4
+#define NSS_CC_PPE_EDMA_CLK_ARES		5
+#define NSS_CC_PPE_EDMA_CFG_CLK_ARES		6
+#define NSS_CC_PORT1_MAC_CLK_ARES		7
+#define NSS_CC_PORT2_MAC_CLK_ARES		8
+#define NSS_CC_PORT3_MAC_CLK_ARES		9
+#define NSS_CC_PORT4_MAC_CLK_ARES		10
+#define NSS_CC_PORT5_MAC_CLK_ARES		11
+#define NSS_CC_PORT6_MAC_CLK_ARES		12
+#define NSS_CC_PON_CLK_ARES			13
+#define NSS_CC_XGMAC0_PTP_REF_CLK_ARES		14
+#define NSS_CC_XGMAC1_PTP_REF_CLK_ARES		15
+#define NSS_CC_XGMAC2_PTP_REF_CLK_ARES		16
+#define NSS_CC_NSSNOC_PPE_CLK_ARES		17
+#define NSS_CC_NSSNOC_PPE_CFG_CLK_ARES		18
+#define NSS_CC_PORT1_RX_CLK_ARES		19
+#define NSS_CC_PORT1_TX_CLK_ARES		20
+#define NSS_CC_PORT2_RX_CLK_ARES		21
+#define NSS_CC_PORT2_TX_CLK_ARES		22
+#define NSS_CC_PORT3_RX_CLK_ARES		23
+#define NSS_CC_PORT3_TX_CLK_ARES		24
+#define NSS_CC_PORT4_RX_CLK_ARES		25
+#define NSS_CC_PORT4_TX_CLK_ARES		26
+#define NSS_CC_PORT5_RX_CLK_ARES		27
+#define NSS_CC_PORT5_TX_CLK_ARES		28
+#define NSS_CC_PORT6_RX_CLK_ARES		29
+#define NSS_CC_PORT6_TX_CLK_ARES		30
+#define NSS_CC_EPHY_RX_CLK_ARES			31
+#define NSS_CC_EPHY_TX_CLK_ARES			32
+#define NSS_CC_UNIPHY_PORT1_RX_CLK_ARES		33
+#define NSS_CC_UNIPHY_PORT1_TX_CLK_ARES		34
+#define NSS_CC_UNIPHY_PORT2_RX_CLK_ARES		35
+#define NSS_CC_UNIPHY_PORT2_TX_CLK_ARES		36
+#define NSS_CC_UNIPHY_PORT3_RX_CLK_ARES		37
+#define NSS_CC_UNIPHY_PORT3_TX_CLK_ARES		38
+#define NSS_CC_UNIPHY_PORT4_RX_CLK_ARES		39
+#define NSS_CC_UNIPHY_PORT4_TX_CLK_ARES		40
+#define NSS_CC_UNIPHY_PORT5_RX_CLK_ARES		41
+#define NSS_CC_UNIPHY_PORT5_TX_CLK_ARES		42
+#define NSS_CC_UNIPHY_PORT6_RX_CLK_ARES		43
+#define NSS_CC_UNIPHY_PORT6_TX_CLK_ARES		44
+#define NSS_CC_EIP_CLK_ARES			45
+#define NSS_CC_NSSNOC_EIP_CLK_ARES		46
+#define NSS_CC_NSS_CSR_CLK_ARES			47
+#define NSS_CC_NSSNOC_NSS_CSR_CLK_ARES		48
+#define NSS_CC_DEBUG_CLK_ARES			49
+
+#endif

-- 
2.43.0

