Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F6B360EC4;
	Tue, 14 Jul 2026 01:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783992910; cv=none; b=ARvjWeJEDjpvPmTShSPsHtxCTlHyATsR9k2CbeJLjd2YkVdbvXDs7Zr1t9e/lQJ0OkfrpQuH8eR+reb1RiuYgob2I0HXQ2TRSvCRbI/Mko3Nvd+7aLSKO+ZMHXxmWsAplnaQ4T7AZC0bP6BkHbLUeTf4ppvDyhJiO905cM3o95U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783992910; c=relaxed/simple;
	bh=i+vNWFu0WMNpWI91QVE2Zdt4dVaM7AXfu0XL56oslRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8byqT+0tUO0/95FIINtkx3QIgho+7GOpd4owZpK/TLrfEHaIaeAPEOlKgdQXV0z1q5b4DqntAinx+wZFqYovo/18ZnaHjCEjYsH8TN5kuIQfCmGbW2lhL3NmUzkIRCljV7iMoFgnyrbHfR6MCrTECXOl8LzQCwaGR+K54WxiLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9EhaJ3Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9EhaJ3Z"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA7DEC2BCB9;
	Tue, 14 Jul 2026 01:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783992909;
	bh=i+vNWFu0WMNpWI91QVE2Zdt4dVaM7AXfu0XL56oslRc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l9EhaJ3ZwQo6rzj4WepxsnmgXPrtzzQBTplNoY4ECz1+SRyg1maLKqYe4kJjHPhnt
	 cLw9DGKuntK2lNxyr6BgPdZBZDplIkhv84AQyw9ZI8EaKPR1RZDlRyKphLExjLqk8c
	 AhFOR8APl2RqXJzMMXmKcHHzAF+epgxdLT+5CkzAyfwx2xJrNtv7YM2UEqqgKGf0J1
	 4mU4PgGPz6sqeaA+ntSbeJl4xwgz2x0f/jYLwxiw8asBKBQ/8exV0ycumDDmA8gBD9
	 QcYk46w4sm8qeW2ok6so/8vNqW6rvPdW2/YizrmuD5hRValaVJY9GqfvFN2OknObO3
	 FvK6VhYKNBXlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C492C44501;
	Tue, 14 Jul 2026 01:35:09 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Tue, 14 Jul 2026 09:35:07 +0800
Subject: [PATCH v3 1/3] clk: composite: Export devm composite pdata helper
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-ultrarisc-clock-v3-1-4b1ccaa26b37@ultrarisc.com>
References: <20260714-ultrarisc-clock-v3-0-4b1ccaa26b37@ultrarisc.com>
In-Reply-To: <20260714-ultrarisc-clock-v3-0-4b1ccaa26b37@ultrarisc.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783992908; l=797;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=8T/bzSyCQgQUdtW8jZQCk07FkbCd8+9jHeSg8tcJ/w4=;
 b=I66Zq+FmxIu0b3yH8s5tk9YjFDzCEY2GPNmcpVat1RMClR8P7hb4dRbNGPsT7RIjF3vrdGAHC
 /fkb2AITbfCDwgyJ5ikrnate2AnNcqyJH4uyMj9S0Xvwbh6akWkpWyR
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Allow modular clock drivers to use
devm_clk_hw_register_composite_pdata() by exporting the helper.

The non-devm composite helpers are already available to modules. Export
this devm variant as well so users do not need to open-code devres
cleanup.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 drivers/clk/clk-composite.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 835b1e4e5869..11842bce5918 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -462,3 +462,4 @@ struct clk_hw *devm_clk_hw_register_composite_pdata(struct device *dev,
 						rate_hw, rate_ops, gate_hw,
 						gate_ops, flags);
 }
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_composite_pdata);

-- 
2.34.1


