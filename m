Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484133126B9
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199562; cv=none; b=jEQZcj2xjYKVgtJaZW3jzS22eWfDqs+sBwZiT/LM1xYQkSXBMqFD+8wHY5JQXoeML53SXLT+1kU1r17jDjc9FT2xzdcql5QuFaKFtpSiz8d7pvngaMBYV0QXnw43JPADwAR1ls5bOKOTp59dwyBDOC1T7MBYZO8P1D7gJh0g0dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199562; c=relaxed/simple;
	bh=OUU7OK9YE9Jfb0AE2YieJ2I4YzAyP6IB1JzP3G2aLvY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P2LXPUCnxMHIv4pnWFAQlfNY9hvJUERJiOeAsaWyaXMvMCWa+57zoNxTWzFgPO3BQNRTVlg40SYyeMBQXxfxtsy4evYbn5Bx8raN0ENTIy5kCU5F20BYsO5ltR4zfySR++3COGU/T3fPPhA1OICWuvcwu5mDwgV8HHTqiPfNMuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQEBhhx0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJXUx7Ww; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQEBhhx0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJXUx7Ww"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rhdk3490967
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PCcxVvvgE0szZTEQzG6Wmp
	gqiH35UZHZuwegW/aLEjg=; b=NQEBhhx0kZ0qkA343cScg2sTCLkehFkUJTpRsf
	QRzI59PSuoawp6YJqlRM8IqVs9Og2OzbM/J8iUMx8EoH4J6Si4Zl2XL65Dxo9nQ/
	t2U1nYbKs3c5HKfVe/K0Tf1cINeU6D33j6ydH5uupGaan8Bk88f/7OMse/h9+rMc
	4ce8b5Q6/B4Pp3S56Ah7ExgwUYJS3ptRl71lXlYsRvtsfDNS6hjUo9T71ME4Oqla
	di1DZs16cQulz5nvIAF09WiZsZzYKQMLv+m0830smYTRPBCq+cGQFBc1bOM01HmW
	Th2zfRfBbt2pfm4+ctm87TdKTAyOQHToWSGxufupJA2nanEA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3phq4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:59:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca3673560so120658465ad.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 03:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784199560; x=1784804360; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PCcxVvvgE0szZTEQzG6WmpgqiH35UZHZuwegW/aLEjg=;
        b=IJXUx7Wwcl76e7Hhb0HF6/zMyxA4/EPeIZ8qfTPdqoZgfMlCq7xCgUp4IhAfvDuVq0
         VfJ5R5Evmfqprlv3UQObp3ydvJ6R24mGap6oQokDpwJTOCL8Mm4e9HXnDk99JuJLWn8n
         uHluXp5ohGnUrV/8K+Fn2dUrfcrncV0To0YotikqIjDY+LCjGgRTxN1sAHldD3acqhJZ
         hfn83dCqF7avvrHYsyBJXS1rn8rS/zDGv0Defts94/rBb+fgcPMmR20/rZJ898nrzY4Y
         A6uEp5aMmGDYTc/vakmqpl+k+IuxF7aXuTy0mNPDhH93SfmwIOETdaq6A1iB9IyFB63c
         w5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784199560; x=1784804360;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PCcxVvvgE0szZTEQzG6WmpgqiH35UZHZuwegW/aLEjg=;
        b=TNyQGyiiBXRcBIqpbJvQFbxL9NBwlNx/TXezsj5O0/SMe7SKdD5d2peh+UA5UgdhmI
         dX0URX/T+SXQXUDSMPrvY4SaOth9Ck6XRSA+Y+a5cxpvcDMYDCchAenRc87XujCd5a2X
         YFU2dWw6HDQmDr26k/WBB84je5rRJUSVmRkIT+A5jFi6g8PXfp94yCPA/MUx++QsaY0e
         bkt/0l9ZK5bRf1nIJ4h1SJ/Tf2LrNp1iZdYl/Hp4DpMVTCHv52e/ASQsnqLHomZ/YQM2
         E92XA5nWcD8TuD33dAwVofTv18OVtwZg1YQchFSNJGnLzxAW4uIygBDmqoSWRotjGwVc
         FT0Q==
X-Forwarded-Encrypted: i=1; AHgh+RoXJi8P25PxyOZdhsSWKqrbSyfEwVAEu9Ia0TuesiaGkmpJgMb+nnyNUL0+lsL2u7DGEJPPXe2/SOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbiMsnfxdFY9KMX9R62koiY2aQMqL5wADQhIa9uSV3iYaOAFhr
	gQk8dc+dm6z2+ytNUzrvq3WXoBcQGPqT5TkW4FNBXfuFijBzhV6hknsuq6pjRI8l6FbuByDshuf
	S943mTidFoawVjrQpPtbwT+NN5VqC3hXcbOfkEjpNf40nTw462xSd94sMrXOfYFs=
X-Gm-Gg: AfdE7ck/xMfIYeWsuKN3zG894o5maeKbfaoMAuDlP4NexNxQ4hudhCM82Sa/cAJkkFc
	cC3wxyoR8GYeZ6Oy32a7nK+iG+t4gyLMKOt68kCHAG4A4thUmOFGeW2WnESRpTaDakL070i6uen
	GgYkIJRD8wECwya62mv/3OIJenaIwdRtn5CKhIafRw9Ioc1J8v+tC+Ou1Xs71xjlybKX6NkDlCS
	GpiiqmmClXyj/kv9xiBLTU83r+Cg0hAUukuZpPOFmXXcfl07AscpSTLduzWLeLi6/M38H8yzUC5
	Pq7xTWZow6kia4LwnNPZssjOl9IC62EAnX1FX4xNkZndCGDvt/mjCGOkJgdir9wz4TUxV+8mX+K
	+gSZoUukiLRr0mrEX1xzIrQKq
X-Received: by 2002:a05:6a20:6a0d:b0:3c3:9cf4:a982 with SMTP id adf61e73a8af0-3c39cf4ac17mr187288637.37.1784199559787;
        Thu, 16 Jul 2026 03:59:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0d:b0:3c3:9cf4:a982 with SMTP id adf61e73a8af0-3c39cf4ac17mr187268637.37.1784199559329;
        Thu, 16 Jul 2026 03:59:19 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432e848sm11175385c88.9.2026.07.16.03.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:59:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: nord: fix PHY pipe clock halt check and mux
 ops
Date: Thu, 16 Jul 2026 16:29:10 +0530
Message-Id: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH65WGoC/x3LWwqAIBBG4a3EPDegkgZtJXro8ltDYaIQQbT3p
 MePw3koIwkyddVDCZdkOUOBriuatzGsYFmKySjjVKsdTw2HMy0cJYLnY2cvNzLDGA3beuuUojL
 HhD+Utx/e9wMOKnhVaAAAAA==
X-Change-ID: 20260716-b4-nord-pipe-clk-fixes-e221e57f5600
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: PUw0cm-r2RM_CVwVzO_3sOhD5tH7VCEC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExMiBTYWx0ZWRfX7HoTEk4z93mE
 mpYh7hekRHsmxK8Nx48guKETdXTsXYlvjotwy/fH1EeH2UE3Nmieyw+jH4D9yfjnLYViEgP2TNB
 IQw76cfPrG5QC/8Ry9CK5ipdQdB5ZSs=
X-Proofpoint-GUID: PUw0cm-r2RM_CVwVzO_3sOhD5tH7VCEC
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a58b988 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bJPzdAgbT_gtugSychwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExMiBTYWx0ZWRfXz3r4KaB7qJNi
 Xm2fQy5kArYmHc2YpNwq3Vg0PLrR/O641k9+MPAQ1u1FkKjZIKWoE+6OtV8bLuBVdIz/dz0JgbB
 jSsUQgRxOQ7nJUuuCeLaLgXPSwwQZNrl2gcPmNiVvmaEdo5dVXtCVevnhUhRZSps+6zsXuUlL8P
 zSzvX6vNI9w8EEbfv53WGE4UwbZmNeyVRvqSUGdkaZPB7jMnTxL7J+dZL59l36EFGZfaH4Zx8Pg
 Eq9MuZJTzh/0JPBUub1dEpUOxYq4ncxMjfkaVSAQ/r+ul+jD7jJ6pOwwUwqLGYO+IPZ0q/xX5Jd
 Yb76J/EPbAY2qJAGoj0rHJ+TNsP9rUTOFUCQjjAT9BhK/sxObX+Ljapc46auj97gDc9+4toFrSS
 pIPOCAYtZJzV3qDD/O3NySThKe8pVtR3PPjng4RanWvNgEf9omxpHoZMNHKtKgdP+m8a40R2yiE
 e4KftuKDXZgErElhHag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160112

Fix two PHY pipe clock issues in the Nord GCC/NE_GCC drivers: the
PCIe and USB3 pipe clock branches poll BRANCH_HALT_VOTED, which can
spuriously time out since the halt bit doesn't toggle reliably while
the PHY is down. The USB3 pipe clock source muxes use
clk_regmap_mux_closest_ops, which doesn't park on the reference clock
when disabled. Switch the branches to BRANCH_HALT_SKIP and convert
the muxes to clk_regmap_phy_mux_ops, matching existing conventions
elsewhere in the Qualcomm clock drivers.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      clk: qcom: nord: use BRANCH_HALT_SKIP for PHY pipe clocks
      clk: qcom: negcc-nord: use clk_regmap_phy_mux for USB3 pipe clock srcs

 drivers/clk/qcom/gcc-nord.c   |  8 +++----
 drivers/clk/qcom/negcc-nord.c | 53 ++++++++++++-------------------------------
 2 files changed, 18 insertions(+), 43 deletions(-)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260716-b4-nord-pipe-clk-fixes-e221e57f5600

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

