Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974E72BE057
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905231; cv=none; b=VpU3Fn7PaacLf8OBS21lmf0OGJ/kYnVNB0wcqMe9ciaH2/2ovWPGMbBuswIQn4cXQeJKvcLdTCiKoqLwy7fedPCRgxYbYlpXpilfuT8T50/qF0VVd9FOgpPvbJtOmzpZd8VdLnSeQejON2sneW5kN2vqPi35dSWPbSmZFZUHWXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905231; c=relaxed/simple;
	bh=DqJuOV/GfzjgmUgcYK2yXmABHWZdkEen47SlyOIyCNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fe/ocJ58x+rujJpr8gmxy40OHfmbhnFBmORTtLCKfBedyKL73kaFGinP8PYgUhlzraQ+beimx9IuZKrSxVBW5euoeAUZZtg0zLnUXgCWoj6NxhHWlSdj8BQgK1tATGAlvYj2x7NRnaEVKpldv9XucZkk8Y9p3SyJjgUR1EngxTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBv/lzsX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4nXEzpS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBv/lzsX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4nXEzpS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbE122710201
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JT+eLCrf0c1leO0aAexnGhyLa2ROrC88G1ZCfe37suw=; b=TBv/lzsXEEpQCVHI
	CUybqKqgxXfQM0QfC3dhLdQSpSvmgbL2U3tdVB0j6UFv2eH6InCARPEz0WUKlUoY
	gG/7sGG0AdQBpCet8zDai8fHfCAtz17uIvm0uz7q1dVSzAuMw8JqEpwhBrdok0ex
	uy/XBEl4XJDfiGyN3vZ5uPPIdlv3rg/IurffK9MY7pJd+hmGqw4lR61NVDuqqOMv
	DSSaHJ9iKwWRfgfBeNbl86xZ317EPeKKjSs3BMl6k7MWruxXYJRRXNYIgXxoPMuo
	YxcmgZKpYPdz03otJIhg6kJJjZ3oqA+LqeXsvvEnDsuFABnPOkp3FK9HtEcXfvs2
	gfpIEA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cggg9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccbb61893fso11121525ad.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905227; x=1785510027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JT+eLCrf0c1leO0aAexnGhyLa2ROrC88G1ZCfe37suw=;
        b=G4nXEzpSJnb3DqMxubvL6fMff1DTEaCqgrRbd04PvHZvAyMR1lm+kOpm9aztAKV2bB
         no4SsBAvCItuDysdDbXypY9s1jQDwLpyvX4xGl6RB3IwsE/uxZc1Rp7FMCbS+PQMH52S
         Q9r4ENgPUH7uS+fUNEpX3FNOOAhNwP13Hp/XZFl5tXpcP0Bljd0HCIBbqTpLb73v8+1Q
         BiKoha+iJyf++iSP6tODXjIcn7xe30sdnjBEmi+GSVTOTyLIFm0aT4IpwAlSxOzi62Kd
         3f7q3VAeeIUZ916RTsAwf64FnJ+D17oCBfgYBgSwqGnaH/PlEc3B3ORvXJzVXfvTt+oJ
         Elsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905227; x=1785510027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JT+eLCrf0c1leO0aAexnGhyLa2ROrC88G1ZCfe37suw=;
        b=HU6qeWa/Hlc/AMreu5oejaT20vTkjhWnjBHMHJFlny1FMxuS2fHkGEEKVA/O5ekY0z
         gNYBHMvY4RBPQeaC7j75tpsYyo2QXRb89BwKieimhEIeQLvvfs8jGZBvZyAfRt1ChBVg
         azq7RnYKKhoo/5yZ1iM9GI+Ka5uGUzx5SCRW9dqyIVIpUVXRf2DbV7Qn48sdjN/EhrZ0
         tx+hnDWi3PIlibRiwiQzFrjcwJ4IYJyYEw4sGa9jMBk/olvjSDJskfeqKSv5j5xaakvG
         2sfDQfYFIGN2fgfFhh6oQpghhUCxdLGhqAiS/c0xoYf4qT4FUqwkSFRtvqOUcVIX0lMb
         mc7g==
X-Forwarded-Encrypted: i=1; AHgh+RoNwQB626aQYmuxYQn1YBy+BrZFBAbyHh2Do8tPJk3dUugmzDlV8LjyICPxgYJk7zXXIomRFrBCI0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBARDER4IH5oOWQxKC8/loIAePROTdSA0WbdNF72L6kVZSuGU
	J/DroQsZdsNiGCYi0efHJfidxEvDXW2YklongTfXmcHxh7JFsuzaIp/V5wcFPbiHNJlQICEJO/O
	kSanpuxplJwKZhNHffREHO1mQu2RsWFFWYn/AschbjgorXTyBKlSWHfqM4MNdG68=
X-Gm-Gg: AR+sD13XZ/mnw4qvLK6CjxcFc3Fvf4/QrmahDz9drgj9kQwk6eXXkLPfn9RtTWBYP4k
	0GYD14ZaePK62BbsrZogUUt1jbVNk90cuYgDNi/9K3eNJzPG3s/Bu1mch3jkHyHnPzQVezAvf6S
	utUBevk0XiCKcQ43mOalGUSgiSR7Kx9T4S6LTNi4d7A4FbRt+oDK3wth79ddckB2PZlMm6Yauac
	l7slxweVaK25G7Vy5HlOHzK6zkLusCSBo76fJUx1hQ8r39rJnXZS9RoSzezlEE5SO5dHxugxoZR
	CkFbke4MF/7qMzI0zPDF2Zxya9HUnUeYDRSXK34U/qXG4qMHwz2gW+qIj/SVPlW4Cm6nhIUrHel
	xeuiCfTe9Preed0VchkUDQM+zGnUoo48eSNQZztwusJc=
X-Received: by 2002:a05:6a21:7303:b0:3b3:f46:1efa with SMTP id adf61e73a8af0-3c44b18ce94mr8154496637.42.1784905227000;
        Fri, 24 Jul 2026 08:00:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:7303:b0:3b3:f46:1efa with SMTP id adf61e73a8af0-3c44b18ce94mr8154427637.42.1784905226446;
        Fri, 24 Jul 2026 08:00:26 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:26 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:23 -0700
Subject: [PATCH 01/12] clk: qcom: ipq-cmn-pll: Use
 devm_clk_hw_register_fixed_rate_parent_data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-1-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=2855;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=DqJuOV/GfzjgmUgcYK2yXmABHWZdkEen47SlyOIyCNs=;
 b=CszzAwQHyV2LxSb+MI94lZAbB6BzV5kYZovqbPvnzvbfQJILWHX8TUww4jdO4egkurl12hCqh
 diGdeDFvY21D7+uwcMrca5hXrzPnYP0AIMgZ+rELhF5LKcSUvKnxBox
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=JOMLdcKb c=1 sm=1 tr=0 ts=6a637e0b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=abD0O5-mJzoiGkpUKuEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: BtKA8ZFMEhg1EyeoUlBaa6bnKTfsdNgv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX4oAfKer6OKQ5
 dtPaimU2mEA3fcnsQjRXaNfrvK0p32qcHrSYfVKksASztd+LW2SWX3PKhq+Tt4VMEm7K4MXC68c
 ahbO+E0T066QoqfYLAE/xW0ZXCeRmPg=
X-Proofpoint-GUID: BtKA8ZFMEhg1EyeoUlBaa6bnKTfsdNgv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX7iqHlvEvjtcF
 za9v+Y3V2TAFahk4x6M36hvHxLFbmQyxmZycmG+bIKeo7l0zysCZi22VpsOIJDxU4cTSfnFRtre
 nU/vpZi0hDiqIbdeuJYQ71xdYXEg6+0DfmZlyq0twQO7kzg3yWXAZFyV0OcC+5BJtFNbrVno7UC
 ZRr33guKslJpipDvaSCvXpkgnxJLH1ZxZS9zbjy+vz0Gsko8nbFoaEVKM9Qk6Cri2Jat2djYd86
 VsonmORWky582M7Q6LHdOM3pU/bxXYXSXDEM3pHhGV8f/vpejMOjxtNLOWUmvQ/2q1NF9yQgH6L
 XbRAzAysJvGSSBOaHAAItaBtva/8SKQphqYeuBHCHMzs95LF7zAj/jAu9O/hyam290D4R+MDmIz
 WbYAuGN71mi2Lyiy62k1Qgse9FCEPF0+c2HfBmYqYz6hQVXv0C+UAjHMRNanm0pUkipdSUu1iqU
 LNqO1A87iftrIA9ObPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240135

Replace clk_hw_register_fixed_rate_parent_hw() with the managed
devm_clk_hw_register_fixed_rate_parent_data() so the fixed-rate output
clocks are automatically unregistered when the device is unbound.

Since all clocks in the driver are now registered via devm_ variants,
the remove callback 'ipq_cmn_pll_clk_remove()' and the manual
'unregister_fixed_clk' error-path loop are no longer needed and are
removed.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index dafe8c1738df..4fdf78f6829e 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -390,13 +390,14 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 
 	/* Register the fixed rate output clocks. */
 	for (i = 0; i < num_clks; i++) {
-		hw = clk_hw_register_fixed_rate_parent_hw(dev, fixed_clk[i].name,
-							  cmn_pll_hw, 0,
-							  fixed_clk[i].rate);
-		if (IS_ERR(hw)) {
-			ret = PTR_ERR(hw);
-			goto unregister_fixed_clk;
-		}
+		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+
+		hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
+								 fixed_clk[i].name,
+								 &pdata, 0,
+								 fixed_clk[i].rate);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
 
 		hw_data->hws[fixed_clk[i].id] = hw;
 	}
@@ -410,17 +411,11 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, hw_data);
 	if (ret)
-		goto unregister_fixed_clk;
+		return ret;
 
 	platform_set_drvdata(pdev, hw_data);
 
 	return 0;
-
-unregister_fixed_clk:
-	while (i > 0)
-		clk_hw_unregister(hw_data->hws[fixed_clk[--i].id]);
-
-	return ret;
 }
 
 static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
@@ -462,21 +457,6 @@ static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void ipq_cmn_pll_clk_remove(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *hw_data = platform_get_drvdata(pdev);
-	int i;
-
-	/*
-	 * The clock with index CMN_PLL_CLK is unregistered by
-	 * device management.
-	 */
-	for (i = 0; i < hw_data->num; i++) {
-		if (i != CMN_PLL_CLK)
-			clk_hw_unregister(hw_data->hws[i]);
-	}
-}
-
 static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
 };
@@ -494,7 +474,6 @@ MODULE_DEVICE_TABLE(of, ipq_cmn_pll_clk_ids);
 
 static struct platform_driver ipq_cmn_pll_clk_driver = {
 	.probe = ipq_cmn_pll_clk_probe,
-	.remove = ipq_cmn_pll_clk_remove,
 	.driver = {
 		.name = "ipq_cmn_pll",
 		.of_match_table = ipq_cmn_pll_clk_ids,

-- 
2.43.0

