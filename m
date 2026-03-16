Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0746539D6ED;
	Mon, 16 Mar 2026 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667839; cv=none; b=f3fD911jMqns8dLiVeJD3J7+qLdqnZ556rhiit9A+xwy04WWlUSTidaLcNQrBIPDJu+8CdMEF5S2KQYTba92BlruPqlB/J2Sh60ATl7UrFP0FhNsU6gsasQkXnoxL2GypnGXSdKVjZX32smSvhsa47meZKuLlzKr9j2Yc0dwIPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667839; c=relaxed/simple;
	bh=E36lowatpLuY/OY8y9/Hl0XNxREfhNrdukb3xvYuYxo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oLubTWAOVBT+arrStOmKfbew19iIdqDMo/OKDM6M5HK9/63n2nYC3kF2llBtFcGlMJXctrkckTYiZl3G6uyg01g7i3NUQy0WqL7/eGMFK4srokYYuR0ZoA037d0I/tUp/EEOpX/EDkOyVgD67NnwDbq/1+lJHw5kKWv6tI2EdqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=fail smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=o7EAdcw2; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="o7EAdcw2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9yZUuJFFGk4gnRKvzMu6LLsSeZw6eWPtqDfuAIYlQGw=; b=o7EAdcw2sYkPQsol2/wD4tI+ae
	COkU2var4Q4WCtW8BNGo/3lGMHJkCPRD6X1M5H6bWmUox1s94VF3OuW/rTzqvgo63UCspEuuXapzK
	ZkRZntRKyb36lmosJwXGJiVJyek4oSvG5gEuL4YF7a7g9YLHXi9T/PN7DxYc0ghEAqqSxzJTy5wg3
	bMAD02n/YHLPWIVxsC6rf/00c9T8UtHsTbDQZ0odNy0OA3BYHE1+GZn1Jp2vjfu2R8y8afxOhV9xd
	pnU5/04Bmc1j8PC+AsRJefeXSPYnam0PlaNOfiAAI0RXoAlGN8WtMM3r92uP7qZ85SVIfDgelNiYq
	MzgOOICQ==;
Received: from [185.94.132.237] (port=54871 helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1w27eW-0000000BDZB-0kRV;
	Mon, 16 Mar 2026 14:06:35 +0100
From: Daniele Briguglio <hello@superkali.me>
Subject: [PATCH 0/3] clk: rockchip: rk3588: add I2S MCLK output gate clocks
Date: Mon, 16 Mar 2026 14:06:30 +0100
Message-Id: <20260316-rk3588-mclk-gate-grf-v1-0-66fb9a246718@superkali.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gZaq1K8irjQmtbgl1REEO9uc
 fkWMw9EEqYITfaA0MWR9y1B5xm4qd8CIY/JUKiiVkbXKLOprMXVLTOG/iQM4tGVg7aqNNY7BSk
 9hDzf/7bt3vcDFzyza2YAAAA=
X-Change-ID: 20260316-rk3588-mclk-gate-grf-c4b180438fc0
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Daniele Briguglio <hello@superkali.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773666394; l=2347;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=E36lowatpLuY/OY8y9/Hl0XNxREfhNrdukb3xvYuYxo=;
 b=Oe9QKQlor8RRH8UbErzyI2J7eDZ9AW4kri/Jhj4WZnnv6/BkP2SrjfJPJ6ziJbqeArjUjMdkN
 r0g8vkRwqR7CFd+AtHWVr+c1/yVzUrsczG1iBrbvZZJub1jcd5SmIhn
X-Developer-Key: i=hello@superkali.me; a=ed25519;
 pk=5tynRWQdL93CDcapJ73FkcCRY2PeBOJOIAoIhRig53U=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On RK3588, the four I2S master clock (MCLK) outputs to external IO
pins are gated by bits in SYS_GRF SOC_CON6 (offset 0x0318). These
are set-to-disable gates with hiword mask semantics.

The TRM documents the reset value of these bits as 0 (gate open),
but in practice the Rockchip firmware (BL31) may set them during
early boot, preventing the MCLK signal from reaching external audio
codecs. The kernel should manage these gates explicitly so that
audio functionality does not depend on bootloader register state.

This series adds GATE_GRF clock entries for all four I2S MCLK output
gates, following the same approach used for the RK3576 SAI MCLK
output gates [1]. Board DTS files that need MCLK on an IO pin can
reference these clocks (e.g. clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>),
ensuring the output gate is opened when the clock is enabled.

Patch 1 adds the four clock ID bindings.
Patch 2 removes the grf_type_sys exclusion from the aux_grf_table
        lookup, which prevented SYS_GRF-based GATE_GRF entries from
        being resolved on RK3588 (where ctx->grf points to PHP_GRF).
Patch 3 registers the SYS_GRF as an auxiliary GRF and adds the four
        GATE_GRF clock entries, each placed after its parent MCLKOUT.

Tested on a Youyeetoo YY3588 (RK3588) board with an ES8388 audio
codec connected to I2S0. Without this series the firmware leaves the
gate closed and the codec receives no master clock. With the series
applied and DTS updated, audio playback works correctly.

[1] https://lore.kernel.org/r/20250305-rk3576-sai-v1-2-64e6cf863e9a@collabora.com/

Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
Daniele Briguglio (3):
      dt-bindings: clock: rockchip,rk3588-cru: add I2S MCLK output to IO clock IDs
      clk: rockchip: allow grf_type_sys lookup in aux_grf_table
      clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO

 drivers/clk/rockchip/clk-rk3588.c               | 22 ++++++++++++++++++++++
 drivers/clk/rockchip/clk.c                      |  7 +++----
 include/dt-bindings/clock/rockchip,rk3588-cru.h |  4 ++++
 3 files changed, 29 insertions(+), 4 deletions(-)
---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-rk3588-mclk-gate-grf-c4b180438fc0

Best regards,
-- 
Daniele Briguglio <hello@superkali.me>

