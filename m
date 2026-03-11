Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBCB3C9451
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222412; cv=none; b=DKCIw+KlqZQ9y5O1Hmups2/Rm6F8Wn0joY904ceksPEZxBCNdFkarsvEN2kIfcBsGtZ2q3xaQSONg1U4sTZgDIFlda/gXsIJvQv5YEWtx4YMrzNu6Ls44pOqq2JU/3/zdhSAX6usP5JWbVdxMUur1y/2Rf9t9oTcqANxv22/6mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222412; c=relaxed/simple;
	bh=xRVBcUcPQn/3XRwGa/LJ62R3q+1u7kG4HqctFlCN9Kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=exP641KY+9quqa+AOfKvrDNwh/bxWKyFOsDzLS1KMIXx/p0BqJqzLYrncy8nPu4/g5uogkRs2/lc+iclqL3lt/Iq//g+sNjKfrmQ90D7USVMxDd8vKq/xHpO1WWh4somUUVlITiddozpP1RlFCtJ2UdUUvqIiNqgBU+WygqyD/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plq45vbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWlNVzX8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plq45vbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWlNVzX8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B8asEO248813
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 09:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GAqPvw1+mNYrygeKcTD6WH5A0ur1DU2x0eDKSc/2zAc=; b=plq45vbuOeZdbTz2
	YBRBl4dde8USmvzjrV0gLoJ9v1z7Yu79CoT6b2Z595ySVwRpzVEn3hx7NL7JDijA
	v/iz3DF2TUus1h+dJPYDBvNJu3qvGWExYrgpaSLNEBaR+XGyZnkDge0V0lVbeAbI
	WoV39tWsTrmMvAEOqXrOykPZ/mcIbGKlSCT9flCiv6LyGsGOgjF9bOI1mLm1oFzH
	B/IM0UEwseJfJvXwUT40BDvg54Y8Vbmr/iLcxeSFz5HYRolVor7rPIAPUzhNx94H
	LeipY2dPqCPRNTxPEOi8OGhv/ZWKopidr/BfmTKKdcnBCyVow/asVBqkCBT1yJf5
	a3FASg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv12vwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 09:46:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829a535ad50so2149456b3a.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222406; x=1773827206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAqPvw1+mNYrygeKcTD6WH5A0ur1DU2x0eDKSc/2zAc=;
        b=dWlNVzX89bye9ldvn5tmCJDnz2HVD4yiKJrGsbc+HRzI/XJrKHfrc2IcVQwbsgcK+t
         Z0gDCHzDW6y4W1CJf8EopIkS1R6g/hYQvVcouDUjM6MQODmwcGUcQnKpPys91bCsLh6f
         glGDBI936Y7nP5BNsrN9YATTQB0HfMafmvvWPjf1bSTwokrD2DYaxKXFkUKIkFb2M1fQ
         5hITU/nVSydJcrc1Bm2/EKUeFpw4YpQw1GwSILIJDcvLhCWy096VcqUhdd3EHFrLKmxE
         XDTEStdllbJeHkGZckWhwHGC4OhrCdrih6SLAp5N0rQ80/9HRYk65YS9LPiasPGv1f3D
         9W2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222406; x=1773827206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GAqPvw1+mNYrygeKcTD6WH5A0ur1DU2x0eDKSc/2zAc=;
        b=RgL4/85CNHfpcmiXUNz3YQBPbZzZCMP8F7vh5BisY91prIlXEQ4uoFRui/P5f9z+b8
         ol79CrzjfeP3YtSscojdD5h/8+tvqgpwqw/J5F89sLcstIrKfH6IVuOrgvL+0ttoVY6o
         O05A5fSri1xPr+PZGJt77qYPa/YOrR30WpUy07246hFJgWXE7Ksc70fKIDvuiwChA4Nk
         7fDHNJzSeo0Egd0qEeGQ4AqynweAJEF9YRRdnVP7HEJgAUUlzFbNVxsTOYYerDRg4Z52
         2W4l277iAeTCopIWbCB9j1wTkEz8NnIhNncSZF7AV5PabmNLToH8/wCrvtPNVVMNaUSl
         dpaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaSdghOxE1wmHE1e7j07oTGnlt/bLkvB9s3rzCP77kw7P9SDdzIl/q+1L2fSx0RE2XH2XdAFGFFzs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz83ZUznu5RMUQUteVvbAueBimbb6ctQK5hdxgSP+43gpSs/LqM
	62023OcBclLevDtTXlkPQXz+weBAsctSv4Ii1IyUWWtw0TkKspcgxkaVYwBWdZjCbLihEst2XJB
	vOxFOghXG5FQAlyc1KD4ie+g1XgSwxRhSZ2bb0Qk12vSXXqOD8U8abuCK42+3LB8=
X-Gm-Gg: ATEYQzzQiEwCEq8YpjpeldQLTTKvt2yGG6OA9id6OBH1lkzVtXCYEWgR9X8GGOJsd8+
	UvXPX5NIiQL6pUq6Y5/CTcl3mqK7Ws6ZK8eljnpnEO2JcgoConycXWUN2P1RdZwZuixyMNK990K
	3wMmhqQZG8PmDzShyWXNEp4g7UpVMSnCnYQKTBqdrJD5di9f4fObB6Wt8NgUcwApbxT8iVWKGWA
	YjmV8JVL31Qniz1J3HZi7mwlD9SKEq8ixn08nrzwHFWLVz7SLmSjeWo+gtZL0Uw0OWH+FtuaLJH
	XVUMXuzTUS3ePREDEPQlHW62Hpt2/jlGQ/SET9Y4xn7hIdlllXB4gmqf0KCh+Jhi0wb49US6z6a
	/2AvWyJHHo27jM6IVjFE7d1xRhtlOCHUc22WYYukZKvpB9VZRczk28emAdmoflfgNGFYwkcAH5o
	+SpKBC5TeQjh2kRASBHNPTdZ3yNODWLpb1j3rBVoYsOpLLnGPTldm9rv3U
X-Received: by 2002:a05:6a00:1990:b0:829:800b:9d6 with SMTP id d2e1a72fcca58-829f7250204mr1685291b3a.57.1773222405951;
        Wed, 11 Mar 2026 02:46:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:1990:b0:829:800b:9d6 with SMTP id d2e1a72fcca58-829f7250204mr1685271b3a.57.1773222405481;
        Wed, 11 Mar 2026 02:46:45 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:46:45 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:15:51 +0530
Subject: [PATCH 9/9] arm64: defconfig: enable IPQ5210 RDP504 base configs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ipq5210_boot_to_shell-v1-9-fe857d68d698@oss.qualcomm.com>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=983;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=xRVBcUcPQn/3XRwGa/LJ62R3q+1u7kG4HqctFlCN9Kw=;
 b=46hwhX6Fzw1ORCbsBk9ce+pweRqE9HfyvYl9JYwhPPyKeDFkwXNmr5mWVbAg+j4pTHJbdVwTT
 qb1r79eB42vDxit17ARd9vUNhYfNk6Kyt+cNm8jnJO4pzFxJlBimfBB
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfX3QkeTTluJROp
 udQ2+RPPQBWQjo56DrPGkd77G1sxJV+sbarzDY3ILgvMID8Y3CH9SrswE7WnRykYqNYg1lJuGMy
 /qykIc4LVwbrlcQQqwTWqjWDHHVU/zToEl7WllwGy7piyYvn/43In/71Z9CjzlJArewx6hKBhJk
 28gbrVUBCBnIGJVW4/cnVt8uzNnyGBhaJqZaxFCBXu6YWfgIw8iHDYMK/VsC6Ynh5DvQ4PULSIX
 27C3jhTKKED9RCfdYGdG1mc3hsKxDmOrsau9EQ4uwwe/7Zt+SGOaIjFakZx4hxIYflOwsRWZHss
 L2CdQLRJYbuBbQREiNtI/a8CjWLQrzDPCt1/u0eKmBSsmDXFnQo7U/y9LcWNpp8HemBmI6iH4A+
 YwBLv62yk2PL+a7hj0WG4cmw9Oyk70flrHVQqr+vxz+eCNRnJvoXwFMOrQjeeYYPBm8r+9Z78Mk
 J91uzpgZlWx1YNVZySw==
X-Proofpoint-GUID: 5Tkztmtbahpvlt1aXwHaipWJQ8DbPgZQ
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b13a06 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 5Tkztmtbahpvlt1aXwHaipWJQ8DbPgZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110081

Enable GCC, Pinctrl for Qualcomm's IPQ5210 SoC which is required to boot
ipq5210-rdp504 board to a console shell.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee854038fa7a756d8b650a609258bdb3..59c748efc1ca8d6eb7dca19011d2a31d926a0d43 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -649,6 +649,7 @@ CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
 CONFIG_PINCTRL_GLYMUR=y
 CONFIG_PINCTRL_IPQ5018=y
+CONFIG_PINCTRL_IPQ5210=y
 CONFIG_PINCTRL_IPQ5332=y
 CONFIG_PINCTRL_IPQ5424=y
 CONFIG_PINCTRL_IPQ8074=y
@@ -1476,6 +1477,7 @@ CONFIG_IPQ_APSS_6018=y
 CONFIG_IPQ_APSS_5018=y
 CONFIG_IPQ_CMN_PLL=m
 CONFIG_IPQ_GCC_5018=y
+CONFIG_IPQ_GCC_5210=y
 CONFIG_IPQ_GCC_5332=y
 CONFIG_IPQ_GCC_5424=y
 CONFIG_IPQ_GCC_6018=y

-- 
2.34.1

