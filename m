Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580380;
	b=gXQZrRBTCBU9gEhxxkQh/Np+PH+5V0nfJdT3JwmWF/5Ws85zQPP47Mxd+ZquDV3IKkc+
	 i8/yj3spAUs+IVYJos0/bwmvBm6fxv+d3bXgE59K+EACZQbqxfO0jAiKX7svXn0hd537L
	 niad8nZEo3SyjYBemO/kkPRzoc9y75MGZ3H8JuMFGIQJm2En2sXTk+9dlRA5yG3tjOBfw
	 QM2442tiOdEyYZ2q+ax1db46Oyk4fwcjrwJ9/hHIXJa8npGz6mfCDyYDcH15yB+IgiYvA
	 GZQ6rvu5wqScm2f34w2nBBRJab3aozu2mm12FyCTZDiPKrHk5Wz4zZMNuMsMRPLhu5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YjLnuqwofbYQbuSGetIqvxmrdKzxbU4U58ecDgp2SNM=;
	b=FSW/OC3NnZ+faOK9fFN3V8C82qnWrs+oGQL1CjaD7571/KkoQ3yGHIcHllTxsmNOeZN0
	 yslG5KoTXG8he34L+Mj8Oq5H2oPpMJNENlVzb2QNH1hIFHRs0ctJ1jJORCVucvB2U4ymD
	 q7h9qV1VtCGxscA8yPxacP79Gm2qaCCWt1y5C1XuD1hyyomFF6tgIylO1vWtZ+8Km3uQR
	 1Yt3flKjzdRkqyxr2WFiMCz7w9A9GeOatj9A6ven8DV6qjwktD7sG9UGU2parO5N7QFTw
	 kU+lm3+zdgxV5wqgjZEH7Do/0bLvZPAI7G2CdjBnE2XYRLiZE53MXWjJZ3pm8JWDGYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QGuqjW64;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5517606A8AB
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 14:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5517606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QGuqjW64
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so17153025e9.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 06:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794580378; x=1795185178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YjLnuqwofbYQbuSGetIqvxmrdKzxbU4U58ecDgp2SNM=;
        b=QGuqjW64GyfUIS5n4gCyjfRTu2bVeR5MvKKfIT848V9jA9GemYj75fPEeT4vfpR3Rq
         IOW2/yQ0P6HWNCQ1bN67glwDFfoKqW9EO1u6yLYnpy3IAyBVCN8eDu2tmEqCloDXRj3H
         /Gyy1awDwzVcuav1IQSh1G38+47rgjfrF8m/RhhJplIGm5UuxqdxfC0tD3RUa61lLMGv
         UIgdUG3HS/Q0Yarg9YbZ2zD777scTm/vlVJ1+7BJQm8oZbazD68WeQHIsCoKFIrh8aFE
         /8ciZKih0ub9ohL7ocLeQsBQL8Iwbuw499v9e6k2B72B7Fzsyg5UVzj+rUfGtE41XtkK
         bFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580378; x=1795185178;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjLnuqwofbYQbuSGetIqvxmrdKzxbU4U58ecDgp2SNM=;
        b=fh3tvrnsSGNPQSC3HTB74L0qj6y+B2rpBROyuMveVvLl6pbNSokiC9DVQn/G3kuzYX
         0YMIzZoB+lueITHkkdm6KgPZaST6MFUue3sofNY7AitNSnbadeE7yJvH7WX31h4z4wlh
         PD/EB+RL7vQ5sgLHF8UX9jQYOxsxWmgb0xTU4rW3p88wnmI8p+Iaaj+DTLxFMBU7+bEW
         2crbxhnBRQFOHAGTKI46EvUeFCO8D0e8lC4mqhR0CPVWirn5JJbjDb6tjW46Z14cOiqc
         kMWLdVECH1vHs1H56oobqaF33uuzSEfQjcXGYjrakzQDhMtotqQRhy/TypEinPBfj/kl
         iOcQ==
X-Forwarded-Encrypted: i=1; AL+hErHPBLFqwDlypCafnx8DukQ1Khdv5jLVgiaDhQKZkkCHdUIbJ7C7fOLg9ylBVXHIe1RlVLQa0zgJS/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZCrWeTG2UI4gdFoWd/6BqwzZA3mPR90Yfjqeng6yzhA0fuTbX
	EKj/c7wRzBUK8nRuflIJ9RlxHud0/ji3wwk2bo6dzD3vS+F9rmmT+pZ+WSCkCecc7DM=
X-Gm-Gg: AYBFou3zvXXaSA91zQCneMVSyNTAbzQp4hAQ3hqGfyK8W40EoP/pz2WBD5gvXc0O665
	oSBttEObd7GbLKQ0kAn+J9YClxAF579GGUzOeB1cPO+PUZz7Pr7FTuvg9sOYiKKcTDG3IdFQoKd
	O49Cd0TudTOt/K4iPYImj87apLLP75GEX6m5jZVd4eTVKOV4txmr/coT2CEhRLVsn2Sf50XjRIJ
	YiczqEpRQsz3T4Q7yFQdtZ9uyFlQXEPsCaGksclEuT3+xn7MquBGRUmUMcRAC3j1Vh/Bjs6Xlqx
	JfGt2H/tQydqC/uLrRByxrLFEdy6DI3mwP14O+DP6hB5hLXVM9QknhU6D9j1RKl34eP+7cJI77I
	lQ5mGn+LZigRI7ED7y6B8bOpx3sKfrALaFT58aAUy47TYunxaRxZYKTKxwcBeqULqFEKWbA3o6C
	44LsWAovGkFeYaScAwrimLF7wZHn+KWYFXWMR2IHI1rSjV2mhfNclefjmeQ8Rot/slSFv/PY5Dq
	3SyG4GjXhOax3qNh4x0YlZSFIbDgzgCjn7Zui6/pbo9tmoJu8WOg0P9yEP0+zC+qenepNfI0YZI
	+VOCbpz24Resz+1go8+F+NzslNcJH+hUfaQO5PN6+whYgl1h
X-Received: by 2002:a05:600c:3111:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4bb55a4490fmr56671835e9.10.1794580378184;
        Fri, 13 Nov 2026 06:32:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm167089005e9.2.2026.11.13.06.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:32:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Chuan Liu <chuan.liu@amlogic.com>
Cc: robh@kernel.org, conor+dt@kernel.org,
 christian.koever-draxl@student.uibk.ac.at, rafael@kernel.org,
 sboyd@kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Christian Stefan
 =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>,
 devicetree@vger.kernel.org,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 krzk+dt@kernel.org, bmasney+clk@redhat.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
In-Reply-To: <317f2930-9f65-447e-aa46-223ba9e47033@linaro.org>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
 <317f2930-9f65-447e-aa46-223ba9e47033@linaro.org>
Date: Fri, 13 Nov 2026 15:32:56 +0100
Message-ID: <1j7big244n.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On lun. 09 nov. 2026 at 09:44, neil.armstrong@linaro.org wrote:

> On 11/8/26 22:45, Martin Blumenstingl wrote:
>> On Tue, Nov 3, 2026 at 10:46=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com=
> wrote:
>>>
>>> Hi Martin,
>>>       Thank you for joining this discussion. :)
>>>
>>> I have re-examined the capabilities provided by pm_opp and cpufreq-dt,
>>> and it seems that we may also be able to adapt A9 fairly well based on
>>> the amlogic-cpufreq.c here. So we have no objections to the driver
>>> implementation in amlogic-cpufreq.c here.
>>>
>>> I was most worried about before was that cpufreq-dt might not fully
>>> handle the complicated clock and supply adjustment logic between
>>> multiple clusters, which would have required adding a separate
>>> cpufreq_driver. But it now looks like this can be solved by adding the
>>> corresponding config_clks() and config_regulators() callbacks in
>>> dev_pm_opp_set_config().
>> That's great news, indeed!
>>=20
>> [...]
>>>> - Meson8/8b/8m2 (32-bit ARM Cortex-A5/A9) where we need to reparent
>>>> the CPU clock to XTAL for stable operating during clock changes (which
>>>> should go into a cpufreq driver that implements target_intermediate).
>>>> There's no secure monitor or firmware involved for CPU clocks.
>>>
>>> BTW, could we put the CPU clock handling logic in the clock driver like
>>> G12A does (though, of course, handling it in the cpufreq driver might
>>> minimize the coupling between the clock and cpufreq drivers)? That way
>>> we could fully reuse the existing cpufreq-dt?
>> Common clock framework maintainers don't want muxes to be programmed
>> magically in clock notifiers (which is what G12A and Meson8* do).
>> So there's a chance that for new drivers they would just NACK that appro=
ach.
>> I don't recall the exact reason anymore - but from my perspective
>> using a cpufreq driver for this is the cleanest approach (although a
>> few lines of code extra).
>
> It would move the soc-specific logic from a soc-specific clk driver
> to soc specific cpufreq tree handling clock muxing. I kind of
> disagree on this approach. If some logic is needed to handled clock
> parking while switching clock sub-trees and notifiers is not
> accepted them the CCF should evolve to handle that, not moving
> this logic elsewhere and have a proliferation of clk mux related
> code in cpufreq.

I dont really agree with this. There are other cpufreq driver that do
handle this intermediate clock. CCF is there to expose what a clock can
do and how it behave, not to encode how one expect to use it ...
even if it is the CPU.

Which clock is the "parking" and how it is handled is really not
something that should be handle in the clock controller. this is
a usage policy and it belong the clock consumer IMO.

Changing muxes in notifiers is also very fragile and will completly
break in another clock was to refuse that change while in the notifier.
It is kind of getting in the way on reworks we have to do in CCF
Amlogic G12 is the only one doing that. I would prefer if this logic
could go in a cpufreq driver, which is where it belong IMO.
If think we can do so without any breakage in DT.

>
>>=20
>> Additionally: I believe the udelay(100) in the G12A and Meson8*
>> implementation is not even clock related but a delay to wait for the
>> regulator to become stable.
>
> It's highly probable
>
>>=20
>>>> - GXBB/GXL/GXM use SCPI firmware CPU clock control so to my knowledge
>>>> we're good with what we have (meaning: no custom cpufreq driver
>>>> needed)
>>>> - G12A single cluster, no DSU: needs a cpufreq driver that implements
>>>> target_intermediate (currently it's managed on clock driver side in
>>>> kernel space, no firmware involved)
>>>> - G12B multi cluster, no DSU: needs a cpufreq driver that implements
>>>> target_intermediate (currently it's managed on clock driver side in
>>>> kernel space, no firmware involved)
>>>
>>> The cpufreq-related resources on the SoCs mentioned above are relatively
>>> clean: each cluster has only one independent clock and supply of its
>>> own, and these SoCs also do not support voltage selection based on chip
>>> binning.
>> That makes things simple, indeed: each cluster follows the same logic
>> using it's own resources.
>>=20
>>>> - SM1 single cluster and DSU: needs a cpufreq driver that implements
>>>> target_intermediate (currently it's managed on clock driver side in
>>>> kernel space, no firmware involved)
>>>
>>> Compared with the SoCs above, the difference for SM1 is that it needs to
>>> additionally manage a DSU clock. In this case, the clock-related
>>> handling can be added in dev_pm_opp_set_config() in amlogic-cpufreq.c
>>> (by implementing clk_names and config_clks in struct dev_pm_opp_config).
>> I think so far mainline is not touching the DSU clock at all.
>>=20
>> [...]
>>> All in all, it looks like we can currently support all Amlogic SoCs in a
>>> single amlogic-cpufreq.c? Then, for the specific characteristics of
>>> different SoCs, we can differentiate them through the "compatible"
>>> property and add the corresponding drvdata for each.
>>>
>>> I'll also try to support S7/A9 with representative differences based on
>>> this patch.
>> Great, let's look at some code rather than discussing theory on how to
>> write code :-)
>>=20
>> There's one last detail that we have to manage in case we also want to
>> include the Meson8* code into the same file:
>> config MESON_SM depends on ARM64_4K_PAGES
>> 32-bit kernel builds can't satisfy this (meaning: we end up with
>> linker errors). I think a simple way to get around this is to add stub
>> functions to include/linux/firmware/meson/meson_sm.h.
>> I'll take care of that once I can submit Meson8 support patches for
>> your upcoming amlogic-cpufreq.c!
>>=20
>>=20
>> Best regards,
>> Martin
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

--=20
Jerome
