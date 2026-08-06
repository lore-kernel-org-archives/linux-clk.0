Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3580843F0BF
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 10:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012464; cv=none; b=lNsoAuXcVk0W5CI71WX/Tvj91rV0trgEBv5q01HrSfSByfIGQiNWZeGz+7wPit1Z3LVLFTMz3Do/Zqp6lbROEo6yAHa9C7zyI6Y0JNnd/vdS33as5ROEK65bzE9bo+910aV0T0fsPopasr4buW5xRI90EZdV01lgkG6hv8GBGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012464; c=relaxed/simple;
	bh=CP4BpoD1vslj+8ytlQtMQvLSLKNkEQOvPvyOq7q0q5k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cYLby6NoGBHFsA2RsHFQvv6XFOWGIl9fv3rOwPul/OYthhlji9YDPbI59H8GvaUbU2npA4o3w9c1bE2/+Dyah5/c6UdseVrkvRRiAlcYRmr9tXZ/0Rpx4TeO+BXGAulGudzqU+sO2Rxm+FFEc1aPnIxB2yseyhQ18CniprWFJMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXny516/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzshNbYs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXny516/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RzshNbYs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nfbC2724643
	for <linux-clk@vger.kernel.org>; Thu, 6 Aug 2026 10:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k1zeeW+sm2UHrPLKxlf+Yo
	jvkVINAlgoHmqpHzklEqQ=; b=iXny516/ZqOZ9RUZ0oFCftl7d5/mssGxJLLN5M
	muNX3O4ZdmH/Pv47u+Pz6GvmrvOg4fBpAMlZLzpICOZ0Qj+XvdZs5TI/6/rriIBd
	kVAa9dFUvOPjxHcun8UatALcVL0Dr93yhAzmD2OwiZyNIS3hF6Gt7k/Pe6lQ+XOg
	h9YBiRRpTdqKrkizRGhzpnRCMxgGh+INyeOD4NGK3L13SYRMbJCKAWbk4FB88Suj
	NRDFpFcQ+3tgf4BID9QlIXSq+0jtLzCJnNwrUMrh287dNp9OC+WTuHyG1jkyylQc
	3KY3kdo7/BTJHbaXxK7ZKwlfqrOk6czFWJYh8TMiW9K5E1Pw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmkqsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 10:34:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so1084991b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 03:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012461; x=1786617261; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k1zeeW+sm2UHrPLKxlf+YojvkVINAlgoHmqpHzklEqQ=;
        b=RzshNbYsa4Bok2EgPc4SaoOhIAOrfbaFoDP3qodNnZS6t0+QQ9bNizR2e7/C35wJLM
         N5M74kyc6EjO1o2NK0fkcAvCCesNNtp2a2xgb91AZtunEsHgWx+OAGaCeVhUNaL34PxF
         /RKshU1GsbKqXkwvDV9VgVgp6NAO0qteWQxepzTqC3GJrMGqiuAxEf4VUi+sYsHpJ4gz
         wzkVTRIeJqXznoYQapEbymUhDgtL+5fGTphu+MmDkRLuba5gBCzGHs6H0vnWpPLMPxFK
         /a1xrWJ4X3MyM0jgb0z9OYXCRB16uYFkiNKkbZVFtLgvQM4o6xfOtbEGycrhJ19QcUUN
         Ejpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012461; x=1786617261;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k1zeeW+sm2UHrPLKxlf+YojvkVINAlgoHmqpHzklEqQ=;
        b=cf7VLZvDfstOyIZx7Uid3VwqJZ+v77ONxpAv4D1HWBFy0kLcVoqFWQj5aHzYb1rEvi
         TBXsFwfaEs6exm/0KsjhmekCdIKWO0Ki7vCvLi81j6f5F9DiX+wWbt2vCdF8nw6pSbag
         CeolxO7AHjYrV2Rt4/qKipbDIDGsmtl/0zKH6s82ZN2cHiGP0Ncy18J923nba4w6pHfX
         DbH23xfBwOgFrE6z3wgerpefQup5gyIJ9uYmyhl8ZDeKh05RuW5tJRB1F2DtJdYEZufy
         eW2UFC+yjlicVnUag1XZDucnfxm0+d51K3HjJj9jNkV+6xlvk/KQu4N8GokRfLNmHm3u
         9DhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNRLLTziF0m1riigsPc+tzBY00cD3kdnOFQKRJC/j2l72m2ybaB+HVBi5RdXkJs1MRTpvfJVxSobs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhzRZX28rfvj35bdrzCf4DAb+RjGXJTrwnpeAPEYtZ/jWcaMNj
	NtVbkyqzzPZZ3PXrue5bRxP+riQk43t0EIpqmJoXX2+XdzbzGKjwP3iI/P7AgHtXwhO4Y9sCN/s
	HTeiAZ22r1FOMigAPIO0KQcg2M+JEYDYCR8iuLqFGL/rxWhcSxngAvVv8oBAHL7k=
X-Gm-Gg: AR+sD11B+9EEH5BITptyIRLNpl9QdAteyC14rPRGSSYp+f9iplcfwlI0S+rBGsB7uNk
	+WRd/RhV5aenE6A0MQEMDeKC0cV2P8Hv988eC3z9preDOKIQQMqQ8QMVTTyOo2jThM4QpU/1QEd
	e5/fpjgTm+mM7FCSQYyzdLNPTCetZzY0txEDvwEywyxkDQw0MxqLH8UEtkF3FPTxahZiEGKvLRY
	AQDWoP1msiogxQoHuDRcWTMjFS5IH1+fFJOtr7kDUACyqMsBk9IHLnKWPIcbmxPyk/mlsZMwbcu
	5AYFwvCe+VmOZaPZL108x21//KPiw77jcuxko4dxFr510+rRvBUUdXZEFeGIqSzZnfYxGIxuZ58
	ik5m7VrFSc8a9fnAfaV4AcKtZ
X-Received: by 2002:a05:6a00:c312:20b0:84e:46d:23a6 with SMTP id d2e1a72fcca58-84f47ff541cmr2789183b3a.18.1786012461393;
        Thu, 06 Aug 2026 03:34:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:c312:20b0:84e:46d:23a6 with SMTP id d2e1a72fcca58-84f47ff541cmr2789111b3a.18.1786012460894;
        Thu, 06 Aug 2026 03:34:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:20 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v10 00/10] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Thu, 06 Aug 2026 16:04:05 +0530
Message-Id: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB5jdGoC/3WNwQrCMBBEf6Xs2S1rWlLjyf+QHuI2tQtNo4kWt
 fTfjb0Lw8A8mJkFkoviEhyLBaKbJUmYctjTrgAe7HR1KF0GoEhpOlCNbpSPRe+RGWeDWve27oy
 5KLaQS7foenlti+c250HSI8T3djCbH/07lUVYGdJNo6njik8hpfL+tCMH78ts0K7r+gVjD3C6t
 AAAAA==
X-Change-ID: 20260804-eliza-mm-cc-v9-66fa4d99b2ca
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a74632e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AlRCs60Iy3bsPpSysgEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: c-PW_OHRoXwzfBt3NDcJjNgAA368aHOg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXwiXn88eSd9C0
 jcdC1HjFmduwk955ld6hrnDVeeJr+YGbzpxXviHeGkA/qjpfowKGpdYK2AM3Se8NE6t0MSllKut
 tixF3TMjzbC1G+yvbPZdvzSCWNOg2Q4=
X-Proofpoint-ORIG-GUID: c-PW_OHRoXwzfBt3NDcJjNgAA368aHOg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXzdZw9JBNmpOS
 hY7OF6aWEwvbCOb1sF6AlSR9+YVRCPR/Mo9UdTgQuStTtY7ilLgNLVDg4bn7p6C2vj632nu1yed
 aGk7VczZxIYTonlswmF0UrgPcxyNDXM+/bj5Pr7VE/6evqM5kga9RJ7OaHO0t14x3aTdQIEIKUn
 Dc2vkXiX11YpyisxJPjvJ1kJR3xqta0RgF47BMPCzwpmHzKMBi+KiGxq4uq6xDXqnKtTe8jdPCm
 QOi2GISMs1VIyxcFduMXdRY44KE01pRdOz8QVvGO6vwfHIICLPXvzCGKLbmgF15rYYVkf4pHQYE
 77M7RhbzSZqdeuRhDT8YltlYUjLhNTEAz6GgYav2/FghIQGbv+Yhhj70SJBXotVvNxAH7SRudQB
 130BtBd1RY7IOkV0Nv2rynvVie/F401IrEN8afr+gG2dGwCMM1K9hF+j0TSd/f0lHEfA2Gd2T3W
 wBbrsF2SXaS4qoSwe9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Add explicit power-domain voting for Milos
which are required. Hence extended the Milos camcc & videocc
documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Note on ABI breakage: the Milos camcc and videocc binding patches make
'power-domains' and 'required-opps' required properties for the already
documented qcom,milos-camcc and qcom,milos-videocc compatibles. This is
an ABI break for any Milos devicetree that does not yet specify them.
The corresponding "arm64: dts: qcom: milos: Add power-domains for camcc
and videocc" patch supplies those properties, so the two Milos binding
patches and the Milos dts patch must be picked up together (in the same
tree/merge) to avoid a transient dtbs_check breakage.

Changes in v10:
    - Make '#power-domain-cells' optional for the qcom,eliza-cambistmclkcc
      compatible: the cambist MCLK clock controller is not a power-domain
      provider, so require '#power-domain-cells' for every compatible except
      cambistmclkcc, and drop it from the cambist node in eliza.dtsi.
    - Fix '#power-domain-cells' wording in the Eliza camcc binding commit
      message.
    - Add the RB-by tags from Abel Vesa on the Milos dts and Eliza gpucc
      patches.
    - Link to v9: https://lore.kernel.org/r/20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com

Changes in v9:
    - Rebase the patches on tip of linux-next.
    - Added the RB-by from patchset v8.
    - Link to v8: https://lore.kernel.org/r/20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com

Changes in v8:
    - Remove unnecessary '#include <linux/mod_devicetable.h>' from the
      videocc, gpucc, camcc and cambistmclkcc Eliza drivers.
    - Added the RB-by from patchset v7.
    - Link to v7: https://lore.kernel.org/r/20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com

Changes in v7:
   - Add missing 'power-domains' and 'required-opps' properties to the
     Milos camcc and videocc dt-bindings, and the corresponding device
     tree nodes, since the Eliza bindings extend the Milos ones. [Konrad]
   - Update the camcc, videocc driver to 'use_rpm' flag for Eliza.
   - Add the RB-by tags from patchset v6.
   - Link to v6: https://lore.kernel.org/r/20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com

Changes in v6:
  - Update device tree to latest linux-next.
  - Update commit text for no ABI breakage for VideoCC and CAMCC
    binding [Krzysztof]
  - Added the RB-by from patchset v5.
  - Link to v5: https://lore.kernel.org/r/20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com

Changes in v5:
- Taken care of comments from v3, v4.
- Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
  as required property in bindings.
- Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
  bindings.
- Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
- Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com

Changes in v4:
- Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
- Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (10):
      dt-bindings: clock: qcom,milos-camcc: Add missing power-domains support
      dt-bindings: clock: qcom,milos-videocc: Add missing power-domains support
      arm64: dts: qcom: milos: Add power-domains for camcc and videocc
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   39 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   29 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   75 +
 arch/arm64/boot/dts/qcom/milos.dtsi                |   10 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  464 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  606 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 15 files changed, 4734 insertions(+), 4 deletions(-)
---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260804-eliza-mm-cc-v9-66fa4d99b2ca

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

