Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C4E3F7AB8
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802303; cv=none; b=Th4dbiVIsz5Gi4WXKds1vgBhqyZixHqR3slw6WMwSBlSH2QFzzhAAe5BfvBRPefAHtYD4PyuWm4Lv2OwDSGglmhSt8mZCdV5vzHbRLYvb7Qrx2xh5It0UgrllMxVji69A5+ul+kKGroYBxCho///hV6FGbJVIVCLANBEkuAs8EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802303; c=relaxed/simple;
	bh=JnLKribf6AOHWDcyQv5gYJuWC2U2xXYnGbnDQ8hOUS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nn8uk7YfRc7DOs0qkJr46vmwDDGGx1tnQluc8CfUm/RJw1qKuLW4fASUl/3jXUayKWl+mqj9PNARyQn2cFMSNDKHbZqbO1mw2cNfsl5dDojx0BbzvuhRccnljMs6E1/1X5kvgHgpem7tn+ixvXVleqvtcGL9iu8pnj/cQItF7s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkFnESDZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkFnESDZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490426d72f7so39312495e9.3
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802296; x=1780407096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amBSrb1L86JvC9qeeZudzfDQINj7fZsVpdnG470cOWg=;
        b=MkFnESDZ7DLJ9+quB3dxFSDweMX9dE1XkK7rPHfSbBH1SByaoAfLapOwalTPAFOebE
         6dwiCgT78lSxCDTZGTSW/9w3pf9YTx6xA4E2CLksFQDXRyLfdqVx2eea5wF/xkcYytDu
         CUFrOjhMgTBkllaLKxTCx9cEnug4KR+0ByL+V1c4Cz5leD3ei/lBJ9G5BH9RWz4YWrhe
         EuXqZcfFmRM2O8uuUAbLRNNJ73g8phLPsG9rfX1lRm9szKpVC22HOBkOqk8hdnyGh4of
         49rDKBXFSN5NJee9cCXvW0Lx6U7x9Bma3j+0h1iMf2b2004N/L4QuNKdx8t3ezTnFo9+
         RvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802296; x=1780407096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=amBSrb1L86JvC9qeeZudzfDQINj7fZsVpdnG470cOWg=;
        b=QylOhIkSX4h7o9oi0phjgudfByqsaHs8gzSzp3kMJ5o/+HU7XinQEbyQ3Ov37HfwnR
         qfT+OtTFhF7ZXXR3MlXcFD5+dm2LpbvRBJQpnZkRSxQKSNQ8/BXvRkBFZX0/01ScVPjh
         pYiCzfrKv7xB6ywOY/N3jqzqMk+K7XF+yHCXvxalf0jkJhr55OrUEK6O43u3fIhcisH1
         CaCeZT2PZCAL5ImnhQILxJqoRGVL34TP5PoLm/pjfuP2+rDo8s38SEfkPmgqG31A98va
         o05inI5V1fP9wX6zIRqwlKU0lYlVorg5IFeFbVcJYD7mxx3Ir5VvObhD3UbiFinhj20I
         bQXA==
X-Forwarded-Encrypted: i=1; AFNElJ8P8RXupp07lSyZggNseaO3P61CcFM1rKy0NIzyydo4RxOnDO9CUjJi2JWSK79mRNiN/QcLiN/3sb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/aVS/qpnMl8n7KZMj88saVPKwC81uLk7g7xECDMJ5QkmTcZvH
	tqCf5lbBKawep8lZNKE3VSw2MYSQAmr6T7O8H8FrTkfFYq+t+TUdskQA
X-Gm-Gg: Acq92OE5EMNgsl2PS7lNoSKEa7cPFXA+agtx0eoYATIyWVuLav92+lalpNzP4KEglVH
	EhlYVoyMEAstQZIh2g9fB9UstWYOtbBuAlXsGzyIe0f7i9VpZvosPW/Lg9YTUxZx9KyZLrrfEJT
	PFNnO06JUrr5l03xHIbe6L/rkcG3qIai/KBuRhslCabhQV/mXaQBkvH3Wb12TJaMzdTQjyzFz++
	UOh78N8oeu7o0KEt5awly0lahk08N3rAI7YKdSsNhGzAJwvGGXXLyG2Qn4yBK7D7O+nEPypchQR
	LFT6C8HKCqO9VllPvQaLBbKpa4cXaDgfXW0PuEavhutXYeUgTC5v8z8+cR6s5mXF02S7rgUQQ4j
	/CmO3mOkIr0QHNCCx62W4btZGIHG0WrsMQfvCiXTIbB7ZeIdrHhXcEBJBHVv4d7nHPlaXR4N7Sq
	I9YfKDrSM87AqG9aloutwP6cLzKA==
X-Received: by 2002:a05:600c:3592:b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-49044ebc292mr352432175e9.28.1779802295540;
        Tue, 26 May 2026 06:31:35 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:35 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:25 +0300
Subject: [PATCH v9 2/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Allow Venus core GDSCs to have their control passed to hardware, so they
can be powered on by Venus firmware.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..956295289ae8 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0

