Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68625443A8E
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 15:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821574; cv=none; b=rlzyZNxtnJbyiijpzkrNqvx8O7Yw0xwP8QrGaTaRk5Vncvu/co5ku36QxFLoC514Ny9V/tOFk3xyRovz8rpFm69pqBCFHQnxzNX+k4jphBBvMi1x75+CYXaYj/VsXItwzsMWGzyBKaUtG1jrjzc+7zICTX/1jmYUSLGdszERIPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821574; c=relaxed/simple;
	bh=+clikh+L/7l7phHO2Ki3EQDgnUQENVMgpJdExPKaRgM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DQrVM1ZD0rIo5F8JBefjHaFbyknJAzV/97yO03UWCvsB4yVWbEVvVTuXlsKxzryt5lS6VzDwFgkem4D3L6Ks3f5y4dbRRTdSL/9uNJ5OMwEUKXjlm4muMOPDa3arcE2o4FiMKK1eu7Ma3g1CuXKXOqHTYhYUYTY9i/aSyUf8IOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwhF2/w+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dl5SVnER; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwhF2/w+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dl5SVnER"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvRpI4078246
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 15:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QoF9ufEAl6HI3WmVt4LCcs
	uzUeUymzKzn28jGlkwMp4=; b=VwhF2/w+93S9DpDANB41Cy+4U8VOmUodyIMKDs
	UfZEyuitBQalpgr2v/jXuQuFks/HU69WtCivn7dVTEJIIc6TIvVl9kI3YxC2gq9m
	pbYJhNESn9l18gCSeFDJvcgzqkxwG1EcZ9fR7jgvSnDd9WS31r+k5p/JaZY9ydxo
	win871PtxqMUFWAUg4d1ThS5lwm7380DKrjIOw4XZq67OIkAr+PfHfr1IzYUtl5+
	y88iGPtT9sETCpBpUziG4O2tWEd0ZzERybyuN6NM2wqnt4D4OI1GPvHUSawxOcWI
	CAdu9Gj2n4EcnfcAZRRirqHuu0+G3GAHibOyKoLEvRtBpieA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg521p81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 15:46:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7f385887bso16123385ad.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784821566; x=1785426366; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QoF9ufEAl6HI3WmVt4LCcsuzUeUymzKzn28jGlkwMp4=;
        b=dl5SVnERGG29wQ++saJlzXePYopg1dnJvbTAO0JUZlgUDgq7diWqh5wKlLAzRJbjHY
         J63Om86rNq5WjmDv8JGMLYIazB6p4Iztyiy8Xjz86FnRidVLe0bw4Rg9Df/3X0szaWZ1
         upA2CL8IR7vyDf3c+qZyNGsDAju1uzltEbS0gAyZTNtb5HqaRwgY9JhGkmWs78Q8p34J
         LLLMn+UwWG/uVTWgzN65bJP4taTJEYUMJCJ2Skkl957KtNHfA6h7owr5yOdomFiLfPiZ
         3gPzzRVjKvqnOTG3IxYSSk/DA9nuzw1fphWsL4K9BKJQ1eJxMMwNzMQ1S7r+W0B4A+zb
         P+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821566; x=1785426366;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QoF9ufEAl6HI3WmVt4LCcsuzUeUymzKzn28jGlkwMp4=;
        b=ipQ4Ha6rSOGxiD9DsBFCixz6OiKChG6DE5ZnFTPxz6Nwbm3qFpI+7VhyVOSRTnHoy+
         J6KQ4MXW/E7LFBLfDeTij/8wtzp1msrGr09daH8R4qXfPNub29YYQ102zc8d442C8g9F
         Aw3VxJNkB+ZQONu2CP2bn7UeXzA53nm+QFb9SugDivU4DmB4oIzw8/jGVoouNvKNB40i
         dUENgVC2pOf3uHUoYVRSnN3dtve9jTOwoo+kLCW5aAiCtvJKF6Y1gbvIsPTPJBBaYRxg
         GFiLtd6QS2Pq6OK4vCOgBjgVGXbHvSGwAEgV95ldjz4OmBmsZNo0wfZ2cXGE23KJ1+Tn
         swpg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6HXP53fATZWZmzXGiOi3z99wVIQkYRO9avD8lceHIz0ITOK1xHH+jgM11Zvfwl012TmKbsyp7aOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Jrc2PDjYq0zUMtcJ8YEHLwcqn/eHBsL0Vher9VhQdlGVVDvt
	MwkDKaysp3UJOWDkSWaWA79C59enyAeYFoyFJURMZIr3cEsUDpaTiGuSEKeiLzo2zlm78VwS0tj
	qQ0qQ2rov6KEzkE8pv+Ud2Ww3Yj5dBwaqEkk22xAXkmocxQjROX2JajnAJ8lX7ho=
X-Gm-Gg: AR+sD10N3SZxR3hwTlNhkDFtcNw4IsZl159zDfHDZUFk8+7QJ0Qp2S9PnQek/eDIBRf
	9OK0lu9JRlpstzDNaFw3iCGDOEmiEK32+CRgtDIc5n5hGcqT8V4w/cwwxVk0YntL9tSlR6gQlVe
	TEYhCc2H67RkS5wpNOYWYh2TbmAvEvI12o1rs79b0ukl4ta7+FzZa6tMKXOekHTo0Yn34Yrt1+H
	LjY4X0ukDC4Qvy7PrUeLqZDuJVMeHzdtBBhChm9okxpVckBCPmwfpSIJ+moNK5AS2RQiRVtzeag
	OFDcaHW0J3CAZBhV0xFQZ/yYkKOs284PPNxCiDKm91sJxXukYRbbPEd3SaQovtISSs+4bMUAr3f
	fuleIMb8DoJoXdpxIAQXzzp+zFAPw35Y=
X-Received: by 2002:a17:902:f68b:b0:2c9:cf5d:d9b8 with SMTP id d9443c01a7336-2cfa6c87561mr45223335ad.33.1784821565827;
        Thu, 23 Jul 2026 08:46:05 -0700 (PDT)
X-Received: by 2002:a17:902:f68b:b0:2c9:cf5d:d9b8 with SMTP id d9443c01a7336-2cfa6c87561mr45222925ad.33.1784821565387;
        Thu, 23 Jul 2026 08:46:05 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd7157sm36242625ad.18.2026.07.23.08.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:46:04 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/4] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
Date: Thu, 23 Jul 2026 21:15:49 +0530
Message-Id: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC03YmoC/33NTQ6CMBAF4KuYri0pw0/RlfcwLko7lUah0kKjI
 dzdggs2xM0k7yXzvYl4dAY9OR8m4jAYb2wXQ3Y8ENmI7o7UqJgJMChZyQrqG/NwgopRGSutQyl
 pVaBGzXiW85zEx5dDbd4rer39ssN+jPawlY3xg3WfdTikS/t3I6SUUY5Y1oUGdYLqYr1P+lE8p
 W3bJB6yqAE2ibNqV4Io1RkwVQFIpdiONM/zF69z1MUaAQAA
X-Change-ID: 20260605-shikra-audiocorecc-85efef073474
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a62373e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Vvd2gEOI0FwQMgiQslAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfXyx1WhTGeDbFL
 XfV4L99ktifhvenNADyGx7SXecPi7birnCnB3JPem6+nLM3E7w+MuvfDfqK9l0rZc7fpzas+YrE
 pNZGjFwEIuuMrXMnTCSGhu6aYYPAH+0=
X-Proofpoint-GUID: kNajbyuxpAOR2sz1NTaWvqQq35f1P71Q
X-Proofpoint-ORIG-GUID: kNajbyuxpAOR2sz1NTaWvqQq35f1P71Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX+a32pyKnyPM7
 p3G62A9F7i5PBEoYDRnUE6/wemgQZrmLf4DkerXbRl+Z+Hu3uTQorFX7U+O+Ve84++32NwmQovV
 90rqIR+NbPpaWGScknybiRTl4CdRG+VuaI9XQie3fO+4/rNPYTI9aHPG4lpK2Tutw3ELxDl6F2K
 bGBOBLk6coigd3iWI4hKG6o2ndgwthuBDEdlzs0gSDzEH5uhN8GJzmuuaTLA+ihE0PUpz9mfg4d
 1LON7QIaykFR/dLdgqyCM/zzcKOJIMfQ5HnPgMlDA3SByK+wW4XJsdVheSjDNfSBy3lOtfGmzBR
 djYuQJg4ZXZmJBLqdyA9uvdAH793QO6Gx8k7QumTv9Bln8FUTTUzaCg4Rtsu5bEv2fix0vgEonD
 tCynF5E6O21j8akZblv9JLzDQU7PHuzEzNTxbM9Lo4tINH/wCNw00yXMVvD2VvsyimugFcx2nZV
 Y0Nu2du/3PlnU9GSeBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230155

This series adds support for the Audio Core Clock Controller (AUDIOCORECC)
and Audio Core CSR resets on Qualcomm Shikra SoC. The Audio Core Clocks and
Resets support differs across Shikra variants based on Audio subsystem
enablement as follows:

- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260722, as the dependent RPMCC/GCC and Shikra base
  DTS changes were merged. 
- Separated the audiocorecc and audiocore_csr bindings into separate schema
  docs [Rob]
- Moved the AudioCoreCSR schema to bindings/reset/, since it now only
  describes a reset controller.
- Updated audiocorecc DTS node to use status reserved [Konrad]
- Kept audiocore_csr node globally enabled by default in DTS [Konrad]
- Collected all the R-By received on v1. 
- Link to v2: https://lore.kernel.org/r/20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com

Changes in v2:
- Separated AudioCoreCC and AudioCoreCSR nodes as both resides in two
  different register spaces. [Konrad]
- Updated bindings and driver patches to handle the separate node
  compatibles.
- Updated resets in driver patch to handle HW_CTL bit.
- Link to v1: https://lore.kernel.org/r/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com

---
Imran Shaik (4):
      clk: qcom: common: Register reset controller only when resets are present
      dt-bindings: clock: qcom: Add Qualcomm Shikra AudioCoreCC and AudioCoreCSR
      clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC
      arm64: dts: qcom: shikra: Add support for AudioCoreCC and AudioCoreCSR nodes

 .../bindings/clock/qcom,shikra-audiocorecc.yaml    |  55 ++
 .../bindings/reset/qcom,shikra-audiocore-csr.yaml  |  42 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   4 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  17 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/audiocorecc-shikra.c              | 809 +++++++++++++++++++++
 drivers/clk/qcom/common.c                          |  24 +-
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    |  49 ++
 9 files changed, 1000 insertions(+), 11 deletions(-)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260605-shikra-audiocorecc-85efef073474

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

