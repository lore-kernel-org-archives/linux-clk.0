Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A885D369D6E
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017229; cv=none; b=ko8nqouyAbXWM8VNEwwkZvpGYLV1FWSuAHQYc0/tJWeuV1YLLRAPUUd/0O2mdJsQ/2Jbe1dbPbqXusD8RjXKc4CjD0v+UZUsQMlwM7SRFaw8BxZwhKOsNbP/QG5AnWpt0QcoAJTkWg57UNFktINywJcYq1wLQ0Loy3dTNXibhIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017229; c=relaxed/simple;
	bh=dc+tPFXb8nH2BbNiIpPTtY7ziV1I+rcpbfq0MoU3rsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lGOBwZTj0vPBB5EjxVEYJPjYHJCsFM3Z9ypFFt4Iecp9B0ztDVYFn9ZmssF77RBhufTeK7141261aNM1g3yWOz6EYiGObEGrc9ZtaijeCyZ+cpRVoIlB73VFW0xTRMOIEJbTuXGNVf1kXa4qL7MhaqT+N1CWFaufbKChgRBxGys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gj7kV06e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eXPCxbxc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gj7kV06e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eXPCxbxc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3MKS665956
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bp9MMoZ0uCFdttdfaI4jFzKn+Nevlh+VGo9/D9m1NIg=; b=gj7kV06eHHeTn4kk
	Iwwibf6l2AXx5TYGHrZZ+h3BfY8r7v0uxE1sjbdjgXYTSE8ZB0mSTEYGNagHZq/r
	GnFFybYJH8TbIyhR3SM+ML0hcuseZnmCOWyjVKFkRpD9oaTQ4JtFOqt1fhyHSILY
	juZ58+QCRm/w25PZjNi+Vcr6H9JuZ+MRnNT/uXB10k5zlc09lK4mmTNr1hh+6oxg
	78zmdweJXY//XBUQ8Scl5VvHP4mt1sQNUepKe8/DYCTYrV3ibcBxoUgwSeq2eLpZ
	jWjiVDZlUkB8cSR+AweTuyig7i5uAAfBIiqOc/k8Dfho61+OVy4pLA8JA4Z+MdoI
	xxTneQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc2qsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:33:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c80f89b64bso34637175ad.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017226; x=1783622026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bp9MMoZ0uCFdttdfaI4jFzKn+Nevlh+VGo9/D9m1NIg=;
        b=eXPCxbxc/sq2/rmKLzuGgamo0t/rtPkn98URr4bSL2GVXv/PpqndOymJEuBTfzRObu
         u02KJ5OL+x9DgH5K2Xk3Efk19SfMmMfPf7bDJiA2pIqkFeS1DlfkJvg4YMkXeU/80cPD
         nGmWF1Fmsu9CnCMwIUeZl4mTm+Nr57V1v5K3rw6IV6KKB6PkuqLZQSUstn53/llWlZW5
         PALBtHoDwmrp3z4xzpKm8MsLr2YXxYHq/oVTGY86j7ryfau16kgkC9piQkgeo+tI57HA
         beY/0+Sp07axeF/60F/f9UixXOMjuQgbnjs6/JLv0JMdllTTJKPbLtfdtvide5FOUMDk
         P+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017226; x=1783622026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bp9MMoZ0uCFdttdfaI4jFzKn+Nevlh+VGo9/D9m1NIg=;
        b=EodFiSnmovQR6FfLTv8VwnRA/C6oESZOV6moxINOmIX0sngsPTOJPh3ZfWXBGKrZ7W
         FcxF1GggetOrgZ3yN5jpUv0+FsnJPHl1RNmOVUTqvFXZSdbxPeHKmnpSVuu8su43VfEx
         G6LjH4UkbI1iVGLDi/nW1bChiS9u2kWIUkxLn71lmsLwQ8t0XZiou0/Yv+eUeGpVhVke
         CK1Dgz9vS6Ikex0+Y8k4JDz6rAAep1glhobwSAhUYf8cFiWkYSYzVwdMiLskRDHEU4nN
         PyS53iZoXWweNS9O+lR+qbWKAfZpc4yAFOUsRBMDdzzNbnAIat99m6sjCiO5MHINmT1q
         C3Zg==
X-Forwarded-Encrypted: i=1; AFNElJ8Jcqd2lPLojPA+LDHPT0fVtsgLaVUt3YBsn/GMJ8+umoBrIAw/F9LrGvuq10TRAW6rtxtjQgdNTMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzopV2iu85lBdCCsOJHqasKkRKVY2fowe5rcciZUMvfawHiB50k
	bgwyYHPVQ+lGD6iVf6hRGnxwfQXYARHszXBfGTVybFTn2PkWVzJI5MqV7nT5WNNGFd5Lt3ufqnw
	KeeAAs4aGpTsqAiWE74jSj5epPhanAEsOQSRh1vUaKZTh4KhFVQt4s9m4QoLuue4=
X-Gm-Gg: AfdE7cm4yvSQ8rROmv/U/X8IPIU2Yd6BRJVvU3BYipWhsbpOs7jywBBNxwy9xKHn70z
	GsOyhwuUfsQnWrK1NxnIZeSvCb+KkjqEWuOZjdmbfTCiWnUoNAc3ewIMr5hdrsFUyT56rui18I6
	/Wfnk/S0uu7w2zgBKreguM1oVglCGqbZs2wX7itESWBl5yVuMuQNTuyjFvVVu/ML66I+TFwm1b2
	+9Ljtl7r4xWQJ56esUKv6hk5ILad1zZWQcZ3Qb3rShdH8o0BwNI4U6tSlSrGJvA8/LdMhxm0068
	TNwwWoFQWfADHm1pIbZdrPh6F9TWhV70NdFQEhzm/9SsGz0fbixK8wQc84R1hXfQ2B9N2MglJ8l
	xeT9igJP73yz196rtuJBuDjDCFD7XjeO995GFXmRSSg==
X-Received: by 2002:a05:6a21:898d:b0:3bf:edfb:62f0 with SMTP id adf61e73a8af0-3bfedfb6d70mr7814579637.55.1783017225433;
        Thu, 02 Jul 2026 11:33:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:898d:b0:3bf:edfb:62f0 with SMTP id adf61e73a8af0-3bfedfb6d70mr7814551637.55.1783017224917;
        Thu, 02 Jul 2026 11:33:44 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:44 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:31 +0530
Subject: [PATCH v5 09/19] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for
 DISPCC and GPUCC GDSCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: K9-8M2_LS9PJiNZ1Xj21u0aOSV679Qzc
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a46af0a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WgD0fBIP9JuU60yQWEYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX3Ua02quHwZm/
 p9xfdJ5HesuvkoMNpoV2U+bt9Kjp5zhXJWHEGQvWB5b0byW+gVXRFBy4A6dD9M0sYMTdv8zN6wU
 GMy2ADAVkNtqHVRhs7Seuo29LWHhkEHcIIMZUvSj0JxFdoCllX2gxpMT7xaT4XOsV3EBlUg/UYa
 qc0XSTwIit4G9t9eLq4vtcZGJEwkaAbH0LtHEbtS80VKzkDXnJTxEz3nM3JWxa0jQhB+MOeMj2F
 Yz6vqPCeGYe82SexczczWe52y5JqIGZFJ/jCemfOKwQut8RBs4DVb5hyCzYMuVqQA8hFTqnPM5k
 Pk+f41HvA4B3jxVx2gdhOGw57JeyI9lBvoNHYj+QQoDemmGlBvUmN76aJaEVsw/T+eqtC1Ol5g/
 DEAkRfN+9QODFTbCXv6LEc9DAQ3AB9RrZNDMCabS/dvuoLtMWnVqTnfWvmlSESMtJP1lhDJohrU
 6c/kQqy7Op+G5kDASTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX4NJnnPwIAtc6
 vdwrDvNOVCJxvlktZKh119kfXdAmxiREstT8bpN09kL7A8tfv9yUGemiTCxFsMon4WBxGFo+Mpr
 B4TZTuZDVNevKA/rNNkoPQH1XECaxao=
X-Proofpoint-GUID: K9-8M2_LS9PJiNZ1Xj21u0aOSV679Qzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

On some targets, the GDSCR status bit may not reflect the actual state of
the GDSC, instead the power on/off bits in CFG_GDSCR must be polled to
determine the GDSC state correctly. Set POLL_CFG_GDSCR flag for the QCM2290
MDSS GDSC and GPUCC GX GDSC to ensure the correct GDSC status. This is not
applicable for GPUCC CX GDSC, which relies on gds_hw_ctrl status.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
 drivers/clk/qcom/gpucc-qcm2290.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 89a6cdd26217381cd44a515766363cf94d0aaeeb..6ee074555099ab72106cfae7c21adbd1b4a0fdac 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL_TRIGGER,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {
diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 66dea9d2a0e519dfc64d977ef107b5c875da3869..3b130f69bb93898ce49654f2366851a7c1c94524 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {

-- 
2.34.1

