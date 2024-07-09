Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECC113212D
	for <linux-clk@vger.kernel.org>; Tue,  9 Jul 2024 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720511371; cv=none; b=tzQJkCNFpeXv8LxRllnUoUJrypDZU/HTmyXB0B9DZGIkFkV6AYUJ1vlBXeCU1+plY9njx/JrGk7LaJYFrJ4EINAngXu6CGVjyfekZgpnmGKdF7D5pMyjFDdLaz1LgN4VBsOBExEiSh20LVmOLFv0o9VK3zrxdbMgai/vO+wJHug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720511371; c=relaxed/simple;
	bh=Y5xf32LF65iUvDkAjilQUs2nX2OhvOA8BdVfijThWWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RYnkZqYtZAJzyXSBzXk4PWLCJNqj2Av2blOZtrqek6jsC0NvCVQsH4xouCfd36E+WC/WQ/JHadlwMdlpdqu7/uf/4P6FfLFrxY2xLMFc/bAAIFztx+e/unZLV0dirfR1REbUkvjxahkJy1JytHQ5m0ZpDPA+s7ZxeQ/6RFl4lz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0Tg0X5M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0Tg0X5M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25259C3277B;
	Tue,  9 Jul 2024 07:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720511370;
	bh=Y5xf32LF65iUvDkAjilQUs2nX2OhvOA8BdVfijThWWM=;
	h=From:To:Cc:Subject:Date:From;
	b=C0Tg0X5MKEF2xjl5ETefR2avkBRA7jW7kwBBLVPK/xI3fM72BQAIkEWoajny5uR6e
	 UKmpLyRAmyCtPJWumxdOVAXpzZBwVX7lAlreaKxtr1zMdCQkjdq2LOmLZEy2ZqGaCA
	 Xu4H3gLldWzmHVpCEylzaqnklgfsfmAuGX646P3XSYswWJc9dbof4bTWPCNacwoRWE
	 Lwp31vRb07nieoSB9YwToelKwDrowJI8O9aTM4yF80PKPA/CXoeWh58fCCAlJO1X9+
	 0P51quYuQ4iCjLFKhXbIWSnRo+2chH1rpAs7SKBzTqM11YKJHlR6mB3Z9JABbHJ1Tp
	 tQjBWrJEu8qPA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	nbd@nbd.name,
	john@phrozen.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH 0/2] en7523 clk changes for pinctrl support
Date: Tue,  9 Jul 2024 09:48:53 +0200
Message-ID: <cover.1720510991.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce EN7581 clock driver IO region since this is shared with the upcoming
EN7581 pinctrl driver. This change is not introducing any backward
compatibility issue since the EN7581 dts is not upstream yet.
Fix fixed rate estimation for emi, npu and crypto fixed clocks.

Lorenzo Bianconi (2):
  clk: en7523: fix estimation of fixed rate for EN7581
  clk: en7523: fix scuclk io region for upcoming pinctrl

 drivers/clk/clk-en7523.c | 136 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 128 insertions(+), 8 deletions(-)

-- 
2.45.2

