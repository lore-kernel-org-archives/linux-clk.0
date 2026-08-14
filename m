Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE3215A85A
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711713; cv=none; b=McWxiujY4Z+6unww+Ki1dtfWAkSmawGg22qauEgAzmelLWrFzJL3SN0m6XV0ATHLWhK0JN/rPFaBNRiDdFboeXZ2RPg8tvsTfIAeamWxEhriVb/dpYeKVpBJSrbRE1mxVYbnyFoF3X3qHHQ+TAo6Y7j/9T/XjJApnuRU2ZQqwgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711713; c=relaxed/simple;
	bh=lr6+NNmr4NsXc4/LaBfiY5NRMqq+fb2nCdq1JFVlFhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RKVNAnWeq9fuy6OEqN11MkzqNhZpyRrQNhs7anaMIY428KKxgJohgAaC0iaIiVzHaB+Qr/lvhqTmDOZp2Ux9xH4ipiwY8KhBz3zhrgAEkuQMnlQpF/TN9h1qfFzWrlq/AvmcE9EOVq+zs/dw1kmRrynVdTJIFwP01RCgx16pBX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyjxSLZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SiE3Ay3c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyjxSLZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SiE3Ay3c"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbFuj1331304
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DJHFvo6hxTzYFahimp4Ktu0UzNaLM28tZ5wYmk0j+x0=; b=LyjxSLZExbDJ4yu1
	L8DeA3kWAFIuR8yVh5/IO6pEBx8LYs44OVq7l7Oa5rTI6HEvF0fBPZEA3eMH6Emn
	itfON0NZKeiirg1XnPCdKyNMOaQ+n6B7by9SZjK9FYNAdUnw8HhfxePLc0UHoYoU
	Cr/0jn0zzxA87L6IYur7nUJdbUzmzkXo4Mp204XTJf9Idz1rAaTHzr5AsnSUnvQj
	jbwBCQzRn9sfSn6zVA3sEcJYYdgPWkcUgX/zFa0751eHrixQgNS+9rDu710TVc4H
	a1DIzV7SOhH0RjLc3LRmXwiZ8+dXDR9cO5dYBZOb7lCgYPKbSb9c1K5o0ZOsg3La
	E1iu9Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g21d9ghnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8484ba00601so894934b3a.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711703; x=1787316503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJHFvo6hxTzYFahimp4Ktu0UzNaLM28tZ5wYmk0j+x0=;
        b=SiE3Ay3cDghwbtUK3A/FsO8X35non+Ad0/2dOMkAV2V//kP3iBrSlhn+74BNSfylSy
         ALm8b+IzLgAlOgcfiexPFYCaKlUh2gb1ITtRiCqM3ahMAx4xfD4n2dZBQH+MmEMKT5zE
         FRigoGT7i9A2VxA5sCf+PQz5r4Y/VzQwa6hmekdaBIN7Jc7rQF53e1V+2s1jspwtTVAl
         vP7PeCRq/HiUmne37ZU9LgXZu+rbAoqTa4AhibQdI9Xa8piYvA4pjnm4jPSG+GqmGGay
         uYLCU4NsNZQTxH/Z4dfLgTwSkKXR9rTJ808TDltKLIY1wZxbRS1EnQqqfEbpyJbbACOC
         K1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711703; x=1787316503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJHFvo6hxTzYFahimp4Ktu0UzNaLM28tZ5wYmk0j+x0=;
        b=kfqxt9/BhqhgLbjWS4UGwGT9wQ0WPREu5ZyfmxASFxZgaApIkJOXWoY5QU9Ezufx6B
         Pn9M2ZePV25rVpJzScxzGkJxjG9+FB5W1RYtyNBia9z0x90H6Sete/HrT7pibn/zM2n7
         eJyYNh7d0nlku8uHEojFjLxs4x9LRQRjXWNCT4USkcEvr1cUVkDcZebp4lLLvs3fQ5Rx
         2SX1xlWNzsH6SVtr9DKBqtUDmQR8f9IQOhiYqdXMhOjvzlSTeCJh3XhHU6aym/SLu1AG
         Wef+JSM4CQTsImKOA1HlAphzxU2INnNOlv2aAqn3Ae1uo/QBXx7mf8hIpVk6a7idF1iz
         nFqA==
X-Forwarded-Encrypted: i=1; AHgh+Roe3hGuQLTaCowMjrqlAO7E0Xils5OvwYImxeg/3ciyvn1vPs0sUmItyFLnTikijApqGk6ogKdH5EU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHf0bAgRmXBPJMrivlABYaCGkiNtB7VstVINi+oZzfCOfomdWQ
	fYOJnGklN9GuFnlkdgSO9Hlt9Qy1tX2n/sViL4bs8mHcv1pxdbWW7jOV/HKaanDuQCQMU8xIA7l
	ayaMza7L1xtd6+fNZ2/VyWyNk1LCP1BiZ6ihk8/dpCDSZeDofmT+HxXc9knyzOQk=
X-Gm-Gg: AR+sD10uNhoIweuWdqqndHGsrYhQnY1zV1X+FmJgTsbCS1V85NSel4C5tVClWXMiR6G
	bMBQLONn5d2U326hN++BWKiK6ADkXnc/KvMPlxbQad6A6SjX6W1RxwfO/O+IgyjIcvjatj6ysGa
	mtDPRkX4/Ph8H4Ixq6TQe4XLF89dxAWuJsSPIqs4lN3MAfPD0MlZPbOprEuMAzNUliBCRa8rJL4
	oLssgu11mtsqO4YZfIxRgMVVlKKGElACGHw78LEeFqgNQn1lDi/r5nTdlpx4JzXRnx9/REszfxU
	jLLUdQxWSF3QSUpr8C5c1SLkb4MfR6ubHfn659AkEeO/lpB6ewijaSr0PrM/a2ghpaHIdOl+njL
	PDg9OcEWP3UBmVYzmNyZKEBpy4uhs+AbbRSKCCWnlcZc=
X-Received: by 2002:a05:6a00:4648:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84fde2363b3mr5717568b3a.16.1786711703190;
        Fri, 14 Aug 2026 05:48:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:4648:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84fde2363b3mr5717489b3a.16.1786711702444;
        Fri, 14 Aug 2026 05:48:22 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:22 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:16 -0700
Subject: [PATCH v3 06/12] clk: qcom: ipq-cmn-pll: Add PPE clock support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-6-21c3db378611@oss.qualcomm.com>
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
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=1832;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=lr6+NNmr4NsXc4/LaBfiY5NRMqq+fb2nCdq1JFVlFhw=;
 b=keqbc3eq5HyDZ3AiMpGWUIP0BGqRZMGcXsQGivYTRNfEPjqj1Sc4gmlYZWKoaFi+F/Qi0PQvV
 m9388r/9QhMBlmJoHrSCxEPMA190eWOFm1zPBcG39HEZkowRBk2vCx5
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX8RnSyKbLX4HD
 9VdZ6Lh0R2xK1WljK/upt+zGmUBogrnd7tREeRip+BtxpzXt5NDDIXrDj23v4kpO5xpsaRwWIdz
 0qzms+/Brj72xCrX/WREYcWJ/5kmOSA=
X-Authority-Analysis: v=2.4 cv=eqzvCIpX c=1 sm=1 tr=0 ts=6a7f0e98 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mAYwyletAeVdbrWGRpcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: DvGgS0j2N-Lyop21bLde3CTlqejgG3ss
X-Proofpoint-ORIG-GUID: DvGgS0j2N-Lyop21bLde3CTlqejgG3ss
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX9D3At97Ckq2J
 QPaf8ar8a/pbIhM/a616F69GiAEs5qmlrtaAVm4oXZeK90KTPSPDndS/96Rv1B7dTqpQak06bsu
 drfVKOsXg8AOMIU4xsyUmKIXEmQaIhXg8LFHfskYVUoVPG8OaNIBGOx3DzTB9GkYM9CNfnR1J4N
 uZEjFjEuF4mkiPXc7cQACLCF1guB9qsaWdF+1qMEMfT3yhS+NaIqVIJpywpD0AcFfQfScGH7rtE
 kuoQTAK/kB9vl5/sqOgho6a0VtMb/ftCSBdztWoHZs5w0UI+DUEWJf7rRpGUtIW294sMMZf8O+t
 W4FA5lFFKRX7JxuSVliXXqSpuNGP/y6n7cHnTwKWKCw4ydmUJbEsApLejAUyyiYlrJliIQgvs1G
 z0Xf+4Tm5k5B6OQKp/99PtDELEiAq2Tk2XAUZrtXFNaw1PM6v4dmYLo24cz0n/f1RaH4ugidXja
 iM3+C6QUr1wegn3il8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140097

The PPE (packet process engine) clock is derived from the CMN PLL
output divided by 2 and then further divided by a configurable 6-bit
divider. It shares the CMN_PLL_NSS_PPE_FREQ_CTRL register with the
NSS clock but uses a different field (bits [5:0]).

Register the PPE clock through the ipq_cmn_pll_regmap_div_register()
helper introduced for the NSS clock, passing the PPE-specific field
mask and reusing the same cmn_pll_div2 parent selection as NSS.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 59978789f493..a5c2224ff22e 100644
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
@@ -490,6 +493,12 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 							     fixed_clk[i].name,
 							     CMN_PLL_NSS_CLK_SEL);
 			break;
+		case CMN_PLL_CLK_PPE:
+			hw = ipq_cmn_pll_regmap_div_register(pdev, cmn_pll->regmap,
+							     cmn_pll->div2_hw,
+							     fixed_clk[i].name,
+							     CMN_PLL_PPE_CLK_SEL);
+			break;
 		}
 
 		if (IS_ERR(hw))

-- 
2.43.0

