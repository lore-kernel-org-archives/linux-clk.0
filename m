Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DD632C8B;
	Sat, 11 Oct 2025 17:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202231; cv=none; b=rHg5CbD04c65ZAKJQ5Cpf2sQ1i+k5Jv7f371yHGOX/7zQXWLu3QszNMWUcOivsMg04MSejHb0Ar2NvmNy7ZC78P4M8MthEKBUflCtzrPLz/FSXbIMxFhnAC4ieA7jsP0203UVmmtKL6SNFemTyZQulLFgchYpUO41g2T3NRr9ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202231; c=relaxed/simple;
	bh=OgRd9DKIlDVdlLs16n9wR/6H4dUIxEK+qQnr04oUkBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWUvHUq0F7BwmWn/rJeBHYH8Pkf9qZktmMfpq0hWW04riCWvbsk32Bvzg+tpXiRCXRfGvbbo+t0AsJHvVFKdKh0pk1zqmAN4tee1GPwN9H0jS9Y+ch+loWxIvdOkiaYBY2jb7Nei3F4FDB8WMP6uoMilySwMAhnIVwzItqfjmUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wEFa2RqS; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sus4tuur; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wEFa2RqS";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sus4tuur"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ckVLr4clwz9tFL;
	Sat, 11 Oct 2025 19:03:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+lTFwEmyMqZfLrzMbsAhF9xxGmCF9QY/mmy+KcU1tds=;
	b=wEFa2RqSxLq1GUplgHHoq4Zg9l1PUKxaN39C99mlgEd4GRbYJZiJuPgokp+cukj5+d5Rmi
	TC++YSeafLVg1z4NuDcM9F73zJEUXgFHURWtcDh331SvBmwbEvYaHli7XQf8z2C45KmrdD
	vLN2S554GwAFHFsuPgIldIM7HHlZFOGlP0qgrOK5lbYGIQNGJkG/6HqA8Dzb0vWRkjKEnb
	0a/oKt2otxt4lSJ8KgFa4qUNbQqoimrVf6OLRnyqKjdtFkUu3xx8N6cM8683YErF0xOiFV
	0Dw9tTWf0nsya1QClRZayi4BJxrmSv3rg7ZflskG0Pp328ACHQ2yZgRGABYZug==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+lTFwEmyMqZfLrzMbsAhF9xxGmCF9QY/mmy+KcU1tds=;
	b=sus4tuur63uGasunqqpxk8HtosOZgl36j4GqYgK7B4uU4NNLBlRj04m8KEz5t85Px7+ngY
	NZBFl32x1qnYJ0qk73U5qSs+xflHXZion0utHv/OPEdCNjX7OQSJ0JIab7XkXiilW5al4O
	e7o/JZVKUUAga7BvSVjeYVCTlxpWxUj6sYuvvh+mjxzEG4F6mWKxwi5k1iuMDihpev7ipX
	ACNu7HaRM/rRgtWiI6fEO2lFVJVYFyuen6svkaMAHr6/bnFYKkApyp51PNGe0BH9b4Q3zC
	LbQpWn0I/V4Qk4wGjgwJByapF4molwfhAFUAv7dT9tlJ5OSQmh0SYd0KI71tNw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 19/39] drm/imx: dc: ic: Use DT node as interrupt controller name
Date: Sat, 11 Oct 2025 18:51:34 +0200
Message-ID: <20251011170213.128907-20-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ntxg5f1bpf6mw9mdz1dowtge6ameta3e
X-MBO-RS-ID: 7f2e8c7ac7db4f74842

The DC on i.MX95 contains multiple interrupt controllers,
use DT node name as interrupt controller name to tell them
apart.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-ic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
index f327ef0918766..c3d7e5aa4ae23 100644
--- a/drivers/gpu/drm/imx/dc/dc-ic.c
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -217,7 +217,8 @@ static int dc_ic_probe(struct platform_device *pdev)
 	}
 	irq_domain_set_pm_device(data->domain, dev);
 
-	ret = irq_alloc_domain_generic_chips(data->domain, 32, 1, "DC",
+	ret = irq_alloc_domain_generic_chips(data->domain, 32, 1,
+					     of_node_full_name(dev->of_node),
 					     handle_level_irq, 0, 0, 0);
 	if (ret) {
 		dev_err(dev, "failed to alloc generic IRQ chips: %d\n", ret);
-- 
2.51.0

