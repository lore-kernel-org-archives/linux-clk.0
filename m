Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED763EE1F8;
	Mon, 10 Aug 2026 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364196; cv=none; b=SOB0LUmUpD6j8QOsHNs4J4PjO/tbBXLUuedMf6P+TUlCdLwfmD1Wnn+v1mB2N2aPc9ljrR84lyNdoA6kbqVrpnOXnDLMny+YqwBHV42VVw1tNF8fjYF3SocIUfYyMJsoHRrtqUukJBk9LOXXe71u5Rp0qPznDlXhXwSwlqnma7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364196; c=relaxed/simple;
	bh=Ficm7zonXC2aFb96eSapE8xIhmoLZMdMHaf+Xcg6rTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vl+xSCceQDAv9i279O46gbeqSU6yi+XGuFv4fFhoneXhRzoAb0Dn5tOlJ8bWZiFKQWKNm+7urb5pAgObQlRqmR9WfVuAUPkvUhAKiwENPYAEeXd2XKbe7SV1X67DykX62iNDhgoqinfg/51RjROgbhMeT/BozXlqqham6fqzZpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=JeHLCWyE; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="JeHLCWyE"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B805C051C;
	Mon, 10 Aug 2026 15:16:31 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364193; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sqrx4ikcXrAn8DGvjuumVqDdeyjA818dinNYnkqF66s=;
	b=JeHLCWyEUzzhHs8YZrYxBVZDt9I5y/H0XdVxW7IbEtBBvy9UQlYyOojVFdCXNNjEb8EhrP
	XusHB38mUu7EQQ1Ri/qjlpuFqT9FDcEqeUdi5fqF4if6vUaLzBR/7tMISPY+qXk1Yrd27F
	sm+wVdTndkmE2SwY4EZ2hnOOc/Wdj3WZ/MvSKlQO7Ulcv6gshB352lLiY3QR4ZbKYFq06Z
	u0dApIKvxvIW197GjLABJdfy4M/dT8gV8Owel0NmYAxYek+txN0G0ieKix5UX3xUJoIkka
	ld44GQTG7wbDJLE/Y/oA4kLIz7VcXSsIVXVj4KWz3gw+ZwJTYEIYvBGd5Hfa2g==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 23/25] ARM: dts: rockchip: add arm,cpu-registers-not-fw-configured to RV1106 timer node
Date: Mon, 10 Aug 2026 15:11:14 +0300
Message-ID: <20260810121121.210040-24-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The firmware on RV1106 does not initialize CNTVOFF, so the virtual
counter may have a bogus offset relative to the physical one.

Add the arm,cpu-registers-not-fw-configured property to the arch timer
node so the kernel does not trust firmware-configured timer registers
and uses the physical timer instead of the virtual one.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index b31cdb1c19d4..12e87d25c72b 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -57,6 +57,7 @@ timer {
 		clock-frequency = <24000000>;
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>,
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
+		arm,cpu-registers-not-fw-configured;
 	};
 
 	xin24m: oscillator {
-- 
2.47.3

