Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC536655D
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887821; cv=none; b=o6FAd2hHig/A4PBk4gD+COWxYT+GDkE0EliEmBIjip0f6VbitMcSN3aomDyELltm2zjPQkhqivXUrIAMIgRBtDxCPARTVlaBgd5nwL4RgB5GmYmOUc+zFGz+t2o1lurEfnHdHIxBc7VCiZkNuASZGMG/zbicoj24LvtEN6FpFqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887821; c=relaxed/simple;
	bh=wQKFnGdnJdY1FkH6do1pLGWIp/WKD3yuDJ3W4BrPTI8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G/83yMcxdDC0pGhBeMao+fOvymFJs8zKVmYzjTsJqAXXelfGarkLH+WlhSleYWbwHQSEwlOdIx9nbUCB746J7pjjX9PLEBBWgp5g2qMz/cd5f1PWwrlajFfh1XkFePO/mgcLVNx+4yPfJpeBXAsmvnEs4mo6+jkrVQzvCMC7z6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5GWcjdD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFrvC5Sw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5GWcjdD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFrvC5Sw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lHCq1869015
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zostCU3MBRzye5WvRvd11t
	iaWCiDuX0d5YcjnjqN0eo=; b=G5GWcjdDEiD7lbKqvLETbD4MgnG8uPvkBLBvz6
	U26safmFSxhvQHEqDNnVPF7n2iH2U24RVWgctoNNgmdNOREfViFkiJtVPZ9RYxjV
	BnDiYyFcHLr2Mwlv23NwadhtHem8222eCIudkNQKpba8pgghSn+YcHKmtt3+vSQZ
	Uqa2U87kJhbyusoW4wKV/Yrvtce90CLzj0u7xP70Kya6p9w0+1xTXGSjt8a0IIAd
	g/dpjEYRDx01zTAQw5brz+jU9H+A8fvU7/N6p92Al+NGAug0YDv9hOXcNH5T+hPG
	py2Ih8gfe/My/ZS8wu0ILsb6EQ3ny3H+hhmBSC8dMc+i0s7A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw98s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:10:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc8bde6318so5359615ad.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887818; x=1785492618; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zostCU3MBRzye5WvRvd11tiaWCiDuX0d5YcjnjqN0eo=;
        b=AFrvC5Sw/2BaSzw72s6aYDPYUPnGAhtAetkWGfaCLoZcavXtkT4xcnCdda8rv/snTF
         LU7EcpskIHbpRGRCwQjL9RMQVdoP/NxJvQ2uCRV6E4ctFb3YMjHl66nbzGuZN5DzJYwh
         Qw74WQRZsAoQYeKKto8q8VtBkjlh4vnOzhNQLjvW5fi8WmwXljO06tGhtwXnJz01Vi7c
         AByOR6z246ifrNrOrKNgm3T+lcLUIYYZrtC0KZ3AT5cWJpU6PS75DOUcG8vfrgPuF67M
         BnQAIzGWmdP/OJssNU/H9WpX+eZGL9SvSv3rleArFdhV9FfyoMitmhETWfM83ppeHrVx
         1aGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887818; x=1785492618;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zostCU3MBRzye5WvRvd11tiaWCiDuX0d5YcjnjqN0eo=;
        b=srgdLEL06DVe6rnN82rpWCRzg2uv0dlTmv93BPULShiN2IpbtuDV0SPJ5kDHt6+QR+
         3vBX3yZMf2s2FJ5p+8GxHW+8q6IjTTZMDlELUdvpp8i8/3vw3vIMo1Oeq+GPlmwX/gZM
         BMdVe61n/viwekZCcjWYuhyvs28wdCbL3JVJyGGS9iZrDomr5YU+seOS2D/yl22+7kyk
         9cRlZ96r4hHFCEun8oYBsj/rbjde4wvBp5YK6v2jqPsd7h7y0TZIuoQainjX43j3oQGm
         peZZvsQkwbuBZf1fpRYZLCGS5C2eybBw8sJpjeEtjOmjnd/PuTuIxqNEXX3e6uOWDOk+
         j3xg==
X-Forwarded-Encrypted: i=1; AHgh+RpNYWA026y/9gbWiI7ROXjDrU515zL0CtjkMC+4CU27KLaR99VoMLHSoEfA9g8t2szozmJqhgsGV+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2nn5wru7G28SPLmujoGmBR/tL7RDM6LdPKn7PgsOCS/rcIIo
	Fvl3H9TF1t31EWH2TeuRgTf2zCkIHbO7qypxvBME4WE8ZeRqNOGWFVomf2MVIENYjhhVpFuG0Tn
	ZubpvYFjr8qk+Px12L2blVJUXtPrnRjj3bgXY4iViX6Gi0T7EuSAQnZ3k6Q7XaEs=
X-Gm-Gg: AR+sD12BLkslcE//LgFzpSfghHZPk6HLPrAta9Ra0vtVydBWH1LojetoJQ+8hkWXuxL
	xatbVhjrUwXZxTU27CORJELvEjUetTX+ug7C+xgdErUYk6o0i2Xu+QxL3dsBxb8HnbmRy8DiVHT
	eiga5jNcshF/I2eMxk8YzHbXvBboPgLwU6bYXuYFtJYbl0Ai/VquDPerNDCOaSG9d73HUsdzFpS
	1vel8qc+lMoIapUh/u3E3Gfd8fpfHSVHmyL8hU1GEFsry2oG4WfUgLhCEKHtGt6DaEh4KtNh8o6
	KPNPL3wzB9o9h6l6fx6vGfQSgk464BxJHBAnM5D9JTcptpTQ7mDREtNkqQq4fcBz3X1HU7EBnEt
	KfLppQ1H3tQhQbiB7WtFieRtD
X-Received: by 2002:a17:902:e945:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2cfa6bbfb61mr75407935ad.11.1784887817837;
        Fri, 24 Jul 2026 03:10:17 -0700 (PDT)
X-Received: by 2002:a17:902:e945:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2cfa6bbfb61mr75407675ad.11.1784887817417;
        Fri, 24 Jul 2026 03:10:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm47863705ad.79.2026.07.24.03.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:10:17 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/5] clk: qcom: Introduce initial clock controllers for
 Maili SoC
Date: Fri, 24 Jul 2026 15:40:08 +0530
Message-Id: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAA6Y2oC/23N3QqCMBTA8VeRXTfZh3Orq94jQuY289B05UwK8
 d2bQnTjzYH/gfM7M4puABfRKZvR4CaIEPoU/JAh0+r+5jDY1IgRVpKSStxp8FBBDyNoXxkfzB0
 b6VhdCE6sIihdPgbXwHtTL9fULcQxDJ/tyUTX7c9Tu95EMcG2dNYRLhil/BxizJ8v7U3oujwNt
 LIT+1OS8n2KJUoeRaEaUtdCNTvUsixf/GEVKQgBAAA=
X-Change-ID: 20260617-maili_initial_clock-c7e2b4530d80
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX4kvkOIRYF3jk
 0KqUhYc6KXbJavKQ4hCq4xlAyehE/E8WAIFxlpurMMn1yb9TX2EfGzVG8GFQp1B/M4G23kvhen3
 maVE1wDNwEl6FQkXq3iOqnM0t65NnkBo7dkBglOdejyfOPnp1lhOpAlzgxBLMiGEMGPhNMQ4wZg
 RtSEIwt77yW+jVfZMz1EZ4YsFhuPPEwjqhe+7c5/fDm3TBY+9N/VlzYuvak5YeqWhn2ZLsJBn4n
 G3ArFqmDwQkMMLFWP4pTr3wOnY6YhW1g9U+VWPzmtLUGe1NOadpwOslDCoGn9n1kjwiWCRQ7LZI
 gu3qq6dznvPtZLY8oiB4gfnUB3uQoIFCIBALkbdbpkreVWGur7LNICQCCNHySg1b7FrlQ5rLICE
 pHYpjQoY/VKOZcmjO1/J8jd0pOZvPfgdplfYPqpaNlLsJYNA31jqU2ptaRW4ZANoFAs+5L87kx7
 zgSUZ0zvdj5/jrM0+QA==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a633a0a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kp3T8kGXBi3sce7iFlAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: aeYc4T7-aB933SSGYppp7lTVo-sh88-u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX96GdcgS+SsZz
 WjCJWrO2MqOzIieuj7Wnjfg9LjcDh6YrEhZ8p4dzkJInCg02KlAdwILzHtjAJwRTS70/2Ir5Ne7
 LmutA7SDNBj2IgBEipheckSaIvAlZ5o=
X-Proofpoint-GUID: aeYc4T7-aB933SSGYppp7lTVo-sh88-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240092

Introduce the initial set of clock controller bindings and driver
support for the upcoming Qualcomm Maili SoC.

Maili is a new mobile SoC from Qualcomm. It is a derivative of the
Hawi SoC and shares most of its clock topology. Where the hardware is
identical, Maili reuses the existing Hawi drivers via fallback
compatible strings. Where Maili diverges — specifically in the Global
Clock Controller (GCC), which carries an additional QUPv3 wrapper
(WRAP5) — the Hawi GCC driver is extended to handle both SoCs.

The series covers the following clock controllers:

  - RPMH clock controller: identical to Hawi; uses qcom,hawi-rpmh-clk
    as fallback.
  - TCSR clock controller: identical to Hawi; uses qcom,hawi-tcsrcc
    as fallback.
  - Global Clock Controller (GCC): extends the Hawi GCC driver with
    eight additional QUPV3 WRAP5 clocks present only on Maili.
  - CPUCP mailbox controller: software-compatible with X1E80100; uses
    qcom,x1e80100-cpucp-mbox as fallback.

The devicetree for Maili will be upstreamed later.

Changes in v3:
  - Update the comment for extending the array appropriately size.
  - Add RB-by [Krzysztof] from v2
  - Link to v2: https://lore.kernel.org/r/20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com

 Changes in v2:
  - Split the new Maili-only QUPv3 WRAP5 clock IDs out of
    qcom,hawi-gcc.h into a new qcom,maili-gcc.h header (which includes
    qcom,hawi-gcc.h), instead of adding them directly to the Hawi
    header. [Krzysztof]
  - Update the GCC driver to include the maili-gcc header.
  - Link to v1: https://lore.kernel.org/r/20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com

---
Taniya Das (5):
      dt-bindings: clock: qcom-rpmhcc: Add RPMH clock controller for Maili
      dt-bindings: clock: qcom: Add Maili TCSR clock controller
      dt-bindings: clock: qcom: Add Maili global clock controller
      clk: qcom: gcc-hawi: Add support for global clock controller on Maili
      dt-bindings: mailbox: qcom: Document Maili CPUCP mailbox controller

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |  11 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |  65 ++++---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  34 ++--
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 drivers/clk/qcom/gcc-hawi.c                        | 201 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-gcc.h         |  21 +++
 6 files changed, 286 insertions(+), 47 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260617-maili_initial_clock-c7e2b4530d80

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

