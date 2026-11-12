Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498245;
	b=y15Z1Pa7Q9g6zKd2JPS5xi4onsdA+ZxDwMiYKPA2jF9vmT529cHTBs/sL2+lHnlHTNbz
	 HhDuIFxAFpkq55Tt+WKPxEV0ywJvm9sBlaV6v26YJIdBYFMCSlryspd6kG4RV9+SmbK0D
	 C/O0+hfUxP0x3vxbNKj6PEEvrOL9Q1qqb89GLbwJM0AVHyOejj+N+qQe5Or9ZbFzcfhcM
	 bgfW0pdmJUIzNEYvvbStUnPTofKTz9xF3h/SHI2NXDP5jvFgZrR9lip1cT3xasjZHNrzT
	 hk9Qrd6Cn16STW5Thr5MH7iFncIgOQX2qgCdTJfOgnVGLbTXA4SFSUSzEdLg4NZuZXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vijXeEfm77qaUFkbqHOmBEgEJ6GlTLFtkhRoObThLTg=;
	b=z8wL1hiLET4xQqApFXRz0O+k9BXQvndIneCfnUIR7qoTbxuHAvBM/FrjXkgMOhK1A1aO
	 jefEJCqUmYtEGDGxqaIEPfhnvaRnV0aba0NkLSqi4jOJ7CA4uZTrz0/Pzr3QpqUh+5uJE
	 U/K2xbjZNOpUGrv7aoHagAHTolQA4Uje5+c6LXeti0JJUTyuPxOmAhEfTHHbToUv8ryLI
	 iWEtMX0WQ8R8UXI6YSj4ZVBQap8ueNFRD9Oe5E6+b20p6lCgIjiJ78ro5wMsH4aK2JXkd
	 52YYWMylN3Ff7oWDEgiMTXufgsGzRt2+/qSiZGUG6FtM1UyMJ2dK+dgsVYS5fTEOleA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BesBSvfu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjvVpNR0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E255B606A323
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 15:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E255B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BesBSvfu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjvVpNR0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFa7pt1309316
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 15:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vijXeEfm77qaUFkbqHOmBEgEJ6GlTLFtkhR
	oObThLTg=; b=BesBSvfucNVWwXG0Yk3BAVUgkQD40nmb0GiJV9cal2w4WfiFIT4
	uJyQMgEhJfxYyiFtD+CbaBHILrEsH5qIn4zaGfQh432EhnMmlBq/4DYZ3xiItJNw
	r+VKdIiJq/TW9Z/rk9Tfl1fxX5KOnisQZ3h0BOiAnN7K3EZrzGqjeHkkD7EOWrxS
	V14IWnAhxApLJJ11jCBWo8fVt3YkemGdVI/4oaYCNgeyP3ZBMvwxqMJWg88cKp9E
	Z917PjKJTSWzJG/w+Iovqr5VIV1fC1YfoGh2rQbrZrY3MlBfjcOoLkBfAD9xILRh
	t+b8aYTAO5TVV3l47W8rRKGWZbyvm8gZuIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4sc77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 15:44:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-947a607ec40so318654185a.3
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 07:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794498243; x=1795103043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vijXeEfm77qaUFkbqHOmBEgEJ6GlTLFtkhRoObThLTg=;
        b=WjvVpNR0svU26bE4uBmbym5pioq/0kNaZ7SH1sphynwwvTSkhgprr976CBXxGFtMjS
         5X5Ex/Fibu3rstcjWga7oHaAYCD6IPB/1QngV3nAExCBSCfnCklhKT7lIJI9ZW2MhWLQ
         z0dl+xLdjU2of3aY0mpv7S+iDMytt3kQc/hAxeQ5ACs+fbBxOrWbkOboO1qtSFTHC6hG
         q9/ADAG4LqUKLTALUVsvGuyG3XcARZncBrI9tEIep544PjyfI9lAuONlYB0lpiwEH11a
         8z76ZmhNvQUP0jIPmq04bzAjDjuzqyi2/V2c1oju6R/DYjdD/k7p9jGr3HQJq9D6Mqeh
         Uk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498243; x=1795103043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vijXeEfm77qaUFkbqHOmBEgEJ6GlTLFtkhRoObThLTg=;
        b=vUSnt7g04vqkbsg1AKUtlGh3uMPhsCYg/ksaAVq/hh14CycXV81gG2gmUVkaYKLDw6
         KRe4u734NEJsTiRlRiLieDMcQI0cvIe9j0AyinW0pEcMbBtijTHnsxbRjalZ32AADWyS
         IWqV31EUWOvkqt5zTvRWRoQI0QH8RPO2ZI+vobZ+zLKv4xxTYqAWOyJCAmKowzdRiV5W
         Ej9UOYjW9OLKMHeJKwSIY4Y3Yu1QW0BXPTbiqS2qhqEba3FoP7TsqB78JJF3YL61Hx3t
         RoJfSUd4DYXAkJ7PUMHnniysF5WDKk/T3e46C9dOZ4JuY6oiNfe5ivOd3R7eYD/CpNkf
         h9FQ==
X-Forwarded-Encrypted: i=1; AL+hErEEqM/gEJlbiikeaNIo0f3haOVIivcb7/OMWsGU014dfoDrO4knDK9vPBz/W1AyUbZogRwTdEhO7zE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7L5qIlURzDK0iD9C9K9k48Q73ILDE9cr2u3dfIfxeVQmhSiPI
	Qqk97j1Xt7qAI3bIlDAIBA1nYwd5Trv7zM+GwpVu9RxOrkfMB6I8dbaZCunYlyXnYkGyfLewPxA
	sWIZRdUNMlV7mAgZYCO3Ecl80+Y0OcTjVL/HLGr04DNwm8SvshN6kmmUFXBL7RcQ=
X-Gm-Gg: AYBFou2yWYx4s9GWi3KvasM8A2whLs+n8PTaIjX2IPYQokmrr2BQjm4clfM1zVCr+ht
	q+Wv5p5ltWhta13da+Te1WGPZ4VUXugSN5n5sRrfVDo7H9GfIgwFPVtGaSDWtvA8fOl37flEnfw
	Yhm/TOPSL38lgu55LZ4yIRyHz10lvwKdEyj166q1zEniJqTGWNT6zd3YU0t1X1M403kh+Q2seV9
	qhQDHrxvUsSMS+ncMUNR823smhnVCeRpurwKb+lzbm/YRn6DRcJ8hmPMkSVsya11LpjVnWti8sV
	n6GlQJ/ty33a4AIKD+y6IcUoOCmWaoi2LUtQjnhvVdeAybJNhSgYOb7rvf2OZZhy7YMwIuRmmLF
	MUxIcXxSY2Jdj8zRdnIKagiEuDy3mJFiKW31GW5seicsl76yNiplnOLj8XF6/dg==
X-Received: by 2002:a05:620a:4706:b0:944:2f1d:950a with SMTP id af79cd13be357-947affdbf4cmr1107779585a.47.1794498242937;
        Thu, 12 Nov 2026 07:44:02 -0800 (PST)
X-Received: by 2002:a05:620a:4706:b0:944:2f1d:950a with SMTP id af79cd13be357-947affdbf4cmr1107775585a.47.1794498242449;
        Thu, 12 Nov 2026 07:44:02 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498811fa70esm15653540f8f.19.2026.11.12.07.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:44:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: hawi: Constify known static data
Date: Thu, 12 Nov 2026 16:43:58 +0100
Message-ID: <20261112154357.271072-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+9G1x++waY3FZmbS5XzFqR9Ri7Cj7glIWwNL3cyr4Ko=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9d6+Hw8Ck2TV8fYw/32sQuZ+6QlQs94atYjc5
 42n+gg50rKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavXevgAKCRDBN2bmhouD
 1xcFD/0Y5Ldz0Kg8I/9Wc/P9c2P1kq/x24j/erAnqL3JbGSWl6q9AmGIH8fd6t0nby6ItpFYZ0B
 c32AgbgpDNw0WiAM3jenAQ0xrUlFLFwig1o5HL8p94zW6h80N5s7XWY0R2kSik5wUAbp0/WN1Mg
 rSltJUPqdjfOc8uIyu/qEUOvyxtjcgw6tZkgaRiL2dCjZInB+K1T5zo28edH7b83E+eiB9N9RGd
 3asDfK9APkZJjbUA9Hl+YtgCqU23egHlHrH6APFr1lSGA29Iu9QoCD0vgtGPNaWSh5CD0HB7sl7
 nrGEB1L1YcUixrWwzHGPZsXn7xdxzuQnM2NOXHl2OI4PDO64l5NS8itDc6sTBDXkimQM+mYZ/S1
 xs9QNMo7g+HBHUBSgO8dAwtm+cbN3lhPGaLTS0eBRbiE2/mk4ei7bpb3otSAySNNM5E8bPjvqJd
 kBzOuIlArgAh86P85ESR3IX5zddN50Kqm21LeZbr2eXkjVRS+TQOzAb3gu0nRyq63x0+xu4H5km
 U1wR6oX5JdVuKRhIU8LYMl82uS5vN2lHnHWr0q6iBseLFaYfiugrTTOMnhmKJi4TGeBx3FzsEgk
 mJw1wI/9MPeMLbW1UFFGXFK7BqMp0t2MyEaq0+vn5/DfIuZfod5L9+2lrvLYQsC6aLHgtkSW5f4 wkj2/JczuPPUb1A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Zhc_gjfzZArhM-E6iwDgEkJUCnglLTac
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX0TJHx8fr1gW4
 FHTspu/nQe6PWK3ZBkcsCMonBSy/DFYv52LaIsUqaLNCLWwbhX2qZA+hzN09pYv+/xj/pt35Smo
 5YMWcbPnzl3LqSXOpZpX9GELhcWddog=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX1Vk20whgmAsW
 5p0kDv4hKwoviBKdHmoq42dJ8m7m2CtDgPhsVC82kLyzYYe8eMtzRjQIE6qfcBNzOc38lNiGTrJ
 pzPWGbVDwQBFMRb2u5bMZJEnZPvrVUyPnOJQdhtG9RoUz0ShptRNzBvz4Nj1NRqmYAekPPHdLgM
 xvazq3lFNHQKfMrW7PI3wttp6ewauotRVpKYJ7e9VuHOefpt58po4kcoBvY9J5zUCKTHdwayt4v
 9zA/eUWTDTBxsNkoNPXFNTUKnsgLI+PiyPZqmPbQ3oRKKDfhBAU5UWkyUs2TPxiCWYOvoQbvHpw
 H3G13AwlXtwOFQUbb48003n0vfQQSfA+N5j7Vfp+8hTr+98K+D9Ca2pejI7pmwf3aXHa53fPjFg
 letMvmLAzvg8FEFNBHpbIagFptrSyI3MnCFlLfnrQXc5kRWoavNLlZ014z0/hcm8W0bz/3nXr5z
 8dNzp6hGFkrNWVDyePA==
X-Proofpoint-ORIG-GUID: Zhc_gjfzZArhM-E6iwDgEkJUCnglLTac
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af5dec3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=srLn0zS6XOEjdFiaqEEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120062

The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
are already treated by common.c code as pointers to const, so constify
few remaining pieces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-hawi.c   | 4 ++--
 drivers/clk/qcom/videocc-hawi.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-hawi.c b/drivers/clk/qcom/gpucc-hawi.c
index 3deb7edf7810..ab6c4598bae6 100644
--- a/drivers/clk/qcom/gpucc-hawi.c
+++ b/drivers/clk/qcom/gpucc-hawi.c
@@ -411,7 +411,7 @@ static struct clk_alpha_pll *gpu_cc_hawi_plls[] = {
 	&gpu_cc_pll0,
 };
 
-static u32 gpu_cc_hawi_critical_cbcrs[] = {
+static const u32 gpu_cc_hawi_critical_cbcrs[] = {
 	0x93a4, /* GPU_CC_CB_CLK */
 	0x9704, /* GPU_CC_MXG_XO_CLK */
 	0x90e4, /* GPU_CC_CXO_CLK */
@@ -429,7 +429,7 @@ static const struct regmap_config gpu_cc_hawi_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data gpu_cc_hawi_driver_data = {
+static const struct qcom_cc_driver_data gpu_cc_hawi_driver_data = {
 	.alpha_plls = gpu_cc_hawi_plls,
 	.num_alpha_plls = ARRAY_SIZE(gpu_cc_hawi_plls),
 	.clk_cbcrs = gpu_cc_hawi_critical_cbcrs,
diff --git a/drivers/clk/qcom/videocc-hawi.c b/drivers/clk/qcom/videocc-hawi.c
index 318270105dfe..fe9691a02e2b 100644
--- a/drivers/clk/qcom/videocc-hawi.c
+++ b/drivers/clk/qcom/videocc-hawi.c
@@ -795,7 +795,7 @@ static const struct regmap_config video_cc_hawi_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data video_cc_hawi_driver_data = {
+static const struct qcom_cc_driver_data video_cc_hawi_driver_data = {
 	.alpha_plls = video_cc_hawi_plls,
 	.num_alpha_plls = ARRAY_SIZE(video_cc_hawi_plls),
 	.clk_cbcrs = video_cc_hawi_critical_cbcrs,
-- 
2.53.0

