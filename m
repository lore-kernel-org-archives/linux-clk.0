Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7882749CF
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 04:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784261058; cv=none; b=as64xl2r05M/uGFAr3aFYZH652zir/G5WDL8Nh9Q0mRSAgIyKBovPux/h7mQUvvDdjoot492KmbjABqW+3+rXfd5j0g9ZSBQmrnxFi4/OBVfsvceMLy7dIzYswkblPpy8UElZwRlFVtmi0rV93Yk4z0YIU0LKfFvRdGAgbHvihs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784261058; c=relaxed/simple;
	bh=1DsE4Bsv4Gds3hE9iwfqWn1suu+Tw+ktWE3Vj+dXptg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IdlNDOB2GHEW0jSyBL4Eashk06nidlQ1HN/XYEwoTCtJriBBbMfgn66OHEDhTWOqpkNvaMjja40+hq788rCqq27Ekv2gtAoyo3sxOHIuOW8tTdfzXBRj1gbJKlY4Hu1qiDeF9AWx//AONMhinnFYph5ZF89gfvIS/ONm0HWTRpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgnLR6cA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyRIxv0s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgnLR6cA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyRIxv0s"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H34WZS183603
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 04:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D6WEWtaCasPmJS2FvmhCAq
	uOK0Hh5FzeBp+CYGjkBVM=; b=SgnLR6cAsIyzCTaNBYrF/xfhWZNJxrnc4B2q45
	m6pwWFRBnQ7YuJiIcTkJKE50pptOUGlCJAxDi+Z1z+iBm2jq91Du/C7IRud31tlF
	gZWHmLCw2kOcczsmMXOj99Y22vF0TCVxJbMqwx9nKSQO4U08XtAUXxjmQQqo2oyh
	EWNYuH2RihFwr4fd5nu/yklK3P7g6q9RVCJ2T27nNsVdHm56QcPTg68QsimytstL
	F/W1y0DmPcUwSx2IaEsrhr15k7SJJnEfJ/jS9YGcOA55WJGeThE+faqYjfgCTFTF
	mGQFJE4mbhS738qRFljAobRdpw+iKfQBoi3/lzFuVjuzR4wg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9jjs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 04:04:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc101287aso8550825a91.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 21:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784261056; x=1784865856; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D6WEWtaCasPmJS2FvmhCAquOK0Hh5FzeBp+CYGjkBVM=;
        b=RyRIxv0sq21mW6JnEn3xMcJFVVtmhkHcrn2get20UVzsLyYexemegSkgSC40OTKjBY
         1haOby1LxsLoBeDAYVaFFNZCDG44ca6n+RDiS/3n0dZO9OySXpUuRDV+tiZzEYlOjnce
         UKLezs82+a/8wMZL3JhZnb0e+NUyOgs6YrV5fmjKDLSTEdnR8f6+jlVMeTftaEKF2eUF
         Y7OcZF5pw02ikKcWAqIi9PaljlrGfmdxs9LIpzH/Px2+pAQZLPuY8RN/3kqe9eaLxBU8
         mTUq6wHlEaS/jnUq3VxPFAvKy7SIpX36Wo3kWZG0hRvv1BjYmXokGFI+R+tKO9cET9n7
         psXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784261056; x=1784865856;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=D6WEWtaCasPmJS2FvmhCAquOK0Hh5FzeBp+CYGjkBVM=;
        b=pgSU/wTEA8g4MsJwueA2P0DL9LUcsOz6cVr2G0xZk2Zbe1yj1H3s9vE0QpAkPz53rk
         fzdM95q7H5QxNYnuXHlqtJbmJMSbxASHPSP7TRkwbOtEAD1uq8OBmF7/okh8cIa+U7mT
         AGKsn++F6YFFoFTQLPA08bFLefq7BZ5jXbBgEurvxtRtKnvV9h1IQtpgYw5HUpR0IgyV
         Cn4CG8wTE/e/2kGjfW1/lyuYMdSgG218w+593uq4bXxDvzE0SQYEENcW1UevpFWOjVU9
         myNQRjb7h/YbvfOAIy7yl9YOInfb8E3wvT6alNBvOP9yTODYipVFvJEnQhfvNwmhwPiq
         Lhng==
X-Forwarded-Encrypted: i=1; AHgh+RqO+kNQ5I6wbhjUPgHUwaINm171s5x/F94aGCImpT3bMFFJtwdLALGptGaJPTMgvt9tsRF7mWICUeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJskMWXG/5F/nXuVcW5iNOdpXy7/NbjljZ1dqdi3ADm5hOiBs
	o14BUbK9Gh7s3e8EbkBfDZ9fmuEviLUL9jQMP0Clnc7sgvISnH0Dq5DW3tc4enI9PZllvfDpoxO
	ox8vootqGUMoN5ZWf3fObYIiY9l+SArwjn9hXarx85gwsfr1wWl2tMnv/9ehXpkg=
X-Gm-Gg: AfdE7cmX29Pzb5Ey8azPpPSxtd9Nhowm4YODVWM4jBC9Mc5ysjmuuKwcvxvsanm7pzY
	Vo6Nlmg0VoyUHY66td25CRVs0bwxz/jvOp6Cyjy6kj7TkujXnhtH3TTTjsBmj8ro7GcbsV0C1+i
	OZEPBirWFFP2/XmH1oowEOVgYBpwdWGetNvPybJKy7XizClAT4cZbXxbR4t2WeBLWiUftRa2zLd
	FMb4717+nKI6bGfKGJE93kSF9zxVRf63+bC3Kw0h8q5hWC1bB/K7OjLehT2QkWItaHtj85tvrKE
	H1yHWkEoCxr6q+FZ9804+8BK8aMjM46k+sxlJ53mMqBukzhxP1PBoQqDtIx0mDjhc8mPNcqCH3Z
	Etp9kcw/3jSuhK7YBPxeRN1cS9RDJCNA=
X-Received: by 2002:a17:90a:e7d0:b0:38e:37ad:5796 with SMTP id 98e67ed59e1d1-38e4b5b6ea7mr795498a91.42.1784261056121;
        Thu, 16 Jul 2026 21:04:16 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d0:b0:38e:37ad:5796 with SMTP id 98e67ed59e1d1-38e4b5b6ea7mr795469a91.42.1784261055650;
        Thu, 16 Jul 2026 21:04:15 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1ddeb6sm2021439eec.20.2026.07.16.21.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 21:04:15 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:33:58 +0530
Subject: [PATCH] clk: qcom: gcc-shikra: Add additional frequencies for EMAC
 RGMII clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK2pWWoC/x3MQQqEMAxA0atI1ga01Fa9irioNWoQdSYBEcS7W
 1y+xf83KAmTQpvdIHSy8rEnlHkGcQn7TMhjMpjCuMKXHgeLuvAqAecYkbYQcRL6KxrrmrEenA2
 +gpT/hCa+vnXXP88LFyIwS2oAAAA=
X-Change-ID: 20260717-b4-shikra-gcc-emac-freqs-2469d8b64a75
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a59a9c0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=aR1S6OqT_Anhih9h-SwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzNiBTYWx0ZWRfX1d5MAzy5e9jX
 J4rMLLz0GLwmCiB4hlP0ulKA3ghUVvviXLobxSUTzWHPqK/BwVBj4YRa3bOFBnP3sN6gvmZRcE6
 CEdfaqTt69YHzqqir9crEY1cmWWFTtnbdsDit6gLhAOkEXlteMCCA0wBbGUKd3N2i5uKid4VStR
 opYQgIGV0MeDR2sEwFeN9dT/dqbjVwwdhYoKmlhu/lblo1rYAIOliBs1IIaf0UfLnUvHYIb4VkX
 P9JNcX6A/pzl8Gpyckd3qAp8vurK1G1wfqc5Y6vSRVxeJZZNN0NsN9EmBivAeenEPuXEP0wt6pV
 Zx1O184Lqa7ZD1z6UiIjTt59unsbLQpigms0do/Di1H3c33BoEZwMKdaIMENqHFmoIlxAwBxtPB
 WivEXorzqh+eUdbrJpDHTyFWjS7sbflztAA0j3dywN1y9WwPR+QCr8cCdacJTvgkdHEXLLDlcR9
 wkQOEIiRiF4Vxlp1WeQ==
X-Proofpoint-GUID: hYtmjRHf_LsrUuGdW0ysxMY-amUyE98W
X-Proofpoint-ORIG-GUID: hYtmjRHf_LsrUuGdW0ysxMY-amUyE98W
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzNiBTYWx0ZWRfX8BmFsu8iQPMM
 GZUqb9EHmE6bc0ymmP6nLcSpYRGDPjwX+rTOAcm/+uUeGoESr9CeiaxLnyqPGUX4puMfh/VZpcY
 zyyqFNjkTy7fEYQ9prVlVgsWWoVPYPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170036

Add support for additional GCC EMAC RGMII clock frequencies (2.5MHz and
25MHz) required for the EMAC use-cases on Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-shikra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index d5222756f214c356214039f95a93a28fc542801b..f2ab50209e1c037cb84db67951def053880406ff 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -1244,6 +1244,8 @@ static struct clk_rcg2 gcc_emac0_ptp_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_emac0_rgmii_clk_src[] = {
+	F(2500000, P_GPLL0_OUT_AUX2, 10, 1, 12),
+	F(25000000, P_GPLL0_OUT_AUX2, 12, 0, 0),
 	F(50000000, P_GPLL0_OUT_AUX2, 6, 0, 0),
 	F(125000000, P_GPLL12_OUT_AUX2, 4, 0, 0),
 	F(250000000, P_GPLL12_OUT_EARLY, 4, 0, 0),

---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260717-b4-shikra-gcc-emac-freqs-2469d8b64a75

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

