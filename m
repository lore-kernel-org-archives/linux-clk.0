Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5788F490BF8
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328572; cv=none; b=TK7XAVFUvjFSW0rmmX4CVRGk/RSHPpG/CSemkKxaII+LEaXE1dmHdA9eOfokAB14ErBmzxL6a81ebvnW381hZjgFUcp/D+gSb2NMWLUJYGlvbCJ3D13yCqOm6ojhldrcc4/HWdit2ilxZdviF/jNwxc9UqR+4j6jpEzhFNWNkYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328572; c=relaxed/simple;
	bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gDyYbzg1BCz/rpAPcW2vlj7STZbrqB/BBFNortYTeD5EfJkwsI7HVMVc7jHWHHdWbmapsUbgXvTRSSkx9Qfp2S5P6ZcXWP0jBtToZ+vh5PGZba4CG8SKYeVM+dyr8PjfSPTOAXFgYb/W+OVjFAvfDD/zYZZkhQKU7n60sZvFcTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbSuQsMA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFGg6a75; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbSuQsMA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFGg6a75"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmF8a2403816
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=; b=FbSuQsMA9sGD9voT
	5IaGH3EiIi/OTZuLG8vKc9zA4Z3DaeBixdMWvdfTUEKqdd3PBGdpFpoyXc8qweAf
	j1E1tKFeNxV7yiIAAKb8aJY5yynFbmyqh8/hAD8mIhg8e/ECvma5Xi0+b9IMCuwr
	MoMfkp6t8zUU6ZjglAnWs/EWYaoGV9vuc94oO8z7nCIq3q+SxzwgoTso+ZQidL1Q
	ghSVox4FohOz3TE5pUoJQpUMWIPHBcXembkdVC9J9z80zg/np0ucA31A5iJa2yRJ
	mX9BcyO0fqbNpifGjlGE0UydBnMgXaQsFzb0+eD9AjB05Cl6bgwj+zxj9juCHPop
	nz8DcQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6d06b379-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:09:30 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2d1eb484aso1939785b6e.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 09:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328570; x=1787933370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=RFGg6a756xYLlFgMmr6POeUQGP7xjfe9hCVYpiZUCdicqiGB84tRgoSluUvbeHXodk
         KTrQ03IiH7yLN3qBoqc0zXHoFHS2f1ERDRHhYPYimcqC0dVm+pFGCxR0adDHTS7HRJG1
         21L+eepo7JEE9fz88BDEVFGy4RivDWeMW2R9LjMmBE/Ro6J8/McILjDY0H8GzCD3PIAV
         8NDTqeId5zyFvlmEboMG7x7FYz1aptR6hKFysgaXjN9HL0nFl0DWgq1Zh49enrKjiIWI
         gc/KMcJv+kvyXCyiU1IZjjh3I9Njvo5KdC608D5JhDXzBBH9npqZ/zANP3QKHUUo5GOY
         93DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328570; x=1787933370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=FFvrUQ3wJy2UF8ojUkpo6vQFCtnOLg6h8KisIq53XnmAroYjqME75CAKPJ4KfVwaAr
         20eZFGg/nV5GEa4kO4Drlpm5hZH4dgV6PivzdLFRnSrL6NKr9JFcLmeN0SiYnxFh/vAc
         Vcye6PAdrlUnrQkDYCXQuqwcKs2dp4poLJyBI7sPQHoKniQhviHyNhCj8KqdTmiJVXTr
         Lyy4UruWaH1YZvRAKw1Q313d8Lnc2J3ND/S1lF/hFY8kS5i+D9UtJnMhuWNyGUMvxbXY
         ci/3/NvSFq1X/y0wXdn0edQIhvRZqqmMZgnF66/BKNWuPVT32VJhG+KfhsKIUTlYTj5E
         CHhw==
X-Forwarded-Encrypted: i=1; AHgh+Rqf1dyAmHRHRRP3la98jVFRnn5PGU0NH04VYTcwbIfuorrt+HE08vTUJd2RDhls5csw89rVEa9b4SY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Ex9zzO9Jy0m+cO+6S3hH0nF066SBw1egKNH1AOqkoRwkn7nh
	vN/f9FZ3gbsa9/lzpQ/g8uza8lv9t+cAH0E8/jTCvkvZaQC+PzhMvyHiBi5/qwNoVMcC874I+2l
	8s+tcThIVaLLgJar+/W1Lq1L+quAOEoxylleJavAHJf1EkNBgCMwFS8megF0Q60Q=
X-Gm-Gg: AR+sD1348Zrgod4fXPhPEQXWk/6JaFLjmN3ebSdFsKgx9p7exKHZGtbfp46ju+XtFtp
	hBH7bsu2NGh/eeBh4dSCz31JufEadk1Lc6QK4Gk8buPYDcLJwG2rofBrz4bLplFojpu62C/vuiy
	ZsmlFW6WZzYJFeIaYYUsGU40yjebGPQjum8LHIzt+KSitYg+cALqmHsivFns35yBQY1aGUgan33
	jC2Qu4jFUfEFQ27qlgMLELZBuDhAHNOWRyAmYbMlmxrEHyrAGaBB4ojii8Dhulq8MO4A9tOPkRu
	AP2uvHmKdRR48aLqAVw+toKkv0wGfqCXkojJBHVKAHoPJofuDFZkcJnKXVS5yPO/jBylfclORc+
	fGOnG2OJaD5OL57lVbJn5xqojZvQhU28wKEW93K6o5W0PnJEHbbB/kxPFzpf+K/MGh6dp/zPfZC
	kpYb2Oqllf/zHnGXUtNTjvfeg=
X-Received: by 2002:a05:6808:192a:b0:4b2:8e51:91fb with SMTP id 5614622812f47-4b2ef38cbe8mr7352834b6e.16.1787328569761;
        Fri, 21 Aug 2026 09:09:29 -0700 (PDT)
X-Received: by 2002:a05:6808:192a:b0:4b2:8e51:91fb with SMTP id 5614622812f47-4b2ef38cbe8mr7352770b6e.16.1787328569363;
        Fri, 21 Aug 2026 09:09:29 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:28 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:55 +0530
Subject: [PATCH v3 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh
 power domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-2-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
 b=ZQq6hRuOT3Sv/p7Iga2o5Z4xvQ9K+e6HZ+qa9CVj+pK4W5CH8S/NVmAjuwyych0jxhamOfo9l
 Js/JNZDemsPAg1fxECd3OG7G21mKItHm9LrkYx7HK9DBgMn6nY1ZEKT
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX7KA8V2H37Dnk
 tEXLUMRMWLMo7v1+bGg3nKdeXcVDgxTKqEDu1E0N0GMN8XOoGZXSnjntfrqgK967Xn033CRccs+
 LVKnmtDI8gMfjGrB+mgZm5vD1LPSsAkW6ry29re92S2bXcC0TN1KM8p4XH20nI5psk1hr9Mba+q
 3NvBiyeCL5qbsrcI34yeRcxxBlWoK17Ae/mU3sCJyPCck+tyDVo78CwTo9iPg/FsFVi472Qbtvf
 +F9GKnRqllcaQYkxefI0pWnN+cNSVPF/BCtbiYeh545hLMKYEllUMfoHqjXlgwY7PZ0WybdflMv
 v7CcknJm1iO9PCwMyMpQDRUad1Z5yBR4xtZ22hqSIpR0IL42N/SnOQCznHiSQ42wZhYrdXNGCNy
 INCto+oE8I4zEGWsEgWDa2OO2iOP5uxn3JS2GXXoH3rq5YiszwFoAfRdD1kxBN6ISn8SQrE7cbZ
 +G6UBP0YBqFHeD2xuLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXyfaUC3vjaktB
 5XveaXhIw2xUEt1nNd4eMjVJqx2U+G9HarDTPJf6bmTwhxnSdQMBSfDL6SuSPEYcbtxZBWHeJpM
 4zOYl1MWhYiVsHOMdUfkq3d068AbpQY=
X-Authority-Analysis: v=2.4 cv=DdQnbPtW c=1 sm=1 tr=0 ts=6a88783a cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lHgBgSUrZIjjmBdF2hoA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: 8feAUZZjkCGMqGaxkfRZwM4KjmBOnrvE
X-Proofpoint-GUID: 8feAUZZjkCGMqGaxkfRZwM4KjmBOnrvE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Document the RPMh power domains for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55062..7fc3927efa27 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,glymur-rpmhpd
           - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
+          - qcom,kuno-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
           - qcom,msm8226-rpmpd

-- 
2.43.0

