Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B8C4F96A0
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417288; cv=none; b=P8byyU33o0hya9lmD9oZ5RWQDrZAzX70lRcHp+YVP4IGiGj9BerdUS2TSvjkaMwyE3rgzl5p0amkio4SCvmvhcvQCa4jVEzPrPuHe4w979JDXuHZnmUj5Jo+qOrr0WkMhM0eDOlfsbgJy7nZ2nTUj4PghqWy2irpl4kwjOlIjOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417288; c=relaxed/simple;
	bh=GYsMi9M/l+N8xb7NgynOwqNgJk993TWhQAbRX7Zk1tM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RfMSRAseh35M2wHc32cPUMbna3V4IHIePaKdm0G7NDwjKdar2n5QE3DhVHmAYQ9vm1BreI5xGd6YbbvWfBQ8qUL7ziI2fBdumn+tKSPY+Wduid5cUUad06XMQqbHUM8pQm88uYdTjQgG/Ptm/oHSLZba6IFWbENZNYv+pWksSUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Re/Qwmzq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFt9OgBc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Re/Qwmzq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFt9OgBc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PDKb2193398
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yg2/j0qKSkzQHI952DL/AFIpyvPVAy4JcFswiVyi5qU=; b=Re/QwmzqZbU+knSF
	va0qJoLF3ubXpkG/bjs1PiiZPX5vv8o7gESDTPsNI3YSBTS1oGtxz0LiYdNcl4t0
	QjRUyMehgE4NzWg9WhPb/NNgnM1gmSA66502K5IRNRjgMIX2o6406j3LqWzLluYn
	z9ClbBWPpsHkEbYZApBrqJljAU8kICTdwnEV709Pfny40PgAtPQqsCqWfCaHqPY2
	T1fV+4rC5HPGiJ0e/o6eqJIhdK62pmAibmcvMO4GqGHubS1cweOui12g2sq0x0yn
	JCEQn+XWjQ0vXNQGRltsriQKR7amUcq5LH8dzCADKonZkS2kjBnySqLoTqG4zwRP
	5VI4hw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1axwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso424553085a.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417285; x=1793022085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yg2/j0qKSkzQHI952DL/AFIpyvPVAy4JcFswiVyi5qU=;
        b=RFt9OgBcldteF3NMFNxOq5RQ85LIEijb815N9NE8mXyqPgHL0uCSNJ64A/CEaogp0/
         zAkIY7tK2D/J7EHD4UUn9lz28M8ORbDQ8GM1ttPVspAgtLyDU3zwOpbeJTMDKB47CA7I
         zn1E2dGCtaybJYbgQzL8F1PXMymySAmZB57jFgctyDHTA423S1HLbuxkssSK16NOWcp2
         webndLNV8R5BsNAuSHGcvtHO10H6j1pzWwuclJEQwkjHkdxPnLVHt4WBXvbONiY0+VGi
         5PNAQ3iQYRk77zZJYCbz5tVidRuQTdp1ke9B6oMCaJASGgFJYSnv7mT4UvwZWooFb/dG
         heQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417285; x=1793022085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg2/j0qKSkzQHI952DL/AFIpyvPVAy4JcFswiVyi5qU=;
        b=KYQFA533mMfCcoNfmJCkLC8NdpAjWtigtQQPUdA+Cp06spjX6NCFRz/2gcObc9e8JZ
         Vr2G54b9T09d5HgPTBoquZP/yJumibFRRQs0mjacEtvdjiIj91qvtDVjy4xEOr0pewvp
         KSw6w469J4dpGzBznoRGX0fUH0JRYbJSjGRLslkZTn9BPYLVuNhvJUX6jZDHS1Yoy0KJ
         mHXvlKY/jo3BYlGKkiGP/ozKldRfOF1e4/uUTjmwGQa0NlPVGjYSXqKBv9cSfoFcdcsG
         bdG9piThQgEhJ313sv7lJ1VfDc0lWFI7WWv8KmI0Ik8CzWMwrAuaGV/JZPZ/cguKAkNQ
         VtxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgG5IqGevL3tOfrvTw3G3olReSSavUefDkijMZtCzyBvofosSUxcqEMW8cN54f9rCcx68s1e1fks4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZV4ukSOMOkgsSzuCK4EQPFliQLYLcIrsV464VdRKU1SZvm2BW
	MRskj3NNSahNBuZFj6EyV8ANnWoI50HFIqn7tmEpHne//rF6stY6e78nAKwZCLB+o9fughqxTyL
	QBglvFYDnstGyv6G2Zd+V6BSMnDc9JzzeT7UN4aBQAsH/QrYvUWlIrpY9BBk/1WI=
X-Gm-Gg: AYBFou1HCC99P3hSaPdMRQcxvbPn6ybqRcMjI634bAneGuabvrtIxId/JyGzl1vQz6s
	KlslbRzGj8XZEsBMnRNsoQGmFGRDLooEl08qJCtbM+VOHmt03v6yBqe4NEkfxIzlYsOr1VlgnZ1
	8BuBDxXDvf5Im5jFwwdkGkmWN9CnGtoeBAabUrcumPpBmrsMpR8666dRfThso2I2BxAsf9MFyOL
	rMof+e5ZalwE60v3CSg3oqXUaoKj7TkHA8E0/onIGGTOSmZOopjuofV0rHo6r8mBr9kRrZzb6YU
	Jdp55zNi1+GlML9Vkh4NWGsD7wji1ZF8mLoWXBgX24307+dBrYnJlvwPpFal940V7OfZuOdGmYm
	Qy1J3W6jYhUdkznU6mn9YjVMwq0j/doQzDXrjYxFw/VWgsK/8SidEDo4u9+JDZZS0otmV7qvXeE
	op1FtjhqKbDELA
X-Received: by 2002:a05:620a:44c9:b0:93f:3f86:c4e9 with SMTP id af79cd13be357-93f3f86c50cmr420021385a.79.1792417284624;
        Mon, 19 Oct 2026 06:41:24 -0700 (PDT)
X-Received: by 2002:a05:620a:44c9:b0:93f:3f86:c4e9 with SMTP id af79cd13be357-93f3f86c50cmr420016885a.79.1792417284056;
        Mon, 19 Oct 2026 06:41:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:41:06 +0300
Subject: [PATCH 07/10] clk: qcom: cbf-msm8996: program the MSM8996 Pro
 post-divider
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-fix-clocks-v1-7-370949e4d8a0@oss.qualcomm.com>
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
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GYsMi9M/l+N8xb7NgynOwqNgJk993TWhQAbRX7Zk1tM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3y3mN/jE4s1DnxolwyZziJ6Kb6CFIyY9UUf
 uKGerctnc2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd8gAKCRCLPIo+Aiko
 1XpvB/9fBNcN1I0LMvka9RWijRG8JfsFN+DHIx4dAfmHBiSbqJ0dZmYy4Jh86umygFtq0DfBDj2
 t3VZGXkD9p92/125j+tbp8h4s0V0nZArgQtvaSDDmB5A1/cGruzXdQQiWgCZc9IzGbsPDihVvF+
 fFKUIxGuph+tTf728wYjnG+tDHmroKALP50t9xA4c7tLBlDGxWrzGWiZwg7EP0/fqUXcEoRVfmx
 AjX3hk7cQu4Atj9P2fHcU0QBmab0lbLBCAxXNyynVy9ThTnFKnTHVpjPXZo6stxLdCVngDXClo3
 //XKnhmPQ//+KfcvBDfDemq6bTomaRYZ3n/PAjBsWOmAl/1n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX/AzOg6OAOJtZ
 899uealq1TX5Thd3s/iWtUJpDmaJCiMjgeQgXuueyCn6svtC4vGNdGszRXDr8+nDq4ZwV4z0+Ki
 RcWnDTS15kXcV0mTbKWG5MsOem6N5n4=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad61e05 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=FLPO46FfgU645ZJayLIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX2yhIHbSSAmcq
 NCnxFbKAdRcOFJ2kc9Hnp7MfymEKyzqDwTav+NNTJY58qlJ1CrH3T8q7GUksQ6ym7Q7T6rBkhTm
 /3nsYdm9TLARZzjXqdvU0uj/ahZlJMVXInIQ6snsnaA1kT0xqnoweX7XW6hCuPMut8iJyLAzuei
 gX5gehq+xyaLrOWYf3bm5K4iP4oZrfSp5wHGDmGVOS94+2Spnga1UCr5gdcDBseSB6ZhGAA+PvA
 VM39n9w8J8E8A0wKQgEQHC5B2QKwTcGF/fbI8CWg4skhY5t+yWqiIopXbTF9ovzAFX9pEOSJJC9
 zQQK2pshtObMjg2OHvn8MXouj7VQEIyYgtWoP2lU1YlVPNKt64h1zw/qu0sypklRhrecX9qXO/N
 DrCpqfoKy5uXF9JOCw/gnoTgokA2G46LbuPqP2rX2Ai6t3zeQ9JH+L6n1PvCPlE3Xs5lUDZAZJP
 +NTplWoTuuznMuMBOiA==
X-Proofpoint-ORIG-GUID: 0fWkanz0IaEFd4X5OBFAne2xVHuXiUr2
X-Proofpoint-GUID: 0fWkanz0IaEFd4X5OBFAne2xVHuXiUr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054

On MSM8996 Pro the CBF runs at twice the requested rate below 600 MHz,
at the voltage of the requested rate, and the SoC hangs once the fabric
is allowed to scale down. The Pro post-divider of 4 is only set in the
PLL configuration after clk_alpha_pll_configure() has already
programmed the hardware, so the PLL keeps dividing by 2 while the clock
tree divides its rate by 4.

Set up the Pro post-divider before the PLL is configured.

Fixes: bc48641a68dc ("clk: qcom: cbf-msm8996: Add support for MSM8996 Pro")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-cbf-8996.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
index 0b40ed601f9a..1bedd14aa3b0 100644
--- a/drivers/clk/qcom/clk-cbf-8996.c
+++ b/drivers/clk/qcom/clk-cbf-8996.c
@@ -287,6 +287,11 @@ static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
 			   CBF_MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK,
 			   CBF_MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL);
 
+	if (of_device_is_compatible(dev->of_node, "qcom,msm8996pro-cbf")) {
+		cbfpll_config.post_div_val = 0x3 << 8;
+		cbf_pll_postdiv.div = 4;
+	}
+
 	clk_alpha_pll_configure(&cbf_pll, regmap, &cbfpll_config);
 
 	/* Wait for PLL(s) to lock */
@@ -303,11 +308,6 @@ static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
 	/* Switch CBF to use the primary PLL */
 	regmap_update_bits(regmap, CBF_MUX_OFFSET, CBF_MUX_PARENT_MASK, 0x1);
 
-	if (of_device_is_compatible(dev->of_node, "qcom,msm8996pro-cbf")) {
-		cbfpll_config.post_div_val = 0x3 << 8;
-		cbf_pll_postdiv.div = 4;
-	}
-
 	for (i = 0; i < ARRAY_SIZE(cbf_msm8996_hw_clks); i++) {
 		ret = devm_clk_hw_register(dev, cbf_msm8996_hw_clks[i]);
 		if (ret)

-- 
2.47.3

