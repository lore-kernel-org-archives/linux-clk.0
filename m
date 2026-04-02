Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D03336D9EE
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 06:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775110591; cv=none; b=QZmR8JzbNO1p61aq4MqovZ+1Tv7bAPvtzDTyGupQwl4pCnfEHpnQzo+PJubZsSOAdHkGqFCg0whUJY85xtzgXr2rVNgVaBAPZJVVQX2G/+Jfk62WelIRIaVLfNM15fUTKovZUl35J7vw1ScY3KrE1nviQ2jD19g6o2oAdr3Ax+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775110591; c=relaxed/simple;
	bh=SnlnvFvNXltJOABCkMLBX/l5jnrfqsE/n4a8CvOEVH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HbzNECYQvn3B8CABv2d5S9O2C+YpB6AONuxkDwMUdgHAjH/bsNe9i8VnHo/E9ME/UZ0vNWhYYaGvs32f+aVAH6bPbJ2jmwOKdK4xZsoCqGPwf8zz2VwmEwnDXxm93DH5hHZKYmOoEkioUeN1pw276MFLKv5nHDhl/ksMg4/zuM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8dFjbm2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGTgsw9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8dFjbm2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGTgsw9T"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4M4F3044345
	for <linux-clk@vger.kernel.org>; Thu, 2 Apr 2026 06:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ptCIlP6pgcTOp7E0wbs0Bq+bVgH3nVEeZjcudJT4oFo=; b=o8dFjbm2k03WDcfI
	3QUkAjG9FXexlABQa+DeBY7YUlysHbpjm8zWxBVNRiyu1mQIMUEQvXZlSkS4nolB
	OwKoHdRuas7uXfKKtpff/uFkkFubvWLg00Xb0QIqmQz60BqExVOYHNY3UNIQdikr
	DrnSi1mmBOkGcQ1oKsJou41BLWtaoUCyBGAlVu1XeUPRoL6OYw/P0/GTGp9qaW+I
	FEVQEkJY9shSCNeYEESS8CrTWalvLsDwRk1OHNFJThKcI1iz7OjYL6KPEy5d/+u5
	DuVyn07nI4xmM8mOFYQNmWFE7txHsdOYrz8Dkzd4+uSOSNmRL8CkLNeuuhiSj7TP
	6POLTA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483u9q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Apr 2026 06:16:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24611696eso3349795ad.3
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 23:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775110589; x=1775715389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptCIlP6pgcTOp7E0wbs0Bq+bVgH3nVEeZjcudJT4oFo=;
        b=CGTgsw9T094C/8PVe4PZvNyC5V+FeYWdkt/PCwCRbW6YVwuviksANrkwp/ist4oFAJ
         5unRBRoxuSYVjYaryYG+u5lrVWVxM+74OPenMOsLc8I8mqMZes4omv94Bl3PTPxq660R
         BdhBQeH5mmh2W32aCmU3J5DLn+KRGOmQ9dshkZ3Ce43g3y8lX1MGyn9k+K/aOLhJ8II0
         PQ44ueyHGmHrq80tjBDc2+0DRuRzgT6xZQneYrmCkQ2PoK1SJXmAn+MYA1/vHCiBnPyw
         /rGfqF8nvcHqxeWvfR2RBJiDTLW/fmoYhn0xPxVvHZESzuDw7PQgTVTNbSTXcBH10l9V
         ADGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110589; x=1775715389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ptCIlP6pgcTOp7E0wbs0Bq+bVgH3nVEeZjcudJT4oFo=;
        b=nYwBSJnYbM6VJ53cimHmc02+W9Fyr3wwE/xGlGH8YVceNJ7H8lguk7aATuVbmYgGZJ
         FwzNwuE5imzeYhr8sxJqY9TcrH4qPd8/FoaeOOBmKFYiEZiyZABMF3EtDqf/R3BkOP/9
         mmcn06kyRtkO3+wHNy1oSbgxjW8WJju1CINnl34Q6yWhn5505gg8Q7mptwjFfTbm/2t9
         eOPtJkrDxdCzV7DY3nvNHfmHMmtM19bNa6vJCaRgcKxgrKu9ofY7LAw6kwiUsWutgf6j
         Y+EpAOuHuT8EDkiTxvqqCo0hZggp2Xx6ZxFGpACZstE1L6nH6EwW7mW8Yl8lPyeo+RLd
         6mIA==
X-Forwarded-Encrypted: i=1; AJvYcCVmrDHC4XIvmBlHAzgr20XSTH+MR5G37yNnmQQtc8wQEYN8VRR3+ye+fw/Hv6aIfFM1hS3fnX2Hj2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywah9h14E8/4drRtEiAFBhSUSRdGIOlgHgbu8yqXpApRFRB3Ino
	lZZ5+3lSdxJtZKf3dU1TcEOnaHsa5q4kd6TmrkBKueUwrb+dVlGEcWrJFTYQshYd/Khc8CoPOK7
	MepGJ7S/73t+eeNlqURS4isg5jfydRwjfMmMkfrkWkm2aGrzrhux7YqjqeyUmHUE=
X-Gm-Gg: AeBDievRsMF6kx3wUIKYrWncraTZnWv3vWMR+467Q0BjznLE1SFlGess7R6ooF36wdD
	zOxXOGhoCY85Gywruy97mCfjeLzimT2qgHm648/sHA12XTDTFk30H+GuENxQsw7h2tqQclbQ4CR
	AanFo/eVi6WZSmXnbcDr0hyevVNflXpzBgPzcWvmdN+Wj7VTPVgNQdP3caTsfnPI0PN+YfQXL4U
	POXwX96CRxyHh6VOXl2kvpG6nH6BgKP/zwZmXUG4riAQZckniJdiXrCjqO6CFVGVzd5/L0sIXzW
	m4LOiyZegjrazWPE3r7k5UHsX4kseoBiKgZBj4lfRebgcvALJ3cbwfoQ6Uz3SBlv/Gre46k3YXe
	kxl4I8xVJRCIG2VMMjuxBz3UK1b6F6AQUnbHhRXp2rPjq+Ms/Zc+Y
X-Received: by 2002:a17:903:2391:b0:2b2:5857:6011 with SMTP id d9443c01a7336-2b269b066cfmr69582865ad.19.1775110588719;
        Wed, 01 Apr 2026 23:16:28 -0700 (PDT)
X-Received: by 2002:a17:903:2391:b0:2b2:5857:6011 with SMTP id d9443c01a7336-2b269b066cfmr69582575ad.19.1775110588259;
        Wed, 01 Apr 2026 23:16:28 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbc58sm16538615ad.78.2026.04.01.23.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 23:16:27 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 11:45:45 +0530
Subject: [PATCH 3/4] arm64: dts: qcom: glymur: Add camera clock controller
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-glymur_camcc-v1-3-e8da05a21da7@oss.qualcomm.com>
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
In-Reply-To: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce09bd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3iLwGWznUEgL9WBE7MAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1MyBTYWx0ZWRfX1hydXdvDdmha
 uDfPX1jPyAucRJmguwDtgo39+R/nnZoi3LCgBVrLCHkQT/OM5Qpg5+6r2ko2gipgYZi3TPcs9k9
 P57RC/pqpQIj/UvX3VCsQd/jiYkqpPl7uobK5rzdMQQ+Xb8wykKKQ11K+ktdrVhpcYjsOsxM8p5
 pT1+lLC2LR1rGj0VQdzDOcQnOQnsUHXEieVIYSv5Fo4imo60ClZLP5c8SM8psggbW4UFvN1tbQC
 ggoT3iT8bzOlP3bJ0Iq5DuHLwfopw7pLDClrEHo844+N56rDr1J48SQs6o8lnm8MG+osYLxi6hf
 sbrImOtA419N9/GRDa1HXSUTcCFdQcFZFl4xmLew6BmxHjJnGPktEad42RiY7UqXovPkZWaLhPy
 LRh0dSNupWMGxoKoBmAhId0qgyl1ANc/NEHZzV69cfMBIjb7dsf6K3mRocO9ehUFfwKd0YhJiAB
 L7TscuQNPpsEiPF4Vqg==
X-Proofpoint-ORIG-GUID: ACmxqSjge-zTR6swwsWF32ZF3oOYX5Re
X-Proofpoint-GUID: ACmxqSjge-zTR6swwsWF32ZF3oOYX5Re
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020053

Add support for camera clock controller for camera clients to
be able to request for camera clocks on Glymur SoC's.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..c32f0b84db2f38ec567485e36e8e50529e886775 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4163,6 +4163,22 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,glymur-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,glymur-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1

