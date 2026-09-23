Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE38568FB8
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 19:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191319; cv=none; b=cWlRa8EJbuagV61dScJ4962T5kWE0/9XHwsGcatBxO0JgAUdDyAlAbwg4mtNjdnYpPRuh8UUkbP5xQgGMAnn1m+6cRR1ZW3efaiAS+cQJsOKW5ieFSZtUBTCibXJFZrpY5eIyvL/2V5A6zcBPANnDySp9eEvfk/wTMAZsvrWGqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191319; c=relaxed/simple;
	bh=ohYSISOq06N0qko9lQIINmh8oV1XAgSUzbXRNHalapw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WAIzpTuq5oZ4GPrjXOQ/f6ZvRm28W5NxmLOc3t1UqwLkhRulYcuD6g1RhF/ykTVujVoESdQHyKO3jdV4HUzW0lxEUfkIFMPduo+ykqjgmrn1ZPhssX57EfP1aVoLrh9RQxmqQDebZsfv5YDrF87zDyl79zpY2/gqZjlcL9EsmRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLBtLebf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KF+rsfmS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLBtLebf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KF+rsfmS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTZsc740272
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 19:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yncM0a4mFwW905Dld7hPX0qqrUCWQieBsnAkpGF5H1s=; b=JLBtLebff9IsiU9d
	DVksJj8ihP26gIeD1PEBkECAykY11rJqs6/91gwc844sn8XTjZmMak1MQbiTkjWH
	UUM2wtzpL/4HM/5xQgoB8zcWl5iKS04T9fnpVuRoLhQNILWcFDbWEkVa869ucycf
	Icw00LQw6rtc2IIebME90dyqRFA/wgDmfCE7SH0HPbiPr/9GQg/2dTHAPXhe74eE
	y4+F82VGyZEIJo8qr4/l46caV+RkVsY79seeNZnCqQZ//Wegw53wn0uWDFwvfGzz
	WXp5AMCvI87VpXoXUnV5JoIDGi/a9JxxJWMVNIPDkYD086BAn4Oj1rhmWa/XN0dM
	4E2IZA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjshn4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 19:21:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso1590348eec.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 12:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790191309; x=1790796109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yncM0a4mFwW905Dld7hPX0qqrUCWQieBsnAkpGF5H1s=;
        b=KF+rsfmS8LcfxyrRnL9BGzl+zOBaP/zr9cji8PjaJFoYgV2oahGT8wWRMbepNSG/uY
         H7l8w7+tf6MmZSVAU4Yy2mPOiYUrdZFQYENgyna03RrpoYBGEt+7x8YE4w5pdkdiP030
         6KyeBDlm1LCDPFBgcNVFFVn5OTa4KdtyYRYg74T/aQ8c1MawHZ36sXvu0IpWkT6UML4n
         WWUr8F21R5dI+Fv0t92Kj7UDT2bss2av3eDBL7v6gbEoPxbTntQNgHDETYOwmN8g71eL
         gCrgnXWCs7AMeE7L3mg8hZY1kFPvg3OzLaOOGFVW4Qtn8VGhZG/tfwgZmWMMBldSR7x6
         7w3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191309; x=1790796109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yncM0a4mFwW905Dld7hPX0qqrUCWQieBsnAkpGF5H1s=;
        b=10nO4M7zHSvxKLSMgypQQGsj6YkRTZ2ZkdUo6fVUX4TIes8NbhqGySnlv1evfhpioL
         b86gNYlkvcTmbRtbNLC874TSyncNNHNp1C7nOFvY7g9S611lgvzkimtF6/lwbnP08C/u
         MecWD7as4pgjecUIrZAgGjY5xTFpZQP2Ug5qCKrleo07emmcML7ZcRfwShcZyntWoQAE
         SCZQeVZ7XVw/LwvmI0zsMYxTqjNE6XKh7yuhNyejg2GJzYfyRTEfIAV6IzqzTLXh2TMx
         oTVwVRZhdwYbOcyiSjITduD76RXTBCG1V+bIAYAX7iJDvuQINSvq8FPuA6JznKclKfbU
         vbTw==
X-Forwarded-Encrypted: i=1; AKwUvBxjaD1uZo9Orr1nr/8tLVrhZ+BaZcEeZdeZ1owrpKXqAVrLD2nP5BjluQ3nxUcr+pj8SzT17GpWVzY=@vger.kernel.org
X-Gm-Message-State: AFuF++mp14ntPUJfVNsQW4PZro5XNoykLp1v27OBLqlGlVgiCbQIuinT
	k/AELoSjoDFzTerVmC3WYwP94IR5zdaX9/HNL+8VTs9OrqnWXU5EOTwzrRIpOHr3jLGb2iV/ZWd
	gP/ltBaIGWpW/4MW+uh6hyIJ9chON7hOKgcIrqeJYZERsV8SOeBoqTMYg6H1jwyg=
X-Gm-Gg: AYBFou36xaOiQMjHsRGJPAMVt7kLh0WNip1v/fz+I8JsLRirEUyNDTryJ9O4UleHInQ
	JwwvgWV2Vy3LV0i9UXMEH3ytYUxnNLa6KXMwXik8hdTFdDQ1bly/mSkJARpyrPb7DFNz5d1R2/b
	CeIg7j5xUGg2/U2F250BLW8ny7o5xW9m5MY7ttc5ptrcbiVONVv74khEp2gPVtONvguLL/Oq8x3
	W9IROFVUhqfdeTPgaO4Rn0JEz9Wt9iMT6dfVAAMvmATqoosLWWGwbvV+GRpT9wgOWI1stj3OEyZ
	W5lio3BBdnlrMas1SkYSg1zFMc4DvqqfetMw7q+iXpCe3nTz+ZHd+mcTwcRhClAdkz6TzBsBNI+
	ST43h4u00MqbJoXOeeSSbZFw=
X-Received: by 2002:a05:7300:ea11:b0:33c:e82:70c8 with SMTP id 5a478bee46e88-34000c300c1mr119866eec.31.1790191308853;
        Wed, 23 Sep 2026 12:21:48 -0700 (PDT)
X-Received: by 2002:a05:7300:ea11:b0:33c:e82:70c8 with SMTP id 5a478bee46e88-34000c300c1mr119839eec.31.1790191308191;
        Wed, 23 Sep 2026 12:21:48 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684d643sm17609309eec.18.2026.09.23.12.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:21:47 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 00:51:31 +0530
Subject: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: support a 28-bit
 ALPHA_VAL width
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
In-Reply-To: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfX5h6wSIbf31sF
 VbMdVott6CVFIfMVTkcUfYggBXF3+GfUqQGOapM0S5D25D3Qqs88e+ioeugcLqcTB7ikKEV5xoX
 cXQHXLQbOJJ2IrrxJ/CE9jm3Z1s6hltW2YIXpIS3ZA3lFbWkLc/7xenDyfAaCFal2Y+zS7JTaen
 e9F9gIbq4LPlJNTkM7Y5GEIx8b+4b6mydSDarJ3atXvWnWgTsrI0FJXlnquSNt70HV6/+OsFymy
 X6k5eHpvhhMIrGQAGlPjtjtqXYLOuxhonx0q1SbJoCJHTYoYm+G8PkNpr97c78bjWxCa3fL26cI
 h6SvamcGWH1lWhZDhE+HA84X30g8ZxmralMuByvkeo2SIypDD1wcHlT9K3NJBopEEGrIFTnx1PL
 G9xmZcKSTJ+IiJIV+YZfJJ6oWL0mqZxPfKxk+u5f71swwpAfJCqm9KDYzGHzOMMehLnHKIXYWZk
 VuqOjsYJwfXkCpbVzDw==
X-Proofpoint-GUID: bGggCSfLVdYGyADtCtt_MHUY1AXZ1BaE
X-Proofpoint-ORIG-GUID: bGggCSfLVdYGyADtCtt_MHUY1AXZ1BaE
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab426cd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iX_rjOfq5r2Sv1zA3QwA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfXztCXrs29TFob
 8bQLBLqkPra8hPWSl6a3BCTq7J8eW3i+8ynkna0aKR+9+Ez277hWxCpgZsPgVvPcHmz6l6Uzaoz
 0oolU9m5rRLGCXCs7FWfmmrY0tcaSFo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230077

On some PLLs the PLL_ALPHA_VAL register has been increased to 28 bits to
carry the fractional word at a finer resolution, for example the
ZONDA_OLE instances on the Qualcomm Nord DPRX. The alpha-PLL core,
however, derives the ALPHA_VAL width solely from the register-map layout
and can only express 16 or 40 bits, so it programs and reads back the
28-bit configuration at the wrong scale on both the set_rate/slew and
recalc_rate paths, making the PLL lock to and report the wrong rate.

Add a way to identify the wider register: an optional alpha_width field
in struct clk_alpha_pll that, when non-zero, supersedes the
register-derived width. This feeds pll_alpha_width(), so the recalc_rate
and round_rate math scale the fractional word correctly, and the Zonda
set_rate L-adjust MSB check is derived from the active width instead of
a hardcoded BIT(15). PLLs that leave the field zero retain the previous
behaviour.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 8 ++++----
 drivers/clk/qcom/clk-alpha-pll.h | 3 +++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5f16bb55343a1d1136eb07f3c050f..be5840600967942ea0d8df9e8ecfa2da763c4d23 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -41,7 +41,6 @@
 #define PLL_USER_CTL(p)		((p)->offset + (p)->regs[PLL_OFF_USER_CTL])
 # define PLL_POST_DIV_SHIFT	8
 # define PLL_POST_DIV_MASK(p)	GENMASK((p)->width ? (p)->width - 1 : 3, 0)
-# define PLL_ALPHA_MSB		BIT(15)
 # define PLL_ALPHA_EN		BIT(24)
 # define PLL_ALPHA_MODE		BIT(25)
 # define PLL_VCO_SHIFT		20
@@ -382,8 +381,9 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define ZONDA_PLL_FREQ_LOCK_DET	BIT(29)
 
 #define pll_alpha_width(p)					\
-		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
-				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
+		((p)->alpha_width ? (p)->alpha_width :		\
+		 ((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
+		  ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH))
 
 #define pll_has_64bit_config(p)	((PLL_CONFIG_CTL_U(p) - PLL_CONFIG_CTL(p)) == 4)
 
@@ -2290,7 +2290,7 @@ static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (ret < 0)
 		return ret;
 
-	if (a & PLL_ALPHA_MSB)
+	if (a & BIT(alpha_width - 1))
 		zonda_pll_adjust_l_val(rate, prate, &l);
 
 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 3a2157bebc52cd15f55381a068953f21be18f6bb..ab3b4f4fc7501df0fa3f59d741d64646383e4cfd 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -86,6 +86,8 @@ struct pll_vco {
  * struct clk_alpha_pll - phase locked loop (PLL)
  * @offset: base address of registers
  * @regs: alpha pll register map (see @clk_alpha_pll_regs)
+ * @alpha_width: optional override of the ALPHA_VAL width in bits;
+ *		 0 means derive the width from @regs
  * @config: array of pll settings
  * @vco_table: array of VCO settings
  * @num_vco: number of VCO settings in @vco_table
@@ -95,6 +97,7 @@ struct pll_vco {
 struct clk_alpha_pll {
 	u32 offset;
 	const u8 *regs;
+	u32 alpha_width;
 
 	const struct alpha_pll_config *config;
 	const struct pll_vco *vco_table;

-- 
2.34.1

