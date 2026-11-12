Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794457871;
	b=ccE6Msg3ovgodn9oQnsmBABkMVUWHIn0Dn2hDKShn0HQ6zzePGKmksIUUat5yFK5VskV
	 JLOs/OMoqDzlTIFCDTfGoYZQQCUZmn1C0b+ldqok7Fy0xYBuuS7RBMT+hEDqo9pi0ji18
	 Zm/NY6NB4et46Q/1mWeqGoz9Gy8Ycsk+P2fR82l8qVkYkWr7bQywGvilrPGjenyygh5vN
	 lInMkATzrj3g6ComW82x+Fm7bvSzhR7xcd9w6VkySs2jdb9HJrQHoC9G2PXaXS0JWid8r
	 zCtl5Ku5qgKemATcr7sJVgqGzivhvry14gZhapoJ2gZjGB1TuxtH7ivRcVEfIf6hfRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794457871;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ihfh+0QNZR1KVi9SFPscheM95rSSTp3dL6n/JmBPhac=;
	b=0mvGfR/gPRoqSO0Oge8qkdLD3GZFNVrQd1ttbm4Mt1ZlXLKbe8GLwex/QYx73URYze/V
	 d/5Sgun1F41imtVOSZHvaSO3US7L8f7CBP12kTyd4BKN67dMA2p5WCIitKgBGDSWMRrVd
	 gY+OmaCUJcxVsM1+iphToFaCqZYDgxL54oogZzWmErguYklanX4sZ0OJigkn9KGNJixEb
	 07KtbIhEyoNoSuXKV2L2vUzvMQWBYdd/Ut6jB876xBJbTPvb1AuQeE6v3JqsOGulfbhlW
	 vzsumOypGUZaZO4Xa9DkRR9Iewo3nB6agMYuDG8MZPX1V09WWnWagEnvkEr6qgmFe2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ftw7RDIr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DF7606A321
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 04:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ftw7RDIr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B631F00A05;
	Thu, 12 Nov 2026 04:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794457871;
	bh=Ihfh+0QNZR1KVi9SFPscheM95rSSTp3dL6n/JmBPhac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ftw7RDIruHS6VYGy9mz/5fsjbhigoU/U4B9N9QMaqYY5uc7y049FtOlSdjcDOz7zS
	 Z704tHrjzKL6FMv1Ahv1OiOtk52KNoKAYk0e7Yaw6KhBzJifzf0hEOvzBdwy9/CkMo
	 RjpQsPD6eGxvB4bGo0Us4b9aTsqB5e5DxzkEA+wqgr5t9lw/Q1nYdabKq3m1Cx7Hnj
	 8QfxeCnsSh+2II5z2mHAA6O9a9xmek7/EYfQ6UNIhjWSkppitbJ8YO5NG6Z7tEGHZQ
	 fhJwKN5BeirFMRmTjTy3gr6N6c0OcDX1Kr5h4HvV7yDcLWWzqqR8/Xi1BsDvyHaJ+n
	 9Qmb71R4t668w==
Message-ID: <sashiko-outbox-210344@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] MIPS: CI20: Enable SMP with two CPUs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Florian Fainelli" <f.fainelli@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261112041422.2997275-4-f.fainelli@gmail.com>
References: <20261112041422.2997275-1-f.fainelli@gmail.com>
 <20261112041422.2997275-4-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 04:31:10 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] mips: ingenic: invalid lock nesting in xburst_boot_secondary()
- [High] mips: ingenic: boot BUG_ON in mips_smp_ipi_allocate() and
  missing present mask
- [High] mips: ingenic: missing cpu_set_core() skips cache IPIs under
  CONFIG_MIPS_CPS
- [Low] mips: ingenic: 64-bit build failure in xburst_smp_setup() and
  entry asm
--

commit 2540a85d35c671f5a1df0622376784adb3fe4123
Author: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetech.co=
m>

MIPS: CI20: Enable SMP with two CPUs

This commit enables SMP support with two CPUs in ci20_defconfig so both
JZ4780 cores are used on the CI20 board.

Link: https://lists.openwall.net/linux-kernel/2020/05/19/739

> diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_de=
fconfig
> index 90536cab417ee..09d65094b1bd2 100644
> --- a/arch/mips/configs/ci20_defconfig
> +++ b/arch/mips/configs/ci20_defconfig
> @@ -22,6 +22,8 @@ CONFIG_EXPERT=3Dy
>  CONFIG_MACH_INGENIC_SOC=3Dy
>  CONFIG_JZ4780_CI20=3Dy
>  CONFIG_HIGHMEM=3Dy
> +CONFIG_SMP=3Dy
> +CONFIG_NR_CPUS=3D2
>  CONFIG_HZ_100=3Dy
>  # CONFIG_SUSPEND is not set
>  # CONFIG_SECCOMP is not set

[Severity: High]
Does xburst_boot_secondary() in commit "MIPS: Ingenic: Add XBurst SMP
support" violate lock nesting rules by calling clk_enable(cpu1_clock)
while holding smp_lock?

arch/mips/ingenic/ingenic-smp.c:xburst_boot_secondary() {
    ...
	raw_spin_lock_irqsave(&smp_lock, flags);
	ctrl =3D read_c0_corectrl() | CORECTRL_SWRST(1) | CORECTRL_RPC(1);
	write_c0_corectrl(ctrl);
	back_to_back_c0_hazard();

	ret =3D clk_enable(cpu1_clock);
    ...
}

smp_lock is a raw_spinlock_t, whereas clk_enable() -> clk_enable_lock()
acquires the non-raw spinlock_t enable_lock and jz4780_core1_enable()
acquires the non-raw spinlock_t cgu->lock.  Booting CPU1 triggers a
lockdep invalid wait context splat and sleeps while atomic on preempt-rt
kernels, while also holding smp_lock with interrupts disabled across the
5000 us power-status poll in jz4780_core1_enable().

[Severity: Low]
Can arch/mips/ingenic/ingenic-smp.c and
arch/mips/ingenic/ingenic-smp-entry.S in commit "MIPS: Ingenic: Add XBurst
SMP support" fail to build on 64-bit generic kernels?

arch/mips/ingenic/ingenic-smp.c:xburst_smp_setup() {
    ...
	entry =3D KSEG1ADDR((unsigned long)xburst_secondary_cpu_entry);
	write_c0_reim((reim & ~REIM_ENTRY) | (entry & REIM_ENTRY));
}

arch/mips/ingenic/ingenic-smp-entry.S:xburst_secondary_cpu_entry() {
    ...
	li	t0, KSEG0
    ...
	la	t0, xburst_cpu_entry_sp
	lw	sp, 0(t0)
	la	t0, xburst_cpu_entry_gp
	lw	gp, 0(t0)

	la	t0, smp_bootstrap
}

BOARD_INGENIC can be enabled in a 64-bit generic kernel build, where
asm/addrspace.h only defines CKSEG1ADDR and CKSEG0 (not KSEG1ADDR or
KSEG0), and the 32-bit la and lw instructions in
xburst_secondary_cpu_entry fail to assemble against 64-bit unsigned long
and pointer symbols instead of using PTR_LA and LONG_L.

[Severity: High]
Does xburst_smp_setup() in commit "MIPS: Ingenic: Add XBurst SMP support"
leave CPU1 out of cpu_present_mask and trigger a boot crash in
mips_smp_ipi_allocate() on generic kernels?

arch/mips/ingenic/ingenic-smp.c:xburst_smp_setup() {
	for_each_of_cpu_node(np) {
    ...
		__cpu_number_map[hwid] =3D cpu;
		__cpu_logical_map[cpu] =3D hwid;
		set_cpu_possible(cpu, true);
		cpu++;
	}
}

Neither xburst_smp_setup() nor xburst_prepare_cpus() calls
set_cpu_present(cpu, true), and smp_prepare_cpus() only copies
cpu_possible_mask to cpu_present_mask when CPU hotplug is disabled, so
CPU1 is never brought up when hotplug is enabled.  In addition, generic
MIPS kernels select GENERIC_IRQ_IPI, which causes mips_smp_ipi_init() ->
mips_smp_ipi_allocate() to hit BUG_ON(num_present_cpus() > 1) at boot
because JZ4780 uses custom mailbox callbacks in xburst_smp_ops without
registering an IPI irq domain.

[Severity: High]
Does xburst_smp_setup() in commit "MIPS: Ingenic: Add XBurst SMP support"
miss calling cpu_set_core(&cpu_data[cpu], hwid)?

When MIPS_CPS is enabled (such as in generic_defconfig), decode_configs()
skips cpu_set_core(), leaving both JZ4780 cores with core ID 0.
cpus_are_siblings(0, 1) then returns true and leaves cpu_foreign_map
empty, causing r4k_on_each_cpu() to skip cross-CPU L1 I-cache and D-cache
flush IPIs between the two cores' non-coherent private caches.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112041422.2997=
275-1-f.fainelli@gmail.com?part=3D3
