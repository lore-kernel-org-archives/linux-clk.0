Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3073D33D4E8
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905231; cv=none; b=Lr3yMGLCVKd9BI8qzuNyG+sUrtTyl24eQ4kplPoIsmm3xJSU9GxHGon5eGaeSHQBw5lNYDSd023Ce/Ddl4wH+0eokphpi952hdI+LbYkGyYYGH4Ed/E29NyQ/tq+r4fLSDbxRWyl3x29N9NcAvXbzBpc5k9lj7zhoSmXVsCVJaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905231; c=relaxed/simple;
	bh=kko8v/PvUqupAnRZhYeFpLTutKewYs6xhN5RlNMfaVQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eGe4kkoKp853Rf6qbQ5bnVoZc+apkjOEXnpq5TKOchG8+to8sbaIXZqZMjh++V0UwrF2W4eYs5+E/hScKL7YOLaWyBA0OmawIbsJia+q8hrlIPIz6vKCxKoTFTSdquTQo1g76/qGJY1ud6H5JaKEWu4bjlKHdN49MQ1z3MEf96U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebAPvFQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OSldBmWb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebAPvFQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSldBmWb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbLCw2710351
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2+S4Qr4ecJ8vurqfXY55fa
	FolKA1DCWJklnTFRiEnTU=; b=ebAPvFQDU63FMpJ2ZmQDp0AtbK11UhBmXMOQGS
	Ch8GrLeNMFdfdDQZ3CABZQVF4NnxAmi3K3+UwrJkr2+2Q5J8dHDuuq3HmegFPs4w
	vTa+zq1joAN60jurBJy8AidLdMGc6uIiR3UzdZOxRn4pdhxQX24G+6fiLv4CK7ec
	zzYBZbFGyNxJDTPO5RAqrQ9qkvwhyH1HU/UB99549Kk+I/gq9ewGz3l+wX7MMTO0
	PUn3AE6PAIiBh1B0FY1BTLf6S3kZnS8Fb0Vh9a3iN91Smdc52XeXmw1FB4oPt0Sl
	TRZ9RLEKQVh3FSrG2rvbZofm067kpJVzFp0QFMctcz1JYKkA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cggg9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce870a060so9377515ad.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905228; x=1785510028; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2+S4Qr4ecJ8vurqfXY55faFolKA1DCWJklnTFRiEnTU=;
        b=OSldBmWbV0ql/8T1R4XDv8Uz+vKEAjOksNsrZicpdIcmnKEE56t0SrgXf44Tb4/InL
         wY34KvHySU3h5MkbvqHo0a2F2Czpfmst8/HNeC+tabdHxYc6sSn6zWOqLZkn3QyxmHLs
         Wrd+k2bkBhDSFglNX98qZziCd8LZII+sjO9+51JM4Ad0jy4TbOs3M6ju/6BcYPc/+6b2
         SoQfzlHRroUGieRD8w8aAPP4R5JIj+W6JwpsAotXBXPPyXplxpaH9cCdlcwRD7hRHjfG
         RkYx1bjAjSU5/uVrS4iTMpHCL6LRFD9PnHDqX487NBOmXzcHOQqF9OuxVWl1f62eyGWL
         l97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905228; x=1785510028;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2+S4Qr4ecJ8vurqfXY55faFolKA1DCWJklnTFRiEnTU=;
        b=KvV0PhmdqvlZdDbHRefIXLz3UUqZ8JQwECqGRl9HNuw2PcPg04Cw2UCBX/O14SNLlb
         w9OkUFMKblBzb4wemLzS8aasYcJBCb0U5YRioOLRRre5J/Byxe53fXr7904UHTZ7tDUI
         WoYClJ8UJGYjMQRFE8paEcKofijUM6o3uzC1hu8JRUakAVgg9O+V92F0N+Ue69SxK22K
         w4/mbjd/3xlTAoNUDNNcVL2Qkx8mJKuNU4K8GV3ismZ0/lDLOHfD0oeF3TK4BK9XnofK
         tgNEGUGYa7CpWSbnsJYAQScWejKudpPDNEhqOjsTk7JNJuhKLfKmYuE87U7twfwqDccN
         yhGA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6+OoaM6V72rpAYEktYlbgAwEHrorXgMBQg9HHOzyLyZDekg1oGCpbodJSqXBP7FAcl/QmCPyYZkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrzWyLZEHnT6mViiTBhLRp1gx+ilopPejLJ4XWY7WWZOj/BrXK
	NY+PACM/aTBiMgJpNAHaPnteKIoS6VkJzFPYjF7hdQn2XpUWsfxezRacb6Rf9ZGTtVuIeFBumfg
	hxPSiCx2m0L/Rdy5hOpXP9B1d2ciizvbf/zqGOaBuYIhsHHyZlnFZyacLgpv+NaE=
X-Gm-Gg: AR+sD12/kNoUO42EkES7Nr3yZxzldhaPJP0dBf+aI4SMOw7rX8g78DYHrYwXLtdi/bm
	bTvD4dMzzMHH9L3L6juVGgxjs9NMka4fo7x3kHkLvHhl4IWLspIQn7KisGf46EdvdVgVQtSazuh
	RHsZOtHu4EY6Ux4XbVSM6Rrt6/oBsnDLnRJEMG1Ite1pfJiB2lQRWD9s3QjAX5szY7HBZo2gzoU
	fVQ/4a20GJTzd4rpmRoquQNG8/fNPCxtGSqGQTnbNiRtnpZM4IZTSxM6BrPvGvYxno9W31qixJQ
	N3y+S8DnnvilDCZ3+Nom0wrFZpgjCqcIF7Qp5hgbSAhDg722amj5NPpbbi/pr/4lSqEgsCASY/A
	SUeavg+oPiQ0iYJlQjco5HJgDX2BZ+Si3SPjXFZCQh0k=
X-Received: by 2002:a05:6a21:6494:b0:3c3:8600:f0a with SMTP id adf61e73a8af0-3c44b18b831mr8831958637.46.1784905226166;
        Fri, 24 Jul 2026 08:00:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:6494:b0:3c3:8600:f0a with SMTP id adf61e73a8af0-3c44b18b831mr8831902637.46.1784905225536;
        Fri, 24 Jul 2026 08:00:25 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:25 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH 00/12] clk: qcom: ipq-cmn-pll: Add IPQ5210 CMN PLL support
Date: Fri, 24 Jul 2026 08:00:22 -0700
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAd+Y2oC/yXM3Q5EMBBA4VeRudakbZYNryIi1HSNUP2xIhHvr
 rj8Ls45IKAnDFAmB3jcKNBiIkSagBpa80NGfTRILnP+lR/m1DI3ZF0mBW/UbOw0MY5d0Ra5yHq
 tIZbWo6b9uVb16/DvRlTrvYLzvAAiyhgsdwAAAA==
X-Change-ID: 20260724-qcom_ipq5210_cmnpll-0eb9a9615dff
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=3193;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=kko8v/PvUqupAnRZhYeFpLTutKewYs6xhN5RlNMfaVQ=;
 b=dxK9tBKw+7oYznPTe8Kw6mLX/EuBJBqwe+twzB2ln6M4VYEjuGjS46cuwN+cRur9m+dwLgxAy
 BxM1uj178dRAAnFnxkYAnI1L8VfKsOGCiyD4pI/0/RfJ2+pn56k+Zpx
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=JOMLdcKb c=1 sm=1 tr=0 ts=6a637e0c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zil3pad3FGakuW8kcwcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 3qUMZEZnZzt-Whaq_CoifNOq4ry1oPEn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX/V4OBnYCPwNx
 XeBXlZIAIaTJkz7hRaukfQXndFFlU9iJIfRZRRCXTSVZfQKkv74bFWqWI3YXDUcEjh5x/Y7eCnE
 MDk25tjWZEM6OV6eURXK5VT+bf0hAYw=
X-Proofpoint-GUID: 3qUMZEZnZzt-Whaq_CoifNOq4ry1oPEn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX39YsEeavmLbf
 v7m+HDbK6kjYIJGgwZaagJggeUUpj7XftbK/LLa9XwIpT7BFawgk9xXweJq8H0/C3PEKXsZvLmr
 8jbhnbxQyYOF8L1wEj5eLNz1yYnqIK7hoS4xLz++954ycKoQgllaULtnzAcRPsLj6MZHHI+3Rii
 OerXSJulYexIzN4bfLjL1SS6E0KoTeV6JODNmvtyL9pdpvw6jls29omPO8nsuclK9VimJWMLXta
 MuPfURx1B6K4LvEjuDTv1tg1AZmR0ZEWPop0YNf98Lp3IfUuMU3WurtKPtbT5INQ7hxC/ErJRUv
 kCp5gsF+xJArKYeXHOhiNbC73HMOeopOn3ahx2edoXhbO5QWovu/rGHp4B8UrSeDAzi+ifu9NoL
 uzsIIj5EblNkG7yuWO0RyCp/XpdkD7YkhqSqZP0s2557QiOUPozSQyMSAguoPXjzmjnCGlVtP1z
 qyVxxlF5eseu//SX26A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240135

The CMN (Common) PLL block of IPQ5210 is almost same as that of IPQ9574
which is currently supported by the driver. It accepts a 48 MHz reference
clock from the on-board Wi-Fi block and is configured to run at 12 GHz.
The difference is in the output clocks.

This patch series adds support for IPQ5210 into the CMN PLL clock driver.
On the IPQ5210, the CMN PLL block supplies a broad set of output clocks
to the networking hardware and GCC:

  - NSS (network subsystem): configurable rate via 6-bit divider
  - PPE (packet process engine): configurable rate via 6-bit divider
  - PON (passive optical network): configurable rate via 8-bit divider,
    plus a fixed 31.25 MHz UNIPHY mode
  - EPHY-RAW: 125 MHz or 312.5 MHz for the SoC-integrated Ethernet PHY
    (EPHY), which supports up to 2.5G link speed:
      125 MHz for 1G/100M/10M, 312.5 MHz for 2.5G
  - Gated fixed-rate outputs: PCS 31.25 MHz, ETH0/1/2 50 MHz,
    EPHY 50 MHz, ETH 25 MHz
  - Fixed-rate outputs: XO 24 MHz, sleep 32 kHz

The patch series is organised as follows:

   1/12  clk: convert fixed-rate registration to devm, remove remove callback
   2/12  dt-bindings + clock ID header for IPQ5210
   3/12  analog soft-reset helper (clk_cmn_pll_ana_soft_reset)
   4/12  NSS configurable divider clock
   5/12  PPE configurable divider clock
   6/12  PON reference clock with enable/disable and divider
   7/12  EPHY-RAW 125/312.5 MHz select clock
   8/12  clk: composite: export devm_clk_hw_register_composite_pdata
   9/12  CLK_PLL_GATE() composite gate infrastructure
  10/12  IPQ5210 output clock array and device match table entry
  11/12  DTS node in ipq5210.dtsi
  12/12  Update IPQ5210 xo_board to use fixed-factor-clock

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
Luo Jie (12):
      clk: qcom: ipq-cmn-pll: Use devm_clk_hw_register_fixed_rate_parent_data
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5210 SoC
      clk: qcom: ipq-cmn-pll: Add analog soft-reset helper
      clk: qcom: ipq-cmn-pll: Add NSS clock support
      clk: qcom: ipq-cmn-pll: Add PPE clock support
      clk: qcom: ipq-cmn-pll: Add PON reference clock support
      clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock support
      clk: composite: Export devm_clk_hw_register_composite_pdata
      clk: qcom: ipq-cmn-pll: Add clock gate support for fixed clocks
      clk: qcom: ipq-cmn-pll: Add all output clocks for IPQ5210
      arm64: dts: qcom: ipq5210: Add CMN PLL device node
      arm64: dts: qcom: Update IPQ5210 xo_board to use fixed factor clock

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |   1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  22 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  25 +
 drivers/clk/clk-composite.c                        |   1 +
 drivers/clk/qcom/ipq-cmn-pll.c                     | 612 +++++++++++++++++++--
 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   |  30 +
 6 files changed, 644 insertions(+), 47 deletions(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260724-qcom_ipq5210_cmnpll-0eb9a9615dff

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

