Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486532F4A0E
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266299; cv=none; b=sxBICp4U7f4slqHWkCxZbHzmQZ7A+iyfe5QyCMNcXaiIMDTqIIm0XnBINWRhwdX5ffZ1nsCW8cPRW1P79xPTR3pAARLtB7cSLl2CYKUvFDiEsjT1dJBoH482UxbIuo77toV8ASIqcMvu5fm+XVyDNckeOKSXCyyxd66RXKTe2mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266299; c=relaxed/simple;
	bh=HqgIgiFAVIlPjNTzEERqS0kjdxcpXgmK5UyJN3a7JE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQlzWqHbSlLoMK0ID0fJ6OdQOp8Sq4J7u79f12sXTsFZW5GWH7Qmpi6q5cx4Mx8LJvU/EirPKJDyU8BrVbiQIUKzYuinp7AhLDiwjwJSUqZMIJ7ZRK33K/Z6uu/guAKxys8r9b10+55u6zqn+n7d5yb9f4OZCFEfXexiPyQnDfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkoCd5p0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dE2k3akV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkoCd5p0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dE2k3akV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR8DWMI3448424
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfserirmGFWLLxsgJLSEJSByhdJnOKDNDQLUMvRi1Yk=; b=MkoCd5p0R1TNmtHr
	NMQTIVBd9srP6IxLh6LsBfJbODQM6Zn0V/xRlCUkKJ/Rw53FPLkASmyD+F52lwMg
	tcZ6nKPHHWiNlgE0YQHTL0rOMgdZc6LGd7iQpYyDQJQMThmQYATuJ27urCTLmEVC
	wrQyLMpZUQVpxCRlugs+nNyNFNQ2mwaYL+0aNWNaZOUvb/ndGM9gN0ztYSXR0U3m
	12s3KbTM8Ak1ZA3sk7NHiD99yU8XgRscx89d6hEPgT4p339MuF9W5GDT2NZEKxLn
	+KZMU2PcB0TOT6vBJrBTtMBQ9XQum2eVIOaqhWSrUe59GrMk+hLzt2j+H8GAI53L
	wXbNJw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap4vhbnew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dde580c8so34199815ad.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 09:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266295; x=1764871095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfserirmGFWLLxsgJLSEJSByhdJnOKDNDQLUMvRi1Yk=;
        b=dE2k3akV3girAsUd2tNPfs2sskwxkkUx1EbNuAPoosQKWNGoS/8Zx3Uy5ASB2bqrXH
         FAZGk3QitYw5RL5iwHokt1iXF4FP6Xv804UCcuZbVllRQO9tIUcyKEhwOSpTp9fJwnyu
         udMyYKrZD7Fv7sx5FMDD2V/y+XGqmpGkgoxISKqeGn2n+LbsgB3jofPU70/YC3FIASvf
         Pgb8M5Q6qFZSshbOpoZHrcKr/3zhl1J5t0re5/ktzSP+oQB0sWChwrfFtc2QRtxpdOB2
         r9Tr+PLOxuts5SKDMowWU4jNZD5IIeJYUn+e/3KbvnZytILjjaTW+BWmHZq6dH0R8hGH
         +54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266295; x=1764871095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lfserirmGFWLLxsgJLSEJSByhdJnOKDNDQLUMvRi1Yk=;
        b=rup9eA1qYqRy15G8g47gpBSQxEWmpl5vjZ8nz9J+CZ/J3p6z6l7LO3blJNZw8lFs78
         +A8LUoZZekUgwOUWTsa4Tgxfwepst4nMNyeh8VNXHMvxAcHZxSsCrmDe1oI6rJvhXxGo
         yF2d95SLcUldB6uBcF9zh2QKGQjxQ6/MnC9mj/8E9a+JQqlrFTTZhtKqJWjZjxClpGC7
         BsUei+MkfsFsvIEZmA8+/bJDV/lcu5RkTwaEwdqfi2ci6AL9yaJUOzdfH1R6nsxbSZIN
         T0zmBKPJLxVLr8I96VWeT5Se1NhN1hGH1kSmpZld6EMln15JQd3N6iCmMxjHfSTvzWQj
         mGWA==
X-Forwarded-Encrypted: i=1; AJvYcCXcYyCLnTdZ9cNBcSym5dlRJvC7dZ73iLz56BAvuhH71s1DC+1ItE5qYYsxxVhO4VFb5e1mngTw3mM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws7ZTLhuhwiL2hF3ehH2CbAvAytdS1bfvA10Nt+aEUhUx9vOQr
	DJO685klbrc9DrHfrQxUJs5Hp4oxHmF4fTyAVnZFNsOKjbWaDawDZ8T6ItOUvZNl/kSKQAfq/ex
	ew51Ldz8SN4AbsWSqHO2X3JkGVX2me+eZcBxRNnTngS0pBKA+IO2Xmgz+2r6GceA=
X-Gm-Gg: ASbGnctV+7Qti/zEhMM4OJcKaOhVtSmDDV/eDNuQgbIoNUzb3oHX4Qoes+jjkIw/7hl
	6n9TNglJwN4Zx/gRGe2kCzxFQWa9W0JieOotthGt3Ptd7gmTQitATyy3+1yROqSu6IFosNk/O4e
	s2KSuGopN9ONAY+hJSttKpvFGk5GQ0aJLn2ok92lC5MgF23lyiZ7fTSegq3vUjr5BnH4ZuIej9g
	P3PkRj/NZikpIy5TSeO/sGGsMkyrJ1/F2c6bbdFgERNkvkRXPaHSFyZhfS1f+UgebNLJykBRg91
	TeK85tlRRxQ70exG70vUs70aX/6dvauvTInJcFKI7OxUpZNcq1NFISiwCuolKeaWHAVxu5x/syi
	V882m3c0yASE3a+LfNbvVL/yIkjBt56lZg7kE9mHP
X-Received: by 2002:a17:902:c44a:b0:295:34ba:7afa with SMTP id d9443c01a7336-29bab19b21emr84357585ad.43.1764266294619;
        Thu, 27 Nov 2025 09:58:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMjiZ0RP0L7TZ6gH4f4TyC+IIBhQmeJw7HRZcNKV3khMHi2dkfabsjfeJfNCV0OoaefZjQOQ==
X-Received: by 2002:a17:902:c44a:b0:295:34ba:7afa with SMTP id d9443c01a7336-29bab19b21emr84357215ad.43.1764266294082;
        Thu, 27 Nov 2025 09:58:14 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:13 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:27:36 +0530
Subject: [PATCH v2 1/8] clk: qcom: gcc-sm8450: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-sdcc_shared_floor_ops-v2-1-473afc86589c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfXxWmgnE1EonAH
 H+7Vw4e04c3Y3u4XMxmXFSTx7GaLgqkRIzQOwoNk8E57GAue8tdS8xgbm3aeeKbS2hZtcRamsjR
 f+fOPn+CO4pBvUUULw41KgwJT3eaAIC36PcgWsIwkNSCvzVGHRWtcQYqHun79uHJaGkwEDTUGBq
 D/1WK3vzrD9QITkl2N1fuWiOOKY08/1mUAE7cguQdyJVoIgkzC7Zov1tkC/oL7HZzTurOxDoo3Z
 wLn0bIFKwdoRmzbMjCOSN6+1kYrGkeO+wKXF4gm4ZI5vQASGh/e8K5PyA9HyPLQgjjgeD34qGw3
 v08HCN1HnPDnlWkEPW6jTsyGI9EuSYrUhwJfmBwshBaSKaJ1NFGBCPdHzxf1J0zt7/SS485McyO
 dxZcxxRPNgLTbBLK6b+neR5UjyBnkg==
X-Proofpoint-ORIG-GUID: wwpR13FkrqC191aKHx5Zi3OU6UJw2tx6
X-Proofpoint-GUID: wwpR13FkrqC191aKHx5Zi3OU6UJw2tx6
X-Authority-Analysis: v=2.4 cv=Lt6fC3dc c=1 sm=1 tr=0 ts=69289139 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=FOTRiHr0QPuqn3MmG-gA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
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

Fixes: a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs")
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 65d7d52bce034335707014797fe9002429212a14..b18bb34889ab28fba13cbf2ca8cf83101e4e0484 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -1034,7 +1034,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_7,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1057,7 +1057,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1

