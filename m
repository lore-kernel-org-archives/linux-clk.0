Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65204FC8FD
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417284; cv=none; b=ZRdsCHK7RwBJMPEnHWu+D4bqtD/x+VeevkzYHHAPUsUL+74hjuY626T04iOeBUIleNutqrwGb45E/e8wk/7Tizmh+w3+mXSS5ytr/GQRYp8/Wj8qdzZiPs9Y2ZWB/yu7IVw3sTtvf37kOS15GpPdj2/DmHgZOagk3ayUpHp2jYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417284; c=relaxed/simple;
	bh=cbnUfewV7ir5r3XRpsLmaNh3j74B3H2NpozZx8dTWzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ov8HFYZ6E//0m9+ysmBrsFx3usAAZyAsPl4Rx87OiHw8WvUoMTp+6/6oMIrJqmUZcPHVv8Gk8kmMsl2ByJIQU8mUP/jv8ieoJcLlCJwlYBCV9Uj61z1xcFbUDuhOKv0aDuISJN4PBsdm+sNa7uDJAACaXYbkDkxfdwoil+YWED0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTPoBRdn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZYrlKba; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DTPoBRdn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZYrlKba"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OqdI3256585
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUuSgwtlu+GdZwZufG6qL5bok3tsTWrjkhIY7og9OGY=; b=DTPoBRdnBbAwUJy4
	bB5Z0cnqADgDgUBeH42qS96WdB+fo6oHXNRRv5wmI8J3DV7fFfRJDLoy1hB5CLJa
	i2tVuIeE5iYAkA/yDxGbKo+UQpXSWreU6LH96dYW1I6flV7bfrr6VmcPJ/JRjXPk
	oPzKC+X/0yB6NQQ2P2u+UNnX1I30K2zjD7LXfMktfCbJPwXwObHulGNF9gA2wVYn
	VeCG5xjWLHu7cFCaaV8K4fVcTLtQwNDKI1PYSwI0O3JPMcXYc1kEDzKesRqTxrsx
	ysKIzIecdKztDlo52HXAiopXFxN6pOf+Rq6lsDQlxV0hcbT9O3/BiY3W7zmteTis
	dHWbow==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f9bd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179a556c43so50415336d6.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417281; x=1793022081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUuSgwtlu+GdZwZufG6qL5bok3tsTWrjkhIY7og9OGY=;
        b=CZYrlKbaHhrjpptKtZg6H2/j6wN2pHD2uEIhioYRF/OsDWUY/Z8BBqkWvAuwZHW7Rq
         Pbu5QwxinaM7nuND1q4ltlCHKBi4trwA9CM89+r3XX8DZXK7yM7zivtlP4EAbkbmZBuN
         64FbdDvtXHd/epLJaB5i8EvEf2VXK97gQ2NBIE9cMiqzmSYb64xeynjuymkeQrEHLgVA
         z6SQjsD7rlUXlc7GUSGoOw9JQehxrdehSpA1XOXLOmzB4MWc467ey9xdmrET54I3Y+pB
         oAk3CZ2B48uUXWalzU2BXzSPqdpU8gthv5Kc55Qu77DGffQe5HltU7TB8ifZXx07VXIE
         72KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417281; x=1793022081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUuSgwtlu+GdZwZufG6qL5bok3tsTWrjkhIY7og9OGY=;
        b=scpW6nyxdzS09o1BPIgPzpGP6zpdUiUawOgQBzu1WB2m/7ml+G9bPPM0kcpOQsW7Vv
         Rpimhd3Isrsy0ZFgv6sM34/N+9MBEynhkS84+gIQJJNuOn5/EVId9RZLzlu6/XzBtc6C
         i0OgQgfqzsylnvrNMX18nU7YrF/mrbIePbmICO/Rg4s/axM9mJZv3hlA7Pew6h6fVJHx
         gSl3Ao3002BCEVrDFLqz5sBx7BahuyDhFZUk3IcbEFnRT08AdkvKkP73ZNlL9xKU20uA
         yvAVc/TlfdGCr+fXOaZtqnRUcgSSEf7QmCXdNSj4lO4od31L/RmgBT5Ncgy7nUYHaHGV
         0++g==
X-Forwarded-Encrypted: i=1; AKwUvByTJ3+tT2xESW0jq6NvP/yIKtZsHMggmq5bBsTNyp4n1TKZKb5pgGPT7g+cpg6wEdLwjr3oDdVKzSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTdZm7OuQmZN1zEN+rI9Z21LQu5UUTbTKpM2sGdXnEUnvCn6+E
	5C1tLplC47AXeYecxrBSlF+p4xI7RIIc5LIuNxZIHWPTH1cfUQ7hgjkVl4A1SbvzEbnD/WtJQIy
	iTM29nx/D/GdV+Gt/WSzLCAzWycGfHYS64vr1oRZGRy6C6auPsjEEmThO7jUE7sg=
X-Gm-Gg: AYBFou3AhQquCgh4zXI2flgoJ3gdUPqhD4MiCmKhmxt1KqgwQ+ov/nvL+dxkguxa42T
	VnSC+z4Ppobq051NhBRua7GWnAkbPXo/aQP4qOTKVrLIWVTflrs71yJXCeLuoQEru41vAbyxKhc
	MyETT7tuiKCd7O5KyQZpaxcsd2suPesDLJnVzjaVqantVwRUQ/MGjoY8yP5pnbF3+NNYNR40FTQ
	VvcJSGt9wbCgiRBOewRs4I0c74wbUt4EfIFN87BZ+X5ZkMPPkOTFk6e2/EK0V/NIm/NzD127/z8
	vHQ16NgcOGQ5VgcCBBNVBNDwgFwWDYtJ43C+IR9a68fXOCY6tyOillyRJGSUHr9ciUuqsG8HPwC
	oRT3FBbnmMSk7c3vojrAK4IlFOeLnFgWi7jwVO+kq7OCwjxJeG9+/rRfjUm4iwfyT3zt0g/POLH
	zwCyjABx2ktQUA
X-Received: by 2002:a05:620a:2945:b0:93e:8614:bbe7 with SMTP id af79cd13be357-93f29b7fb26mr1302729285a.12.1792417280579;
        Mon, 19 Oct 2026 06:41:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2945:b0:93e:8614:bbe7 with SMTP id af79cd13be357-93f29b7fb26mr1302722385a.12.1792417279971;
        Mon, 19 Oct 2026 06:41:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:41:04 +0300
Subject: [PATCH 05/10] clk: qcom: cpu-8996: move off the ACD leg while the
 PLL speeds up
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-fix-clocks-v1-5-370949e4d8a0@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3471;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cbnUfewV7ir5r3XRpsLmaNh3j74B3H2NpozZx8dTWzA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3xP02+c5FauX3a8r9QqJm4nFYdK3+3B6hHE
 2cTQ3z7of6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd8QAKCRCLPIo+Aiko
 1ShmB/sHm+W6RH8a9jmPu7KHtDm4VVofF/xLKDAPDC4uQ7kZUEBvBkKbjbZOt6NfiBDUvA+YLy/
 gG9KtYjFKzdjY0hv/MN48F25s4bL2R+ZHDTTCwj4Xcb8CYKOU+SGsBmpXd/5P9oQ2wxs4jhMBvy
 28aawAHKAD8rhLdvXXk8jTw3cN27jIOZg0noDLVcGe5feEmdki3FiBy8zS9me/eySIDYYWF9R7T
 xS2se7YaOvbBzp6sgt3sfdAJ34d6E0Ke+mlfEEUVxWt79mqT/5UuOmlBlqZZeNLrYItZt0gN5e3
 6DGmF7jl/JgpZ2EWBKM6xhpEl6QW/gDEkUOqMUJzS466cjC5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: EAlAiv3dbxVPE1aYpQEezOdqW8AbcpiI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX0XrdJHcdmDUD
 /Dsxf355Cs4GwldeJsF4h8kh1oZ5SnjwrWgGTKdiXsEv5WAq1kzwJC4HB7w8AJLF5M8FrLRIyr/
 wTL7Km2pXSsRQYqzeZJaKh8V+X0lc6jbSPUBuyvsqLpT760XAI4pYdoGcX/zXgnXo1q53tKkQfX
 /QYEFd1nfKepTe14cyX3AERCl0O8sFY4toTqQHMd7O8XcZmNvywBRducaVA9SyePfpm42ESJvFn
 rVWDyWzFVuZ9GF9jR3C4FlRKqbR3xsdQjrXNEow8/OZZSillTQ8nd7KEvmR2rqEy8Z9hLVN5WyA
 8bKfYVHLo07H1z2Nq76CGF+OolQew4/RpEuOl2cJqdiW7v4I0rk7iMoBGmEEr2DcxNU/yXmQSO8
 2tCweZ8eP8v3IvWlv2cUBad9YXT0WT1vdtPt16IKjgRepo48cHZ3B3K5UcL8JX4VHVJ7whSJPrX
 AIC9kClvUl7KIkKhNIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX4m8yEkdcf0+w
 UvPRQugJE+eRevrpRhTHWOy2poBR1kwvLVCgv0xKOhoV/GkFHW2UVQukGd+hkQV3YpKkIpeGzA1
 b0o8DjYeRA4BNib3uFQj7WyI6xFG5Ck=
X-Proofpoint-GUID: EAlAiv3dbxVPE1aYpQEezOdqW8AbcpiI
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad61e01 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=RDJnRmuAXM7lcan4JP0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190054

The MSM8996 CPU clusters sometimes run at half the rate they report
after going up between two frequencies above 600 MHz, and stay there
until the cluster drops below 600 MHz. The PLL, the muxes and the rest
of the cluster clock registers are all as expected: it is the ACD that
latches at half the rate when the PLL is reprogrammed to a higher rate
underneath it, and selecting the ACD leg again clears it. The driver
only moves off the ACD leg when going below 600 MHz.

Like the vendor kernel, run from PLL/2 while the PLL goes up and return
to the ACD leg afterwards. Point the SMUX at PLL/2 at probe time instead
of XO, so that the cluster does not drop to 19.2 MHz on the first such
switch.

Fixes: 03e342dc45c9 ("clk: qcom: Add CPU clock driver for msm8996")
Reported-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-cpu-8996.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 21d13c0841ed..f22dd80919fa 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -477,9 +477,9 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	regmap_write(regmap, PWRCL_REG_OFFSET + PSCTL_OFFSET, 0x00030005);
 	regmap_write(regmap, PERFCL_REG_OFFSET + PSCTL_OFFSET, 0x00030005);
 
-	/* Switch clusters to use the ACD leg */
-	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x32);
-	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x32);
+	/* Switch clusters to use the ACD leg, SMUX to PLL/2 for rate changes */
+	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x36);
+	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x36);
 
 	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
 		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
@@ -542,6 +542,12 @@ static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap)
 	spin_unlock_irqrestore(&qcom_clk_acd_lock, flags);
 }
 
+static bool cpu_clk_8996_leave_acd(struct clk_notifier_data *cnd)
+{
+	return cnd->old_rate >= DIV_2_THRESHOLD &&
+	       (cnd->new_rate < DIV_2_THRESHOLD || cnd->new_rate > cnd->old_rate);
+}
+
 static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
 			       void *data)
 {
@@ -558,17 +564,22 @@ static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
 		 * chaging the parent of PMUX. This can result in pmux getting
 		 * clocked twice the expected rate.
 		 *
+		 * The ACD may also latch at half the rate when the PLL goes up
+		 * underneath it, until the ACD leg is selected again.
+		 *
 		 * Manually switch to PLL/2 here.
 		 */
-		if (cnd->new_rate < DIV_2_THRESHOLD &&
-		    cnd->old_rate > DIV_2_THRESHOLD)
+		if (cpu_clk_8996_leave_acd(cnd))
 			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, SMUX_INDEX);
 
 		break;
+	case POST_RATE_CHANGE:
+		if (cnd->new_rate >= DIV_2_THRESHOLD && cpu_clk_8996_leave_acd(cnd))
+			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ACD_INDEX);
+		break;
 	case ABORT_RATE_CHANGE:
 		/* Revert manual change */
-		if (cnd->new_rate < DIV_2_THRESHOLD &&
-		    cnd->old_rate > DIV_2_THRESHOLD)
+		if (cpu_clk_8996_leave_acd(cnd))
 			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ACD_INDEX);
 		break;
 	default:

-- 
2.47.3

