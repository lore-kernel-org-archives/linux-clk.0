Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414E72EE29D
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 07:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755071782; cv=none; b=Kj7Eao+kbQs5owD7BTWoGIKtvokdwDh7U/caLY0UiGDMyCZL9bZwbQNUYagB2hborFuipH2trG6OdZBRAyfUH4Ap/EH1C0HxfYkLVfCL1Y1tQxxHwRUVMM5/CXiVTnRDzB0cgKj/DtQgfPPONcNW1yvoTQ8D7loyOfF5fYDbdzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755071782; c=relaxed/simple;
	bh=h6RXWbyefgEVEM0BmVWVfZH0vo7yywZji3SwzXVLnjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvvA0LcFicrNkBMifit0yZTukF56NBU539ZJj7shlTzvmm+x6RmeR1PluIGuL8OQ11G50hy+RjDz18BLx2Myd9oCad3EmO3AO3QF2oy0y3xzFQVHTihaEQvOzw8qphdODDlX2aHz8pNJri0ImUT/Jhp7VZ8diw5mMO2LHCT4Oj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guteimpn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guteimpn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mIBG015672
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 07:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lDsdc1O7kmdJsF/Ws/KKiaWnUoZYb60kkTYRbBrGPo=; b=guteimpnE/+mJBL4
	JCjnU3O93BWI6jGTgA206EUC7kouXacxGQI5K/b3B3av0nH8/XXl3Omndl3LYyzf
	5Yq3Ob7wq8AGJEtXd7u6nIAn78FCuSvpE1PWiDXjczUuU+IP+fmiWGIU4dITeHqb
	CjY6DkRb6X/HDrURAYCZ0+AOlpAbni4azSXjjoI/JUqvh+WOf5Xsso0+Id//7EYZ
	gHIaISg/nRtFIDN1USFxu1+jL2jNU5VnJUTCOxjA61MH2m5QcwEssOKM5XFf4KeT
	cW8QaA4m3+DxszwE2zJqffX7sXP3dzJBXe68A1mwyOlhDoIw3M3Q1Wg/GtUtJ/RK
	ztoaCA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbe5h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 07:56:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-75ab147e0f7so6147798b3a.2
        for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 00:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755071778; x=1755676578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lDsdc1O7kmdJsF/Ws/KKiaWnUoZYb60kkTYRbBrGPo=;
        b=Vgr9jp1aBsysaIGCJ9NvKlsTsO5fSKJ8gASIPP+iEZDBWe8IbId855m4xZ+8vsNRqZ
         zwYKOixBz6piBUdneI+GUOqL8yQI3xr3PDzyarpf7HAG8bqd5JowIl0n5q7fHYQrzixr
         PfBrCxMZU0PPU6Mm/pebnbwKW1YEGZsipd+jR/Pl5Q3Mrc84V9IYOg7/jMFtK6wUKMHq
         lQzyZt1NReaKhpMx+aKUUBrLHudK/Et0A0FBrbtsqyQLdHbN/iAxoJ+7/iFN/hQEkzJf
         mszoCR7O6oQiLMYMgrGH2oo7lm1tWjrBUgovkkNf8mnY+3dp6Kxvc0fSA6KkTRJplVTZ
         bc6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFGdgo6W7/AlR+GEnBAygKT33fsGbQT0aKPu03pZJmgscZNcuJeDtSIClihkpZuXWVhNIlLymZOJU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5CkEdIOW2yed/kj02smO6moEFC9MVVdJGq/i29yvx4CXz2tLM
	ThTTHobgKtW/0t8tNoFP1dVSb86nRWQVTGMTJAwz1fNjEji0/BXFtKhkzKJFJ04lmQnB0t/kSrM
	n5tS9T65oYeMtaCRLXAQrVaX7BNhU7fQszOzs0ylw1cXcKtnto0+WTBALbK3jPtk=
X-Gm-Gg: ASbGnct/oOvi7ZYcP75+QzHj5Iw4JiiKrDLUq+MnaMXriHvJaR/m1ZXtUjUfVTWP9iV
	3D8P1e0BSmG+SXf4lQG6mUxN+xjxHDsZOmqKJpMHojhY1eLAwa+GU1Hti4FUU/tM7cHuaembPkT
	6/BqmSwBrtvqs/MrWMXLuVP9gTkejNs3oXmYYmvzw1aeZMjW4St8ao+oAklMwmvN33gmCPlwq85
	yvjObrG2rHiFAe43FL51BCipBH3Uka6FIWvmQklA893HPDEAaQp89/qnNlK189QNLMM4Ok96Vxj
	+bmYMQx9oCYSRjctBHDT3QIXcTKyYHjKhrhEU+3SGrbdkMizAj09PqolH9ArJ2kU
X-Received: by 2002:aa7:88ce:0:b0:74d:3a57:81d9 with SMTP id d2e1a72fcca58-76e20ccfc49mr3549429b3a.8.1755071777728;
        Wed, 13 Aug 2025 00:56:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFKkn8Vd5JoUCGsjs14v7+Q6viwxTdxYiK2Y6KCGicQDC35oxh/Uki/eSQtb5LsQIxkyRZdg==
X-Received: by 2002:aa7:88ce:0:b0:74d:3a57:81d9 with SMTP id d2e1a72fcca58-76e20ccfc49mr3549399b3a.8.1755071777282;
        Wed, 13 Aug 2025 00:56:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd22csm31395754b3a.65.2025.08.13.00.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 00:56:17 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 13:25:21 +0530
Subject: [PATCH v4 5/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EKO_T PLL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-glymur-clock-controller-v4-v4-5-a408b390b22c@oss.qualcomm.com>
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
In-Reply-To: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689c4522 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9yNAuCQw4ehsCnPPvT8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX09UHk7cOJB/r
 7JqDtREO3WQzebNLfiM2rbouQKeeDzFR3J3IFDswEypzkWM7oivBAXEt2Y3mjKhGMsyDdxwXKlY
 up5KUuGHMwZ37svXzbh/MHShBtYXlzftZ7cbAshis561y9+/LuYlpctalKUXrT0hiItA7nQjnhq
 KUcu/qX89c4HKadiz9M4EHjDuoQJCbPzuMfDcvrfQGm6NIihB8PPiTB8d0aJPYqVvS9n55b/L/O
 Iy/mD+lZfoj3tk+9yIxnHRmBX6CXWldAGqvHCDVxx3pJJE2b1+MIN0OQltK67OKFnuNTo7uZKFz
 iloMOTewZBB04H2Z64MQ7YhyaAblEUwyunP64aaZlVcooFh+fDkQpc1tukQ6hROWNRUuKzHg3Nl
 4Vbh+Boj
X-Proofpoint-ORIG-GUID: _Y997cfpGoLwPTNiEDQEeAeffItEBeGG
X-Proofpoint-GUID: _Y997cfpGoLwPTNiEDQEeAeffItEBeGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

Add clock operations and register offsets to enable control of the Taycan
EKO_T PLL, allowing for proper configuration and management of the PLL.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index ff41aeab0ab9844cd4e43c9b8e1ba0b50205e48e..0903a05b18ccc68c9f8de5c7405bb197bf8d3d1d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -29,6 +29,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
@@ -192,14 +193,17 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 #define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
+#define clk_alpha_pll_taycan_eko_t_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_eko_t_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
@@ -233,6 +237,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 				 const struct alpha_pll_config *config);
 #define clk_taycan_elu_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);

-- 
2.34.1

