Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589113C09E2
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 05:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550837; cv=none; b=TD6uBiro6xEwaVeLPbs630MfwEuH31s9VOHBZLChGEf7VAJkngV/Gwr8GkvqtuCcdzfoYIniEFRKM7e7NMmxw0REuaP2U7sAgKnsO99kiO7mwPrFdnKykp8f4C22AhozWmYzqVBvxpFKSwPViAvTMrTNapOlZUJl1YBg3DffNyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550837; c=relaxed/simple;
	bh=rLybFr1nm3KqTJtJoM4+U3ZrfAsIkDs2LbS3+BLktrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=su/nPmAojlSeU0PHN+l8BEBzpjVw6PePk6MHUwce7oFXxwyoJBnwD7zJ5qk0jwNeY76ALw5/FQVJIUIiWHR6Xxo2/mVd7z4fNwU0A7cFZyuk0ZvKkzWr8f5NOFT1OTSuFM9RLL55Svt//w8FEvQFlnloAzfFkPN6lbTWQD1M9CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5rX6+eQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQRHBa27; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5rX6+eQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQRHBa27"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540toHo598076
	for <linux-clk@vger.kernel.org>; Thu, 4 Jun 2026 05:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=; b=O5rX6+eQEVwIo6g6
	2l39rAuAiC4AGMSMLMnKQiien5YGJ8WOaXpi9shsijiHQm4CRITGTu9xXMYjlW4V
	wH4/qnAIgv4OXqkKdAND7dCYm5xpujpa8LuA3SgYcxHLhmKVpbDfEUuScsC2btpA
	5m95RekHKn3keX6hwRu0+sxprqwNBOLEEQMAG0usOSjZoL+t3lO5EAAEuqWlvL+w
	i2G0HZuna4GyPaReLQBZudWfI2HCwsU//VpBC7VWsUGeDpIqwXjf3zeP6VbP4u0B
	za3s6fR4uziLFsZ1MCu83Q7oLd4IOFRi5vfiKaFReriRPWnNJeh5fKlFDhZy5UbB
	Qh+kRg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m0rx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:27:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84247fed609so192460b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 22:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550835; x=1781155635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=;
        b=HQRHBa27CcIwjZsbpdC+X0RLCJ/Obq+1n1agEZzi6IEDRDZm8tSvruMoeQKkeadz6o
         suU7Vsxhxy38jamKpnoPj+TtlQwKiJTGrT0rlQCMdoGfjxgC33gq5B3nM5B8BRsj2vjl
         MqT9/3s0zIigRreB6j2hfu63e290ndxiKNcGEs1VLeA9RetAi1w6JV4UI/gYgywa29IM
         SpCpXz/bDmeqAW+wB8KoWjv8LKzbDGk+CXFBKEcyGyVr+WWsiUZgiKJJ1RU6bu2QUwPs
         x/NXQtvgFDj9n4lKEm2+LMiAGR5KvFO4PIyexj1d8QtKH8FLp14GN6NqmuYdmMYf6lsZ
         syUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550835; x=1781155635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=;
        b=Vmpb0LaO9dEVli1ESLh/KnAnSnyHeS0ZvWap9Q9oJAYGt9P6dC/4js5k2R47jqLCh5
         NW+EsKYqEPFzyc+SefT2EOyP5Qe6BxPVhbZ4NZ2QdnjQLImtfNMJA447BDNP9htaBhGc
         3gevHAnf8+QjAgTizSzNOKI6H6VUtWx465jn6DX2OlPbmbKxfMy/EZj5Z6mU89RrAnF4
         sDcpFyvAQ/kuBcV+jxBFMO5ln6J0OFyu3Fy0n5/bYKRs/x+DoLVlebnfGJRdhNEIVyPp
         30mEo5k/LR7owyvU7rA5pOUiPC1JpwEbFjsJ8b9Bx8oed4RFO2o7rw7HdZiyIVfE7KAa
         dVag==
X-Forwarded-Encrypted: i=1; AFNElJ/TXgHz1r9DX7KD4oDbu4GKbEPTdlC2xvKwTpeQouIZhuqZtOGuJazpOUSdZLL1jhiPOQtjHHRUrWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDwiyR/lvCBJp2E7Yfy3BdJW8odANZMJsQA3K9g92Ktcv6hpT/
	u3XoQ5QauA5ZZ45T8K1aD9AB5KibGjGQL+FrICnDLLUB+pq4sPFzGK220WG9maBAOWriUhvkthv
	9PXLWGhVm8TUYbSw9LlzbVpLk/dDRJ2hShXiX/lcKerJSkz5AAnIKKYPQ9bvnGXs=
X-Gm-Gg: Acq92OGO2ciwzvOEVvb0yiJiHBbIO4LRUgKi0Sf63C/ke9136afLIocLPtVpTRDjteB
	C9F0IWbxWT7fs2DJQjpQ6hLwDmr0nVP1TtNfLWMIr1u+ZiMFdnumDA4DfjF1cO8ykbVXSQ5msxV
	ZGTNj8KsSxEY7gVZBeGKKyQXWXyND8AYPPw1of7Q3snAmwkoj0bqcnbPCi1SIUdLJvuDW/XFCPa
	N8azsWPcSqeBGPvanaRqzg4TzJmnRJUKc5W6x3kAsBubY6xMvkQUw8/gDnCoE2g3ztwzqPQ+te/
	cjfEOh8GWL5nnTbZnDUBMJ+HtrPAD+SZSUrrPhFHSpGg/ibo3tMOCcnrcgr4RwO0e5XFngqTg0D
	rMRKoRBQwVS23d6khd6D6hYpLp5ck5HKg7yE9F1VM8dMZtyDklvUWY/nj31tzvK8=
X-Received: by 2002:aa7:8887:0:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84284f1bdfamr6387412b3a.33.1780550835146;
        Wed, 03 Jun 2026 22:27:15 -0700 (PDT)
X-Received: by 2002:aa7:8887:0:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84284f1bdfamr6387379b3a.33.1780550834671;
        Wed, 03 Jun 2026 22:27:14 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:14 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:15 +0530
Subject: [PATCH v4 09/13] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-9-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a210cb3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zEYBLtLDRKTvQvC0xrIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX6wukqeZmvKTb
 3y2FfsXqBsjEef5+FMvHynkR1ZY0VZPIsvE4PHprvwhZ6jf7R/ztr8+XqkRHG1eUY04U5tB0kNA
 jl/ZBdSz6hTcCazVXgt4vOboqiFd0N7F/Q7bcmcR3AUW+ew+4b5DmT+I9lQrloYQpkd44+KdJ3C
 Bnlgz7u75z5czDDsgUf5dfRjkx13k/anVavtBKPZspWLQiJ+4Mu9xcy8s3dkSY01dFZksRPd+6E
 jwVrvSSCF+Kvv2LYbrbmameZXmkaEzcYCj4barvYUac3taNG4+6k8KnLT9Ptu2SOFc3XxIruB3c
 yQ/y5u0ejXFpYYpNtCZXqEZjHyACpIdRVe1A2AyY5jDFMlmhmbBMej13XN3B/+g5IzymPUDECHW
 z5sGa/0lsw4xyE9EW1giYqBbqv6vSclnhMVb2QfduqeQIhSoM0fblUlAii4ey2CYbzvvoMS1uUw
 /0IVClpC3D7NvLWEzSw==
X-Proofpoint-GUID: jBVC3KxE0poqNMjqNT7fHOSFefxDy3V4
X-Proofpoint-ORIG-GUID: jBVC3KxE0poqNMjqNT7fHOSFefxDy3V4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050

The RCG's clk src has to be parked at XO while disabling as per the
HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 1c8ed12f6bf8154596d031347540ef621314edc6..2150b94ad0ce5146c47ae21fae4deccdaba20673 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -144,7 +144,7 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 		.parent_data = gpu_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1

