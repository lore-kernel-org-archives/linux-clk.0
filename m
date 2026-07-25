Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED863A380C;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784955085; cv=none; b=tdL9qvZTYMpsll2Vpp4OoSS70L7uEXN068k4Mj9bWvJaQGiacs0xznqe5F9AdSot/laTsXINLajytMMt7MSDoMhO2vvEFmLTWfEEXIHEL4ZnflBMBEzsSbw3N6Eaf/jBFZYk/RNMrWt0zTunVO6Tzq5zJ9TKQk1ff1BaSYo+Kdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784955085; c=relaxed/simple;
	bh=qlqukEpeHs8YwqY+ZJ5WGtGqzc9V6xyMS9RvFf7xyE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sjuRPn03oXIg3Y36g1d+gSb7CYvstSXX6qnH71YtiOPWfBX45zzyN+kPQCkP8c6mcbHCZLRaG1ZrfhgbfD01KxJLLorHEVRoZlH738U3tmwGDyWxArBtxpZX2ivhH5nhrK9Bj4RU5RdQG1HehPdvbJhk4w0d5ffvI0obqd/OXM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBwMyvs8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBwMyvs8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46B3BC4DDE2;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784955085;
	bh=qlqukEpeHs8YwqY+ZJ5WGtGqzc9V6xyMS9RvFf7xyE4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cBwMyvs8hABqBqxP2ExG6jNaoEfeM2i1tFpnSpaJD+wnQaUCtVlwYJTRyGXCkFzie
	 4XfvpO3iLzoNpBV2oNCSUgZhf3q58nsdpJ6WQqT9Is/BfFWhD4GR0hI1y53x4YRHyP
	 gR0n/El748wIZah0OTvWQC/InMJF71bfgBZMYRZJtlIdpbqmOTQasbcpFrdezIN/FA
	 E+PNbhkI1sVp893Y13jBOSQVP1Z0O0ykiPo5quEd+9o9XgNh+BnKEZYgse/FCnOn2P
	 bnS8LksXyp1SONzscqQ/bDafzXszrRrgSij6XwNyNgGCKCdcNYTQgaTHmSBiDswMwg
	 aYr5pmVPqNE2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD52C53200;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 25 Jul 2026 00:51:26 -0400
Subject: [PATCH RESEND 17/17] riscv: defconfig: spacemit: k3: enable
 display driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-k3-display-v1-17-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
In-Reply-To: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784955080; l=721;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=w6ttYgU0lJiv/SJUYAPaXSKPoe0j2NwHgYQpCKODV1k=;
 b=RuOMqHCM04aU30sdKNUndT2uO/g5y9lCEBtEuaOH6YwkM7KhTjs107cobdqryAZ8eAgMPP1nw
 zlPieTKZ9I1AuWDVZhnYUCrtiEEjAGEEmd5ziVnwjkSjXCIRE2qb+n7
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
Reply-To: codykang.hk@gmail.com

From: Cody Kang <codykang.hk@gmail.com>

Enable the Saturn DPU and the DP/eDP controller as modules, matching the
other DRM drivers in this defconfig; the DP PHY follows through the
controller's imply.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 74ba5acc12a4..c38853d69d55 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -191,6 +191,8 @@ CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_NOUVEAU=m
+CONFIG_DRM_SPACEMIT=m
+CONFIG_SPACEMIT_INNO_DP=m
 CONFIG_DRM_SUN4I=m
 CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FB=y

-- 
2.43.0


