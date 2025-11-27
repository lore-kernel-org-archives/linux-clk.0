Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5262F6199
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266336; cv=none; b=ttusrMSEd1jKo2LeErCCnQ//jYxWMMiSMOvxhysQ8uhqB6y52L5+7/J7xHalfv86jyoWSvDq5rYTBjsNZxUri9wY1T0IrpNjX7gK5J8gPj7S5igbRuMrAzI0UuQx0FYpgguk74zV36MGlAvIgE/cALKyCUOqe3KTrR93QYI73BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266336; c=relaxed/simple;
	bh=R2VJEJj1wv7bNKZ9HGnx8ZStYGfbOxnloYajFqzbH6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D8p1LIN4KOQRxd6r7ZDFBfyX7Egjtnn5VGvMw5QYBUZcrXf/TOmsGZyJ+Y7laPeO4PNnF1X7STQXc6/U7AT3aftmeaD0hJYkk/XBY84B6JPPXzchJbxbvBYaGxvW+WUBbMk7u2Ut1A3i5oWLgteiF9hQF9fvqECugOr0qfUddDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVlXJTco; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ELNCHg9c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVlXJTco";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ELNCHg9c"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARGv6LV2388165
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPt9ZcHSLXa22nWW1rrRtzNb1vBANkrucG9jU8C8YHw=; b=iVlXJTcowYa/CUBS
	Iwd9paELVTD12+Br4byiKbrYSGCuMwStx/2E4IGJI7i9zJOsvSOf1yNjvXyre/E2
	9ODWl7wOskLq/AQ8plokSOTbC44+rL7EVziro9tIncJgDdHREUUVbApqwiDN1C2f
	fzJiZXRjzqHOKlRjZowCXytzLxe0TRnOYKmIXhthfwlCOb1So9dCPL5MT9knLxLN
	3onOXt30lkkOAttY9FBHm4vk+OXXRHuU/BQPtdcoWntNb8WugdM4uORNyW7IcD6j
	MqzarJ8reXoAZbl0KQkbiTdF+Ye5hEWT9jq7GOimEsuJHEl26OYgyE0JEDm3E7Af
	tZGn5w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap7n8k5d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29809acd049so17752455ad.3
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 09:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266334; x=1764871134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPt9ZcHSLXa22nWW1rrRtzNb1vBANkrucG9jU8C8YHw=;
        b=ELNCHg9cF9DxNFyysR2FdiDqTVu7d/6LFydd9W3wWI+QDEvR1zhWm4lf5xbjpG/oka
         H/6Irn6u6GlRIGuoc4uPxazHGBzLwz4QeEzmZGO8ffXMeMDV9yGoF3xdGFImQdssS6IW
         0OSgRrOoWCH00CdNqD88SuK4F12h5OZxGnixN2LJ5P7iBgR0s3qqtFgR1wKVtmvxpww8
         FsJ1byzxwMb02fVnUTp//YNGQmrLbhbd1CpfzIgFcesFzwERF1vLW7Lqr4U6kv7naMzk
         qJ1QrbxnZ89xYHsVn5cd0w6o7tzV7KSQYDC0B5eVlRC0HezRtXc5HC+JC446gjkFqu/C
         ASSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266334; x=1764871134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dPt9ZcHSLXa22nWW1rrRtzNb1vBANkrucG9jU8C8YHw=;
        b=dU+n8wqCANJtEb9SuKLcaL1x6TP/g9CXnrP0yGAlLDie9TSA1HHAM6j+j2QFlfBVJy
         eQkweOpRw2LeIKa0w4M4VzrvCTcfcfmMUTseQTn/QcDaM1Vht5RCPaazhbBM+JaGsdol
         qBEB6G33bc/be19XrYI7q7P2YmRnSEParU6+48oBQxX4qrFayaHBpKs84JllZxWFIlYV
         C1i0XLS7su5O09F/l+Li1EC+7Icwjg54PIOpFk4bKc0lwyXtmHTk4O6x1Czzl/5AMVMF
         MCPSybjA0ij24IBXQMvoM8QO391VajU2SrQVc5USVC3vM3raKTcm7tddUGpcrwma6RVH
         2Hmg==
X-Forwarded-Encrypted: i=1; AJvYcCUAHWOVdq2usHSN+xSbAM4xnCsgGedKoSVeVsxS4TTiVKsJ0itJ8wrd+bclSfJFbuLpFCFONhHRhA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZSUhDmI50yS3ktlAZNxigNwm2ehG6A9qaN2JTrwkkC/oKWQ72
	9UoD4o9eKTOq2gVa2ivATN2ghv0qhxS8BotG+Jg+0rxJbTXGbZ2Xc7AP1vizhdUf0ivcg6/wQ6p
	lOVW0vMNNLYC5GDLihdc4qIKGiHwv45++276Wo3Zda1fEjexc/A0id59zV8qypwc=
X-Gm-Gg: ASbGnctDZmM8gF3GoTJ9bwfnovgYW+RnDSSBXVEpyMRekM1L5Tb5l9cLuQEYAX63+ci
	NCsFylcbda11okb5f9ZCTjU+WAfoasixpAnFoCk+8PvD/+lxIEeUl3BFiU79VrbUOUCrav6uzb7
	lR5nnw0OAPFI+hx2C18TV0y9Z3angWpBKL4bmOCrDtpaFsakWhStSF0gTERaclednLG0IFZgbBb
	oknIAuX9zjluHuIv94F1RqBUn03AJPeB0cTbb6UTGCjvYpICKbOlLpaTLTrabBJh1K3+GymphVC
	Wc/VW2RovDfk2rzYiOuV5v3KWTBeII261cJv4kNBrnlYBY88E0r75UKGd3NWlNX9AcSdFxoaQ7x
	Nt79ZeuUVGepp8LpaqEZxhjSuH8W5klrz0TUBgIqu
X-Received: by 2002:a17:902:fc43:b0:295:73f:90d0 with SMTP id d9443c01a7336-29b6bf76f59mr269115515ad.50.1764266333814;
        Thu, 27 Nov 2025 09:58:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGc9yg/upMpoC/v3pdvwpbyro3tbBhB3f0/XGKb4wuyaQP3AvbUupqHW/mpvCp8W/yMubiWTQ==
X-Received: by 2002:a17:902:fc43:b0:295:73f:90d0 with SMTP id d9443c01a7336-29b6bf76f59mr269115275ad.50.1764266333351;
        Thu, 27 Nov 2025 09:58:53 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:53 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:27:42 +0530
Subject: [PATCH v2 7/8] clk: qcom: gcc-qdu1000: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-sdcc_shared_floor_ops-v2-7-473afc86589c@oss.qualcomm.com>
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Sm8yITYZZssItqtLHrPLCHFbiIF_rdJV
X-Authority-Analysis: v=2.4 cv=AufjHe9P c=1 sm=1 tr=0 ts=6928915e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jpF7Y0NODDEllFhJFvoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Sm8yITYZZssItqtLHrPLCHFbiIF_rdJV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfXyY/Fa1qp4aIu
 bvFWNNL9h0lAZMUP7ecDTzomlN0EiEQmm4RQ49l9FddFVflrlQ/9fY2q0cYUkvSfeifsi8xlYJ4
 coJQE581KMLS20NNCymHKuSTyyG5QD66mq0VyzuA8cpThfQJ1g02CP3Koep3LDexGGa19Md3vWp
 nFI6OC214b3DP9F9eKnv1aAlWvosxRPl/HxT+klr9xuycbVI1yrskNlTR1jpn+uk9kw8cO+LDS2
 B/7q3zDLLelexoyRZKB/j5D5pWIAxIHLXbMviZ6gxZRSk0fGrosnx7JQ+1sBwxRx6Tmn8XjuBDt
 0UEKaSFVLJMn2iMSzR7ujeVd5wFZpxToOedwWWEbxwDx5PIC9EOpGHWkWhvWGpQOed0VO5Eh967
 zucSNAOBfsWjzBRM1WL1FzhSIyoZOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270134

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: baa316580013 ("clk: qcom: gcc-qdu1000: Update the SDCC clock RCG ops")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qdu1000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
index dbe9e9437939afbcd50759dfc21a599864278816..915bb9b4ff8130e086ad6b5bb8872c79617afee8 100644
--- a/drivers/clk/qcom/gcc-qdu1000.c
+++ b/drivers/clk/qcom/gcc-qdu1000.c
@@ -904,7 +904,7 @@ static struct clk_rcg2 gcc_sdcc5_apps_clk_src = {
 		.name = "gcc_sdcc5_apps_clk_src",
 		.parent_data = gcc_parent_data_8,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -923,7 +923,7 @@ static struct clk_rcg2 gcc_sdcc5_ice_core_clk_src = {
 		.name = "gcc_sdcc5_ice_core_clk_src",
 		.parent_data = gcc_parent_data_2,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1

