Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5D841D647
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704300; cv=none; b=sdmduTGW7ulehnIiER9LmIsbDZq4lYjlhZG3UqAxAOt+dE201XA7ABJNV4/grKczqMjBIIAM+YM9ZxK/P3417U5Ubq7DM78ug+ifl3K/7Utz8dCJArSUwteERBC2auNT5nUp9xk3y0ePBxLTS8EdvE33RWDWULXoD6b4T5oZaLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704300; c=relaxed/simple;
	bh=gxoQSeMomlLlSgismEZYS34EWU7wg4s4uQ+gewbEBP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXY/KahflsmJZtCHa1U2sQDC7KSa2X9MHNqv0vTvczWBQfTLhJ3O4XGshszS4Gq+xQb/JnjWPOoNZBUsOct4aLaLx9C/T1sV/VLmt+Z0Xu2mFK9A1GvqUbNtIf7U9ovb1hqVxcVQ4/skomJSjayqzhdVuduLUwW0Rt7yh5uS/Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dk/0w84e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqhCt8vk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dk/0w84e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqhCt8vk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68600Cue088003
	for <linux-clk@vger.kernel.org>; Sun, 6 Sep 2026 14:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h2LmOSNQ0tfPY2I8tKBVudBy9g7Ot7SAmrJJh3YTOxc=; b=dk/0w84euvhzt7/s
	3cZDvVyTBBXDZ4jtXQQfQx1qMzwYA+CDjwhO5RZ12+q9x6TTi82VrKpHerdkx2Z/
	9lpGmmFQdiLf+K51Y49bDXSRh7NlWZjrOVya3mxoR0QFtA3M3QydCwVMNqB5hWHt
	DTV//3EvI/UGX2TiObRK2SVgrqW2hXB27vMTZq8KYMKoEwiU/beo93LQc3B05FpR
	y20AMpaYTU3m+vEdWXw7lwOeMFZSWxymu6UZrmnfCK1u7Maf2vdNkP1qcDbwXAaH
	qz2C9TKdQFr/kOhkH59a+7xtFrm+Ajbw4n347rfHF424XzJvzXtn/03kRLVz5cH/
	KS43tQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany3gx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 14:18:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso4525349a91.0
        for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 07:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704296; x=1789309096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2LmOSNQ0tfPY2I8tKBVudBy9g7Ot7SAmrJJh3YTOxc=;
        b=PqhCt8vknPyeZxZ9FUjGkl3BBGDhbCeKwh2AQE5ftVo+SLRl0HBjwbDoYEUwuX0Rmu
         +XykZsBvQ8sjlN5iTGyoAGO9LPyzIe8z7hBQ+9HZb8DqR2e+SAvPEbjNNdg2IqTtwE7t
         0HDQNbWpNsMVO0bG3LXby2bRkyNTf81Ke2yjWDyKk+BJZxjNfVRfCxlsPrw6MhNkeZj7
         WcUtnGp5pQNQ8V1MxQY9JQLyJxL1GjfCbzT8LLOsJmOs9NLP6jLM3G9lcHbpSGV4c8MY
         e5FWHEUiMJO/588aj+U4AHk0cxlnbxWmciXNkYgfCivd/xdC4RNQ6piHXQzfPZoXF50/
         3QrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704296; x=1789309096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2LmOSNQ0tfPY2I8tKBVudBy9g7Ot7SAmrJJh3YTOxc=;
        b=CCQ0QTVhdqijheMWQOzUvbRVZPqYS8t7h3+mzl1WQg1FF8o2wiGa7Uf6vKFzBDpkKh
         Dx3Wckoh1aWmlWJ/xFx5lrTPO3rFBJlsIS7XS3J9Q3WRg5M+e9Tn2UEmWOAGpM3qrPpu
         gQQE5j7jLOnuM01Q/vtNuddB6JZpsTKei31V40UlWd1g7/0ZDyRefRfag7fzfA37zyRb
         WBxxPONOLxrBdF9JhbfuC7fiEWZzzSII2Meqw41nNrSRRjx8PY12Uy3FQ/6qus/MyZVV
         N5vrgqewjTarGsEzLYGEobWljxwQtF84nDPyKN4wsf7qDxQIrqz8RjkP9zx9wfEomDl4
         zNPw==
X-Forwarded-Encrypted: i=1; AKwUvBywc5jgt3R3RF1HWs7x5NeJrkAX/tPka/KjjDYKhMPMT1FAoNp20RMT+ZBAVQNNs+y8NlizczM8AxE=@vger.kernel.org
X-Gm-Message-State: AFuF++ldCh1IzAZs+vYQYCHij3EGzj1HpItuREpu6tfXKmfcOVfxdKqw
	bf+0tSK24Z28egYsJrWpFfLF7TthMrt2tDH/AC393orBFUp7yCz2HY8WDfe6RxJVysXvCT6gIuq
	3TP5FZq66+wGn+lz/9EOW0HWsUfpnJvD20e/4pqC3kt656VID4q4Brt37tzgn8+g=
X-Gm-Gg: AYBFou1tS7XsUdvOia2KlMlX2sYKiXgIQ9czZ40561pG3Y91GNjXOIUzp2VOugPzjc3
	0wMg52AmBgU1K8PLTYZRpLP9RvXRWxXipVFUD5vHSdlXBEJMQU0G34mfTC7tSuPyCz0uyy4x6Y9
	ZEO+wVhAdhXY/UQk5Scu7W45/FcpawmQ5DcPhdx8HJQZumOjh91bPdFNdG6t025+WGfvV87lL2N
	k+jFUFYaes7Q0tP7esSN9faX/nhm6wYjw8fobDt6p7fJrSQiqZJ2Tf9QApvTuKryTaAKZfwbVCx
	qqeeIK+0oMco9U8wJTKK+Kvf6YlKdnUzM5Fpjtzr18CotBGIHgldZ6R6znSSvBQas2wzJ5N0xD+
	k4ZeyIz/T73p7cdi9nccBQ7BtyNYabz2jhCTKOtXxNz0=
X-Received: by 2002:a17:90b:17c2:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39b25f1c5bdmr25232882a91.0.1788704295797;
        Sun, 06 Sep 2026 07:18:15 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39b25f1c5bdmr25232829a91.0.1788704295315;
        Sun, 06 Sep 2026 07:18:15 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:14 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:10 -0700
Subject: [PATCH v4 04/12] clk: qcom: ipq-cmn-pll: Register CMN PLL /2 clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-4-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=2809;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=gxoQSeMomlLlSgismEZYS34EWU7wg4s4uQ+gewbEBP0=;
 b=lL2f7yhu577Z3kaxQivGtNNGXXMQoDyrqm59F3pdMyZFS856aGeWn8pM//2J+WBUniT9uJXjX
 BSFvE02wcDXAkXpm8pDrjhPQV+Dit/p9Tu1vAzAJh6Z7qLMp8/ds1Vc
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9d7628 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LIjNjOY4wKn3Yy6eg_0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: OgIlkc3JPAFmbLzHBh2dui5IrdwMC2jm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX49lMWxMLPPti
 oPwphRoDfZAo8dxXg6FkkVtU5tV2v5fJgzKlQpYPtxHJFvRGqbGs22RKD9h0oq/q5oSepuEwBDW
 WoyfZO2ugRoOIScuTvdoU+Q3xhccwCjYiyWXay+uTXkNMgrc5/5vq6yCdau2yR6KLyiJtVA/wUG
 lVUky9tS5BZuuiC9sHXHVndnfc0E/AP8zkYsX2bpYee9YZKE/6gu3pN8LI7z5bQKtJusNdHEV5E
 5cfJm148Feo6ubSDLa6Bj3D2Gero4zGuyG33dhHLOWPYWWG7dVciSgMGdSxqiJln3tb7+R4AwBY
 4Pz1vLCC1qLvhEqioAciSKccGu3pDhC+3klCorhDxSLiI71dw90wfNSGvEeJSYndEKtlC6DOdaT
 2Qmwy0AUvMvesaZjFGBeesICfMhqoqpH75dCefqIpeevBk8pGKOt8UFLZs/w+FGn6zCAi4S2hYF
 7eQvJKW8MIV/c7CSuxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX7HCrSnoDXIE9
 OO8y50jScA9VgDOF26TRRQ6VTBP6BpsGfEEiek9rJHXwz3Q9c0Z0Q80WYSTTF+KdrJwPy7Oa0xm
 mUTNEwh7mWkXdM9rDuwjZHF5sNOC3ZI=
X-Proofpoint-GUID: OgIlkc3JPAFmbLzHBh2dui5IrdwMC2jm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060159

Most CMN PLL output clocks are derived from the 12 GHz PLL output
through a shared, physical /2 stage, ahead of any further per-clock
processing: a gated fixed rate (PCS/ETH0/ETH1/ETH2/EPHY/ETH), a
configurable divider (NSS/PPE/PON), or a rate-select bit (EPHY-RAW).
This /2 stage is present in the CMN PLL block on every SoC supported
by this driver.

Register this /2 stage once as a fixed-factor clock, "cmn_pll_div2",
and store it on struct clk_cmn_pll so the output clock types can parent
on it. The two plain fixed-rate outputs, xo-24mhz and sleep-32khz, are
the exception on IPQ5210 SoC: they stay parented directly on the main
PLL clock.

On SoCs other than IPQ5210, every output clock is a plain fixed-rate
clock (CMN_PLL_CLK_FIXED_RATE) whose rate is a hardcoded absolute
value rather than one computed from the parent rate, so this /2 clock
is registered there but currently has no consumers; IPQ5210 is simply
the first SoC in this driver whose output clocks are modeled as
depending on parent_rate, which is what makes the /2 stage significant.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 4fdf78f6829e..c86f7982607c 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -96,10 +96,13 @@ struct cmn_pll_fixed_output_clk {
  * struct clk_cmn_pll - CMN PLL hardware specific data
  * @regmap: hardware regmap.
  * @hw: handle between common and hardware-specific interfaces
+ * @div2_hw: fixed /2 clock derived from the CMN PLL output; present on
+ *           every supported SoC.
  */
 struct clk_cmn_pll {
 	struct regmap *regmap;
 	struct clk_hw hw;
+	struct clk_hw *div2_hw;
 };
 
 #define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
@@ -362,6 +365,7 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
 	struct clk_hw_onecell_data *hw_data;
 	struct device *dev = &pdev->dev;
+	struct clk_cmn_pll *cmn_pll;
 	struct clk_hw *cmn_pll_hw;
 	unsigned int num_clks;
 	struct clk_hw *hw;
@@ -388,6 +392,14 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 	if (IS_ERR(cmn_pll_hw))
 		return PTR_ERR(cmn_pll_hw);
 
+	cmn_pll = to_clk_cmn_pll(cmn_pll_hw);
+	cmn_pll->div2_hw = devm_clk_hw_register_fixed_factor_parent_hw(dev,
+								       "cmn_pll_div2",
+								       cmn_pll_hw,
+								       0, 1, 2);
+	if (IS_ERR(cmn_pll->div2_hw))
+		return PTR_ERR(cmn_pll->div2_hw);
+
 	/* Register the fixed rate output clocks. */
 	for (i = 0; i < num_clks; i++) {
 		struct clk_parent_data pdata = { .hw = cmn_pll_hw };

-- 
2.43.0

