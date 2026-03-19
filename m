Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A595A39A7E1;
	Thu, 19 Mar 2026 07:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773905653; cv=none; b=K0kRBL/R7OnRcpiNs7//Pz6DC4baob+sJmoG6BIVUDSFfevrHJ1G6GFaDlleNkQZcJv9wWabL1EzN1h08vl/v4Wc8ZrIl46UyokxhpgvEbeDET9gOp1aN5uwCd2wFs5RwqG80VYRKNkmjSle8jTQcaAueST8lo95FTRaDy+UNrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773905653; c=relaxed/simple;
	bh=hwWOzRdVjXzUuETpCCZtWnOEr3ju3ZD/7cJHhaC2XaY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hHUiB67dcwinocJRPqhrIJ5AiA2mn00o6Pg2A8rP7Sz5yrxSbXzx9zLJNSI0Spl1PDfSyQi3MJv6dSbySl1nQRgrncDHaDYET2/XeDPv9oSnLrT8lgtK5TM0ih8hKQCOnkzq2pOgf1KO2s+LtqqZqAavR7EB7MWXV5XUKIkntkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=fail smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=HuhqpKns; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="HuhqpKns"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+sFZ1FLKiR65L4M1IonsRzZ9s3L1BFiD5c8mbE2C9B0=; b=HuhqpKnsB9WMzy9owOWVxJ77M2
	7o4WnVvv4hvWee3S/36BP+WMIPiOT9q8iZ6yJR5iIMaoJJJlOMMVzwfZYBFA9GlxYHWAm+hbB/bQu
	UnQFOwampOuM+DCkIjUxTZJQ7RoRGRIfDXOJJcAhgFaiA0plcfTfjtkYh/DPB63puMOvG954E7NV2
	GKN507nImCj7yCSMeUlm1wHkV62wC6uWhWucSWQz//ExQW8M42VWSVH/eaiEc7muQOAWQQAmnqKb1
	CSHIvXE3sNrC2l2PrcfSmXGON0o1Wy4NrWDLTSnmBHvqfgFqeQaSWngJlx+Oi0IJQk0FvHJTl9zZw
	fuxbevcg==;
Received: from [109.52.2.233] (port=10095 helo=mac.lan)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1w37tN-0000000DgEs-2FIc;
	Thu, 19 Mar 2026 08:34:03 +0100
From: Daniele Briguglio <hello@superkali.me>
Subject: [PATCH v2 0/3] clk: rockchip: rk3588: add I2S MCLK output gate
 clocks
Date: Thu, 19 Mar 2026 08:33:58 +0100
Message-Id: <20260319-rk3588-mclk-gate-grf-v2-0-c4c8daab0762@superkali.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr0Jm7Zi2YK2svIdhUeoUGn4zRaIh3
 N3KBVy+l3zv2yASB4pQZhswrSGGaUygThm41o4NYXgmBiWUFrnUyF1+MQYH13fY2IWwYY+uqKU
 RRW68E5CmM5MP7yP7qBK3IS4Tf46XVf7sn+AqUaDWvr5ZVeirNPf4mok724fzQFDt+/4F2AAyE
 rsAAAA=
X-Change-ID: 20260316-rk3588-mclk-gate-grf-c4b180438fc0
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Daniele Briguglio <hello@superkali.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773905640; l=2504;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=hwWOzRdVjXzUuETpCCZtWnOEr3ju3ZD/7cJHhaC2XaY=;
 b=mMlo4V6ZMSIrvQtN1Pp9tg+tjEeICjCvhseV9g1Wqd/UzsZO+A2hqW5EfXzmrGcGGqdCPsp8B
 Cs8B9xF8FZPBNunlVOcc4j395FkERMfhnWpkA/jPkfGq6nm7DStgQS+
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

Changes in v2:
- Patch 1: shortened commit message (Krzysztof)
- Patch 3: added missing #include <linux/slab.h> for kzalloc_obj
  (kernel test robot)

Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
Daniele Briguglio (3):
      dt-bindings: clock: rockchip,rk3588-cru: add I2S MCLK output to IO clock IDs
      clk: rockchip: allow grf_type_sys lookup in aux_grf_table
      clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO

 drivers/clk/rockchip/clk-rk3588.c               | 23 +++++++++++++++++++++++
 drivers/clk/rockchip/clk.c                      |  7 +++----
 include/dt-bindings/clock/rockchip,rk3588-cru.h |  4 ++++
 3 files changed, 30 insertions(+), 4 deletions(-)
---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-rk3588-mclk-gate-grf-c4b180438fc0

Best regards,
-- 
Daniele Briguglio <hello@superkali.me>

