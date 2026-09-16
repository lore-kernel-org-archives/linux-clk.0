Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031BB4E66C8
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554678; cv=none; b=pT9F73R/VvUk9iz/C6feVksktc8SGjRYQ4r8QV0n/gJMDSMo/3C+l2BfAgC8QIeCrNvFtliHwpzBpBZefGdhgsyyDSyjrf5j6N5bBue1lC7/AkW7cpd1JH0V+q2U0nXlzMtZLXrzQARsfSzizeFEkPpaZ510aWz+pinv6LrCxdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554678; c=relaxed/simple;
	bh=iZ7pKk3T8R3JKCttBUFqM1emU2wLfSi3zZs1CzHqSOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kqH6+qsHZlrMFgW1yWuQTujr4XCsS6rLjyk9KpIQa48KEgvd50Y5IJyQDM7ylahwDRS75PuwgyE/Yw0ns2xMQVo6kxJXbADRzSmRfcavi/fWvTtjl1FEFmHjvRpMNpOaZEHH61dsL5K3aceDTe1cgVgaZaz0LRgeH3PZ6JCldU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1IhajgJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Etu4eBsH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1IhajgJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Etu4eBsH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92v0m1721223
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hQ+D7wuoF2Ufg85b23tzb6dwCm2k7tYYoaL/Hlf1zvc=; b=a1IhajgJ4m9UaCub
	Vx6+ul/89wu4nfbSmOXRrW/5pMl2dNlmtjUIq6X0by1+h+opYE7eekLWCZ5Vf5Tw
	Yb7P0t2DocB1ffVPx0OP5H8eCNlQ5sHCqfVTQrR1otjNKkb/oMIhXuz2JAxKlQkk
	lQmYaxK4v2cMRugDLBGRwe3ylcLjjRWCsozZi26dbvA3caPUWRu09CvqX+eG2vRm
	b+vvlOXi8lbv3DxLK8OnnLER19dsu1XOeCj/McFMh4SqFG8qM4kecJ0USW70UuTv
	oRzkPolfBVbueE17rFXBOYW95RNPr7eBOOBqmQzHy1j/eoMGCqB3XsekAbNka2q0
	Ou0Nfg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnkc1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1de6d5c3so667963585a.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554649; x=1790159449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hQ+D7wuoF2Ufg85b23tzb6dwCm2k7tYYoaL/Hlf1zvc=;
        b=Etu4eBsHc8Crk9KoBanlwrT89b4tmMRoNq0SHEWNU7mJlgIs1ETveR0EuHV9f0pAbY
         w3wVXV4R4Q9jYo6ETpsh+edvL1KdfbC7Rl8ySt3aq+WQewFVyO5lho56/XdZJOQWU718
         Lrw5ayeKEd0HXM0S2Xw5zsVIchDC4EODTW76SFVlWReTSjuBZ0ah+DsvSwwPP0PKj8Ee
         Y2vy3iL9gVhhG45HzdGp+Ko4fW1R43GqXvbHQhumJNbFjDMLjCAXLiMwZIp8aqUDk1TD
         DROlob8o/j0OFI/sIxvyuyS/izgaPU9h7TAyjEpVwqJPG4jlI6/bX6SQ6KzOkmT8cha6
         oglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554649; x=1790159449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQ+D7wuoF2Ufg85b23tzb6dwCm2k7tYYoaL/Hlf1zvc=;
        b=Qpj16vfl3NnQDJ7uXwyoP+tlWA7MtJkMLfQPjNN8V0aMg0rgjpvF8gRNEFxcfwmERL
         it8f2HGNFx63iN7vxeYNYlmvjyXj06EzCpirrQMXdPy+kByaRch+zu4H5fAT65Hlrg7A
         Pl+2lD1UVxB2SrFzWCToOD/x1u7cm9JGWAN/Uke6AUEVGMAHc1Zw3sFqZku+aPmG1Wsh
         8oF6SBtM9u2PUX+0IhN0NmUlSQ9j/QnMPNslDO738pRUjMX4cycWykdp/FV8zS2henIS
         7LpP6Qj6i8EpaoKZPtFQ0E/JPBDQPHZGMfT+ilaWf0Z2ruHHfM4tIjQqZEOKTDJyQZir
         r3Ag==
X-Forwarded-Encrypted: i=1; AKwUvBy7x1eIErCTzgXxS/KH3xatr/XaqCsrVAvSyZGzq5g9HgKKXWCzgBc6GcV986PVXZ7uLHcqtQlnYSM=@vger.kernel.org
X-Gm-Message-State: AFuF++nfwiQ0HDCdLPjZEQeGDLXagqlZv7tYr58LDBPDBQR8X//qWW+0
	1EBpL6qFK3fJSxvdqO5pDZU4c5VbDzZxm29uJ6RLMHNA6OtWV53HXUrm0j/lYdrspfgmLXgPSLI
	Cltogpqhly/fvKMZkliiyxGtjaE9c7k2uz2Akvycu20PnaHQaaXv5/MaJe6xzn90=
X-Gm-Gg: AYBFou0Gsm9pRm7Bjvib86vtpCJTBBY91xg3utR5ULCOCEThmx9yub7Bg3ZYJQ50m1/
	cUEaoNaIdipIkggQatlembTs3ftK/UvlPI+V9s2iJTf7Wrr/jAYk537YYteE5kSkA/OxlQLHRK2
	rSFDlZEtGXIAqEc5JTrNMAJ8qufUweRidza4RrfxU0VtpA+Fy/EbjdVEUeI1ShpSz26HW4WSwrQ
	Xuunvk58CLvfJmdgTiS0Bm5OofIHUgytBWI38fsZoctEiEyturM5L7qfEdoIXyCym8qnKgyUIcw
	N2Z3p5k+KR6W6Ve78qGOAwrBKNAH7Cog7/KdM7vebGguO+H8x9NqCHEo14XccOEGW9yDzZRGnBt
	MvLCFERo=
X-Received: by 2002:a05:620a:4707:b0:93a:3d22:3122 with SMTP id af79cd13be357-93bb76289e3mr318856585a.3.1789554648758;
        Wed, 16 Sep 2026 03:30:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4707:b0:93a:3d22:3122 with SMTP id af79cd13be357-93bb76289e3mr318837585a.3.1789554647115;
        Wed, 16 Sep 2026 03:30:47 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:59 +0300
Subject: [PATCH 43/48] clk: qcom: lpasscorecc-sc7180: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-43-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iZ7pKk3T8R3JKCttBUFqM1emU2wLfSi3zZs1CzHqSOc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm90GrbN/Ojr6Cpf0pCXlh4B5xojAW4Ag6I0P
 YR0Q6BIMYiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvdAAKCRAbX0TJAJUV
 Vni6EADL2z4yt+Xd9XcQt110ATi7dhY/nm28M9M/eL0vLVsO42d3xMVYtBF6cElBqxe0qovzTJN
 YVwOjmhyP6fClauDxGDG6zKvzo/NpcA8geC3lP18rqZ68NmLwIzT3VeLK5WwykeCX+asEYBVI4P
 yqTpwkfyZ4+5bfxYpBYOMCCQWGLMdhIEf+PawX9Be6cdZBeNWIAxDpLmmdVp0EGTChRFKZg4NDv
 wxvB6OrZeirI5a+R0aSymJmRy3/F3G7iv6kdZ3PfAgoiZEhNnraNJjM5JVGZWY1djyEbwDzY9y2
 MqXrFsSl0Z3CxY7phhfdbnS1s/TXD2Ck3lN6PK79CndkTvoVBPjLBJE+AW3XrkPmsKjtihTr37N
 wQJMbGeyUW7quQtf8oOqzLwDy291bgTVeW9BnBtIHNph03Pb2FYCOMN2lcZNVc3usMgfwq4+DQh
 ESpiLyR+Fh9eB7wcBah8mrBQ4lQ4A8X6Ar56GOzdRl/h3Uf2AfcKFjq9eLqgUC3R3c/OtGKpMnB
 9Am+QCKvfv0Z/wWsNLsZjevcGs2GimmCMcRowM81D/e0OOXC/i1V92EHz0j+jqqPiRfFq76Ktr1
 wT4zEyoJuLrW1a8urbKlDJgf7vpVcb5T30ATEz1j4iJYhI55S3rCCnNdxAFwCZ0zusN82y+7K27
 +fTFshHYR65ku5g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa6fda cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6y-cbsPRrUJUYPj_W9gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX1GJMqIUS++GP
 nT8S6XY8Xv+RGQ3tWknJOYKDAqFjfNHETRjsuGObtfotMoJPeYkPm2ivwajJ7JwH31XeAYG4YG9
 6+c9G0/cymHvfja+9nXE3tSneDCHSP2h/lmlzvoeNsOkau07HQ2O+k5OQcBB3zQu0lElrL2PufH
 KGWxe9v8Y1nPv0h85jsnMGLhlJqgmrY1iXUHrYxclpkLhY86gboa8vn/N0qCBS2P94SXvzuewHu
 /bmxoGjfom79ogzZlMLi83oola6rb1baom2Qz3+FEfP+pu1ig8SvdlLiYNxmC33WaWmtTrV0mj+
 TU+tRWY0j5Q0L/1KWStr1zkWq21/GmPbLZqNwcGy46L0BXJbgdQB4oER9vAXnDMvSzvNfDP8vBR
 XCR7k7BkhgJRKlzxPpW0foOjfABlN2GpoAulBoog+dbGGvsTmsEapR9NHw8/VU8/LFcPALBJm2Z
 xWKWiqxCea+ipw02s3w==
X-Proofpoint-GUID: -BORwaPXfMwHA9iZAWBFAQMlWLzQVMr2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX9VwzBULyTpAy
 0R3MEAJFJpqKjmbzKuJmfkSoUHtfzeZWmck+EKcPXOjQD9VBfj+tnv3PCLhJ3YxGflFE7t59NMh
 lV/3H/Kccc3ztPM+hUBiIAZj4E7UlUw=
X-Proofpoint-ORIG-GUID: -BORwaPXfMwHA9iZAWBFAQMlWLzQVMr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Move the PLL register setup into the clk_regs_configure callback so it
still follows the SYSNOC branch enable. Attach this data only to the
LPASS core clock controller descriptor.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscorecc-sc7180.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 5174bd3dcdc5..af28da5f04b3 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -343,7 +343,28 @@ static const struct qcom_cc_desc lpass_core_hm_sc7180_desc = {
 	.num_gdscs = ARRAY_SIZE(lpass_core_hm_sc7180_gdscs),
 };
 
+static const u32 lpass_core_cc_sc7180_critical_cbcrs[] = {
+	0x24000, /* LPASS_AUDIO_CORE_SYSNOC_SWAY_CORE_CLK */
+};
+
+static void lpass_core_cc_sc7180_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* PLL settings */
+	regmap_write(regmap, 0x1008, 0x20);
+	regmap_update_bits(regmap, 0x1014, BIT(0), BIT(0));
+
+	clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
+			      &lpass_lpaaudio_dig_pll_config);
+}
+
+static const struct qcom_cc_driver_data lpass_core_cc_sc7180_driver_data = {
+	.clk_cbcrs = lpass_core_cc_sc7180_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(lpass_core_cc_sc7180_critical_cbcrs),
+	.clk_regs_configure = lpass_core_cc_sc7180_regs_configure,
+};
+
 static const struct qcom_cc_desc lpass_core_cc_sc7180_desc = {
+	.driver_data = &lpass_core_cc_sc7180_driver_data,
 	.config = &lpass_core_cc_sc7180_regmap_config,
 	.clks = lpass_core_cc_sc7180_clocks,
 	.num_clks = ARRAY_SIZE(lpass_core_cc_sc7180_clocks),
@@ -400,16 +421,6 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 		goto exit;
 	}
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x24000); /* LPASS_AUDIO_CORE_SYSNOC_SWAY_CORE_CLK */
-
-	/* PLL settings */
-	regmap_write(regmap, 0x1008, 0x20);
-	regmap_update_bits(regmap, 0x1014, BIT(0), BIT(0));
-
-	clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
-				&lpass_lpaaudio_dig_pll_config);
-
 	ret = qcom_cc_really_probe(&pdev->dev, &lpass_core_cc_sc7180_desc, regmap);
 
 exit:

-- 
2.54.0

