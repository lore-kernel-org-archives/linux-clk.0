Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424116;
	b=UyemCFK8TmPytnHHEUeVhI3LeqRBv6+Bc4DvvdTVipWUR0HVUaDwMU52ndXKbFwjKkbT
	 pZxy0ygqGQCJoSMHZeqinrdHbZ7S+9KdVZYF8LYsMiU+ElRwEL2YE6V5oyJsLF9PJMFKB
	 Owo1Msy9xDr7YEiekjo4Ge5HnxeGkR3htc+gEmM3lSGBvPmCaQYyccy6uRn8UTP6ciuRc
	 ZLdd4V5BYN5j9N0bt4hcWd4c0Ul4kjqV6dtXc254H1vEDbU8aUyNUkGqu7s14pRvDhw6w
	 m8o5s2jqdbRwjyq54T4i60zHgqJGFfx529yUtUfrkztnK8VxP4MKOfjpN93gOIwm4zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424116;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=1u1FmtDlq9fLUJ7TofIm7s6Ux5ZyHgM1hXjsasoL1Tg=;
	b=lL7TBfEfQjbs7OdGm7CkKwoxFLYsOIPJY5HKmJCr6aVEoay2kHwT+ObYa1r95/w4pp48
	 smUAYlB1khq1STuPMa8GZyqoPnBpEE8GMBdRfJgDiDkFs1u1HchyEdwbGyqERjzYyO9dI
	 /7G6E5yVNFaMqxp369lww75fLvqzHrqK13JxMp6h4FVGprwwtF2QdSsnZiGCu6KkfxmKp
	 nU7fmRQWbewdbJTQ7Jficg2c1hYvU9YGu514G1hj5dbCNGes1AlQ6gj/zlcD8qQ0HuVaM
	 7T3E/dcgJ95IOulGxgH07KwzTKqRvhOYesAFyDTcwXgwAIErW73n1nVy+UsIEQEi09A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0F4606A32A
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 19:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C0F4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso107849a91.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 11:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424116; x=1795028916;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1u1FmtDlq9fLUJ7TofIm7s6Ux5ZyHgM1hXjsasoL1Tg=;
        b=h3pLoVAkBimSmxziK+mgaNg6a0UNV5npjUD/uCL1dUjDEy1HoR8xnAU9pzKJ6u+iL/
         HHy2LxF1nuZ3S3Tu7AeQMEUAs1rh44L8fweHVS/yhuy0cYYv/6sXDegf+NQH4/lAB84u
         WLuHWM3saPKtR1knBdt9zgb/nZeeoSG8y854Rr9iaDCz6M6S5rjA8jRvbLaUHFQKb9Lj
         Q42jDh2FLxsfhHXHq6Fg7eUqsd0JrnSBBTCU/FL1hlYZJY0kCGrke8PKEm2KKBCwtCjs
         aQEkDS5nhJa1KqBcLD2SD4nMbkLePxkjzWHWiFGc3CFP93kcDi3Rk7re+SM+Pn5grdeG
         b1KA==
X-Forwarded-Encrypted: i=1; AL+hErGniQlhnYH8pyQT+Bfqm7p4bIkt2aPxYkYBBQ/R3hh4xaEF9gPQjDETDc1kUmX7vHvri7uz8K1Rc7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n0Zl+1GDmGxK91/XEZTEGzGi3cAuSVebJPZ6b1NRMUPcDXoG7
	wq5sD9eUA+kZ6QHIHD6fOw5rnluVHuT6RGBsnSAPx6p3u8y4ANm4lqTDCb+Npwku
X-Gm-Gg: AYBFou1yUssncFvsYMW2Fhf+vjV/GhbX+k+OvWKqGvUwbLxoZLinbzXS7hruDSCLpZK
	qN0u4SCbbnyGqnR3h3jS1BVJJYONqTA4/8P4tQYStXANT4Pl/NQXFZeLA7NdBIjxW4zKkZjsGSj
	eiSIIeN9FWaCtJqC8VhnRMR2dTfqiaAO0pW90I3cgE07XJOWGeYa1VlKjbmC0A46T8FnDCqwz5m
	3z0Uqgilq1+nY+EGjkcMjFsOJ1NoNmaVVjB8FObAX4htKnfdLLjj6w41mKGN1pjPM+87873AblQ
	5/PGKWMLi2Z6Bw89Pg6J9k60M/B0oH6XZkvJAWUk61U7fECbxTo8og61e+WrrSndaNK6NFvUiuH
	JChIxriUtcorIb/KT+2VgahmKOc528/6E7yZl2qgjoi31gP1W6OoM/kfwZtLKbK+iIoLgsrRHx+
	QIJQLz7LCZeWGF/hhg+hydCSeVIMzp8VOjqZ/TKhnHNuwbyeQrz4S/c3KpftKsYa9062Nmy1/kT
	uizxTUhFDpUKXO5QjNzCUnrF2k91DaEEFudrmN39Dz6lPPSGj7tTaau5l0xsOUnIQK8sxYIB7kH
	QSg7qLI8sIHI2y+UKe7lwDTxFRYskmkh/HQhTnsuMclZ8rPva52uzQ6ua4/4jGtqutKG0ZihrfF
	K0kqN2hP82H7LiL1T9SKCE7sD4XoVzF6+tSqWsaxltZtox8Q=
X-Received: by 2002:a17:90a:8c12:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b197c81815mr166963a91.1.1794424115591;
        Wed, 11 Nov 2026 11:08:35 -0800 (PST)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d282fdsm493508a91.14.2026.11.11.11.08.34
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:08:34 -0800 (PST)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e795af1d4so108949eec.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 11:08:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGl2sgsynl89DcX187Ac/AtGhyD8NG6v7+AqK9ilmAqsv7t5E+kxAvvUIEtSVu1DFWWNHtuxazk8D0=@vger.kernel.org
X-Received: by 2002:a05:7300:c7c4:b0:377:3984:5cb with SMTP id
 5a478bee46e88-377e15ef441mr284775eec.17.1794424113527; Wed, 11 Nov 2026
 11:08:33 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
 <20261111-sf19a2890-sysm-v2-4-d2fcb723e4f1@telaak.dev> <d59f52d1466c515f574be1e9eb127ca3e43d155b.camel@pengutronix.de>
In-Reply-To: <d59f52d1466c515f574be1e9eb127ca3e43d155b.camel@pengutronix.de>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 11 Nov 2026 14:08:22 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5_Qa2vf7_GiFU-T92HDkA3mdY_x2Dt5DXZ5dMfS-oUwQ@mail.gmail.com>
X-Gm-Features: AclHuK9zvtdVIUhueVUtW3uifqySWqzLz4GA6zOccXJAOROeptCP5K7cJXQAOv4
Message-ID: <CAPY4CJ5_Qa2vf7_GiFU-T92HDkA3mdY_x2Dt5DXZ5dMfS-oUwQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 10:56:47AM +0100, Philipp Zabel wrote:
> > + spin_lock_irqsave(&crm->lock, flags);
>
> Could be simplified with guard(spinlock)(&crm->lock);

Will do in v3, as guard(spinlock_irqsave)(), since the clock gates take
the same lock from clk_enable(), which can run in interrupt context. I'll
convert the gate enable and disable paths as well.

> > +static const u32 sf19a2890_usb_resets[] = {
> > + [RST_USB] = GENMASK(2, 0),
>
> Do these three bits control separate reset lines?
> Does the hardware require them to be changed together?

Yes, they are separate lines, one per clock domain of the DWC2
controller. Bit 0 matches the controller's gate and bit 2 its AXI
master's (usb_axim). Bit 1 has no gate, so it is probably the PHY clock
domain, whose clock comes from the PHY rather than from this block.

There is no public documentation for this block. Chuanhong explained in
v1 that the lines of one IP's clock domains have to be asserted together
[1], the same as the GMAC's. The dwc2 binding also takes a single reset
for the controller.

> > +static const u32 sf19a2890_uart_resets[] = {
> > + [RST_UART0] = BIT(0) | BIT(4),
> > + [RST_UART1] = BIT(1) | BIT(5),
> > + [RST_UART2] = BIT(2) | BIT(6),
>
> Same question as above.

Yes, they are separate. Going by the gates at the same bit positions,
bits 0-2 are the UARTs' APB resets (PRESETn) and bits 4-6 their UART
clock domain resets (nUARTRST). The PL011 TRM (DDI 0183, section 2.4.1)
says the reset controller must use PRESETn to assert nUARTRST. This block
leaves both to software, so the driver asserts them together. The pl011
binding also allows a single reset.

The same goes for the other two groups. The SPI block's bits 4 and 5 are
the PL022's PRESETn and nSSPRST, which its TRM (DDI 0194) ties together in
the same way. The WLAN blocks' bits 0-2 match their AXI slave, AXI master
and platform gates.

v3 will explain each multi-bit group in the commit message, not just the
GMAC's.

[1] https://lore.kernel.org/all/CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com/

Thanks,
Joseph
