Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979322C3253
	for <linux-clk@vger.kernel.org>; Fri,  2 Jan 2026 09:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767347016; cv=none; b=nIei0XYrRI+HTWovzJaPHU+URV548f5wYKjmUMIsr4N7/ygUa/j+ErP6Esg/un/eE8hDgLJoo2N/o2Ohkayrj/YdaM4ewCeZc2szYzZ3I4X3W3Fx4F2HtqDK+GbEnTRuUDiZW9HHJev9TDnxB7l8XwssgXRi+xDINrCwJwdxSvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767347016; c=relaxed/simple;
	bh=XWV/wiMti0j+LrV/v/Z4jEKFQZ3FlNsqfF/Lgy82Fcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s2o3OqiNEsxtVFrQnP/9svd+c9l3IyUuKfdiTuOtacHGaXlVvo/PRGuJcUpC58KjBOEdTauBf/nKsn1XytSlyRLLXANzzC30sM2kFaNjk9BVxrsBQlF2BunY4RwC2awG89cXvTgNuQ3IJclZG29bPfKXDMVoSJC/gUUcoYEMZIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRUSGiR+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STEK9dbk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRUSGiR+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STEK9dbk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WE5D3961321
	for <linux-clk@vger.kernel.org>; Fri, 2 Jan 2026 09:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JB7hwuiRZo4xET1vDRIYfFg56T6wWX3e2ytUVrjm1QE=; b=gRUSGiR+yflpye64
	q2KRm2VriGAIlxLq1ffiinjm3E9SiwhoHA4/ABk38GUh9Au4ooNRA/ynIN4LkpcH
	Dh7IF6gwldgVjkMBaRNOAYD5PLCAtMx34oq7rv6TYRMSp4etOjMh3mK3duRycvCY
	8eXjjm12LEDS8icAAKP4jhSWhx3sK6tGc06SBrueoqtzw6gEJ6U+UOFn1Lhba728
	5wTy5f2ELp9eyHtHKKtZKb80JM3rTkzrgFWtomCbnrOzpq+Sff5wgy22WCUz8WqB
	UPBmRHnmM3+52r9CTnH7j3DWV0WlypCc21YjvURN98xjQqQVJ2gXEXsRdVY+91au
	brjlFA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v349g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 09:43:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1f79d6afso168629465ad.0
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 01:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767347012; x=1767951812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JB7hwuiRZo4xET1vDRIYfFg56T6wWX3e2ytUVrjm1QE=;
        b=STEK9dbkQXtOKQ/ldKRlHo91w+sX8HiX3PT3hArT0RLYNXPzupAbUY+pqTCwMJzYhM
         in0Jk/8AAfmdC27V7CI9adTyGch2eg6tuwMvoYMfuSDzQEfrjn/KQVH+aS7h5Abmq3eh
         xu1mq6sDF/OAFxKnCjMHNibJW4+d8WDLq9mWgsPh0Ybij7TUVU/Nj2nKixGIv0Ew/xir
         YD+/ozXjkblGnwJGFfeTTP/tcYXw8Xzp163VZsNag/deH71QK7oaY8lHPhoOqn+AIXj9
         qPkCTB8Jgxq3e3JsMPGcYxzBkor0EPTY7lCNMG4AzJie6676qpn03J2CXBssYrDpznSA
         T3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767347012; x=1767951812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JB7hwuiRZo4xET1vDRIYfFg56T6wWX3e2ytUVrjm1QE=;
        b=o/PMOKJ9bAOSAIOGer6Uaa0T5zBmlJUpNrAK0NY8CTa3v+v75ixOurzABqfnlKPik2
         FUvnpwTKFV/YVC3e72pxfsHoL2Nkvf/wnQNl91CMF7frzASNR7ynCzEC1umjIS3CHTIo
         z1UYrC/kgAoayiEzl72lxJZX2dBMdYwIxRapcnCHUXkbKj7D4txqJkfC/iea/z0M4kMV
         mR9sRP6ENXyt0NNNs0wKlU8/9FHwj6ezQBwRiqgLUkOlXzX1LW4TSPZX6c6q+iLPtQuP
         +JGw8m5xiXOfCOYgR9HscKuFw1mUfPwR3t6wkXPN1MSKfGpUrzdROFSgySstqKqWNONR
         VNBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhGOLf7/ddpbVDNi1qYq02EBydpyF5HFJE/H9jzVOinj57McF2O/C3uDOv38vqz+uFKLnuALPiSCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpVWPQAEFQIfaYJf+J2biYHg6JHgeTjJ35NyDPQEmbNK0yDhVS
	QMaju9ITCbG85ho9VaBKO0s2CGJdUO3qJ5z9st5klL8m7N2nOTXpHztw0W6aZsUiASv5pQ7D1Yo
	r43JpOQ7BHB4Qw6voRmfVuVNPe01LRyv4BGFhkDwdOnfW9I0TL6wLpp93FOZ370Y=
X-Gm-Gg: AY/fxX4ch+hfm7IW1qxNx2fiCTaP3orFlrjkihzJ7ytdXRI2D5VwVr4UWQU0kQSAcPn
	bBz3y/4zWspNlqolge+PWEgxX5967aivnu8zItatatbjOfkABWhLT+qZzCQ+SuYyQb88sTw2bi5
	fiEwFq8UIKINSpAU6hA4L5EttgtOBNWYpSrqdr4FaTPDeJKBXCrDa40coteFTXMaovcNLAOGIk5
	i3LwgNSalOI5LEQ9rgwPDJFHcqkT4WxA1CB6MIyven1hWQ39saD92iEBq6fh0bKPlqcBNS1xWK/
	GcjIy3IfK8dVv1mRya9Bn5C8szjRZI2ekIhk15mrQIyavun0gWDBKOGTZuYA5M08ZNrVJUPl6Ct
	k4tusrNBxNX1LaNd/stdkzIgcTHozvzqL6I5N8DBWqkWe
X-Received: by 2002:a17:902:f68f:b0:29f:1fad:8e56 with SMTP id d9443c01a7336-2a2f22049acmr450584145ad.6.1767347012253;
        Fri, 02 Jan 2026 01:43:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhlhtaXG5OsG1h0mp8RwKg+DT8zDGhYOuhsQqle7zgqDlMdejCBeYAk6HCuBnd1vNMjgoFSw==
X-Received: by 2002:a17:902:f68f:b0:29f:1fad:8e56 with SMTP id d9443c01a7336-2a2f22049acmr450583995ad.6.1767347011783;
        Fri, 02 Jan 2026 01:43:31 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66829sm376154255ad.10.2026.01.02.01.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:43:31 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 02 Jan 2026 15:13:02 +0530
Subject: [PATCH 2/7] clk: qcom: gcc-sa8775p: Do not turn off PCIe GDSCs
 during gdsc_disable()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-pci_gdsc_fix-v1-2-b17ed3d175bc@oss.qualcomm.com>
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
In-Reply-To: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767346994; l=1401;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XWV/wiMti0j+LrV/v/Z4jEKFQZ3FlNsqfF/Lgy82Fcg=;
 b=ZiOafuSgqrNoKWzDz10Fp18Cn71VALIMfXhyts5U4XInt2ii753CsccSOLhmicHetirjzDRWj
 Xho+N0leocCD+zTjaoK6QQ+GsIOpkeDq4s4NMJCwfR2mkWIr9an42ZL
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 6EPBxIKWrjTmlGjrpeNaoVX9SoOhF2yc
X-Proofpoint-ORIG-GUID: 6EPBxIKWrjTmlGjrpeNaoVX9SoOhF2yc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NiBTYWx0ZWRfX11Fcvv7bCNFy
 FAtHYTQwSl/IlebRIYjfuE6mrC+bSL7CVhYSRGksjrC0Xps8BiKaOvEvWeJgjJTdvLk4/IYlKwz
 6bNMx6ZHaz5HKqeKHtkUseUSIO9welhKe4DRrgLLn7m033ZgizrfGheGmo4R5Cz4TjgXD+LHtCL
 ttmX81aILVIPcI2oO8VMPO4EngrN2wKS2CiukodxQWNc7cWkh093AV6bqjwiv5/QOOQ5JgIbxCr
 FFaxY07pYu4ExyxhiklCy0D6pqwVkz4jjF2IPu90wMXrEn4cLo0M2fa5mRZo9pb7ZlYPQKwuzUJ
 0FwMnQqyiw+8u1ELXLUBy2tWSmVH8fMUAiyWB/UObYvg2phwqfGTAf79/P0JxUc/P8kXLnBiHlb
 vWuOm48UBCbdjx90WZkiktP1KRh9MNlcJghvjMyO5XEWhXk+RNvYfcHF0o5+wXqPiLEdWqcvref
 ZvH3uM+ZKqzTdBXuGwA==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=69579345 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ByFm4HHrRE6C6VNyrcUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020086

With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
can happen during scenarios such as system suspend and breaks the resume
of PCIe controllers from suspend.

So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
during gdsc_disable() and allow the hardware to transition the GDSCs to
retention when the parent domain enters low power state during system
suspend.

Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
Cc: stable@vger.kernel.org
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index e7425e82c54f2355015b58f5a25f11d2fb5020e6..b2e8639e9f09194fccde927466dab0f179e08e01 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4211,7 +4211,7 @@ static struct gdsc pcie_0_gdsc = {
 	.pd = {
 		.name = "pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE | RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
@@ -4225,7 +4225,7 @@ static struct gdsc pcie_1_gdsc = {
 	.pd = {
 		.name = "pcie_1_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE | RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 

-- 
2.34.1

