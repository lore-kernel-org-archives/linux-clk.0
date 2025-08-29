Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE8C30AAD3
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756462532; cv=none; b=rlzc1JAOfaLAzqyUP8Rs8HZzBu9grUHMCnkz5NoK01rIUf2xw8Uu5V9J9KghWFBj8n9JCQLRDog8O3naiGnPXY08yB5sh2V+g3H79DH5tzugAnw4Ypz2HxPEFS4kRaUNOOO/ov9HbE3miccp5AD/O3ARsGdZIvdVzKFyQkaBI3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756462532; c=relaxed/simple;
	bh=O6Mny0d3NcWye/pa17Z21QvQoVkQuVKY8Az2O2Pwlvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gTRU7k4Mb0NgivdX63fkI59oCZDdO923kn0oHQjBv551aeSxSlWzzfroTIZClPYZxb1IMARTBJGdUHv+Uk4epUlmQZkRTWhOcnPLEQFFug5qji/0S/ls6Lr1MAdmgTVyNAGyus40aMlVsdBxFKiKQkqMhQxt854kP0dCye1K9TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a5DMs3Wp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5DMs3Wp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85RtB032496
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 10:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0FPq/lTS4AeYWLkTBpagiaokL1Hd/X/PEFyY1CbPsh0=; b=a5DMs3WpubgufhGF
	ZBQ16Oj28MjGnNdoI3GOwBDvQg5tytBf8Vh/N7m6a7rLFh9t+WfjLaFzPHXNdnGc
	J3tZnqkwiVjPdzNFRT4U9NEGIwVp16B6L6y+OKxI1nnSE2cDFXwnWTdiLEWp0TOA
	/W7UDwure3Fhg2nBCKGDoN1NcqK0x18puzOCSkTFucS6mF74BcBBXTdJTFJV1vvs
	gpXbN6WfwmAnWhAqbFvZsNH+fJ9KCf3recVEPddVBo44Npx3f5Qlkb4VeOtyewwd
	ba01Om9khDCgrckOs2euMsnlYhlCVRw1bMCu2pzyoTRL/zlB8fA6tiTujMw/aVLk
	Qs5s+g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5ubfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 10:15:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24925f21966so2860125ad.1
        for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 03:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462529; x=1757067329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FPq/lTS4AeYWLkTBpagiaokL1Hd/X/PEFyY1CbPsh0=;
        b=ZySfzsfbfhM1S2cDMFaajrKYO6XBr9E2p+x5c15CdYx0aOBK6xKCfeT++BppBLxTwZ
         f9Pd4NCL0701uHI/Deeh5epFR0fx8FG1cOFg6aLQmDV6vQlfyplKu6KCc2i0VfrTpDCm
         HMW2QYvqA5xppoKjeOkjVSeW6TamIJ2tvQQ8VnGTJW5ISdfotiKGRajxVj+DKzRYWFn8
         hic5ALsALRkPaFndmN9zvPZ4V84LOrEJdJS19aUagK5gmc1F6RFlWCpMrRN4SxD8euzx
         zu85hLe0KhJnPh7dx08ZAQHT9PeBYPcI+b75+73dbXeIJu5C/IFUu3ZiSe0M3EakSKHi
         eXRg==
X-Forwarded-Encrypted: i=1; AJvYcCVuqDa0iA8d3y0fGiXkXHEcKt3nV9rs68J5fjkbTGI27jUMsA5kUnS6EUZHS2n9veSxcuZ+HuVtUIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf5HOkusCnr+ymQdFvfoFFgf5iNDZ0b1FnJj7/LEfB6di1496K
	7HXenqDETOR/VZL7MFY9Vz7WyGw7K8tAjOdYsMv8L2h2PzpX6dW6R4zwguJhfcvY1YgjD1ZnTKR
	HN6spPf8n0d4UHddvxIR9k23ZjH1hg3SAQVij4IoMmyQVQfGjZFoCIPJ4BNqOxJo=
X-Gm-Gg: ASbGncvI3qjzHWtanZYyy/lSKhiK1lOgmDxHiHN3MTAeRFTRKuGZ8KDZpFIe81HlIrV
	BJeWDsSg+y2n4i0o6pQQDKG1PyCTLH3BTSUpfdrRUeKIbpkVzRn2WoS9oUFNEkZEfvae1sq4E7D
	B7pWY61CjkoHUDN92aH6PRgJyDhqBRuejy9HWkIg2OCj5XNA4eubba6/xH2/Ivo0LZRoI9u3EAR
	TKXvMh93SKM5hADd8zOumdZqClkQXUi0x9d1hK9pZ6ec0YOcZGCtMe2GXTp7tEQ/1PAtnNeUqfX
	Caq+HGfU2/F4569OldmRIvnVPyxJe/mvwFYJIFnyS/Uwg+Fx9tiEusxckxrw4Vk6
X-Received: by 2002:a17:903:124c:b0:234:d292:be7a with SMTP id d9443c01a7336-2462ee0b991mr357448765ad.1.1756462528661;
        Fri, 29 Aug 2025 03:15:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEld9WAS7PefNHcO4cwh1kQXSdou68Xzfiyst5T+t0EqwcyyL4eKB2damNsES8FC82eDU/lYQ==
X-Received: by 2002:a17:903:124c:b0:234:d292:be7a with SMTP id d9443c01a7336-2462ee0b991mr357448305ad.1.1756462528115;
        Fri, 29 Aug 2025 03:15:28 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249065d1b19sm20102775ad.131.2025.08.29.03.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 03:15:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 15:45:17 +0530
Subject: [PATCH v2 1/3] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-sm8750-videocc-v2-v2-1-4517a5300e41@oss.qualcomm.com>
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
In-Reply-To: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/BpXkA6X/xZo
 dgnMD0ECk6ovMtd2PFHqSfRaEMYWf2B9bxOBP95w57F3ANMbDizT7J2blaObSzdISIESk4ldrh5
 BalwqSRjRQI2uJ40qZIdBWlkIcy9aaseLHcMoXj0Zex6wixJefHPaYb6/l/seEyNpfro4J2bVvX
 fYYkrvYxXNgviXPziK6J3dDsXvux6h98+klBzueKNRAkPzPsZIorh3HoFJimXiAAqwLUSiuLd7V
 8ggp8TXSWIsFZHDGhaJqC0amJKQFvV0n2dXnHQrcUk2ryjnDJbdNYdt9Fy9tIo62/NWrB2FLOzz
 g7X3R5QFNfGjJD8U5y+eSqaG0XD5X03+yBp+No7C2JAeSbXUNEb5R2vJLpLNrgMcVJT8MFXKnpn
 gCqYscfw
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68b17dc2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=TPL9fEiPDwMg0gBHboQA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 2eNq580niSS_gWz4fjngnbA7WnRsUn86
X-Proofpoint-ORIG-GUID: 2eNq580niSS_gWz4fjngnbA7WnRsUn86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Some clock branches require inverted logic for memory gating, where
disabling the memory involves setting a bit and enabling it involves
clearing the same bit. This behavior differs from the standard approach
memory branch clocks ops where enabling typically sets the bit.

Introducing the mem_enable_invert to allow conditional handling of
these sequences of the inverted control logic for memory operations
required on those memory clock branches.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-branch.c | 14 +++++++++++---
 drivers/clk/qcom/clk-branch.h |  4 ++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index 0f10090d4ae681babbdbbb1b6c68ffe77af7a784..90da1c94b4736f65c87aec92303d511c4aa9a173 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -142,8 +142,12 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
 	u32 val;
 	int ret;
 
-	regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
-			   mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
+	if (mem_br->mem_enable_invert)
+		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
+				  mem_br->mem_enable_mask, 0);
+	else
+		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
+				  mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
 
 	ret = regmap_read_poll_timeout(branch.clkr.regmap, mem_br->mem_ack_reg,
 				       val, val & mem_br->mem_enable_ack_mask, 0, 200);
@@ -159,7 +163,11 @@ static void clk_branch2_mem_disable(struct clk_hw *hw)
 {
 	struct clk_mem_branch *mem_br = to_clk_mem_branch(hw);
 
-	regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
+	if (mem_br->mem_enable_invert)
+		regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
+			   mem_br->mem_enable_mask, mem_br->mem_enable_mask);
+	else
+		regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
 			   mem_br->mem_enable_ack_mask, 0);
 
 	return clk_branch2_disable(hw);
diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 292756435f53648640717734af198442a315272e..6bc2ba2b5350554005b7f0c84f933580b7582fc7 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -44,6 +44,8 @@ struct clk_branch {
  * @mem_enable_reg: branch clock memory gating register
  * @mem_ack_reg: branch clock memory ack register
  * @mem_enable_ack_mask: branch clock memory enable and ack field in @mem_ack_reg
+ * @mem_enable_mask: branch clock memory enable mask
+ * @mem_enable_invert: branch clock memory enable and disable has invert logic
  * @branch: branch clock gating handle
  *
  * Clock which can gate its memories.
@@ -52,6 +54,8 @@ struct clk_mem_branch {
 	u32	mem_enable_reg;
 	u32	mem_ack_reg;
 	u32	mem_enable_ack_mask;
+	u32	mem_enable_mask;
+	bool	mem_enable_invert;
 	struct clk_branch branch;
 };
 

-- 
2.34.1

