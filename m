Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB9D2F530A
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266317; cv=none; b=Yns9JyAawiMkO4JVzqBY+OPfwqxetbAZ/Qp4ANsD4lSZn8769XAMklFbtyDTI6FTJRB6K6ICurPH4ENe78jpSx904Ob0h/dy5yBCAUw+ihUNBAFcg10NhOj6ONBDzfusdRiike7sQsZFG9p0XXC5O4M+qqJgBOzTjgHzUO8Q/Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266317; c=relaxed/simple;
	bh=BN8/AvQhJwGgdXul8ZSOIBroeozorlxiOxwARwgN1sM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qbyhx7js2fJ+QqwdRmCp18VYR1nngeBX492iFoy1V7gDFdEXBpTpe2l+Veu3oVmr+S+aXeNZdtZ500UYX1sqbxO8aNgBplviSR/Mkhd+QKyiFONoS/5pEnJxvL7SFYIG/MSJvRI9uL8JmEdHdsfx/N1spcM8WlW1cZ8PoB06r0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sj3RDTTu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LL5+OK3j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sj3RDTTu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LL5+OK3j"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARDgF1c2855082
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqgGoUXIrgOftwZtLFLIGyQe1n58mtSeR9+1yVxuBHY=; b=Sj3RDTTux4DAyfPN
	QcNp3LV66DgnCvv5sz3msRRasjbIJnCG1uyTjYx0lo5m8AcbmIRyH+uTnynRV0g/
	1l4Ru+tmirx7wmm9xFFyITyEFOC8mjM2KySWIDLbjAROgRi2CaTm/SMbRuD+WWuW
	fZB7CNpKBMc0OZMm8jkgC8rkmLMqPwoLBaLLQg0YOcMe/sdAsyR5l6QbJSEQszF4
	H59EVUJz7Am7S1AJGpJDD0CIo8f1cecxUX0tmZNGix0B2038tQwtOBGNT0kqiPOb
	4qHqBfDGkJDvMwHK3lTdcllZflZYGe2MedWVQX/r5OxLHpNzWrJy86tfHBYrKuqY
	bKHwKg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap4vhbnfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956a694b47so14306225ad.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 09:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266314; x=1764871114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqgGoUXIrgOftwZtLFLIGyQe1n58mtSeR9+1yVxuBHY=;
        b=LL5+OK3jcwUWG4kNI7gnm59bhHJvuB92UpiN1rXkU4MsKDVXI6408O81q2YoZIML31
         9Ct9K/GXLVg3IMWG+IcZdqkA+YLI+dBEOVNKsqU0l69QVB+9pEzs/5kmCQUO8eMgaehw
         A4wC79nbTRRLGV4irOUraUSJKr8fm4B07Io6NMGD3d7aPwlmTaAeD1e4nj0EHvLVMITd
         2y/qVHHL1sSG9BzfrDHanKl6y4l3cHVvMIdguNr0ZWxC9en+ivjiPgNW/0zsj/m0WPwl
         Vdcc2b1Ge3NeSOYPPPTaPGqRHhpdXbHmLpw8FZ6kCmpdw+QKfMQDVuszAP8iKh+xyAQv
         a96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266314; x=1764871114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PqgGoUXIrgOftwZtLFLIGyQe1n58mtSeR9+1yVxuBHY=;
        b=xNuwI5G4ymXoJpPoiWkJHDKC7IvQ6kVkzIaBXeTi0Dzr5VZkYN0qyW94UwXiwprm29
         T6WiWPMW1bIt9u5hLpaJrlKJ5HMNHJQfixnHFglVS7rr3vuQPZoMgu39xIus3ujBXjzv
         RoqqCJ+ZfnY9BpCi1/yGW8phgMuU2OgwRry64IC0NRq+3lm1l3hxog8/vy3QT9QEN+FM
         ZT6iyPK3tgdYPUMvkff0gvkNi4O6zfIiCFzZjZx2/Koy/6EBSJ2naG74saPRA1OpiUqH
         Co7LQZPYzuhK7Cq3N00JsaJB9+16wcG0VWUhWCqLa1GTiQ/C9R344rAaEHJ1EW8wdGD0
         2TgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDWYujnKnSy+SxpNUtBntOetmaBt84kB4RWq3Vpron8eoionxYS7ZJFIYfnCDdj4G9Yplpp5cY0ak=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRBhnUIlYwDu+6hMg5Jy01vPtVVpQdQZAJb7TCr+SemPfiXMMo
	3WHdEFWbzgX+C7BECOEMRUzNlQSaXpLu2YVsETR7U1ADD96UeYYSSKxLIN2mgDmpRjbDYmscrpv
	k3pwwcU1h5Hm/n53IMvX0I3aKhbrQD5PTCnyAG9otWSF2Ig1CaCm2SbAx6tpgRN8=
X-Gm-Gg: ASbGncuDkIhQ9pRwykE2A/wr2qfaR3JiCpFUnsN+zhuDsyexKS8T1w+GOPMb9/6GprE
	iU1BqRse0x6QUaOmK72IEVvBH9lk03U3MCeRrPkSFioXhgMbHnxIXTLuX2kcvWJ6dMEf0tJDfpn
	ExOspPNQeWs29le7EBktwhImcaFUC2sXFiRY0Z6gPkYfJEKiwSCc5COM1N8qalVnu2P/FuzCbmb
	7ESkZ9g5xIwupFNPSwWfiyVsSrK65hMbJ2xeZVzJriJB788S0dVeyfr6cSU48KV4WC4sKqxuS/a
	2rm8D3f8Mj+ws5cuHkVPhMvEFOcZggUcoPlwsV7/u01PLmr83+IWjB4afesWFR+wWVSnZKtD8b4
	evgGpu4DGJPbhtGlCMzHtEcqCWY+hcrsMaB92Os9H
X-Received: by 2002:a17:902:cf4b:b0:298:3a2f:2333 with SMTP id d9443c01a7336-29bab160a66mr123400955ad.31.1764266314414;
        Thu, 27 Nov 2025 09:58:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcSrG07gzVMbM3LWgrJC29YGiUdxOZYQ2nHzMa6NXcRIgSVlA3tcoDaN3zMBs/NMsLU7fYUQ==
X-Received: by 2002:a17:902:cf4b:b0:298:3a2f:2333 with SMTP id d9443c01a7336-29bab160a66mr123400665ad.31.1764266313904;
        Thu, 27 Nov 2025 09:58:33 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:33 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:27:39 +0530
Subject: [PATCH v2 4/8] clk: qcom: gcc-sdx75: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-sdcc_shared_floor_ops-v2-4-473afc86589c@oss.qualcomm.com>
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfX0DlC0YUDeMjh
 dOClwANN0QgnPhFWUP0Fi4dqWju+SCiixNyuCBsOpuYHdVLiQR4660BCgOPQz8r+WStJsK/HdWe
 kYae00cASdYKgOBgSeU1/fbLxeQfxECei57fNpdvnmWNzpZVrR04ntdJCD+QkFjpU9zu/ZWfUtY
 jTCUHnT4ZkQMUXiv4mthmuXCtga2zsXmU65kV/Pj2eS4NnKbVhcUZ3YYC0MF5bHTPepubAeBDeq
 38wL3QKW4A6y40qP2lMcuiDxlV6Bcf84aFzgGsLVD3heUjS6nL49mYq1IIf1RlyPD6gGhlL0zr9
 K+XM+UMpJ4QhOubzZRlQ3AR8CyNBC1RS3sZBZz3lOE3DMriAGOng3c/rJwm5H4v07aOIQ5Dsn5f
 HPrEmzGAJ2HtdpMJm2jILeU6ww3tqg==
X-Proofpoint-ORIG-GUID: dCqWBT8C2SZwD32dJFqkdDx7X--QeTnd
X-Proofpoint-GUID: dCqWBT8C2SZwD32dJFqkdDx7X--QeTnd
X-Authority-Analysis: v=2.4 cv=Lt6fC3dc c=1 sm=1 tr=0 ts=6928914b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270134

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: 108cdc09b2de ("clk: qcom: Add GCC driver support for SDX75")
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx75.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx75.c b/drivers/clk/qcom/gcc-sdx75.c
index 453a6bf8e8786308ef785799f71b6cff8a5a9727..1f3cd58483a2d6ef18b43fc2c4ea38a6f8750c5b 100644
--- a/drivers/clk/qcom/gcc-sdx75.c
+++ b/drivers/clk/qcom/gcc-sdx75.c
@@ -1033,7 +1033,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 		.name = "gcc_sdcc1_apps_clk_src",
 		.parent_data = gcc_parent_data_17,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_17),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1057,7 +1057,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_18,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_18),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1

