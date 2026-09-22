Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338F45616CC;
	Tue, 22 Sep 2026 15:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092614; cv=pass; b=bVefxJQdhaxfjTzREAVuFX+KozwcMtlI/2SHWUXD/2sqxxZ+h075FJmg/cv+/nmffry/GI+uKMVZJUBqY+IEzTAUkbh/0ZL0Un+WZOBgz9EUQCfFkOw56q2V36IUKy/30n5kHbzdSwtSjjf0FAxjXWbmkhbCdX6Cz6GPfWpFazI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092614; c=relaxed/simple;
	bh=w1znGPM/qqPZ0i9oJj8dkTQ3ryTG0oULsfaaAWIw9RQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nq0mWfAEcRlIxMPZ8zp+8hBheWe6pMVAfbx9cmNsPA34alIxdGjvtb6sgqfYNZzTSyM4/Kbh/63SgbaoUJUkIUraY7s/U5t08xq9vaB4SOEZIifDS2Kf5mzF47/4mkD3smomI6R0IQ8BdpMEC3uvGHMU5L5on8a79h65TF15l2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=ILEHrA5r; arc=pass smtp.client-ip=165.173.180.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="ILEHrA5r"
ARC-Seal: i=1; a=rsa-sha256; t=1790092590; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SBNSYRLDyn0P37lpEGHmWsi9paZfOeq3PlN3XSnJDHvL/N+A02GAo8dOcPTx2meHwg6lDLrJX+x00lZuA+PHD1jfHrZopnXvcx+pMwxHAGwIx6wRKckBfmW9H4JT1rAmS8cbp8dvo55wyqSU1c/kBCy0nOnFpzq85fTnf8RETAU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790092590; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HcOkEm8qqnkDKNinM/lYYnC2iu4jAqLUF2hwPidYcKg=; 
	b=BRCINSej5gYImZZZBFideTeHtJ490z6zhhv5G0GM1E4V23dHBPGHI5b7fYI1MZuAZysHqg5amQsWCmzpxy8wxtZaRUBcpsbqhROmon2LgqfTWkxjz8VS6iZqJRJjdVhxP/SiLfM53CpxUnuk8oAK9NU0Kn9yu3PhO6aXmJDla3k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790092590;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:In-Reply-To:Reply-To;
	bh=HcOkEm8qqnkDKNinM/lYYnC2iu4jAqLUF2hwPidYcKg=;
	b=ILEHrA5r8EbBQVLFetBKDax6gRjI9cFrWXgJ9vLYIKqFjUnxHsXRwmwtaL6JiM1+
	vLKrFHIS4fXI5RYXHOQwoh++I5lCMriG+FfjNOnjLHlKHImtZEUfKgqDnWgHiUwnmC1
	FysxFmuN9FFjgi1o9167W+6f/IBQFQKCm3QeGIaw=
Received: by smtp.zohomail.com with SMTPS id 1790092587188860.0530086011092;
	Tue, 22 Sep 2026 08:56:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 23:56:20 +0800
Message-Id: <DLLYUYMR3CZT.17I8APGBH9H8S@pigmoral.tech>
Cc: "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>,
 "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Andre
 Przywara" <andre.przywara@arm.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 7/8] clk: sunxi-ng: a733: Add bus clock gates
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>, <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.22.0
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech>
 <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>
 <20260921200512.3179109-1-enzo.adriano.code@gmail.com>
In-Reply-To: <20260921200512.3179109-1-enzo.adriano.code@gmail.com>
X-ZohoMailClient: External

Hi Enzo,
Thanks for testing and for the feedback.

On Tue Sep 22, 2026 at 4:05 AM CST, Enzo Adriano wrote:
> Hi Junhui,
>
> I tested the exact v4 series on a Radxa Cubie A7S. I used v7.3-rc1,
> applied the four-patch A523 single-divider prerequisite, this eight-patch
> series, and Andre's current seven-patch A733 pinctrl series. The test DT =
is
> a minimal Cubie A7S harness with the main and R CCUs, RTC, pinctrl, UART0=
,
> and MMC0. The Image, DTB, and initramfs were loaded into RAM from U-Boot.
>
> The exact posted stack starts all eight CPUs, probes the RTC and the A733
> pinctrl driver, and binds UART0. Serial output then stops immediately aft=
er
> the 8250 driver replaces the boot console:
>
>   sun60i-a733-pinctrl 2000000.pinctrl: initialized sunXi PIO driver
>   printk: console [ttyS0] disabled
>   2500000.serial: ttyS0 MMIO32:0x0000000002500000 ... is a 16550A
>   printk: console [ttyS0] enabled
>   printk: legacy bootconsole [uart8250] disabled
>
> It never reaches the initramfs `/bin/sh` readiness line. There is no pani=
c or
> oops in the captured output.
>
> As a private comparator, I changed only `ahb_cpus_clk` at 0x5c0 bit 28 to
> `CLK_IS_CRITICAL`. That advances the same build to:
>
>   clk: Disabling unused clocks

I reproduced the ahb-cpus issue on a Cubie A7A. After disabling
ahb-cpus, accessing registers in the CPUS domain causes the system to
hang. Marking it critical allows the A7A to pass clk_disable_unused()
and reach PID 1.

I will mark ahb_cpus_clk as CLK_IS_CRITICAL in the next version.

>
> but serial output stops there and PID 1 is still not reached. I also adde=
d
> private begin/done tracing around each individual enabled clock in
> `clk_disable_unused_subtree()`. Neither trace marker appears, so the seco=
nd
> loss occurs before the first individual unused-clock disable is attempted=
.

However, I could not reproduce this second failure on the Cubie A7A,
even after disabling all peripherals except UART0, including MMC0. The
board passes clk_disable_unused() and reaches PID 1, so I am not sure
whether the second failure is related to the clock driver.

Could you also try adding `clk_ignore_unused` to the kernel command
line? This would help confirm whether the second failure is caused by
disabling an unused clock.

>
> Each run used the same RAM-only payload and was followed by an
> identity-checked 120-second power recovery. The board returned to its exa=
ct
> vendor kernel and eMMC root after all three runs.
>
> So I cannot add a Tested-by for v4 as posted. The `ahb-cpus` gate appears=
 to
> be one issue, but marking it critical is not sufficient on this board. Co=
uld
> you please check the CPUS/AHB dependency and the path entered immediately
> after `clk: Disabling unused clocks`? I can retest a focused change or v5=
 on
> the Cubie A7S.
>
> Assisted-by: Codex:gpt-5
> I reviewed this report and take responsibility for its contents.
>
> Regards,
> Enzo

--=20
Best regards,
Junhui Liu
