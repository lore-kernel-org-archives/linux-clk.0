Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864276;
	b=USxu+vCSFPA2yGCltam8V1UP+cXPXg2Tc9L/+/01zApp+ZTSMhIhlXpR8K0rr7lJhbK4
	 4tjEcI5hvt6ULh/q94Q42tusqt32uQuuxGmc0JGypVBv5I0GCTomkfZnJOq+h7WCnkZiG
	 wufrmSBxSmYSnsTcmzsbp+1ckesrRYuUwn+7TYggvi6Ystd7dUiM9d7iU/8w4P/5ovIKc
	 uSYYO9+H0LHBaGdgWRee+gBHCdeV4iXoJjhJgEo4RDQdMmRN8d0lGvPMWXyApxHnqLYiV
	 774Y7/RyX/rUJbHtVQB+WEL+jI4BtINjEOr3TUGguc7+o9djTNCV11H7uphfyrC4FGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=epa5IEYHWsJY0JP+N5Pv5GwJ4u2FQrHZJPZPWohLYF0=;
	b=EPxwB7JPb6O0pPU6aVXNXtl+JAzka0eVCUreGCuiNHuoyzildEOpAkKYFom5PTZrwE3r
	 HtNJvGtAWvkzg6YMPy1csUhw47ywWwTeyiXb4QyMSrmwywjXZUdqbgkIV8i9Q4itRMoBi
	 gjnF53Jy8CvzOXmtBw1lMri66qsTlhiBIJNvFWo+pCRQTjliSwaKmFeciep7+k/8f48PI
	 WH3f6XtBEPtz7L9TTDIXF/U6MMeiXFWBpZeDVzba/9cg5oedctI6jU4sPhaD/jIC2zHze
	 dxbCdKZhZRwtlsSRcuLnYNu7Bpyg4cR1bUYMGDbYJhBbbT0HJKX89Pn2TvKWKbIlC0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Od1ucjYW;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E950606A323
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 21:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E950606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Od1ucjYW
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so20104965e9.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 13:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864275; x=1795469075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epa5IEYHWsJY0JP+N5Pv5GwJ4u2FQrHZJPZPWohLYF0=;
        b=Od1ucjYW5+qo18N3MM7tj2tZJWbDbHoeDSC6n7RJJfhjGadMeF8CK/OtTTRTbmdOzg
         czkjQ0DDeF5ejXEOM6wavWUGEHsj3WGnuGzGZaQHHuXuPE5vs8JlRKJV9pMQdA/LfsTO
         MzolRipICdeDX5L5gI1XQYDuUmExZPRd7PhJQ2B4wDaF1bQd38X2RzSSjAcIRCUE9nC6
         tbonHuu5CHVGNPnGgV07WEjRxQHMzSj89oWEKwuU5IMUQJOLwDHZrykEBOZEyonz+XWA
         YPC3a1WFA0T4uVPn2YvhhovLYqGBXQQO55mKDincZxpwOAesppKhPEtZZC//T+Z/Qex4
         zVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864275; x=1795469075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epa5IEYHWsJY0JP+N5Pv5GwJ4u2FQrHZJPZPWohLYF0=;
        b=MYqY7fAnhMHIpKPQjWonr8XnEHwszmOI4ef0o6fEAk5RLzj5fuT3RrNzyNL6HkbJen
         m5BGMS70bnjsv2wn5xKVWzdNsn1wlOBZe5BVUDGGsHVIN/t3001PHvidSoNhEm86XhWh
         xb05toyy1VceE68M1upZhZoG78x7pH5QOQ1H9d4zX2LtuUPzyjRS0SAo3eeWl8vGAvHB
         qdI5qOeLbEXsYMls8BKj2Ky6mb2b4PfyvstfJvduJE+98a3pwT7yPbIVQFaGm3u6taZA
         OKsdZnmnRwJoH2Ez8SzEqd/KfVAFEBo8zK8yxiVxZRyzKWVdR9+OGSlUNu6eoTcqAn47
         6V4A==
X-Forwarded-Encrypted: i=1; AL+hErF+cEsTTMxTN4yZe5QVzs6NjCbKZoLB4S6yJ+yPkoi7cYBCFozhoTUs9k9JV6+q+tOm/KvFOrDaIy8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+87CzqMI7C+/GKXJqky5KmK+ZsdHk3CcftYprkP5Shk+EdGWYJ
	oaE0kcZQYXvUAbej+oO++Y48uWY8AtETztD3kOCo3qHJQcPQAt+3Isnz
X-Gm-Gg: AYBFou1i1Ug3GvF7tg95aemVVoTwKharzoWdwJs5llrx7RqRrHzpZXTFvIHt8Ne8VQP
	3hN/+TwjtC3GHQ+xezBE83UWqWh0pGO4AOGgHs86PRSHJlX4qLDU7r2ZCbxC/9UrK75aHJsIiV9
	YSWc+dU2/ckmslaEbqFtdTyY+sHlfuUGyAwpTYKkLk1aBVfURCz2VukrZ4J5jx9Lglo3dLYecdp
	fhJ6xj6UTMH9xC+LfoIbj2ue/eSNymmndAGb032L4fqjRFm9r5CeH7p6GlGxIIGgv7f0Ov+88vv
	lhxVL07AsJgYZtxGn+7n+BnM/PQMtkTt27yyAZtAgV+4WNvEfPb3K3PrHPCcoZOSJmbDq+2Xypv
	w5+TJV3ajvhU7hrcW3WacGE5rwRZPPMiwNyvM68rLaYtF0e8ehCYfnEmLJx1eBtOmYfoXU+fK5Q
	ttuBQDnAhaU6MzsBPhHpxYg+jeDHY3ZIrZ1d6c/wr+OUk3qbI16RPN/uhUTAu6JOa5965OTZP6J
	l4uE59KYzCyR2d1TtvHHEXUibxp3MV02inKGx0VUFey0k3ESBDyGWDqPvhUN1frDkaTWht5leQT
	fwVx1wX7htRv4Xs/jWQJboPdXPapb0M0I4JfAbCU
X-Received: by 2002:a05:600c:a00d:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb6842670dmr161939845e9.30.1794864275018;
        Mon, 16 Nov 2026 13:24:35 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2f61c0989sm2414728f8f.48.2026.11.16.13.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:34 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:24:20 +0000
Subject: [PATCH v2 2/5] clk: qcom: rpmh: Add support for RPMh clocks on
 Halliday
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-clk-v2-2-28208928da36@gmail.com>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
In-Reply-To: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864262; l=2699;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=CYr23Vm5en0po39j5T9TwtOypnqgRXjF+/zxbnKqVkQ=;
 b=jU+Icb+XKUsl1PdEnDqpsU516pvV/uHmpga47T91CddUo+hWwy0HlEfA26EvDbT8sy281LIhR
 N3gBzhJTooQCxaVpb46KL9nlPB/CIWU0ZDsQkXyWty7fJhtvXb6Vpus
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the RPMh clocks on the Qualcomm Halliday SoC as Qualcomm's
downstream clk-rpmh driver describes them: XO (divided by 4), RF_CLK1,
IPA, and the clka7, clka8 and clka9 resources (downstream LN_BB_CLK7-9).
As on the other SoCs with clkaN resources, clkaN is LN_BB_CLK(N - 5),
so these are LN_BB_CLK2-4.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 68640e5904a6..fc16111c890b 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -383,8 +383,10 @@ DEFINE_CLK_RPMH_VRM(clk5, _a2, "clka5", 2);
 DEFINE_CLK_RPMH_VRM(clk6, _a2, "clka6", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2, "clka7", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2, "clka8", 2);
+DEFINE_CLK_RPMH_VRM(clk9, _a2, "clka9", 2);
 
 DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
+DEFINE_CLK_RPMH_VRM(clk8, _a4, "clka8", 4);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
@@ -413,6 +415,25 @@ DEFINE_CLK_RPMH_BCM(ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(pka, "PKA0");
 DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
 
+static struct clk_hw *halliday_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a4.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a4_ao.hw,
+	[RPMH_LN_BB_CLK4]	= &clk_rpmh_clk9_a2.hw,
+	[RPMH_LN_BB_CLK4_A]	= &clk_rpmh_clk9_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_halliday = {
+	.clks = halliday_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(halliday_rpmh_clocks),
+};
+
 static struct clk_hw *sar2130p_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div1.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div1_ao.hw,
@@ -1137,6 +1158,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,halliday-rpmh-clk", .data = &clk_rpmh_halliday},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},

-- 
2.55.0

