Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EB626D4DD
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784083248; cv=none; b=Euj6SvYOhAm2QAd9HpDcWBTkbPSk0fQv45Y3xt96SruXsQPv5ppxn3lZZDSdKS/Pqrd9o6enxQPoPgHm22Lml4jQ74ZUBKrFi4i++9pFNL5wJnuIzT9YLCPm+P2OtRDXouk0BTLiSRWlU2EI8aBsPUfJLkbaer7ESs3jPJR8mAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784083248; c=relaxed/simple;
	bh=mXE25MOD7qAGKf04cw4pAOdDRL3qCpO0EcAqP4avX7Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aSChDqZRXGFTNJGMIzWJ+HOY7O1L/wajU5xNfPlriH4+T4ztN2dK2KxP/f54ymjPhw7e6juich38PEjYCpvfIn52r0GV2d19mob4b9ndd3FATF2w8yqSdlpShWUGynqJmydoQPEL0dQ+iUCd545pd0Ypg7ljI80262XvfrTOons=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiI1gAuc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jXdHB8j1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiI1gAuc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jXdHB8j1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0Ifit2172418
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/UHdTXmOh8ctZASNscRZZu
	MjOo0xTkaamL8hxFHQpWM=; b=ZiI1gAucpIsdWYk0WtbO7j9sRZ0j+wp5i77/ns
	TVR1WX4ndljoEWGmRQMMSLogaqrnd1ggzSd6UYAv/njUdFy/q4XjLLEt8OwIyA5h
	RgWAZhizs70FCK0WwiWbDg5Dmmo4z+Et4+QYw/FnqvFzzMz2eW50c3wXKb6zH9K3
	SK5I23bSTfXvSSiFcJQH0DDpr0KWkCYebk+LzFIwJ4P2hHPoik4ZyXRkxfYlrGgs
	GpP3qlr+BfjH3T5beyC5Dcq2U1RpJXPMjg0nVTDPaE5v5i5PokmwuAvOqgWye3s8
	EdQ9+XKPauU64zVHTqR+DCkGTGTY9BXzCTAxIeIQZsYuhuFQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqtphs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:40:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88fc985a65so7780228a12.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 19:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784083245; x=1784688045; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/UHdTXmOh8ctZASNscRZZuMjOo0xTkaamL8hxFHQpWM=;
        b=jXdHB8j1TJpLbi5acEOvZ5ygR77y4NCGaYOuUJ2NboFYpjrZa67+mpQa7t7cRs4goa
         r6gymYCfmouzgu2oMZotnrhxpkm4mbVDfBasZt6dzDRrpH5PxHCzdmI1f0YkSa0CERy/
         u+HYoHZyZvKdkQ3YvjaAaCvu7dpDyGxc/VPau3gQGWK0k3QYbNrk9tOvsm1XQoqYoXxO
         EPVxQyxs7D53gQ3YJccx7pgzV78TsmbqU6Ep8ien0pxUn7o7rc+kkW3hRTKygmdMFm3y
         BfBQuGO362NBydGrwAM2xNT4Cizlh/z7lk2Ek1tujfjcUdQ7wOb1hb8Y5+p0SRxOZIix
         +jjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784083245; x=1784688045;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/UHdTXmOh8ctZASNscRZZuMjOo0xTkaamL8hxFHQpWM=;
        b=FKLbiDxe336ylq6QLJ7jy7f8Xi2IXj/R1ld0Od7sysXtIPale8kg5xR8mF9/wozh8/
         z+2Fm6PcrmGPCUP933EQlhYY+jpDXfdFYp6xFMJvokdvGO/0hwDvUYD7IJ7JYQ/JB5QS
         39Mse6UjPYXGF1FCQijzMWinF6Silhxx9vyUboy5C0AnwBJmMve1dywEtFIcb/bTy/3N
         nBqh/j4j8pUXiVRFeI6Ry3QFvx4swul/QCEZ3NYx2ACG6wlfd9bxGCwlDBBe6NLnmpzJ
         BfwlqUSLq0IcU90GSS41LEUddkrifnGwSy4e02gGIiWoTnnRXkTuHOvj2MRVD47/Zs41
         dfpg==
X-Forwarded-Encrypted: i=1; AHgh+RqpQeQkJLo42WRiyCW3y6y4o+9tFbrDR7UNuZsVN4wLLD9ph+lh7so0ZJyu4lZTvLY3ZE1gu3XLRzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhTDWTh7G3ntYCqd4K4Vi+RlCT+rGgln/Sj4jx1i/91L/jEkzC
	p77kbnYE0ZyM7lBQuc8ppqEDQrb6gP1UAEAzIcr0t7e543PSvRNbLw0pxkPrL1GNDB2Mx8TRY+l
	aJHUsgwEDuDf3jZ168KOtfk/iaSIEzfRq7wZNr5nNEPTtz9czQB5gA94UZOBa+IA=
X-Gm-Gg: AfdE7cmZHaFWO8UDK/brzuoPpLx3+GbX4yigs3jeznitm6twQllHfooY9tFTfoLuswW
	8KRU0w1LPLhB/VYcE/UCQaKcuse6YbtlpcZx02r37aq6p/8PWXMejWCiOpXA7i+uSyBsWX4wILX
	NXcCxWboxyeX+0ouDjc/+l3mfOL5bIyFPyz5VxvTgC2vu5Gwxz6vSBD8tawDa+bLNleq1ej4y8v
	M00JpcM/Qz/NPiwFNyr5g9ZZr6RdTiOhBn+1W89u4/tkBtXEZpf2GcDbJJMauTphdu50XUA4sVl
	wraEAXyQBk2tc8yw5hOrCjwJ1RfDtoMKMSR8/ywhinyCIJSPMf0ATWta3R7NdRiPI9VewkkeBXn
	QcmfUFDK39FSseyLJ3emRBPvyrOZpBMSVchPoLpGXAGg+rMXe8CCzo7d2Ug==
X-Received: by 2002:a05:6a20:e68b:b0:3c3:33df:4d9a with SMTP id adf61e73a8af0-3c36c0f6cfcmr1127054637.1.1784083244663;
        Tue, 14 Jul 2026 19:40:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:e68b:b0:3c3:33df:4d9a with SMTP id adf61e73a8af0-3c36c0f6cfcmr1127026637.1.1784083244200;
        Tue, 14 Jul 2026 19:40:44 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm155285746c88.14.2026.07.14.19.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 19:40:43 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH 0/3] clk: qcom: Migrate x1e80100 TCSR to clk_ref helper
Date: Tue, 14 Jul 2026 19:40:40 -0700
Message-Id: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjzVmoC/yWMSwqEMBAFryK9nkCMoqNXGSTEpNUe8JdWEcS7G
 3VZ71F1AKMnZCijAzxuxDQOAeJPBLYzQ4uCXGBQUmUyj1PRmX40erHs9eyx0feolXBpXrtCZon
 FLwR5Ch/tT/hXvcxr/Ue73DU4zwu5YSf0egAAAA==
X-Change-ID: 20260714-hamoa_tcsr_qref_0714_2-d47bd9063ce8
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784083243; l=3088;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=mXE25MOD7qAGKf04cw4pAOdDRL3qCpO0EcAqP4avX7Y=;
 b=KBZvOTsOAl7n2Yky6iNI19CyhIxGgxT5jm09Scn9kt0NHmLd1vrhEq/KCgLEdsXcDFip3kinx
 PB6wylERg0vCRY3ONLh6oCHEtEmZ0xJQvBPKMvoC0zV0yh19L0nc9Au
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfX0FLx0fygfHLt
 KDmEgW6YD6eUGMAI3IWvkNMIKeoljNjCnNr9HMeJQlA6/o593IsgqzujtN+3bu3oWNvDKsTGsjf
 AYlfojxHfJjeMQRgqsP1GiSWKgB88wqeYrZICZYXO973c7yr5/eIQGxSeOhV2o0uSD3Bu+I7kHG
 xUahUJ5n4fhORDxpjv6ZlzopS+Wuc09/1X14pvY5ecuufjsVjzGVHOZpVuYdfJqWPpU70yOv4AP
 XpqpKtZINNV6sz9UCGqli4TUGiFDJKccYm527y0oCq21wnYctm5t5i/Q6V+8GsnjSykQnEyfMex
 EO7Q6ruUXauY2IDmZ94gk3Z0G2p0kHJmO2XdP9Yb5c3mnsWo5oBzHyxTRwYLb/bNKjn6cXk1R/M
 wBh18P2di7p7YAS50rvGmhKAca9lkqHXiRUCZdcBO0GzWk5VMseqDszgnpCe75uXY+GNBer64he
 sqgZux1DDoHHdYRszyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfX2SbY46HCBKtR
 z61dBsbl96oh8mIRrlULyhyeQUGQMFwBOtqfYy0l4XGwvs8smr2HYydfweVVRyE3D/OWj/tgs7e
 Vx5KSE0lm5++8kB99KI95d/sBxbbQkc=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a56f32d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eDrWBMRqIGSfgiUSBJUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: _012Jq7dMfyb_aBr-3hmJ5H0m3096zZu
X-Proofpoint-ORIG-GUID: _012Jq7dMfyb_aBr-3hmJ5H0m3096zZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150023

The QREF block on X1E80100 supplies reference clocks to PCIe/USB/UFS
PHYs and requires dedicated LDO supplies to operate. The digital
control interface for QREF (clkref_en registers) resides in TCSR on
X1E80100. This series migrates the x1e80100 TCSR driver to the common
clkref_en helper introduced for Glymur/Mahua, and wires up the
required regulator supplies.

Patch 1 splits qcom,x1e80100-tcsr out of the shared qcom,sm8550-tcsr.yaml
into its own binding file and documents the QREF/refgen supply
properties, mirroring the qcom,glymur-tcsr.yaml split.

Patch 2 converts tcsrcc-x1e80100.c from local clk_branch definitions to
descriptor-based registration via qcom_clk_ref_probe(), reusing the
common regulator handling and enable/disable sequencing.

Patch 3 wires up the QREF/refgen LDO supplies on the boards Qualcomm
maintains directly: the CRD, QCP, Snapdragon Devkit, and the hamoa and
purwa IoT SoMs (purwa shares hamoa's QREF topology, so it reuses the
same qcom,x1e80100-tcsr compatible and supply set rather than needing a
dedicated one).

This patch series depends on:
https://lore.kernel.org/all/20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (3):
      dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding
      clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper
      arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 118 ++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |  21 ++
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  |  21 ++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  21 ++
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi |  21 ++
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  21 ++
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |  21 ++
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |  21 ++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  21 ++
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |  21 ++
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts   |  21 ++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  21 ++
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |  21 ++
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  21 ++
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |  21 ++
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts    |  21 ++
 drivers/clk/qcom/tcsrcc-x1e80100.c                 | 335 +++++++--------------
 22 files changed, 630 insertions(+), 223 deletions(-)
---
base-commit: c69a5c0ea17c77d1e10aabf4827fb65776804972
change-id: 20260714-hamoa_tcsr_qref_0714_2-d47bd9063ce8

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

