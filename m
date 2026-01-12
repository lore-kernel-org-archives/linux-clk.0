Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20702F5321
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 02:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768183960; cv=none; b=lSWwNBXj1DEH/xQr9REDohKCGPlh55EAkF6x9QGnTTzx6yncZedfbeV8lXERBtzl7yMlD/Dh+kUOwm7X9/FaFKaeFfmHPCi28dXtPimDIcS/5KrxJ3W/M1rHNDuA/vR6gCHF3kHrsaqdqFAE2pk30aC5n0EbmkcqzyHCAI2bea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768183960; c=relaxed/simple;
	bh=kkzRM94g4k0ZUibZ/TPkJtsCiTNnB4epqNQqw39rwvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJuf9Sz74XsC+IkR4SdBj6T2eSn61SSia34IAGwmmVRwcnw+LedPjQXKsw6HqVQbmXwK+WxoO/bxH+L000K/LKzDkKLgGAI695HdyEGZjfGf7lDSiwKqojBu2ZPXeNi78eW8Uoqpho1saIs/g+OZe0Qnk1RbCHhFAyi5gL8oEo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/a+kDHv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKoJowiT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/a+kDHv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cKoJowiT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNXOVv3769939
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 02:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+o7VhKxyMyH5H0Hj9YL8zu7muqrT5hD+9J3pKy8WzI=; b=O/a+kDHvWt4Pe8WP
	Eo/0WJLQQM4KjPCnhQrKg/lZhMEF6yRTRlxBs6oS9vOwp9aiCluD93I+NhgSc2Ti
	v+BlRWv/s8891O7hPpXaa1fqKF5ZWi6ZaKhqQAAZo0zdvo/OFWLymcUrmgo38CHy
	F+w3TdSrSJeneNV4s9m7KwYkwKsleGBADwjsUZiM1Sucz5eKVJSvAJx3hcBX5Pmy
	hIx94S0Pc31Gy/wXjOIb0PuCMoAJ6KEjYsuvmv6Bk/JJA043QUkkCAm+FO9IMb40
	eRyB1RuvvnFdRv+K0hB1SUWor+87Jd1+HLE9d1MjLCVgczTCPBZQkUiy5hg5E6eF
	2q4LeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bks25abfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 02:12:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b24383b680so2381034885a.0
        for <linux-clk@vger.kernel.org>; Sun, 11 Jan 2026 18:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768183954; x=1768788754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+o7VhKxyMyH5H0Hj9YL8zu7muqrT5hD+9J3pKy8WzI=;
        b=cKoJowiT9beN5sO/6RX4XgAHAhdtxhkW/38tk9wgGiSX/u4IUPBgdt6oTH+LP0sYmn
         ZMKiTvbfmBWHGVivqIb/njFGizEBseKj3n8E1WwtUwfwgKdUJNzWYVJfVBZxlNHlSuW2
         90mj1DPXauVGST5+hbM6xOuq5dirSpZHD3hDOHG2bsn6MTv6A89u6yl/DWIPdToZdD1U
         TJuNQqJxyMZQNM7l6jSNfFuIroHGUujVkG5osr/Zl1Bi7gQr3E4168oGQbcz2I43Mp0o
         bX/W+6+XnYVDy8MgETHt/ihe1wq8lQJPcsssSambrGxCaaxUFky5JMZokvh/B5D18mmM
         LuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768183954; x=1768788754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S+o7VhKxyMyH5H0Hj9YL8zu7muqrT5hD+9J3pKy8WzI=;
        b=sdGmWg0z3cnXVsse+cWCr/BGDuLGhu+QRi1YKiD9nfDQp3YKFyh6vVUzy9N/dLCdY7
         PUgyQx2rPBPd/Cq26WcdV3Tff++FK72DVjD83X/qRNK6HLSdQ73D7LOplQGZ0cEik9d4
         nDZfi9xXr7JBcV68M/uK6FlIgkT85+/rPWypF+X9KOqXlPgjgyk3Eic5ZQlXuy+gPxN8
         PUsV6O7tO1/wFly0p/da6lCJCq7Rk9SfQhzoMzqM0AVpHzaWpO9CEroucgxtuCh6t53q
         JcI4qG7QrUTt7FysHIGp5r/3ZVK5FavmpvZPciD2SYlOOwRjiu4Xk71EOVU+6TdyTcQW
         ChPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4KEHJM0A5K2qz5S9UJWqMWQFlDwXy6wYRBqf30oA/40xlytPcceVbz5fYF3p+oiFr4GyIAW31UAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaTtyKt8Rv2aSR2GFZCSrojMaJ/bHDdEhQI3TefkqCbGqluMJA
	1FpBK5hRyAJd/okq+FuXlJHSscN/UI8f59i0N0BXTgPJBfZFnwhgFNoo757KsJQzmNnTVv3PxzQ
	szYoDcg2JuMZMYM5cS/95l2aA95nte1ZL7xwcnIw4nMf5zlhZy9zvZ4d/FimGMMU=
X-Gm-Gg: AY/fxX7YiRp+SbBpjKe2FLWBUZstHPq9OIUtGW/tCd2F5jUaZLP+nIms2jaGyTIeBSX
	CQ7vmaqZPamzC1aTqXqHHz17eEGY46akNV7B/zKEJvg9UwOurxN0wpFIGjKPgqr40Sajp7fOde4
	aCG2kfhDphy3joLt1sDllaOAiUlpMiNkb2slsMJ1NBHVapvUu474jNv2IxVM6auKSb9vU8ZCH5X
	bYW6xM2so2D7D34jgZO6BIXug0b/UqNixue7tUfbj8n0lGV+0FfHDqdkejidwPGWReD6eEF/6ZN
	j5RvhFZ3UCvHyDFMtek3mi3Q3sF6z3LU7fKwdkLHosCDqmrhUbznieDACOn4ihKsJCWaL0ehkhG
	16B7+ZKg+dncXmmtzo0SrE3oJ3+yvA/tm9vXNyA+1YNujRPr0lZXw8KL+hRcPTRdsF1Bkvt+uq+
	R3rhzOhfxy2KE6tBZOIs+kyNY=
X-Received: by 2002:a05:620a:1904:b0:8b2:c2ba:7075 with SMTP id af79cd13be357-8c3894172d6mr2351999785a.75.1768183954595;
        Sun, 11 Jan 2026 18:12:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhJ27EgCum5Rw43tYYoEWj7C2F73gPQcKyM8KdN24TkPW2Xa/AISE6jNDbdZ4b4qE8YHjFmA==
X-Received: by 2002:a05:620a:1904:b0:8b2:c2ba:7075 with SMTP id af79cd13be357-8c3894172d6mr2351997885a.75.1768183954200;
        Sun, 11 Jan 2026 18:12:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0d95dsm4499529e87.30.2026.01.11.18.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 18:12:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 04:12:23 +0200
Subject: [PATCH 2/2] clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX
 clock source
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dp-aux-clks-v1-2-456b0c11b069@oss.qualcomm.com>
References: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
In-Reply-To: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=935;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kkzRM94g4k0ZUibZ/TPkJtsCiTNnB4epqNQqw39rwvc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZFiIPmging7Ut/k+lfXrncdZ2E4eZz5AZgWeI
 e9KviZ63aqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRYiAAKCRCLPIo+Aiko
 1V2SB/9NTNKtZxs+lUj3JFCgKR3Nc9DOskqjHdTeVH70r0lJ5d0qsTkQe8SwZVsMKu4ZxpPpER0
 68yeHvU8Xirv0WT3YfkzZioxbGkDhB6B78ZT/Ha05Q4sTL0XJRJkIJe/Vr06NEEi6VQYNDjX+Wk
 7q2MtFeE8jHZ+2RFBK860jeUaGudYBY5Dt3rR87tUa3ZzpHV7nw6N4MQkkGsGFTnLvllF02eXQP
 Zjvs5DZCk0SPP9osFZFjEF5GimeVHm+8AFTdKzg5mX0icNYhl+fpAwMps72Yk+4tGl+0MgcFm23
 61tbvvZDPPyzu0lO2eP8nf2BNwL0U6t/a+v+dhnt5XdDax3b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAxNyBTYWx0ZWRfXxOHdERJmSVyP
 NvrghxfSeGF8daHRFkH5Wj+4WyNaOTGuRwfmo6tZYbzulZEYoXY1FksXy5ROSsLvYclyR7u2qwJ
 MQ4+zv/AjS1E81A4p2K/CWcuq3CijI99WbzfXk7SvEz1Mymoq0L6X95lcFUGgn+taeX0lBpd8tm
 OlhYLs5B3i2mKShSSveRcla4b2coXosQOpRLmOkBPbNckz3a2qBQhgCfOvmVV5cgew7pRf5Zs6T
 Z+JEMDrlcqYNrYB/QWf7q0+3Pj4E5zR/ZIqZqNxBKTuh5wVmG1mtUHjhAv7l8/bAaRYsD1BTruq
 PMzSAT2tL9+3An+OHgg1ez/v1wq9i39lSXVnEa/ZDbXFym4dVmkmOLNNQrpHgVQLKG4znWwJIIJ
 7dlq5gw0Ukvryt72QHIwLbVMBsYXNcGtevzAXWxrwMy8JR959FoeRFKSxpyQoWuoF+RaQzejww/
 aWXiMnZtjhK2iShxzyw==
X-Proofpoint-GUID: QJH4dziF447bxEdkdIAA-KbYTwVlqKd0
X-Proofpoint-ORIG-GUID: QJH4dziF447bxEdkdIAA-KbYTwVlqKd0
X-Authority-Analysis: v=2.4 cv=EMELElZC c=1 sm=1 tr=0 ts=69645893 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7ahx9mval_N1o9DOsQwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120017

The clk_dp_ops are supposed to be used for DP-related clocks with a
proper MND divier. Use standard RCG2 ops for dptx1_aux_clk_src, the same
as all other DPTX AUX clocks in this driver.

Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm8450.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 9ce9fd28e55b..2e91332dd92a 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -409,7 +409,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 

-- 
2.47.3

