Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B006D3C2787
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848409; cv=none; b=suE+xbkczbThiXF5MCn+2Usbbz48XVYlqmVUjpk1iJaGcuMDNoduVqN6m+eOhxppeTtEq0q43ldqpAL64775UjGgsyG2BwvmGn5jYhtzsWVVOP0FMtv7McSp/gFw3FZvxHgkSv6eIu9617am8y/curK/zaYxZrv0cCCNHGX9TAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848409; c=relaxed/simple;
	bh=32PGj7WTH0yI8mBEak0MyZ/EdVhgoZ22IhqmBEQgUXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rGMXIAjFjWpS2QWNsC/LyQu0dYSFdpNml/S0FeSTMrw35NRns24kqHNGZlW4Mcaaz6pwKTBGm7zT7sc9ymzNUc2FylNI2fH2nP3BeQcHXJq/vBxBorrokx1nAvTDYyEWp0tf8Xotr3wjaczNrL/KSDRDsZN2Ed5oxNcFmUgYF3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TCtOPSpw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LHrCZV8v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCtOPSpw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LHrCZV8v"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXU96531904
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s32DlM/y7Ky0/WZs7Ka9M2dNtudZDdICUprdqBWO+Eg=; b=TCtOPSpww1WoY31h
	G45iPz2zPxMpGUi5FL4l9rzPEQdGK+cYG0/iX95ZAierAfo63V87/fASmgYNgUqJ
	+zyXbUapMrLsr8leI8CTroCd7Pk643F1+ZgaYb9YRkIp2/Q7gH3Qx+EMSnUzYcff
	mX8mVZRkRnT+PWfRpNG+XRLCa0S/qDenWUtiguZsktxwbONNJTu11Hw7aMdVgNcr
	ksGJG5aey/k48lT+IxAGxTBAxEEZN0GvT0+VWOhXtYyYx2GK3ULJPZGPzcORxaKb
	ubAlJCydVfkGyxfbNWh25EdLecklKBy6Zywa47UIi076KDso15u93gYWgsFmP0hh
	hhEm4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g37kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:40:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50921f7da6dso17518461cf.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848402; x=1774453202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s32DlM/y7Ky0/WZs7Ka9M2dNtudZDdICUprdqBWO+Eg=;
        b=LHrCZV8v15y/H1WdIz+6oz0bzuItR4xwOkHEPsJx9NoS1UUOgv3ITAWSTJfpERs3U4
         EYLqf/4ByeBMqSH03vURq+eS1iFY8meKytw0K9Xuq4p2FdowwW0Qam7/Dmp7gMU/CGME
         XycNAYjWJWwZW3f7TfFZJKRWddpq9yPsmejwzEm0a54iHsRgfAo7QEJRxtVY+Jhwv1oe
         QmWkE8odx+Pq193cMtJ4IyNOfNtr/VroOEADqL46f8XuCOXVrHtkJw9h42kBT0aegMm3
         QF3T6o+i9dYS0cUNMYuA7ZXaz+oZwLC1kHWM1jcTzPPozmxjlELNVeWQu++kuVxwW64O
         xogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848402; x=1774453202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s32DlM/y7Ky0/WZs7Ka9M2dNtudZDdICUprdqBWO+Eg=;
        b=KT6cKMyNUYPX4ZGltfKyrIuxsop3EC/vbIPuouFhKbue742V+QFowK/diTFxyBv1ha
         wnqlK5xxl5fsv6sz4zCICcGxHnyy8gko7hbgDWy98F9VgHfO9s6oQN7Q6lvWylv3Qa8B
         mWMWbTCw4F84Pd9rJdlbj6HmUdHlQKV2kuEvH/7cR4xt+A54p01E3FDYzA3jqws5j8bW
         oAQ8CE0xU0yC8z+qmjJ0givYVPdPDgLGZddKWtmNPHUnhRm/Q22CU7HBbZv2Ot1NNQq1
         IMH/DL+ux8D7me5wzgCyARkgD7nLwZyYOZBfQt1LwgFH04UgaLcfmRe4CD7P48bJgqI+
         3vgw==
X-Forwarded-Encrypted: i=1; AJvYcCW0TyXCVnRDGaEXqE2R28vYazib3URpq+jNuWsfLOqLKIvfDbYL2w1eUl8L1AOeLnXypCAB2RWese8=@vger.kernel.org
X-Gm-Message-State: AOJu0YywSVLEcCNmnPj5M41u9GKllDo+qkfVPKIWOzIoXnF0ja9F6wni
	hruKOAhb7dCZfhXi+3CCS10suJmK2iP18S6GfexUnui7qz7I3LgUvIBNvR4L8dl2gVMVqy4D1Jh
	bw8S8q16CQsljG5lsqfzFIuGNmyv5cfyjHnfJ6dzdm8P0uNtiYgb5keFn7fY6WMI=
X-Gm-Gg: ATEYQzwRz5TtqfuaJdQemOGFBnfQqbUi8TP7qHw3pc01cpjvM2Q1+IgDseNaj5pNxcg
	QFoyV32Z0MFuqT0rxIUBlk46j5H0PZDpQpKezGKXcB1o55Ra3yRpNYxVvjrIQQcPv/Dq4Ch1h7X
	0GXqvW3QfeNh3ZybsYe2wu0u57AYi+rmce8KONjuO4LqbPUT4+j0rvmYQxGCIv6JkzCiWmdBEtM
	p4R6PWrK68ow9ejPai9XVLU1CWrbbQP036gTsrVRrtnX4DV3Zil+G2sdpfhfukJgA5U/G1vyyzc
	S0+sP68x/+z/ZHeZvAnWD109SpCOIdamNN//Q6ibZqMX1vQhkeojqdaDW0sBPxeVPj8nDDAQ4A9
	ndo4nN9xKgZrA2ciP0ZHYJpYT8xM=
X-Received: by 2002:ac8:5a43:0:b0:509:27e7:a060 with SMTP id d75a77b69052e-50b148ba4e4mr46678431cf.68.1773848401634;
        Wed, 18 Mar 2026 08:40:01 -0700 (PDT)
X-Received: by 2002:ac8:5a43:0:b0:509:27e7:a060 with SMTP id d75a77b69052e-50b148ba4e4mr46677791cf.68.1773848400901;
        Wed, 18 Mar 2026 08:40:00 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Anson Huang <anson.huang@nxp.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Bai Ping <ping.bai@nxp.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH] clk: imx8mq: Correct the CSI PHY sels
Date: Wed, 18 Mar 2026 17:39:34 +0200
Message-ID: <177384710707.3709943.7150219544572439117.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260128-imx8mq-csi-clk-v1-1-ac028ed26e8c@puri.sm>
References: <20260128-imx8mq-csi-clk-v1-1-ac028ed26e8c@puri.sm>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69bac752 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=mLtdRAArnWS4-yPjVp4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: rHxqC_vYcA-s7LI0lr5v5bOKV3C_XUcW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfXzzEI4l3oWMNg
 puwP+JY0XWp6NiZUJ5Xg9q/bHaWaeHP4hZVoarO/u9wMgU+s4p1nYkoovYe9KAAObfB+JdYzH2p
 OcySbkrmO8h+S5eyycwiocTMpHCl5pF63fpauFOVAZRPkt5U3srYcC7qCUjvrkkVYSgl4jPJeBV
 c4cQaYtmLPGLvTE45YHr3xbewnZ8ThFvbyOKoUtsYs4j+LKa2YBtVHFrp7BB/Ovr9AIoobwwG/L
 2vQSqI7Y4tJOir0bDwyDLYG+/XgLVEIVR4WoKLGu68+g9G7ri2lCWhzi1xS0jd4/i4BbCYdV/jz
 ZlHfKym8eUQ/rgaLijFH309U/09whmZiPLd3epAYgjVEY39mTXeyLC4+ATG2fipq8MhgdPZvDK2
 kX50SxFMOUCZDF5H/2DHofmaU7SP6Pe15IoURWhIQOl4/jNHvzm2AXV5zWeXS4E141xv/RQ1EUF
 cJx+lLrCdHA0l5sTMSw==
X-Proofpoint-GUID: rHxqC_vYcA-s7LI0lr5v5bOKV3C_XUcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180132


On Wed, 28 Jan 2026 00:47:21 +0100, Sebastian Krzyszkowiak wrote:
> According to i.MX 8M Quad Reference Manual (Section 5.1.2 Table 5-1)
> MIPI_CSI1_PHY_REF_CLK_ROOT and MIPI_CSI2_PHY_REF_CLK_ROOT have
> SYSTEM_PLL2_DIV3 available as their second source, which corresponds
> to sys2_pll_333m rather than sys2_pll_125m.

Applied, thanks!

[1/1] clk: imx8mq: Correct the CSI PHY sels
      commit: 4219a54681d183a143009104967645cc252f1e30

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
