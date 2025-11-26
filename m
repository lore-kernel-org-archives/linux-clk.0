Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C6A30EF69
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130580; cv=none; b=PBUp1gTakNRwi59IMF5h28mHZ3mZBsvwv2O7QQc4C1xmWRS8d25puqEUe8HgyUHyzFIcoibfy4zh3n/tkLEb6+SNB9DlD3n+loPzp0zY2IACiZwuBvF/YkfXYOr90atk6O6a84r0BLyXk60w94Fp2SjCk/hJy5EkwNh8slpXIPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130580; c=relaxed/simple;
	bh=G93MIfdTXt/2FkU81R13wl6SypJAvDPKSmrCGWLQ8Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KOnQ+WXuGFEKm4RRYxjgQguyDCBrJkhKQxJuMiHDPIBMw3EEihipMM1YlbvEc9cZcHml2tekmcDLej78RUPnatVCfq9kIVHQ7nl4inKrgjiZAEJB3VwZNrxmL2djovzIi+hCMlthuVPeJRJL+yN1KjLEs6799/pvZ9ofa+ZrEBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJZ4FhCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdArKtSC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJZ4FhCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdArKtSC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APLV7bA3666218
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8TXowYIQki5pu5LXX5RGzCaVrmTqBn5V1ZTgaMgjuMk=; b=fJZ4FhCvrdAW3DDR
	o9iP+9cBKfgIS8IrPsZNG1tvBZC0yJnhx1N7+OJSCgRGceWzxndQ0nJJ1HYpSaiO
	kIkJOfc8DqMxAGSw2WGAfDxU5OdLdt6hvms4xsqxmd9YTd76QxM+fgQ0jd3bTpj5
	3WIilKNucbscTTrPt7VMTSzBQTGLlpj3nzfUCyML5fX+uA8pxu45XMpAc64PMTR3
	lNOqq4MTHQVNmaavfNkqUyLHAEXVCDV4Uu6we179MpLMNF1jKQ0wpPmx0FGNRqIj
	y0khUAI+7ingkxUV+UcWGYzW3CyLv54O9yE0KKXzw8T+r8eS7niRL3akCm5sDCo+
	SGEoZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anmemrsv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29b760316a8so52936715ad.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 20:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764130573; x=1764735373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TXowYIQki5pu5LXX5RGzCaVrmTqBn5V1ZTgaMgjuMk=;
        b=PdArKtSC2WkTc/zORIdcRb00h/PXMP/jcwBYI0MUj+wIVrsYon3tNc/EYqD5Bc/E4l
         X5PuTSq9HeRQHzY98HRE20aUFNN+clT35tigPSEVRGdTZVxWFrWCYs9Gv2T8RUuOGRhF
         QCFlxs/BsQvHR09BcXYkfEtACRS+nRpbAcplTnQsxT512Re99uiNyzbWJCzzfjoAx98p
         TGaEikAKlmIfUBzh40QbZirQ7yb+gjpf0SepUubaJTDlstRgG5xrTY8+RBNHhtWM3OzC
         Efm3DFbyMaxJJtRMjpX/5n3XNglYZksfw3Y+sIe7Bik4G8GA0dA7dZ3FMMLnis3AFJyj
         w43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130573; x=1764735373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8TXowYIQki5pu5LXX5RGzCaVrmTqBn5V1ZTgaMgjuMk=;
        b=AehA40iWBOu2gE/pjXzPhGVnTvNG8SazDVryjiXgUrNNBfV334W/BkPjqm3RRjxpQg
         +wulhpysKVTV9RzczAdLwnB/oybHIEUtFrSQwnKKvKwoMyeOkijMNcvhl3a2oDnATxxs
         GlCE78QXZKDdVE8R6PHLKIPhTYnkkJka16JkJ7geZMH6cJLbDXY+mdDgqXFAKpF+H5Ek
         zKGYQ6S19e60lmIMZpCCTfVLtUSLfTVpsphfsSiDJHMajKfc8JAYm37OZjtnkRjcmzFx
         1VCa+g1G8KLOZtiKqjUw6UQ49FsMxNE4PDSNZjKukmAmF4QtcRElJDZ5ZCyg9BhgSt3k
         +CGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz5yQDt4CZmlMmSgCm85f9zjF56JzMCFMbtquk4xo68FQGI/Mp8TCEUOdmUGGOvgK8iL+9A/KiRjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnS7ErQc3FAyhr5eqn5qQ8r7XUA24DS399GYBY6k/Bn3cQ3Ezn
	5gWdYvBHzfYdFGya7R41L/dXUTmbe7Lfw9owwhV8c55x3AL5LuZs+3PTdtZc/2OD+3XlEIGz98d
	fERBXy6yo/Z7X5GlrtJr9UItoy5qbuqW2c1ivM38JA9z8/dHteLbBin2rK9pID1Y=
X-Gm-Gg: ASbGncueROsm3SReDw59v9Eplq8ALaGnHg7nPjnlm3Jd7QqFTVmc3dmHTX6u8ZggTmv
	Ps4zdJEUdWr0V3hDPBAmC0tHEwlzpnPJB5LEeCZnG+x00AEBMgOwJXq3KfTcvJRmJel2kOgipKZ
	mptHAABVWD1TvSJAChCZujWtbWFn9M5tD9BEtq1sQxOIXc64hfLdemCjLem8yTJe57elL2XjAIo
	ux2FZFfNsHz/jAUKrpRKiTx9DrEm58yp86QiEKhfoBo6Su/NASrobSRGubcVL+/XssRlHRWu7+k
	VT5SB1ZTvtXxzBEUeYltjYazw7BidvfllD2DsOZOiUrww85C9Wjs3mW3gl27JwGbgKJ3mmS2kUV
	6mO/cCIUny3VR9Ju0LIwlUQfRn2QaxQgwLUQioosp
X-Received: by 2002:a17:903:1af0:b0:299:d5a5:3f7b with SMTP id d9443c01a7336-29b6c6b87bcmr193002525ad.53.1764130573190;
        Tue, 25 Nov 2025 20:16:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdF8pYjUWie8FuBc5mrz3q/OCV2CGlX1j17mHpac1kPPmDSFc/gvxGHFJa7kUpdLkQZvk4LQ==
X-Received: by 2002:a17:903:1af0:b0:299:d5a5:3f7b with SMTP id d9443c01a7336-29b6c6b87bcmr193002055ad.53.1764130572708;
        Tue, 25 Nov 2025 20:16:12 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075basm179300125ad.21.2025.11.25.20.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 20:16:12 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 09:45:51 +0530
Subject: [PATCH 2/5] clk: qcom: gcc-sm8750: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-sdcc_shared_floor_ops-v1-2-9038430dfed4@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: rb0-xtCW0zQPk9-LpbBjBm69Rvq51O7K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzMiBTYWx0ZWRfXxskTUrSQ+gX0
 LjIEqPfNcvNmwtH5jAVfweac1pf7uMNMU45mQ+h6my02Bx9XNIXNLd3S/juyLXAC+0HhYAvTbOK
 NCUk56i+uushqqssV0bo9k/MPfc9tNILafFNr+IJ4tf3HfwD1b0FzYBmx1pbqwX6+ztQSf9lk4O
 H30IE3OVZm/atXpYpks6xIDZwMnWKbq7rLv2xGnxosZvGhbhwoqlKsTLhj0iWPJ7VWYU9hX4l/I
 dgX1kpZ01gTJWeEEtRApS6b1DTLlxdG0lvt7tXd90m+Sbz0ElTu6Uz3qc+75ny1KWblrNpE8iUN
 bvEEXwA57hsEUbJ3s1TIWteKxYOFSFCpgxvLFpXIRwA4p4XS0I6bYVUra3zKpDH1OgcNyzIQamf
 55n7MWr8EkInNzwKlA8b+/iT9gjOQw==
X-Proofpoint-GUID: rb0-xtCW0zQPk9-LpbBjBm69Rvq51O7K
X-Authority-Analysis: v=2.4 cv=bZBmkePB c=1 sm=1 tr=0 ts=69267f0e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CIqSYa-xjCW48oPHQIEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260032

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index def86b71a3da534f07844f01ecb73b424db3bddc..db81569dd4b17de1c70ab5058d4ea186e08ce09e 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -1030,7 +1030,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_8,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1052,7 +1052,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1

