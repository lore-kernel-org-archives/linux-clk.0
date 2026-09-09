Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006772EB874
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963714; cv=none; b=tDffaY4aogGaJfNkPpn7vRa+uaCXnq7I3xR5SYAr/30MARacq0JGHoiOoIh8jtScS4FTLqbse4uSBKL+MKbwWCYRj3pZbok/0IaL2NorUZYcwEOPCcLGZKCofRTUuOKSXYP1rWY2DP/SrPTmMMSH9PbJy7f3sx/vMe4/zx71VnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963714; c=relaxed/simple;
	bh=+fdRgYvsRmSffvWcq7B34UVv0qX7XbIOrWsZqSBW0p4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VmNApNhaagVpAhIcLZe5Dcx1/xjuSJQctIbuelodZaD+bp+3KI8pSlKhk1okoORfO66oCv3QXKfwsObzj/6Vp5nnlaloztnyut5OUCbVzlE8IoPOy00xbFIEDxbGAkrEEFK3J9EuINaLepzQSkv/T3J9tK2//zPaLBxhJ1U4hJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PoAQLxfh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PoAQLxfh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612951F00A3D;
	Wed,  9 Sep 2026 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788963712;
	bh=No47toS3GfQKUe7WRm/C5dkMX36M5VU3SXd/Sf7XEf0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PoAQLxfhIuVszRBK6AI++OUEaGr3YTcVobxw08u5egJ1AczARl9dTDQT1CLRQKtK0
	 lmwfT9S1EEv1gfc2DIacst0TK8LHLVQBhSIpkt1wVM3n2gAV2Ggf7NBousIB66ybeq
	 pFRkwaxNjURReQ55TF0/X8ntlAZUR9noo2RJrc2VWQvEPPkJvJeUtqW8LV/NXdx6W+
	 2Jus34616jj2JQKP2OwmZRBwa9K8LdtJNWFWPD/cbPt6A8g8YSIoj+HJDmjbeH1lRg
	 FS+f+40iRy8HuMaIkoNI+KNcUTRxONr7o8BHKQKcTMcU8QfOdP9FTDq6KRzG0x23cm
	 qGJBJaDneO/4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] clk: spacemit: describe CPU clock dividers and
 shared PLL muxes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260909-spacemit-pll-init-v1-3-b3065ad5a4ac@linux.spacemit.com>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
 <20260909-spacemit-pll-init-v1-3-b3065ad5a4ac@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 14:21:51 +0000
Message-Id: <20260909142152.612951F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `.set_rate_and_parent` implementation causes non-atomic up=
dates of clock mux and divider, risking severe CPU over-clocking and crashe=
s during frequency scaling.
--

commit caf894b03e44c8fc393822573e3c7ad1a85fe9f1
Author: Troy Mitchell <troy.mitchell@linux.spacemit.com>

clk: spacemit: describe CPU clock dividers and shared PLL muxes

This commit models the K1 and K3 CPU clock dividers and bypass conditions.
It registers sharing muxes as internal clocks and excludes K3 selector 4
from the modeled parents to match BSP policy.

> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index dee14d25f75d4..40cc96c4ee876 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -391,8 +391,8 @@ static const struct clk_parent_data cpu_c0_clk_parent=
s[] =3D {
>  	CCU_PARENT_HW(pll2_d3),
>  	CCU_PARENT_HW(cpu_c0_hi_clk),
>  };
> -CCU_MUX_FC_DEFINE(cpu_c0_core_clk, cpu_c0_clk_parents, APMU_CPU_C0_CLK_C=
TRL, BIT(12), 0, 3,
> -		  CLK_IS_CRITICAL);
> +CCU_MUX_DIV_FC_DEFINE(cpu_c0_core_clk, cpu_c0_clk_parents, APMU_CPU_C0_C=
LK_CTRL,
> +		      3, 3, BIT(12), 0, 3, CLK_IS_CRITICAL);

[Severity: High]
Does introducing the divider model to K1's CPU clock here risk severe CPU
over-clocking and crashes during frequency scaling?

The operations struct spacemit_ccu_mux_div_ops in
drivers/clk/spacemit/ccu_mix.c appears to lack .set_rate_and_parent,
which is required by the Common Clock Framework (CCF) to atomically update
both mux and divider.

When cpufreq scales down frequency (e.g., from 614.4 MHz to 409.6 MHz), it
decreases the frequency before lowering the voltage. In K1,
ccu_mix_calc_best_rate() iterates parents and stops at the first exact matc=
h,
for example index 1 (pll1_d3_819p2, 819.2 MHz) with div=3D2.

Because spacemit_ccu_mux_div_ops lacks .set_rate_and_parent, CCF's
clk_change_rate() executes updates sequentially, calling .set_parent
before .set_rate. .set_parent changes the hardware mux to 819.2 MHz
while the divider remains at its previous value (div=3D1). The CPU temporar=
ily
runs at 819.2 MHz at a voltage only sufficient for 614.4 MHz, causing an
immediate undervoltage crash.

Could spacemit_ccu_mux_div_ops be updated to include a
.set_rate_and_parent implementation to ensure the mux and divider are
updated atomically?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-spacemit-p=
ll-init-v1-0-b3065ad5a4ac@linux.spacemit.com?part=3D3
