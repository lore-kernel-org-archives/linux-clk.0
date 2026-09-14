Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D629848F034
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390201; cv=none; b=MWg4mhetmQUG8LCJyKx4CuYw646PdI8CgB9CTgDd9K43Hu35o5CVvSxxKiS43VnaEEA+AIg4WxF7ad5Z7nTnCVMlXJWxhVyWgALKjKuLsSekSW9T4cMut+FqY6CvEe58r32nW+awE8mcm6CVy8HQkA78qqUOofnGyniN+GY7ce0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390201; c=relaxed/simple;
	bh=p3n0vkGj1UgvhrXgJJZcBSedsJb1DlcOzeAG/9UG2H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPipTWIeyAy4AUAJ9kCJkMGa4DB6GwfRccXkuhZTM+ffl1jA1TlCWnVmBmlGSz2Il6ITGbtJ2s1+mVdLi4dBuq1hPl3oSUcRVCxRHrSuV2yYjUNSUAbfAashfDZC9IhNq0r1szQLqaPVbhQP2EBpgJehqA99/BIj7wvPw/efVeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dag7g+8b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OH/21/Nh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dag7g+8b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OH/21/Nh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmMwS4032520
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=; b=Dag7g+8bZgC2bOJA
	N0fof+o/TdSTtP6iRlDHcF7V9zwazvd500GP+QNcJlXae+IySwKeAHDiOOqdHIkI
	Y4F6NEs4IWpck5TKWBHF7K6zjpWzwOT0ovFdnVViqcqeKYTPJUaXdx2bz1hJl1/m
	89bBn54i++WTeGr+a/2FcZ3FT1TypQBK5SHFaaf1/qyLi6lUstH8H6DP9LVP5L1F
	gWOlvdTvLuWdQ0JQ6ZY17UX/nWFU947qnAKrQMqIHz5C7JXgIqlGSwuxesEPU0Ns
	tvOJQQAAXfJFPhAr1g9ZmCzWuUq0PlBRY/LVUNOEh9kbe/cbagQxELUQ1c/YRNG0
	UswR7g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8ktt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so499703285a.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390197; x=1789994997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=;
        b=OH/21/NhfQdyyuxfi0Douxq3PE0M4YYQKjVON1M/sNvpvUPKVaD/46sVWQhCzkcsEe
         rRTMkhsdhE7/IzqNiu4fvMvnhnJz5/nEAewqYzrmPAKe7oThFt4IU9CkNuCY0BNEbfph
         A+17n1kIKTnrzGI3/9XI8HlYYJHySACUVHWS7Uy0osdrWMb9FCKr0RDGx6/wz4eer8u6
         3a1YlJ7XxwlG99t3Ztrd3W5GOdqT43wpyZY8JZp94Nos+qcRwbXC293a8L+8+u91mh4g
         stM7A8mHJitNeC+BZ1D7UmV/v4misybBktVwHUsmyQP0+hMLf9IknmBYaJ8C4EKc3i6P
         Mkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390197; x=1789994997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=;
        b=eDxd+XGbTaU//KZJpD4XB8xCAQp8WKQjptC0sMzkHMECpEnask1z4hulxMySOWDoZc
         lt1irgBR7nfTndo1lcG4gizXNP1OaMcgmPEmmYsrs8HpAAMTqSc/hacxeXFTATZ9s1ff
         bjxB9VFPy5Cip+KhaAgogI0Dg2L+RD15RSzfTdZdU0SgQnfA4sVElUDDd5uBWzIlB4aY
         fVDWsgkhhQ3XM/Kf/B2GiWQiPCN/o8BFNcIGYlOOj/K3BvnQ6mi+xVZcGuFcjp4cHm4H
         sjWjCVAuVdi0GzeI0ad2QxZhOlCxVNoN2TKPVJV6wj1G2Z0WE+v9uj/Lg04hpx3odZTC
         XUrQ==
X-Forwarded-Encrypted: i=1; AKwUvByk9xriWUpMg3kmqvj7nGMOWyBmPxGisNxdtmZ3vP6DEUcJvHD8xjaBs9Pan2POzEjSaE3O6LPnYNU=@vger.kernel.org
X-Gm-Message-State: AFuF++ms9LHxQiF5yA5Ynvj4xisYqt7oiChaDBp1qGwcyP+bT5WIpIY3
	pSBrmak9vfo6/B4/8ZjEv9K8qXXd8ujzJEeueSgX11m8nkO+R5rEVWb/7YfnXAmA+hW/dB0eQSH
	mSq6Zk5f78hmQK/IcIBPuew+Egt2liExM9XEbSEtWjE+dvWKsFmPBWkjTTEUSA0Q=
X-Gm-Gg: AYBFou2jXYZIgz+pJAF+t3NZss7c/b0IyKtyvl98wSRsm7343vQ356ks8fh+ST0XiO4
	26lftKnU4RuM1L1zuru6p723miDkOgWICCmU/VZ/riZNMgz0GnWJborZ8fLJNvTLfOTjJndJeDP
	cWtx3h5bmvPxv9VQiECsZtxnl7wSNAwohqZEdwHrlI0gSqTUiPNuGPWNQ1tS7EdbYjbTfRw1WJC
	y3Cklk+e3WkHvzc7WJaaEABs/DjJ4BmGO7gf3AKrfW0DD22nEgetmb36BP4AiXJIj7KjubXaRMf
	Gu+eX49P0ljSFjakmvJfONj8LBaRJnNlikfKDf2hAizLkl5f3Q7EOZPGDzSRGshblIdAMSMBX+D
	nwAX+Q6Gr
X-Received: by 2002:a05:620a:440e:b0:939:1b82:47c4 with SMTP id af79cd13be357-93a29a07c1amr339262785a.37.1789390196907;
        Mon, 14 Sep 2026 05:49:56 -0700 (PDT)
X-Received: by 2002:a05:620a:440e:b0:939:1b82:47c4 with SMTP id af79cd13be357-93a29a07c1amr339257285a.37.1789390196331;
        Mon, 14 Sep 2026 05:49:56 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:42 +0300
Subject: [PATCH v4 43/52] arm64: dts: qcom: sm4450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-43-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=p3n0vkGj1UgvhrXgJJZcBSedsJb1DlcOzeAG/9UG2H8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z1Cc8eRWGwfR7ynK0q/naAyx7n5+Lc1/vjz
 tRonU5EJs6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs9QAKCRAbX0TJAJUV
 VpGeD/4+Lbmd77Y46HqMEqLIbLxhM4xen2gJnPN/S7xLiWb8HF1ysHTd+CCqTaQ/+ZnA9jA5TN4
 VDd6jwly8E5FocLlxDUsNg4/hlzi3nj7+UsKIaGRj600TiBMeIe18ZR184FOO3QEBPPqVNXxf30
 MKPaeV4bHYJ0pzMqSP7c8Jhi+4eBH2kRQRXgEDZ4fG+L28b0HmUqYdSN+Oz/rM3dZIpTILIDOC5
 RKyCU3yv9Ge6rhfeTxuDRXx+D9e4JHXkXc1Qedcxm0S8QPmDOSKiP0agDqCjbIC92peJy0KdbJp
 nuPqWAhW3Czr5Bovayf/uptaCcTAEbhZs7UfM2z4RM6AA4ecGxerSLdyHEQgd94ilJ5VEE7JY3i
 aFGIsia5uOskUEg01vyPMT+20lMOEwYp+S3G0JttSrzWjJcUjTu2ThR9PcBMTAlKLrTpAOmVERg
 vB+8d6d/dQYesBldrYkKnKZ85qaJMIFQriSosCsY4V0AFL1/bmtzXroXeiqDFa1hU38JP2Rj+IF
 U15cAA8fUlpFcTffEWsEEvw3qkMySPUqMD+cPF0WP8JNuUvmoPM7nDMahVidsqJVm/cQ9e0r1+o
 Z9OKlAtv/A0rTsFZ/ZyxhRAZUCw69IKpRVeDcn22YhInejKsEI++yS81TxNkHeepkt1T063Qzst
 Ki/bX4xXP7t09uQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXyFYOzXNVVmlH
 i9hJo/KT8R+6/zKtoLPeip0uHtlBFjLRA2Od8lzpO1ITTvqeCUcnjIs9ScWcG2kO/SMarp6/Pos
 iTB0BttDi/x7RHbbjIYWt8MeUL2J1F12uHV7liQhvUJ0qecChy2H5pLfI7UtED55xrHiC7aeO02
 yQ+0c0zjuis1qQjsUYL09dETb6c31WPk2TNc0O9itJdikAuaZiF0SW2ou6uyDEJ2jzn/w0tSNlJ
 5CROOPoeyzYm70sj+dgzeaI3K3LERoOrDA59V0y2227lUEm/6qUchE/4WFwrKrwYOrK720m105I
 gZ/8GjYyrV8Nmh9eiuEtbL4zfTZlMGog1WW80PJ1rfV1mucbwbUv/IdXbSfhGdjTExHsasXdTin
 I03ZRP/rNn5hRCx4N8UQ+z80G0JKotw0kyZ1QZUujKhMwkCX7pOiP0xHXl+kyeaUWOTN/Zx7iaJ
 pFJe0pA+0wZ1rIMX0xQ==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7ed76 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 8MP7WMkrmNBRg3OhN0ETyxQAbrV0hQQb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX0RCzqnCkvxPK
 4SUItFfDHGeOjEyp9GRL0bF5CFRZ5OFgCNpONPFq8IZdZaJS0iIeBSvmZlxiGd7iAPDucp6b508
 alnqZXzRLT8yJuaxB0C5MIo6l8V5Kuo=
X-Proofpoint-GUID: 8MP7WMkrmNBRg3OhN0ETyxQAbrV0hQQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM4450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm4450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index bc9c788b92b1..11ab6ed4f655 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -389,6 +389,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <0>,

-- 
2.54.0

