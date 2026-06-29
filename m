Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D99395AEA
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 19:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760982; cv=none; b=Pmh0Ae1topyz60mHDbVycK7er1DTgCwSc5j048Sgj7qzcaG5BjHNn5hLT67/a1G2nm1gzj3aSOLaT2Gwst7NocOKp4Z/LGIPy3HE8DuO2lhbajPZnHZv6+8yl7pEA8t9ZAAvE1n7wpSzc1A11YcNEuIBAaNAJIyfppXL5XVFFqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760982; c=relaxed/simple;
	bh=+PQamnoAoh8bSN/wucxyeWwCZ87gnEd+NZDKavs8wAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GFU2U1JenXc47EMeSlU//42K3lwilDqjUIy6p8JNQpRXf4QEISPDf/h8/GBGbmY5cpYXp/XiEK2DKfyo+SEgfnOdBtELh1vb5xwriS20thkddluP3jZk0BpBuKMmvNRdnx8rXdrFHSIs/2aPVUG344BD5sQOv6BZ6XGAW867QQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kabmzHR4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcPfNPea; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kabmzHR4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcPfNPea"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGK4Bd3380386
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 19:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OijjlcajNSAACxDTq1b+qg
	0H74TStsOEsCUTaQJgG1c=; b=kabmzHR4ACxyzUmXM4GKj/ZBbfz8DVbsRx4Am7
	Od+wvds202UNbjLRC07PQa2aJUW5mJzthTNbbw3eYHwnHnWJld+yc5RU7zNuK0MQ
	AlhgY0+A2g61sRkV5eDziKj60xQc+L5jhbQUnEu/mjQ+ztayC6gQ51rTiDaRQd/2
	TCdsgG+/92RO++594gud6zsj6sa3GDG5mlKl8aPdWFwIgVZESyjnHugyCnPdKpK4
	AY49Ctce0N+SBv+w/Edd//ZR20dLQdFuiMSZO5v8UO2ixh768Jol59bc9W0jXVyT
	4DfIkCC6Pugz07OXB3v/AOMQqVkspBwk4P5xujFr+sM/VTmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7k8h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 19:23:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e606e8f3eso80789885a.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 12:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782760980; x=1783365780; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OijjlcajNSAACxDTq1b+qg0H74TStsOEsCUTaQJgG1c=;
        b=ZcPfNPeaqVsKBDj71K9q8zh2oop41N6by9BXAFPE+gcPs/VpNJMqcYmMPwL5LVHJVh
         MjaVKLjP2kKD4OdC8SNA8lDqT+uqaaN9rG7qpaUyHBa+hASb3FWVZw4LLnf9OgH+QMh2
         y+w8EH5etC4JgQbH2XrGAQc3mKeYTVNCVy2oAGKgCcRDnCvgqxG/M6Kz+xxQuYLzXA0+
         2ejCU71piPuN2OpJcHJCIW133GHsbXzTlSvL0mpCp8hccpW/RZGcw2S0/tmxYVKYb2DO
         0heJhr3wvd6T7DwbSztSKF6oxKyVrT2zkNC4E/zdXnfM0L9NDf2+UmrMvdKNOQiYXflP
         +6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760980; x=1783365780;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OijjlcajNSAACxDTq1b+qg0H74TStsOEsCUTaQJgG1c=;
        b=Qb1TDa/fkkgP7UasDTCTa3fCfqh6Pi8PrR4HEgEL/9/beJ7iJSgDYKEmbdrDdNUmBA
         RO3STumYrAABUoavQvCltq9knDA9Hidt+pm7iMGAMq1/c0+XS/MaLuG/Q7KvDwIBU2p0
         1gRpQbqd+ZhT3WB46WGVTqXDTY/jOFVAwLgMlmDFISUEipbw2t4KIqShYNYQPCjpB1dF
         49BH+0QQPx4Tx2vQLtIilquPYo5ruwhxbkKcXbKd5A1qx2ewd8JBfIEY+3iAS0/HKTxN
         8OMCAbf/OkKnL//L8+MpiDOpY1bN/b6ecDuvoj/JakNQ6hPVXJuMK62WihaG7ZF2AcJv
         XK8w==
X-Forwarded-Encrypted: i=1; AFNElJ9kcz49B44jPWm9MRbS2ka8g1sGahvsow/HWZjMJQRf68ogYwSFYBsaWfiN+v/yDpxH4P+zOQO7R9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YznsCAogkCMFU46d8oJGqDh6K42sYEhTUCpspiPG7pHHoDBwd8E
	PepEX53/d0HikwV+VipVEbsjW7M5JE1j5ZWMP4qGFyRYbrz2NfvJxNH1vtk3iw/ooDP1XsHftdZ
	aEKN1EaR4MrQvc2DJQwKE3v4zsBQyxDaU1nv1T+456HHvOYnlQCg9BByhMRFKCjQ=
X-Gm-Gg: AfdE7clcvT9ircGOqntiibBfhP/kgVyQkqYrgfQd+xTE3tot0ZBoo5Oe7Wpe5da0UVw
	gXaF1d+spNvE+FkeqCnWcaev9qu3uu59zWU5DTmUa8Xv9N8x/tCEv20sa+27T8/EbBUZLKy7lFk
	CPP7d4d6snowlGStJ139dc2Xil0F0xuc6fYCHelvi56If6U7XHq/eAeetli9rOaU/71pUFhBS8G
	u6MNTTqmlHaSo5zFFa1kp1qDE0MHMgUaefAOorVy4uIp0+QFNuJxpUNV7JYKR9gK7RBOJPhXVlU
	QUVaifnqISsvSX/eoEGD9XCsUpYAkF0e6pdJt2//J+yQ50h7e8BBRVfUGArt9EBVcneCv6u9CIf
	sp2x1pDiwbklGqNeXSFR7NrHIu3XZutZnR7usagu7KXA2U6RjWcCeKN6aejdHITqM7Ku/GOC7xR
	YBeLF0plI1J/wJMSNDkH1R8EloIy0DNc073x1lKUsaLHRbMjPwdrPwVManF9R9rqCKc2Z2IgTS9
	MGH9P/ZCCKEbs44tmd4
X-Received: by 2002:a05:620a:294e:b0:927:a87b:7abc with SMTP id af79cd13be357-92e6286678cmr138546385a.50.1782760979490;
        Mon, 29 Jun 2026 12:22:59 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:927:a87b:7abc with SMTP id af79cd13be357-92e6286678cmr138539685a.50.1782760978865;
        Mon, 29 Jun 2026 12:22:58 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475674af239sm308506f8f.30.2026.06.29.12.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:22:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: gcc-qcs8300: Fix suspend/resume issues for
 USB and PCIe
Date: Mon, 29 Jun 2026 21:22:54 +0200
Message-Id: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA7GQmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNL3dz8vKpE3eLS4oLUvBTdNItkQ4vERPM0YzMTJaCegqLUtMwKsHn
 RsbW1AC9QUXxfAAAA
X-Change-ID: 20260629-monza-suspend-f8c18aa7f364
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2MyBTYWx0ZWRfX7PFlHvmSGBM9
 gEyEcgXFg5jx66Wcc8Obw8uRGktLjpJX6RlTLK4d68VDCvlqE2wre1Ms4pRoDoaVbDGolKEAikv
 ggXhqgPGO/jarzBn2oCT7u16qsddnfw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2MyBTYWx0ZWRfX9zAvIWdi73yn
 U6a8lrCHRWbmIrfa84vPfibX++WFDLaGPD62XyZfSjB7NwnisTg9YnuaA5Zdw9dRWIkls2emttb
 AICkypLigfeZXql8ORfgoFcgyFedOelnmNCGABtxDCxbsTHmlG14UyqLTQJOsGILrD33IRij05S
 I+jekGX6Ju6r+ZjbNDznu44J8mnuL/UAEFKrrK6f6tY6ki4J2anvQV2K9n+1kNkAP6eFKmOZ7HN
 T2f+zJbq7VicyiAtB3Saer7r3zn3NUzSfYCrwCsArpMG9da8qYx3C4SlqLzW6Kd+GRIIn17Ve4L
 P2Mk2ts8NGpwQJ5h9dlO8GbWqIjiMgwtp67ZoapdZ3ZBtINzugJ0MY+soxytTmSGzBgRukkqGYE
 In6MwAd45vf+Yo6rzvdzzZmVbAmE7vCoA3YtIZb6aI12rYvS2yphKeqDDsYR5eg/OlN0Ye1zxr4
 l6O0yRURTgGYf6jLzCw==
X-Proofpoint-ORIG-GUID: aPfBFSUV9FHXR9ezB1bZhLtyDvo3_Y63
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a42c614 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5AUkEm3hKR9bwltPNGsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: aPfBFSUV9FHXR9ezB1bZhLtyDvo3_Y63
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290163

Neither the USB nor PCIe host controller drivers currently handle
state loss across suspend on this platform. To address this, switch the
corresponding GDSCs to retention mode (PWRSTS_RET_ON), matching the
behavior already used on similar Qualcomm SoCs.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (2):
      clk: qcom: gcc-qcs8300: Use retention for PCIe power domains
      clk: qcom: gcc-qcs8300: Use retention for USB power domains

 drivers/clk/qcom/gcc-qcs8300.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-suspend-f8c18aa7f364

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

