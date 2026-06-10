Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5CB21CC51
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101172; cv=none; b=q44dCD91N/jwwv2lxZfqjtckt0pOwVmr1uJw+VgcNFuOTRYu9dq4wV2jlupoOXcmRosW/hx9ThEXEmC/pnkF0IkWwd34klf0/Fi4NLz2XMxc0vlxzkm6mJ/iWUKJxNHgGt6k6xMgjzzlQLeeX2xm4hHUrvQTSio0arr52lG8F5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101172; c=relaxed/simple;
	bh=BHydDdWssIH/8J9hIwO7sc+BUM+ivEQ/ov/D73DlQhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V6yyCVLiAkBMKe4cHrzi1Ww05PhDtQ0GT6wgVM0Ra7PyHRwOgFA2ARNr5ywAkhfYh6pgYuqZktBa/EZehp89mRVvs+6izQHkmPu4RNX/H7LdewJAKyItQ1eDihh2pV5G4cyxbD9y/tOJxwJrwGo6upN8RO54hEqNPnFoLkBcfGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jp07/d+f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MpvN9ZkO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jp07/d+f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MpvN9ZkO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBgKT3763392
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 14:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Cqy9KYrGD0bxStd7rfjUeL
	9a35+ZabdOdg6fhipUUHA=; b=jp07/d+f+uIhIPOPV+mV35qeCLGwoPgF0bCdCy
	7Tt30ndMOXyX3c9MoASKCbdZTAP7mynr+cm+usNuiQwmpoivru1mj8fP1Lr3xoo/
	W0xYvy1/zuxrcXO1ZQrNOEqg5CgUTcVIBV7PQT5C9ZEABq0X5RNXecib2l30oOAe
	jX/Ba0CFIb6jHebqc8UdBzrfl1u72X7xOfuSOGpO32TRGHIe00ySSGT85G8m19HG
	wCiGKMU630/EPGYubfwS3IOtN1xTPy5d5Y42fPIFYMHicSz0EOb9tC4gOBze2pxO
	uDIHTjVb8GKkfQP+8tUPLlaPiyGfRBBj6FJlgaJAoI4G6VMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnetuph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 14:19:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so49115735ad.2
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 07:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781101169; x=1781705969; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cqy9KYrGD0bxStd7rfjUeL9a35+ZabdOdg6fhipUUHA=;
        b=MpvN9ZkODVtyORRvdTuYuVplqdoguUlyfW5JOiq3QDx0msXc5v90xk4VJ9kpvfPiUB
         q9e5xGt2Qn6N6nqQVRx7W3JQOpYvL2KCE7y1oXkOmJ65UgGh412zyLSmOWiQ4NzPltkx
         /0y3s5ZqXIxCuw0ws6W+3BW1V9ovGdf2TN/zLfeahs/HczDrgEC8a5NULDbpbkkbanTj
         MJZ9mEkx1yFcHZufrPKTCj8JDSBnplYUvqxdrj3opbBJB6tV0vGBVY3IuifVGe5G1UMp
         ZvhRrdl2PHBplSluznqvigM96zwSWc4WjPMDh8pud5L2VTUskiZaG8bE4KKaU+Njs7WM
         +Zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781101169; x=1781705969;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cqy9KYrGD0bxStd7rfjUeL9a35+ZabdOdg6fhipUUHA=;
        b=gGNabKH3JzzBdUqUIqRn9nl2ehpoljZXZa7ECmrPp9wL0lZrYiwqnOMqVjW7KLdg1b
         F6HekKKZDXuBY+sqnvSf2XiwzbvkVkwxibbdFBvG/agdR+GSt90aR8I9GhVF805zkRO+
         dTPPYkoBFsoJPDlYojMp7titATwjud9AsxeudoeFJqSVWjhcFXJsb0g3n4zdAMhj11og
         jjxEnv2uqcvKdG6tqdf1nxhzzUaArAbEYJHk1aKW23aFqFncnzmTJC1/HgjWYmPx9SzP
         V6GhqXII3qE6NhYIimetKSB7wtrDnbcUFimsKmjVt7KQBu3rJIsISZy489WSDPZxQyKn
         DwMg==
X-Forwarded-Encrypted: i=1; AFNElJ/Gc+xVkqB0zCfBn1kCnfG8y8spnlJ/pZcUVTUdUjbS/pudzPDuK13hWV8dhKk/asvUkQOfk9Clpec=@vger.kernel.org
X-Gm-Message-State: AOJu0YxANnyzrVIazJ2QSgz4tGdkD6p3/5UlpHfNA/QJ3Onk1jyoVkJ3
	fW/H6PJbKkfALXF3KlFGxbZ1GVhpw5+0yUbMl+pXgK+yuHfNwgW5Mh8Lsou8r7e6LmbJCUUw322
	ztpiMBQf9TbIu9bXL8jgLXokScx5bC3QPy+BQjuDMk4tJPH1uZtzCMy3NuSNFSkQ=
X-Gm-Gg: Acq92OGeMZ6BL8LN0mzYskBi1g0R8zRuMM4WyMHK92XLuciJCf/YBt6dUHWj3QyhDsm
	gQdU/V5nMsZ0vq+Oq71UdQMDL+bFCwXyjwYqenI5oaA1FZwQ5qIdb2wHUOsY+puUio5CkGFn4sc
	+7ZopMKr00ashPeXN2iM2U1owvALAP/fJqzniSwhgGC9EpvD29oFa0phQVNf7iQ7FWkadrfH35w
	rxiLJW/530KgdkMHD2sgVLXBxrzlgW3GL837x0yVEaiHQMuLK6YNC0+tCxTdYPi07vWBJ2UA1Bf
	omn2SAFVUn0rjXRaeV3qhKobDacUXTUpmxqWKHXBAmS/D+EGkgemBSJSroV4vAi6t9taCiXPWHA
	9Lg67Q7BLiXR5y0zsgoU54T4fYCgmg++CH3M5vlbOjGc1Z0n0HhUc6UyxRpGotloFbRP3Z596sM
	KIUc3kpHaEVB0hZHVfvGnBJV3BCGMXaUBgPh8+7/4LPTwhNPnT3ESLnThqg4fu1oHlnqU=
X-Received: by 2002:a17:903:1aed:b0:2c2:245a:3364 with SMTP id d9443c01a7336-2c2245a35e2mr208250615ad.32.1781101169554;
        Wed, 10 Jun 2026 07:19:29 -0700 (PDT)
X-Received: by 2002:a17:903:1aed:b0:2c2:245a:3364 with SMTP id d9443c01a7336-2c2245a35e2mr208250165ad.32.1781101168976;
        Wed, 10 Jun 2026 07:19:28 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm241212965ad.73.2026.06.10.07.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:19:28 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 19:49:17 +0530
Subject: [PATCH v2] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-ipq5424_drop_clk_ignore_unused-v2-1-15240af073d6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGVyKWoC/42OQQ6CMBREr2K6tgTaAurKexjSQPlAFVrop0RDu
 LsFL+BmkpdM3sxKEJwGJLfTShwsGrU1Adj5RFRXmhaorgMTFrMsTllK9TilgglZOztK1b+kbo1
 1IL3xCDW9xlUjLjnnKgMSJKODRr+PgUfxY/TVE9S8W/dGp3G27nM8WJK99/fYktCE5qAyDlzkD
 SvvFjGafNkrOwxRCFJs2/YFa9T+7eUAAAA=
X-Change-ID: 20260525-ipq5424_drop_clk_ignore_unused-90bf48733c6e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: xXAlKuEntWJRtnuLjb_HDqD3Y4S5bCfW
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a297272 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8
 a=20KFwNOVAAAA:8 a=xjaQWaglaTHDcvof_gYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: xXAlKuEntWJRtnuLjb_HDqD3Y4S5bCfW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzNyBTYWx0ZWRfX8Q+OuX4To/C2
 LamHAsoMA4zkVxGIyrAcDjVdpqJhuPgEBmpUaisAt5AlH1hYLteF869aWR/b5lEAoFm2jbBPlEa
 rwpyrQxkAZy61KSxucogV0ymUU5LfIKMHpfQKDq1mxt2fg+lQnXE07ii/5c/J/ph8sR/FhaCsK6
 RaQPjfQrIB0beU2v6C7u0AhuoHKTa8Eo6Ysxx4vJOz6LP32O8OGFvmX9iB5m5XZyjZC175ZQVeL
 F9KJ+p0cbAkGRqH/k4R4abqmNr5qJ6PH5Wmg4A5+N2wAE1IlLRTaVyDYeIayOieABt0iA5dIunG
 DJNVq5O9pLgH1wtkpHjH673O4T43suU6Eni/vx9/osK3T8XgaO2cfIXw0toHah4gDzxnKuAvoWC
 epKyMViOlg/eAvfAC9IAkoBIs38ugMC1UqYZAd5YL2WCWbztY0/p83cUiTXydWQwRvgeFAMa9Ma
 JzqMjGUrX3jlXnYJY9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100137

Since PCIe and USB are enabled and consume GPLL4, there is no need to
keep the CLK_IGNORE_UNUSED flag. Drop it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Rewrite the commit msg to include the consumers explicitly
- Link to v1: https://patch.msgid.link/20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/qcom/gcc-ipq5424.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 35af6ffeeb85..3ddd4b3aedea 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -139,17 +139,6 @@ static struct clk_alpha_pll gpll4 = {
 			.parent_data = &gcc_parent_data_xo,
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
-			/*
-			 * There are no consumers for this GPLL in kernel yet,
-			 * (will be added soon), so the clock framework
-			 * disables this source. But some of the clocks
-			 * initialized by boot loaders uses this source. So we
-			 * need to keep this clock ON. Add the
-			 * CLK_IGNORE_UNUSED flag so the clock will not be
-			 * disabled. Once the consumer in kernel is added, we
-			 * can get rid of this flag.
-			 */
-			.flags = CLK_IGNORE_UNUSED,
 		},
 	},
 };

---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260525-ipq5424_drop_clk_ignore_unused-90bf48733c6e

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

