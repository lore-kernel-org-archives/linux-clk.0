Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC07149553E
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 16:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086294; cv=none; b=u9V9EK+iBjKYjUbv9bgxAPX7wOCy4y0314QrXYqz2E1NA979XqVeSdZO95/ThfLqbxjNfK0KQRHg3ZNSvxWv60HeoPwikYC1nbrVcCDMMvQYq4H/h/Jf9gPjV21WZ50vec+dTxbcMzHwo2ChY3+KLuOwXlLb/8szYRIAveidzYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086294; c=relaxed/simple;
	bh=tjHaye4xtZ717xh77McuvoBcjHTyO4dZVWJzKb/WY7Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QWqQe3qnNDKeW90zjgZNmAJvuf5S49qL+rVJIQxMVfVLaPHq07u/aNQb/+chttllWZJJckbYOriTTXDDjLD8XdqF+wrrT15k5VdVC2USPk5MevQ9UMQNTgrwUysUHsF8kuZ63jGqr3Rip1rgSjdHdpB318tohFvE1ZC5ZSTUqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ux9uJknh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=glaVdlKK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ux9uJknh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="glaVdlKK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646C5SjH3036649
	for <linux-clk@vger.kernel.org>; Wed, 6 May 2026 16:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y5jRm5GwQWesVDd6LymNGM
	yqSTz9fmO3BXsCvRQbSNs=; b=Ux9uJknh6B3sktohrsSk8gDQry+99E6Jqtocjk
	Jd0zafxft/B/y28Z+iyF0sFRqClx3AcpSP/lWGTOnZsDSzj0G3ZIJOn0qnbM0+cu
	f/98FjzkS7FbqGSa+Q8nUAKsWnw57D7pExJCdUJ2Gk7UFseulpOsOAh5+OMNBXNQ
	EKVxjEPcHsdQeM9gVh0IVSwmR3Mk6fuWl4sU4hpjSyPkPRxXrbHtYUAZ5CV8Vq62
	xr70bUsnuoAz5Bnc6Af0Z79H4eye+BHNXIVK2pFOvEJ7G+AnRxrhvrRghSXhcGVc
	Wn2EhPUnJjY1ZxC53r8GXVn9DgsKJkNUSx9zARBRJijcdjOw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf14j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 16:51:31 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1309f4ee96dso6243757c88.1
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086290; x=1778691090; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y5jRm5GwQWesVDd6LymNGMyqSTz9fmO3BXsCvRQbSNs=;
        b=glaVdlKKBFvOzqaFZyNmWEE+hUsoEdQX7KM0R/827TVMyolSOH9mXFIPeq1grsW4No
         RFyg4Q7/hdQ7tvpkJFsspoE+KCGcf3LEuJAeasrrTh2P/JBcrU9nGTEdHkrnzA7gR1R4
         Wgu0XWBmmCNzOLE1nIrrEPcW3vtwYus4vCkAZNx5ZZegDjEWJzT6MBPYSfTCeaC0kTaK
         upbjvp0fWT/d2FTLUDuSK1wihcRajyDcT6ZHGGXKWpLBjK1PyPzOviFdynxfzX0izetm
         SW+qTumPd6LPn1ueYBRWqLBzRwrlcvNXKUMQdXBM2410iTIlu3PNHuiltPQsSadNsoTx
         tt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086290; x=1778691090;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5jRm5GwQWesVDd6LymNGMyqSTz9fmO3BXsCvRQbSNs=;
        b=pkCJKz0F1kU8j/Zt9+RTEcqzE6Qz4OLUkjbQEKfSHD1+odV472L+8NM4maZnoUTIGf
         JYzArQYJKVrUjepQAZJZdUHdJQrv0IDXSWRkmRU1tQm52qoUNHIAGiUH6ZLagAcWCeW9
         KxYMMAiucu/sRzMOq21dlSdS5dUe52WuoaDKnbJ5iwkiGSk7S+chxZvi4DUEv0D2cgAE
         5gB2d6/e+e49EpI/AWlwNxr01fl5wi84ESgScDuwvq5CNqwRi2uZf/iDiKntFnw3clFZ
         V4uug+xY6AZbjwIqc3qRD5xFgEsplE/ZJKLqrlLfTz+Fw4NIqiq6zRXq3/sBdrFjHseM
         v3og==
X-Forwarded-Encrypted: i=1; AFNElJ8goaWZy7zSlk4wInyqRWivnF6+465LWSNdlJURktin8KHoLAoG32ruyO8vWz0+C/RtgN3XqyXKfPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw349PyOB1o6cDGK9mUKkMk/70REVWTE/LbLhP7CFcyae8TOUFD
	zp2RnK59Kv88ZYBbqXoWOVCDlWwXt5+DVQHzX9S40Rw/N+pqVV8cTFP1ZaASEFi1JZ2bnlHzrNK
	FzO5+Gd+z3HcezZm+4N1FJQxs0/BfNjC5lZgrmjaTP5DYoIUVMDQCDzgzSLsfr+Q=
X-Gm-Gg: AeBDiesxwRDO2G0JmN/H0AWrHlJXqJs7X3bFbM5DaTSCrY2N6Do5+5BKgRMIpv5XbYw
	wfCXYfbMwD2EuH3Buiy5K51wIi5eiDqwoP2MTre9wqmTA7alj00fJdgesp53YTAeVVqvbEdXV30
	9TiQ45w794sKd3X9zYL5AHI+2ebaR3EuCUo6uWM+d3x7TdcdzwpUi9z1b+chicvxNCETXJ913mE
	iZQroIk7RZNFs6nNHTOJhSsn8jlZGoECr8Y4aiGRA9RaUz08ybDUPn3Ho7ZDW7Ggt6Cab6j3rUi
	bvRYreJghSZ5pCHefZfGrAo7FMHMepRBG7JLt6RebteXbvD97HNsJsVEZFhH3LPZGoS74P9LJz4
	6d651496bxTeilOcU9E9+KlAD33900l+o6S0QYfJxyDaOA55+58lNn4GVwciETkAtiiHQItlBQR
	kcOTKbJeHhGzs=
X-Received: by 2002:a05:7022:123:b0:12d:ca32:5a7 with SMTP id a92af1059eb24-131969d27aemr1847319c88.10.1778086290508;
        Wed, 06 May 2026 09:51:30 -0700 (PDT)
X-Received: by 2002:a05:7022:123:b0:12d:ca32:5a7 with SMTP id a92af1059eb24-131969d27aemr1847293c88.10.1778086289894;
        Wed, 06 May 2026 09:51:29 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:29 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v3 0/7] clk: qcom: Add initial clock controllers for the
 upcoming Hawi SoC
Date: Wed, 06 May 2026 09:50:39 -0700
Message-Id: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF9x+2kC/22MzQ6CMBAGX4X0bEl/oAIn38N4WNsqG4Fqq1VDe
 HcLMcGDl01m882MJFiPNpAmG4m3EQO6IYHcZES3MJwtRZOYCCYUk1xR3V1oC0+kHEyhwUhlFJA
 0v3p7wteS2h8Stxjuzr+XcuTz9xuRbI1EThMJUEpabmR53LkQ8tsDOu36Pk+HzK0oVr9g9Y8vZ
 n8LvCplVZsa/vjTNH0AysFDpOcAAAA=
X-Change-ID: 20260316-clk-hawi-1ad4cad36d6a
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=2472;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=tjHaye4xtZ717xh77McuvoBcjHTyO4dZVWJzKb/WY7Q=;
 b=WAG/vm+Kob1W6hfEmeXQsfzRbn9uyuKe44+zOU3HxBuVk52CaTtWmI7cOyRCKprAklF4VgS2+
 cgU0shJAVh0DRlrtAq2cLtHceKxSbxgHCXgViOSPy6p63IF+8uTJVps
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfX8SvQcva3q0jM
 5na8CvnWnD8J9JOgw+bHwr1hxUwm62IGYq1Fde5/suw/jPOhSD/tYtx3cukrs7CcdvHysgr8IM7
 gCaRbgOyWB2M4kPrd/kymKtEHIpS5oVta5ArlivjG4hOdwYr2wDlvsqTC9l7/mQLCoIFNbzcFDq
 3NrGgle2cAML9INsJuUzj82lI7z/bYPZgvNIeb+o5UCqJOrR3urpp2ytEmsBO/vqdJZ/vRw793f
 YX465sUU9iHHxnkFWO0QEmw1OAbqej8MozBFzyCUNGvH/4MGeht1Fh9bXXWjOCa6Zu2Wp42lh8q
 7BIYGES+dMgxlZfjSRgI+6z7fqKDZQNZP0CqnAIHdoTrEbphU7KZn1XwM/Tu9duwOJlF4iRcYeG
 eW/InTFnxCxDv2yt9jPp4Bg4RwQEO+6S1PR5VBRkQNBpeCQ3GMOXaLQDVhsue3VTBzpmODHGjWu
 /DKASDd8KVY2EilnfTw==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fb7193 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tIqp-kY1CHwBKU6mdUA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: waX7H0Z_vLcHmKyOLgYd4JXI64_58JTu
X-Proofpoint-ORIG-GUID: waX7H0Z_vLcHmKyOLgYd4JXI64_58JTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060164

This series adds support for the initial clock controllers required
by the upcoming Qualcomm Hawi SoC. These include the Global Clock
Controller (GCC), TCSR clocks, and RPMH-managed clocks. It also adds
the PLL support required by Hawi.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v3:
- Mark gcc_hawi driver data structures as const (no functional change).
- Link to v2: https://lore.kernel.org/r/20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com

Changes in v2:
- set the use_rpm flag for GDSCs to support runtime PM.
- Use clk_rcg_shared_ops instead of clk_rcg_shared_no_init_park ops
  for the UFS RCGs. This avoids a UFS GDSC enable failure due to a
  shared PLL used by the UFS RCGs being disabled while the RCGs are
  still configured to it.
- Updated commit messages wording to explicitly refer to the chip as
  the Qualcomm Hawi SoC.
- Collected Reviewed-bys
- Link to v1: https://lore.kernel.org/r/20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com

---
Vivek Aknurwar (7):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for Hawi
      dt-bindings: clock: qcom: Add Hawi TCSR clock controller
      dt-bindings: clock: qcom: Add Hawi global clock controller
      clk: qcom: rpmh: Add support for Hawi RPMH clocks
      clk: qcom: Add Hawi TCSR clock controller driver
      clk: qcom: clk-alpha-pll: Add support for Taycan EHA_T PLL
      clk: qcom: Add support for global clock controller on Hawi

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |   63 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   16 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/clk-rpmh.c                        |   33 +
 drivers/clk/qcom/gcc-hawi.c                        | 3657 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-hawi.c                     |  158 +
 include/dt-bindings/clock/qcom,hawi-gcc.h          |  253 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h       |   16 +
 include/dt-bindings/clock/qcom,rpmh.h              |    2 +
 12 files changed, 4209 insertions(+)
---
base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
change-id: 20260316-clk-hawi-1ad4cad36d6a

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

