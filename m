Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B0C3955F1;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784955085; cv=none; b=dPlqKNhgnwUIaX9MtxY/Zf5afbiDWF68oSr1QV5qMYNwT0lSEqGLqXvRtl/upCm8NZiQJtnasmn0v6Ip447OSLI/az7ESt5sA+WJN9e9ndni6GzYrYNmhDaMVS+n/kvA0v0r/meKnVsknc4PYSIEWMBM3Hx+l/h6O+FnjxUQwBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784955085; c=relaxed/simple;
	bh=wonA2vEJhnyXD4bYv5jPRPqPzb4hwC+tlaZ3VFa9dHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SCt8G+CS6TyWUE/OhG1nbgf/R0uDmahWquxGAeqdJ27biBdzlSwFKWMeB2XOEmz+p7lyNnzqz8cmAH4/zbZgeF8SCOBREOl0ipDVBdihXyPbnL2pTyArpSU53Fz9vKZJ2JJhjX+EHilu3oZbCggTbNjBjNbZPjMegnaq5Z+d6u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYuTlsUc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYuTlsUc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12845C4AF13;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784955085;
	bh=wonA2vEJhnyXD4bYv5jPRPqPzb4hwC+tlaZ3VFa9dHk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AYuTlsUcxM5dFsQ7xt3r1TZt1hWoixxBMRPYeWjf9eZorntcJFx9lYPP9xM3dv+/7
	 vm4KfLS20OkyY9CJFVtBvGYwKmtO2V0wM1Ij6D6sQbUXxz8H/+MxUeaqHPkRcQXcT+
	 gXsuRYiaIvMDat0rt8GkEB3uqK26a2Xs+ZFRGvIOtIIrU2lyQ6V3GWzgzCSgbtnycu
	 1yEM09Ar3Z17XRHO5aZbp0I4NDXMpjKU1bUqpvtm7sVsSY18mfT4OgpObKK5VP2w8p
	 MCI1k+f+nO0MfGIpAMYk4YFCKSyn6nIZEbhR+BaadmLBzCE+3BaZXjpeDqLXkqNWgH
	 7Y3FmcsqNKZEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EDAC53209;
	Sat, 25 Jul 2026 04:51:24 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 25 Jul 2026 00:51:22 -0400
Subject: [PATCH RESEND 13/17] MAINTAINERS: add SpacemiT K3 display driver
 entry
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-k3-display-v1-13-6de34d80e86c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784955080; l=963;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=sD70Be1EFEVlYgvCDT/fN9L+7DpFEJJVPuxwpoqy0M0=;
 b=JunK0B0lMIefh4A2iXSV7mdOgkju4O+Ip2oD/jP3gQ1IV9rknEXR45NmcpGfCiwONNCsyxIa4
 piKVtcIPjs8CV9u1I06GpLyqhHNqh9LkOPsNiDzAwapYUZCCiH8sZ9c
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
Reply-To: codykang.hk@gmail.com

From: Cody Kang <codykang.hk@gmail.com>

Cover the Saturn DPU, the Innosilicon DP/eDP controller, the DP PHY and
their bindings.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dea93a41962..9f2910a17c38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25436,6 +25436,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 F:	drivers/i2c/busses/i2c-k1.c
 
+SPACEMIT K3 DISPLAY DRIVER
+M:	Cody Kang <codykang.hk@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/spacemit/
+F:	Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
+F:	drivers/gpu/drm/spacemit/
+F:	drivers/phy/spacemit/phy-k3-inno-dp.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

-- 
2.43.0


