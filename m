Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19872453A54
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 06:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085613; cv=none; b=me/XAxBJ4cai+XBpYPbh2P2+1aDViZZW0sNzmHkiNHec59bRhLsDNZC7jpmpFNP8BFV49MdeoEXK0GwfxrNVsd6iB4PMdQ1LxuCxnmxKDvNUjL+nBEMgZlHDmQj4tbO942kOnrKIHNSTVfcueB97Us+7m4KyoyFr+UIww+Wq5UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085613; c=relaxed/simple;
	bh=qWuwbIrQ7RgJGuhrwovJePA4VGYgHtm8h3XVOSoUQ7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SYohZL3NJGYUGj7aEGVk4ZYr2HHbjOnxidUDiEMXMXzf4urkjib/gCVIAHZmUtOsXVFZSlWaYJ8ygRnzTBPMTd6nVWJjBJUqlEUkMxQ4q3qVtYZYdsChzZZ9kdV6WE1GOJ8mxbsIf3HX0B0svblgKQGc0THhD9luGfqT5EuGEv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLcmWz2K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=exJzJ2c/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLcmWz2K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="exJzJ2c/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GpOx3519252
	for <linux-clk@vger.kernel.org>; Fri, 7 Aug 2026 06:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NSWYtsf8kz4OC4IWG7G4OxS5M+rGMhwAuutFaCEaOZI=; b=PLcmWz2KDyrqO1fy
	UIfWj3bnfpZ1XMaSTA0Kln4C1Gpgs77cRM9/jfF+RS8hT/swm40tBOtyPbby94oO
	rRwKEsr0k4eTBiRcwsDxSXB8n0HLH6NMNwz6CT+Mz3HHYiF6UeKnl7iqKhtRg0ij
	yvdw4905LUQPBz0CgJCTsHcfiVmv7lRKgkfwsBbYv5EnP9QhfL0etpZss1BEFpE4
	bO8rAREQI+79heSKL/kk9K+4zWJL53I5VV2dkJ5wYivJN2TXexlnchsj6ntsvMD6
	DZqbFfuHx3Q3sGrD2jeQl+5Y37whQlfIumP0gGNc59JmJKJIxxBuJcAel/WyDRfJ
	Olz1Zw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6s2ps0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 06:53:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8486ffba174so7127525b3a.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 23:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085606; x=1786690406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSWYtsf8kz4OC4IWG7G4OxS5M+rGMhwAuutFaCEaOZI=;
        b=exJzJ2c/vP2Y11NgSMqebTOv/uYdWII+mwRung48+PNcGP9lx7DQ1Ep7Jbm+ZN8LTm
         pw/BGGgxeFBcLaVfbepLczXmAT4l6OFa5jVzq0Mkg/3up9b5SUCwKlO75CfApLOncXvW
         K9Tg/Z9Kw/FVqHPAasz5/Znu18sdkwUI+ZUH7ChesKi+rwvoJF7QyRiVsIgo+XoQAmBu
         iuV5S7KFTlFAAuhCgSlfGD3NCSIeeQqseLROWP4TpFYqwYCpuAypntoPKnEvALlCOj2W
         MmEfYDxtpJE5MV1MKRoytc0iPO0hkDECDG9priTcGL2LkJ5bnPWr9W5zrR6WxuR3zKGl
         cXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085606; x=1786690406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSWYtsf8kz4OC4IWG7G4OxS5M+rGMhwAuutFaCEaOZI=;
        b=l0fB1EewtCEBRwKzx4Bq1mzfFuSVFT9HkegTHu/b2KfG+dTw7FQdUiX3arVqfH7Z7P
         RwuGVQIhenibYf/Mp5BnPbB95QHfptfF4gm7LFyRGGMeG9kUtDBRkpAf2jAkdNrhNT+5
         jdfLx/Gra6D4X0xvTK90diMaf5MHcinN1FZDqf/Dvt9Yi+WT+B7E7TyDWNurKk2Wy+B3
         aidtR0TNYmN8c3sBmFuShdKrpvTiPolHyDTr/iuMMAdMRr9siACaaptiveDWjf3fWb4N
         Q84GclA12DWZauzHklL78/3BscyGVb+gUfMA2d2aDGYFPRT8/NlCGua5YHI2uKN2F197
         hgEg==
X-Forwarded-Encrypted: i=1; AHgh+RoCQwSj/spVRdjUe+GRKrOnQ3q9dNMHQWiVFKNwj70bwWiO6SAOYGSoz2tY/W7sVswcBbtQ17UCy5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxktSTiiFTj1fXgKVW/VZIIw1yH3jzFv7QqLEWP453EolrVZ5l
	MWMKvg3Jx+MFdSOrVH9zNnmE84hy3LrSSAB6vuxybZaaDDIg12wfFO3m/2wHKh+eYO2nV3dyr/X
	8e0rMGAnCv2NjRVpjTcA7K3o06NgdJoujXFMYtAR1K+Dl3PdolbP4ZCOzfBQkec8=
X-Gm-Gg: AR+sD10OR2U5H2KdiVmZGQ11SN39KWcXoZwR8J0e5I+FfPvEtpZJbkF9KJiF5lWQPou
	kWanu+VT8AkEnwpuprlqIQjXVk3AzxpAJdqF2HvgHr6rNrrBmRUthwFtI4jV3ehZe9oXjD7HU4r
	+fZkfifssOWs8txUGc/+F3KaxH+so1fd/ZHwEpdJOeF9VAxRQ/+4MrgODnt7GLgepDxApcHTOY6
	LA5iFtCwUDtqH0cxjIDNyyp3ecmjpgh9BgS8clGZVGM6J+ZIf3NFHQtdSRZoLRyK89moDaQY08S
	bgEbBD0R/A1ysD1pE0w1GqTZOo+7h03iBMAfmCDm+TVdbFOpM0xVkVQRapdChy+82PnrqslzBWp
	gtmuG9GjzdRJSWmJoSRQKUdTPIDQa0FKv/pZgvTK7ZZ0=
X-Received: by 2002:a05:6a00:194f:b0:847:8971:87bb with SMTP id d2e1a72fcca58-84f2e00ea47mr19192674b3a.21.1786085605914;
        Thu, 06 Aug 2026 23:53:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:194f:b0:847:8971:87bb with SMTP id d2e1a72fcca58-84f2e00ea47mr19192637b3a.21.1786085605474;
        Thu, 06 Aug 2026 23:53:25 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:24 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:10 -0700
Subject: [PATCH v2 06/12] clk: qcom: ipq-cmn-pll: Add PPE clock support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-6-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
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
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085595; l=1768;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=qWuwbIrQ7RgJGuhrwovJePA4VGYgHtm8h3XVOSoUQ7c=;
 b=EESzC3jaa1DxBnT1Ykx8jPGSvZu5E4SBnVB8iZzBtY9PAwWBnPWf78FYVRThVFUXT7+L0V6/3
 cd5BI3Up7LpAdDmlKNOSA1G18sCNe6GM93Br9/JwWKqGGXDUfA04JCj
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX1q55JnsbH58A
 smpcxtHMQufSjfvxbV8W8Gc9iwQMeHDlhzL8/TwOpAVRanp0p2ijKevNhNRn1LCQx+3e+DHBnio
 NiN8gu2shDYU5zrfPDrSkPIAdMfp5cA=
X-Proofpoint-ORIG-GUID: kynlvdqzGELphWUrrG7tbf3g-_qMMbwI
X-Proofpoint-GUID: kynlvdqzGELphWUrrG7tbf3g-_qMMbwI
X-Authority-Analysis: v=2.4 cv=B+eJFutM c=1 sm=1 tr=0 ts=6a7580e6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mAYwyletAeVdbrWGRpcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX5KiJCZVlUDT7
 zhCtRzzm6jT0/rryhBP78bKI7V0rNhQqxwXTWg9LUb9vEGiarIecx5scefrneItDatmXfqUVo+X
 pCT/YvGFYPRalXi9jeGUySbAjqPI+bgWKSMq/rYuGeLhZLliEdd9DCzII5lz2w/5mLuJJHk/bdr
 V0G0mj1H1FamPQWPTC2uohmKcPPn9wEKRyirRVP6KUJCk/9NqEQ4aoVEEBhpfC9lIYyW7dlSre6
 vhunPpz+ReuQv/f7nrifar23nEDraOBjNIvYqPTIcwWbj17SCX09i9bPdrRvjONAAfpF0uI/QO7
 3ZWWJG4PTLBW4NF3SFgwtiid7+Olw5aPH4ivHznG1fQ4DKLFS/Qj2QM4ovQbIeJSd/SSE6638RN
 8DM4i+x0FH/wNmAmTwApYTHmYDy8arNO/baCBdVaIvrx/V/i/Jt2ieDMAfYECApXW+VVJI+oq3j
 t/AYUpC5gsuLMVKLK4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

The PPE (packet process engine) clock is derived from the CMN PLL
output divided by 2 and then further divided by a configurable 6-bit
divider. It shares the CMN_PLL_NSS_PPE_FREQ_CTRL register with the
NSS clock but uses a different field (bits [5:0]).

Register the PPE clock through the ipq_cmn_pll_regmap_div_register()
helper introduced for the NSS clock, passing the PPE-specific field
mask.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index c1b00699eb72..a24e57b33c6b 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -71,6 +71,7 @@
 
 #define CMN_PLL_NSS_PPE_FREQ_CTRL		0x98
 #define CMN_PLL_NSS_CLK_SEL			GENMASK(13, 8)
+#define CMN_PLL_PPE_CLK_SEL			GENMASK(5, 0)
 
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
@@ -90,10 +91,12 @@
  * enum cmn_pll_clk_type - CMN PLL output clock registration type
  * @CMN_PLL_CLK_FIXED_RATE: plain fixed rate clock
  * @CMN_PLL_CLK_NSS: NSS clock with configurable divider
+ * @CMN_PLL_CLK_PPE: PPE clock with configurable divider
  */
 enum cmn_pll_clk_type {
 	CMN_PLL_CLK_FIXED_RATE,
 	CMN_PLL_CLK_NSS,
+	CMN_PLL_CLK_PPE,
 };
 
 /**
@@ -464,6 +467,12 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 							     fixed_clk[i].name,
 							     CMN_PLL_NSS_CLK_SEL);
 			break;
+		case CMN_PLL_CLK_PPE:
+			hw = ipq_cmn_pll_regmap_div_register(pdev, cmn_pll->regmap,
+							     cmn_pll_hw,
+							     fixed_clk[i].name,
+							     CMN_PLL_PPE_CLK_SEL);
+			break;
 		}
 
 		if (IS_ERR(hw))

-- 
2.43.0

