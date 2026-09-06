Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E793B14C1
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 14:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704302; cv=none; b=iht6WvnXBa1owIFeyKqTVefTcqe6RfuLFjGkvmOE+i4VPU8BujQGxYk3Oyri8r04FB0tIN4QDiXd9ZYKZpHQu199FZznvfYA8JEEU+KHaQHp0txuolrf3kfsV73FccdfphygKacXsVlx06zp23USnXoc2NGwzVsKXbx099gint8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704302; c=relaxed/simple;
	bh=Vgg5qOBlAuY2psZdQdz/yQNc20cNbn4KGUhkoi+GBcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=es/rJtA1+wRgM/Wvo9JB7ypByVo1w6n5T64YlTZz+LsRiivlNF9z3DmQYOXD+WEx6hYSrdqYg00zlVjresmfyp9UhBbx6rZ8a4JcJOqs9zlscAUrvNuq1HlTiTaU+7WrVT5vsP4666wHT1FFmJ7kDyyrH35oj5t2W42+pzXSX04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTc96BYJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFClkyUL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTc96BYJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFClkyUL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68600UDG088264
	for <linux-clk@vger.kernel.org>; Sun, 6 Sep 2026 14:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEGqd0P/wm/cs6GRPQOSfGCnfuqJbRSnZtgx9UzuNM8=; b=hTc96BYJUVKnoPNl
	pAAN4ZGgEXpzuKfYsTSurSGY2E0N72uQkRmMzFDy3ldJTeSyFepz4I/w3ydxLIZ4
	1LV0Y0kIvBqb3frUnp/s9LJEanZAZ+qjOXjIdRlyRhHzqRfGaZbYd/r2cYt+F/3I
	+eUeAa0k4Bvl2ZPl+YkRP10NpdFJFwFMN4kzg8oxU1D4i0cI2h08GGRJnYX8ycY2
	NdJjOzCFx5nZbkEJAuCQ0EFGC9A3VDsza3xz/74Y62UTlgis7/apxnbiKzgR9sMK
	o5pXJTyG4fcvLIW9TUFqd8yyf4ZW/xAVAs7VCe4ghKlJ80OJp8/ftBH+sgBRa2Go
	uv1Dcg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany3gx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 14:18:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so526341a91.3
        for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704298; x=1789309098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEGqd0P/wm/cs6GRPQOSfGCnfuqJbRSnZtgx9UzuNM8=;
        b=hFClkyUL1T8rqV4v7fvIyb2qkcKh2nmzwXs/PnyGQ7rkSer2SOoGNnaLMh7d0tdKPZ
         72cJzSdSGDrax0dG4TqTOpVWGkirsgm+UGdB4/OfZVKaI6dyGp9R+IJ7VXcF2HDvqGrm
         bgUh52zxJ82L+nM80D/aOxWi2yFhqbwbaueJPAO2ZhpVsxJAAlCqqe84KkYmuOvVJrZl
         0AEach0LbupnKIMN3mORY63+41skBzEO+GisqzySTs3JlfYAU6VbQGnLL9XB6yN+I7XC
         Nie7n1XHuJjYWM4hpmY7mxgeOzqVWD22pR0RJQGkux337TL0zFJQ1Dqxv8o9uOa30Cty
         ATDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704298; x=1789309098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEGqd0P/wm/cs6GRPQOSfGCnfuqJbRSnZtgx9UzuNM8=;
        b=bzvOrzv1UWCcIbLznoYr7s5n+V9vrQzH7aS8xh86OX+EDctJdo2YAV0B2diY9/ds9q
         Pxu1y+sY4EPXnoahVy6C8eigD6yuWAD/xvg223Qb+QOL4jdC2dCi57wagjBRn/+MAMaT
         KERu1Y4prXishaeNnLe6Ki7c0E+axhMdUF9UuoLLXxGh5+eacAc+Iz1XGEae7mV4wati
         wvNeuEYaIWfBvFHZ2nJDUGpfYd+BIgFXYJwmLixAhlBCnjZ+p9h4BG5I8AWQKzzQzsGp
         V9y79anBeSXdvCMwEU5mL9b4zZ9lCAIktjecSGmuWJqePwEpw6pZzKvuSARjwAOb6uID
         x2PQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3y0OiroiBMVvASecK3ayqKfYgKTPZd8BED4Kmu1SVdvfi8q+hyPwMv6e/mLdDSYGv5edcqMn8n/o=@vger.kernel.org
X-Gm-Message-State: AFuF++lgIXxcVOwXHDgjQA+cpSIFPl5tRqCbbOA2awmAUZPEnaIAWeFR
	V29SZAmUBXCx0iLss4gK7bPZ/Pm1XKOUpM6HiI4BmCjx/TJ74d0pHl8Hnyn/4YYaGLOwesETmvu
	WwPOlhNDN1POpbLD9M8hNkEaiW9b9k153XWua+FgYNSDs3MFDaxl8fUjcTi2t2lQ=
X-Gm-Gg: AYBFou3mybB/UoTivr5aLVyHWWHgxW1Ku3St1oJFsHF5qhqwWUi2MCXjv5yCDRvoppi
	fyPTa/LNZ3ptgp6kfVw/YjkE58P4RILemCapeGIGKO9ujd4fUMay8e4kvCejGlSZUdIlaDCUJ0V
	5EDzVrdUZ4jdzAID81olkcWARJdClotAZWVdtn5dhCZz9G9SYgstWMZR9EUdugZ5OK/R6S+jkgN
	4yVot/Y9V+ieOlC3PKAXymEMaru/jNZAxApjEx7XVnDkr1njtPqx1vPa3AOHwHX0Z4lKTB+2Vmm
	OArcxzF5G3QrZ6tr14QNXR0WqSJ3jD8wjA/F3cfRt1Ht8Sef46Acj3eArOUOXjBEH3hqmCl3f7G
	ropo3gcM5YicozExvm9pM6lEACqIPH87AyZjIaXfhHFg=
X-Received: by 2002:a17:90b:1d52:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39b26242a20mr27844716a91.19.1788704298109;
        Sun, 06 Sep 2026 07:18:18 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39b26242a20mr27844637a91.19.1788704297575;
        Sun, 06 Sep 2026 07:18:17 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:16 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:12 -0700
Subject: [PATCH v4 06/12] clk: qcom: ipq-cmn-pll: Add PPE clock support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-6-aec5ed642f4f@oss.qualcomm.com>
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
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=1866;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=Vgg5qOBlAuY2psZdQdz/yQNc20cNbn4KGUhkoi+GBcI=;
 b=FHQn4R7jhAPaAp5hLKebcawSTj2lgvwbZyltpZIuAnVNPBwGTpOnmxCv7zIqxTAWa6zDw8FuC
 mhTYFJl/ZG5D4D6RH2iPGJsso++Eip4qt3eFjjwOOxr9Qhxc02Vhn1T
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9d762b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mAYwyletAeVdbrWGRpcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: cNYYMeFgjw1DmxW_7_3i52UD8AbOdV2r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfXzcxTO0w/fGFP
 fBcLMyuMd/fmRwYqSQOOfMlh2iGEX+cZXS6s5pcuBY3avjn2/tQb10Oo4LZ4WldFiL/+5uBjKu6
 4YKssD8sV5dkQ6n3sXZq8G+bjBs72R8ccj8RC/DlF81l74WrTY9+kB/f4vWuNxxMddidq7H+38S
 IZaUcy73/ceh6QEAN35VS+yYljwm5KONJvAu1GaWea8kcGNOzz8J7t6a+fuhU8FcDA/+ot1HGgW
 B9wiKFtrhxxws8Cxm1iEb5rWerUe7GjCoDeNgRj6gvTUvJVW8m2eVH8yF8PRa9+12MHJrKsr8gm
 BLc9DGNJWftj7maR8ENn8oqKJHz0pZ1yqlTyKaIfwNylkCLNJxgEAn4CjwJZnkKBx1tc4tkT3LC
 i3kVhNkYR0sXGfWKy8M3iy6UWG7Noi0Cb9SZynhD7FCURNU8tUu4kAhldGtYI9l8gYyY1qi91cl
 lbZrVScVbDC22f6kSxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfXy4gDBZ6sWkvT
 Loy+dsGdu/IYJb4enznpDVPTmeOgScyOcRPT6n/xMpYx6U66gGB/uAAnBnn1CploelVulm8LsTv
 cgNuMQdiit7QwSVK3nS3M6XiSAsvtNs=
X-Proofpoint-GUID: cNYYMeFgjw1DmxW_7_3i52UD8AbOdV2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060159

The PPE (packet process engine) clock is derived from the CMN PLL
output divided by 2 and then further divided by a configurable 6-bit
divider. It shares the CMN_PLL_NSS_PPE_FREQ_CTRL register with the
NSS clock but uses a different field (bits [5:0]).

Register the PPE clock through the ipq_cmn_pll_regmap_div_register()
helper introduced for the NSS clock, passing the PPE-specific field
mask and reusing the same cmn_pll_div2 parent selection as NSS.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 7cf2b09e94cb..44d035870a89 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -72,6 +72,7 @@
 
 #define CMN_PLL_NSS_PPE_FREQ_CTRL		0x98
 #define CMN_PLL_NSS_CLK_SEL			GENMASK(13, 8)
+#define CMN_PLL_PPE_CLK_SEL			GENMASK(5, 0)
 
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
@@ -91,10 +92,12 @@
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
@@ -478,6 +481,12 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 							     cmn_pll->div2_hw,
 							     CMN_PLL_NSS_CLK_SEL);
 			break;
+		case CMN_PLL_CLK_PPE:
+			hw = ipq_cmn_pll_regmap_div_register(dev,
+							     fixed_clk[i].name,
+							     cmn_pll->div2_hw,
+							     CMN_PLL_PPE_CLK_SEL);
+			break;
 		}
 
 		if (IS_ERR(hw))

-- 
2.43.0

