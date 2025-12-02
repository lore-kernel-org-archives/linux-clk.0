Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA4530F7F3
	for <linux-clk@vger.kernel.org>; Tue,  2 Dec 2025 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764671212; cv=none; b=UZQvDSsaR1AY/vjT1YGS2M6FNtIwqLXYcPnB3dZb0T0whbhPsIoy6mGFgXWKBQ/eTzUpAIOlIh5rrxde6016Rgynopo5NqVFW0Ttn38S5Jj0AB0GDL4ecD6EywvzV5ZbcLjrbvK1CVMXwSvHOVgxlrZSCixSOxZVeYCi8rYls8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764671212; c=relaxed/simple;
	bh=Ge74kR3qgNEQ/LEpUzlht8wDYy5q2b6pVpNdwGSdSlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PcbkdetsHDbd5E2QkfcCXmMOARgrRalxT5cvpI3mCx7BEiEqa4j6FpdU7edgZV1Xl/rWbWj4oRILgPh9OS8lpGhch+fRo0hkpjjVm0eBAGTXYV/TleNnlBZsVMwhDGCWPEhRahgK2pXadG5dGyktvUkqlFvI3Q1M6VpcT63Z6WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcUfdKCe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BLs82OOg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcUfdKCe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLs82OOg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2A6F6C1090646
	for <linux-clk@vger.kernel.org>; Tue, 2 Dec 2025 10:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyPluVgnUgAYmNSztPK9FzXm2nnVdVYGDg0U1TBzdaA=; b=hcUfdKCeK3ttKukg
	EI6yHuGnaPwb3B9IGNWU3xzBT/Nui1J8//lLC01yB2Xt1B96IWQ774hNp7h/KGmY
	b0nC8Bjxk4rrvwCtYenxJyZK1Mc+JrJftWNRcdzqeNKQ2rKtsZoyI3D/WMaywYhZ
	HcmyDWrxmuZ89G3lvx1Nenm/noBvc2CRKmXFwW+isyi2kQuP36z6pozOz3NNxhPG
	kRu49IuXGgSPWlutavikhZoOudtXnBbWSTR+OvFP9FkjOsrV5Rp316nFTK13QkfJ
	7UfW2pvTczdviQqKd3wekUDAxRqHK5WXQeoT6rqDXYQFiNP1gnibP7x0Xw82Hh6N
	o74nsQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asfu12ws9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Dec 2025 10:26:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c1df71b076so8949500b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Dec 2025 02:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764671209; x=1765276009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyPluVgnUgAYmNSztPK9FzXm2nnVdVYGDg0U1TBzdaA=;
        b=BLs82OOg7wPfC8++O6IjVQ9xSyBMhYABsYguEF0ey9QoIJi42p02XIaO1Q7Re90ZQc
         1JiZ5vOckSlms9/32JvbSlGU8X92+t4XV422F4FMTcBBpzKojNPQpQXJA0wYCpqsq+1r
         lgraL8ft9l3VIAKlFKtzeLWCZgWuUdoQXy/VSNsphdScmA58iXoo7GASVRvf7Wnv5gza
         zSPzT3XGmW0mW6E+gO2IsHUAbzhRMCKC4eyU9FytZh3vP81qVuu1OK3VqpE4vnCi8qPv
         HlWLm4hnIIHzUGZH4N8AHlgpz/ujw6TMkfhPjb0jg8uUPA9NlHYSA9fRLCL4mYIzDQ6I
         i8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764671209; x=1765276009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HyPluVgnUgAYmNSztPK9FzXm2nnVdVYGDg0U1TBzdaA=;
        b=YeseUYgqAseClsv7F9BDadMol6sW68+CNY79/8Zqb1YJNb4LS86dJonJrWQt55Khhs
         k/PIdJQwLUK9h3epLghjgxupKOffLHhgU0KUcHzbzgu3b3wNSA5o5f0zy+tLzSCsfD7j
         5eh5OpP9bwWs0miRpv+ggqwu6QT3FVBt8jq6Lyzj/a+eU0Pbt7SjnbRPxIhFT+G4L8U7
         gmyu4rn8TqBTfM8ylElggQ2iT6wImUL9XQwg6VMB8KdAxUPVwV8yoKp9IQNTbXJ5XZD9
         z0eYKzs/an+jMHDVL/yc2NgRyB5y2s/5lzCWAbuDipQQsyOREC/A8A8vX5OvBZEjJL2A
         6vLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLjomqDJFx/2FaANCMvbPJIXSmAmyf+yDkbxklQuB6puR/dcxsHfU6W6Yl/z4eqOLh94CWiUJxfu4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx10aRYxyRt7Bt00Qy5iroKuJxbeAvDFEtD0uw0MW7U/6QkEIJA
	twt8eaAA6iTw7TuIG9IUo04S67dvNqOvowho1sLBuFWUoZ6pr2ZROkdACmGfY+KJrhNIckl/5uG
	AsAAZHa9ZNpFtgeTfVLHY2qX7DhPM40KuCODHv1yIyrzJtqCR3o0w8oKuii7g/dg=
X-Gm-Gg: ASbGncv8xp6nYUh6eKXXyFCqFFzHceKjwragItL7qgGv0ndjpFGPrV2gv+zh3fqwxct
	bHMpAtL5Fy9UqE5RxZqd82/m1jWVjDDu+pjMrtS195dMOrKyD7OrmqPmaRKrYSIVFn+OHjRIBK5
	3yGLGWGVb7Qn9TL81lMhJmbj5iMy+1zr91YzIbYYqrqWWXINJCo3xOaQs8Z98ndO1sWYa9FbYPf
	b19oLFNrID0bBToS98SRQ42rOUylvcqOTRyrMDdJ8WDS2WUsxY7A8r97s0LLLaGuXM+seGD4C1K
	MGCY+l85uyPX9YAS9v4HomdDkIUH0WjrZAlBJhUPSGZ4fYqUhZlXId0WsVnpJWl56Ap7UUqX8NA
	hmG5wI9Pa6otnNfoMwjr65wUdZ7vZrHc7/A==
X-Received: by 2002:a05:6a00:189d:b0:7ab:e007:dec6 with SMTP id d2e1a72fcca58-7c58eaf2874mr46343188b3a.31.1764671208748;
        Tue, 02 Dec 2025 02:26:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpNfD8nmqLv0TcMm5gxpZyZOh2xWWnJZnOrY2LiRkeixNuQOxOdAG4U5ATN7FgjOGKybBrhA==
X-Received: by 2002:a05:6a00:189d:b0:7ab:e007:dec6 with SMTP id d2e1a72fcca58-7c58eaf2874mr46343152b3a.31.1764671208286;
        Tue, 02 Dec 2025 02:26:48 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d151ad4d6esm16379511b3a.26.2025.12.02.02.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 02:26:47 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 15:56:25 +0530
Subject: [PATCH 1/3] clk: qcom: clk-alpha-pll: Add support for Rivian ELU
 PLL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-sm8750_camcc-v1-1-b3f7ef6723f1@oss.qualcomm.com>
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
In-Reply-To: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4MyBTYWx0ZWRfXyV78hZd+Ft3G
 vmJruk7KlDTsfzdOHZVL0khSAoN/svZfw9m+J24Oy76bpeMeFUQ3EilcXJIuxOBr7uM+avx2uIW
 DgjVqDHLsE/QdM/GkgLit3+ifzfQdIDAgrrGWV5c+YkhqT9wvR+XH7/TWqS6jYsxRToUCC/NaeU
 Ly4+xHb699Njmdh9VtnpLcX3dJh8ITaLvkbmuoHoyNN1nSa/La5rg9U/+WZM2yQr3rAAOzTLK6g
 1jJ2cq2iYmEeZa0q+2LNd70gITdx7w6AMYMZFRLGqw4Xbse+/8kprlM6UJeM1OzxBFQjz7s6J3W
 iOepJBXYQaxYJgA/0ZTrWs4EIvZqLHFOKnhHKQWsoPxmhLsJj+YlPZJsWxBtXacHEjDQSxQnfwy
 HQwOS8ATuEy0p7dL3KeANrgaKEIcFA==
X-Authority-Analysis: v=2.4 cv=BJW+bVQG c=1 sm=1 tr=0 ts=692ebee9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=03jAwwKPUxsBcueUP7gA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 4xX6FsbtnFElnPzjcs3zSGk-KWandyZ-
X-Proofpoint-ORIG-GUID: 4xX6FsbtnFElnPzjcs3zSGk-KWandyZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020083

Add clock ops for Rivian ELU PLL, add the register offsets for supporting
the PLL.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 14 ++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6aeba40358c11e44c5f39d15f149d62149393cd3..8586649d76f8aef119ed51fbf1ca90bc5e3ce510 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -243,6 +243,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL] = 0x28,
 		[PLL_OFF_TEST_CTL_U] = 0x2c,
 	},
+	[CLK_ALPHA_PLL_TYPE_RIVIAN_ELU] = {
+		[PLL_OFF_OPMODE] = 0x04,
+		[PLL_OFF_STATUS] = 0x0c,
+		[PLL_OFF_L_VAL] = 0x10,
+		[PLL_OFF_USER_CTL] = 0x14,
+		[PLL_OFF_USER_CTL_U] = 0x18,
+		[PLL_OFF_CONFIG_CTL] = 0x1c,
+		[PLL_OFF_CONFIG_CTL_U] = 0x20,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x24,
+		[PLL_OFF_CONFIG_CTL_U2] = 0x28,
+		[PLL_OFF_TEST_CTL] = 0x2c,
+		[PLL_OFF_TEST_CTL_U] = 0x30,
+	},
 	[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
@@ -3002,6 +3015,7 @@ void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regm
 		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
 		break;
 	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
+	case CLK_ALPHA_PLL_TYPE_RIVIAN_ELU:
 		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
 		break;
 	case CLK_ALPHA_PLL_TYPE_TRION:
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 0903a05b18ccc68c9f8de5c7405bb197bf8d3d1d..b4492197419a7f326a4f6e6607ccee58ced509db 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -31,6 +31,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
+	CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
 	CLK_ALPHA_PLL_TYPE_STROMER,
@@ -208,6 +209,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
+#define clk_alpha_pll_rivian_elu_ops clk_alpha_pll_rivian_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_regera_ops;
 extern const struct clk_ops clk_alpha_pll_slew_ops;

-- 
2.34.1

