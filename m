Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6462C21E7
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 22:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758754757; cv=none; b=UmX0AxrBkgAeid2VTMoTBPySgP/t1xyq+JVnB6CAUcqKrS8JDEot7yPJEWcMwEwOyn2Y1lmxc3FQGcyhZFC0mFEYOOilBBP77yBSYUfhPfChnf+mc5i8Qymj5MVyUcnZHwZtPQGwL3H6xzKMYr8AGZmI0wTNXZYtWu85O3PhFD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758754757; c=relaxed/simple;
	bh=h3aXo8gGx1W7ssER20ULEPl8JN+Bc4212thlS2Y7qbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o6qTkXUjqjYr7XRLpSwQ9gItApelIYPJlbOXvCztHDXI1tkM/KAsrNsNlYC7n6qBU/CVIvdeRLph0EydrFi/vulpxpWTzXjQ+5pbkcs+FWxuTlhHMn0Zb6UCYoS0Px/izgdPDfFvUOfgBTMVNoXZqfwCJGA5Jv+dy/tIZwd3dzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXdBWdL/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXdBWdL/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCiXR8002657
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 22:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ByfRBJ3QzPSQA4bVlLf4TGWf7Fa4oINCyeRkBasNj78=; b=WXdBWdL//DfAsIg/
	8fLd3Ycr6NKyVx+VZAsk8DhlXPKanxfr2QLPwxRY/7000Y25nQLS047aDaB2bYR8
	jZgYWFlOHBlq89rrr/OHEvVTsi/hCkqV+XFTEinSmBwwiGK4cB1kgx+fp+fe/1iN
	uWlMfC0OrQPOyKtukcH8g0e5ABaEmrBlbT7wYjYYtF9klwMfh8k4zA4ks+3Y8Xp3
	9mGoCx9sLjxxCrI7k0nPWoksCRpikrVpkCnT4vkXnjZx30IIsu/usnUk6yCAIqsx
	WtFiQPAUhvYxoLg29HMRWF5K7FScRLBCn7vaLa1hjqIGrldjGVtqTKjIi2QsMfrm
	jEyqbg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf0h68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 22:59:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-780f7238196so237143b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 15:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758754753; x=1759359553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByfRBJ3QzPSQA4bVlLf4TGWf7Fa4oINCyeRkBasNj78=;
        b=Soxgrt6yc9fN5px54uGagfy1cElwdrsUmOCR124cNPln+RJhzO3wQowLnEbjBfaxzW
         /TAFZ5d8YgNudLTcboU7QwydkmigXXmhlsnZdPXs3j4AhiuqRXiV5pG6gqahKYJYCZ8a
         SEk0h56+MdTtatbOwX7HWp1CmGoRFmO4ud8KUndfd5JVqzUV5VKqHE7KiJ3Aq5zz/AoR
         APTpuHPcKsPnvEtZxuEmuivwadR/B3smp8yCktUSK1OwUnCA0MvlCb68mHqgHWMS15dp
         aWCqnBR4KIFVl9InEETOR7e16dfXIQlQGxXQ1qrt+QD53x3rjvkqpZqQlHo1xIXoqd2t
         2Yyg==
X-Forwarded-Encrypted: i=1; AJvYcCWAlmcyOcmwfzODEd0wRFFEuopL+podwFTHw9D7nU9/7nbS8AmFAhbr45acFKUYx8+e54asiEc+O7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYK1OYvaJ0nBKxn3uYOXA3WnRuVd6PDSzxE0Y0W2KZqi7Ivfkh
	0d3IsWjhtkWi+Z3IuXTP6OqRSV3mom+uPuunbReUpvZYe66PeCYcNaEOKD5c9+O229rqC8RR4Iu
	oEr5+kNhgPNI8TTGkxIll5Ttg7RvFxxFKZUAMEGDwggUIvMQ7bhtzSDyAs7XnxgRF3FtWKMsc3A
	==
X-Gm-Gg: ASbGnctbhdfeqBvj5/avWLZqoUnKvQsPQtf5brLA1uphXeo87enNJmurzMUo14w9AF5
	ZapiMUN5JFAglJd2hQABYpj9vU+ESUdx38hWTW8Jt2zJ+7IYAlXQMHGYkKkCCIng7kZ2xIoO/T8
	N2mJCiHro7azK/dwrFjWLQzBA1/6lhCOue4mkPemsVXwqkCGNpo9DwcF5HSLiW7upcKgGBNycfw
	p4YW/QnNof8D5aEbyf7rkOhVtSNZOR8S5R2wS/bJBEEXV62J+m9YLHmJTNvN/obiVMmHlWduvrc
	yMd3KoJkBLX0e7dIvj9TNzfA4sbO1vDPVijxPX8vXQWV/5vjvUgkToZtl0BZWgW0nEOrf+wLLYj
	0zr1v+GVJjqEfcr0=
X-Received: by 2002:a05:6a00:10c5:b0:772:63ba:127 with SMTP id d2e1a72fcca58-780fcecaca4mr1698983b3a.24.1758754753510;
        Wed, 24 Sep 2025 15:59:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh7ky+fClkXFH/Kaxiv70QhLi13A/NgHtdlkjNuoUcOpx7OOMcYuTiwTYaHMjyx0W3NFt2SA==
X-Received: by 2002:a05:6a00:10c5:b0:772:63ba:127 with SMTP id d2e1a72fcca58-780fcecaca4mr1698946b3a.24.1758754752940;
        Wed, 24 Sep 2025 15:59:12 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c2b70esm111166b3a.101.2025.09.24.15.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 15:59:12 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 15:59:00 -0700
Subject: [PATCH 8/9] clk: qcom: clk-alpha-pll: Add support for controlling
 Pongo EKO_T PLL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-clk-v1-8-29b02b818782@oss.qualcomm.com>
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
In-Reply-To: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758754740; l=1266;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=wAwwSNhqWv9UMGVgT4Q7NntYft+jx5vU5Cz4yXJ7tzw=;
 b=Qztnxq9oO4fOqtbsXDxFI7CjJjEDUJtBNKxFjbPB259uGiulSpFuBBAg/v1S6ON9gLTFyJRuF
 pCPeL23gVWuAhf4li0B4p7hA4ssDdYgF45xj3BQ8TQEIawZh42UB1sj
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: XIzMjL-916iR992VUGy88yh_W2fjTY9j
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d477c3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=rVs2PR1jS8wsPJa1_kIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX2W2pmYM6y2/I
 fZHvO1mgM1CB0A5MxfmXdOtmFlvrlfJiWH54UgXMk4L0rLKW1YNTdNrn7G/VakajstC6La0Hwae
 JHKPzflLG9zlUIyLQ/uFg4CNA3QgF3WHNIleaUt7AW7XzhArlfhwvPT79cZuEyjB5NvNfCREwtE
 Rxb8uwGCeJLG6jMr9EzzQwYXLU5uog7S/YzWq0sX2s73w/oxGpHmUWSlaje4w6s7htzqFkaJCmo
 FzNpNiT+Mx8sLUDHFJEhKxabm+nmeSaUQS0ka5tue+kSv+NzpuRBOKPH/C1joMUC0kDYAm8AD/E
 y1D41uJmd8Zug5Nh0FQKPEGEwu9BMJ4770PxNm3fZVLyEZR0cUtNVKvy/sCwqaY00dFJFMXNp4L
 4N8VPbQC
X-Proofpoint-ORIG-GUID: XIzMjL-916iR992VUGy88yh_W2fjTY9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add clock ops for Pongo EKO_T PLL, add the pll ops for supporting
the PLL.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index ec5b4e481030..fc55a42fac2f 100644
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
2.25.1

