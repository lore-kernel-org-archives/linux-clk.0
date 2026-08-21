Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF51938888C
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 04:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787287960; cv=none; b=kD3A8pNG1/t3MrR2QUWiaXrmfRehSJa/KbLT0jsulp2lQcUH1P3meTT/hiUGxwR7pDvWvZAPWQn7GisUkRqI4rDMNAxwjQjvhVGD2QZaCfSx6S2DmZo5j1TiTi15o58RGv2J8aR+WE0QlSoD1DRB93Dy3Sv0M4EMNGwCM8pFRmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787287960; c=relaxed/simple;
	bh=LDMRgyeDtFlrbMHasi/VNNmOqMLQhwi5wQZwMJNOPBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WkDOWa7sMOVVKk4+4fuOf/Et2S7bGUQYdh2q3vXVlzyrsvWUKg5KnAoFHE7vtQ2v22oLySFfr+jrNL3hg6rQ4JRHb8x+2x9cPNCI18ED30qew+7B4SueOaFKt99iyQAFWWSCHyCNbM+eDCc9rY0wyWtP2AssnosLxOyofFaDafo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENB0mekJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+e92FrP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENB0mekJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+e92FrP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L4dMgd934259
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 04:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0c6XRKXv+9+yiPODmIiVTnIpp1lCrqspvfX
	E+471CL0=; b=ENB0mekJ92CY1dM/09e41k8ZojtjCMXM50fwzbS00J1h1t/NeMz
	hXP8ibVp/JzT6CX7YtX/tAtdDno3JJLKiC4zhj62eV198ZY2kIrUk1dlA4w3PZkl
	rb8GqiLt5UK3RtqRhqt+fRysHMkqooskWaR+DJFB8r6HqEbmx5EQTpPdJO6uAhyn
	Xa3eztsVP3+nkYS6FZyklvyPTgL32IiSlELOm2ZrbXuavgimYkRAYIG8tNV0ajBA
	opvzBJfTv0oWVdlUWclNGSUqI47N//Gd6QjlfC+eNPm+LBzITjw53XJ03qniihr4
	RZr/w1DGVc6b0wg/0/EXSH7bvaV2EyeU0mQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fue014s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 04:52:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so961911a91.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 21:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787287955; x=1787892755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0c6XRKXv+9+yiPODmIiVTnIpp1lCrqspvfXE+471CL0=;
        b=C+e92FrPpGJPMpTyhD+yo1HJwZI/+D+DpbKsmM1z5yvYmyY7WOWUaEQxS0CYgXZNx+
         sJ1on9Fba1v9zWmamyod/epeYTess9lNSSYB9PC3u1pvgIH71FVn+MTB47FVDkNhYD2u
         bJsEwEVrWq5zxH05X4Zr19cff7ziZfqA/yC29C4egkD9WssM9+VOY/WoBNkrZu1MbK4X
         lhFhrqhd9J4Csdk/tbsstDbssb0tjDhFLZleTEwgiRUR+xVqFL7CcboSOcIVJ7Cz9d/H
         u6TpV1/cqbBeHZKVrVpkCnF/FO7v+ABZxOpg/7K3LjXx9a/mcfld28M4Z7JPMBdzmF6l
         sB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787287955; x=1787892755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0c6XRKXv+9+yiPODmIiVTnIpp1lCrqspvfXE+471CL0=;
        b=oWjZsAZ7QV9u9Z8hC5DtaFr8ePxc+F4IMTOUznJmd/mZ/8QIpvwCPmjHfAoyCfucDx
         Pn+vbTNEhvMAB1aVC71IAzJclHQzHiQg+bsVL5GDqXDaQbl2z+9+YrxAcAmDLE1AdXcr
         2hlXMuSHQ2MkrJQVZEoZgtbZSod6yBCQcxi2U67Mm5y26sl3kGlNzov7YoJrT+CnidyF
         ZNDtpXQKTKDVV3dWKnqU63gESKny4JQgqjYcxAjI6n/6tl4VEO16zVrF3wQTkjru/d+A
         2lH5G2Vpjb1Z5CwHqKlrA0IEnxdUVOQUSJHm8+jQXcJz2CgxDtzf1E7SgrPSoR5y3jvW
         onZA==
X-Forwarded-Encrypted: i=1; AHgh+RoHnWTHHvBFByXVQNWTWZFubTvvwJOmMxpL6WXd7QPk76gK0aOHcv0zXtpmhrXfGtqIexzw8XEYT90=@vger.kernel.org
X-Gm-Message-State: AFuF++moCNV2Pn+HC7aUzp4oBvBeH1t3HV+PAnCPaclZBrhBkbO6YwAI
	io8fdjsh/Rj4EkKzVzMoLXELIoWiRK8pFvDzwqgd0Ig7QniBj1fPG7M3j3VfahtnS1mgpQPDPJ3
	tyKwFmCoWtUqWveHCMI6v3hCU7q19nl76xVHJNqRYLSgQgGHJP96t5TN/qk70EyHXxYyArkk=
X-Gm-Gg: AR+sD12g4BgUjbHgF5CbNlMsKXHh9soHozFlRkkRiZX4uBB2dtVsYu78xVOvh3/AqZM
	KeDJ9wMvUo7TwBrQXdh6xVtWDJfso951J3cix6+zUeQ1/nI41hi30qmP03pAThq+SdT3lqoMYvZ
	OmrVXw7gdDO7Oo4iRRjHRECPZFvfQ7gHbU3BpA9bOOBUpl/Bue+4IV3wZFbYiTbRUylqRKXIYjR
	OfKuhhQkgWa23FK3qx1+IDa+WceMc7Ve4WPfvnRcNT632MCrwsAUO1xjLkG3skUbiG179r+8UJg
	RJuw7vwiXgD7BlwlzOIsgi9QvMSkDSIBOFZptOebao34p7ChxeDTGzKglEOKRcN9l4aC4bwN/Tx
	kfW/TZtWp09g9YKJMTZuAccMLQW5v5+bpLN9ml81EX6576XzR+gl1PfAfoXZAe9Mh3auw/LjwFZ
	bZUCXHnizRBnwnN6R5QVJEvg==
X-Received: by 2002:a17:90b:57ec:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-395c354e8e1mr6945668a91.7.1787287955278;
        Thu, 20 Aug 2026 21:52:35 -0700 (PDT)
X-Received: by 2002:a17:90b:57ec:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-395c354e8e1mr6945616a91.7.1787287954846;
        Thu, 20 Aug 2026 21:52:34 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4b47ae8sm1516867a91.13.2026.08.20.21.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:52:34 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: Fix CLK_GLYMUR_GPUCC default and CLK_GLYMUR_EVACC duplicate
Date: Fri, 21 Aug 2026 10:22:15 +0530
Message-ID: <20260821045214.2623299-2-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDAzMSBTYWx0ZWRfX/7cVXa4eM4Gg
 Kui/tCaroVgonhcgukI3VmK85Ym5OGpM5CyD/6CoigYdRUzBB+1z94F6knXxvylKpu3+zYLiamR
 +ML9HYupIYsDfwM1Pj8pPQR4db2pJsQ=
X-Authority-Analysis: v=2.4 cv=U9+iy+ru c=1 sm=1 tr=0 ts=6a87d994 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=FPN9wVbhs-vOQks8sBUA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: bw5oNe41oaDPVBB_6coyCJAcP6DlVUTY
X-Proofpoint-ORIG-GUID: bw5oNe41oaDPVBB_6coyCJAcP6DlVUTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDAzMSBTYWx0ZWRfXzki3tn04PFnR
 h9HTLA2kGaIhp61MLGhbcf10JSkyafmQW8JW3kc4mp1BrctMI1IJd+mFKYEQqTkyGVdW+AygXm4
 6T+GGAT4HJkn7/KQEOoH9E97ogrjalEQsj7eUViM7eqbEjzqnOXHzqGaRESF8RtrKgIkg04ahzQ
 DwISFMXdf99Pc15X1q9yy7J+bPg8bI9e8D1Vbs1Lc83Qmvz04PYFpMijmzIiZIqZNxX6oSlj84G
 Sj21ypSZZI6rt4P2+Myihpc5Tg778cAFMqDFqRvq5s8B8dhe8UQHxDvliHX6njyfa9EII/ciAOV
 nMD26pcKRw+i2XzyjQuWFuaOuFYawirIIyHuuAbvFExhZteB+GuGtjcoQCBiX9920LxSftHg9hG
 MEnxyyxxYMcR5czyIJMSjGDmtRfotmstwn/fL0h0P6A0OYYGefr9VGx7SqGxeHkEnA7YbC1xZJV
 rA5/ddeyQi93nGajinA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210031

Commit 6b150572bb76 ("clk: qcom: Add defaults for desired arm64 drivers")
missed adding a defaults for CLK_GLYMUR_GPUCC and created a duplicated
for CLK_GLYMUR_EVACC instead. The original patch series did't have this
problem and was introduced during the merge. Fix this by removing the
duplicate and adding a default for CLK_GLYMUR_GPUCC.

Fixes: 6b150572bb76 ("clk: qcom: Add defaults for desired arm64 drivers")

Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e609a7819e07..7cd3ab277d37 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -104,7 +104,6 @@ config CLK_GLYMUR_DISPCC
 config CLK_GLYMUR_EVACC
 	tristate "Glymur EVA Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-	default m if ARCH_QCOM
 	select CLK_GLYMUR_GCC
 	default m if ARCH_QCOM
 	help
@@ -127,6 +126,7 @@ config CLK_GLYMUR_GPUCC
 	tristate "Glymur Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on Glymur devices.
 	  Say Y if you want to support graphics controller devices and
-- 
2.43.0

