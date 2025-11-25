Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F113332BF5B
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 17:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764092745; cv=none; b=EsApMmT5hdXAqudXDIx4XEfLwSHp+d/sZid1QqamwqvhnbXR3mGIg9F+PsNLwyEhQy4VkWgvwhsNlWC3g8X4+AZZtQ2oDuJGB6VvI4AInU9mDwzAsqb2fzs9RXR6M6tzVWvKMynS7IGjOnfnZQBL44FHrcSWFnvLluKBsRKkaRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764092745; c=relaxed/simple;
	bh=U8poa0KaqrK9BEIbeOyVf6u7T99mbdOjXclQQRLj7ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwvY3gslQq+4lc+E/bgO6Ah8PQdxCbC5Awj+fSz/C3MuqLlGdo2AWPX2uAfWzvcgApx5SFcTR3Ak2tmohCJ4PXyXMle/BpewuS0MHdt95ag6CXBlygohX44BfwR+Xr/rpjC0r3g5hRf2XUduYzUnP2gLPir2693R465+P5VLpNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmejZUaH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=knbds86H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmejZUaH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="knbds86H"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9oqxQ1232175
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 17:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=; b=OmejZUaHSIegwbWP
	nYdDKnAN04CA26fyMpoDRm7bJr173/6TLRyaxlqh/LnBBE5MyYruowlXN2Cr8NXx
	6osWJAYb/UO7W7AHKOnEQrqjW+q5KYH2Gtyr05JqHckHhKxgnL+0CDpzgfGIOTID
	4WmrMrpECw5a0cIlDI8l7zNdqjzhmpWdfzDulpr3oju1OFw8agWBfSXxTUO1k/vt
	ADCd+b6OVehes1/cAPd7pFPT24iBtXn+HBLeEL3GisM/4Uth3Vb5buc+VeURhikg
	8CC50KF6SNHKW5yvE42yPoMqW906F7VvDgbvzT9RmQWjM3MaI45e9P6Sm0vecoHV
	oGSvgQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xyk3st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 17:45:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297df52c960so147718545ad.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 09:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764092743; x=1764697543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=;
        b=knbds86HCejK4QS8uR5GOLf1RpaI3D/EsgLUBw9GgDNxJmsIJlCfO6IUWKTvBHsIjl
         o8+pzG8W9JM749obfCkMwmnK8DF8OGtz8idNAG4rd7QZOkLSHF4Gdkqv3nci60AcqbKV
         cWjIACg9viBz1ddIFdTCCEnP7SgClG25Bwt6VeTnqbG8AiCrTNT5D9NUyl0p02mm3ZdG
         2Q2A2ePsqaA/Zm8wzZpz1Fk55zbFUOKr6EA0GFJpKPd8uncax/Zv2ohCfGaEbmYdF5TA
         MCJCXh4Ab4KLOzqtbMtOLnNP8a/D3RVeenDdROTGx+NowPUnwcb3HTW91j/c+IhrW8qz
         DVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092743; x=1764697543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=;
        b=NE9aiAU71v3Kx+xCgMJehSd7HMmo95iC3XbllWWOUCAa0Wup6uAESYP9wJ8iMEEkEx
         RZcC7e94fYbSVupO6h4JlPgFKHCnwMOQoTIi+ByRJhfsC6dq/gi374fleV9Uy9l2wypp
         SBEUZtcnbRUd5i9PxhCnj6oVb856ihwsmbEGwzNdRPtwANB5gH5M9/7Y7jJf7ybHIKnH
         EY00qj7hB/tK0yPG9AYIheBpv5voRGZ5cVJZE/mKpMwoaDkXZAIoFWIUR8XryBpX9JSz
         4I3KlxgJyFVtU5NzJbZk377rLlkTwQdm7jhbp6znw330MdJv8IbVBnk0Ni0a4164MFkd
         fnlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN3/rTKcZkhHVGCMFI2Mt+35moAQe5lW7ZPsXnQSRMvJP4/86roJwJDlelfKzormko8qzKeHNprHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu/nOrKU+fgo6chcfaNSxx7UgFtS2HiZR0F6DINJxmMxfqM1qF
	r/MOnDL0ZYflhBy1nvYwxKnidSd10o5Kv+hwQX4onTrKwOOeWqFhrPhcm1gJAzKZTJ7fy37tl02
	g7voJ79IqBWOU/uHAWzV4kZzkfOI0SPfey0Gb3Mdf+3KWolt4tjgN8rksa5ptYwM=
X-Gm-Gg: ASbGnctAYyFBXJawuqlD2lyMYqxS1E7Kinm5Y4p5A+nkyg/C9k9QPIyyQbsCMquvQk4
	WFD4q2S0l3vYoG1PtKoAWj7LJDQkYj7Ke6TiRRalvUMMhpwKg0UvGIW/P10P2FjZ1f3kfGcWacV
	P+mkQUW5O6DAz0j/8/MZ3C9yr/dESVZ9QPjoS5ua0FuUuQ12LW592tWoi34DzcR8gRlyMLR/X2I
	qeTpsRr1oy45CLs3YbabaeiglnnXDNhBQaNB7MOzjz43BdUDvoKa2VbUW8Fh496zve4OlWQq4Hp
	fzgkCe6MlYfDeuV3vXcVondHZ0kxgbuON/t5E4CeIl78pfnQpYV+HaLiHPchZFVggktHfo1PNvS
	ZEWXZPydI62urHAsgH5w=
X-Received: by 2002:a17:902:ef0f:b0:295:745a:8016 with SMTP id d9443c01a7336-29b6be8c765mr182969205ad.11.1764092742606;
        Tue, 25 Nov 2025 09:45:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWkvU7FtwVCjG3746418hQFphvRV7z9bBpLk0ElI56NuQn8FoZbZcci0AL6j/gHuF7bZXtmQ==
X-Received: by 2002:a17:902:ef0f:b0:295:745a:8016 with SMTP id d9443c01a7336-29b6be8c765mr182968755ad.11.1764092742112;
        Tue, 25 Nov 2025 09:45:42 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:45:41 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:11 +0530
Subject: [PATCH v2 02/11] clk: qcom: clk-alpha-pll: Add support for
 controlling Pongo EKO_T PLL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-kaanapali-mmcc-v2-v2-2-fb44e78f300b@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: B6r5H5lm0YIBoTJcVUY5nkDzM5G7Tcou
X-Proofpoint-ORIG-GUID: B6r5H5lm0YIBoTJcVUY5nkDzM5G7Tcou
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=6925eb47 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rVs2PR1jS8wsPJa1_kIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfX1RLwdrHBA96R
 fZ9HkgaBMeRRXxyLD/vlgsAlsfV7JGS1Jo7f7oIEC32DROl49ZBmg08itJEZYkn/lb5fk7npmtq
 DUgi/BVwhlbocwowBdsF3mCvKrJykq44HIIXyQhhC7wQypkQ7hzz8Xt9A+8d0OxgKT0hULUiAcI
 vxf06UvsRCZXEWQTW5tiWqPrpG359IsBi/kCPe9akFZTWaSWvT/z/rRhA4Ddr5tQfSmZpy2ITUi
 Ai8TAmeWOy2xw44RmmoZCGo1lS9JfMUDRotCsMD2l/a0LmeM/tUxOuQqBZeCuvZwtFzY9GSYlIS
 ENJs9nBfwnbZ656Zys3sUDoCXC9aGIRr2vgHlhE/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250148

Add clock ops for Pongo EKO_T PLL, add the pll ops for supporting
the PLL.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index ec5b4e4810300fa787420356bb073c24bb05da62..fc55a42fac2ffe589ba270010eb47c0816832ca7 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -28,6 +28,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_PONGO_ELU,
+	CLK_ALPHA_PLL_TYPE_PONGO_EKO_T = CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
@@ -207,6 +208,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
+#define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
 

-- 
2.34.1

