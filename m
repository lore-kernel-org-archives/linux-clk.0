Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DE43EF670
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459956; cv=none; b=FSW5S/sTaxacASEIKly3s8XFoA3FT8PdS7/2mPvchw3jhg3zs1PrSXSOARMTdztBANQXIEw/LJA6V8BizOgqqd/qotpXTdu0pbTzwu+tVn9W4tfvJ3kuPHZ7mWOUJjDld01dcH3vtTVD0euPRg7p/+gB09zoPpxXYWkfLT6RPG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459956; c=relaxed/simple;
	bh=hpI7Hg/aEZhSjGdObruRDwA35829K1m3CN7LKanOqs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5+mPNsqpyTvdANbIQxejs+HYD1xcSHdQdGXov/TesxdfHF7qTMxWzctAEoPM9+J9223tHcmF4GIJ5/ke90+P2NR0tz7A8EYcAnIPtT4fDcYhfONJi/wCc6Jtyr7pp3fdcQSQCR5fyWtEwmNLWv2YXSy+lJJMdlPFomua3nffUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ll5u/ufO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cI5CrIze; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ll5u/ufO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cI5CrIze"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pv2R4001889
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nD929g89ZCPAv1t5vqTauaakssk3+hyDU+nP/UUmTpo=; b=Ll5u/ufOibdVwuSS
	Vw2k3UCUpWQIXgX1OsJorgkApyI695foA3qEdhqJlcEV5Sfo90SLtVQcx0i8AFEa
	CPHYGUqKNxodvBsoXJV9vbuMx9o90Rns8hkiK7elj6bfnrMRwqdCIYghwCJmaC6S
	05cRUaQ9USzJ8BIRy4XPNEJLtUPGLCI4ypCVbrVHmcBPN7XZd2rB6iwxpg//ftEx
	Wwv8oZ17CfqwihU5s5uNcoZOXFx81dyJEecQ/dfqBoTOar5Ms6gukfV6pLR2BLKh
	5QZWZ6F3tlaDeFRbYqSQw/gYH6b6p01si2txilo/uO9WDPkkO6nolaQKw01K2B3L
	ckgC3w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du9em1u4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:52:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4678c6171so117126015ad.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 03:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459952; x=1778064752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nD929g89ZCPAv1t5vqTauaakssk3+hyDU+nP/UUmTpo=;
        b=cI5CrIzeoOfL0bnfJjfg98So01vSzkbbbGU1/pBSev5rHkv9nFHc8Mi+4Zjve6Pppr
         qOcfZnrvGX0+2A81TSYqzCCmZqqvWWAtELD0GJ7iEUa20pNZnCYpcMAPucgbId0ILVJq
         SLdEKSH9sX0yuVJiN1OV0NqbnZ6kmmhl4I8p7OqYR1dc/J6Fc5V7g5GEOWz9lNuupqxL
         fpZKEPbinpa5+u+v2czzgVyUxmpSyEFY4y2YNjNOiYmxge29YgLiINpDETbT1N1YpTVn
         JiUW5uUft4wlz2KeV8edIlgmXvTH52PdC48skc9OmhUedOxCunH7+cNSr7qI5WprrUNU
         RGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459952; x=1778064752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nD929g89ZCPAv1t5vqTauaakssk3+hyDU+nP/UUmTpo=;
        b=mJCnqNQrDR86Xm5Lq/FiBfkEjxlr/DnSkGYSYq/j3JO9UOuf4kixJc4V1QvZ3tXCIN
         FZsS7jIb2+HkrZUzfYMWz6jLQ0r1QQsGoYHp6a1VrQoT80CKLP7FbRC1sPIGiEdG+JCr
         g0A02hwGB8O1RB0/Nut+44yACIP/gFORoXxGNoEbfY/HtKUbGV+uqorYpKKcLpk0jLW/
         jNOe0D00RcG0Sjh4T3IqY3erAcT50uwLreZ/+ABL5BYsN+v5bv6tstNPPiOvRk3IvyPE
         vmKZWU/a+Xlyf+TT2ytsMJB4wah2PJ5BMbyQg/REOV6niuMhI75Qm8lA/+MSad9iy2f1
         8VoA==
X-Forwarded-Encrypted: i=1; AFNElJ+GLLfRkNb99df7PTOdh9BEMws47TBAv/5kIEkRlEBy795nWJqfY3b/q7lNA/qbhDrNnTYYa6X+noM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjPmFXmNTjX0zzh+omJmMkDXQJFoy494TEn49cLGBocdEeZ3Pr
	aKswFfe+WHNx3pkcj9pZ5ZoUY9fEqg8IG+eBEgnShXfdfaxxVUBhk8Im8nWMAunbFuceZwCgHxb
	vtWx4DMolf6g6ZX9SFHBDWL4lxOGuSS0layf9xhw5ltd5YQfKKDPebj4H0SizgPk=
X-Gm-Gg: AeBDiet4mIbfE/rWoBvj4RSurtrRmYXBVjdDyDKQOdYfUeuKxlD8SOr4N6PUxYgRytw
	xbWYkwVv+U0PqSDvhDMh+FF1lkF/BeiVWC1rtSOUHUsSSeTrT0+M/Dm00KRTXzCReAcSHgj7rMY
	ki2fz2TaYKpnx+dCCZ2wzgMAtrpgzqunO9YWNkU1obmS7+Pw6AR3CKmIcCfGP7NsF3Stnfymqrj
	W5koZ+NNQnnUigR5t9ha8yrFeaPzFS0NZ801FVnlzZ4UZlfAg8LZFkn1OaqDLNFs4HaRU6NwwUe
	TqSn3tp+laiklpHLxgx+aGHfOl6Bg4GMhDiBZsAp/h2JTurBNLfcdzOFo3SxmN6upWfspqh/joB
	QHldpeYJRyyirEnxm5ywXCNZmoU6T5P9YmxLHwV/m+gsXRDUIJ+8TDNbh+6vSMB8=
X-Received: by 2002:a17:903:11d0:b0:2ae:6192:8d78 with SMTP id d9443c01a7336-2b97c3df3d6mr68504075ad.1.1777459952249;
        Wed, 29 Apr 2026 03:52:32 -0700 (PDT)
X-Received: by 2002:a17:903:11d0:b0:2ae:6192:8d78 with SMTP id d9443c01a7336-2b97c3df3d6mr68503805ad.1.1777459951717;
        Wed, 29 Apr 2026 03:52:31 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e9csm18316715ad.9.2026.04.29.03.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:52:31 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:21:53 +0530
Subject: [PATCH 5/5] arm64: defconfig: Enable Qualcomm Shikra SoC Global
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-shikra-gcc-rpmcc-clks-v1-5-c3cd77558b7a@oss.qualcomm.com>
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=69f1e2f0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kW1cseVQmWd4RU_XbDIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Y2mLO88rrOlKU-O-cjcQU3qoEoM2s4Il
X-Proofpoint-GUID: Y2mLO88rrOlKU-O-cjcQU3qoEoM2s4Il
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOSBTYWx0ZWRfX3wwHQ7c7Mr+5
 C9zIhuC8HZI1RJOK591hgsElaJH170L1lKY6msSrzVveP/ezMHmNGV7MvsS81cTzALZnLfMnw2/
 mNPC3S5f26zMRp8cnrQG+4eZ/tKHFidFIkrjRebjWhG2vFPbANMRNm5gkBVHdGHCKNeC+/AKo/E
 0I7yhyN+tJDbilUA6jqIDxYlhLxa3RAHQ75Qfm+2LtQhOWlne45JF4shvpzmKDueQdpvXCWL6vq
 CrehzsUPpez3xUjBfLZJzpz+luHyadGYQkXO7yxotuI/gPUXViEZE9TRaBiou53cJCyvi3z0xmL
 U6zzVRhaviFG3Lq2RGCzj0ro5JaUooCOpc8lV/wESc4PiAyLeay6NpJNay8sftMBNEkCNpFPkLA
 moPcVs84LZ/Tyir+B29Hz/9E7GpjPVTD0onPEsy2plm4qPyBKufoNeRz6WdhRMvhBcHpRYyJlFI
 MJrRbP7XQtUSoyzXYuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290109

Enable the Global clock controller driver on Qualcomm Shikra EVK board.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29bf631d517c38486f6896ffd82dcc9..13e04080b37160129ccd47b0148a64277b8e0e4c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1461,6 +1461,7 @@ CONFIG_CLK_IMX8QXP=y
 CONFIG_CLK_IMX8ULP=y
 CONFIG_CLK_IMX93=y
 CONFIG_CLK_IMX95_BLK_CTL=y
+CONFIG_CLK_SHIKRA_GCC=y
 CONFIG_TI_SCI_CLK=y
 CONFIG_COMMON_CLK_MT8192_AUDSYS=y
 CONFIG_COMMON_CLK_MT8192_CAMSYS=y

-- 
2.34.1

