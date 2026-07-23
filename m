Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7836344C65A
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804559; cv=none; b=EPI/XgzHYmRgWKE5BxnSiudK3xqNY73VXOKXS1/IYXPMkzvhxSREP4duKZAJDMevbuNICPmOW6vqcUz5vDpdhAmVc7bRz9oPjPRzVYvupsmE7vt8244roZipyXc9uuFLyzs3MLme7oSZM18Hld5P5p2ywxBzF7/CaU5rN8wFuZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804559; c=relaxed/simple;
	bh=lY+JH9hWn1KDlSMkKaha7R0dkBbchodNMn4JgHPAPAY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ZompjVfehSABOBdz06zp9ZD48n88z0JwtlE/b0fVpFSCsl1hVLdr8zVB9ZRvKaCiga6dfrtc9Emm3Gg5pbiJ5m8RKHpyel4X9FcBq3cJZxc8hNQj7XvN63Oh7vPL79IdtOuJryC+pdXIKXSw7GLqe+msRfQ6W0T81R2rzZFk1S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjOYsmOG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O17BfjrZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjOYsmOG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O17BfjrZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qWAL3260957
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 11:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OsSJorsSg8qSR3NsOFSwBY
	0pzaKrT98ghwuHcUdyRfQ=; b=BjOYsmOGbPrG3QHkURs0VMUTL+ptSeoTY07xBE
	Jv3HAqOG5rHA48xEhs7IuiVrPHJrn9Rg3VEJBZi0NypUKPc3/xAx8n5I9/vferwk
	1i7LnSucwrDXUWjmoAxh95oWf+GuU5gf+leyU0fRcaBNc/UfNjBDi54flid6WCsA
	hxe4LnTfPUc72Jx1Wyd7rnDfjlWSpvG1zFgom4kody4ah3bst+3jJvdWG8rF7tjL
	8uLKM191L0pdU/Dtz1JqN+0uJlEwu5I8NzMxXZdxLJYJnouaEc+HJiHIPRDYsSw9
	UhkHm1kS6uZVGHfu5GoOV9bdNmS1qs33uQowTZ0Vq3oLBSpQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw1sx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 11:02:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso398738a12.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 04:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804555; x=1785409355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OsSJorsSg8qSR3NsOFSwBY0pzaKrT98ghwuHcUdyRfQ=;
        b=O17BfjrZgxOFUpIR4YUwfIdC3l8830l35vI9stN0SACAb5E3Zi1Odmzf6wRidTLXtm
         NupWIo6a20vs09JXSCtxsd1nI4OBn2JWH4s3V/18/xLY/Jn05nDEh68GadHaQSPBTVV/
         tXkjqkf5CkKE4eicxSD0a8XJLsaHPE49lWWLExjUyIUqFmtEtgbt8sPoFgCbIMTWqobF
         Yv+KbIJR5esKx6rmexNH9SBZa2ciwCKiE1UNM0PoV14VnUExD4JGjtHw6K5Mox/LxCmV
         OSYEgVmIRgGOivwwaarbzvjwdP3hiW/IuWqt1qkjxYO+/GkDoCjDg2Mo0Q/TvAlzHUAa
         Sj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804555; x=1785409355;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OsSJorsSg8qSR3NsOFSwBY0pzaKrT98ghwuHcUdyRfQ=;
        b=bnTHtKl934gtxn38Acy62jKnO71Pz2uYV9ZzCD+vDd758xYlQPvdhQDOM0/4S8kwy0
         USxsMKfF721s0Mu3qk5SxjbSX/x1uquRkLiz2KGzIlnbqO8QrpW7tk6XV8h+G4s1tFKk
         mgyvtu0VKeoO+Y9c4kaOUlxIFYGTEbzDAJLVh8PXlSASyWbOxYhEX2xKSS49AWCbGEe1
         6T6ULNDaAEVkUhn5zcJ57u9EiH8x2maeZBQjc8M565ck4NQuKXaJyfqE1Ms95Kgv4CfK
         Y69HQ547Bva+sLGuhHxe9tcvf1rwFjUkDMrDLxS+IV8qEaOX6sr5NROnVLGGyG4G6oN+
         7M1g==
X-Forwarded-Encrypted: i=1; AHgh+RrjKSaQhIhD123rMIvCSUhCgM0Tjq5FjvaDtV4PshYUGK9+ZAVFpcBkmMG/vSbZku9MkC1r9a6z+q0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7cMX43pQ8/T9mQv1jw18VasnVCtcKEmoQSpSJymrIxAK0X5ec
	ajBGCe5wugLvJf31VKLLjScaRRgblXoXRh5Qi7he1KNzGkqbL8UP8tgtu+BbBKjIXOD0ef7iO8d
	NqIwLgdrtrN1dXaYqfeXmc7fid93L7kEosd0p7PjIQU8VSWD6FA7j7iQPzDzm6tA=
X-Gm-Gg: AR+sD10ifrfAiCv8FRiLeCwhlBbqBzQaDV/uB334CQcfCgLCIdUpga3qZsgT+INxYc7
	O9R7GzeVqLPP337S8JeNENFi502rwlOfxiDn3C6oycD0m4Tg00K79NFm+5stusRsnlTa4mPILHL
	3ywCdrg2s2lRSsMFG03beYEvDBS/V6IGQOHtM9D05NESqToXylCSTmTRaGOlIzwt7iB/2KFycmD
	TuhM7No68lNkUeNeNyONybSYeI5TDN7LFhypKeCgM/44N3CavoYDxmkbMoTS3FVNG6qvZwVVKkw
	eMC4enfrIMtZ6xkOafoQRcsfZl+9vDmlIo/Gj9xRVF38/p2N1g2JiwsTKXrtz5VwiY7XClDlXjh
	5yNiy7Q5Y49ybJmAbEg==
X-Received: by 2002:a05:6a21:a395:b0:3c3:67e9:660d with SMTP id adf61e73a8af0-3c44b243feemr2447526637.60.1784804554886;
        Thu, 23 Jul 2026 04:02:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:a395:b0:3c3:67e9:660d with SMTP id adf61e73a8af0-3c44b243feemr2447498637.60.1784804554449;
        Thu, 23 Jul 2026 04:02:34 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e0818e4sm18876115eec.22.2026.07.23.04.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:02:34 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v3 0/2] Add LPASS VA CSR HeartBeat pulse clock support
Date: Thu, 23 Jul 2026 16:32:29 +0530
Message-Id: <20260723110231.1586417-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61f4cb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EWEnZrRmfLhET7K6etEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: pxqHypj6H1lve4Y-NPPRUlo3z7FWlghI
X-Proofpoint-GUID: pxqHypj6H1lve4Y-NPPRUlo3z7FWlghI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX+4ljlZmeToSS
 L7eyr0knTD8uGT8bRtuvGGHMqBfhfhVrjTUQbRGlxWixjg9l42dA4XiEG3AxiP05mbPjggvbEwV
 OsEVuYnB7H/ff3ObYvbdXG/KxD+hdv4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX3kWFEgvasQ43
 ywezvwanN2gYyFg7gFI5VNsJyhzNFIw+Gp74JBrG5y8Mg1btzRY4PFCMJrmwYQRCwhNLKNu0ms+
 JKxU75pp2cVOFQQ07EzTaIdI5mwVkavynO8Ygl038i2OaLZ9aWnBEpKN8QgZn3ykedyHbKadtbh
 Vbio3yxBRYVlWsUU/UUaOVmVfaISaLLjnRotdXrulOc+Fal7OK4T0N/7duVU3g2n/hHORnWDBfh
 EkouKZfpLLEYSG0GwmhJo5pHxuEV2yMcs+zr0kFrIwP7u+cBHYHmU0rZON61sFas/AU3qPlasrw
 9FSHXtyTSj+WRaS8rlQ5NpiZ09tkDIvDvYzcGegxt2PYjy2PRZadvZEx899cIJch7uuN+9oApHs
 iPJJlUstkATsmc0b673by4aRtss90qIxfhzyOsq45sYb0PlSNPalBYZlEZYaaR3R6gHG8kRF3J3
 u7c/dquTcGgzoP7L6rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230108

The LPASS VA CSR block contains rate generator hardware that produces
a HeartBeat Pulse (also known as RateGen Pulse). This pulse
synchronizes the start of the DMAs and Codec Interfaces for the audio
usecases and can serve as a periodic wakeup source for the DSP.

This series adds the DT binding and driver support to model this
rate generator as a clock provider.

Patch 1 adds the YAML binding for the new qcom,hawi-lpass-va-csr
clock provider node under Documentation/devicetree/bindings/clock/.

Patch 2 adds the lpass-va-csr driver under drivers/clk/qcom that
registers the lpass_heartbeat_pulse clock and enables/disables the
rate generator via regmap when the clock consumer requests it.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
Changes in v3:
- Moved the qcom,lpass-va-csr binding from
  Documentation/devicetree/bindings/sound/ to
  Documentation/devicetree/bindings/clock/ since it is a pure clock
  provider with no ASoC dependency (Krzysztof).
- Moved the driver from sound/soc/codecs/ to drivers/clk/qcom/ for
  the same reason; sound/soc/codecs/Kconfig now selects
  QCOM_CLK_LPASS_VA_CSR instead of carrying the driver (Krzysztof).
- Rewrote the binding description to explain the hardware instead of
  duplicating schema text (Krzysztof).
- Dropped redundant reg and "#clock-cells" descriptions from the
  binding (Krzysztof).
- Switched from unevaluatedProperties to additionalProperties: false
  in the binding (Krzysztof).
- Renamed the example node to the generic clock-controller@7ee0000
  (Krzysztof).
- Dropped the qcom,lpass-va-macro binding extension patch — no
  in-tree user yet; will be resubmitted with the hawi DTSI changes.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260717-master-v2-0-ae200627ad62@oss.qualcomm.com/


Sarath Ganapathiraju (2):
  dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
  clk: qcom: Add LPASS VA CSR heartbeat pulse clock

 .../bindings/clock/qcom,lpass-va-csr.yaml     |  49 ++++++
 drivers/clk/qcom/Kconfig                      |  12 ++
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/lpass-va-csr.c               | 143 ++++++++++++++++++
 sound/soc/codecs/Kconfig                      |   1 +
 5 files changed, 206 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml
 create mode 100644 drivers/clk/qcom/lpass-va-csr.c

-- 
2.34.1

