Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE525540A9
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879386; cv=none; b=bWKwrSRl2gc5M68iRTNnfS/77jygwtpkYtizzgbqmS9KOEMYBsvlcomJzA4J+0zDmyVA7xDvkQvpreCIdBNNj5O3j/Fxiccl8NkIxJzSqzqetVA7G9j0Qfkkp75oOkRyWIdReuCAa7c4r+5nU1HMDX5dFn/BH0IJBsl0OL9uCRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879386; c=relaxed/simple;
	bh=yqH5y7Vc7hLa+bWj6rLfrNwqiigy+JhhlRiK4bZpdaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rReMomRrZpFflRAxqvj7lf3brlCM6jBNVAidPZRDsF6AuAnwiMkq4G+C0EQqPfVNRvPCqTDgSAkwwmqeZeuYqg1UeiogxH92DiekReCf3LbUz7WB82GxNcQPtSLBAq//XokoIsSyxC9h8khjslaZwkX27iXVe8p3Yg4jc0GT1kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FezWc5Yk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MC/EN0eU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FezWc5Yk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MC/EN0eU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EjRHS4109763
	for <linux-clk@vger.kernel.org>; Tue, 8 Sep 2026 14:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yqH5y7Vc7hL
	a+bWj6rLfrNwqiigy+JhhlRiK4bZpdaM=; b=FezWc5Ykvar7+O1Qhm+951qyPWV
	92IWKoINDKODMZwmUE/niUo3UiNWyN6c4W7gLOSj04c9SHwNV7PKYJv7klUltPbe
	ZtLknwpzvdM9KW29dShDyA0iaMrSvxKRT+viluOiGR6w8WZ/EDt6Rmn2GCk4vAY0
	RWShQpCAvOuXDcZVrD6sGHlNwdwnWECdmqCwoBR4BfoRPoebQCS+R9DIvItREdwA
	Sc7FgKclWrTs0cYxs657ViE3dNZ84jl9RwN0DEihz1ptALx/5LkY1XeFdD6aLra9
	r86foZT5WNizKCsHzSv3UOkOBPZORZ4Y5Clc2IRvX6dZ6Evm99p9BQ7bjMA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjg8xs880-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 14:56:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso1473948a91.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 07:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879371; x=1789484171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqH5y7Vc7hLa+bWj6rLfrNwqiigy+JhhlRiK4bZpdaM=;
        b=MC/EN0eUv4UFUj2u5pdV5OYA+WohfEgPGcBAtFMA6nlMnXaqklIb28OeDd9jwbFDwi
         0DOY3cHRfFLDCUco0F91EwdscuDQUzYvhC45+E4B0M0nlSLhoYiZZzQrcDPtaWV4bsjY
         bXnedgFV749bM7NlkFaONmfz0Ir9V3L6IAvxHeg44VB1WFIL1AdmMalVduYs1ZmZGDJL
         2gtSGL+xuY1WxE/DkyKov7nXtqXHU2ywUxAN3M8/Z0JYP3wyMX8V04sJwSowa16Znvox
         I9ISj8ugUiwk74Xp9Bea1ADvbqTo2Tgj6Ezcw7IYOla1VLqavhlZkGpLMYBILcI48iIw
         Rptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879371; x=1789484171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqH5y7Vc7hLa+bWj6rLfrNwqiigy+JhhlRiK4bZpdaM=;
        b=oiS29lAVL+Nhye/+iFweiLTrXAO3mL5VbDHgW9COBNk7j5dBDKJ+PPVWgMgXbfE+2X
         uFexayTzlhG5DWSWcUgyI6qrRF86GLrsg6UhZB+hzyV4F1ZQn8Kw5F/Fh5HYNSyKqbvB
         5vP4JLtfXWW3IizE8VdCbgBDADqphdKE1Ht6iv9r0RMMwYhClE0Ykp1DVoCyTeKevbzO
         qP1V0qJWcwvdeDebRDUqoxo6BBTTK51+6IssmRxMHKbMx0SrpTOAPKCUtnhNfd6AjZm5
         joZ15RhfBM/gJ4ed0vmRx8PPvF2EJ1ARX7ood24KDMjBvI8jLSHIDI1r0drWshX9FuGk
         RQxg==
X-Forwarded-Encrypted: i=1; AKwUvByHDXAlJSm5PUQucAbIYO6FO9oZT4BSGYsNNlF+oc0qtnV6byi/kCeeEcSyjsJ7RY0X41P76e3dYws=@vger.kernel.org
X-Gm-Message-State: AFuF++lH+Wrw7sEwIUG0axkYOv3PqMr705Is5T1fz0IUyqVXHrfizKev
	UTEL4LKyyWUOMTjicKJH+sWveFV/hjjWXCzVAbqR+4v40wQX2j01xiXDPTnGqnknPwahyFo4Ma9
	/xsstL3csM9q28aAzIUZhiq013ekgz9VHqwP9idoFpOtTdQuiiPImX+/JsWnClfs=
X-Gm-Gg: AYBFou2Bs7MMnz5OQWBZUQ+p4ro1hpY8EnRG8AwgV4mfbz/LgrkD8vdvt2ATz7yEaGv
	KHdSyWwwKWIJemfIYr5pR7LJ31OWQnVLngztF8l4l371xf6dEy9wPRB7PvXLgVi8G9HPSVWQDPi
	/tTKjBVjFPWo+ptaPH55UVXtO1AgBuzA6jB5mTRGSpRCKJa3zslDCi9ahc/+7Gf/FxYQEs7fTbv
	Ru0He1qmAwewflMfWaNXSmTm1jzLPhXrxF8/2RhY6snq8O7hREWeGa53uYCD4fMXmFDC2CPyDa6
	OdzYirdEpmOanL3g7qIEJLxSfH5jUphJRsKzGUep7prF7BBCLFtDh8DYlkP9+0RBoNF2xRYAXFq
	WpRj9h2pZK/3cuMFVNxzvb/zmHufnFQ7dMzBzh2aTUwCxK41NcnpBYW8rmwullreb17+Dexu7mn
	nnROQVQvoeziTVCduKSGKN/w==
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr45822435a91.21.1788879371159;
        Tue, 08 Sep 2026 07:56:11 -0700 (PDT)
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr45822380a91.21.1788879370578;
        Tue, 08 Sep 2026 07:56:10 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm48697022c88.2.2026.09.08.07.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:56:10 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: andersson@kernel.org
Cc: pankaj.patil@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        sivansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH] clk: qcom: Fix CLK_GLYMUR_GPUCC default
Date: Tue,  8 Sep 2026 20:26:05 +0530
Message-ID: <20260908145605.1134841-1-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5778ae29-9c86-418e-85f4-1bf48d674a31@oss.qualcomm.com>
References: <5778ae29-9c86-418e-85f4-1bf48d674a31@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J7GaKgnS c=1 sm=1 tr=0 ts=6aa02210 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=WzJbLqzC-FkCw_Mzoz8A:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: FN9sytZ5JqAfO_BGvIL4OmUor5F4DNN8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX0UZUgvIUoQZL
 TLoZDyS6HI7TDKKdBO/Pk9R/xpaJCLsWlqCYbEK60C+vgbukUFOixyLWzi/ypOtF9XVby5yQ9Ep
 16VpkdzKvL2GhFMdc4zyEC2/u+ShBibWySrBH15jOqp47ZYAyFbiPB/6msmpzS8hv/WOMj5+knL
 kN0bGUWt4Sg8F5gbsHSgf4sn+49KPQyzhtbw3prS1wLeVIljdWB0N4231k6Fzd1V3FrgZIG64p3
 67YyxINyiTk56MjCKdS0fdbMrW8MHTeJ7CboO2aspt84n8pOTPonmYIK0wBnbUE28JTXiJmg11X
 +L2L3YPPRPW1UZKtTnfdfKSuyqaVBCEvuFh0rcIT7or6QTM59S8haa8hUoMOItS0w4UVWYf2Phv
 Kd1tSnU07amO/K//x5CR4qv8358FDktaDl/CLxeKu9WREpMR3ZO4aBZxN43ps3aSvJJFPDYwdd6
 W7vrejshWISeHVFGiEA==
X-Proofpoint-GUID: FN9sytZ5JqAfO_BGvIL4OmUor5F4DNN8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX/ST8+cht9XZJ
 L8P0LvhprAtCTRhAsaDwdN0lcjWm4nevEG0feUj57/umixhzquNa0DgnJj5RC2Y6qhuQUSWAo6F
 xOTiuRb131rOWI8SztRsm1X/pUMWPic=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080161

Hey, this patch has not received an ack, please let me know if
anything is needed from my side.
