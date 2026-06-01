Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7573E8338
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 18:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338171; cv=none; b=L6Ugw+2L+xVz8OS1NDf6jv+fqa49RVlqSMPg/ChSe7DWHxGelhi7REZhiuszezU6FqpHsjvLOJDhDRnwU9u4c39ql4kvPC1F9w72GSp6i2+7qRj56ozekiZ6uosXDBh+6EAVy1SOUDNIZKu03bZVoPNUk4ipxGTyb1XXE3WahNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338171; c=relaxed/simple;
	bh=rLybFr1nm3KqTJtJoM4+U3ZrfAsIkDs2LbS3+BLktrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oW+OpstKGDEISvab33mS5wsI4ZCjFbCb0Eq20qzaa3x+VY4iBF3AA/GKaAkY6CgPP8Wk7EEFvx/snF/1f3VfKjQKE82ma8W1AkRj7qkyHhOA/WASLkPY0h/wBGexgQ5xj7YwqNpPOa/pKJViNbF+AhLel/bVoQhezHJbhfEILL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6Z6BO6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0S9Yx66; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6Z6BO6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0S9Yx66"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651Ega4T1257648
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 18:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=; b=Q6Z6BO6YzYxgofrB
	h9fcXdXTiwVpsMFTafucIiGSPhKeIAFHxL1uoEyFPKg6FD3MLtfj4oa4M86yWW2P
	9mkVUKROE2Q5CSuc6JDfNXs262q86KJJxjok4/IV+tznz8VT/e0GfrA2lI29+bXg
	PXsjwP2rpJOXSKkJ0eiiFtImsylICy5AJByoAj4wlhKHuY2vRDRyBC158jCQPDeU
	waz/isnHkp1Iaq2L8XIxCjxBId5sr8ZjgO/jzu+dLVAp8Ir6RTgPrjgv2790xMJr
	6DFvml/fbJ8a7Qx0pkb3rN8p4fEjVJv8EtcM+my4J/VEfVXAOWb8vRWB84KNOSff
	bhXA7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sstf92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 18:22:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bba9b849dso3438179a91.1
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338169; x=1780942969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=;
        b=f0S9Yx66s8+QIfdnF9ca6ykeHhTsZyIPWH8ADdZH/aRyHwTvmBOxzyJVsWN0S742y+
         5QIfKd86nSBFi2ts1fDdXrn2EcQwkmCoRjr44x+7eCCO4Vb63xKygJzk3jkMf6cCq6lZ
         j2Bns9gYlJzjmMu+nh1Kr/VC/UTIq245cdlOnxywyzBFULE68EuGenKlySohgjQiatcN
         aM753a/YyhcfMBkDgtNwoiDmLV4DU6D7+ygBIYD/nT6Xps5gpJ0NNrMOwvTFnbG1stNp
         3gAeo28X42JgOSnc8lIRlqh0LjHC9BmzxRgLskva5uz/hRlRgaHstUaepgxJaNWKAAIb
         e12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338169; x=1780942969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=;
        b=YBuRy5xYBZEAhgncAKTDCW1U4RlGqPGKpXvxroRbEIbBifrKv4giOaHLW5lskGS97B
         bHmBDdEPTwKOwUhqF9UqOYu0m1SvSUHp49CzGHqp03FO3BFmIPSpOnAh0a4sH/HqCTnp
         hDYMmTchqXh6ZFe2FZJgLpxzaojHTpRK2mKEZMK3Ndk/9uVrSiKJ68pY6udgnyTnqQ9j
         fF40rLdGH/pcKGyjEkkoCB1xQQKwzCGwg2zl3mKRrUNB6mUUR3kf0Jnzndf2i0FHydjf
         kjuIA8DCo8ccvBjoWPswHeU4Oa+WntS0PUhAQ0jq92uXEf6OpS6w4a7nvNuDB5BvcWI3
         vVnw==
X-Forwarded-Encrypted: i=1; AFNElJ+Ukx3CNcGACbRYY5uQQU3837w/vrW4Am71hPOJOSefvtsaC3q0sOZdwbviIkW42mTnE7gsbFFqbqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrToJX1GX0tL+H9DW3HBgT9DSXW6nXBXBWx9vTg4HWWY6HPM9w
	TWOX6e+hZg8EuW20WB0Tgklwi/1y/xhqIdpS7ibsqqkuBNYHQBiWfW+6F9zK10uMQiCBq3gJtcp
	HBRH7+onpVsuILFQ9tEiX1SZMzgbV1L0kui10IBv3IwkLcqjTzX80zu0/kjWqvRI=
X-Gm-Gg: Acq92OE16cq+zO5YkVlwAWv6c3GNHeS77w+7KqtW1SjgoaKngch5odI3W4q0+od/mL3
	QdiU79xJ0/zigYcX6JnoUBpP93zAB62G0WBJE3YylxbhrDYE9/0UXsWz6OCm2sl00i8DPKERKbP
	WI8hSBsdAd4NCrWSJFBSHHBjmb5MQXeqt1U1AJKL3FL1CAc7NOum+vY9E0kx8P6hmv+/rFXIduV
	LfNnwvLfg4ze5m/EiguMsrog1/Kr2k2MRXZB/3mke0TnwbzDrgzLU4xdaWajClEHtgcvxHshLRu
	ySbpA8AG/4ByAbAFHXwiB8G3+XFazobUeELWE+OB0B1+1skdT3b+oXKwsR2FzjqfJUeHBu7TfpX
	l+iuRIxLmoGaeWQt5Tq/3NQ9Of6Vz1sdKqMsJQWEJTkV0YoIWk62YpzZZmLXUzhY=
X-Received: by 2002:a17:90b:2d4d:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-36c50206e8dmr11910344a91.21.1780338168854;
        Mon, 01 Jun 2026 11:22:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2d4d:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-36c50206e8dmr11910309a91.21.1780338168388;
        Mon, 01 Jun 2026 11:22:48 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:48 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:31 +0530
Subject: [PATCH v3 09/12] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-9-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: PRLzA7Jxel4zRhi-2ener7JUD6XqbVnR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX6DhNxZcmnSd1
 T7RedTLRnf58itcbZkU0FLsZ7JnndjxLyUAZHibdUCEpWhVnyYwmSZUA76HADc7kZC0ICVoKwLb
 L0EMZ3fVXhm9uOP3QDI+cfiW3hhtKw3AvfdvFCLC2CbToiPD5iVa5qLC5IbqHSaBxJthUlLlNLz
 5J7m37F2yhYj5MwHRRA/tM7KUK9vqliO5Sq6YFgpZX/0/JCsh7WDYHHxQ9/VyRfjDwQshbSt13s
 Z+UyciqrlqUxOOZnwi6y5qdKJM/5ITm4UmKtGVsGFuF2DEkXJJwdze5MftagIOvccsqTF0Gdl1L
 PkbQ+i6SZqAAGGh00TZuIo1jZyyRG6sL4eg6RivAR7JhExxna8ecdNEYkDfxKxFfXjqmcvkXumG
 kCvl+XSyzw/ED/ywuqQCya2GswHpxrvapLq1s8yH2EaLxbkcc8mGkQTxGBSpmnZS3y71PBAH5jZ
 zrtWK5ZjrkEDH4p7y9Q==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1dcdf9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zEYBLtLDRKTvQvC0xrIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: PRLzA7Jxel4zRhi-2ener7JUD6XqbVnR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181

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

