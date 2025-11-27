Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24272F83DE
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266324; cv=none; b=kxkKBERDkDVdMUPaHnoHm+wbYPsoGnidEEtLcoGUb52T6SX2v8k4zWcGof4n7PBX1kx+b7+F40EdDaSQiZAI7r6m6hEVHbPdiNEZ9ZCdqcOe7CEdKOa5qnf5pYDWuKbxbdby2eaR/B2kenBTdxrihv0cAP3AvQCg3vsK2/pk1JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266324; c=relaxed/simple;
	bh=NgCZCc5uUAkKWVDAfCKTOncT0joGBugct8Y80sxoLs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJlnDpHT2N3FFYXezumObejt0pzr0KRDVVg63PzH6jRCaOie0fy22A3nyFmzCtJfTKSdmKGHH2A4umFlXqC+3NvCeKvKZVoauRvCxs78B1xsPY+/D4WqjMsKvlO20IDuydcH/iuZlG7BD2HyyQvfCzLXaokuD1ixda74q3gC/y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHNGsZkg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K7DVGw6X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHNGsZkg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7DVGw6X"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARGWMd02388022
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DXvSuCpiY6Gz0iaISdWXBZTEt6AO7dXumEA1gSjiIws=; b=KHNGsZkgrJE1CRqG
	1IqtNR/WliLf+A+I+jiATKgqgVaRPMPNfgI2TTe7EOg6DT5sMTPh5tYYQTjDkpuz
	Y6jKKV2v6f5FONAE36472c9ttCfktymdOD68DpwPQ3AmgBM/T15BxX+yatSsYuaE
	8fVOaOwWH8tV2HObzlOEc9kwnYQjbqkNruZoKVJiKs8ZF5MUiECEWcwhLotbi+CA
	Jq6q20kFfrKKgWWS1FfPVnOsMd2lymQ3mU2msCy7FVYgpfp5OaqRpzK2bhndxFtN
	dkeMfEoi6CXJSdeAn8ZrocDt3Mnypxa4YnwUdOqpkdt7d38r81qeNsdOdb4m64Hc
	b30fIg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap7n8k5cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dde580c8so34214305ad.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 09:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266321; x=1764871121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXvSuCpiY6Gz0iaISdWXBZTEt6AO7dXumEA1gSjiIws=;
        b=K7DVGw6XBIIpk3gY7mwItdzvq8QfDjUXW0oySiucWHWWwytVb67euhJmnG+mojyf0G
         kbUupRjNuAWXLtLySGNAw8xduhwZtVf3BTFbO1Sg1lkKREVHONNAfYOi8EyMoCHgsy4Z
         2vIxt7WdvbM6XWu1XIpQkJOgwFPAFENOgbDebCf7Wo0K8n+Mh8JXDxXxgU5VwGKMdWmn
         i2+emxYZbmC2WgOyzbcRNXbowJrq2JlS94Z+acV8ZhvSqaFd+va5qqYJGFHrdDS/g6Yo
         IMwo8jjiCeLLDO2w78hdfwj4MI19HD4ifRMuR4bzAP2AtRImBEnDSVEeFcP9MSyjitJj
         8Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266321; x=1764871121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DXvSuCpiY6Gz0iaISdWXBZTEt6AO7dXumEA1gSjiIws=;
        b=VkaJ7XKMWyCkOFM/RsBIGtps2TbGtUXWzSQpsJcwW4hX8el1JRyQDyB8hzOS/FcEbY
         E/bzAoRoHMnVbo9PtfvegYjz/u17q+aw8utdc+67TwCdCrjv7wOAfDENEjGiBL1/t5Km
         GMahS17Ls0JRvA0F3MsskQtxF1rcPBxaE9hqY6K5c9y4g6tEZ9Vd/mET236fv5H6B75V
         tO5CqoTu0OstkCC8ORHNDb/CfgtUOiJzOAHEUb23hZF81ABoRQPFJobNr0bI7FwMWVwL
         ZePceTFIHf9i5qwwVieo+TLhBUg5gV/7a9Gh/V9EgPgarH8fXgec61tOAOuqE5cydoAM
         llVA==
X-Forwarded-Encrypted: i=1; AJvYcCU+fMdAWOQOG+iCKQZ1pPzVKWyCGbHpcFipladNvHF753YetwLCDhDlz3YxeOMv9kT1SdA7N/z9hWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzACOVmQ+cFWSrJc3Cz+V3iu/w7E6Q3VFfovrzqYIDsarxwiG/O
	oWEb5ms1iT454vs0kaXJ8d/+FN8KUvtxjLKVHokS/5cmvsq3ZaTsZzraAMvqE/ybjGOO/jwtqYn
	/wpOfCUo7xuef6JuFnF4NPWh7fzK6rzS93eHFDnWz0Ka9/Bstzd/jz8WynZrxyHw=
X-Gm-Gg: ASbGncv/XlgdgqwGDp0VUE6TIODccykGK8g35gHVE8ad0kBOh0G3vIOEROvVvzGIiEa
	3jZ8MVNh60uORbn5xnWdTX/y/53sqEDgUn0z0DgURQhOJDrQf8NvSYXxm4Jq0tEdhnUOYRdnja/
	vdNkIYHbRbQ3paKSxzyLjplAPQDLkmHUI/uHF8U8IJfhXjwpLMJDHLVy5CSODC0wIDCqXgQnJ3U
	Cp/GfmunJnB/mv0ko2Xc3AG8eXT4/85C2MtICjtwx/FV+Mrc+WZFL1IMRYT/SFknCcUmwxUmBqL
	zRLNtQQv+nC7PM4n1J/gJFP/LPMTFiPefwv/D4IHVxtyBVzecwkWOn8B2Q+Rg2I2p+xFR3WV1QH
	XTdv7piwBH9EsScUm+eqOU4aGoCOfPg7y30K2LQGX
X-Received: by 2002:a17:903:3545:b0:26a:8171:dafa with SMTP id d9443c01a7336-29baaf7da11mr125737835ad.21.1764266321000;
        Thu, 27 Nov 2025 09:58:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEd8DJPvhH07cz5cy9XbjcDkV8AZuU1U2LAF8q7Q3/K+aQ3MGBYm47F3y8Ii6iFTVTyZ/6saQ==
X-Received: by 2002:a17:903:3545:b0:26a:8171:dafa with SMTP id d9443c01a7336-29baaf7da11mr125737445ad.21.1764266320517;
        Thu, 27 Nov 2025 09:58:40 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:40 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:27:40 +0530
Subject: [PATCH v2 5/8] clk: qcom: gcc-milos: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-sdcc_shared_floor_ops-v2-5-473afc86589c@oss.qualcomm.com>
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
X-Proofpoint-GUID: UQE-7RzBoWhOtF_AzYv5QrLx4zTyBojF
X-Authority-Analysis: v=2.4 cv=AufjHe9P c=1 sm=1 tr=0 ts=69289151 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UQE-7RzBoWhOtF_AzYv5QrLx4zTyBojF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfXyNeTbSFNyqkQ
 +RU19n+YassiJnnv7m6GOF75Eucw67Bl/jERmQJlQWe//EN9vVb1qzoPg+8JfK154489EfufVJf
 ux6jD65+SZgWQ5rpwil8UhssJfjg2pdo7k1V4hbUP38i/gLmTBa0/Okk59+zjpHTJ4Qc10Ca8vA
 MrKPb72JBFXY0TweR82lVZma8mtnZSV9d25Vfw3nHRBmzR7bV9XX3XL3vjWf/yz+oSwKdwPlN+r
 scpklmPlM2GuOJHMgeXN6eXNAjz8sIUtlSV61yuVZK2S4XjcIa3b2mBnF+H1cuVr4gB2aeUdKM+
 sbGCqK2d1cY+P7LMK9ZmimVSmFabpqq8r24liTnMkN7ZW/gy1+1cpkqT/kmFxmK6NvLeYeDcgd1
 rwF1dO2cNMstDe8noU1ApAYCsGvz8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270134

Use shared_floor_ops for the SDCC RCGs to avoid any overclocking
issues in SDCC usecases.

Fixes: 88174d5d9422 ("clk: qcom: Add Global Clock controller (GCC) driver for Milos")
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-milos.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-milos.c b/drivers/clk/qcom/gcc-milos.c
index c9d61b05bafa1618274cd87c83df6fd14131efcf..81fa09ec55d7f6d6cb761affd3b93301a102f61f 100644
--- a/drivers/clk/qcom/gcc-milos.c
+++ b/drivers/clk/qcom/gcc-milos.c
@@ -917,7 +917,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 		.name = "gcc_sdcc1_apps_clk_src",
 		.parent_data = gcc_parent_data_9,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -938,7 +938,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
 		.name = "gcc_sdcc1_ice_core_clk_src",
 		.parent_data = gcc_parent_data_10,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_10),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -962,7 +962,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_11,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_11),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1

