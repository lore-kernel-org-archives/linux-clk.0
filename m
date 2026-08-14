Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D7B46EC8D
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711703; cv=none; b=mEiO8Q/IKZqPG53YXd9qqpx9VF7RtrtcBk+1W1mDLVfwX3s6ipGM+L2qPg7BxUb4uH2gxAsATqhl8VGi0MBZE5XNXDA7bHPWsSunJ/4Bjef2WyP3FYHNP8PoF+ihvjr7IKh947RXtSqsoen6CNH6iFHbXo5C0roPM0m9MgFnCpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711703; c=relaxed/simple;
	bh=2CIWbIplPIOs4YttBUTOknjwz6v70LMbQmOzk8+bHYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aCIcUH+WsK0oH1O4jKorLquSFHjnhDCdx74UgK3w16hUHci9Cp+BoS7m1RngIAX5BhsHx+ltppS2/NiViuXJR4102awTMrX1yRLmudrBUt4yQH4lu9qeSqmK0rvcoBmBKlMGJYTF5XghFnBAKXbGDssA86GBvKQdQcVQ6O9DKns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrGENS3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eojfjSiT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrGENS3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eojfjSiT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbAu21413072
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3S7TkzvGw3bZtPLPczV07Zg7pGcZv1h+gR5zT/H4IGc=; b=WrGENS3c1+k+ORUA
	Yq6wsxrywJlnpdgjovqrBk/sgNy2Uv2NmMT7pbMxNk+Mtr48Or3ZqicOH0dBDB7k
	GSquDmhY6gSK7qqO5ZywRepR0KC9ngpBC6uxOO5VJrEC8W3xL+uznISKsyYomAtz
	WKreM9ug+5jLmNlG3wH4EDtjDe2NTFVz1JkLMXg6l/Zv8RxnRze4M32Pc/JLcON/
	kMGDdTh3njJu3uIAMOhEBSlMUDJFC0CKZpDAXh0lGvkWwFMoYE0VTCkhQSqT1/YO
	DekyH7eya0a0975RggNGGQeUETPIDZ5zD6K4A5Mc45iwrQMfjoaopgjNKpck7k6B
	fjQVWQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20638us0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8487eb67173so1418859b3a.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711697; x=1787316497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3S7TkzvGw3bZtPLPczV07Zg7pGcZv1h+gR5zT/H4IGc=;
        b=eojfjSiTRdPDXAcDBdtCStzmXVAgw09M/6nUsO205X6n+Mon7ed2vYSeHymbf6bZ80
         4AkEztVeGm1FJTJ4bWtgTJg1G9ATVHmciQeIuimjFgj714VRJ1Z5Ho4oDej8ixDq9GcY
         c4fQL2LS1Qr8h5xiIRKBrDN7alQ1C2g3NlP5C+XgN03O+ht8aoClYCsfg8j7gLVSd9rU
         F5SUD66Ma4+PJlTZXoWqvxTYLOCDQOCBsI+mEfMfW7ar1AY5WvDQ6UcM/V1qKIypfb6U
         USnVxc4mk858mH24AB8TW02kQAHc0YSaqFO1LBLrcAq3ZUhZ2kWCWJQlThvOaAY5suGU
         bYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711697; x=1787316497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3S7TkzvGw3bZtPLPczV07Zg7pGcZv1h+gR5zT/H4IGc=;
        b=M8NxWQZmAJi8HiCAy30iLqctX0hDvdgazaZn86f8bAGawmeES0aM/GXuiMdUL7XHC/
         nfKl3nvtWror22JJVAxaraDJjW+EC9wxYNOs9IXvqYR2oQILes25Tn7leHwJwnHfsayv
         IS289F1aHn6GGCkUe2dSVyD+F3uLQONjJg9yDmyAaWJYO750OM5YY9sqnOY0gU4SD3WD
         5dSOSCFDJotfs1R61FHIgLy2fZM8iddk7+fRVehxMOSAQIO9ZgmbBiZB0Y+eZoQTkFbU
         i1Der4VHd3vbKPl2GSfm9BQ26r6T6znHIiRslSSeM2VS8Te/RLP8S495M1INOnmKXAO6
         l5TQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYR7B+xE2zYKMItQTQ71qOtPJTeSnI/d2X05JxxAI8q9th8APV8zbzk7OgRG4ngm9SRfnw7Evj54Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiqqtc1gBN0cUFqONjX/9gKEhpHSyy+JynGSQ+JRR/NSOJJ24z
	TjlqDILh8Y6QyeDLe6eg37NQgx1V8KjEqU9G0BidcmpK0X+nqUlXMIPKGXmbR2xHmNuSeyAQKKp
	QXSBqY98P6ifKtbZr6EPBaKfsoI6eyDfJFHdCw4bH4dxQNpTZBOHlt3WOqODr7Xk=
X-Gm-Gg: AR+sD11eBTljVxslseW0Gq6Dz9lfNkHRixn/dn1atIaLiNSaB9Eo3S8GekaSF20lSYu
	5+s4iZhqqoHdIiPAuHJ06u+irHrEKrfokqsN7oAJqrwhUr/MF3ystKflA5f+fG49dpTcqC0Jb3Y
	01SgCY+W2G1wS5CwbYrEW2DuPCxsgxKRZMawn+owzYEerkRFfhcGcIiQNPvm40kcmV9NNpe5rxt
	r2KgnFZpYXedR+aw8qBhjQZ6ApNA5knm4OPxexmFi69lOb4eB5NqJJCIUtF7xMjm+T7eX3MDyXH
	quwR496S2O00G2APHJVonMFeS8EqunnaZqznr6jlxFgBJeBDPx+fih0L6oo0QpVevwfdB5/4Rrr
	08ErNfGAjb++mSrduarLJAl5WzR1Yy+8UNGS5BDYT2JA=
X-Received: by 2002:a05:6a00:12d9:b0:843:468d:7804 with SMTP id d2e1a72fcca58-84fde37d773mr5370426b3a.34.1786711696457;
        Fri, 14 Aug 2026 05:48:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:12d9:b0:843:468d:7804 with SMTP id d2e1a72fcca58-84fde37d773mr5370371b3a.34.1786711696006;
        Fri, 14 Aug 2026 05:48:16 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:15 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:11 -0700
Subject: [PATCH v3 01/12] clk: qcom: ipq-cmn-pll: Use
 devm_clk_hw_register_fixed_rate_parent_data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-1-21c3db378611@oss.qualcomm.com>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=2916;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=2CIWbIplPIOs4YttBUTOknjwz6v70LMbQmOzk8+bHYk=;
 b=oTHbFVK8v7gTvHGVVptcQmAJwKo/GYL7M9Djo98/dsclywMurColOJQIrit1F9uvlNN+j+efK
 PGRnWyLJJYUB/GSAtjdfIcchkwTVyLV76Oas6FPsaGdOXtO6DiBJWBA
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfXwj+PrACnAY4M
 oA7INGl2djuyF82sEUV5z8tnLcf2LfjIIFVFFnQNNhcsW9BRcBqd/z2fHWbLvWuW9cWc/Tiuyva
 9Y6boLTbdv/X2vD5jc2VdcExqSWeHlU=
X-Authority-Analysis: v=2.4 cv=Z/Hc2nRA c=1 sm=1 tr=0 ts=6a7f0e91 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=abD0O5-mJzoiGkpUKuEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: xMCvDv-prDgxybeaSAS_BmbXe-xds4KL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX//cOeKYVVWLp
 i0szXIsklxWKQjLK+tQBYg8J87/ulqwD+JQHcSgtSc9PPFtZNx8tkXqCkbYblaApx7z2A7j/Gpb
 v1lIFhm1KIOiEOnPOc1X8X6u3akT0iWrUY0j+VyRPbrkEyf/NA/B7aBUUPAoEwxRAJtSKTpOBS/
 ooyDW1+ZVxcGBtZFrxiUI0Ow1RZe/HfXTd2pUk3iZarCYnwIxOe4ag1djmZd8kRiBA6KNTnLNJC
 rwkIuEpkMFAccp0j9eMakWgofs1+Fcyr/oan35mNYiJ1S9Kt+8Vdmv5vcolBDHYQPOA1PUMLUjX
 K6AgnXI24gIfoqMXCXH8y513+5RtGrqnVq9SiasINY/1KvMp5zZBNciTtL5292tEcBJt2Z5PkVX
 EtCl0mJQLswjJl+0GPZLKqj/OM1cq9IjeX117/P3+ZBIvg3lBlorv2s8BS2hp6yLNZTQc7csP6F
 hd8aYvjnQyuM06JasvQ==
X-Proofpoint-GUID: xMCvDv-prDgxybeaSAS_BmbXe-xds4KL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140097

Replace clk_hw_register_fixed_rate_parent_hw() with the managed
devm_clk_hw_register_fixed_rate_parent_data() so the fixed-rate output
clocks are automatically unregistered when the device is unbound.

Since all clocks in the driver are now registered via devm_ variants,
the remove callback 'ipq_cmn_pll_clk_remove()' and the manual
'unregister_fixed_clk' error-path loop are no longer needed and are
removed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

