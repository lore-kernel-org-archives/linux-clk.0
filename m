Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550517;
	b=SiPei+2LpjbXtJeFrHqwkfcvmQOoQQsN7iXkzYLtph8P08TYbI4EPUBJoidjTo/6c6Xm
	 i0c+oCm1aZiGhVc/C/dTe5oknq4uckbqifEgv8OLhThZ8hELzP8ZRsQ9ECirA9ywk83sl
	 m0nPwBZS9DbpQfM1C65UKr+yk2GhWs5JxtnZKjWOtt9ASKLKYsFKiFK7uYRGwbIeowasi
	 JYnVBOOXqfFR05r2UZXVoLYVjV8UVwAIRbsAqnvZFkrOn5RLXcWJwjgLMpjk1u8EtvS+T
	 LUyMnD/z8+ptlTWlNbdITiGUr2nsl01WvIyPkG+1FnPQgIBAGIzpZfFNI8Bb+v0JCYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550517;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=;
	b=Xm4+0fFtg2LVPgC51WK8WX2ZmOelNwzH6pM1/A/0qtjHWZgmX/tuPSgoHkh4m2mktz3d
	 9UoS8iZ8ybxltJ2NPuX35/bLL+P72h1sLiuKvbFi9HU6kz9l5O3OmV2VnauUvT3R0zwlj
	 iSyBSMF7GHn0WybvcvK/3rVlU1+ekSoi+NR+RGjVebTMrwdy3p7gjuIlYHETN5cYFXSyn
	 4+21zDALhsDniJCnJlzV2aGRpZib6AjXVZb7UHe6dK+W1CNyVzm5N3sQOkk+eYlEMYu8P
	 T5X2a9EVz2j7U/62pJ/MjNpsqwb+xftRs/aY2MOSC0Ymr5aF0ETfBbvmS9Z7QqzjeRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxgJ7pYe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLEu2eo2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731AF606A689
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 731AF606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxgJ7pYe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLEu2eo2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJOhr81758379
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=; b=WxgJ7pYe7a1NhCBD
	3RPzR2OHdYUWIS5BRV3ASd9SBJtUla9otD3oKx8Rfv7ZmXMWn5wMrWC+hzhMqeHN
	rDL3LST8DUaiCMJMLwHyw9wBgMJzLdgjCRaPd+8FZZVO6WF2zSwPh+PltM38iAbc
	cRVdPpj9Qvtocc7imwvdK7kXy47+nYBFgMSbiNZUeLuaq2qV4ZVDyGu0h+BMG34b
	djSFX6vFJaJHFZpNRAOqBeO4y/XLli4Xo3kNK0NUcaEgGRhJ5OAKLbzyf81x6XGe
	0Skyzl3FVkdBBRd4lN/Kj7lZwho+eyTE59HIU/bXUHeEEctJ9bHyPPHemd+65bBp
	y436Yw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpks3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:56 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73a1cf1638fso162193137.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 12:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550516; x=1796155316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=;
        b=KLEu2eo2VWV+zfB5v0/DQ6r5HvvxBS9v4O1t5cNjDxe/dSuCwJbymJgdpycgXvGT8O
         laYrXCxEmswibdJweEPn0D/85/ucz76TqvaNLzlRuKYEfEZQtnW7yxgEoMxY5tNP1ZuZ
         IG094R5cxYY9adxLtsi40A+7NXkhc9VS/54jSSqOQF6LLS8ofJWqcIKepFGHeqp/FD8x
         UCU9AjIBLKG6qI6Ig0swFsyiZBxRFxOisgGpexBvNKqYad6Git0ba6IPRTb0rFMtwC7c
         onKul2Gsu1SKL57d72auP8rkwMdeuKAVepMKBB6OjITKlAi0eIoZsJmnclhrl80jQosC
         Sk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550516; x=1796155316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=;
        b=iTwGQR61HKiFbzVGy6Fu0OfuIvnGdS3eaNNEsqmxF0IKa/ovOL0C6A/0ueAvjXukFq
         RcdlN4YqqlmnEP0CMceHZcKPDDanYozxtwO5a56YhiSx4BC+KEwzNYYH8W5dJAToU51f
         nr1Fpgs98x0+91dnWvoI1fs86mdGL3O6lKGQrRpvbl2ES1upv4z1ut0j5l3VceSXmlMp
         mUYIf0xEWkPkTE2Lx/hKgPWVOUYUxmPHOPkFbOY8GBoH/n/j16dJsH6Ha90Acq7y6tiZ
         FNwgB/zfKgYt9Djc8+MDhWxH1BfLuYOh4THkn14phjMC8wBtCO98TvH58Wte2zdRmCKh
         Bmtg==
X-Forwarded-Encrypted: i=1; AL+hErEcB4UfpTLvkj4aynXE/ae6lXCzmKHj48AUbDnnJC4/YHyZdMbGOBg0FfAQ5zzotza8WXu4F4o6wUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SSwxQlfbKxdWM0I0b3fBz3Z1vMzX5TeYD45GC8M3gJBKvHgZc
	rjnjqR7SuTnxohxPuS8FVyiZoHxrGMgp9avqIzRfCKOT1rrFTHLEoxLODvf0UtvrEecAuJRwFKU
	mgYV9cIU8t4o7OAuI94+NjIbX1IBtlDp0oVdS8LzauOO03DJAD6ppEPcFEV1zuCbfE5Gw6Os=
X-Gm-Gg: AZFdTZc25EUU92urRZ6IGEZaGKKGPx6pKXlKIGjDqbwgZM0dOyiREeqyRNXoVR9f6M/
	Rryf27FFp74/9FR6jWx5lhc5PxRG+DTAM9C2YSjAwYDWMnmlioCw6sNkMr5GJtJxY8vkLqAlb43
	/a+mzIaxqvliiA5Te+RxrfDP8IFv+pQH5hhETf2CwDOKVabljZF5xTqL9Xn1qHC12hXtUaCBwl0
	bqagdIzYAqE4jwRdDoGOFSOhMS3qfSErQy1boVfpuemltk/Zzp5y2JTaFc3j7BKB8NlBvS2diIN
	cjc//3vNho2rVaCTcgEhLFSJVBkaDID+pC2HRzFe5JeDhOoDKNjSItQRLMclilmd8csx8b4jeFn
	0jHwmN3xp96+uygxRYr0FsFkBMbz1JlMpC4OVuYiFAZ9h6xcws+fKmRfG19wwc4vOK/cUjYqBr2
	GWnNnIqeQ=
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr9353329e0c.5.1795550515686;
        Tue, 24 Nov 2026 12:01:55 -0800 (PST)
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr9353247e0c.5.1795550515061;
        Tue, 24 Nov 2026 12:01:55 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:54 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:34 +0100
Subject: [PATCH RFC DNM 05/15] clk: qcom: gcc-glymur: Don't poll the status
 bit of some USB4 clocks
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-5-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=2300;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=GmuoZNziZvPu1UlsqsifvQlY7SuM/U4EVYwsYPf4EdM=;
 b=GTjcW3B9vr7Iepca856fdLsOvmCpCMBNJCU1xy7eO8dKAHF60Cf3bzFsN4Z3SQoTNDUIH315P
 skO0DtYej3eAgai19OVL5aamY9nYLh2MmYMMnuwrsr1b1hs1Qu2gIJe
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX11vwv5ylu+iR
 jITWX0f6D+0MFsKvSjDSS+h4qlUU5cDtcHm6XgUIWXRW1wibksoXUjfs/0SlsK35tQcIPGed0/2
 /ujeob1w8vGQTUtfvnWJaGjSv01lXf8Oh6ucMsR25ASNGHZqOF/AnmrIyCA/cMDjcgno/LzeRnK
 LD+Tt9x/zehWMQ34kEmtfiOSqoFj/gPtQnQPTq61O6lm0bckH4dlptocG2LVZYghCv/z70S/h6+
 RegIcu8MaLG/YQVDy8mm0T3rBuNPfRl4BdYYe0V0OGCT3MiJ60uNE/CQXwWO4ZRBIG1jxMDcd3+
 F1akinEld3FQKQCF4rCOfHXFduqxUbzjzSOg1LCHLEkZl6hE8zLqMdIS7qd/VqekzsjR+zSyP3f
 iRi4zBu0ND6qekjCJd+X2910uxLyiHZ2xl2GOrch55okhb9B85endG9hrT/1nhAlFbfktHvw+RJ
 AemySlUae+I3Kll9M0A==
X-Proofpoint-GUID: 9GGSistCLk1-zApujPIDvX_Quo5VQdo2
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05ed34 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=zk98c5D4pPYhsamE--UA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX111AsYyPEBqI
 TB/OFT0eE5Rx5phtmcOpzcQrmfzMeh3ScSEU/PRZ2rEWIqs7kc321y15Ccxjo3CgxYBIVeL5IGA
 MEyordw5PIM9h1gLs6WtuwgKg9Tf4iA=
X-Proofpoint-ORIG-GUID: 9GGSistCLk1-zApujPIDvX_Quo5VQdo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

These clocks are PHY-sourced and their halt bits seem not to update
reliably. Ignore it to prevent spurious warnings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 186c779e30846fef5fbcf66d114d58389d72efa7..3323792929d9292db0fb28b116723dd054d6deec 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -6833,7 +6833,7 @@ static struct clk_branch gcc_usb4_0_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_rx0_clk = {
 	.halt_reg = 0x2b0c4,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b0c4,
 		.enable_mask = BIT(0),
@@ -6851,7 +6851,7 @@ static struct clk_branch gcc_usb4_0_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_rx1_clk = {
 	.halt_reg = 0x2b0d8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b0d8,
 		.enable_mask = BIT(0),
@@ -7068,7 +7068,7 @@ static struct clk_branch gcc_usb4_1_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_rx0_clk = {
 	.halt_reg = 0x2d0e8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2d0e8,
 		.enable_mask = BIT(0),
@@ -7086,7 +7086,7 @@ static struct clk_branch gcc_usb4_1_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_rx1_clk = {
 	.halt_reg = 0x2d0fc,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2d0fc,
 		.enable_mask = BIT(0),
@@ -7303,7 +7303,7 @@ static struct clk_branch gcc_usb4_2_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_rx0_clk = {
 	.halt_reg = 0xe00c8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0xe00c8,
 		.enable_mask = BIT(0),
@@ -7321,7 +7321,7 @@ static struct clk_branch gcc_usb4_2_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_rx1_clk = {
 	.halt_reg = 0xe00dc,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0xe00dc,
 		.enable_mask = BIT(0),

-- 
2.55.0

