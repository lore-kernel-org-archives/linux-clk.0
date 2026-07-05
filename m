Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD82B2F9C37
	for <linux-clk@vger.kernel.org>; Sun,  5 Jul 2026 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783271906; cv=none; b=DONT7L/67zxBMN8IHNdmAW37sE9NLMHZHcEcqfJGSwiMGEYt/LxA5DMEdXcc5wgHqsqFWR3oi47fyumcThOG9G2SUay/SzgYJ4GRWeAG9Kj7SvX6WGUQbrwc43sAHZPEMj5PgUybQPrewutOVRYwrS6LPgmnhv2D0vhDbbOtzyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783271906; c=relaxed/simple;
	bh=8PVUoT718M7KRoKLvaHqmMtuoruySWTjIbUbNYakP3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NV8vglage8z//6bXj/uYKMeaBSfO5ss/uAty+Sw+Mb1xNScAquL05wDawFuUQE9mQqWznjGg74BwHQZSKAzh0ic2XM/4dNsxZRymVvrAbG0gLJH7VobZAPO676A+hpZWtucBGQYONpS/swwwD5I36r9hVDt88jXVTwJCLnBs4Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fA+A1nE/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BO1/ma++; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fA+A1nE/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BO1/ma++"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6653nBe7656948
	for <linux-clk@vger.kernel.org>; Sun, 5 Jul 2026 17:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gAjSxzK1NRG
	OdBoP1gZ/QEZVeLpNOonuOuNW/4h3GVY=; b=fA+A1nE/lnxuJzVIHes9RiqF1WO
	R0UcqCnH+ZO1DUtdWC46e1XcUy6FNRYPcEP+89L1Ob+PUVX3i/Nr2Z6cY9KkSXmx
	EY1Ake0eBUI8pk0JIxtPoWCOgP132648Oq+d4eaQR4jTt4JJMQy8ITXt0YhIc/BT
	gGvdverXSIsrt9o1UjFAxVNiH/yAiHfbVUFK/YOk4hKwjPSIxJdTkPb7XHjjyVAA
	7fzz+sOu/1F1zLFFrX66DCoLHVeB3ed1l77XrpRkPs+6O4af6CwZtO+neyTwpQ/G
	nXA5d0OYq3lfxw9Awihgb4Zp2ipEnKmN8rUZ1CMMxhfpUi/i7HYbnOcywiA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64k6q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 05 Jul 2026 17:18:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e632390d2so426500885a.3
        for <linux-clk@vger.kernel.org>; Sun, 05 Jul 2026 10:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783271903; x=1783876703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gAjSxzK1NRGOdBoP1gZ/QEZVeLpNOonuOuNW/4h3GVY=;
        b=BO1/ma++m3OJfldtllvau4qMYpOLGfPe4QRFUDuQiii7GDkEfAqu1pcDSkn7T3AZYT
         6Y+SSvgp8T4Ym5VkxI+RVbZiWkUigRjuNrD9da/mYFOL7DoLC4MGlIbdIaJQkru20sgo
         XxLzv149+UEE/PLjXCAFVUCGYq6j8QzBeKl5cvgsScOzpiw8iCYlrmyV+uOip0c79qOP
         LCH1DkzlhvDbKZGHaI3KVxJWzqoML9JJcWWozZngikTkNYruv0p7ADBLdqwSCqt7mMZk
         qP4R7DuSo2EZg9TA4T5BTZ4KGU/kJ9hlcCZpX5L1rqrJI4GTK6bUmi62DHr/5rshkCrg
         wGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783271903; x=1783876703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gAjSxzK1NRGOdBoP1gZ/QEZVeLpNOonuOuNW/4h3GVY=;
        b=o7W5mwpbdZV1FhvAZpRow4NIPmgyKvGbUGrtaBEBI97zjWkZIGsoPp0X2YqOQysdO7
         NSktznsIh2fYJaWFD80uNAf2qkFKorUpx5/itrnZm224xj/ZaOSXv6z6DHklKqbdGQU8
         17TsS4zo0YltATjA4JIWcqbnI+Lgx1OsRC91UGlAbp0Jsr6SKsq9vGdqJFpfZ6zHOrcS
         qpVBxL5w0+P+4TPQuGhfcYRx0oOeRl9vIEehZUF1RtDetGbXJF+UjINFz6PQPGtmPBJc
         KSv3Xjug3fjme8Gk+rEKNWJWQASGJq+GgA2Pr/z6QUtPkx6vhom/L0t0afuoN9Z0JA+1
         THDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJl4abUGqfTYEu0B0NpyRWKGBMlNcSJrI5fxdWeJ7FWkb80SwS+VGrZuSh8lQhAeYKU//D6wTy128=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg7i5L8Bt+Jpa0me6VlcDekCxcZToaO3pSKnvSBZiAG/6AEPVl
	C4cp8wNEbU/2kfh3i+BW1jvN/y/W4WP9z5/JBnpMJcXjpDs1yWqJSWzuaqNTr0/oMTHekTFqyxB
	My6bsYEgD4oZCrXPKv/pi+qciYTtpVqNcIBmKB4sYAOJrxkg4Mzi1GUs8GqROtak=
X-Gm-Gg: AfdE7cnCZIsWlYr0uZbmuuZNgpKTyr1WwZD1d0JlqLYBPoIv+hh0qaKVIgO07PNOwPe
	7f+McXCd7oY0NrOUrNGs2LR88eZaD8GllNKeQBpAWuzKTCBeXg+6jEb6Fns9G10ZgUwmZc3xbj4
	bgWzgzrzVJBti0uUZ3pCK/+NGG0oHP1q7LPyzmgJVxTWdcc5icYpAX4DEcnP/41wWxVi+RKDLT9
	yHeYAQJlCyB4h+ropDJ1PKQtSHiQpsrrslERAif8nmjnzXp+QvEO5KGgtOUKSuqVDsKhT5QEv9t
	cz29OxGmVDfo0fgqi9SHW3q1LvHbpzu64ERdvw8W6mLIfUzg/fX/sCeEHwLbbH2jXt3r5YDhX5M
	qpBJvdc+SbrZi/DHrbQM6QQgZrzc=
X-Received: by 2002:a05:620a:6508:b0:92e:6864:b83 with SMTP id af79cd13be357-92e9a4c5dd1mr953775585a.69.1783271903304;
        Sun, 05 Jul 2026 10:18:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6508:b0:92e:6864:b83 with SMTP id af79cd13be357-92e9a4c5dd1mr953771885a.69.1783271902824;
        Sun, 05 Jul 2026 10:18:22 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdabda3sm220513485e9.5.2026.07.05.10.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:18:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] clk: qcom: videocc-x1p42100: Constify qcom_cc_driver_data and list of critical CBCR registers
Date: Sun,  5 Jul 2026 19:18:13 +0200
Message-ID: <20260705171811.115542-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8PVUoT718M7KRoKLvaHqmMtuoruySWTjIbUbNYakP3s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpHWM8vwGcHCZRqw/TSJsAN67PrPDyFG8qEwx
 gRvWdw1cnuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqR1gAKCRDBN2bmhouD
 18NLD/49Fn13Vq/wmHTu+YcDJYD9G4J37GH+u46xpdTj2dWlQuctPXEyZMJhIKOSpG8Q0xI7psm
 /0vDiPG+Kr95cTzbOXbXhR9bGzhoVTY9eERaYLBfQYA3+0Q0rX6LkXafbTpBMIwRuFxOjt2dUXe
 RH6lOoaJdmJyGHs/f3ebsbB5hCuBRbZaDVsB+4O4vOG/wO8vJLqxYZSfHMpsH9sHk7LuBXuIAad
 17f7QD+vufRy7Umguc0sp6wum7T/k/geoeXg+0YySKFB3hSQU3XdGYb+mO3Unik7HKkvRgaRaGn
 mNzN1OM5Z5O+6ebLYcr1WGWCNOf1UeI5HXxSBNgFceMqkCyKmuve6CHTupETfKTb6j0uc/QZnm8
 rpfjV2PFXu9E2BdqBbjGjpmA9h55Zmbz/bLHZ8+ZtIJLtjz+OxWK0ElU9qv0cCAFKPEuwkt57+P
 MN8hKWFUsvhh4xQEqBUFQ3KttG45bfx5p5J1S5AmBGYw28DeNOdoomrrFSBK5mXJq4jIg0rE/33
 zxOVWNRVLjF7HGe2MgGJwopbnZlV7nuGeKt1j2fT/dQC8rb/fcUZfB7nJpDqO5YvXQypJMRl7JJ
 ZQN1ENqLtzkKhBgLLj3e48gRU8Au/YOR2LtaUKVztdKWRSy7SZXeeglozu4TrZIKqHI7iLSFolx ytiVZhWiGljDjwQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4NiBTYWx0ZWRfXy5zued2P01F0
 dUD/5lsFs+5AZBAfz+M079rADfKIA5+9wk4KijwTvhGDMVcecgEs7CxhPCf4+3yLQuNPD3tiDiY
 /sdQPTB//D7pV4nTd8xAUeF7HuUZlQC4rnaRYOtzsByaU57zd0juqdCF6+LsPhKcF3weBRi2Lm6
 TsdlmLPV6EdYqpCOofPHFhT9PlcBxGHu6r4bcmbXccUHuFw0JmaECi0nCroKUOl+/PwyJDdw3WB
 GKhe1Xx/2SbVQZTdUIrHxRiiM6YoyZJxioA3d2zTPMFVCpl5mtukcFfcVZKNbsWGiI4FZ8I0ZI4
 SLcSVYgh0Yw7lyIzkz5oNsts49UUGUDczgPK8OcFrzon/pxjvFFriKv8mmMIDLO31b5+pdgaDJm
 gJUPE6FFwFWXIyjBlaVa/Ib/1u5bPx1g1LtkaUXR0PuIxbTqlRkBfyiWZED4VoMZbE1D3hygse5
 RGNl5+oQYRAuk0STOHw==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4a91df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=iU4H3tFZNPDWGuvcQnEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kcFLksmfmJkiiLF6jivPPeouMRl6401c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4NiBTYWx0ZWRfXyEuLbvkydHAa
 HNxIF18dn6o+EO0vI2+rxe7qZQvPhijbhhde8VoDD8b7Y2vwj+KlmUXERmCTFqX4P68fr2kgXpI
 J/DtNocKE36dimTmxCfUUN4e5IDV/0k=
X-Proofpoint-GUID: kcFLksmfmJkiiLF6jivPPeouMRl6401c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050186

The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
are already treated by common.c code as pointers to const, so constify
few remaining pieces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-x1p42100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-x1p42100.c b/drivers/clk/qcom/videocc-x1p42100.c
index 503c03210ec8..6de596908cb7 100644
--- a/drivers/clk/qcom/videocc-x1p42100.c
+++ b/drivers/clk/qcom/videocc-x1p42100.c
@@ -526,7 +526,7 @@ static struct clk_alpha_pll *video_cc_x1p42100_plls[] = {
 	&video_cc_pll1,
 };
 
-static u32 video_cc_x1p42100_critical_cbcrs[] = {
+static const u32 video_cc_x1p42100_critical_cbcrs[] = {
 	0x80f4, /* VIDEO_CC_AHB_CLK */
 	0x8150, /* VIDEO_CC_SLEEP_CLK */
 	0x8124, /* VIDEO_CC_XO_CLK */
@@ -540,7 +540,7 @@ static const struct regmap_config video_cc_x1p42100_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data video_cc_x1p42100_driver_data = {
+static const struct qcom_cc_driver_data video_cc_x1p42100_driver_data = {
 	.alpha_plls = video_cc_x1p42100_plls,
 	.num_alpha_plls = ARRAY_SIZE(video_cc_x1p42100_plls),
 	.clk_cbcrs = video_cc_x1p42100_critical_cbcrs,
-- 
2.53.0

