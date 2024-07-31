Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14BB1662F6;
	Wed, 31 Jul 2024 20:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722456886; cv=none; b=bbIgn4jH92IJE2RCwXBRlWTgLFgRD46x1reJTbEAlnmWE4ZYhsx3OawhbVPp8XkrVXmRFvuyW4Rt3BzUkhC5yJMRpe1V/nhap4IjZtQXWFV12yq3TfwUB2y2kZrX2KLL8VzOY/fuJOIwmMApTPfzCEbReLzzW/1aG7RJbNMVoUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722456886; c=relaxed/simple;
	bh=tMhpetnh40I4ns0pZylCMUve7dx/xgFLkF9dXVERM4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=agCct40Fv/NUqOtnurqsTVjxcIoGVk/zX0h+1qGalB5Bd6ZbvliBRsITwHGAJuZhwNIDzGcZZuknL0toSlGXNqGuUuMq1PABGfNW3Hy5hjPcJwTULQojrs/wQvoEcNnsagJGiHSjIN1gvtPbGGKU2/byOj/W/SZ+5sO7JMODnbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3lFIqEb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3lFIqEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F34AC116B1;
	Wed, 31 Jul 2024 20:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722456885;
	bh=tMhpetnh40I4ns0pZylCMUve7dx/xgFLkF9dXVERM4s=;
	h=From:To:Cc:Subject:Date:From;
	b=o3lFIqEbQjiSdrOEgD3ceFQvHfj6ERRDdjoc+GJptOG7PuNLNBdmJZ3anKVI29D7U
	 hJh9/b7/vxrS8Gq9DzOKO4g/QZWXtsdN6pQg85LTrXvVZ6l3IEdbHFYEl/fZxGuqDH
	 HVd29BFrgTfRbz8BXTB0tE9gO4eglT6ARvYBiZfGQCoShhbqZKmIlaOlkeIgyqdexn
	 Nq56e1u4zYba3yIPs7wkuY42B/wWwKnc0+NdMHHHOB94wMZddm+LtNL1Vm5Ipy+FcZ
	 oT3zTVPsIT/Cf/TgPNidlJJzgyDe4V//D8rltpe0QsGSKEBSVlOP46LDtxIVPGGtC1
	 APDFXx2OiLN5w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: at91: Use of_property_count_u32_elems() to get property length
Date: Wed, 31 Jul 2024 14:14:02 -0600
Message-ID: <20240731201407.1838385-7-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace of_get_property() with the type specific
of_property_count_u32_elems() to get the property length.

This is part of a larger effort to remove callers of of_get_property()
and similar functions. of_get_property() leaks the DT property data
pointer which is a problem for dynamically allocated nodes which may
be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/clk/at91/dt-compat.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index a32dc2111b90..f5a5f9ba7634 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -563,9 +563,10 @@ of_at91_clk_pll_get_characteristics(struct device_node *np)
 	if (num_cells < 2 || num_cells > 4)
 		return NULL;
 
-	if (!of_get_property(np, "atmel,pll-clk-output-ranges", &tmp))
+	num_output = of_property_count_u32_elems(np, "atmel,pll-clk-output-ranges");
+	if (num_output <= 0)
 		return NULL;
-	num_output = tmp / (sizeof(u32) * num_cells);
+	num_output /= num_cells;
 
 	characteristics = kzalloc(sizeof(*characteristics), GFP_KERNEL);
 	if (!characteristics)
-- 
2.43.0

