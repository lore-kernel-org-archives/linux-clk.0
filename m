Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2005C311950
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130581; cv=none; b=JA3dzOZXNlKazEK2mwFuyXgN3447m1HFPLGj8AzJisZeb2rVvCsGi5gVGRjKdppUVgRLKDw49EjWk1IcNNpPNskSWRdqLy51DcFpKc41rd7ugP3xbSXWxL7D1Rppp8TiXFB142VYD7Ux38MPTFfKJ/cYZLsMkRm7NwA/PIHZuls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130581; c=relaxed/simple;
	bh=sty5Cjr+72qT2DpYOiHClH1omHS5/FS1L3dtiPoU+HE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUUZwkM6VWfq2w/4B6bDp5WLT+xVQT3CpOmv+avzwhv5B1Fsefr2p9G9wDf93P0w9qsk/ay6YuqxqsGavSYDEB4OTWhnniqzB4wAqtvMxFBoeKHTa7lN5FWK3RrLOpM9NA4WmYTv86z8IYefzHEL1FF1r2OOyKV4CJ43gWlRN38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hv57MkFt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ps/PM4OV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hv57MkFt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ps/PM4OV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APNMdUs4049007
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VnCR3E8MswDMSeqxehEkzyJMHwYw54XGcZD7XCwLeus=; b=Hv57MkFt1/W6ye4C
	HoaKMxOSUn1yDDv/xXEL6XeaFqR253VcFDA7AV8RsEzWPFGhiPVmVkvUWdvXg3w2
	ILRmOdiMTdTgX+qAMcvv6PAc+sLKAaCGs2YKVZyM+k/Pm8jb4on6r269e+ujTydk
	NPwE8uBvKfOlxVHZkRtyEJT24dpcxgFCG6/ODFm90vs1iAF1nZKtKKQ1n1g+CDlW
	cyZzPLBlmLgeMh5C/iog14aZ2iZzL3dhjssxottcDYHk3s/9jP6JOtGBxZO1Ywx0
	1iGdKuK7UBmsHmtVVtpnhaKXLKg2R02GCZN1Rxm8QFFc7+ZpLUaMeouvQ/bzTzHH
	19160Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2ngkeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-295592eb5dbso129661255ad.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 20:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764130578; x=1764735378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnCR3E8MswDMSeqxehEkzyJMHwYw54XGcZD7XCwLeus=;
        b=Ps/PM4OV8dgtA7pi0wKgYmq9pF/b9DntGfKCVHs1yjYAPJa8tkJpDYRYoOKGZwfmWj
         bZa9AaO8+ry5Q8kv2jS59K+asiMcobp6hsD841+l6zrMUEhY9zPgbDZKI4sToEdt1F6z
         h6Q8V9Nz+mzoGr/CE5JiOGQcdxMPf2rR/8iPwKZDYkz4iSFY5hWGh8Zyx/C8ptft0ZHO
         /AfHIOpEHz/1i90Dx2ze3bsAh4pwhinOOJP6rATfzsjQ2ZbNUWFF/4PsH2+Vr5q/5Sr2
         kr7XdFOD1taQI0U7GXiQ2kZbP8LoRJ4Ag2HmIwfcxEeYaGprTlZYD7nA5PuPGyNv5Tgr
         khgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130578; x=1764735378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VnCR3E8MswDMSeqxehEkzyJMHwYw54XGcZD7XCwLeus=;
        b=m1dNgpMe97SgIldn3v2I7t3TUYMMh4nJb/UecxUB2ymPI8tQAx7RKghPmmr5yGxEOK
         ajCuZ4FMDoBVtlyG26oolUgM1MW2wsTRhOB9e6Mrthee/8mShzrGBIT5Q1qxJgQLEfxx
         4TFc6+lS8sM5sUzIuCbYFKs/vgLsZaJgRYUgRn4b8Cv6jmCWKPPBixB36ClMfxkvCYMd
         jxwpC2VmvMgTTecnh60fjajuNd00Ww8Y2uQKAM2adOpD58Ct0iKSeof9j/C6ri6FgKNu
         HeRUPEOp1ghMxYejJMp6scUgFlAGlOUfx6QCqtCfHkiRZSezsShYGW7/4Awb1XyxlHPf
         pYyA==
X-Forwarded-Encrypted: i=1; AJvYcCVvsDZ86SA0aRTnHATFzEMQnCO/qJQYO1ZSs1EfOKaCUUkJf33aRZU8XP2YlYn2QmwJXnVe2pBUTxc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuqud48v4GSRrEIGDQeCP2zqW2I0/rijQISlYuLjOaswocyCGE
	MNdrBwVXeukgmw2Q80z3eNe5U3kc/+XRIb2Z/24/2rwOKTJsK4fj8SYVet0zW8y2A7l8CRflCGE
	G7kZvi1ogER4Xs2qCwsbdd0NDdVBwmla+vowvGSwVsZ/iyWoEn7DR4aUrWLacCuw=
X-Gm-Gg: ASbGncua6qaneD/wW1MoaaYShfCdJki++PhNddo6hjcBlukAjCFRuwzwd+RwPDa4w9J
	PS++dQFrEZGz/cUdtLI2kL/fD/8Z4MmaFaIE+H26B3lZHTBgL/h5ffFTB684fDj3drNIgBNM4XD
	AO+tgFxmzYGxdHZ4Skh5zhgnND2T3xYGghWgYy0A/OReDiPyHaZ21L1m+DFqMGIb0LAiikmBQHG
	7lNE2eJu9+B8O3lGg94VEuApDQ9wUGBcxxk0+wfYER+ukRAn4fY5Nci76R/SuMXplfnuTjZMspI
	gAH6Jpo1AgU5KNDo85Bii4MQfu457DMJnQn/nUqhgOA0NMdOzXovIuQjIGk6/6Hgq6qCEzObqBw
	+wTss42+p1AJ0iwr/ZNzt15lwT6yXey9fiVWTyX7k
X-Received: by 2002:a17:903:2b07:b0:295:fac:7b72 with SMTP id d9443c01a7336-29b6c6b6cc5mr198388225ad.52.1764130578521;
        Tue, 25 Nov 2025 20:16:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+g0gfNOwsgKq9WQ1PvGES8nv+WEow5ODmYhawaoaR9loiDan2SUxRkZcP7Iuv74k3QWdgIA==
X-Received: by 2002:a17:903:2b07:b0:295:fac:7b72 with SMTP id d9443c01a7336-29b6c6b6cc5mr198387855ad.52.1764130578025;
        Tue, 25 Nov 2025 20:16:18 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075basm179300125ad.21.2025.11.25.20.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 20:16:17 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 09:45:52 +0530
Subject: [PATCH 3/5] clk: qcom: gcc-sm4450: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-sdcc_shared_floor_ops-v1-3-9038430dfed4@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=69267f13 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tVXKSGAZSJt5irGpn-QA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: T6EjIveU9El7eHpTOjsTGnEo8fL_LryU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzMiBTYWx0ZWRfX0hbUxJlmAAlM
 ypKoe3gT2SfxJlDr9i5Vx1bUmeIND2Xq2XKMRyCbz3TJC+Cp3nWVZrDdJsaaAnDp0qqvCGlr1aU
 us0U49hsgdjabNXHP6ngbO/VVwl/LPb30lUhM5y+5rHjCD+KnzC00Yw4f3bEqounBZws83NZSIo
 VvviWEv2Lzu+OjPCnUxys25CEuw5TWBzOVtwcekw3+Hc4ovCovVgqtozXxKV37HGWS0b8fYbFTu
 IaHbJElsbDe5vLqzUpMi2xHpQoP0E6I6pgZjGvTfkgARxNUpomGpHBHzN15YpjRUIfo555DkcMv
 xxVZr8POGMhBrDuFSVcQYhLCXlUIUPPZ9ncUkFLMLBCKrPeCTfW+f3msL4/XoNmc/3kX2wEDJGU
 txtUTA+5fKIuHJaTNCi3vAu1VXgUNQ==
X-Proofpoint-ORIG-GUID: T6EjIveU9El7eHpTOjsTGnEo8fL_LryU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260032

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: c32c4ef98bac ("clk: qcom: Add GCC driver support for SM4450")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm4450.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm4450.c b/drivers/clk/qcom/gcc-sm4450.c
index e2d9e4691c5b719adfa86b904394ba85d086c12c..023d840e9f4ef0d6e9e7f16372cb9eb493f623d3 100644
--- a/drivers/clk/qcom/gcc-sm4450.c
+++ b/drivers/clk/qcom/gcc-sm4450.c
@@ -769,7 +769,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 		.parent_data = gcc_parent_data_4,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -791,7 +791,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
 		.parent_data = gcc_parent_data_4,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -815,7 +815,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_6,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1

