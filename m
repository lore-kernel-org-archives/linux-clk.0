Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CD728935A
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 22:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758754746; cv=none; b=UAPUp39rc0elOppeokB1KFazuYdeKIU8T/OlPt5TO0JPUConElYqv/U7xEys5n11DsjzbRac5r0ZsFwEVk2pCZlOr7OiqSYFOk/d80KRmL3xDMkB2aMrYSoRhR4rirdrlspn8hlr3QBsFWi1EFjMlQburm68qHb35TQ5xcbn5ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758754746; c=relaxed/simple;
	bh=VRmdDNff981CuK71zFSzHByDaEn7tvZTiAzuPYt1F2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mKXv7C33zgisgLqWqZmTTtgVBAOqFsUiJmEhRrKYA8hnW7GmDINf1ZaC7Ov0qZzjSVl107TVTWK4uJTg8GfAphyRnkJNLB4VPQjgDp3mEomrQpEtRaFhdXMhV6p4Z+I4SLFC9kIf2PC3E9g/rnNFfBnP+QrpYvmtKgVImpexguw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmD2qSQN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmD2qSQN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCAu3t002710
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 22:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u3OjrzALKFkPVEklOHd20q
	VfJiYmmmJvJyvK6y9PLDQ=; b=BmD2qSQNB7TyyNVpgV4DEajkSDHsYDqDjqAXgn
	mJRhdbYLIEJYbbbiZ/bkGdMCm4H8p4xAUQti4ArDRPDDdw2yrQifgBmC6myQf3jX
	Ni3iNscferVjSdDpups8LREseSggsnegx88Stz+FihWspSOdGEF+lkmQt9Hxj2w9
	cxaP0r/dv3B4d+CEN1e0LPLTMLlv+Mb150JlWGZU61hhwyf94yM0MG/4/lZwVe4t
	ZAAk/YDWVyTAvQfBkrE2jweSE7tYeTDCGZWfN++3d9UViANvcHXqoRbOXmf0eK7x
	6yshb+m9OHM1VTxA0qpDWR564r0FalbS5C9TS7h/2xFFx77A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf0h5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 22:59:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77e7d9ed351so319992b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 15:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758754743; x=1759359543;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3OjrzALKFkPVEklOHd20qVfJiYmmmJvJyvK6y9PLDQ=;
        b=sfiAlZvfeX7CrrI6vVtHOG7GSOqxyfdoSuYE14QrDuA8+7cbNqBF+s15yrSfZLQexo
         QyvCw9cqOgOZa7aVcGHU+5bhXCtuHUIad3rB3KwrmeyNbF7srHvzgP+zkLWLQ9oPVbLy
         enur90hgT6K1oQ+E95uI3+L3VQ0oQ2IN/H5/6HkZ7laADVvf8+76qLz9tVCP8nbeEdwX
         jkkwIKuX4LfGocDKGRR1Cwg/P71Gcprg7/tdX9wcwE0O8zmLUK0iptvukoQIbJN4Kf/K
         WLvjWM9xtcBS7oI2+Dz4r8G4NSW7dYrkGRze/DNcAtkxZxyjYqMUHrdtSkY6nCeTT6/2
         PkWg==
X-Forwarded-Encrypted: i=1; AJvYcCV+D89enWPLCdXXJ5ovQ/jZNU9R+gnTwOQbBRcdR5gDyf8i2b+YUyFhubZUzRlWG9XiCGammfI4E80=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkXk0d5csslgHQ6Z2DkOWr6KBmHOAhrR5XrtQYUF+I6nqMf0oK
	NCwqPJQn1IVdkS+/1Vj9x2KY++z6qa1lD56ht0QjaG3y4+t9t7qQCOcwnGktOIO2nJh9O74iyIJ
	zMCKCVE3lOr2Ju2gfLtQHtfR9fDdcEsV9AYyWpSh9qPEVoLv68X5d/be+OKvnBT3qizYUEwsedg
	==
X-Gm-Gg: ASbGncu1nA6ouaJo+PBtwmKct/ueuB8BmJzH1nWR99SVhevL0sLrLtbCHCaTeDw1v0/
	WGH+K4Did9JVj1IqxbDUlC7QFfystcBsRQJqIhQcQxoh3cPekvsMVNa266HveocZ8VYbDlzNqvb
	BhG3ZlUoDZRSpNmRryM24Y0g4XuRU4dXI1ccMiNlgCI6wvakSCJw94TSK2y6NMhGQpXTx3u+yzr
	ON+xUie2NM9MHRb51IYPzN0ak72D88O6YQMfwRrnM8Lz0H9cTqrx5pCGmwT4ReO11Kc9PM9UUfR
	UpB7vyDIoYm4GUkOgTw1G6f2pdw7+IqfGfWCmY6qfg7BkMQv6R3OSg/4PpNGHxfQRn23VqjQ1JC
	/T3CQF2j8eIBCtWo=
X-Received: by 2002:a05:6a00:9a5:b0:780:f6db:b1af with SMTP id d2e1a72fcca58-780fcea2fb2mr1423386b3a.16.1758754742324;
        Wed, 24 Sep 2025 15:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwxTp3YIwwATUL1FlU2TnVWjJ1Wgh9OSG5lv6otWYOzXo4pxbLjK//2YLzHHF3GNSQe0Eogg==
X-Received: by 2002:a05:6a00:9a5:b0:780:f6db:b1af with SMTP id d2e1a72fcca58-780fcea2fb2mr1423368b3a.16.1758754741876;
        Wed, 24 Sep 2025 15:59:01 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c2b70esm111166b3a.101.2025.09.24.15.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 15:59:01 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/9] Add support for Clock controllers for Kaanapali
Date: Wed, 24 Sep 2025 15:58:52 -0700
Message-Id: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKx31GgC/x3MQQqDMBCF4avIrB2I0VrjVaSLGKd10KYyU0QQ7
 250+cH/3g5KwqTQZjsIraz8iwlFnkEYffwQ8pAM1tiHccUTp7hgmCcMtRlcVTnb1CWkehF683Y
 /da/k3ithLz6G8dp/vf5J4DhOjdg0anIAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758754740; l=1775;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=VRmdDNff981CuK71zFSzHByDaEn7tvZTiAzuPYt1F2c=;
 b=40OtaH/1YUk1q+qTUL0VW2MAka9Q5DiyEGimgGbSG+IOuLZkbBeTh/1D81rVA+RTpSnv15QQG
 9OGNa2Q7XBfAX8RQDhmQBqne6B91X8C/qplVUaLAqYEtprbzfzs7KGd
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: UPbo8pwwzaiLmEs99tt0RcKTTsuvKqrf
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d477b7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NOZdjAmOODemH_SfJxUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX1qfficfd0A0Y
 /lOjGt9X0zqtLSjHsJUQLDkjaWm1h6xsfPhaJLAeG2f2PR6mvZ4BV6wBn2DHVdZTJ2l2XzYkeiM
 Il9mCNMoO6z6RbxrQ6Ic543u9MEG+mgCrTl30aabWlb3GLe2WFa/0yWgR6AwNgqZRwIOb1/CjEH
 aJXKqKQzom31mFLdoq/XEnoURAC4ZAeZUG1DlOE3vcqHxB1VOPOVGM5dXtH2SMt/tUAKP7kvmTF
 4mXUlWd+RI03p/VeRRNxV4wRjL2pFrQEKZH1UOoAxtjTm29kohQMZRPT8L+8DnoGFYInBzdPFny
 yhezuixYEVBWWzl6Nad6bV5xKyioJ5ndgpwi5VIh7miSYDH27TmSezBogP9951fupt07Gl7Dy1k
 tVsZE8PX
X-Proofpoint-ORIG-GUID: UPbo8pwwzaiLmEs99tt0RcKTTsuvKqrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

Add support for Global clock controller(GCC), TCSR and the RPMH clock
controller for the Qualcomm Kaanapali SoC. And update the PLL support.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Taniya Das (9):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Kaanapali
      dt-bindings: clock: qcom: Document the Kaanapali TCSR Clock Controller
      dt-bindings: clock: qcom: Add Kaanapali Global clock controller
      clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
      clk: qcom: Update TCSR clock driver for Kaanapali
      clk: qcom: Add support for Global clock controller on Kaanapali
      clk: qcom: clk-alpha-pll: Update the PLL support for cal_l
      clk: qcom: clk-alpha-pll: Add support for controlling Pongo EKO_T PLL
      clk: qcom: clk-alpha-pll: Add support for controlling Rivian PLL

 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
 .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |    8 +-
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |   20 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    7 +
 drivers/clk/qcom/clk-rpmh.c                        |   39 +
 drivers/clk/qcom/gcc-kaanapali.c                   | 3541 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-sm8750.c                   |   34 +-
 include/dt-bindings/clock/qcom,kaanapali-gcc.h     |  241 ++
 11 files changed, 3897 insertions(+), 5 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-clk-c60d94492863

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

