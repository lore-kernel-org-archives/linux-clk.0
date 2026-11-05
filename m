Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884079;
	b=OZUCQD7m/uO2XO5i0+g6OgdpNBwE3bKHUwu8I1DmnUQo3NRtGkFxnCYdOP+d5j10Bnt5
	 2A459V44u13U2L5YWoKc41SsWYPUuzRFLKBNPLCuXTLQLFBCWoj7o89NjsjoryNVjJy+b
	 Q0dxh4Ygb89wmflJkuTZWd++qsfuXNkTkLoAK3zb9aUBm4o3p9ZSPZKF869P/twi8vMdl
	 N0/pgywkTpWFlHdzIPTb3AJkK4jfhY4C5L4d5OEj5QgzwV+hpiL2TgLWJKxubR3bk0Sdv
	 Msi67U1/Oxu+N6ATUB33tU07x3E5KrT4velPiP4Hp9ckAMt+65/85a3XnnSiFrnEoJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884079;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Bxy4cfAf042PiXXoQRywKNCGpgVupBVLw8AvprKIGyo=;
	b=Kc5HUjtKvulkZjiK6QgWmBMJ6BJ0FcltyuoS6gRZJZbISYBusof2j3UKNEAHF2lDmqpl
	 EMld2q2J+KGZAXS442+tBckm7pXZPZFdZ61oDjwgz2vMHDhICbhsGg9mSrTyLkLHutiHH
	 Se1wuRS8zQnX/i6ioaLSnvQTpj1+wy64tgMN3ULnPVCI021Tpn5856tRg+h1c+an5aCdW
	 auJeIr67jPYzPTBeL0PKWE4Db6f0T1OkblGtBZRLCZt7W7n60knBfEzzl77beCeQj+j4f
	 2HdVbLVJrBii2yXPCmIbDuIWKuATmfKPq1IXNhQzrDVGM0BgrFrQtmgSI/zMA3JmBwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWI9qNq1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZ+zZ3BQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF2A606D817
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 13:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF2A606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWI9qNq1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZ+zZ3BQ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5AhuJU1582932
	for <linux-clk@vger.kernel.org>; Thu, 5 Nov 2026 13:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bxy4cfAf042PiXXoQRywKNCGpgVupBVLw8AvprKIGyo=; b=iWI9qNq112thdf33
	0XDVH+gA9LeblzYLIjo0mSPHZFhVVVuc4SbxnERXyWgs3laqK/FLPlI9FNKKevMO
	z80lAFzy1sM0bAl2Z4HSAroLCbSAb29i/DHKFOZuBdRYapf2yxdN+WaQZtSXnfmc
	tU7bp6rgXV7lL6SPi5+1d3uEfXQ6EfKxkmxyc6AbwntXE10Gy3M1la1pD7nqzXiv
	W/OXUGr4kEyDoBbbr2nSD2ugUeO/BlJqXl6/vzkKiQQNcX6vaki6LVLk32MzjQ4e
	G77ODg0FeWryDXnHcgnbA1ppCa9pzyniUnOOTT6MSxvjpWOmVqx+94rtGDAuOktp
	sqGbeg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraarjk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 13:07:58 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b2fd108b28so27754727b3.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 05:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884077; x=1794488877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bxy4cfAf042PiXXoQRywKNCGpgVupBVLw8AvprKIGyo=;
        b=bZ+zZ3BQ8kekoA04GN8iDJwkmEtuihQKu/1w57J5amMOqbVgSRQ54MqK7lD/AuabbY
         ARDqFUIhlOii5YNnnVRjFFLGwBjnsIAtTxAd9NpCHGmqF5TZMgfryukGXZ5KrEBQtPy3
         K5KhaUeogLVCoZl68ZYqBkQB/u2mZNIPBj4s5j3bgGfyJ0y+aQl8MBXJDtEY8cB6thXq
         zVPX4g/za1Xve9dacUQyNXFn4ZXRkKnbcyJerXvOMamjbMI+eDXVj1G+twdVwTl7zSmZ
         kQL3m8k7L7BE5tHKzgFvvPVDkzWLBFNXrwvHvXOxcWuejyxDtISlTfixXohZigyIDO74
         TAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884077; x=1794488877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bxy4cfAf042PiXXoQRywKNCGpgVupBVLw8AvprKIGyo=;
        b=FPekQd9hRrgkZ3lvhV73NMu/vFMrSvItxDca2TMpKyYKutSRK6PRbljQZA2eDCFatp
         /aBRtbvNKdw/btAkJVwhwpU+7xDY8+jVMb6JVgyVH+IlOTqTNJ/3DrMN1eIniMQy0gUB
         M/V2KhV/yOApc7Rc4ARyk5URisxOwhViXlOQSE2r8Yt+E+0S0E8/nIxjytNLv/a/oJ/Z
         3dFZHLfuCf/g58Jy1jtttfOKr1VyBHGp/kGVb0byiAEq0vmjkrolN7gfaKQLrd1U0hX9
         wRxO+SlzpJ5JDDclUxg9hDUq34phS2lMDRW08MX+B1xw2UNbeCRZCGZHwP+ckDysXVOI
         ww0w==
X-Forwarded-Encrypted: i=1; AKwUvByXnrHLwChSZPuVC1FctyihTeBkx2sbFmpyTvM3QN4XIFqwKZLp+oLCnPlrvhSPuiOXO2sqdFYHhNk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DfXJgkeigkzHEOvYqDMBvBEv8d6VBVN5ESsdaMh6ArEm3+13N
	05xkiPiLhS03OPEPSEHbjEzjqWAS+8S1H/GZ5Dmkdx99N+zvk0EzgSQDTYVd7StUMvojmSEItQP
	54rRBVo66qoMsjkqOrXA5Oq7z0vRX38WytBJzRWnIQzHhYbldchz3aSQroOG+1hg=
X-Gm-Gg: AYBFou25h8Q8VTllO1KTKMT1U8CxbcK3ZRCqb/QC71X18N0O5wZ2elF8yU4pqdbTZe6
	nkjGwrDTVbLfEovD8sB58HjG1E1AtvMw3xdHEUE7P3bpBcX829zGWuzrH9ZiSTv7LXZ24HY7Si1
	+J00t82wFj44UBcF9igvVitgGDTyUGiNquujAT44bdyZkd7X/ryT/xvg7UrxxmMVKkQakDWgUZ3
	xOJm27xyvshwHtZkPSVOoTupRpfI0aJTpOCt5Qo9FXcnrizHMa6i99seWUKVhjJMabwemxTujt7
	ai5UPyTbhST/TnWl++lJKAehXdMGQl9w7loVwfkGVMbDzta2boO4C5bGTXjK1Wnrb+6Qtdq15CL
	74Gt2U/7WdWHYnBFH0IQxR+7DUENKJYKWRSolqZuP2y9ztUyNyg+JEzdX0dqWS5T4ZWYroma+Em
	Izszu3vgKQ34iZ0rJT
X-Received: by 2002:a05:690c:c510:b0:8b3:2870:3231 with SMTP id 00721157ae682-8b328703cd1mr16270027b3.95.1793884077082;
        Thu, 05 Nov 2026 05:07:57 -0800 (PST)
X-Received: by 2002:a05:690c:c510:b0:8b3:2870:3231 with SMTP id 00721157ae682-8b328703cd1mr16268357b3.95.1793884071062;
        Thu, 05 Nov 2026 05:07:51 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm38915937b3.40.2026.11.05.05.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:07:50 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 05:07:12 -0800
Subject: [PATCH 1/5] dt-bindings: clock: qcom: Add NSS clock controller for
 IPQ5210 SoC
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
Message-Id: <20261105-qcom_ipq5210_nsscc-v1-1-d4fcb5c32b51@oss.qualcomm.com>
References: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884066; l=12138;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=OHhmxjAaFrk/KrSfVg+GuvTHorpv3eRxfNre0pIomoQ=;
 b=39vtdtAAl6Wi7EkyISXKlqYqt0K9FLtLEFarSVPATywIMsSs9jBns0kU2KjNHJgSX7j46UR9A
 1jCWBkhmOjOC7Dv9HxfAUA2VJLNqq/dyhiJrAej/jLacirJwtjTB4rY
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfXzOhCSpAti1BZ
 0pdt9gzTgqReH56oK40+/WGvgSZWmAPlhiQ1O263IPCeGFw/75/YVsWWPtxNBAXP21SwrDhpwG0
 9aTitkoFUnIAI02fM7zLyRegH0fPuVo=
X-Proofpoint-ORIG-GUID: rLPC3IdJz3rmbW0oN-MYxpipFj30fAPd
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec7fae cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=U5FYPQ0ST96qNyfkX9wA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX+tsdLuIq7OkB
 kw4vdRvoCOsGvqtUUMsRJJlP7jO3IzdMDMXc2QfAAlDhcongD9HwEOaeSbRlDzoXbQK7BdYFGNO
 h7W+Ag5JJEYIXn24oqujkZsYGjqmMRBd8C7nGiXlYdTTdP6lblIJ8TNU6GMPMJI4BRCyOGWfMzD
 Vk8Ukf2cYbSxfaTBawwYGl/iHhasWIAQy+XC8FpZ/MR7FoxLq47RlHsgJr9C8wIHHDbb+aa+GWu
 l15w6pVzMWl9xMVucHwo54hmXJn1S9lThwjY/igdphw0Xz1sySC+BbTuyE5IlICSYBYJ4AWvVmk
 SQPLP7E8vMALIdSumft+/BNrTj+k2Xf/mDh4wEMw3668wWtpJqRYlptdlP5HE5rUHb4hoeLqK88
 mT/N8nws1WrA8DHxcCPZBaLBXDE0KjQt7cZWP4PBEMxoCuLxe/F34UOUKHHcUmQlnI4FSTAvm5J
 QgiweWClrQeWREJSBAg==
X-Proofpoint-GUID: rLPC3IdJz3rmbW0oN-MYxpipFj30fAPd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050052

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

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |  47 ++++++++-
 include/dt-bindings/clock/qcom,ipq5210-nsscc.h     | 106 +++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,ipq5210.h    |  18 ++++
 include/dt-bindings/reset/qcom,ipq5210-nsscc.h     |  60 ++++++++++++
 4 files changed, 228 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
index a35bbc7b1924..dc7d90a99dc7 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
@@ -4,24 +4,28 @@
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
 
@@ -42,6 +46,9 @@ properties:
       - description: Uniphy2 NSS Rx clock source
       - description: Uniphy2 NSS Tx clock source
       - description: GCC NSSCC clock source
+      - description: CMN_PLL EPHY-RAW Rx clock source
+      - description: CMN_PLL EPHY-RAW Tx clock source
+    minItems: 11
 
   '#interconnect-cells':
     const: 1
@@ -63,6 +70,9 @@ properties:
       - const: uniphy2_rx
       - const: uniphy2_tx
       - const: bus
+      - const: ephy_rx
+      - const: ephy_tx
+    minItems: 11
 
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

