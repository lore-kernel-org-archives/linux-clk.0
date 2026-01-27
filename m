Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F5835D608
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526239; cv=none; b=lbHacPr0H0ITJg7sHQkODtkGjWo0Nm7mSuJfbuKVUzv/kD9nHTTgfa0waCtVg9/oDRFyV8vC4bLsmThQTl1MKBX8GOrZbJsz9JhtS5SvvLGBRwl1G3S9MMcwHcwTvRHUQGv2kS9KqPQ/e+1tN9VZqlnbpzOCqbNEJhYAGmxgRl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526239; c=relaxed/simple;
	bh=cErvy2X29YX0SBL7/izgAbUgElLX0b5KefxRI571VzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IL3K1EEJQF+1UBVt7+BH+qHz327JBZ4++z8kh9SGZl4kZxvYv9Lr4fR0x34th57eb2i0z+agImweigib6xhzzRgq5rddjNgvmWVAyaBsoZImw0yHEJM9xPCeL64CmDD39weCMoobLcSu/fV3/i+Ma9OhVGlLw/rHmOZnJRgZMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4ZaHGzF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jx+nZ1b2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4ZaHGzF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jx+nZ1b2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RDRPLm658800
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 15:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Me5YZt2B/5PhJwf+VqjVZCafYInw2eIkiYvZNQdqKYQ=; b=d4ZaHGzF3GNjWgCc
	lQ2FaYavOiZ+kuSvCRCqxprRKzMpk1r25/KyvFmlcwdGCkvKVXdCdvOjKcYsrchr
	vjGtOhXIyKrXUE9mmmA5VSCcdfjYHwBgPcF75mOGAhc9KBg8B7axAi2unG+A5zxA
	Jyy5kdA2AVeYrLVp51nLcs0NKUIjFLEs+3K4K5AyF9tZZk4L0T6nVkbo0aoVkSlL
	1AtBnBcG0cRql+fuxnMGNTOJCCxjo4Nzim/PKbKAzvGkoYJEVYLR7ivdpp7tIno8
	JvOdlAxXEN8/tbjd7kJCXDfkD8h5NIwRUvywSPGtOBw4l7n6xnNCIDpjUwnRMXdu
	md3itw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxryn9fvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 15:03:56 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-45c868d05ddso4068399b6e.2
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 07:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769526236; x=1770131036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Me5YZt2B/5PhJwf+VqjVZCafYInw2eIkiYvZNQdqKYQ=;
        b=jx+nZ1b21Kbp/nSxumIs8sFcnAfpYR+jO7fEKJraSgYhheUET4HdLt1djZoKP1Q/bC
         msrwQ6JgEr9TG8iZtNu7QrXT+wmdK+GEDltVHh2YVGNUqMIO+3xgMgwtrUsRf2+AeAV6
         inEUF0JwUBgr8lRdEGeIM2kaJmaIIYmEnxNmMVIZopCdxyZpC3VsTTB/JdWR4DMUlPSR
         HjRqybf1FRaLtmVKE9Hn5Q/9pXpD1EpawCyfI0c56KXNGuGNowM83rmLUKyRTNIhX4N4
         kmZxl0mPP13Ovf4P4RRZff8i7GyGmVQ94vi21ZxLlkEAlBmsXaK+z4VdbroBHYcRZ1nD
         7wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526236; x=1770131036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Me5YZt2B/5PhJwf+VqjVZCafYInw2eIkiYvZNQdqKYQ=;
        b=QoKZZ9AFp9lIn8vn6JtxS/oW9k1WubjUepWF8ve+Et9Gpp6ObGduT0sS3TU8NEqfBE
         IBEnuNpndl4myrEtEKDfQsIqdQcKaS7z5sGdJgLisAlwmoEb5e1zc0xvRnNG+R6OpVgb
         MB/kZLNhLZbqd9GtyU0jun8Rm5/umNA8KWMUsjRjem3coDA+uJCWt/qVwFPa8D1fls5U
         1i4b5TC2uADTgRJhDuc1r6VW2KAyogf3M6rJCvWOMa4FnsMnZVFcZzZZUQ6LqXDq1Lnh
         v8WAaTFOgdL3LhC6zzegasqBIOLRATa2tsxzmsHGUhtlKZtRaHny3lPCU9T6PSLknmPD
         /agQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuIOlhIU6ylQouRGRNzTugxQEATKqstr3cI2QAVCtjPk1IvjImgoP7uHSX2LS4M9xpE3COqVKynEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9kfIZNBJknPs1kTbHMQTFoiqpAl7ofKmAitie3fdXRzYcz3Xq
	4ddvIpulL/UEWD10U+7Yu52bX0QJ0rpsRnfAGoh+L21wK190/hDoWreKMcYB5WjEsxDdjcbWa8Y
	6c7jDssc2q4zo/AV21EBX3gELECFjoGzJWlTw6QJIbv8rVhycGEXvplVqjy5P61c=
X-Gm-Gg: AZuq6aIdpXdvUKZtmJn6aQ3pC2lf5z/KUcLtily7Fe1qeBSKGdHaOeXhlmMay0QCeUc
	5IbIupwc5dR3l0KOGuL5YmZ+7oHWTh5EKTCNweJAgw/gU3x/2uj5WmBKyyBiJXF+Xv/AGcFZ7ur
	AxdDL+n5mp20zesp96NQRjfGSX8uieNHErp2TrLQRy7/wJXRY6RFWnfnHXsgU5lHfvL9tB6uRiu
	Z0zBbxY/vqOjH0NzLprQmvJv0MuH1m1TZoRBNk2GjcaegGGpqBMH+AmrXzVyhw61KoMOeFTN76d
	ElknB1NRQBUYqORzEjU8fG3JuLkT6UwXWSLjUog8q01LPKqB0zkse0Ad9ehcUbGEiSIJjfN0d/f
	gweYuDcbdOJZNJvVtXQ==
X-Received: by 2002:a05:6808:bd4:b0:45c:7306:5058 with SMTP id 5614622812f47-45efc5984a4mr1092780b6e.16.1769526235528;
        Tue, 27 Jan 2026 07:03:55 -0800 (PST)
X-Received: by 2002:a05:6808:bd4:b0:45c:7306:5058 with SMTP id 5614622812f47-45efc5984a4mr1092728b6e.16.1769526234625;
        Tue, 27 Jan 2026 07:03:54 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02cd8sm36895097f8f.8.2026.01.27.07.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:03:53 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 17:03:22 +0200
Subject: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-eliza-clocks-v2-4-ccee9438b5c8@oss.qualcomm.com>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
In-Reply-To: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7ihQGVEgIb/b5bMkITEcOLrwp7gnenamaRBmqqw6zUo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpeNPOJlbyfVA2HZ0i7NLsLnDhg43NGCrgOgUya
 EReERmTYyOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaXjTzgAKCRAbX0TJAJUV
 VsDyEACRujLDJS0Qm0QujdoKldpAKavpeIQTOpE+GyTEMuGjOuvGBC+QmGp09z0inPCadWyJQbA
 MeX6HjwrGht+z36LIPLLJSLyCLmzL6XUGhrBX/DTS1tNqeLm7eBhhDOKrSm3dK8/OcYckHwOZ3Y
 Fdo0B4qL8cxqmlBDnRj1BPlmkGy+QXQVVHUAq+1eJM3UkI+SS6YPfJx1N7ELK1T7GMcSQzruYGv
 tuB7QFI8RCh9QZ2Flwc9oJRvP9Nl629iRuSOovcZ93zPhouG8Bv247xbJB9eMR20yuGyshO2KDZ
 eBftFJ8jIIAUk3p0vZgmimmCGw4qYHdCU83zQG2w2nyinBqTe2xXMeiSuqziiRgUCiG5OYYxyxQ
 L9139c4YGcgROsJGexLYsZXoFnCOvrf7Fzij4j0Y/nwmwokORG+7JUguR2eKnqp/rDo4I51Shkd
 qYli96tjCCTj/iwbEN58Li34R5AcqlbEXQJud2Cl1qqmuvsKMAVWCq38j559iGnkHz99E3zfjw5
 MSj+njqAhcqpcFMSeg9fHr0B6vZ3mPbCNjw/60X/WAqX3UELGZVSSz7AOuC7gfilQbkjTnCQrTv
 EGvjaMWxjpj3jVpX5m7K+ahEq9pQfV9JMoGIHd/bhgN0179p8c9gv40QKM11PZcMn3hpflA5b+p
 KqNAHTwXJuhSqxw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 8s-SJJpfMgaQW1seDVl6kbWAh02TqPJm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMyBTYWx0ZWRfXzhiQGuzgxyWF
 bXAUUQrVeEjesOCDTeT9bKnuv0rjE5SQFM0nlr+ghRaO7zP7zt4xoCJG9DGH4XOqjqaMJjgWonm
 XTLW6/Y5W2R2cwZN4QEPZa53KWWR3285wjMFMYoHDXqT22TThOTc+54N6KtGw2FXy2MdYiAkKEA
 xIPElhGzzPfkuUN4OeNdG9o+H126R9UryHmWQWgNOJx12fVohl7MkiKvL77CaVztUsLH+SXWttj
 mqkdf7phTwfJZ+CUU80m6WxAR6MpX0iLWpbFpbIFggnE6J7q+n+mfDC2cfZmSzcjS5qOoeilgMR
 r5wMBbAAhfeDivjY00LLkIpgLiUJ516iSSwunK2qH75H5MOJfO/A8gaTJAuUntOPN6lsZguajBF
 5Ew/UQaO0YfUsK1a+Ehv2GsyJaC4vBCRcvVKLZQLKbTRE0k2IKvunhIDE+ki2aRZ77OaGKub193
 jAABOzhzntnlG7JXx6g==
X-Proofpoint-GUID: 8s-SJJpfMgaQW1seDVl6kbWAh02TqPJm
X-Authority-Analysis: v=2.4 cv=FsEIPmrq c=1 sm=1 tr=0 ts=6978d3dc cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hmjhjfVocwMNySy1NqwA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270123

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the RPMH clocks present in Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee..cf46a6585174 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -940,6 +940,25 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *eliza_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_eliza = {
+	.clks = eliza_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1029,6 +1048,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},

-- 
2.48.1

