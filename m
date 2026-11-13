Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606775;
	b=3keIaKlLZTRKIGclRmXRpjO+UqRsOFTDL29RR2KLbt+AOGM3g2D1pCjkGH81M4pNvjBK
	 5nDjIRWMkCHHJN8bJax8T28WuggLvOjFTyKz9caIvA+8v7b3/KnXHerTGWJ55DoTPMkap
	 c2iGra/mjPdJh2yjj3LYj1CLlkNI7oU9Pvd7u71scrFLoAkV9knR/reGP3uR4cE3KtvXo
	 15OoJ6xGloGyWyWZ+uZTw9KbYuthhLWIEeAE4tx91r/fuTDTikh7fAUxB65jxsU4uHsc8
	 ruXZVQTTk20CN7+y8LbJlUMupqWZdHucc9EGyDM9Pf5Mq72gbwvMSB9WtWHDa4dNvqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5eNMmr+DnF90TqvCN5l/r2SqPu00Gu4aNG8AXgfyJ3U=;
	b=o+8r2J+GU/w205HntahYXTGDeP4ALgPPKEOZSmqzTIgCbmGzcsDD35n+Y19ElRXqsnQ8
	 6RTX64f4ZDWs4CW1gQfU4PJf+PsKsnZPMMWFZRvfxLCvwPkG5DWH97doS62lA5j4v+/EO
	 eaan3F/u0vAFM4iIb6i7C343d6zei6Cj1guRZB5M1a/YHimyUsGmKVvxNVLjCVME4nhVj
	 gaEsfwhkUB1vt8DHZknSliOm1XqWRhLKWQYGPwRjQPPslPgu9OFi9yKP16oXfPYFYuZAi
	 Q+oMjk8Bc5+SdARRGM8qpT9dxhZzgIgrgp6niNQYJPkYjzeBzdYQtzK9e3CtCc2nc1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFF6xx9k;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2E1606A32E
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 21:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB2E1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFF6xx9k
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so1886125c88.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 13:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606774; x=1795211574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5eNMmr+DnF90TqvCN5l/r2SqPu00Gu4aNG8AXgfyJ3U=;
        b=jFF6xx9k3IUmNJ5j8J6jVuUPXFcCeCvm2RoXKZZRbniMzOfDI6Qdpsflo2dendIEm6
         RShL5RysAe3hohXmVDJNASjAKzyc/zrhP8v7Ni12Sck0WejmBqSVpJDp394ZrQya/2xw
         l5nGe2MTKMowWsqXrncXgVLQuTJhnnnJcLNwk3g/BiyelH581cSdDM1lRe1u5Gl18/l/
         X9m611ZPNma4VzyUIbniiE8gZQHqvf2uoz9RYiCeBfIn9JqwQT+RIutUfvvr3N/tnSV5
         6cUTLPjfr/3pzXiFREkydpYRl5drXcfT9EJXYJiuZEFHuSRiTgRypcXzW2eQaAiKrMMF
         gC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606774; x=1795211574;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5eNMmr+DnF90TqvCN5l/r2SqPu00Gu4aNG8AXgfyJ3U=;
        b=zQwKKsVPgi0NKFfA8kaG2deB7R37uUpmAeRucQI3SHnkRxlEmTYibkh7mRec14gafO
         Zj9iflbzm9vLKd/EL3zscqcZ91D1854eoOQ3ewQuin571dT+iS84uIw9riiFu6L5fjhL
         X07VZ90b1t3c2CCvVskJVoVSsAmxaOWlFUrpg5skiMiG59dIJLoGJU3xua0V2gW1SSv/
         B9Em8tjs3nkK13kcpk7WLummEiMwVRtrmp9v1JtgLxR5Ba/OGpHqmk8J4avACbVwkefN
         gyVWjDpVe05J/aGzuZiKWsM6NQIBZRuoTZaO0+1tVuf4Rjux5m50K+hcFeSo07zXIvVL
         Dhlw==
X-Gm-Message-State: APuU4Z8yTG1p8Vgd9210JuTDjrQRDwzB3/IfnFkLxbRa2WFodtdZXLis
	SvHtJWkJKdtHRAaPGdpqWub0C1Z+mgAgUQhcLq8P5m91AoKF6bA6WYicawzbqw==
X-Gm-Gg: AYBFou1/+z213oibwe1O51j6lcDVUrM12ny4eu6voU2LSdZ+jfDJIhJn8N59Rz0MHC/
	T5vqkFkp1hFbcIPZQcZt3d0dZyUqNsJVmlUhxGCDRNY9mMgCJDHdU2TR+pcEX0WdI5SWqSHInww
	RTe0825+7Hx3Pg08G9jm/PUumvWQ9wQ74hcWQYXNio4fdxn2XuPLEDmGPXUZvzSSgrBG/bDnfY/
	3BUJfxyuO/+n6QFU7hqjTlIyhu4wd578auzs6ASQzCzZ1Aq3FltUnQWeiwhzmaIfoVaAWJSEfgL
	9GQdskjQNUm1KFQ7vormwUE5O9lcYDTg8MrWTUD/5DHMtwdQFiFhB9hzps9uULfy5RkSLtiodav
	8hclxLsD4/kHvUF4GeBWPSWNxZlqq2YnRFbfM3j8+A2ZpDlPBV95zXMU95/ZLS4ehNSMGUX4dwg
	mY4N02/yQD8RrnO3jtPCtorDGc+GZ1dYoPmzPZ5S3jF2ujHkvNPC/647xQStOO7em+Bgc0ubkjZ
	mcKVKnBDXBanPyf0vB7d9sGObhbgsBhgS2KUj2Vf6P3uuhvVF9HpEGBoay5hWiTcSGAZIttoyay
	YQxGNDL45X2OMBV3KTa//5Ug81dpK9bNzCEHNFDAgSd4Zujh4U1oVcBbvHPAecMzhetIHyKOa9m
	W/ys=
X-Received: by 2002:a05:7022:1205:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1b5030681c1mr3410577c88.3.1794606773661;
        Fri, 13 Nov 2026 13:52:53 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm9100380c88.2.2026.11.13.13.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 13:52:53 -0800 (PST)
Message-ID: <cc2f6b19-3e40-4835-8831-379fcaef5c5d@gmail.com>
Date: Fri, 13 Nov 2026 13:52:52 -0800
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] MIPS: Ingenic: Add XBurst SMP support
To: sashiko-reviews@lists.linux.dev
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
References: <20261113190836.470937-1-f.fainelli@gmail.com>
 <20261113190836.470937-4-f.fainelli@gmail.com>
 <sashiko-outbox-213561@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <sashiko-outbox-213561@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/26 11:40, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] mips: idle: cached need_resched() load after dcache flush in
>    xburst_wait_irqoff()
> - [Medium] MIPS: Ingenic: missing IRQF_NO_SUSPEND on mailbox IPI in
>    xburst_prepare_cpus()
> - [Low] mips: idle: xburst_wait_irqoff() calls non-noinstr
>    r4k_blast_dcache()
> --
> 
> commit 2871a54058216bdde1330a67071ead0fedc13363
> Author: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> 
> MIPS: Ingenic: Add XBurst SMP support
> 
> This commit adds SMP support for the second XBurst core on the JZ4780 SoC
> using CP0 mailboxes for IPIs and adds an XBurst idle handler that flushes
> the private data cache before executing the wait instruction.
> 
> Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
> Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
> Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099
> 
>> diff --git a/arch/mips/ingenic/ingenic-smp.c b/arch/mips/ingenic/ingenic-smp.c
>> new file mode 100644
>> index 0000000000000..27b9b573a7e07
>> --- /dev/null
>> +++ b/arch/mips/ingenic/ingenic-smp.c
> 
> [ ... ]
> 
>> +static void __init xburst_prepare_cpus(unsigned int max_cpus)
>> +{
>> +	struct device_node *np;
>> +	u32 reim;
>> +	int ret;
>> +
>> +	ret = request_irq(XBURST_MBOX_IRQ, xburst_mbox_interrupt,
>> +			  IRQF_PERCPU | IRQF_NO_THREAD, "core mailbox", NULL);
> 
> [Severity: Medium]
> Should this request_irq() call include IRQF_NO_SUSPEND?
> 
> Unlike request_percpu_irq(), request_irq() with IRQF_PERCPU does not set
> IRQF_NO_SUSPEND automatically, leaving desc->no_suspend_depth at 0.  During
> system suspend (such as suspend-to-idle), suspend_device_irqs() disables
> XBURST_MBOX_IRQ, which runs mask_mips_irq() and clears STATUSF_IP3 in
> CP0_STATUS on the calling CPU.  That blocks IPIs during noirq suspend and
> s2idle, and if resume_device_irqs() runs on the other CPU, STATUSF_IP3 stays
> masked after resume and hangs subsequent cross-CPU smp_call_function() calls.
> 
>> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
>> index 80e8a04a642e0..6c44715d81d5b 100644
>> --- a/arch/mips/kernel/idle.c
>> +++ b/arch/mips/kernel/idle.c
>> @@ -18,6 +18,7 @@
>>   #include <asm/cpu-type.h>
>>   #include <asm/idle.h>
>>   #include <asm/mipsregs.h>
>> +#include <asm/r4kcache.h>
>>   
>>   /*
>>    * Not all of the MIPS CPUs have the "wait" instruction available. Moreover,
>> @@ -71,6 +72,28 @@ static void __cpuidle rm7k_wait_irqoff(void)
>>   		"	.set	pop					\n");
>>   }
>>   
>> +/* XBurst gates its private cache clock in WAIT; write back dirty data first. */
>> +static void __cpuidle xburst_wait_irqoff(void)
>> +{
>> +	unsigned long pending;
>> +
>> +	if (need_resched())
>> +		return;
>> +
>> +	r4k_blast_dcache();
> 
> [Severity: Low]
> Does calling r4k_blast_dcache() from __cpuidle xburst_wait_irqoff() violate
> noinstr idle rules?
> 
> xburst_wait_irqoff() runs between ct_cpuidle_enter() and ct_cpuidle_exit()
> while RCU is not watching, but r4k_blast_dcache() calls out-of-line
> blast_dcache32() in .text, which only has notrace from inline and lacks
> __no_sanitize_coverage, __no_profile and __no_kcsan.  Besides making
> cpu_in_idle() return false during the flush, builds with CONFIG_KCOV,
> CONFIG_GCOV_PROFILE_ALL or CONFIG_KCSAN run instrumentation while RCU is not
> watching and dirty the private L1 D-cache on return from blast_dcache32()
> right before wait gates the cache clock.
> 
>> +	/* Recheck work that may have arrived during the cache flush. */
>> +	pending = read_c0_cause() & read_c0_status() & CAUSEF_IP;
>> +	if (!need_resched() && !pending) {
> 
> [Severity: High]
> Does calling need_resched() after r4k_blast_dcache() pull the idle task's
> struct thread_info cache line back into the private L1 D-cache right before
> wait stops the cache clock?
> 
> need_resched() loads current_thread_info()->flags from KSEG0 cacheable
> memory, caching the line with _TIF_NEED_RESCHED clear in the sleeping CPU's
> private L1 D-cache.  When the other CPU sets _TIF_NEED_RESCHED on the idle
> thread_info->flags and sends SMP_RESCHEDULE_YOURSELF while the cache clock is
> gated:
> 
> CPU0                              CPU1
> xburst_wait_irqoff()
>    r4k_blast_dcache()
>    need_resched()
>      /* caches thread_info with
>       * _TIF_NEED_RESCHED == 0
>       */
>    wait
>                                    resched_curr()
>                                      set_tsk_need_resched(idle)
>                                      smp_send_reschedule()
>    <mailbox IPI wakes CPU>
>    handle_int / irq_enter()
>      /* writes regs / preempt_count
>       * in stale thread_info line
>       */
>    scheduler_ipi() /* no-op */
>    /* _TIF_NEED_RESCHED lost */
> 
> On MIPS, scheduler_ipi() does not modify thread_info->flags, so when CPU0
> takes the interrupt and writes other fields in the same 32-byte struct
> thread_info cache line (or if remote snoops stall while the cache clock is
> stopped), the reschedule is lost or the waking CPU stalls.  Since local IRQs
> are disabled and any remote wakeup during r4k_blast_dcache() raises the
> mailbox IPI in CP0_CAUSE, checking pending alone avoids touching the D-cache
> after the flush.
> 

All valid points, thanks for the feedback.
-- 
Florian
