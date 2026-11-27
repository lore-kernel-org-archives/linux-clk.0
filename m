Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779707;
	b=xHFtpNT4QJBbyCGjjikV2ml03tBQMTULUIUIWUPKGoERRyfzzxZ3B7KF1Z4OPoff9DCr
	 IS9I0BS9eq69KlepHYUG/9tquCzDrtWMoEIpMMKsiNodXV19WZk3q005e6qidxgld0YBj
	 2q+3eaOzA6uwfj2BOL3AJuk05Xou8/gAlfE07TgfGZVhzjpHREYswknrSDlEzHwEhRZKl
	 VRIwqQJxfCZhznMgVkOm7uTlyGWqTJrGGsAyBDa0dUF/rQEum1NJkMwDoCImsuX7PzBFe
	 n72quITJdW6AP0Scw7tm+afO0IFqxk9QQf2FIhTTRG7PZlOwIDTwmpgvUf1lqK9mIUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779707;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VlvsZhKQ5bte9z2ki1x34C633JPVJM4x+mie8ldYyLk=;
	b=qwb2UIJpLhqVu8O8e5/yUbdi9VP0DLhUO2rzr4w0sFdUI8DxN+n+14oUSFI8pxDVTfnW
	 CD/MkOTqeKDMufa4+HLZ59pxaiTjYlnj/KtZOC7l7otM0QBIm9SQuOhWZugCLyknx7nLv
	 i3XZh/EBOMY7UqHpk3H+utDsYbipkMvrsV8+z31PY8Kc8NS8wpafWYYaYisbhiiwtfIEO
	 qKI4rIFntU45hAqmDyB41ieM+itwxTbOzHfzaFzUMoeg0Bl5f2bJPafIF7oMmdvNWLLnt
	 +/pZmnmnZE3wrFYQQFTgtqtvoXTFDhdD0pn5ZugEv0e9EVGWbi7UQNn5wAdTt6EKsYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=emAeV3+B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgDP9Hv+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79802606A6B1
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79802606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=emAeV3+B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgDP9Hv+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp65G1376789
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VlvsZhKQ5bte9z2ki1x34C633JPVJM4x+mie8ldYyLk=; b=emAeV3+Bpc1PnQp6
	VRf7r0qX7MoO5wXmTY/dQVSIXFKgAD1iYdydUzAbOYtlQ68YbOJUrLUK4TX6B4St
	2NkSZF21iZdoWiBPuXPI6qkjm02zPD+ViUvxq56JuGqGcnm1qs/O9VDEuZJJFbCf
	pXEaNe0zfBrgS/pSLZDGG/asw93JEKs2zjd5Gvbm+4qMKi7Zh3IHD8tYB23NB3s9
	gfbEBegMAkocF+6ZNe2uko9p0sMeMw4PPzJlW0JcfXqf2WjLDUo7ZVvYAs0FK3rz
	JR64o7NeK1noiXMLRoPEvH1RdjfDskb7XHdw7xRnBq4osXGwoSg/a1BANsimVOat
	k19gpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3abdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944138ed63fso687954385a.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 03:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779706; x=1796384506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlvsZhKQ5bte9z2ki1x34C633JPVJM4x+mie8ldYyLk=;
        b=OgDP9Hv+7kjT+EJK4s9oKTgMxB4rPz5aT7EvmRwtKEAuVlr0l7kZttr/VIqgVAbOhB
         JUpCveo3lES70ZvnQLj+3jVzLHrUd8+Kj+/r6G5UfOiFSIlsbR5muKBC1NEgA02aBaNT
         KsaOxLdN1MCUzWc98HcdLBdGir0dbvXFiujPLVHi/j75I+NSyZzZWDG4mRI76n99Z9ud
         JxQVenUOFWxguD9gqedRXFmNskwJ7CJB6rBtxP7NlVI4dBtiEf0l5WYDaUzskwbpK8+R
         gEKcPIaf8j76e/QP0EJ9fzat+hy9s6WJ/Ul/n/BOqcq24K9zdbM4fd7LGKHv5bZfhPYQ
         N9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779706; x=1796384506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VlvsZhKQ5bte9z2ki1x34C633JPVJM4x+mie8ldYyLk=;
        b=jAHdjdsC7EM0UUy/lINhyaiKeW7vYhxhHg6lOWKyXC3G6QoI4l5T9pF2ncLyXgfIA5
         /MWlsg73UE/QJFaH/s/tfkr329oEPIcZWayOgradggJ7847ICAEjFJaCq2c17jg9HgWY
         FghpxIsiQzGfcukWDQXCeZ1gBu0Qo5lPRXZRSucR6opHnLfnjUIo/f9itsHIyGvc2mGu
         wKRSbb3xTse4NCdWyueEzfIRV7YUg27vxTp6IYM81ygpJClRzuJQWygUd9Ak0qsuafCE
         AQnVx2jdVUBfl7Bsg595Zu/J4fzK1k9+pDtbSvh84lh5Iu1dfpj7oE6mb45mnRXSYBYA
         Qy8Q==
X-Forwarded-Encrypted: i=1; AL+hErGE+hc1eg80HyR5Geq4/mLaNpc9hoGQoH8WV5ROHa1c94cgalT50O2ysxv1y3A/pO8dSNEkZxYk1zw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e0SdOi+rzpBkJ5VNRjUdBnAxc0phVf+5egX7gmZwB3lYx8INq
	MpofZ0Eb/ItFDNvr63JpfQ6UQtoO+qGP4fQT5RVTHbR5UVqBrH3MkJ8PgESJzOt2gOGrz/041N2
	oweAUt1FAKII/qoX6lQBy4y2kWqXT/CYWJfGwG6KxPz67mYF0QhEbjQlJsav9FtU=
X-Gm-Gg: AZFdTZdzGvZKvb4VJ4YwjJudoCWRQfVFyj7RvfCbrdhRjrhQ+RqBp8wwflxkRGfdw79
	cNfuJL5wrKB3R4tJM9+Q/zg9nt1Twh9lzYngsAiaKhy/LXL6B5eJyFSEmShkF01TjmvGVaZIwSn
	u4JLK/21YFiK9QILilcJRsI292lum7E1EPvf2V2K6WEDkJmUzH72FXuurwoCQKnRxUT3wSL0GyM
	0693pLG8cMUlX3yBwBS6KEs7nLOGYVwHRl+ntSG/fsig+Qcqcaa3sgsz3F/QfFK7h4Vvq9q89Ed
	+NO8jG0uC9g7tXWO14PucPNQ5tWqa1Wc/82JAVxLYXI27X5vnpHzhJiNXbzSZxf0CSnLGmqX/XV
	GK1cxnjISqxlyvYDyHEJZWshS0LQ0YA6drIl3YZ/c6TJ97kGM0rBx1fW9QbOZGFQ0LNVZyQI5z1
	sQLIKCXyfYWUhL1jopxcZjE9xvShiHilVj5ItSJ9Se+FFcqQFF0t3hKI93dxYrdKE=
X-Received: by 2002:a05:620a:270d:b0:949:8109:8bcd with SMTP id af79cd13be357-949bab6d24dmr4114417285a.77.1795779705788;
        Fri, 27 Nov 2026 03:41:45 -0800 (PST)
X-Received: by 2002:a05:620a:270d:b0:949:8109:8bcd with SMTP id af79cd13be357-949bab6d24dmr4114412085a.77.1795779705324;
        Fri, 27 Nov 2026 03:41:45 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45137049f8f.7.2026.11.27.03.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:41:44 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:41:32 +0100
Subject: [PATCH 3/6] dt-bindings: clock: qcom: document the Seca TCSR Clock
 Controller
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
Message-Id: <20261127-seca-clocks-v1-3-1781298e658b@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3511;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UU3EbnJaLdHT0l2zmjczzAnpGAGzw6I+1J+L+nykF9E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWxwfy590nfgqX7sjByb+r7MdExcTAoxugkiV
 vuu2zCSCUyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlscAAKCRAFnS7L/zaE
 w8ObD/9F59keoAIFgmv3etoAvDTpaxgoVCTgyH0PIKzceesdu5c+4Aj5Sb4YbsplXdl0X5qTgXf
 y7vOgRz0pVvnbolF9ccfDYRKwTiX6Af8CuKnDqxeiTxmVY1V36OJQZJq0lpSqBlTUsjgCxFPP2j
 Vr8wrZaWtj9KqakvaffOLEEO1IikjyIrHBLfs0rtJlPWvy6lN6qXRIUInkr0nsVxwWvSb2odC/Q
 esd+dNwGZSjnSmkpaVUU3FLFYv6GmS5vh5Z/11egKboXlwEt/Sl26snJ5TILxmD7K5ulX6YCzvt
 dkCD13I77zdCm44W4bau2PPwHZhAhab1jz8W/dg4/PCTgUsSx/Zi6BSLUl6ujW7K7FV95JfThji
 EEzZ055SW5esI+yiz5nlpNPevn2jmHdtrIM179uqW5k9xuTBZp+f5/6GAdQX4wQS+3aLG+PqpBl
 Fy5uVF5U1E42zkhMYntwrUDTBfwSPGABZlR30eg1XEI4ZgRzQkDk9UUIDfi2UBiCR2kAcEuOYb7
 r2w05BWxshS3kIIOv6Kqm3YhsTZx0nHRpJqYVSm9CvZJ7cNgZMjFReBdd86ewHKZJan4ps1HtAk
 8bWbLapSKKpAprBveAgRJjfq35rm3HB+ElHE6AZHEeH1nc6rUfn/pVghRO+IG+S0eVoVsdbIMO/
 hxZGxvZSRtK5Grw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b096c7a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Eo1YCTbVZX2S2jacn6oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: nDooiaaqY2a7BUpDlnEqAvIm8awd5q9r
X-Proofpoint-ORIG-GUID: nDooiaaqY2a7BUpDlnEqAvIm8awd5q9r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX7GZsv3HyciXm
 P9UP3BSigHC+2nAOMNnyb6gDfv0QqUmMqrrJyyUm8DPqWT93lDE0YpCgz+nbzDrK5oZRnSnQ3Vk
 DPCig2y29McnookBTkqIPx5k06pR+1CQNYHZpjfkbLmX7W8zk9uly9knDh2Kf6+lRplIicugU9H
 QKkYb2TEqluftsg1+Mx81TZcXw4KCmxU+Fb4b/Yfje5CBPfZrHn50z0VuNwn8X3ylxSWI7aOR2X
 ZrKv8n4H8nGC6skHWzw0drPh+RzvoECooMBCthiTX2vX+dUhkWKaDasYYxV7aIrqyRgY1hoZFfC
 y+NOMc/3hbzn6gDB9d8XnZwi7uP3cmdTujrGwdmj4D8tehgn+s6wkoqMSTwvBZnrftQ0hjMrPz/
 t/jAb4pEsELwEVbV2Ek+L5GinFWD6JeaYQX4N+q4EqzuHvHYvbyXmouQiXh8KhSj9Hi97h8mipy
 YEXyG9pYuoKqJEbXxGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX66VyqSNlJ/iB
 9CWa/6hxAcOz+C1FpOxpDk5Op9p29u71XSG1pvLacHZymy4VlxiZtUf41i75UPkh/WYK5hXtkx/
 5eHd7LLwSx03oAyMrjFjzqBMEI7FBdU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Add devicetree bindings for the Top Control and Status Register Clock
Controller on Qualcomm Seca SoCs.

Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,seca-tcsr.yaml  | 65 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,seca-tcsrcc.h       | 25 +++++++++
 2 files changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,seca-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,seca-tcsr.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1349f70b5672a2de4e9388056e4c560cd1eacde2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,seca-tcsr.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,seca-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Top Control and Status Register Clock Controller on Qualcomm Seca SoC
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and power
+  domains on the Seca SoC.
+
+  See also:
+  - include/dt-bindings/clock/qcom,seca-tcsrcc.h
+
+properties:
+  compatible:
+    const: qcom,seca-tcsr
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  vdda-qref-1p2-supply: true
+  vdda-qref0-0p9-supply: true
+  vdda-qref1-0p9-supply: true
+  vdda-qref2-0p9-supply: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - vdda-qref-1p2-supply
+  - vdda-qref0-0p9-supply
+  - vdda-qref1-0p9-supply
+  - vdda-qref2-0p9-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    clock-controller@f1d7000 {
+      compatible = "qcom,seca-tcsr";
+      reg = <0xf1d7000 0xf00c>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>;
+      #clock-cells = <1>;
+      vdda-qref-1p2-supply = <&vreg_px11>;
+      vdda-qref0-0p9-supply = <&vreg_l1h>;
+      vdda-qref1-0p9-supply = <&vreg_l1h>;
+      vdda-qref2-0p9-supply = <&vreg_l1h>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,seca-tcsrcc.h b/include/dt-bindings/clock/qcom,seca-tcsrcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..ab77bb343a607813def35276fdbfda927accf346
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,seca-tcsrcc.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_SECA_TCSRCC_H
+#define _DT_BINDINGS_CLK_QCOM_SECA_TCSRCC_H
+
+/* TCSR_CC clocks */
+#define TCSR_DP_RX_0_CLKREF_EN					0
+#define TCSR_DP_TX_0_CLKREF_EN					1
+#define TCSR_DP_TX_1_CLKREF_EN					2
+#define TCSR_DP_TX_2_CLKREF_EN					3
+#define TCSR_PCIE_CLKREF_EN					4
+#define TCSR_UFS_0_CLKREF_EN					5
+#define TCSR_UFS_1_CLKREF_EN					6
+#define TCSR_USB2_0_CLKREF_EN					7
+#define TCSR_USB2_1_CLKREF_EN					8
+#define TCSR_USB2_2_CLKREF_EN					9
+#define TCSR_USB3_0_CLKREF_EN					10
+#define TCSR_USB3_1_CLKREF_EN					11
+#define TCSR_UX_SGMII_0_CLKREF_EN				12
+#define TCSR_UX_SGMII_1_CLKREF_EN				13
+
+#endif

-- 
2.47.3

