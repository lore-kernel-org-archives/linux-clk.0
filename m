Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413607;
	b=dfoavP24nh2fKyN1+9bqHql0YLnaI2r/FqlBGsN6MhdxNpzjjI2a87T+EKLYDOF6LVuZ
	 qbXYoY5fbLoJehnx/kdU716r55o6ECmB6KAQL0Zzh70XJQSkyhuD1Wf/LczYsTP4vS5W+
	 /FLVyVBcb+J6rARVJ8+Md/sb8XLWQhq8IU6/wdwjMK0/ydllaRodT/LognN2v3MyM5ENP
	 2xKY5rOlXk+3jLCMesmD/juEbwkF+tToeaUQc+AGiLl2n3cpli3OKViCU1mYrtHvCq+Uf
	 aRAywEld6qUYfLoeuDHSmDwxryv5dgkRpLoi3/Qs/HqjP4h/Y9+MkN+PVi36Nbi3Yfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dufq0gMTwMuobWdajbCSMPOQ8VLgRxtkcM3Ok9ZSSyg=;
	b=35+QurRCSTunRMO8+3rESRlt0EWgVe/5yvMFraZ73mAvpYzpj8j1Ik9UMBbbEh5bJlkz
	 W/c7RYqOjkZ0rmtnAfzSMdiMbHBzXAvcTeXdvv/WWk0St0jORzUcQOTbKvO2LJTbdLTY1
	 lDxE4S1U/sSUPJu5jS+37RqrCTqo9UlOfMLT8LBa7C+pRUXLLI/01KICDztlaGazQAbGR
	 Wpvj3+3eBCh3FwA9k4gIJjQnq2FVv9izyoqAEwMCNZX85TOfGnDADPKeFE/BcPCWZ+dKq
	 kOpnyFG7ufJsKQhUjJRLMC7kBYRw/8OZQQE4dcM6lpI7G2E/oNXIY4kt8AzT6WJCbgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGUha52a;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B82D606A31A
	for <linux-clk@vger.kernel.org>; Sat, 31 Oct 2026 02:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B82D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGUha52a
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-84a248254f4so956991a34.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 19:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413605; x=1794018405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dufq0gMTwMuobWdajbCSMPOQ8VLgRxtkcM3Ok9ZSSyg=;
        b=wGUha52arIwmxRX8GxYpnDu7CNWUKemMAv3Man3esUDL3UxzUW9uzQA6VddzEcqDzF
         JzweTCxtjLJtliC4LC79fRYVdsXn77H+rLgRhl7ZSFZCBXhfMUU92mzMNkEutLNkl182
         6WZKxBZAWL/jAjAItNYaucqdWyosDRh7IpaRV3Re7okGkluYtf9lbAvioopDgg9hXZkw
         TeESocLXct22KiNe/bSd4V8Rbkdqa9VS3EgkqbbmsPRnQya9TUCSVtXh2jt06YSKtjCA
         Tq4lP28pPOTzktNR6rmhVqohvC2PqihPeVmzmVHwFsnGItGuTx6w7A5mQxrp0S2qA6dh
         fNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413605; x=1794018405;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dufq0gMTwMuobWdajbCSMPOQ8VLgRxtkcM3Ok9ZSSyg=;
        b=LuZRC05CeCL+Wz8il3q/93T2WdEZ3CIp/0IRFa6sRVr6upJMp60Gmeh49oprxb4Fmk
         3B1utK67hKi6XTdqa/WnmHjtHiGo1KqdMKDDKyTxzAgwvWaD/tvi/OBYmvJkgA2KNBI0
         kWsVaqxg4k0VDURHpetqMCR6OHwaWBfqQTuB1ae+RuXVzQW3CFVjrmCoTouj6hMXIc4x
         dcdKUYlvcd3ZLJzQw32Az9YCaEIqD15H7XjC0g/8FMkSQfncn5wBkgKZFnHyY7lp8qW3
         WiYtwAibc0g+StMO6QlZWzs6JGZYoJqG/27kqJddJEC2Kzz5D4gA9bWasGwfwLeQm+Cz
         QXZg==
X-Gm-Message-State: AFq9FYKBBKnC9sGeBcmgDsXwk0veGXu5UnbURDZ90tfxJO9EAwQSWpGl
	lZ4Pcj17IkbgNm5pKtrwyfG/kqSVzGklTsbaSjW+NXlQZhZJiXbptTnQ
X-Gm-Gg: AYBFou32v3vg9xdiL03ABprFbMSxNmgt0KvcAPLDchKUsSXDMa4YBj6+MdCKtirnGyC
	DCCmLpSyGib4gYsGlFp89aXt6Sp0iwid7KUKMxPZBDsLOWVVRu7gedsAAP6jGZg2hYuK0Admd64
	Kb3x/rR1N8tUcW1imSDZBOgYQhOLqj1FNe4LyZSchUzpALB0kGXW+5vDRM/Yq8lFswJIHIIHpnO
	gabWOzfcN6o5KY8/emFHsZNfP3wdyvXBoDK3KPOEP5BWaCYgH2cHPeMe1sY2yHvVSk1sR3Q3LPV
	94goFphMqkX8Tq4sOSF65tu1BF2NQEN/YLxS5zvBRIIuPRh1quRAbAsqATKHmA1z2qqI0/Onwhp
	lrE7f1FJUJW2IskGP67ZTzIBjRmt13fJ9r4mWF4A6K2XVjJECb9kn4tsN7lUrO0Boz+AbYmazb6
	VTanVDcyZitoYYZwZoCaMlrxoQhkSCK3OG4EhzLP28zrX2ZgyD2hgNKnmEwfLQjLBj4/ADogjNM
	ZMdnVam7NA25az2VNx0Tv41k5xMLSN7+vOuzPNxjQ5N2N/+XJ4RoEoLE40Ai801fmZ3gFXwEN0E
	XDZLbJHNCb9twSkVIWRdiwizBpmzID2b3a1sGq/gypZo0lX/dZNYOR+XHTRsohfGAgs+CuiSkz3
	UT08Z3A==
X-Received: by 2002:a05:6830:7181:b0:81b:ac9a:5681 with SMTP id 46e09a7af769-85d3649ebddmr3195695a34.29.1793413605457;
        Fri, 30 Oct 2026 19:26:45 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d355201f7sm3304636a34.23.2026.10.30.19.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:45 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH] clk: sunxi-ng: a733: preserve system-controller firmware clocks
Date: Fri, 30 Oct 2026 22:26:43 -0400
Message-ID: <20261031020640-263f7b05-a7s-clock@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

System-controller firmware uses the R-domain timer and mailboxes without
Linux clock consumers. Disabling these clocks as unused can leave
firmware services unavailable. On a Radxa Cubie A7S with vendor boot
firmware, the public CCU v6 candidate reaches a Linux shell but stalls
at warm reboot.

The public A733 firmware selects the RISC-V platform, reserves R-domain
timer0 for delays and enables both main and R-domain mailbox clocks.
Retain r-timer0, bus-r-timer, bus-r-riscv, bus-msgbox0 and bus-r-msgbox
with CLK_IS_CRITICAL. This keeps their modeled parents enabled as well.
Do not change rates, muxes, reset bits or unrelated gate policy.

The controlled tests distinguish the RISC-V bus gate from its separate
special clock. They support this set for the tested A7S firmware,
without establishing that every flag is independently minimal or that
all firmware services are covered. The matching A7S configuration
completed repeated warm reboots without clk_ignore_unused or a
register-writing helper. Suspend is not qualified by these tests.

Public firmware evidence:
https://github.com/radxa/allwinner-arisc/tree/79086caef1f6d1fb1cf164afb018f6e873fd9910/ar100s

AI assistance: Codex:gpt-6-astra.

Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
This is a standalone clock change for the separate A733/Cubie A7S DT
v2. It applies to official base d89e1d186ec9271bf78e62771779e9fc03bf0fc3
plus Junhui Liu's four clock-helper patches and A733 CCU v6 (eight):
https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech
https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech

No Fixes tag is assigned to the unmerged CCU input. This does not
replace or resubmit Junhui's series. The existing public MBUS_STORE
critical flag is not part of this change.

The final A7S integration passed two RAM boots, clock-summary checks
and warm reboots with vendor U-Boot
2018.07-17-boot-aw2501-g4c7078cfdf7-dirty. All five retained clocks
reported enabled. The Image was built with W=1; the final DTB passed
W=2 CHECK_DTBS=y. Earlier tests of the same five-clock change also
passed four boots and warm reboots. These are system observations on
one board, not proof of each flag's independent minimality or suspend.
The DT test used a RAM-only BL31 reservation at 0x48000000/0x01000000.

Final tested Image SHA-256:
1ea68cdc5998b584f8a3e62c44a21e506a22a8144c5824d9a8485607a8f2bd09

 drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c | 13 +++++++++----
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c   |  3 ++-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
index b8f6e8c6e50735d702d4de8c6d320652358f251e..e9fca8af03cec39ac39d739d371f2d6e4f7e1044 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
@@ -57,11 +57,12 @@ static SUNXI_CCU_M_DATA_WITH_MUX(r_apb1_clk, "r-apb1", r_apb_parents, 0x010,
 				 24, 3,	/* mux */
 				 0);
 
+/* System-controller firmware uses R-domain timer0 for delays. */
 static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0", r_apb_parents, 0x100,
 				      1, 3,	/* P */
 				      4, 3,	/* mux */
 				      BIT(0),	/* gate */
-				      0);
+				      CLK_IS_CRITICAL);
 static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1", r_apb_parents, 0x104,
 				      1, 3,	/* P */
 				      4, 3,	/* mux */
@@ -78,7 +79,8 @@ static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer3, "r-timer3", r_apb_parents, 0
 				      BIT(0),	/* gate */
 				      0);
 
-static SUNXI_CCU_GATE_HW(bus_r_timer_clk, "bus-r-timer", &r_ahb_clk.common.hw, 0x11c, BIT(0), 0);
+static SUNXI_CCU_GATE_HW(bus_r_timer_clk, "bus-r-timer",
+			 &r_ahb_clk.common.hw, 0x11c, BIT(0), CLK_IS_CRITICAL);
 
 static const struct clk_parent_data r_pwm_parents[] = {
 	{ .fw_name = "hosc" },
@@ -108,7 +110,9 @@ static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x150,
 				  0);
 static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi", &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
 
-static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);
+/* Firmware can use this mailbox without a Linux clock consumer. */
+static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox",
+			 &r_ahb_clk.common.hw, 0x17c, BIT(0), CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0", &r_apb1_clk.common.hw, 0x18c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1", &r_apb1_clk.common.hw, 0x18c, BIT(1), 0);
@@ -146,8 +150,9 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_riscv_clk, "r-riscv", r_riscv_parents, 0x2
 				  24, 2,	/* mux */
 				  BIT(31),	/* gate */
 				  0);
+/* Firmware runs on the RISC-V core independently of Linux. */
 static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.common.hw,
-			 0x21c, BIT(0), 0);
+			 0x21c, BIT(0), CLK_IS_CRITICAL);
 static SUNXI_CCU_GATE_HW(bus_r_riscv_cfg_clk, "bus-r-riscv-cfg", &r_apb0_clk.common.hw,
 			 0x21c, BIT(1), 0);
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
index cc2b229e2e6a6072f95086ce21cba6545012c0bb..ca0fc95fade2a66bcb90011e654a603eb676fd0b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
@@ -635,8 +635,9 @@ static SUNXI_CCU_GATE_HWS(bus_dma1_clk, "bus-dma1", ahb_hws,
 static SUNXI_CCU_GATE_HWS(bus_spinlock_clk, "bus-spinlock", ahb_hws,
 			  0x724, BIT(0), 0);
 
+/* Keep the mailbox available to system-controller firmware. */
 static SUNXI_CCU_GATE_HWS(bus_msgbox0_clk, "bus-msgbox0", ahb_hws,
-			  0x744, BIT(0), 0);
+			  0x744, BIT(0), CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE_HWS(bus_pwm0_clk, "bus-pwm0", apb0_hws,
 			  0x784, BIT(0), 0);

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 0df2ae41836b86fd868dfa01ddfde57f888f761a
prerequisite-patch-id: 88f3a431e7c551a9fa732f062188f10fdd362eeb
prerequisite-patch-id: 3e88bc873c909059d1199f82cda4013765e7a5e5
prerequisite-patch-id: 0dbc27cd7417352319a0705a051dff35085e8922
prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
-- 
2.53.0

