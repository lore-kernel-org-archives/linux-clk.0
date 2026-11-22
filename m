Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375114;
	b=jHbBewjvu0TpLwG7amYP6NQ8Bg2QSpqIxLO7TB7L9KkH8Ayt9YTsvew4idrXKYFXN6G3
	 0b/TLzOkvgBSKO7WJXgge1n20C8+DdH6I/fTLplfGobS/RcL54atNSrcrKbDPlCctT6eU
	 jAtHWvUTAdr/MEb6/lmBqGDmZ1WW7kYfxirDjSr8SgSNu9K+V+5otTJuXPAzJ2jWK51jw
	 iR/F4EVwM3bOs4Dr/50WE036q85a5tsW1bbyfFl4k3g0q668lkKuhXyDeqAKI6XO+14w3
	 1LDNsLRdUzx/0BVcM3b6IIshYD2Npo3ThppfMdjkIl/pUbDs0VInIFzMAsxYJecqKHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EDGrHZ64R98bB1s+kS6i0+RRrZ5nwW+M1pWL62MVuNM=;
	b=GPUuh8AFs7dTFwtxaOKbmv/7hZVvdBo8/q8jg5ujiM/74qwJkRcNzYSpJakIAb3RkIyg
	 hlSBUOuBYS0tNfQF63J2RHfSYhWkRkdWfcWZ21RiGvjpx3bzfhuWjDfIPd86CPVKXzJUC
	 5t9k0/XTfrvgHfcVbFnKjVada+YZie4MuGt9JLbmobNlDVfyoOtKVgMcbaE2/F0uY1Ci8
	 GGgQzv/AN26gJ4EjGZuypgZEcY8+s9Iqz/SjuJEyTF41DVrGUkm2OG+RTTO6F3Ktw6C6h
	 wLFtKS4FtSd5PvdCCfiu28c45nEENJoei44hmeJ+4Kn8ihTaX58L/ea2Pb/pRN3gnBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PZ3ZRhgN;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5444606A31A
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 19:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5444606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PZ3ZRhgN
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so13870315e9.1
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 11:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375112; x=1795979912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EDGrHZ64R98bB1s+kS6i0+RRrZ5nwW+M1pWL62MVuNM=;
        b=PZ3ZRhgN3nkrjr4PIYP+V4PTz7BPOAcW37KJ7W3QDNrKz9kjG1OEXRrs1MAcdvw/ah
         lalA76UJENd7MS/How1ryeab81AZESZPAou597j6RfnXvNrmSW2z4m76epGGZTgqlVoH
         EXfveotOOrDXXk6UYIV2LyGB3+lD15SK8BgtyU/dgF0RktIkWdoOrzzfAbj/2Px29H/f
         AEc3PcS8Yf4NBDmw9cSw8KO3t+axymJbg5DYNYJMqRDrpK3Mhw0/LRIr2JCTZDW7pm6A
         XqDq+iYdSpq4ppYjHAKQj55Ol2wGqHaIi4XfjQe+H359DyP8+M01y7+KAxDpf4q4IDYk
         9/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375112; x=1795979912;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EDGrHZ64R98bB1s+kS6i0+RRrZ5nwW+M1pWL62MVuNM=;
        b=favOgQzYp2rea19nioSzerN9QxtQ3v5dyjPx0cQCiKMdocKz7eSx9HYVcq+7thpsfn
         ANeI/BkvmJDA8zociLfrnIwWAJXgVKXFS6kCGDQBAypIwh1yR7SVN5VsUgnDE6/b8CIL
         BL0+1AKvn8UzG9gSY93yLByc0A8wxpqrVXvGFP84vHl6XLIkYpBXgKU71iVFjE2XWB7n
         P56oUFerMDZA5EfEE6lD0gLoPAHk/rqqXAGUuZPEw9oOLKMokuEDhy0mXs5Riz0lEtdv
         6x00SOZpXvK/N7PQFKDizU0VJx8gNPTFL7VKo5v+/DMwhbvM17PIaYRrJcdLDuLIzItb
         e8pw==
X-Forwarded-Encrypted: i=1; AL+hErGpOc7+EHq3RG2q+5HZG+oUI80029vVtg7LOAaaLHUcWAc45HgC1z81RB9gZzCRN0iuXno8cUbodgE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vemgj86fKv5KT7kxWrmAgZ9cunYokndzb7VOeK8FXP5oROwJ5
	NoVUACkad/LT1RTCIXhrouN0/fiFnMxjHtnaynDNiXL2gI93171mHcBK
X-Gm-Gg: AZFdTZeVFI5tH7cm+X1EoKuO07CvA0pHz2KRzLK/Xq9nnTvLmOCjAHRoeVvc+CfhM/6
	1i3hvdo9/8SmcumJve/8wDSCk08iSj+Zd/4fgtExzSndb6ESLRdBVwgKtF9QH3BFt0c/YnrGcmQ
	SrRMFsfch9B6px2x3cyh3ymF7C8qiqL1/O20tcAJzcPfpcHnUtmuqQo+nZcEHJxQ5fIEeNkNx5J
	qHXzAFu25eK2tRCqf9/CLyePK9826J/1XvqmOt/uCx1UhrXsbU8oLz9s1bE2wZklaue2uExGJH7
	xiPlwcYKtRal/J9hpWVjzIRQPTiHbTa1KFbcaRBnrLcV3pNpyOgKrgahKEnvtlpP2axHkrEVVvw
	pbqhkLf/evCiK9p1c5H3/03EP5WLXQu3R2QvEAqhdwJoIhiftWbeyTx7aeeT6wglGyaLSVRton4
	iYam0bB/ROz/KsPFZBkifYyMEaLbXWSIFO/0RDwrZnXi8xAOWg4emsDDUENL18pfcd4irFcH8eF
	7/nRSjvU1B0bU5049FfczB/Qn+LxFe2IBMq8hWfMDiJ1j0FwQ8E6BGQ89QXS6sJtFT9qVBDZefp
	6b8lZvpxeHmiA3thhCYixKPB4YjZRhWwbnBPLket5ZW+
X-Received: by 2002:a05:600c:1d0a:b0:4bb:840c:72f2 with SMTP id 5b1f17b1804b1-4bb889323a1mr196357555e9.25.1795375112020;
        Sun, 22 Nov 2026 11:18:32 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm100078295e9.4.2026.11.22.11.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:18:31 -0800 (PST)
From: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
To: Yifeng Huang <huangyifeng@eswincomputing.com>,
	Xuyang Dong <dongxuyang@eswincomputing.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: clk: eswin: eic7700: EIC7702X hangs when disabling unused D2D/PVT gates
Date: Sun, 22 Nov 2026 19:18:30 +0000
Message-ID: <20261122191830.2183513-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On a DeepComputing FML13V03 board (ESWIN EIC7702X, i.e. two EIC7700X
dies, 32 GiB), mainline hangs during or shortly after
clk_disable_unused() unless clk_ignore_unused is given. Marking
gate_d2d_aclk (and, as a precaution, gate_lsp_pvt_pclk) as
CLK_IS_CRITICAL in drivers/clk/eswin/clk-eic7700.c fixes it here; I'd
like to know whether that is the right fix or whether something else
should claim these clocks.

Setup:
- v7.4-rc3 (4843f6873f7c) + "riscv: eswin: eic7700: Add support for
  clocks, resets, pinctrl, HSP bus, I2C and watchdog" v5
  (https://lore.kernel.org/r/20261015125454.1381941-1-pinkesh.vaghela@einfochips.com)
  + a minimal local board dts: die 0 only (4 of the 8 harts, uart0,
  the firmware reserved-memory regions).
- defconfig + PINCTRL_EIC7700, DW_WATCHDOG, RISCV_SBI_V01.
- OpenSBI v1.3, U-Boot 2024.01, D2D firmware 1.51, GRUB (EFI). Under
  EFI the kernel takes RAM from the EFI memory map, so it also uses the
  second die's 16 GiB although the dts only describes die 0.
- Plain command line: earlycon=sbi console=ttyS0,115200n8 rdinit=/init
  (initramfs only). To find the clocks I used a local debug-only option
  that keeps named clocks on in clk_disable_unused_subtree() (not meant
  for merging); some of those boots also had keep_bootcon and
  trace_event=clk:clk_disable tp_printk, called "traced" below.

What I see on the serial console:

- gate_d2d_aclk: every boot that disabled it failed to reach init: 1
  traced boot that left only this gate out of a larger kept set, 3
  plain boots that kept only gate_lsp_pvt_pclk on (2 with all 32 GiB,
  1 with mem=16G), and the stock boots with nothing kept (32 GiB and
  mem=16G). With 32 GiB the traced boot stops right at
  this gate. With mem=16G (Linux on die 0 RAM only) the boot stalls
  before init; ~21 s later RCU reports a stall, and CPU 2 then does not
  respond to the NMI ("After 10 seconds, these CPUS still haven't
  responded to the NMI: 2"). Keeping only this gate on, with every
  other unused gate disabled, boots to an initramfs shell with 32 GiB
  (2 boots) and with mem=16G (1 boot).

- gate_lsp_pvt_pclk: intermittent. I have 10 boots that disabled it
  while gate_d2d_aclk stayed on. In 4 of the 7 traced ones (which make
  the disable pass much slower; 5 of the 7 were earlier mem=16G boots
  with other clocks kept on as well), the D2D firmware printed, within
  tens of milliseconds, the following (from one of them; colour codes
  removed, and the first line's "D2D NOTI" prefix was interleaved with
  kernel output):

    D2D NOTICE: ΔT 60.691°C (prev 46.329, curr 107.020)
    D2D FAIL: T:107.020 sts:00000007 rx:00e60001 rx2:00e60001 [RX ERR ALL|RX LOCAL LINKUP|RX REMOTE LINKUP]

  and Linux hung. In the other 3 traced boots and in all 3 plain boots,
  disabling it caused no visible problem. I don't know why it is
  intermittent. A jump from 46 to 107 °C between two firmware samples
  looks like an invalid sensor read once this clock is off, but I
  can't see the firmware side.

- With both gates marked CLK_IS_CRITICAL (diff below; no other change,
  no debug option, no clk_ignore_unused) and the plain command line,
  the board boots with all 32 GiB, and 92 previously enabled unused
  gates are disabled (113 unclaimed gates were on in a clk_ignore_unused
  boot; the 21 left on are the 19 flagged CLK_IGNORE_UNUSED plus these
  two). Writing and reading back 27 x 1 GiB in tmpfs (so the second
  die's RAM is in use) gives identical checksums, and reboot -f returns
  to the firmware.

- gate_pvt0_clk and gate_pvt1_clk were disabled in all of the boots
  above that kept only one or both of the two gates, without preventing
  boot. I have not checked whether the PVT sensors still give live
  readings with them off.

Not tested: single-die EIC7700X, suspend/poweroff, the second die's
harts, anything beyond an initramfs shell.

Questions:
1. Is CLK_IS_CRITICAL right for gate_d2d_aclk (at least on EIC7702X,
   where the D2D link is in use), and for gate_lsp_pvt_pclk? Or should
   DT consumers (a D2D node, the PVT node) claim them instead?
2. Does the D2D firmware read the PVT sensor through gate_lsp_pvt_pclk,
   and are gate_pvt0_clk/gate_pvt1_clk needed for live readings?

The change I tested:

  @@ -828,5 +828,6 @@ static struct eswin_clk_info eic7700_clks[] = {
   			CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_DSP_CFG, 31, 0),
   	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_D2D_ACLK, "gate_d2d_aclk",
  -			EIC7700_CLK_DIV_D2D_ACLK_DYNM, CLK_SET_RATE_PARENT,
  +			EIC7700_CLK_DIV_D2D_ACLK_DYNM,
  +			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
   			EIC7700_REG_OFFSET_D2D_ACLK, 31, 0),
   	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_D2D_CFG_CLK, "gate_d2d_cfg_clk",
  @@ -1174,5 +1175,6 @@ static struct eswin_clk_info eic7700_clks[] = {
   	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_LSP_PVT_PCLK, "gate_lsp_pvt_pclk",
   			EIC7700_CLK_MUX_SYSCFG_CLK_ROOT_2MUX1_GFREE,
  -			CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_LSP_EN0, 1, 0),
  +			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
  +			EIC7700_REG_OFFSET_LSP_EN0, 1, 0),
   	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_LSP_PVT0_CLK, "gate_pvt0_clk",
   			EIC7700_CLK_FIXED_FACTOR_PVT_DIV20, CLK_SET_RATE_PARENT,

Happy to send a proper patch once the preferred approach is clear; I
can also share the board dts and the serial logs.

Thanks,
Mervyn Pretorius
