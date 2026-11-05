Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840952;
	b=RNfbQOdcFmxwF1QWeVZMHxLHupI7zwQeD14VJHFUctfC8p7U7BwGxwPc6/rrNNsd3BoE
	 GMWWzP0TxU1VxOIGNdAy59JLt59hIzwW6PnjpGMU1mbPpZGd5yCflCrP7Wgmuf1kFuETe
	 UkhtSzfXmvQPKgOkMeoVR00yQrt3evC26Wjlf31Ymgsi1s1nAXEaA/61QLhhQ4mfZTfdT
	 YQ9BxC95JA1SHFrWog8EBSVEvVEo/8Vv4avP1uA/1wocXEusDnhKBBVnPUruOW6Nmj6hN
	 BRFEFMYpFE4Xqyg5r5UxI7a6vXYZI2fcI1JT7Er7Wjz73MQZdzeVhviCn001XvkgjRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840952;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=CQurrROuzFaL/bzIbqErWOb2Vd+DZtt8rcZK18O3FYQ=;
	b=iVNNSJCILTwOqGYrWMBlSQ5ceReuWY/8H5f/C64mRNRCHkIJa94sOSrWcKVkze3Nll3P
	 6VS8U2cgHTOsMllLsIeVP0Gjj6CK56wyaFpAH4HUbMt4/H63QF3jnzm8uADADWnBsp8Ld
	 P9iKJBWq+1l00G/LAMv1RXrzjWaNYwlUWuk9yf0XOiBkHjHQpsyFPHQuMQ/eypuKgou6O
	 mio6Nxuk/c3Lu4isJ7OZG1iVS59S0DcbHjCrBDSTBEBBe/SN1T16y7hV7bzCHE6JhIP9N
	 I+4uFwzLG9j+4ifs00nssn20nwZGqjg2GjsikPkNy/4XEJ1Mmqchop1uUeEdsH61Ong==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCCE606A31B
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 01:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FCCE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso614240a12.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 17:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793840951; x=1794445751;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CQurrROuzFaL/bzIbqErWOb2Vd+DZtt8rcZK18O3FYQ=;
        b=hTaAVIR6j9s7HqJTgEFQjyNqD3yTH01YKXsSD0W7nh/RUFy1B5kWMINj4Bov0ZKRky
         NHZu048hq04RhJAXTHvnKSgoGO42JP/JkKMO8r3jTMAXRt8vo0ihuEh6jH7JzBQHRWaP
         rBuW2ffGmApx+p9brYvq6YYvnvgYX6EwoGjKC0glrk+DELAiVWKEqoOj93JwD3UjYyk9
         w/3iKU888W4crAqqXPHTKQyZb4dOBT6vhwIZQJs4eAE8WOwshUs1TKUC0ibPTkzwoCsW
         zfmnLA4LsC/ZL4VTWsOJmoZ04f9jnfUFax3LtNjoh7TojXoRVGqJ9vivzWP8AbJI0S7T
         v8CA==
X-Forwarded-Encrypted: i=1; AKwUvBzgae92tLvrrhyFkys4NcNbpN3RRShN7Snxo6H+nowW1yoZ2SUfwWBm2Rx0kfPplh1l7wkFypu/pxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XcOx1QdJngovLBO0+46zwKGqrGT97q7d6LALsNE5wy3+Ay+J+
	QiTrreKQiCMluRS6bdcKprYGU7jUfkVLhHEaJ5fdHMo04dMLRRQEpCgQh4RYyWzc
X-Gm-Gg: AYBFou1//UB2duTWcnsXgHSBjLXkDRSffPHbtLLiKshCWeDNTAV4/kqVxTndJ7PGrpy
	okYtemdGHNbMviBJzTTO11OcEqYHmghQ/6hZn9vvKWncSkRIxyntdGRPgouZvuJ5WoqI0iImBaz
	zcWcDJu+do3WCsiYBsXtWQnujMkpyDGIstQCvv/539mjILb8GewDwHaihWSzBuPG+yBzqNS/amI
	zqQQtBd4s673Co5u+yWKiSujWItPf72chxBDkHUCTD3Zf8Y2qxUhL2FOT8pW0eUyytV2MXz5hIK
	hPKHjo4RNRqT8ImXTcnfpfOgBp8KVOib6fgFGtuEE8TTYLULwNLbR7NOn/UMKhv2Q95Tlivz+IV
	Bj6T/pv++ncpPw6DPHekwfHF2oLV/1IqslTkE5L2Q/TC7BWWURgZ2fHKc+L9hzsS8jZa3+pE2zj
	Wp1LupqpQEKh6dMDDncqGFZf5uI7PnF8coV5357jAVqXtN4jnui2x9xUG4eS8ShS5tlQUf3KXon
	H93q8SlfgeupG3+Umr19k1BTFooF1gl9FWCQgi+/uEVqYhnvaWex/2mvilB6p6umKw6OqPIlYqC
	drWpVbwzlQsXLFYnSTRnJh75MJf7yXbgDxjyYoy8qSQXfEWhvkxI0hId4Cc/LuP5AB8hRY7sEAs
	f5y6LWcqfU/4LAs/ljNyV6cU0ehy+voJZS4ubKR3N8hM=
X-Received: by 2002:a17:90b:580e:b0:3ac:9176:e837 with SMTP id 98e67ed59e1d1-3ae89835172mr13532566a91.50.1793840951234;
        Wed, 04 Nov 2026 17:09:11 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b312cc44sm1250585a91.1.2026.11.04.17.09.10
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 17:09:10 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36d6e342f98so1534132eec.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 17:09:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzL24yXC5XaBe6EBHh81RhpPTS1BXYWayFxo2Ncxq+O7bnZbpdZmm1Vg1K1Tx0XC2vijWvh5Djc1fM=@vger.kernel.org
X-Received: by 2002:a05:693c:6211:b0:36a:1cbc:1093 with SMTP id
 5a478bee46e88-36a42417707mr24317606eec.30.1793840950169; Wed, 04 Nov 2026
 17:09:10 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev> <20261104-remote-festive-1e6d807ef014@spud>
In-Reply-To: <20261104-remote-festive-1e6d807ef014@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 20:08:57 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5Q7BJuay6D0F6-yvjruHvOO4UQaP1wHKK9_exbH=hUxw@mail.gmail.com>
X-Gm-Features: AclHuK_2FUPcxo1PWKolFGMOegNvDHrx-kpQJpfPG4duyjujJtN05LYWI2fgwq8
Message-ID: <CAPY4CJ5Q7BJuay6D0F6-yvjruHvOO4UQaP1wHKK9_exbH=hUxw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890 peripheral
 clock/reset managers
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This binding looks like things that we often see that are actually
> incorrect models of the devices in question - things that should be a
> syscon but not implemented as one. I'd like to see what the actual dts
> for this device looks like before signing off (or really even reviewing
> this at all). Given how the clocks look, it is probably accurate but I
> wanna be sure.

The dts is a separate series I'm holding until the bindings settle. In
it, each manager is a node like this one:

uart_crm: clock-controller@19e24c00 {
compatible = "siflower,sf19a2890-uart-crm";
reg = <0x19e24c00 0x10>;
clocks = <&clk CLK_MUXDIV_PBUS>, <&clk CLK_MUXDIV_PBUS>,
<&clk CLK_MUXDIV_PBUS>, <&clk CLK_MUXDIV_UART>,
<&clk CLK_MUXDIV_UART>, <&clk CLK_MUXDIV_UART>;
#clock-cells = <1>;
#reset-cells = <1>;
};

with twelve of them, at 0x19e04400 (gmac), 0x19e08000 (wlan24),
0x19e08800 (rf), 0x19e0c000 (usb), 0x19e0c400 (wlan5), 0x19e24400 (i2c),
0x19e24800 (spi), 0x19e24c00 (uart), 0x19e25400 (pwm), 0x19e25800
(timer), 0x19e25c00 (wdt) and 0x19e2b400 (gpio).

You may well be right. I dumped the first 256 bytes of each block from
U-Boot: all twelve have the same four registers at 0x0-0xc (reset, clock
gate, one I have no documentation for, and bus output enable), and five
have more past that: the GMAC's interface and RGMII delay registers at
0x40-0x4c, the USB PHY's at 0x40-0x8c, one register at 0x50 in each WLAN
block, and two at 0x48 in the SPI block. So each block looks like a
small system controller for its peripheral, with the clock and reset
manager at its start.

If that should be one syscon node per block, providing the clocks and
resets and holding the peripheral's control registers, I'll restructure
the binding, the GMAC glue and the USB PHY that way. I can also post the
dts series now if that helps.
