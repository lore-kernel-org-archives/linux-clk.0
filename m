Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19DC40BCAB
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220550; cv=none; b=RirHw4jBg8ZpP3vgHvxlXfAUtIPXp3NtqUqDXrVNC/pQJ8TImsjaDHNwbZSWj+RunjqlSFQwsCmPpkBMHckUDO8fJVVsQmg1QgS1WP/EduMNyL9G4pHRKpjfhD3X3v/afOYbXWPnqQph8GpZ5S5Zxe+wQYYOIv8qAD9U5Cd7nWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220550; c=relaxed/simple;
	bh=IwT34kSLVHjVkKs39Q3jyS4BIg0aB+2aavdEaDZRWWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zr1CrR+2IfqM/QuV2yczZrlARR9EX6Iz1uVwrD+cC5OqmlgkU91kCs49gGp91L59bp4UdR7CcQnPX7L9F+v1Cti7+VKM82N8an0+eEgQs6VOCSh7HmS8LQUeBuzIWkavcl3RkqxdHHpkCBk8oSYz0x3p2TJmZGRm51eXUc81Zpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AoXp3nqe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/FRU3Bp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AoXp3nqe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/FRU3Bp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8tIms3515473
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tM/0TSrpcoDvVWBg+pgYYRSW5nyeWcLn24KBJNgdwOg=; b=AoXp3nqeauyXk/tm
	QjgmHjRL6CBbXEVqkeJxDFdMF07xT3qcfwpSTWl4RwbGmxW0gSvpHdJquX9uWHzp
	b2NV94oPmC/3RSbG3Ybb/tgd/Fruq+HTdH/5UTTThSGmcJNLuzCWOe8J8EQS/qGE
	sAvAjWYaM29tJ1rIKC0RtQpWXPeA6xHWHo4/QfxWzVPw8DxJtU2oiKZjsyB9ETUt
	bToGrpMUlTBbb84vfb7+ALzAiuKvX/PDAdHI97iEXL8Mh4PMKU2IxjIe2REsTrTe
	6vl7PbXi+hv4+BfD+Yu4bRAfR3eW4SBLJQQx2AJMmv7wHv2ZV0kMWDHkp054+8Sk
	UUMeag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgc89wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso180724685a.3
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220526; x=1787825326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tM/0TSrpcoDvVWBg+pgYYRSW5nyeWcLn24KBJNgdwOg=;
        b=P/FRU3BpJpJ/fqOR2hmHxhmOZNKAiTdaXQ7X1rn5gRlSlKp3+MzUNN7gQjM9JwpYCu
         d8lWCpeHgd1nt9qvnrRBBYmzA5zZvzRiH253hKxOe5gamol6DjmZdEwTrTMFOXG8pELT
         j+fHpInQXec6xkG/ChSHb/dcPthBBsd4pQElI6Myzj8jsjYxq6b7v5lpEUrEtWiupdmi
         o/MCvi6Eo82/SvdhI0DkL9lTj6+5QICveWrFfl9ahqaT4nWxXsVWMMjW2N08vT4YwJTb
         j7kz4q446WaYeOucuRXtmz24hQiyGEYAFpvJairU7c6HLNEFkixxNTpmru/A0ZyCAjH2
         6s6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220526; x=1787825326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tM/0TSrpcoDvVWBg+pgYYRSW5nyeWcLn24KBJNgdwOg=;
        b=rKbG8iImhvBWYx10bGEjUA8WG/UNm1GNS+Pil1lSyFw9+xlPQ/DGv2jyhcj+PSqT+g
         7UJW86P/d9nE/rC5VY8xxPFWpCoOgW2TyvKbtcldK3Cp8eEXHQ17/9eyokT2mhGeNJiF
         VW9E7GkfixUv9hSXP7y13ZYlYgqcZO0XuFx6+pnnx0p84iXbNHS7eeu/dLayqaT3lVOS
         1rrrATN5GIbh9bq1dwGEIkR1SOnOgT4BTy1c4NA+xvwH4X8WBuDhvVZttfeVnfBPFo0W
         1MPx8QEZAVN9DN7YIgoDcvPn/UVJ9s33rOfAYxGfaWbRHGVQ736xESikh0JY/4PkDbUM
         dpPg==
X-Forwarded-Encrypted: i=1; AHgh+RqRAV6SPhzQQb1y2I0XSow5cCcY+TUZnnyd4eNOLdKSW5qDhvP+2BIwyWx7gLCOQIOE88wOFHeJAbg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9R4tVFAju/Ob0svObkZ/voCydVJ6xEbFKacg8qL+DLlgo2Q+d
	NzK88W50cTS1wIcRW5VM4kW+F2/T0zGrX6ShB897KTmBpxFXLjBa88dCuX6bJWjGRq37Xe0YeTg
	YROO7J+xpVNNokgDOOZKcpxw1tLHqB7VBiMI8YElGlnhBWFvYhwpEjQBqy4jJ2LE=
X-Gm-Gg: AR+sD1171B4L6BC8TEmIHx0a5VKj6Kxntk5qdYhZUztWe6uWzv0XMSSwRGAvv8CS9Yr
	0XCexfhSQUQgPPwKUMMJcZhXaXXJG85STqiifTqSvbxD4jIMOo7duC9egQMUaHk2DBUJHM5BgJY
	FBX7bfWB8OhuQ3lRhNUep5N27rn3SnWHD3Khwg0aBLFX2GW5MAN5ThUsdN7MtPsuKDkH6nxQezy
	LtjA6ESw+5o0GDAUj/qLJSEqHbLKizftRrF26QCshX2eh267S8Y9xUL/yVqG5Yvwt4QZhL93MYt
	ssyffek2+Mr8d5QhX94mG+bp1Q2LO7WCEbTa80JTrmavnpyiOT+jpMPuf2+S13n9tAqKfSkODnC
	btifPk6nm
X-Received: by 2002:a05:620a:2810:b0:936:cae5:8b38 with SMTP id af79cd13be357-9371e25434cmr1098533485a.10.1787220525999;
        Thu, 20 Aug 2026 03:08:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2810:b0:936:cae5:8b38 with SMTP id af79cd13be357-9371e25434cmr1098527385a.10.1787220525486;
        Thu, 20 Aug 2026 03:08:45 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:07 +0300
Subject: [PATCH v2 04/16] clk: qcom: gcc-sm8550: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-4-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IwT34kSLVHjVkKs39Q3jyS4BIg0aB+2aavdEaDZRWWE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtHn8i2H/qCpb37IaOqj1SPDcl1hr2n05+Sey
 WkRz2cd1qSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR5wAKCRAbX0TJAJUV
 VuVmD/9bSgs7EqSALYYs/hosX+iEhJG7KmYNXev73ujJ+ozySAX4gV8En8zu6Nhh8tSfV/5qPgx
 ODva9MX7bInj6Xp/r4MkTlC+JTIdrSodyVwGzpfoSWevN2SfUvg5le87xYIW9RlBWlrJSKl4OaS
 avn3HYRalwoHu//BNPx1U5BhikUhq1ZZJr3jY7bJYTxGZ1QXFs13ev5KfSLKTa73yYMUGpG/qz6
 YH6ws1b99LqFuHxsNRaOja+4funr9xtO6CwFbCr+KW0gHRXhrHFtVT9ydRjpQgOViFhqqUDTdXx
 bmORdmRP9eB5tt1o3FT7lfIhUadEbJg/tb0wRir2G2uKA8GdZP3IoOeYtGT4LhS3ZZiVlxgtBBP
 uwffzK5LgcjHSTc0TdIahIxrVooaNg4IdGjUnQqFX38iTlUrw8QUXZMUGXNdK00IFb5WdQGxf7v
 kY9xFMD/2Jb6hN9mAgwKECRYUoGytEV2E20g98P8Kh73OpNKC0/dx6RqOYvETxsDhG6bEYAqHx9
 e+GlAJng8aS2oCYnIM6akG92z/PX9pcGr5Z40y9svawStYEnwM+Z0W5HI9BTOFs2vKJZF/BWies
 7PGWI33qfXOaH3jgPvuy5fbhJ0JOvojkTxlAfwbnH+sIZ9+C1D14xDRAbfMWIAmTCaJlbZhlbWy
 szqr2B7ULAFfZYA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a86d22f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: TN6F_l6nbbfuwjHmyTe7cQ4HQ-UTt3Kq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX4mjoCS7sXvPk
 u5ns0KpaXwXAy2Xm8RRqLHC3YGdbGoVzK+Nv0J/m//DjjUWX+6/XAMSzvGiBpNlwulBrIrlin9V
 KGvp86zyIaN2r5X+9nlpiURMGC7GpIM3aUl1+ygQhj4B9cXjheWifUNH1ISHTHdSVlWQ6vI1I8T
 jnBvr/5pmcRJqrBAigKplLavLuMSkQsG7e8IDoZw5g4RzUDRua9AXoV5fYKsUazFdxwFSehs3UW
 BqVSNTH0eNFZbePtFDhB68HY9uIY66szFiYilUrhma0A6STUiWlrZV8wjZs+pzB6332EoGAYb8e
 /A2ooXd7euOZmylppJ9p1CId13a2EMLXeX0/drILm7wsLmO5PbvJaf0ZP5G84gghhWsk0t3vcUJ
 rxSBO7cgr7PGlnQNFGduLY1zgWwjp9lmaMofQIS4tHKzo9GeWVREtFhbm/FGUaw7147PfeOnpiU
 LCauOTZ47uIePaay8oA==
X-Proofpoint-GUID: TN6F_l6nbbfuwjHmyTe7cQ4HQ-UTt3Kq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXz5RUxCoKyQ8O
 eourf4cBmZOzb/HnGkAQE3VOd7kctRqjUEbFQoEMnyFX/JOJ0TmuDfraPZgP3cXnxkzRSYtG0aa
 TI/htLf6v8XlRwsEhxpcfCG5uk3HOQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 36a5b7de5b55..427ae9cf28c1 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3326,6 +3326,7 @@ static const struct qcom_cc_desc gcc_sm8550_desc = {
 	.resets = gcc_sm8550_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8550_resets),
 	.gdscs = gcc_sm8550_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8550_gdscs),
 };
 

-- 
2.54.0

