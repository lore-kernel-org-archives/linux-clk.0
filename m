Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB184A138D
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086301; cv=none; b=FJAlfpp0Gx7HfdadVOcimIInD+8bjf+schSxGI/IVgkyOsV+dfjeQI8D02dz0JRVSFwcu92T06uj+2keXJWsaayrXGV3jQz8hjUSwjsZwS0i0lpRWhc6glm2PlGMbRiSoMDfMSzP2kYsFlMbEpjSRPCJTX8YSWs/3CRjKnK688s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086301; c=relaxed/simple;
	bh=ILf2pwIydtwuDQ5X6HEWQeN25aSDTWIBdHxlZSEskg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZ90eSmR47GyehUpgIs4ovoBx0kxKqaklxst2kqcL/jiNH9tvwYWyLYEQa69YrmQ/WGNkbtYYppxnq/Fiq0I/3h/r20Rabe/ByKuP04QKp0KpfVOH1Xc8JSfUWDEiTCBdZjqgfo/ngCcyOxm8iMm3P9JSvf3A36Ymwr8iaEW5vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUi8fJk+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZFiGKlJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUi8fJk+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZFiGKlJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646D6MAK1527783
	for <linux-clk@vger.kernel.org>; Wed, 6 May 2026 16:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W5l3VFDbTD30w1M5nzfg3zp7afKvX+ee3MVALDNuec=; b=EUi8fJk+/lET8coX
	OZOiJIeF4FMSLMcnACPvVWZvtjYgJaEv3x354SnLpH0utY0U/d/9oeN0eRwYs2d6
	fKfwRRIoAVHksbvoDH+JAh1yLRdyRywsFzRi+ck3TlnaUTPifqLWK4U2hpv4zStt
	YLYW7eDpZ8/qYxgiDy9fEN5ZDPsBCkP1ATsqJxjUo8UPCdzhMXTgHxRQ9R/T4j6x
	DUsv98Wuj2qiofzpzXH/pOSftw8XafU0U40Wtd/y+MYErhTGVgl1AANqQGElaT8p
	MbuCBEhggfKYZFyl+BO7h9zsZPKIoNODnTKQ6IlewT9jkpZNAlrk4zs1VdbtY8pi
	RHM9Eg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0128a8f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 16:51:36 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-130aab787bcso5206326c88.1
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 09:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086295; x=1778691095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/W5l3VFDbTD30w1M5nzfg3zp7afKvX+ee3MVALDNuec=;
        b=ZZFiGKlJ56xSF1q//1NE9IZBUvljdcg7IkFZOnssbTO9zk7a0vFUfB+9/ce4oSjzOO
         h7K+DcJ5/qhg0m4iLDf57ZPIOmyV0qMsmRKaO5JZngxGAUA1Y+hvDJbXsthSifZVmxtg
         F5t+AtbEWbVv7SXPzPpv2nYIcqCMCkfsOs4DXtwyc1lZRa8/OKKHQxbd588UgYZtVysD
         97fpZx3sxSCjj8bys9Ntu92nm2OWtgCdD4ibfvmcsDEZFXrfiyApX2QdBk0pGdsva19g
         zU7qSrHB0YoTZOjBK+QYqTmTlTbZTU7SxOiUNE1/PWd4SIix9GyQtH+Is0xoiUMqTVCC
         dLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086295; x=1778691095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/W5l3VFDbTD30w1M5nzfg3zp7afKvX+ee3MVALDNuec=;
        b=E1bj0hP00o+CDR769y5xaN3CRER/X+weBUcE9xPKqwsanLvqOjo0h+goNDRblVwkGg
         i7E4cKzfQhXw9/u8uVYtwj40z3jKY8jl/4ZuRiv0GCAeZ3ObUyJITYJwIIlYA0U8qlz8
         2Jh8MiIt2eMwdIWTS9BOE7PlbkxxJj6hhJeubakmmFJLTIXVkUEHLL+StyfzR9qfzuVH
         uETvOwa++7WyyUHYh4Apif67la2AbIWmpH1ZXLYUFi5sXQ3288uR96bVu2zcpVH56IKJ
         sG4uK+K/Lz8CahQp+jBGEo1SjqUD4iWZidwMfe//ZwJqawrFs7vxheeHgVSMinEw26N1
         VC/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8bqUer3SXt73PhDRzSjUFMyPkNYPT1+ayRIcKn1my4EWbkupcdzMCOYplnGgMzVIdiWOllWHAzdsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsRzwcAEQ8E3I1e+0c2XChUP3X3/Vcl05StlVpncsaSHK7Zp6P
	3oCBhk1H52tJYMC93liqGILupwZJBzExQF7/IOHrF1kv6JB1gWwVq29QEr2u7IV3k35fxhoNw0N
	L4WM7oCfSAKK0McppmRhmyEEb/gbzB/1S8QcmgoyvdxvA8vto5jmKkrwese/YZIg=
X-Gm-Gg: AeBDiesdS3Tt4xkomEj1kANUpBauosxqgMAq+dUPWN+tXNyBqNwIjHXGkSGjgFpFvvq
	/9jscVNHgTymhxT5iw359rfVviRAxaqeQiq8yeM/iLbJ1Si7Vq24+0qT8V1Zpqlme+sKrPOLlgE
	ZXIy9RvtlBcnq1MjTxkMD+ZykgK2BnnOnH38MPV7RPfENNCcpkFHLcu7xJRJA3Cy4if0av6bFme
	tXCq6zt52Qvqf18vc/OHhCNveUhJv94Q9pRcnZes6mBxmqx9/l5v/FvnxezRecIwZ6i9lIt3SsP
	f+yE9XoTtLcbHK9LG+sw9hShygJsQ1yG40nkM75ouwBAOGQthsZ8ylkANUc4gw/BEhLuKxZL/P0
	fDdzWLV+64n83KIqAF+Q/ieOVx/O46lfoU/HXgHKEBAFAep1BZfmFlDpFOpmqzLVc48YpjTxhZ0
	SLghbm0lm6EZM=
X-Received: by 2002:a05:7022:eacc:b0:130:68a1:a237 with SMTP id a92af1059eb24-131964a9dacmr2319210c88.35.1778086295445;
        Wed, 06 May 2026 09:51:35 -0700 (PDT)
X-Received: by 2002:a05:7022:eacc:b0:130:68a1:a237 with SMTP id a92af1059eb24-131964a9dacmr2319183c88.35.1778086294758;
        Wed, 06 May 2026 09:51:34 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:34 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 09:50:45 -0700
Subject: [PATCH v3 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EHA_T PLL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-clk-hawi-v3-6-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=3013;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=ILf2pwIydtwuDQ5X6HEWQeN25aSDTWIBdHxlZSEskg4=;
 b=IbebwAZDe3/WVHbIALgXbGGemTnHIYrCW42lUXMfgvtIHnPIyrB1NhPmfWeN15joLVJk7yMAT
 fOvmpjx53IYBePwlVaRS9lVBgyTD570OGQ3LsPeHG5ZwvZxNM61tK3o
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-GUID: L9QLLYKpmr9cOqo5VMQS5xcXmTxaLNjo
X-Proofpoint-ORIG-GUID: L9QLLYKpmr9cOqo5VMQS5xcXmTxaLNjo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfX78Rk6SxI5Ims
 RUYAeVCALrW8DNNPyfEE5FBd3G20CLcWkIaIwbYmG6TdC2IMZgTrSppzavTgpqzFU8PANI4yCnO
 /FBuEz0aJ6B0gw1HoBHJvqoC63Ue8J5ixMt70gYkkKJDgD7sVyerhl865Rrcj+UdSOj0uB0q8sO
 TtzighuKx9K4NtyrY4xSQAFC3TBKmqv0z/g/5Y5wfET/IhGCMAkphpuwEP4RWB1SjGAJRlwDN7W
 8e2WpZJ2C7NACZAqtXvQvCdFnh/nt85/6FQiuA3qB9l8eV4xTh873PIXBjIBdfzMSiO6qSv8dbF
 /jw/O3GLKvJAk+btwGo41RrUCh7RVI1Mc73bCcmT8ZkN93P4/Ku+evCHl1LnNJ7BlJA6cmWvUZ4
 ezGWcHQltl6bOPdOlSNpWaIMEhfGs9oAzrzf6iLNp7fpA2mNKpZZWFwmdVu/MYiWMdiEr5eTvv7
 Wg/rCtUtPJJUEDmlzZA==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fb7198 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Xwuga8JxpJPgM73N45wA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060164

Add clock operations and register offsets to enable control of the Taycan
EHA_T PLL, allowing for proper configuration and management of the PLL.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 42d334492145..3a2157bebc52 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -31,6 +31,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_PONGO_EKO_T = CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EKO_T = CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
@@ -198,16 +199,19 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 #define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
 #define clk_alpha_pll_taycan_eko_t_ops clk_alpha_pll_lucid_evo_ops
+#define clk_alpha_pll_taycan_eha_t_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_eko_t_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_eha_t_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_eha_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 #define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
@@ -246,6 +250,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 	clk_lucid_evo_pll_configure(pll, regmap, config)
 #define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eha_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);

-- 
2.34.1

