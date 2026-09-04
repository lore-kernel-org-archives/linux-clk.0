Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754BC521200
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547871; cv=none; b=NtFdYI3Y/Caz8RawT2P014L6eY+i/ri1DgSQKx6lzeMiFdpF4WJT6kM4MIjSVeia3EWTY3RGkeun8P2esJskK+g4o/JTBYzom/yGwHgCAZva5aOe0J54LM+yu/DvtLWYHFj6Ezfy35R58s4j3rz233HAuxOr8T1NbBtKp0gig/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547871; c=relaxed/simple;
	bh=aaiDp08wzVTG6QAhHolSezVwUSY3moqF09bwcCevu9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OmwsMNLPqNaeq0jzB3xCnbFNuvTPt200iwlEGzxEJWDfFO8/HJz3m/MOAo4qLq7NwNEXfgDW/y46umaEBidMHZh7Psqv1CWyUkj8dXt1ayipb63mulDLSQTO7wCTZwhUtYz3Auk7ctqrslmuqMzc7lGTOEG0oR5w0u4uV3SCzns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGMSDfJG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZa37lLF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGMSDfJG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZa37lLF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HHuew4124895
	for <linux-clk@vger.kernel.org>; Fri, 4 Sep 2026 18:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pptcmirIY/g7PI7VGtqSACzE2lVXKtQbfWk/d8jbwiA=; b=bGMSDfJGRl/waEDd
	VyDGTXmcSydQtDAbgI18fCKz+gg5FCE3SZRMPZRMyHRxgDuzG1myzyfzlPTj2hth
	hb9paaopP1b4FSjB/e2F9fVFMtZ+hvnQ7zUUbdvK2fzZVpR+7/et3QGHelZOhG5o
	m2gkApQtmvzrZZiTbWiThRXS2yZ0X/gmlXvdozyGLRiUG0DhCvLAJHULDMlsFhHq
	gy3jiXx1KIksJQ+GGiP+Ki5OSxiO7X7LGnwgmpb3mXIRO6871UZHaJstVHb0piqt
	uZvkNJ75wGN5MViBio8gtARVvnM0pQvaa22JEReORJ76Sl9bpfvme5nBp9woZwrS
	s0K1UA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg0121nf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 18:51:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2381832a91.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 11:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788547867; x=1789152667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pptcmirIY/g7PI7VGtqSACzE2lVXKtQbfWk/d8jbwiA=;
        b=fZa37lLF91ZWeNL2H9QR6sUIwQbH8K+WZqRSjGavSzszCBm5ZxxeuvrEh5hPuOHpdm
         IMzpTgbMmeTouXa5DQ/6VIXYnW3/8AswB7TO+Cx8/1M2adqApPsqZk0CK7cDkxNl5C08
         DZFu+OGkp1Ll/CMF2aSq7x/yywTsGh1HMcqxNTlFat4kn13TRa3LkkhkZ2lk2qX5WJ37
         jEsjZBmny2Z4r3/RUuLin1iHsJ5sBi3K4yoBvOHG+W+z8QG84Qpc84h7JOgdm6lvPKx3
         ORTKRVbUyk2TTaDUyrfZ2Zog7LJAuY3HbdNLwnk2eiBJ5yDqYp3dzyARzM2nvYchArPk
         dXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547867; x=1789152667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pptcmirIY/g7PI7VGtqSACzE2lVXKtQbfWk/d8jbwiA=;
        b=efukbrgWPJzUec0Y04nBuLI2d+TsYZYS4nQG0Ot92ClhTxSedXWo0F1T5pFqi0Okfv
         ROybhxQK9jkzPBdJuPfDQktxUi1RSvwxm1NPvXyzeqRGvQdGhbDGToQ+d8WPw51KR5uD
         nYptOvnFPoMwp5JPc+NCgKUzWjdKPLIQPXg/Myqg/QWswD92dMfWgiLZCL36p0hvVdkX
         4ILB7PMOyJ4yAL93M51F55Q1oOkFekSasImBz7vyAS3JOPr6CyQA5QUTGIDg4Vs8kbv8
         i4tsqVZ5aSipDcPjJSeXNuPIV9cYZKTiH2lVZwkWLDOCPo5BJZu99qccegAE/rGoGZpQ
         3vXg==
X-Forwarded-Encrypted: i=1; AKwUvBzLDfPkoaWuQcEx2yEXl4QHO1kL4qazvLeHCXEQlKpu1Y4RScoePuoB5QFYfnktQ0Uc5gGWhZyDvbs=@vger.kernel.org
X-Gm-Message-State: AFuF++kiUMmjVEX5xoNHbeyfSf4IwUKydEUIJf3EfBhiKA6E1ejbmUvD
	A5KxRo5LQCp8+HFLGip7OmpqeEvS8Cg9erTP8/gR1HbKPjJtK4p7AROj7s5St16u5fmWi8rfwjd
	vOLOWqKErCEwOTg3CoOS0vHHkhQn0yjb3duV80TziJ7bs0SPAN2KCHsW6dlh8VXg=
X-Gm-Gg: AYBFou1xqNuc8NiWmPlp3+/tAQw9iTfppXksT+UL0r/QNaY2b9Ds4Gi2A0w71GGqJP8
	hd5BJ/TMlDN1I6cyrKnaJYglaL0qhJIOjb+pNvPZYSyDvltrG7oduLeY4NNIv+KgrTY2D4qUyYd
	fthi/8Yk7oFuHI6oQmfKKWsH/56Qvr/isE89OpGck8Pp14ARKVH3s+fL47EtEyva7flTxBdAw9u
	NYCGChvwIx8r3KZGuJpU0+FLVEk+kWnIIMMQqwy24u0QCh/QAc2C85bMYMxeS+zCJBx0ZeXabCy
	+GQKxRNcLci+NEcgH1Xf+IMAVUZFbnni5Y4BvjlA4RMncu+Mi4JzhAyqB/Gmz0gBATJZ6LrGti2
	vuxLwIBjjMkGkciFHfkeKwKCT7CsFTRk=
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr12140318a91.20.1788547867083;
        Fri, 04 Sep 2026 11:51:07 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr12140259a91.20.1788547866683;
        Fri, 04 Sep 2026 11:51:06 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm8682644eec.24.2026.09.04.11.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:51:06 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 00:20:43 +0530
Subject: [PATCH 2/4] clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-glymur-ufs-clk-changes-v1-2-cdff2c67a8c2@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=dfSwG3Xe c=1 sm=1 tr=0 ts=6a9b131c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XYjrdpVuIsIQvarJBHYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX8HDOAaumlpTb
 ra2ARio9/If8ti/wg1PYexjrucyYzkpmeHFv7qqRGH2shd/u33pBk4okNDDo4kJH+tRFVqwSRnt
 D/ri3jkXYUber1UCv+eNzcRupafN/fJpRH1PTwy8AfeYAmCbENOrOB0u7tsnUizICCSUNcJ1zjA
 0Flnc0V/K2jhKPHYhs99EJoHF+G6pw6inFi3iAwfdjZTT9Af0yXeOcdbCcUh4oF+fyn4RxFoJDv
 yIoc31oDbHb7UR8NkjgMse9vnlmaFm+rJqyn/eqgVmqjSZYoxDu+2aq45UEwHSq3KegBpHXkHZL
 LMYbcOeZjpHAmgKiGJr/uczWSsFlyCeiDKlYNtsgV27kyoT8lCkvrpA099GPtGyoldcNss/ODvV
 k1W9a/eX+BSpzysPpnDUenQFKyEsOTwPZ2exGeLWyeUGJ7dlvS/TSqDb93TE+jzxTrax8bNThKm
 u/eBkL+RIUCTr33Uj5w==
X-Proofpoint-GUID: KtOmmMBmvAtwMFatGqSsXNUesJgbeHX5
X-Proofpoint-ORIG-GUID: KtOmmMBmvAtwMFatGqSsXNUesJgbeHX5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX4qEPYXmFcyF8
 Mid4TGshpm75I3+5bdxO01a85kTFoVrkIkYR7+GLLaXOAnSzU7VM0I0OrYbp4Wrizmw7ZehMJi/
 b1gM467sx1rlT/UFUdP/0anS/hq17zU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040172

Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index ec8700b6186d8d6dd1911b7a33f086805770284a..3db81c709729b547f288eb10d4aa5dcf63d9e951 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -393,6 +393,7 @@ DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk7, _a1_e0, "C7A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
 
 DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
@@ -902,6 +903,10 @@ static struct clk_hw *glymur_rpmh_clocks[] = {
 	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a1_e0_ao.hw,
 	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a1_e0.hw,
 	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a1_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a1_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a1_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a1_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a1_e0_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_glymur = {

-- 
2.34.1

