Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ED2311C2C
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130587; cv=none; b=gi483qY7ynv7en4QGKZAqfDxHboKxPLkzky+DybLWAh5JRMzviuyjg8ISq79iEmfS16Lw/dfS1ZFm9FrOS7vQiFDWSXkY5x5kK2LUSGKu4vzs9KLOVcYc7ig1ZTTj5STZDE97qMFkj/hK6W3SyLJOR+8VVw57R6xa4OHc81YwPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130587; c=relaxed/simple;
	bh=+hHXW7ymiZ4AT4HeS4VHKLWhEvA9ViFbwRYCzN5hqzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hQ3dElfC+Ca7p6DjdvCzvGoHTHraDlhdT1uvZ7YDQONC14atH9FYMzJ7wJId0iWqhrUGnCIfGQ9x67U0GjdtDTCex5cwhUIBoZDM65kXzpqDemvc0a1eqj3UznqRKpZYYyfq0aQV7CF93Fa9x9/IUkLVUuvSV2lB2k9VBiFpsGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZ3noMAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtCi2j8m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZ3noMAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtCi2j8m"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ2TCR43706613
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWElTngZ8FNieXm1Kmq1PQypc84JhZpmwE4lQK4CBKA=; b=jZ3noMAESdU/setf
	JKWNAJewRf76x1P0cdwJg7mc4bLBmWrxG3xyopzHFSPIrHqr7rgIISqVpNvPHbYa
	A/lKrykKuIIuUnR4HvtOFgJ3swaseAl5rglUblmTw5rWmKeKFR+j9iB1KEMlC7FD
	+egdyqgcSY1pwL3hkb05BBhmO1kXxLSdWo3pdO8SWdw3fzu/08xUXYdsFWYsg0Dm
	0g7XLPo4knYxnhlrDMLTXPjQuuBX4QxKe/DTXwyFiXgXaW3oVXL23KySdOaPPdze
	jtdBQmhKmqgu/kAaBMGZpueY5GqG5H1Gkqu/v51Avx7T3mLwlED/7mkvZ5Iv8q4h
	DJIYcQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anduft2yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297e66542afso214252495ad.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 20:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764130584; x=1764735384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWElTngZ8FNieXm1Kmq1PQypc84JhZpmwE4lQK4CBKA=;
        b=XtCi2j8mvXxbaNScMR98d/BLA4E09qzFZqfyVf19BgMQf+igCw8EXIQU9vDyNRQC9i
         wmpgwJyfqlsPzlonyy93dURX38pQ0Y4g0/aP+x8ubn5GpYqNvz+BwAgC1XLDIY/Zrpod
         ZwYlV5N+9kZZ5Fs+g7+/2PeG37c8yakHeo2XtUTd+4PZXK9Huk9RfWIEMy5dJ2X++Alk
         AsJATTfRej3Md0SDaL+p6Gw3D9XtejQ1rB9cipD2o5qfA4f7G8okffx93ycTZgz3jk12
         1zHcvpo1unb3W644Wy9p0QX92PfoKZzG7+sVJRAppZ/U88NRBGnI/UGyD0PO+P11hzmC
         tzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130584; x=1764735384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PWElTngZ8FNieXm1Kmq1PQypc84JhZpmwE4lQK4CBKA=;
        b=Du1SPc3XqImsKtbcbzVh4QulP4QpPaK6RoDSjQdOLjkpsXgCmwZHD2CFNi6q6bJtiD
         2oWcZtskzk0lNc6Uu3yfzWQqTKp3BbLib34gBHt+foD3e2qppS8MrQ6umSzPg10PJL3D
         8KF9S5/bHXXoYOKW8KrQmakXScOSLs3hIuYtVqgUftPNWIiNHFzonxpMSAAh4X1hChtS
         vxL1LBRyIzKNWMpQjNQL1Ur20OP7ZGh9+k4TM5LlxT0356IdydyintT/eJLgxhLJv34S
         E2KosDwm0NZBh6CkEOB6w1erNh/zsM/TGSRPfUDvtIqtdkbDwO+/le4WKWrxWkrA4VKg
         vMXw==
X-Forwarded-Encrypted: i=1; AJvYcCWVqlmxcOGyrJLFfRXHDFerAO3uaiL7mF65Efz7lZUptqUHPMOo8Zy6AXvMumSHmorey1+4+gWRTtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiF/SIABqOeL69weFRyBvZHHJ/KfEP5VxpYLgnrWjP69IFtcYB
	+zDkG8u0j/Q1M/Up7am7dIcowDLgVsmpidu0WlfEjGZW7kT9PWJhcn5Tq/u7qB1zuEBInuJVm9T
	D0bGQA4vcCwqutXGMPkqjGQCDx8j5CaqwYyMykKOF7f3iiL8XwYYgJVmRyoM8lmg=
X-Gm-Gg: ASbGnctN6cAiK2ym9uMpxy1hTf4JT89iyjvm5s20wot4vvFeLWCPJdhhSKwC74deGBN
	qPCMGC1xT4Gr1Y9ThW8hU6f5rRMG0+PpWoSH5nKKii99bV+xbQWzE/lv3WG9RdcouvJPJIwL65q
	RE1ZchHZTlU43t866r02UE1UyjjhoHaD1jaYrgZ+wMCMZ3qI5w9dCVZ7iTsrmXFf+YJBtae8Fjp
	PU/egoN+474Eyu+AenUSn6bfdHgr31wiS8eWdcBzNho0963tJolh83x2993MqUQcAnYe2L4+vZZ
	cATzpUsKKo97gRiB2iFaGMM1sGa1yn/exmJnIyvW83VaFpTuPAJwvXI9XhXc5muciMNnVIYlcTG
	PpFlKRnkoXMFiyvN/gc6zftnclt1vZnq5sxIz8YEb
X-Received: by 2002:a17:903:2ec6:b0:295:96bc:8699 with SMTP id d9443c01a7336-29baaf7b90bmr58623255ad.20.1764130583798;
        Tue, 25 Nov 2025 20:16:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvjVOQsrwagFNc1RaHhK52IuFu/vUs8Xn2z7R8kSLbAhGDNYJCWXoS0Hr4ISnA/ZNs+p7gWA==
X-Received: by 2002:a17:903:2ec6:b0:295:96bc:8699 with SMTP id d9443c01a7336-29baaf7b90bmr58622905ad.20.1764130583326;
        Tue, 25 Nov 2025 20:16:23 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075basm179300125ad.21.2025.11.25.20.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 20:16:22 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 09:45:53 +0530
Subject: [PATCH 4/5] clk: qcom: gcc-sdx75: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-sdcc_shared_floor_ops-v1-4-9038430dfed4@oss.qualcomm.com>
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=69267f18 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kvM8kYmktHDfMbmwzrwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzMiBTYWx0ZWRfX2Mz9PKzlTziY
 1rqKSxRfeT+KyjyeT+dGf+AR+5H95mvxGfEKTiSHH4VYEVWH6T3xu40pT82G524hpgLy1N64Cb+
 kYHiMu4I4nBKrrOEaUR6kXMQQbNaPXvrIAXd/ex04hctbyauugmoISthCJVw2Qy3wliNITDVIZc
 iLLJCjEYkHuOJHXlzuZ9/kPeh2P4eSIXl+GZkkVIXld6aG0P4srTasBFzz7PPhSdQx5ckP5zVon
 gpSWqIpUhZN9p8pM9JtQyOFVJ5OgUyt8ygEzPkcBGaWsuorhQJb+hlDqYFZ3C4YbD8H9Y+u/vuw
 eUdNMnIv7uG3krFXe80zoWbZ74ioFZUdkCK1Xn6FfWm/GjHBBe0ggEe+SCtr3AncUhZSUioS72E
 2XQNeg73DeSLixvntJg8vebazZ+fHg==
X-Proofpoint-ORIG-GUID: 0odXwpTEktXjlROqRDby1LGiKyxoSqjz
X-Proofpoint-GUID: 0odXwpTEktXjlROqRDby1LGiKyxoSqjz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260032

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: 108cdc09b2de ("clk: qcom: Add GCC driver support for SDX75")
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

