Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A76F2C08BB;
	Sun,  9 Aug 2026 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786281322; cv=none; b=oguYBXXzxTMfZT27HNlLYZJBbH/b6BW7lQpAXEeY/oXZBkGOFyGPL8fbx6oIzKT3Ls0qI4h86SfB99WOcnrFRohluiOgnOWaZIIQ0lNGX9SQI+o2ToVi2IoT63xuQxoToiO5ViT75oWr3haBDWmS95sGytCdKugKDi46P2Ex7DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786281322; c=relaxed/simple;
	bh=xyx5Knwd9tvdkgwyRcBleIrC6UxSeyd22qUIH6XE8hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DiWkSw/YcTmsVQ0a8k5Bx2i5SSsZqPi4Kp3/G5NdkpttR015pUtRY21lW177tjpqR0v3QTHOeBoN+ID2b7ZnDTHrxqyrXCzrQtTeVLxVH74jUNXYeTPh6CIvc3FOkvWtOy/GQIUMZPr43PmTO0X0k0V2UpUO+eaXPRGoERRKuJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdqUVxPS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdqUVxPS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3793DC2BCF6;
	Sun,  9 Aug 2026 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786281322;
	bh=xyx5Knwd9tvdkgwyRcBleIrC6UxSeyd22qUIH6XE8hc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FdqUVxPSmT/6mIs0mUC4WA3/xs5InaT0U8e8MYR3oHXYVpKM/xd+rUe7Gd/obnco4
	 QSMKDCCUMGveUGB8Z3csXqubhj/hmi/cO9dzj46iX2l/55GtjkIId9feKODHyeoUlK
	 8gJA6/i1Kg0PolVjnEm+arsQEZtuOXiQEeI9U2/F1fhLxvIU59keGq95SRbY1EwpmU
	 1SiyOSFHGLXcUf7+JjfQvGXLChD5TLNejwT2iv6FfBnyynqYIF10PWvXbjwd4PvqVz
	 lzoHazETYMSy6tHmzK051kuT+aKx0OM9UzGmuX73RvV+Ve2TNNXSkDIuRzbsew6hj4
	 59+9VFH2+07NA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B09C5AC80;
	Sun,  9 Aug 2026 13:15:22 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sun, 09 Aug 2026 21:14:26 +0800
Subject: [PATCH v2 17/17] riscv: defconfig: spacemit: k3: enable display
 driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-k3-display-v2-17-327d7910bf71@gmail.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
In-Reply-To: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
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
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786281298; l=748;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=Rd/W3ej1+Yyo/sB25RLlb++aIWJg859l4StFtHsgjK8=;
 b=CGNvvC3Y7+GnTLkC46shxSTTmyvXWSerSCcWunxZ10Ouix8etzsTd5apjredzhbTIAvwWPN9Z
 cFSspUHSKwXBqrI/zjyP4MCCg8pxADiKbQbfpxdfC1APH+UsunJJHbz
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
v2:
- no change
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 74ba5acc12a40..c38853d69d559 100644
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


