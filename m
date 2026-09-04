Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6507A51FCD8
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 18:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547867; cv=none; b=Yc2VOG9UCOriXM4iPCFEPicuYfMzQTf8m0h6KUfNKld4DfOtZFFtjFaUAtGxVsQkaZeNC9bfoVFY/80yZSTTGlOuOehYxAIkKtK7XrHsZpYDNFl4Y+OjW8qbYrH8XH7sHjQCoAh+CNmUnOthrvfIl+THy5GLOEcfy8nRUnhT+Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547867; c=relaxed/simple;
	bh=30e2YbKW2IQajGBFGXMD8HknPCEruSPRc6XeOZuDW3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QON1/ZORumwhNnd0hAjmD2kh3mwf4JQBh8OIZJ8bicsL1QRqrD2OLA7e8f6cVY41XZoJQeA6NUV6nAKPrkGiP+gZAgWSv0Fd7zfNgMXBZiLMjP01f7Wb76eGxachqhwcsQhrdlQAXz2iYISO8Oeojtjoy1AyK29SGID+m8p2Nss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YneRItfx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqR2aaDS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YneRItfx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqR2aaDS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HJsNx019139
	for <linux-clk@vger.kernel.org>; Fri, 4 Sep 2026 18:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vP45VXrs0CiMYOIlCFKwXFygyz7JDRV/Nax9tHjmzJo=; b=YneRItfxRbb6Or7c
	S6V6E3PeDzKSliTXRXMOgHpdn1qjGyT3vGwciC3OiJgdCy79rKKulLxaTSaxyARX
	G2QcmSuvwQlsDijp/lIYUwF4m0OA1e1uEDhIH/61mNduvQxyjLMPzz8hSWua2M78
	80Iwe7G2nO/pp2r9L4SETD2hojlZrarS7rkoUEoyUWJpXNVo+HfPddFAX7r2EvqE
	eFv9bvW9kNL8FqtB9U1tKrj26u1rienzaB5/6Bxpu9gPuxNFrCMqyF7kI9Dq6ZGq
	3Apyo7Y7D0eMMZwsDVL9vb7oZKyVtFBIOpThhBld+I+y1wxH04o6DWvcAu74el4Z
	QYziTw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd3qnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 18:51:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso2757945a91.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 11:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788547862; x=1789152662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vP45VXrs0CiMYOIlCFKwXFygyz7JDRV/Nax9tHjmzJo=;
        b=kqR2aaDSwHcAvFEe3wcX/iF5tY2gtUV0gPvSVgzOZrdxP1UvyC7rQrwAeZ8vPy2C0y
         mfGsbDw6JMYXRRA0NpK3pOpEOpsyBYJoq5OzjrW0DFFn0Xty/em6RRHBC6BfOXJTP8Jj
         CLsCdxt+9oa8e668NNu6pP+0X4BUrlnmIcQsXKTbB0bFd91EKqsFJrvBdbg+PlGNNEWf
         FKrEfzF/JfZpZCR3I1yrkk+rh5x7wrYChojNdlVNsem+VkFycNOPUm8l7O71e5RchYwg
         SRIyMTFNJJDE6DBvbbvCg4USXq4+OiFQeazUq5zeEOaGcGcvzz7rW3ttejsLo/vkv6LD
         KEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547862; x=1789152662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vP45VXrs0CiMYOIlCFKwXFygyz7JDRV/Nax9tHjmzJo=;
        b=Be68zNZO2WKlX2uJZ7SsLa/hnRqIQGtQ6tgkpXBamEojLQHEAe/M4ufJuelLqNP7Gi
         cs9PlxTIM+YtajOxeYoI4G12+d+F5H9A9kRaiKF0JqvsqpgL98FHiKmxGhzUupjItsPU
         gVby45101sQ3lhAVR14IVdky2bc32y1nViLepzuGLdjVnI/s1lhk5LbinCOoqh2lZWWW
         uehuqb5SQLJZfCRuJqoBDpHK2lXgjwxDl8j0vd670t5b9nuoVVfM+8Nt4jStXYGWPZ0F
         pai7IkaNWskXlTAIv1qKIC2/kD/9WMvJBnmE8odJPHYpR+QG08sSWAvCKtyo3ZVRqnai
         goDA==
X-Forwarded-Encrypted: i=1; AKwUvBz8NaEv5ONtiJMw6tNrA6xQScdwZvga36K8dELO7lCikdlhIpRGjnuT96FsXhyn69VMcX8165AmEBs=@vger.kernel.org
X-Gm-Message-State: AFuF++nPN/Xx1SBA2cPC9xtw+R2V88u4KY8xBMdsxR3rHYzu3x8u3E1v
	ZjnLWbP6LeHCiWor5RgJpOpHIT0WG06PyfnysxCW8Z6U8H/HWGiHOnfIxWzxtPPpOD2dhYZMnex
	mPVP5fwT46MrHwDV3YIaIplWtzztfKxLsQ3agM+t0XQ+aKIvi/Buh108CqJG8Ed8=
X-Gm-Gg: AYBFou0Mt0WewSfMjpr8vgBiBZMBK321pvTunh4hadH4uvSCLBkUttl1OGiCRtZk2Dh
	xKO+EA+XSQQnLBTVPJSW9kPrJpTNggJyW+o9Uj7cZkD2BOLs8fB7mFBR1U5XM9pqfUERo4ZjTHK
	6qHLvEIGRB6UTfGYquiC/P/E66dgvS8Z93kGfOc3alg+QKYSCqJecrQKeVPCRo+tZ1/xcBXfpgi
	O/l08iByLXxv3K4/Ag1P3+vLrDZj51wKLBBDP2UNphgyzJbcXpjmJ3JCZs86ZyYNopOc1PwLPyZ
	JAXxt8H4CEoGK0gB77RW8Vp/Sa3Z+dg+LJmqqKd18PuudWHi4qX52wlrAeLcyVdeSN/TDOpRo5u
	CUUm+/h9py2Sl2ldQAKNrcOlwDoTwCTE=
X-Received: by 2002:a17:90b:5587:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-39b086549ccmr17687582a91.16.1788547862103;
        Fri, 04 Sep 2026 11:51:02 -0700 (PDT)
X-Received: by 2002:a17:90b:5587:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-39b086549ccmr17687529a91.16.1788547861586;
        Fri, 04 Sep 2026 11:51:01 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm8682644eec.24.2026.09.04.11.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:51:01 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 00:20:42 +0530
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add TCSR_UFS_CLKREF_EN
 definition
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-glymur-ufs-clk-changes-v1-1-cdff2c67a8c2@oss.qualcomm.com>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: -gCIVz-G9jSIk9plCZc2_yPUo1DMc3e5
X-Proofpoint-ORIG-GUID: -gCIVz-G9jSIk9plCZc2_yPUo1DMc3e5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX//FTRQ/mMBDm
 eb/F/cSsYApVpieR2QXTmf/qYpO+HHyd8QZMI102+dRVHZJkxiPKH5SJbykzPCsC0FNedvYAUUH
 VjMFKsJ87Cz2leLB9Hz+C0boMWfLW38=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9b1317 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=afu-3B1tbf9Pr7ydrUYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX4Xuuh2sKIWoi
 /YQFj0Vwk2rh+HBeIXNq/EtY63whB2OUT2j2QLjcFSp+pLJL1YS6a6uvThqxDqN/9i1Hed7NpC5
 YrQStIlq3fE+Kkg45z5mzAk9L2FAHF3PjSb8/G1lr9Os4EosOKf/oPArvbPG2i/J/c2urof5HBI
 fxUjJu0ttU+IOQRmYHtYkJL525Lw7+5Jcg1Nsj0eRdfKS6zpahLAiLiA/AUh3yEz75kMk68RuGU
 qeSe+6ow/Un/O/bw2kPZ1fhoZnfXCYL6ygMnacHlOp7qBR+UEGx4zVMs4R/TfD7++Sj99UbscYZ
 Z1O8c3WsEGhtS2g9EpKS6ejVVq7kdsSvn70zhp1i6e8ZcZK8XfjHfxylUgPnxNGlS+BzYL0CiGb
 dIUwTkFu/wIoY+TJKcFQFDS4YlX71aPyXAOq3N9h7nxnrKNZDWi2kU1Q4TBaHXEHYmvKnJCs80E
 waOLfI2ha++IPbwnolA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040172

UFS and PCIE_4 share the same clkref enable on Glymur. Hence define
TCSR_UFS_CLKREF_EN as an alias of TCSR_PCIE_4_CLKREF_EN for UFS consumers
to reference the shared clkref on Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,glymur-tcsr.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,glymur-tcsr.h b/include/dt-bindings/clock/qcom,glymur-tcsr.h
index 72614226b113bb60f1e430fc18e13c46c8b043d3..f338ab4454a14aa75532cd0a6a56b6bbb02f9448 100644
--- a/include/dt-bindings/clock/qcom,glymur-tcsr.h
+++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
@@ -20,5 +20,6 @@
 #define TCSR_USB3_1_CLKREF_EN					10
 #define TCSR_USB4_1_CLKREF_EN					11
 #define TCSR_USB4_2_CLKREF_EN					12
+#define TCSR_UFS_CLKREF_EN					TCSR_PCIE_4_CLKREF_EN
 
 #endif

-- 
2.34.1

