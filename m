Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561402D6E5A
	for <linux-clk@vger.kernel.org>; Fri,  2 Jan 2026 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767347021; cv=none; b=KvEqGwvPeb/xkxoXtQZ1b4eeOwXFQQnSC1sVxZh1U3Ingec2bxCdnRuh0bnQFrzBFYnrYAosr10UihE2AzNjcZL0bUbBmtE0PNOTiJc2YHgi3QBHgcJMRQ5JiVSMxRTuqXDeh2jqs7VtqtekVVjQoohf/SjcsKdqJuLPZZ6+75M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767347021; c=relaxed/simple;
	bh=NSkQnKJcfadz3AF6tccNlZKti0/dp5ZM6ojEWXzzpxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dgkJXkeXzbmYdCRfeg5ntE1Q97j23e9DmdostEk3jALuHuzQ97pIGZetcnAfW1BSl5JAT3KokdpUd4lN81QkNRGbti6YQDIrd4Bm2vypIOD615Rv/Y/zegnYDLzHfO3uNmgfOm7yKWCUIOl/1VModxF5mb7WwQ7vpIP7ucXvEoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Glm26REU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXPjEdA1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Glm26REU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXPjEdA1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VwvA784387
	for <linux-clk@vger.kernel.org>; Fri, 2 Jan 2026 09:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a6B0Mr1Iv6eduvsLfOaq+Q/gOOfWzJbBtPGlP1TnbnQ=; b=Glm26REUyfy9oAF+
	o6hgIAVw3mnpInprMfXYqpaU4AQJ4+e9jizt2N6QVAZ7sSdcCu7JpRZlyPP4E6Xd
	/+ik4CuLKddfAx5CPRszlPwLw79lo6t9744SB+4oR+PDNKzSFoR0YX4KkdtoYI9j
	qZ5gTkcCWB6JIR+hogFdWboLUFQSJNjFv7gZu6KQCdEVtAu01Q/S50n3aQ8JPnMN
	b+kVqeWO7Q8JBr9yWHosTUDsJvVAsyRv7KTT3mLUISGm/Hw6FpHgJbE9+NrHGD6f
	EfrNZHNI3BaapJvEcoiK9ugDdsVZFEg7LHd/qC2FrJghN34JssMUcb6y081gLQdo
	Xu9uLw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vtk39h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 09:43:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f13989cd3so356618655ad.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 01:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767347018; x=1767951818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6B0Mr1Iv6eduvsLfOaq+Q/gOOfWzJbBtPGlP1TnbnQ=;
        b=LXPjEdA1ZCxtICmBBUBjXQgeo255LD9If4c5mokQ2/BMnFsdHDhyw7wwpPt/e/dxLp
         OujmWMOTVZH3WtokBRe7+I3k9n5xImWxNdAsRGFAAPYcZHcYHr5qmuKQLJgGFmWe9Nss
         ROhw/AbtResIpM6TCO4sbbl4RCBj6Dlx6dCIbO/cToyPZ3K5mApa0XC+A2roc8cxxWmy
         haSNm6OYlqSk1KMWxk6x9i7BNIkSK72HAm3Eww/ef+AEn3MHytwImatH09MIK7fiZuNU
         2+bFUii/9Q1wMK+2LSibxan3C3cJc1lDSc45cFYEcuSCvefdxoxcbQelx97/5ciCZW6V
         jNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767347018; x=1767951818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a6B0Mr1Iv6eduvsLfOaq+Q/gOOfWzJbBtPGlP1TnbnQ=;
        b=pQq3obG9nLCyOWXPde8lZL1+SvR+HTGtZLArLlYqyYFnHUNQkRQuVe8WJklZQ0IV2q
         vx/ChAkw5dOYIpGM/oOvpcdfDPc1LlXWfRq1rVWMKZEHa+NHMXlFiVD1qftoo3IKNlWV
         HBpUoesA5nStv3xsji3W7dsXm8QvIMtInAdzSs7lUmhvGH2yruPYyPGDTHJkpy0JcbVr
         dxxX4t+ZOAQonL3WtGe+Wf8aiZ9zkg5xqWUNsIDqjeBKRjFDipqLZKFIKo767/DcwCjb
         bzc9Jh9yAazqbYq1eMRgoILeelNk9iVWgeg1PmpK7OG0XW99pcsff0SQsXbfu7R7bDZa
         jgDg==
X-Forwarded-Encrypted: i=1; AJvYcCWz9hzk6rVK/o12InkiTH1Ce+o1UVhwa86hh3dJh71Xu1lfcfutzmBZRuK0K0+UpFQHqYFxgxjleGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymgf+70h7CF3OOT5VUXzJl666DdUJsbqez4ns9FcN1xjbK4i/K
	6c9uZ+pqdABI0KXUbMDmW7lrjioIrjrb6nbbHdY/2czcuHWiUb+DIF2/3RV+1bhHaR9fSNaeFch
	4GZGnQ2POP5WPIC9b4QwcBcVpFARHL4MuFCHeNOUS5/gixY5TnXfH5161/LZZweQ=
X-Gm-Gg: AY/fxX7rc6OZF6MKtnTb6WNYOIH1d/Y4w0Sy6vL6eLi6cd2NeJwwySyrR57oZfFTslk
	PS3/yU/b0GN6FaSBj2nxCa/nJTQCucBVWJbXswqskwlqvJnbcKvYE18NesyvQ/6SvvV+7ZoJ3bt
	x7/DCMp2zfjQryFXQ0XrSSZh945o3/V3xYHoS9SsS6rpvOc2ENMfRHHNFdXMcguHl+zKJh5ZO24
	oGp3UK3/F2vy2xOGqhbRXiveSNhBneTaInyWzBSTsp69sGin9bmpdI+Y92vvHrVBQhfWG2E1iXB
	JFVJTwxcL2kf5T1DYav/3WVSse13v9ncBjN8zDIby03iRhpUoLYLMsj9Dq8JzuEwXWEqhue444O
	FJB2qIfWEaWoKQpnARc0bJwI7JFwaojzCy5gtlzyCdm68
X-Received: by 2002:a17:903:19e6:b0:295:96bc:8699 with SMTP id d9443c01a7336-2a2f222bc5fmr447731055ad.20.1767347018122;
        Fri, 02 Jan 2026 01:43:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/KTc9e40CfrkuA0sDQKGRGgRN1IJNNLflSBZ50gGpN7B4a7iFbpOPyYm5WRjRBzLPJY6AxA==
X-Received: by 2002:a17:903:19e6:b0:295:96bc:8699 with SMTP id d9443c01a7336-2a2f222bc5fmr447730795ad.20.1767347017661;
        Fri, 02 Jan 2026 01:43:37 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66829sm376154255ad.10.2026.01.02.01.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:43:37 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 02 Jan 2026 15:13:03 +0530
Subject: [PATCH 3/7] clk: qcom: gcc-sm8750: Do not turn off PCIe GDSCs
 during gdsc_disable()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-pci_gdsc_fix-v1-3-b17ed3d175bc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767346994; l=1176;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=NSkQnKJcfadz3AF6tccNlZKti0/dp5ZM6ojEWXzzpxc=;
 b=HV/XpdIiv2DoZjDrSjFt71b7G5uTUfB364AH7QNl/EwI6irz9v+3eSIUJ/GdoIf2tUL9wW87W
 eb6fTQEhKjzCWQEr7eLXKsSRlfzsBsDHsrva7NmKOu3s4CIDnHAdsTm
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6957934b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ByFm4HHrRE6C6VNyrcUA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: YcjK6P17rGJoINmJtfD5hxubbSNAxKAF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NiBTYWx0ZWRfX5pGzmOwG06+F
 rWGn2WMrH+CqY+pGL7YgfyelLtBiwXxEeRKjDj+bPI3gyHU6QlTvBEklUYhVGtxm+8+xVSs5KSz
 ivzl8fgCLuF+OKJTHLHHv75MH4hkN/5+PwFsXkVLq6uFBodvLGduA3E+8hNxB4pmvgYcw2EAsUx
 ZyirC7YxyAB/2ziuw+g5DNO3h1DihCiHhUXPq34i0DddEpEza8qUFeAN/JjtFkldS5EyA03WUzF
 mIhiOkCgZa108MIfrTLMciklePCrtYTrnL2k9QPultP7CxsUc/KA8qjhxQWBEnTzHuJchRZsxA4
 rSUzqhvOxaaMqSyjVlaL2FiqNlXCPfQzgl4abXzUsWc/VeoNY+qmJPX8azDnMD6f7wQjyP41C97
 Rhlmfe1mlYssaezbiHuJbiYCtRIePO9s11MYkOn+9S+pmGnI6i9Xbv3LA+C/wMksID/VCqRtj4M
 NVh8ty8H8H4BwrYzoag==
X-Proofpoint-GUID: YcjK6P17rGJoINmJtfD5hxubbSNAxKAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020086

With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
can happen during scenarios such as system suspend and breaks the resume
of PCIe controllers from suspend.

So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
during gdsc_disable() and allow the hardware to transition the GDSCs to
retention when the parent domain enters low power state during system
suspend.

Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
Cc: stable@vger.kernel.org
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index db81569dd4b17de1c70ab5058d4ea186e08ce09e..ef072e6e4d9aeac5bf24116407ec75aad290a571 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -2891,7 +2891,7 @@ static struct gdsc gcc_pcie_0_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 

-- 
2.34.1

