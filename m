Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446BD17DA39
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721210676; cv=none; b=oBZPtBVI66+msDtSGLxj039doX7CtEGn2XzuHNQ8y76PJnUwoqtPk5GfvOE2KczZ+1rZIeWWGqVSWZfXhAkSb5OybhqGDx5GibxRAVsGLaqf0C8t0NjF9VErKnAed2ZOf7BeMMzxsF13loYbe6EwO6h53cflXQSFA4VvQW3JAqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721210676; c=relaxed/simple;
	bh=R7ejJV5ehRe2QOtosJ5fq8CEVBDmVLRLrq5b9Ilcn4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mWuZ/aMCKeU1LW5OCN8Rm9aCnd8SMY+ECBcsfngFboFnAbfaKniuuUu636e8D4PnbxbehS5vTYVqRULIKaIBzkjAosyl2gw6w0WnuSf7tyA5sSRJkK/9kjpXBkjWv1sCEBAjsF3UGdMCqPq5Tpbk3dU8Gp8ZBEORgQ60QpWoia8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KdzchHsE; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KdzchHsE"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ea1a69624so7028521e87.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 03:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721210672; x=1721815472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCagpIzbVrV9kpwwDQv16/kakLswieGkTpbjXrl5utg=;
        b=KdzchHsEdvd27zHrcafittrRbAyMToOR2iF4EHy5PWaukabDuA0oTZ537b7evGHta9
         NwbBEuuLUNTtHz/45C7Y9gVsAlPF/nAckOTC5QkRC76GIosb7oEy9rKlixK4zzLQa17Z
         qNyy+q5HAyP+rv+mfupIbWwAksPxGQDM0e5u9HWzKcz2AbURAQ6iDC6cn/BWya64f+OQ
         pgQleyy6rhn2eSPMQswz49lu8Ia6zk9PBN5imjga0Z7s9uz4T3Qoxk2JOhnzrQvnmVjD
         JqHUYWivoC9IdoAYLy631qGEVo0xjekE2ez69oWbaMmgnDO+2XhBTqKB3Qmn0DIxLjQv
         8PNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721210672; x=1721815472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCagpIzbVrV9kpwwDQv16/kakLswieGkTpbjXrl5utg=;
        b=qAy409iVwG06GNIQcauAk92UKVl4I2xKhTqAEtnDl6D4+UpxVmEu6V/E24YGWgGhm2
         MEvoslC6aLZGstGrrpiMDiPB4OSTtY6NIuSRww+aTxPZimWtpFwbU2VL/XXMeUecafoU
         8guz9YMhT26RE+vUqYNKZKiqVApmve7BxB72javx+pT+GgnbosEsv8bgR0vgO0FPLY0b
         QhWmLHEPFbQZbd/J7IlmZRy5C3gpHF70MeOmHKSz9isW8XBdIz9vSv8fFepxb95Zqp+4
         XsJDEEA3JOfd2uE2pLSY4b+CeQKoqooW0+soNV3kuhwbGVAZLHz8PKe5Qo7BN2Ujsz2R
         xZdg==
X-Forwarded-Encrypted: i=1; AJvYcCWt7xxyJiv/KC81zjD6TOqpVaU2OAIBjL/h4En3CtbT/ujzR1qmEHpnEIH6A9S36N2UTwlxdyUNgaBcOWLpAba+goUVkC2XB4sC
X-Gm-Message-State: AOJu0YxukAuotA9F4uP0wOjmo9Pg3zOXkQkMLiM70GTNlmHLWXej1NpC
	hU6XH5Id+WJFK4v+YWTw2iDfsDsSB3qy83+Xbzjc/NRdAvQVnwoci6+tLdP65NGB0MMcubyV1Mf
	x
X-Google-Smtp-Source: AGHT+IGLe3z84vj5GnjFF3CZVdmg45i8+LHTtxys0HGMATZL/U1e+ChQDtiLRFJuB9QQBXO5ePY05A==
X-Received: by 2002:a05:6512:ad2:b0:52e:6d6e:5770 with SMTP id 2adb3069b0e04-52ee53bb440mr878006e87.14.1721210672307;
        Wed, 17 Jul 2024 03:04:32 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed253924asm1425391e87.262.2024.07.17.03.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 03:04:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 13:04:28 +0300
Subject: [PATCH v2 1/7] clk: qcom: dispcc-sm8550: fix several supposed
 typos
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-dispcc-sm8550-fixes-v2-1-5c4a3128c40b@linaro.org>
References: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
In-Reply-To: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=R7ejJV5ehRe2QOtosJ5fq8CEVBDmVLRLrq5b9Ilcn4o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBml5ctpaOu3O44R8JnE0xsEJUtcOhq1jLo0Nu69
 nIeG/aQsdyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpeXLQAKCRCLPIo+Aiko
 1dsRCACctM+cJQjzz66Im/WucEYM99McFLX6C8woUaCDnORV7jQl4+MF89/qaZTs306K71TP2NF
 okcP3J9ouOfhDaOjvfswXnjj6GJAyucRWrZV1TN6QU69WIm5uVmlxbS3n8HAl1x/wQDgwas5jy7
 8y/kEpoTgmGR93rk1QY0Lv8QfRuKLTU1eGJfM4R+w7TdYN2IJvf0CltEhFPNsJIiuq+Z25dqpXC
 fF0G9aresrDwhhcNsgXKq3zmBXXgzy/TuNdMfacTFzsXDqgIyr/xtc0qq0oLor9Ikt0VB+q8fma
 h7dr7u6UkIjrRFr155s+OL81RZZu9K8AeNCofDEN6Dbq04GN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix seveal odd-looking places in SM8550's dispcc driver:

- duplicate entries in disp_cc_parent_map_4 and disp_cc_parent_map_5
- using &disp_cc_mdss_dptx0_link_div_clk_src as a source for
  disp_cc_mdss_dptx1_usb_router_link_intf_clk

The SM8650 driver has been used as a reference.

Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 31ae46f180a5..954b0f6fcea2 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -196,7 +196,7 @@ static const struct clk_parent_data disp_cc_parent_data_3[] = {
 static const struct parent_map disp_cc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
-	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 2 },
+	{ P_DP0_PHY_PLL_VCO_DIV_CLK, 2 },
 	{ P_DP3_PHY_PLL_VCO_DIV_CLK, 3 },
 	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 4 },
 	{ P_DP2_PHY_PLL_VCO_DIV_CLK, 6 },
@@ -213,7 +213,7 @@ static const struct clk_parent_data disp_cc_parent_data_4[] = {
 
 static const struct parent_map disp_cc_parent_map_5[] = {
 	{ P_BI_TCXO, 0 },
-	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 4 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
 	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
 };
 

-- 
2.39.2

