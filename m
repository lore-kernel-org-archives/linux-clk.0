Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F58382284
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844589; cv=none; b=ApPgk2eyYvvkZj3YJ+BXtCEFtA5TFsZtHEuPq0QXlSd/eTVDpT0lxRncduJgvToOhxXcm3FVm+p9NaxKSl7a5OMmeP7SSJoiZhfsu7ifZgomZD9HuegRP+v2FewDkZJQClGi5aIy1hdZDlB523WP3OtaTyws7dxLKuMvTPr1vfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844589; c=relaxed/simple;
	bh=UZqgy6FnK08Ljzgbzaz579ys/+t7E1UCslpN1WeflrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QyLy6VQx4sK/hxrTTV5ZB6UEyWalZYv/oD4m7MDq38hQM2Fzl5DmsU/H3cfA5vHGukP+EwpJPnyeOGWwi11xui+gcUpI3MnWss3/tI75D0T5OzKw3bXC9FhupFfTL57HVXrENLFbtoQsCy7Va2+in9cCmtZKKSPdPsvpiGod6ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9aqdsoq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4QVoflQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9aqdsoq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4QVoflQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CHex3236515
	for <linux-clk@vger.kernel.org>; Tue, 4 Aug 2026 11:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2kSmfxx9pQLedYg1bZqHleZ3GBB6h05xkqB
	m+3G0DbE=; b=N9aqdsoqyQAYgN4FgtRTKtquperJv9u8ixJmhUHatLdJHY146A0
	VQpXxxGrthmt3NNFSnPsuP+unIjfEMfSkzoEPY//XDG4omJ3MYdTKXAjs2iIq376
	yJVEN+z1IxA42IXYk4Y6QhmJo1XNlsdpq7qLLKenW9XAfFl/4SHTD7duJe7QyqrX
	bvyqGz6DVOdmQ7gZcY+XztszprSYmsPBOzwKq6ZuwhS54062St2eHpPW8un+fbMY
	TCjRls/2For3e29fI2EqX1S1AbadqzzyzWBycOsC0jl6zoZuI19QRvLtW90GaOzB
	MS1mddo3mD9DB1eA7hCAnIiH3IXz4lJ1I4Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu5hqteje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 11:56:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-904ee4473a8so44699726d6.2
        for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 04:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785844586; x=1786449386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kSmfxx9pQLedYg1bZqHleZ3GBB6h05xkqBm+3G0DbE=;
        b=N4QVoflQzmoMJmsCr05R5p66tDhJd3pHmYlMhgv82U+vCqhvgBIsf71EZhXKEWPNYc
         B6Cooq1Kn2ZesxhXJqnM6hACP6BS6IcZTJGoG+gRP4zVL/ViNA9Uimaqba71/Zp1YKmr
         /qdfjv9w33xt3/M8Uam6LxH8GX4XnOP5YkSg5abItcBu71DVb/VGUVJCPs/qeJhIBhq3
         UlIMfGcp1IWFWTaYa5ngAh1SkEgjOXc/AGPxmzgRi4pZoCUw8FgiBUPPTgDgkPmtB52J
         jfsmr3tGwLqztHqEBLXzJbgEQEbboX9Pcr9JiAiaCbsT9ksSjo9BCnZAe2mgoBiMPkW2
         oSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785844586; x=1786449386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kSmfxx9pQLedYg1bZqHleZ3GBB6h05xkqBm+3G0DbE=;
        b=Lxx+aAXpEiFP19gxXfGkVSwKNkYEqp6XeCQHq1LOuo7t+l0wy6sVwuPswM/hFtkOw+
         UjO/1LhG3gAumi3KYZuPjmTo9DYLYO4Mg8CaGlb42j8H+43w1ai4XLgdsKeGDicxxQ+0
         5+AOwrU5AsSVMV0nyqE8LSJQ0dhS6bPWGOHS/JyfTvqQuDwPOkYYj3kwreRUAKwD4yUQ
         kf2NNYzV4k+Wku8IxMYCpA+Srv4LKNiphv03Qlp4omic0x0HJOzOXwH059Sa/guiuwey
         V+1Ub0jKj9DS3RGg+pdrFdCJwzR0I67nkIMh3cixnMfOZpw1v9tx6pVv5MxkwoxuBSWg
         EDrw==
X-Forwarded-Encrypted: i=1; AHgh+RoNih3r4Et97rF97VsC+oEI+QjxzzGCoRfVjtfudIQAv/dIzE487tg6pSaHarD0iqLNr7jDWJAi2CY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9lUVpSthhqmNkmEPPwFPanflpDbeVwRLAPyM+JMWCmGictZod
	XGnv/0nZ+4JwXbX1V+asY8LElGGnoBiPbXB43QQbfd6cKcRf56DyRg/OR55se2CUCmJ5oJJISrL
	W1cMyEYvLyGTYJEIvY4VMOsqR6AaWFTOMpS9alBTlJYRTpfZwDr3SGwZVtRjYfcw=
X-Gm-Gg: AR+sD12hvXnhtMlSn4X7ackR2/EQvhx9IurDwV1E2bzvux4nFdPQ38d1l0vWTFRL9iW
	8v7gISukxPC+nnbFL0L4qejTv+f+NWqGqvEZmWyetU4SWt4Hnk8AZgygVlx+bgHFqIlZRYW1+Ic
	7sn3Yjhk7Zq2eRYXBlJQa9lcinbVlUnm6oXz2y2GQNXNWP1ylasjKl9ipP7GElGVouP63+kTZto
	AJ2lYRpqx0MO/W0PWuCkh97c1Yj5O73HRmze1YUZAPwTjS/wprxAeLg2nwrbyfQn8L6gTSgHW9u
	MNEtaTHlHk1qeJptLblOmvrfsohwhZjRVP0AUsSgPyycPjmg7XzOu4FU5dqYNtOEQXK/+ugFmBb
	hskBxPLDLCRx+l7GM90xCdQy38Q==
X-Received: by 2002:a05:622a:22a2:b0:519:e020:6087 with SMTP id d75a77b69052e-52b5679fb54mr263429491cf.11.1785844585747;
        Tue, 04 Aug 2026 04:56:25 -0700 (PDT)
X-Received: by 2002:a05:622a:22a2:b0:519:e020:6087 with SMTP id d75a77b69052e-52b5679fb54mr263428661cf.11.1785844585096;
        Tue, 04 Aug 2026 04:56:25 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458bb4esm41800790f8f.30.2026.08.04.04.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:56:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v7.3
Date: Tue,  4 Aug 2026 14:56:10 +0300
Message-ID: <20260804115610.126049-1-abel.vesa@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5NSBTYWx0ZWRfX+5FWriU2eaYS
 BCaGcTDMlPoRKX07A2hDxiT6LlphRt1Wv4ajCy1XsWkRQyogI+b9FB2L9KnPRHQ5iPMs7VXqxaa
 ACZOvGhu751f/QHv44itfhbJto3BF/E=
X-Proofpoint-GUID: uItVgtF-xlaREJUGXtrD2v_Amh6Tpq5F
X-Proofpoint-ORIG-GUID: uItVgtF-xlaREJUGXtrD2v_Amh6Tpq5F
X-Authority-Analysis: v=2.4 cv=EoniaycA c=1 sm=1 tr=0 ts=6a71d36a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=00X7bdE-9ZPR_xdJ_qUA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5NSBTYWx0ZWRfX/D/EgEZtsJdb
 a+UHb6JLMEMCw+DJTZJ72rH9on+Ds3cB0DPMNwdzoDeDm6DnNFy5Wzonrx3OBvgj1se+zOj5aww
 i4RldPAGfiuLYIrF2JB1ygBqNzrGlDxmAqz+y/HB8u9+lSGWb0kU2dTJpa1iKe9m8IK224pKmuR
 f8cZh85pBaNuF18sK2koscrqlufc1kjD0pR3Nh7X/3gIPKN22Gfnv6BDDRWBbEHD/NIiAf2TcPK
 gGCUHXQutDAcXDueexkLF1pPd7N+ZTQzsIHKEd2V9a44hBixG1g5J457vG9nO15/f39qB43JpdV
 USCR8noCt1i/OgIr9XWfsyCvATfuOjKkIrC+zC+kr8BNBTiraFUeElZKR+phYGsnatlS0HD8y4Y
 fqi5qR82ledSk0A3f9ugcwA5IMqsg51o9lCMqALAgHBrvc1BEsisPgxWyfFgNPKWoD5YqypJeq3
 qD06oDuUqkeaRh3d0ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040095

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-7.3

for you to fetch changes up to 39ec460b56b26319d1f31b459e8be7ea34ae9c67:

  clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on i.MX95 (2026-07-30 17:12:57 +0300)

----------------------------------------------------------------
i.MX clock changes for 7.3

- Add audio PLL debugfs support for K-divider control.
- Add missing MODULE_DEVICE_TABLE() declarations for i.MX8QXP clock drivers.
- Add PCIe FUNC_OUTPUT_EN clock gate support on i.MX95.
- Configure the i.MX95 PCIe transmitter current reference to fix REFCLK
  rise-fall timing.

----------------------------------------------------------------
Jacky Bai (1):
      clk: imx: Add audio PLL debugfs for K-divider control

Pengpeng Hou (2):
      clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
      clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()

Richard Zhu (2):
      clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x PCIe
      clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on i.MX95

 drivers/clk/imx/clk-imx8mm.c        |   6 ++
 drivers/clk/imx/clk-imx8qxp-lpcg.c  |   1 +
 drivers/clk/imx/clk-imx8qxp.c       |   1 +
 drivers/clk/imx/clk-imx95-blk-ctl.c |  21 +++++-
 drivers/clk/imx/clk-pll14xx.c       | 123 +++++++++++++++++++++++++++++++++++-
 drivers/clk/imx/clk.h               |   1 +
 6 files changed, 148 insertions(+), 5 deletions(-)
