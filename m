Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794598837;
	b=fjQCvnU442KFe3XerJpy4W4ODDtP3kock1EL8E4DtG5kUktcXynpGn5mxHhrAzbyCu2N
	 jtPVcp6JQ0FsDxHDkQq5ZNTbtSSnyCdx82Ckn9mFCgPpoMn3UPAM7oCecDHJPvUgktojd
	 Zk/A6yKj2H937v9uK3n3ruu3pFB/wEEMNFUlAtR03poUA/AmYdj8lRstRb7ct4oJj80Xv
	 FjMjQ7uYQJf193priPBt6PuzAUvyBUsywooepa6l7S718smAGJvvwWBCkx1K+6gTtLOQ1
	 lJuMkHhx/kIsFrcvK+KZwEzmz4eSpjjUXoXTrfZzPVFQ8jAem5Ga6ufUQYFXqIRthGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598837;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9McjYuz2YnOn1VVg0iYLh0SbGDFbaP84fg8IrGWGkcI=;
	b=XBLXipvYNrpkI19KJYKgmgvfV1xNA8imDyc92Tk7hfz+7K/JjCidGAufUsvAgTHPA6pQ
	 G65uHsHUMlVq4e55fNhEQZQvKEL2CRiHJEERbmkfI66OEZlQV2RUQos43aiXr6U0Oheu/
	 EP6dicBBG65P5oxWHgvezUQXjSNmhmYKmr7KLi4SgJBYZZCO+OBB07MtYgrr1JX2dQWaL
	 Q2F5Nm7OQU3EYvVwEgPx8ERI4Rue3CUgBLqietBVsQCusnLjlTkPpzPxfAhSVrZ3mLncl
	 GuyyirUeHVrxI0Mq6SPUhRiahO4mR8SdZgkp05KQjAjc8v+G+SA0717QDbaAvD550rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c/KJk7eX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD10C606A332
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c/KJk7eX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE731F000C4;
	Fri, 13 Nov 2026 19:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794598837;
	bh=9McjYuz2YnOn1VVg0iYLh0SbGDFbaP84fg8IrGWGkcI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c/KJk7eXzFk8D8V1aFhghoTUTlRaKvE8xkMzZNxfnL+8eTJzWlp6kAymB4JqWdvne
	 ASWHlKonoLouOIROkB4GhhCZaOqqSihSxNDZ6lj5OFNMTx5zNJDFLouglDUzpt9hK1
	 SBPjXJLMU00WkL1q31lXWKK6di/zp2SF0rNyXzGKjk05dicfbZvijQGKty3mvG0+yT
	 5v04+QjqhASAEVW9c0hEGfm5tiMkAntwWsgwdSr+QsKQPYPIHGR4hBiedbnAaowPhw
	 iS9cewpXp1oPDzl3BKXZN1lwNVr+vUqfSLoV2dxV0L9TXClWj8mziXORxI2I5IUk1f
	 Bu5EZggYcA6iQ==
Message-ID: <sashiko-outbox-213561@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] MIPS: Ingenic: Add XBurst SMP support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Florian Fainelli" <f.fainelli@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261113190836.470937-4-f.fainelli@gmail.com>
References: <20261113190836.470937-1-f.fainelli@gmail.com>
 <20261113190836.470937-4-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:40:36 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] mips: idle: cached need_resched() load after dcache flush in
  xburst_wait_irqoff()
- [Medium] MIPS: Ingenic: missing IRQF_NO_SUSPEND on mailbox IPI in
  xburst_prepare_cpus()
- [Low] mips: idle: xburst_wait_irqoff() calls non-noinstr
  r4k_blast_dcache()
--

commit 2871a54058216bdde1330a67071ead0fedc13363
Author: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetech.co=
m>

MIPS: Ingenic: Add XBurst SMP support

This commit adds SMP support for the second XBurst core on the JZ4780 SoC
using CP0 mailboxes for IPIs and adds an XBurst idle handler that flushes
the private data cache before executing the wait instruction.

Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099

> diff --git a/arch/mips/ingenic/ingenic-smp.c b/arch/mips/ingenic/ingenic-=
smp.c
> new file mode 100644
> index 0000000000000..27b9b573a7e07
> --- /dev/null
> +++ b/arch/mips/ingenic/ingenic-smp.c

[ ... ]

> +static void __init xburst_prepare_cpus(unsigned int max_cpus)
> +{
> +	struct device_node *np;
> +	u32 reim;
> +	int ret;
> +
> +	ret =3D request_irq(XBURST_MBOX_IRQ, xburst_mbox_interrupt,
> +			  IRQF_PERCPU | IRQF_NO_THREAD, "core mailbox", NULL);

[Severity: Medium]
Should this request_irq() call include IRQF_NO_SUSPEND?

Unlike request_percpu_irq(), request_irq() with IRQF_PERCPU does not set
IRQF_NO_SUSPEND automatically, leaving desc->no_suspend_depth at 0.  During
system suspend (such as suspend-to-idle), suspend_device_irqs() disables
XBURST_MBOX_IRQ, which runs mask_mips_irq() and clears STATUSF_IP3 in
CP0_STATUS on the calling CPU.  That blocks IPIs during noirq suspend and
s2idle, and if resume_device_irqs() runs on the other CPU, STATUSF_IP3 stays
masked after resume and hangs subsequent cross-CPU smp_call_function() call=
s.

> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> index 80e8a04a642e0..6c44715d81d5b 100644
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
> @@ -18,6 +18,7 @@
>  #include <asm/cpu-type.h>
>  #include <asm/idle.h>
>  #include <asm/mipsregs.h>
> +#include <asm/r4kcache.h>
> =20
>  /*
>   * Not all of the MIPS CPUs have the "wait" instruction available. Moreo=
ver,
> @@ -71,6 +72,28 @@ static void __cpuidle rm7k_wait_irqoff(void)
>  		"	.set	pop					\n");
>  }
> =20
> +/* XBurst gates its private cache clock in WAIT; write back dirty data f=
irst. */
> +static void __cpuidle xburst_wait_irqoff(void)
> +{
> +	unsigned long pending;
> +
> +	if (need_resched())
> +		return;
> +
> +	r4k_blast_dcache();

[Severity: Low]
Does calling r4k_blast_dcache() from __cpuidle xburst_wait_irqoff() violate
noinstr idle rules?

xburst_wait_irqoff() runs between ct_cpuidle_enter() and ct_cpuidle_exit()
while RCU is not watching, but r4k_blast_dcache() calls out-of-line
blast_dcache32() in .text, which only has notrace from inline and lacks
__no_sanitize_coverage, __no_profile and __no_kcsan.  Besides making
cpu_in_idle() return false during the flush, builds with CONFIG_KCOV,
CONFIG_GCOV_PROFILE_ALL or CONFIG_KCSAN run instrumentation while RCU is not
watching and dirty the private L1 D-cache on return from blast_dcache32()
right before wait gates the cache clock.

> +	/* Recheck work that may have arrived during the cache flush. */
> +	pending =3D read_c0_cause() & read_c0_status() & CAUSEF_IP;
> +	if (!need_resched() && !pending) {

[Severity: High]
Does calling need_resched() after r4k_blast_dcache() pull the idle task's
struct thread_info cache line back into the private L1 D-cache right before
wait stops the cache clock?

need_resched() loads current_thread_info()->flags from KSEG0 cacheable
memory, caching the line with _TIF_NEED_RESCHED clear in the sleeping CPU's
private L1 D-cache.  When the other CPU sets _TIF_NEED_RESCHED on the idle
thread_info->flags and sends SMP_RESCHEDULE_YOURSELF while the cache clock =
is
gated:

CPU0                              CPU1
xburst_wait_irqoff()
  r4k_blast_dcache()
  need_resched()
    /* caches thread_info with
     * _TIF_NEED_RESCHED =3D=3D 0
     */
  wait
                                  resched_curr()
                                    set_tsk_need_resched(idle)
                                    smp_send_reschedule()
  <mailbox IPI wakes CPU>
  handle_int / irq_enter()
    /* writes regs / preempt_count
     * in stale thread_info line
     */
  scheduler_ipi() /* no-op */
  /* _TIF_NEED_RESCHED lost */

On MIPS, scheduler_ipi() does not modify thread_info->flags, so when CPU0
takes the interrupt and writes other fields in the same 32-byte struct
thread_info cache line (or if remote snoops stall while the cache clock is
stopped), the reschedule is lost or the waking CPU stalls.  Since local IRQs
are disabled and any remote wakeup during r4k_blast_dcache() raises the
mailbox IPI in CP0_CAUSE, checking pending alone avoids touching the D-cache
after the flush.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113190836.4709=
37-1-f.fainelli@gmail.com?part=3D3
