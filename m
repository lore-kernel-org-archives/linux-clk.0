Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4975122E3E9
	for <linux-clk@vger.kernel.org>; Mon,  5 Jan 2026 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767646061; cv=none; b=gazQKHsN+qPvGKQb8Q3U9vb4o6WPiHlF5HayJZbkEB3/BE8ojMEP2y9npUS8cGcKRFYB+emFdtxsAwHFSZ0R6MDTNjS/q6j4J+LqQBYpIY3K5VwEoWe8KETOyYq87Iq89WScxwQu++oNiYGufQknNzCtQIs6IazQFmxQoOiPzYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767646061; c=relaxed/simple;
	bh=lZpRH2X0H7PicY/ye0cxWgd6UDfMRpb5kRZrYazmO9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6JEqjwi6hrXOJ9Stx56n35rtaNGcBeOdmwPwrhOQ2O/jVgPvWYqPO+p6DmUhK2Aro2ihetkKraMn5SFwNMAlJNeFFyxsi97Vqmo12uc4wSsOJjK3ijU5Gt6U3sUXBAp28iBoZGGMWaNmV48nshjnGszMEbD/HAchdEAnKjHGjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=TaCb1ESO; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="TaCb1ESO"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8010b8f078so65691866b.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 12:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767646059; x=1768250859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=751CuOfDHWCSCZjhCuc+hswoKKu5SgRYZYXOY8EmB64=;
        b=TaCb1ESOKV9L6aMOoDB4B7NXSR/M5g94i2M7powFo/XjXDoeURA7wPT6xcHWQwofVH
         iARHzO07Xl1Wfu/8VAERc4xwPjJMsy+SGM6CwAZ/ve+AR/WekdrsIVJTHSNwSpNRWFMW
         6wMWfkHj9mFZgyU0Cj1jZbeTYwbfZbIcTtrMRH5JU3Ug3ljfjLDkEja7A9/Iltf6xeYp
         BJhTGsaw9JZbEx8lQunYScTPs/vkeTTUDPnWCx3WjqdDug0cyL4LrDZIy2nnU0HwVDCC
         jz0GfN+Q4qFl7OQ421C7jzleqTutrsYm5omFeR48qy7i1Noq/cOICH2oR8xENnEw/kb8
         bSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767646059; x=1768250859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=751CuOfDHWCSCZjhCuc+hswoKKu5SgRYZYXOY8EmB64=;
        b=EPQK/CcgnKcsirTW6AFwKBl3kewnJc7PIcth/mtXRFVBKKvmxe2SrjuLNuw0qGhpgc
         z7xwpzDNQAHHg3of2HdpmuvKvVd/2HKnsSZU4P9OQxkxI3R9iFMze6OflxISUqLKPB/Q
         teu4wGRdZz6Dn3CaLlYFXYD8XyeX5HEB8UNbhMngZo4P4ON8uZ9vAJhLtsdcr3rbgmLI
         wFPKBxlqmOqfqX6SFYqM68+zkK9BsK9FCu9pWya5ofLT3RKXBzjKMccz0hL+/+eeIkFS
         g/xSTCITr7lD7iCxS6hH7voHOshpLthAodi5Tpn/7+Oh3QSdgXWmfh+7bIuX4ogAaV3s
         euKw==
X-Gm-Message-State: AOJu0Yy3en5NGf7G1VfjWuH4ac69FAGIcaNO+d37sG6l4RzzecLqPHg5
	ydUdTETLMwvtOeKoQhOLaIh0WkD841hZGzxjt8iD/QXJE4Vk0S9Kn1I4
X-Gm-Gg: AY/fxX5+bK1ao6tiaZWXXpMg4XfNN6Eej8zCrB3ug5jIeIhvhNF/ydg1UEVU4gFi+vs
	twVp2V9khWfxR5dOne9A5XqbJM16RGy9XWKIxIu88U5vGno2K/F1iUiU4/Uc2v6THIHWx6zGxO9
	rBKyqcn+Bko1Z3XubDqJOktWR7DdeG6J+HCvuzzaUDHroIDiz1zNdtsDw9r9kJHzOYDkd+JuoN4
	bDUIjJlvlrqGF2s7QFnhWxRbd77YcOk+n3cAIOoy79CH636DifHVjN6lW7HkD/q0Pc65k317ZdF
	7vxSBXnPjzmgWw20xt6h74ClcuMn9wM+SY/NUF8Bso1L2FBt1K5okZRph7UaPHLuaICPjbK0hr8
	sw218SfuY4z05QylbISQn5RIUNYvtrS0mBg/f7dgtGkP6/JNeF3Wj5S1D6402iPqDEJqHN4OoDr
	us1sRwNmmib8tR3vxPVoZSeYdG7e2csbVdxnsA5jK8Z211yOWvyRaaNeV1WIWk4Wjj6omTzyW0T
	nYolBcLiudWizFmrnJ5C/KGfvIBRPWYTiDfJcrlpg==
X-Google-Smtp-Source: AGHT+IHscVxlfHz208YtyaMmjqXOYh5awKkGUsfs0wVHVO6V3dthos7Mjn3E5Y2bxNVyJyfpmXuwsw==
X-Received: by 2002:a17:907:2d8c:b0:b40:b54d:e687 with SMTP id a640c23a62f3a-b8426bf1761mr111212866b.47.1767646058523;
        Mon, 05 Jan 2026 12:47:38 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a8ad-5500-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a8ad:5500:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a233ef3sm26240566b.1.2026.01.05.12.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:47:38 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 3/3] clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro
Date: Mon,  5 Jan 2026 21:47:10 +0100
Message-ID: <20260105204710.447779-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no need to calculate HHI_HDMI_PLL_CNTL + 8 when we have a
HHI_HDMI_PLL_CNTL3 macro that has the correct offset already. No
functional changes, this makes it easier to compare the driver with the
datasheets.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/gxbb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 0788b9b1ed21..0900f4e44764 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -358,7 +358,7 @@ static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
 
 static struct clk_regmap gxl_hdmi_pll_od = {
 	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_HDMI_PLL_CNTL + 8,
+		.offset = HHI_HDMI_PLL_CNTL3,
 		.shift = 21,
 		.width = 2,
 		.table = gxl_hdmi_pll_od_div_table,
@@ -376,7 +376,7 @@ static struct clk_regmap gxl_hdmi_pll_od = {
 
 static struct clk_regmap gxl_hdmi_pll_od2 = {
 	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_HDMI_PLL_CNTL + 8,
+		.offset = HHI_HDMI_PLL_CNTL3,
 		.shift = 23,
 		.width = 2,
 		.table = gxl_hdmi_pll_od_div_table,
@@ -394,7 +394,7 @@ static struct clk_regmap gxl_hdmi_pll_od2 = {
 
 static struct clk_regmap gxl_hdmi_pll = {
 	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_HDMI_PLL_CNTL + 8,
+		.offset = HHI_HDMI_PLL_CNTL3,
 		.shift = 19,
 		.width = 2,
 		.table = gxl_hdmi_pll_od_div_table,
-- 
2.52.0

