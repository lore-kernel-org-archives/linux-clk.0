Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4FB37AA83
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707221; cv=none; b=uzxAznNLlRGW9o+gqqIjKkJBrNtCX3Gf2sawKCRAAou/jbC0+GNNltCMZuNQXnzlqd+BryW4EMEYWDwCcWjWY1lgOmGMltQ1ajUHFEFfF/LgKBeHhPy9viCzB+z7St+4KRQ5yjuLU0GEnveD9sdiKUh0QBhtXtpzdRcTS3NU4Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707221; c=relaxed/simple;
	bh=If4Z5NOOB/dCt0kEEO/ZjsK+dGC2Ci23bAkI/LmsWgk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bcJVNe/VyQc+arU6/V4SFq4Ir5+JrDQscw8eUmLDS0NrCwk2XcUMdt+dkF+xw8Ehfi6+nCgLrmN79SHY/2ddrNk3h7az17uCiaTtLyNvhnX0llwHZMD51jkjx43eHF4w7UbI26uta9PvJ6ryLYr4/7d6zkhrIOD7yUz/PjVzaeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3qGfFWP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIzW0+8X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3qGfFWP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIzW0+8X"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFecw916975
	for <linux-clk@vger.kernel.org>; Thu, 5 Mar 2026 10:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ps+C3U9QX6ED/h4QqOdSab
	+aEbOxa/YG56PSTh2KTng=; b=H3qGfFWPrjtUEPWK1thn49AIRTk2bKHXDojEWE
	YqyLzvim9FKP8XzpGpekrLXW7iU6tgNCjOANFI4dQzmX0GND2olCd+O7aRYNOkD+
	i+l3yx1/9KJBaJW/J3mRSjfwoI3QX2qpkBHuIlYC6yIEJMU/9AtUIABn8pPdT3Ek
	md6/dHCPx3jpycSg7k8fJgSiLbvEk5b9JH7RIpjdWadamnbpjqh4PbpsUzt/Bvks
	dU2GxBdJ0MSBLGiun8ibVKNHxEhqCIPNCdGjszhEYq+A7hjjCDGlPOH34191Dk++
	oTFtYFECIkFSgX0F025aOR96TPT46oy2eJ/8R9/Zh4M1EJng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380s4k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 10:40:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a90510a6d1so54601245ad.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 02:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772707217; x=1773312017; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ps+C3U9QX6ED/h4QqOdSab+aEbOxa/YG56PSTh2KTng=;
        b=WIzW0+8X+vcXcAzanmKOeqWJpiPhhrRKMjIWs1G9jiVE9O9Z5v5Zuz+S6cEQSFXjkd
         MlWdhwFPji9y69frslvaxJwFiFkwqx6te0sl1rX0zQo0xF6HB0Ss3JBsfoQIr8cieyd1
         TqME2gTKtCoLFxdjGDRH7BwAW0NYhNjtVETl/twf3hLqXYUk3WNOQpq2kwnMS2h85j1A
         RskvF4dmMkPSKQrwyoeB7kJp0t2cGWOCgF04VD0cdCEdd5QbXlSphuG4JTsd7bkNGgAE
         9Muj/fOzToolqfLEe8Xkhddm9vC0zlO9kgIDYPgBF86B0X+sVEBQ43SkO4G0j36EwtwA
         LjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772707217; x=1773312017;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ps+C3U9QX6ED/h4QqOdSab+aEbOxa/YG56PSTh2KTng=;
        b=pKvELVCmVY3JqFJ6a+Y6n1bJNKEC7mvcnP3xccUtH/39eY9E10YX0guaMh2YcMTwu3
         CXTUgDT0bfii9NyRFxIPmA58/qrhFoWahbcP+L/L3hejr8qjcRe6yoN4QpOFUob9YjWa
         4HlKPyg2IWLM+M4bXdfgzJ12swjumQQR9d6b7bSjWlFP9tiaXXo5aI4cw9gDxIyY4SWj
         6R1rnI0WToBUEVLy1szOxmUNCIpXDC8nbHdw3VPlZ7zsXwF7pjcsRY6PG5kQoZf5REun
         Aun9aVEnZm1hz/5XigCf0MzDMtGjBHQaVDJncX208qk17/Ow0zwJODA12lNw/NjHEE8Y
         Btpw==
X-Forwarded-Encrypted: i=1; AJvYcCW0ToODC+Ewlxs5qxMO440mmFu+8VL6ylSPHIiuqf8Nkz47SfMLjNHBPM+8Hi4HLno+nEyiS4bdW9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywichc74Nu2noSL6C17WlHQHRJhp4b7F+odyokqbvchr71RAB7F
	S7WIH2iVv7IIyhkykwfI4eM0m3ggOVXla9kzNsm8hEibfEnD+vGjgfgX3eeEg+JyRAjcads2CkV
	j/dwHbMxo2na173VCqywro37VilLseGFZGfyT/R9mLQr3ds/deHxTuEjem9DLMV0=
X-Gm-Gg: ATEYQzxIyXNSbed+uptV643Vm/DdQ0aUu/GVN18iw8ynUvwZAgmVM0MD8tJ9OQ2DOcl
	sajLUKlmjJRMS4FycZZZI1hB7c8qjRJzth5CjizgKKLQRScUC3OWnAs+bzMuVTAAEfLoMrxe7H5
	YkHoY63Xr3vJIwOQRAiHvuVo+gVhexO1zjajPCR6+Hnys2i0u6hLF3DsOj4O8OWomz4eMDn64TD
	etLXBm9Lgm+UlgTxky/6BPJKGNUYGL4bOqyZM7xJov09AHE9gv9y5t1QJ9L+pKqOy7GthJB0Ikq
	mNmqJSBnWM+Cl+yNXrb6z3KyKdUCoyCOnFQunazLVhvKmMXK46TXIas8cm98FcvYN2A0VM6yW0H
	hmAVne7NpoRtOn5FZnv3ZrzH+WL+CLieSqdmIlvyammx0RQ==
X-Received: by 2002:a17:902:ef03:b0:2ae:4fc2:d95f with SMTP id d9443c01a7336-2ae75c18892mr19935865ad.26.1772707216698;
        Thu, 05 Mar 2026 02:40:16 -0800 (PST)
X-Received: by 2002:a17:902:ef03:b0:2ae:4fc2:d95f with SMTP id d9443c01a7336-2ae75c18892mr19935625ad.26.1772707216209;
        Thu, 05 Mar 2026 02:40:16 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4650000dsm134429325ad.54.2026.03.05.02.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:40:15 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add support for GPUCC and GXCLK for SM8750
Date: Thu, 05 Mar 2026 16:10:07 +0530
Message-Id: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIhdqWkC/23NzQqCQBDA8VeJPbcy7ad16j0ixMZVF9K13VwK8
 d1bJehgl4H/wPxmIsF4awI57SbiTbTBuj6F3O8ItmXfGGqr1IQBU8AOmjbDiFiELtcSishorpT
 USmlZl0DS1eBNbV+reLmmbm14Ov9eH0S+bL8Wg40VOQWqUArIpRLI8exCyB5jeUfXdVkaZCGj+
 DEc+JYRiWE1SwirbhqPf5h5nj8R4dmQ/AAAAA==
X-Change-ID: 20260217-gpucc_sm8750_v2-866576675fa0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a95d91 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TW7xPe3Xj7hOj2XzWEUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: lEFyDlOU9k0FVzFc_cU4YBucSVJQcnRt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4NiBTYWx0ZWRfX9dcQJMyxFODF
 WGryeigd/b3UqllS3FbDPuXb8FBCypIOGnp7b5ptBSFARLLjX+yK/pbnOss9h3TJnmJtfyWW+j4
 Bk5CtFmvmaeNPI60sEqvwqGkqXn9J6vQZppSaZB2a6Yf1XEl2TcPKQVDRQ0AJQwQ5etqyYkop38
 OUo0+ibY4/uCB0lVYI+3rI+oDqPN1ayAH/wFT12ekQujiOtXgBrfPH3tVGDdRVLLmNIkPUtva9P
 6bMlgrazKarUWuYPwwys8FBRPYgw12i3XLgrj64irMz2tTJ+7S9WcS6Aysof18ADxSkveg57342
 lJ1/CI/Rl7ALEVVkFNzDZx9HZTah+xaTkzFRJbRoAkyc4J0bPElHqt8yM2ost07gTnt02mmXKyr
 1cRlkgVA21J5P2nc9GA2XsXkReyWbzdP4OKmTN0cjXGkL8pPadaaMuFCWSUzHRVOqYT1wI90Wqn
 QLZZjXu1KFM8KhjVIrQ==
X-Proofpoint-GUID: lEFyDlOU9k0FVzFc_cU4YBucSVJQcnRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050086

Support the graphics clock controller for SM8750 for Graphics SW
driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
block dedicated to managing clocks for the GPU subsystem on GX power
domain. The GX clock controller driver manages only the GX GDSC and the
rest of the resources of the controller are managed by the firmware.

The Graphics GX clock controller is a reuse of the Kaanapali SW driver.

Changes in v5:
- Update 'fw_name' to index for GPUCC driver [Dmitry].
- Add RB-by [Abel] for code and DT changes.
- Link to v4: https://lore.kernel.org/r/20260303-gpucc_sm8750_v2-v4-0-2f28562db7c9@oss.qualcomm.com

Changes in v4:
- Add RB-by [Krzysztof] for GPUCC bindings.
- There was a documentation errata update for GPUCC and updated the
  bindings to capture the MX and CX power-domains and required-opps.
- Update the compatible[qcom,sm8750-gxclkctl] in code which was missed in earlier patch.
- Add the 'use_rpm' for GPUCC.
- Update the power-domain/required-opp handles in GPUCC device node.
- Link to v3: https://lore.kernel.org/r/20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com

Changes in v3:
- SM8750 GX controller is reuse of Kaanapali SW driver, update the
  bindings.
- Remove 'qcom,sm8750-gxcc.yaml' as it reuses the driver.
- Cleanup the 'gpucc-sm8750.c' to remove the GX clock controller
  reference.
- Add the corresponding changes in Makefile for gxclkctl-kaanapali.o
- Update the device node for GX clock controller.
- Link to v2: https://lore.kernel.org/all/20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com/

Changes in v2:
- gxcc bindings: remove double colon & list the names for power-domains
- Link to v1: https://lore.kernel.org/r/20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: clock: qcom: Add SM8750 GPU clocks
      clk: qcom: Add a driver for SM8750 GPU clocks
      arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes

 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   1 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  23 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  68 +++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-sm8750.c                    | 473 +++++++++++++++++++++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   1 +
 include/dt-bindings/clock/qcom,sm8750-gpucc.h      |  50 +++
 8 files changed, 626 insertions(+)
---
base-commit: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
change-id: 20260217-gpucc_sm8750_v2-866576675fa0

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

