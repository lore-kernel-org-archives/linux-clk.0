Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADF335AC24;
	Sun, 19 Apr 2026 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776600017; cv=none; b=NGOPgJzp4lNE5OLX4znAR8zkAwH8xo1HXExfbsuZQ1oS4+e2zuMEM13Hm8zxDAMiwgQRHG7y4j7d//uppeJ8eXtjNYfNq1ipByNH64rkkB7LOBI57/7fj5+BoBqq+7T/k/Ops7lXMgV2k2Zckq17CVYvAuHowRkxvEuxkQNiykw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776600017; c=relaxed/simple;
	bh=r1SkPPydlBOIm8udGkFqPv+zpQaBol9w5Mkm43oRDw0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xt6738MXZTpQpgznaIjDw9cnGFmr1kTjpG3ZOUQawJ58ZuwTGwS97vu0gop+8SIdu03wwlWxLdH8jiT8bH7z8M5XskOBxYQFE+gT1PIGxXH8ljg+1A+xCQS/F8jWJ7hcnchtpkE1Yw/xJ55JzRRY6iTEoUaASO4EvhboNW+l4o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=pass smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=Y2lyVA/+; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="Y2lyVA/+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TZqO5/zYANJpAE1cS811lXxJvdTPmWyQ/PwqDeOFtrE=; b=Y2lyVA/+6Slvj3tM0jYEF/seQU
	WU/bjvfV6cGpb0ug+3mWc8anm+Z26nKt/oMqSIAELHjgdMrFLbUlEcQDAw/JteR8Vb0xkbY7o/ctA
	q8vy9EbHfdzNxA7TyMVncDgYbnw1GwdlM0IoZHYA7m0yMYDOAtad0+T3R7YDkanU6oEX3zZfOVhfF
	9U1oT4xn4zi2EWqZkxKKLpolP5kF+mth7vQLeVHq+SSM6GXruXv0mijTpCzg8t/U/ss9/owsCrQOO
	6+o4GTQkw3N/4/qWCOwD1corym25ee3ZuJ+77MIG+iuebhdngVtR6+HeXQlJFCBkEnzQKSMoU6tz5
	HRKXdhGQ==;
Received: from [2a0d:52c0:500f:0:89e7:36b:a29f:1abe] (port=50188 helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1wEQYV-00000000aDt-27Ex;
	Sun, 19 Apr 2026 13:43:15 +0200
From: Daniele Briguglio <hello@superkali.me>
Subject: [PATCH v4 0/5] clk: rockchip: rk3588: add I2S MCLK output gate
 clocks
Date: Sun, 19 Apr 2026 13:43:05 +0200
Message-Id: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNSw6CMBSF4a2Qjq3py1IcuQ/joJQLNDzTYqMh7
 N3CiBiJw/8k97sz8uAseHRNZuQgWG+HPoY4JcjUuq8A2yI2YoRJwqnEruEXpXBn2gZXegJcuRI
 bkVNFBFelISiejg5K+9rY+yN2bf00uPf2JdB1/QMGigmWsswzzYRMqbr55wiu0a09d4BWM7C9k
 x04LDpGGFVonZNUsh8O3zmMHDg8OpkinCvQpmDmy1mW5QMfzyzySwEAAA==
X-Change-ID: 20260316-rk3588-mclk-gate-grf-c4b180438fc0
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniele Briguglio <hello@superkali.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776598989; l=3569;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=r1SkPPydlBOIm8udGkFqPv+zpQaBol9w5Mkm43oRDw0=;
 b=lubJrv9kgpydRivH8D+BbR9768NZY1HEJ3CqujvrxTzXg8fOrmAqoWeMWuvpDCyyXu8nuEB/3
 2A+j1q252vBCmghEYREvT2Jhp0U0Pvpe93GdoI6+3rHr1isnoe8BSHW
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
Patch 3 introduces rockchip_clk_add_grf(), a helper to register
        auxiliary GRFs, so SoC drivers don't open-code the aux_grf
        allocation and hashtable insertion.
Patch 4 adds the RK3588_SYSGRF_SOC_CON6 register define.
Patch 5 adds the four GATE_GRF clock entries and registers the
        SYS_GRF via the new helper.

clk-rk3576.c currently open-codes the same GRF registration pattern
twice and is an obvious candidate for conversion to the new helper,
but that refactor is left as a separate follow-up to keep this
series focused.

Tested on a Youyeetoo YY3588 (RK3588) board with an ES8388 audio
codec connected to I2S0, and independently on a Mekotronics R58X-Pro
(ES8388) by Ricardo Pardini.

[1] https://lore.kernel.org/r/20250305-rk3576-sai-v1-2-64e6cf863e9a@collabora.com/

Changes in v4:
- Introduced rockchip_clk_add_grf() helper and used it in clk-rk3588.c
  instead of open-coding the aux_grf registration (Heiko)
- Dropped Reviewed-by from patch 5 since the code was refactored

Changes in v3:
- Added separate patch for RK3588_SYSGRF_SOC_CON6 register define
  in rk3588_grf.h, replacing magic 0x0318 (Nicolas)
- Dropped Reported-by/Closes tags from the driver patch (Nicolas)
- Added Tested-by from Ricardo Pardini (Mekotronics R58X-Pro)

Changes in v2:
- Patch 1: shortened commit message (Krzysztof)
- Driver patch: added missing #include <linux/slab.h> for kzalloc_obj
  (kernel test robot)

Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
Daniele Briguglio (5):
      dt-bindings: clock: rockchip,rk3588-cru: add I2S MCLK output to IO clock IDs
      clk: rockchip: allow grf_type_sys lookup in aux_grf_table
      clk: rockchip: add helper to register auxiliary GRFs
      soc: rockchip: rk3588: add SYS_GRF SOC_CON6 register offset
      clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO

 drivers/clk/rockchip/clk-rk3588.c               | 16 ++++++++++++++++
 drivers/clk/rockchip/clk.c                      | 25 +++++++++++++++++++++----
 drivers/clk/rockchip/clk.h                      |  3 +++
 include/dt-bindings/clock/rockchip,rk3588-cru.h |  4 ++++
 include/soc/rockchip/rk3588_grf.h               |  2 ++
 5 files changed, 46 insertions(+), 4 deletions(-)
---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-rk3588-mclk-gate-grf-c4b180438fc0

Best regards,
--  
Daniele Briguglio <hello@superkali.me>

