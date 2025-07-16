Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A142F2341
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679251; cv=none; b=IIZ6Ss3UPbdS2R6jduabiCjGE9w/LNJ7ro3/rBxwAyxDZ7KRbEFwJ3Y17ykaOCSnq93UPHe3TZKcg8PL5LbpTVtSHZVgyHv6q4VHzuGMSxEx37N7uEBAWCq3toqfI+AkVEZU48Rc0tAwerroE/pyuXCK3YTQHDnx4ws1xcCQTQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679251; c=relaxed/simple;
	bh=6JQf4O8NMe/CubAcA+bvLEOkTG1XpMAvA3q5EVQGE+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HwTf99ZelPtvxd/LoTso95WJ1dBH0jP/9K4Xp/2x7M0u1Aq9lldB+2OFwzguwrbLvH+kek9v4SQOvtB4a5jH1GzbEqKyeC7Y26JCaxNzjHtdR/B20bVKswvJq82i91RtxSFCmPQE0A46mYIGQiqSwMPQ+EXz/GwazHomnCqZJq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lStun/B9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lStun/B9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD1WdH031464
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i/UzvBI9fx7
	W4AtWjhd/P7aklE++DS1Rd0idD9jTzhc=; b=lStun/B9UnbPZcXc8vZVg0cFYh6
	bseqFKGgZJ2vt8SpuVcL3cbx2BZ7f9hDpYRd+++a7fWwwNxkVjuCN/i5ViazOzE/
	eqFszgXfrOK8yill0nmrbz3YFVPILOgNo7T4SPRVjYPoucqts4m0oxn9jK7HGXvk
	+FceQ+SNuzxRsrtC83riYIlAQCGBqA4XLl3fnRyItFaIhnOKN7LX6HoBhRW4E82M
	T6XFx8B9O0PNuqPBS117+Elxb/P3N81CEMGl50oHJ9LEG0dOYx7/2S4lDc0kpaHx
	uXO1yNSOwyYV//E/3TJQiK70U9Cat9HfAzPlpiriN1wHOThk7oiqpG3cYJw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7h8c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-747ddba7c90so31108b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 08:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679247; x=1753284047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/UzvBI9fx7W4AtWjhd/P7aklE++DS1Rd0idD9jTzhc=;
        b=Y1j55iZAnpwepbC/wE4z0/B5dMWNq3ejEfffGwditKAm8M6qCQUL7f6XY4gEtCdj6S
         XpYGVW6M7mTF+l6SVc9TdjiY6vRgl72hUu3kTrDWYGQG5KTQZbHvtQaxNBvj4M7t8IfP
         84AXBsJLddDiX0Yv0Nu7dpVlOrgGfYpLd0EA49Q2rOxAdpSrYUfkuSMppkIhVHG+f8F3
         Io5S+ZS3HFxY3AZqnnjGWcEtBYxZoIYHLWH4xninZ5ToQxI1qmPdoIA/AzlVCIRnXyb4
         w+9hQ/ZU3EYKUffeOkfLFY/SLnNwnsn0ywhGXp1MzC4EY1f/qt8seW2oqf27Rz+jw6fM
         Pxag==
X-Gm-Message-State: AOJu0YwwzlTW/IgD+t2krpZ53w8LCzLS/eoUcVVoGewSFuJ2MXzfW3Nv
	Ra6UrqDYWZry/L+4HSnH6MXnHhULmpMUzlKp6hkmwM7Z1bjJHMmFATPvfEzU+z9T8CGmTepbc/f
	PIQg/VNwwXCdQZxjaV6wmfN85mpvEqRBZV9EimrUFsY1kKqvENxfHv3zpSosXgG8=
X-Gm-Gg: ASbGncsrfZMtnldsBCOQ3rH70UlXo9KwW9sq2rPcIcPnFFs7IBFXSIYZ4g56vsk7E1s
	3mLT7JJ8vtHO5zOMYzFMopleo8wvOrEEktuwOaXMHOkNYMOQ56oNgxmxVrdR60lX9zLkk3wMsg1
	bk2hCRXDlMkKrgaEUxOd3a1ATYeI4CbkJbkCusbx3+GyhsDInXlgIYW7n36qQGFhH12JG88OEVp
	xZGtlAAPWYtfWS84c8uqnYhMoZDdb6gurAlFwnM+KC5v6JExKOwtgJcXVJN1pyTmpkU5ZgyE6Sl
	bOdKt9JAss0Bwmmkh3vyZ+zVeprDiHHwxRb3vrmy1bj8rME6RAXb9G6WGFwUd27Vau2QMnlW9ZO
	gu+tfYLgNUGQ8Yj47PTY3IHEiCIqA3/Hp4PMDWzAQSPRhUuiTvrBuFnD2RRGX
X-Received: by 2002:a05:6a21:648a:b0:1f5:6c7b:8920 with SMTP id adf61e73a8af0-23810666ffbmr4906025637.9.1752679246748;
        Wed, 16 Jul 2025 08:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKLc+0bFiDHzoomsqf9Ui03eq/1TMOrYjYRIlLvU0csjZfUBwRKUHtvMxEGuec0rVMcA4QtA==
X-Received: by 2002:a05:6a21:648a:b0:1f5:6c7b:8920 with SMTP id adf61e73a8af0-23810666ffbmr4905980637.9.1752679246306;
        Wed, 16 Jul 2025 08:20:46 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd8f8sm13912054a12.38.2025.07.16.08.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:20:46 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] clk: qcom: clk-alpha-pll: Add support for Taycan EKO_T PLL
Date: Wed, 16 Jul 2025 20:50:15 +0530
Message-Id: <20250716152017.4070029-6-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfX+lTnDr+gKVd0
 5Mc8yqPgg+cJ3sRunwCk0x5ydkjRZ1wUUdPUBqj+N+S95+F0eX27mDiL6gRZY7Ep4RtCtg45EDi
 2OymwllYlyVeNuuKFSmpdd27lUcLBJdMeRFaMxDLEeXIMAsgXM8ImulOA0h8IUJYvTZrvXqt1IT
 y44Km3XlX+PjIm3m90l5vtKbAz02zbF0tAzOR3aTn0XV4SzPef74FJP9dP9Qyxgu6Osn3z1huBC
 w3z9Rp/y/9LoZtYsYjpRSM19myjHiiNr0GhVQa3PCwoURMS8rQFKvEvTyB07LYkMIdX6qph73C4
 M8wPOgUoC3SI5Tg2a3pXoMv97jXxX7ogoq3hdIQnEXiz90ZoxgrNagZHQk0m9Dw11wtlQjH9FC+
 gqJVdYGva99ZndzabjvVnoNik7Cu0B8jqVaaUEdgpy2Mnc4WlYZB09QxHJdsIIZy8UqVhWdY
X-Proofpoint-GUID: cJmiOF76e_8faYBi9nAuLLZHLfM97fNi
X-Proofpoint-ORIG-GUID: cJmiOF76e_8faYBi9nAuLLZHLfM97fNi
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=6877c350 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=9yNAuCQw4ehsCnPPvT8A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160138

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add clock operations and register offsets to enable control of the Taycan
EKO_T PLL, allowing for proper configuration and management of the PLL.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 7f35aaa7a35d..2294ae99cff3 100644
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
@@ -232,6 +236,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 				 const struct alpha_pll_config *config);
 #define clk_taycan_elu_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);
-- 
2.34.1

