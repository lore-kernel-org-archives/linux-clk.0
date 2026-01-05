Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739E826C39F
	for <linux-clk@vger.kernel.org>; Mon,  5 Jan 2026 20:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767646060; cv=none; b=d3w56AHGSFCpKUuE8E/t7HpvGOYp3CqJVjXBC0Dfimi5tJ6SEuq70J/DOVBA85r8yomqUBkCLGI8WZynTPrpu0gJIyBFbFQquci8dFZJAMRQMfFjyv3mlCIqJgw+lXVIGy78zSP/dI4VOuKNv/8TALSMJnwv2MslNKGYGjYt1I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767646060; c=relaxed/simple;
	bh=0VAR2uGUADmfTlwExvcLmIU6kRzgQsaMead1f1zEs5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCgMpEjFvXddKtCNWzQJgIE70JLk8thEh238xP5k1AOmrnV0T5nG2nw1tYdhPLaCL1OIF5nfzGe/vjLLPupODB3LGPceIbwemfp7zPk9COEIDiQ5nh498BKbOhB7LPMqEMG0U2a6m05ACO6jvlb2WX5uT47L5kfLN2MlvoHzwqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=l9bHp0RQ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="l9bHp0RQ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so64663166b.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 12:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767646057; x=1768250857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hizUAH1iD19ouU6HKSD59ruDhjDWmQAYbT869eukFQc=;
        b=l9bHp0RQeHCXbzP2lQF2J4f2+zRH6j6lg/LpdNPDcoLc2GXiRqXHgF/GHv0UBIRsmS
         ta6wIgY5TWXu2Dvh/a56j18/bGVbx29D3z0pGJZeugsjAxlDf8JWuYnfIQZkyfUm1qwJ
         JFh9o1DS2WKGDU2Zy/QLRhU6aFkrdCHN3Iqu8znJSrR+6cu0cLa83sGk7nsFNybKrReH
         JtNNrz6Ux62jnErsg6cJ4hlkx7+2i6NDTocruYl9C9KZtLpnfQfD8TNVAqezkFNipiwt
         Oq8zHLQDY8MUJYP7Zq2kJsXatOm1mMHPW8Zql8sACfXijmE1Nn1ogERelKTfJLdMoYYz
         4hPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767646057; x=1768250857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hizUAH1iD19ouU6HKSD59ruDhjDWmQAYbT869eukFQc=;
        b=RTZql2CsWhCJvPG0Pjgt1JnlaRjcFQT7hEY5obhbdQqhyz0j1rpCrXJ3iJvPX0sE53
         G5TLc7ruaiJyJYxz3FD1NoQUhoUBYlL+cUEms+JfLZlNoMbpP2RJ0HzRHgLbeGa7V89H
         3R28i3XeDyetNWeZeyYwx3+VjYOqt7egu/MP1756y7kKI1Cmj7oZWSxuooXHSYdKnW4h
         jKYbi1/+f2eHUObmsizqRYJI89/8CH34gMGJ5ToyN+ubwR5nzRczQCH5YDcsyPuSxQDD
         /rz6VAzqj9CJxPCbf91ErJV/wxMiCDdO3HE/9ViIVGO9s+x2H1it/eflD9yVko3BCZ1L
         b6yA==
X-Gm-Message-State: AOJu0YwaRn+thf4emUDsFZMCR6kthAgZ8rIMFOXFiXRlXtzJ6m8v8lVA
	xAB2F9cl78vA8ic5ORjEGV/IZ3c4dy6mzKn27R4lbCvn3Yd6ACQu81i8
X-Gm-Gg: AY/fxX7F26h85ZhuOKRIAjNcN0r1HRRHcA0NXdcB7CxZlpDAg47AKtKQPbKTgN8WYjZ
	HjNEE3zBDlPDrm02bHi+g/UgWv6VijukXqZ7qwfBjWoaQCWH16RovhJAU+TX3drUszvBkIyjDE5
	WRZriKpyndSpaPact/4ecftUuyN0W/BZ5fOLQOv2+PwS1Ef3D9gxRnJGAKn1jaI4XjVmVssYq3+
	VIpgoVZMu6tzrMjZXAG2Pzm3TQ/vVqFLV7/DkhLEZd6Zmj/qilcPo2Z0mJabu9YvDEFGq9BUjoD
	Byi31e2SgmoFc2E4zmcWdVrnSEAxHcz9KDW/UqFwhHDaF6y+UdinDCTmtUqQm4w3MpbgsuxgYfW
	tYhdnRvGh1MgapMzF+PvDcdDUPMqXB+vkZuO7vN8r+oviddJSbZgF+oOC1juPdvtUA1MSP3t8L+
	+0lqPHInF8nxo+xHYgAylRu642ik7NGOPNu6/S+vWM65BGgRW6FP/qmeSa4MD9QKxGb7vXed8XA
	tdmYmiALgTy9IUaIoWP3c92fiS/UU5yoy5GrUs5ZA==
X-Google-Smtp-Source: AGHT+IHoFwU8UR+te3U4dWAJlcYcZOAjrsIoaFipeIJMAXppeowFkGiwsu7iqdcxUVE1fCrIPqg8ww==
X-Received: by 2002:a17:907:3c8e:b0:b79:f965:1ce1 with SMTP id a640c23a62f3a-b8426bedeb1mr92268466b.42.1767646056667;
        Mon, 05 Jan 2026 12:47:36 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a8ad-5500-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a8ad:5500:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a233ef3sm26240566b.1.2026.01.05.12.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:47:35 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/3] clk: meson: g12a: Limit the HDMI PLL OD to /4
Date: Mon,  5 Jan 2026 21:47:09 +0100
Message-ID: <20260105204710.447779-3-martin.blumenstingl@googlemail.com>
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

GXBB has the HDMI PLL OD in the HHI_HDMI_PLL_CNTL2 register while for
G12A/G12B/SM1 the OD has moved to HHI_HDMI_PLL_CNTL0. At first glance
the rest of the OD setup seems identical.

However, looking at the downstream kernel sources as well as testing
shows that G12A/G12B/SM1 only supports three OD values:
- register value 0 means: divide by 1
- register value 1 means: divide by 2
- register value 2 means: divide by 4

Downstream sources are also only using OD register values 0, 1 and 2
for G12A/G12B/SM1 (while for GXBB the downstream kernel sources are also
using value 3 which means: divide by 8).

Add clk_div_table and have it replace the CLK_DIVIDER_POWER_OF_TWO flag
to make the kernel's view of this register match with how the hardware
actually works.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/g12a.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 185b6348251d..19057d2dff47 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -777,12 +777,19 @@ static struct clk_regmap g12a_hdmi_pll_dco = {
 	},
 };
 
+static const struct clk_div_table g12a_hdmi_pll_od_div_table[] = {
+	{ .val = 0, .div = 1 },
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 4 },
+	{ /* sentinel */ }
+};
+
 static struct clk_regmap g12a_hdmi_pll_od = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = HHI_HDMI_PLL_CNTL0,
 		.shift = 16,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = g12a_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_od",
@@ -800,7 +807,7 @@ static struct clk_regmap g12a_hdmi_pll_od2 = {
 		.offset = HHI_HDMI_PLL_CNTL0,
 		.shift = 18,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = g12a_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_od2",
@@ -818,7 +825,7 @@ static struct clk_regmap g12a_hdmi_pll = {
 		.offset = HHI_HDMI_PLL_CNTL0,
 		.shift = 20,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = g12a_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll",
-- 
2.52.0

