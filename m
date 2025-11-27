Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894083271FD;
	Thu, 27 Nov 2025 13:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251637; cv=none; b=hjuCcJnGthwBONuu9+utyKbHGkQUoOtuBctuWk7JTO4YVPychgPmTSOYBjz1WnQPiORfFykMLNcsA2dnGDdWVoYS51FQUsMsSoVbn24BAeHOtM1g1sJvoNJ9xq5OWDPFKzKyS8T4Ki8ES9RRfoM0RyZGDHst3AeET9q5WD/rxPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251637; c=relaxed/simple;
	bh=guu1X1qKR4/AKzhsNgSucAsgyGe0VT4ouPp8zP0f/Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EUdqTeb3V8vIOrcEb5BR2EXRgAoTl6liONlxWxwjYWJkVs7elk8vz/SDTeVY0KptnAW3ToznbfuR9k5f8LszMFzFbBIeQs5+f2dKO0+aGdhPjS9ttJackIpP9IsQSYU5Yk4M5lbTu5v4JiUvztnSIBkV5TWnKTwEJpX0tO6YF2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiVs2Gb3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiVs2Gb3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49844C113D0;
	Thu, 27 Nov 2025 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764251637;
	bh=guu1X1qKR4/AKzhsNgSucAsgyGe0VT4ouPp8zP0f/Gc=;
	h=From:To:Cc:Subject:Date:From;
	b=jiVs2Gb3We4hUUvAGIrej56XkmaATFRxZkhIga7Ql7AEo37ZeNRxzCVaT72nkp7NL
	 y5yCd8DK1xGvKp7y6aA+kVqVmGo+ih/g7N8GHFfQjT57gdDCw3ZzzWwzCVHonHvnOg
	 c8i+Qif9W+6+g8Pe3MMaHhFsXLUMc0thxPSHPHpz9en1MlRedQ8BDGWLbiFC+MWR8U
	 gDdSrUWrM31l0N3UvrbSlsQT2TkwXGbruEVDQu7pzg0B6ISRV3+jzOcdQdBsUAomKt
	 f4VoUfRZUfC7TW8wWgPQztJ9CQuLkBDoxtsDgPaFdpODArKLt+M2NsYps6Ta49raAT
	 DxU17/ze9seuw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vOcRb-000000000dL-4BTd;
	Thu, 27 Nov 2025 14:54:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] clk: keystone: fix compile testing
Date: Thu, 27 Nov 2025 14:53:25 +0100
Message-ID: <20251127135325.2390-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some keystone clock drivers can be selected when COMPILE_TEST is
enabled but since commit b745c0794e2f ("clk: keystone: Add sci-clk
driver support") they are never actually built.

Enable compile testing by allowing the build system to process the
keystone drivers.

Fixes: b745c0794e2f ("clk: keystone: Add sci-clk driver support")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/clk/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index b74a1767ca27..61ec08404442 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -125,8 +125,7 @@ obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
 obj-y					+= imgtec/
 obj-y					+= imx/
 obj-y					+= ingenic/
-obj-$(CONFIG_ARCH_K3)			+= keystone/
-obj-$(CONFIG_ARCH_KEYSTONE)		+= keystone/
+obj-y					+= keystone/
 obj-y					+= mediatek/
 obj-$(CONFIG_ARCH_MESON)		+= meson/
 obj-y					+= microchip/
-- 
2.51.2

