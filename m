Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C31734EEF1
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430360; cv=none; b=MgkVjwEt3FtGxdPNXywYytj8/J6jxXSh28Yibxl13S9vQbgAohWD7EQrHGG9iJF15z+2rZwtUFp2KtTAm1vv3hQFJ1KCwBJxBG1BiIFu5QGnNwpt8ColfLpQzhlNwAY5VlQ6LFRQaqAAVY+y98stF0aOlIQp+hzl9kM7PYFsRr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430360; c=relaxed/simple;
	bh=Z2A70xPuLx5Qx2+ylNKmwq/SEaBeBQZatR8yiCsq5zA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c1ycKnQi896eXBiZYNsVNvvlzQhgLo6LUc8M8Cto9MxmiIddAExsDINuWdK19J3DDUpB9dsxHF7WEHzXFy15AX3U5eTek9pRvYhSIARqRAq6bLPSXxl9RSnzIn9ickmXkERfLlUf1iY+p8Z+7jMo5hXCwQIS21vSRzFyUIpMfnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/0YviPP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eiEKr8H7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/0YviPP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eiEKr8H7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P9Cw9u4158069
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iSKomS5k0XPpWWOTcEaQoi
	B9gI7D7WVUTAGCcb+RaJo=; b=E/0YviPPm0vWb0Eb97X1SHtwaxEp+vIGMzo40/
	q50XBK22yx+9NVmp2CqYZ85Q4uuRVaLAx+RIGMo/og07I54TREWGvl2ZD9MJuH0P
	Ht2dgJ1An4WsV+40oIkPsDBOLPX8zGI7wXo+dgkqi+Tg1jwUvnHj5s4EJj5rrGOU
	4iEoY/nXcc/KKu6fVfYA1d8BYMHDIvJUnVAsHLMxoH/ADHYDFlmZk85UFmVsyWLq
	hkwq93n2foC1ni0p8Y51E/oNpicFEJmFtMlWlECDUBjCQ96X+vxwJDcq7fMV16uW
	kX0nn9vXZlSBtJfvCtZaUfb2Zmxh513GRPyCL6x7UN65LwJw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp00ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:19:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7414179cceso3185381a12.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 02:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774430357; x=1775035157; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iSKomS5k0XPpWWOTcEaQoiB9gI7D7WVUTAGCcb+RaJo=;
        b=eiEKr8H7HrbAiu5SexIkfR3R2FY7v57lFyKhQB13GPnbmWLLoZSkE0osAaG8KcqUrV
         XQwreMFSDck2vaiCFKAK9XQQFgJ3U3nbtRaNWp5tlTSvTR5yUKx++yw7/dceJM4unhK8
         rdCuUn2cY4nsePOBquPdu8ClCkxnC8wlAD8Bba68hC1Q1syj0P9NyA3HyLb2mz8+wzy6
         BZoRowlAA6dIwjGVBAQob/SDm/NiGmel1IJBH4kiaQQlCU+zL7kcB6ellxeGatBnGorr
         YsW5YQjfZ8fbBGLTLqQ0jXQDNrTAA4jllW6beu9W88xOjgAD4aamapycCXm+0Q29unoV
         zZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430357; x=1775035157;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSKomS5k0XPpWWOTcEaQoiB9gI7D7WVUTAGCcb+RaJo=;
        b=RQ9Ttad2Y71AdtVQRyKpwcIiFRKaE+FUrupCWugD/fLgRbdZlr1t9sdXRcRgiufqEi
         KYkacVXfYyVL3Au2AfbDPWErYAlWxvdWnq1bX1agq59RYBz3EQlUuFiLv4cIurUUsHAZ
         SeTCkQf3AdF86O/iGj5wGvbqQbRB/xhLYprcmqD1Vik39H1pvqjunZLqijElGgi21Y4X
         b0ndsAVCKmKjNjMTtngwgGk4aSdKY2Lnm/AhHGMghaWH3z3xr+BBYkhyPWvS6PjOp4b5
         OJm9ZRU651wDNfFY59SrFIhZjn18PKzQ1DKer55zAeq4RALZOWVavcIL7pCP/MisQblC
         Po6w==
X-Forwarded-Encrypted: i=1; AJvYcCVVwbs44Dkkx6b68hr5fTvk1uWQLrDXwB9PJWyGcZUF53Z5u0KyAHOm40J18djyemVlFGtTd1GiSfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOGZeNVCuSzQKfDHqclDIskiNTPhqiMKZzhJcQejbvjV2mhHmk
	4DZBW/HH8LWH3F2OyxNGqMmf9Ux9cZ5wnmP4jbtBaCEUGv6F77QhAVekpiLMUN3hMNwkXyTAxBi
	heARWT5KwihRGW5ZQb/yB7KjqTA+4n0Iw2lElrZTE0SXsMR5w1Ysv2cyjw0Xd+wY=
X-Gm-Gg: ATEYQzxehPAGnTCQozjmFAYeqTPrvoycsNTgiBArQVHYT8kzDQF69JcMK+LnNBgV1b/
	LGiCCrDyotkBr3Em5It7TIeARTjLa/1yJ2amZmblQiv6E5MNg1xuDuI5D9WkFNd8cIU0gmuW8iA
	gZnEtPrVRBex5fCzimYGGtPLANOuQ0CpaiDNUHR47cp2T7nqExDoSQlgSMzbVCqtQFqZsA6pr37
	Xc/IETdD3O7T/vdl/ppGLhwGiJVcXw4oqe3Uu0eI/ZcX63uhoUXJz2z0xIUldm7w1gQfq2lTDpR
	GVupvrEFjBLuBhORovkzMAEwHckwIX6dFu+6hP8oA8ggsnGT0M+uxSANBPOyqf79WSnGJwixp22
	MOT6jAA7PKQXHclvXskUTYQvHLUIpZcFUm52Y1db463YusPkXoLpq6Fj0lMCpsKt9oaMhY4spLt
	Ol1/afzRYZI7Tq8tfQKeXbiZxaYu1tx5sU765DehP/ngg66tDjZ6u/y3Ck
X-Received: by 2002:a05:6a00:ad8a:b0:824:36f8:3461 with SMTP id d2e1a72fcca58-82c6dedfe79mr2958229b3a.23.1774430357128;
        Wed, 25 Mar 2026 02:19:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad8a:b0:824:36f8:3461 with SMTP id d2e1a72fcca58-82c6dedfe79mr2958210b3a.23.1774430356676;
        Wed, 25 Mar 2026 02:19:16 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c38565096sm9643605b3a.51.2026.03.25.02.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:19:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add minimal boot support for Qualcomm IPQ5210
Date: Wed, 25 Mar 2026 14:49:08 +0530
Message-Id: <20260325-ipq5210_boot_to_shell-v3-0-9c7360d19d10@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyow2kC/3XPTW6DMBAF4Ksgr+tosGMMrHKPKkL+GYoliIPto
 EYRd4+Bql11Y+lZmu/NvEjE4DCStniRgIuLzt9y4B8FMYO6fSF1NmfCgFXAoaHuPgtWQqe9T13
 yXRxwHOmZW12JSsimB5Jn7wF79727n9cjB5wfmU/H55/eFoddyl87jdNEbc9YqbEEoUW78E3VK
 iI1fppcaotaNNXZWKMs9GTrGFxMPjz3Uxa2l/zI9T9bL4wCVbVEJg2XIOHiYzzNDzVuJaf8kOu
 6rm9huwi+JQEAAA==
X-Change-ID: 20260309-ipq5210_boot_to_shell-43db656579f0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774430351; l=2504;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=Z2A70xPuLx5Qx2+ylNKmwq/SEaBeBQZatR8yiCsq5zA=;
 b=RJKV7Lj25UPnue3nPFroPH1s2xOZlscFQqPVZR9kNfDLCiV0qbpHWtwev1BeIRWk4Rennfe0f
 cdMDZxMj6lrDoBJClszpCYnWWrrOqOJ+TEZQqNunNOag5OfZcfpHh9f
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: UIz4VGmIX6ggNDNU8-nsnGR96z_dSGgk
X-Proofpoint-GUID: UIz4VGmIX6ggNDNU8-nsnGR96z_dSGgk
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c3a896 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bSgCymLzPmkwYw6MPxAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2NCBTYWx0ZWRfX9/6PI21NEjO/
 uUUOKBh94c9Yrq2KeUy5+2m1pqHW27eBNmUteqEnprAjaRL6gpYPSRgUlU6TmH0pOcqWe/bNuCD
 +/A1sEjoCuSVUm/KPUhOio3lJ53eonEYVPwXhSUiTsQJb3CE3aKxcwzxPfywzlKWlHaCFQ51o32
 fDt0gVNhQgtzif9SZDRvuTkpDB3yq/wOERb0Njd43bSHV6YS4N23cznxEstQ+4Q//MnGciz7pkB
 PBC9dDLWpZBs/FkwePjYzgTV0/y47IrOwkHechheKk9uzwX5soqGjI6+Us8cVO3f1739tqNK17/
 k+yDC2zcSWJEkYZRV6HIEoH82ULUpWZNX6vk580VK/nfIBm5pMMGV3WteXYkOm6VsN6bwqo2mg3
 PUE2ux8Anp/+xh9XDrK+J5nRSJJ4f8HK+YMxxyT4V2O4jIaJ0se0Gtjza+TTLi8t4Xa236LW2Vb
 5ftvh5vEclAZGlQcEuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250064

The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points. This
series adds minimal board boot support for ipq5210-rdp504 board.

SoCs based on IPQ5210 is shipped under 2 different marketing names such as
Qualcomm Dragonwing F8 and Qualcomm Dragonwing N8. The difference being is
F8 parts has the Passive Optical Network(PON) interface which acts as the
backhaul where as in N8 parts it is ethernet backhaul.

Qualcomm Dragonwing F8 Platform:
https://www.qualcomm.com/networking-infrastructure/products/f-series/f8-platform

Qualcomm Dragonwing N8 Platform:
https://www.qualcomm.com/networking-infrastructure/products/n-series/n8-platform

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Dropped the patches which are applied (GCC, GCC binding, SCM binding,
  defconfig)
- Various cosmetic changes (drop the comments in intc node, kept the
  newline before status property, padded the register address to 8 digit)
- Link to v2: https://lore.kernel.org/r/20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com

Changes in v2:
- Separated out the TLMM patches into dedicated series
- Dropped the extra ':' from the GCC binding
- Added a comment in GCC driver for the need of CLK_IS_CRITICAL
- Various cosmetic changes in DTS (inclusion of dma-ranges property, \n
  before status property, lower case phandles, enabled the QUP node by
  default in the DTSI)
- Picked the R-b, A-b tags
- Dropped the SDHCI binding change since it is applied
- Link to v1:
  https://lore.kernel.org/r/20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com

---
Kathiravan Thirumoorthy (2):
      dt-bindings: qcom: add ipq5210 boards
      arm64: dts: qcom: add IPQ5210 SoC and rdp504 board support

 Documentation/devicetree/bindings/arm/qcom.yaml |   5 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts     |  79 ++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi           | 311 ++++++++++++++++++++++++
 4 files changed, 396 insertions(+)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260309-ipq5210_boot_to_shell-43db656579f0
prerequisite-change-id: 20260317-ipq5210_tlmm-df221be105b5:v3
prerequisite-patch-id: 77404131104f6d8cd899765726fe7e6b41d5af6e
prerequisite-patch-id: 8ed4183a0ea5bf860584e9a5e7d594798f409444

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

