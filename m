Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772044;
	b=kGaKJbVgvrsHaaIjbsA7dFqlZxyxYdUdmqezzffsYW70k2vd++ZLBEvjc8g2TAS1bWLv
	 b+QvsP3hMQdzb2tAumC7g/2HVtrh8V8NEZ1g2qIwhEF6hnPdmbVN6DMzrQDa0afxpyS06
	 QFyFhu526TNDynNcw5zK/lARKbp057EZqOnJVuXHOAkYkB47ZAdnm00OTzDppB+0G3ht/
	 0F27jsWHFfkid3BTENHylK+GRCY0tn3O4PCJy6lUoUNAMRAGn0+kRQZ3qbvNKrXlYBch1
	 Bpj6cYIFmet9MPxxMPNBUnA/VwTWHde/iV+W616+GFRnYQGTHAIsY61c/Jx8uuRAjpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=Jn5vbA2HA26YYZAVHurR2qnRXvY7PEKSS/j0oDB/fbA=;
	b=LkGHU5Cmw/aCzKNrWzcbOicPR7znHIvvw9dtv4hWG5ISgsJSfvCwxoMhtgA5YgvjRDLZ
	 PaRy7K+TGICe4YOuTfKBjVlcLS5/VBSl0PGG6shJTT7fnRlWnzV6+9/K70Fyz3Zfk3W/w
	 6tjwJelpIbirnBh3sUSib+pVtyvs1DrnFhBIfLZya4PSr6bKcsfOg8F2uO0MnppvUs9ki
	 7WOc1cgJLesFkbvbY3htFZOp1MkVRJ0T2JyHzUbvi1Cb0KYISYxe72tdXdF2s7M4IDFRc
	 gmUKYfnHT9w2WHJsFQT7oqNTb7F72I1YuLcpLeOK2e2jJPJOWe76AkCvcEBv5DrxnlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="nV0+w/3z";
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738CE606A31C
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 09:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 738CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nV0+w/3z
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so12252701a12.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 01:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795772042; x=1796376842; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jn5vbA2HA26YYZAVHurR2qnRXvY7PEKSS/j0oDB/fbA=;
        b=nV0+w/3ztlgeQuzORjR2dnh44aZed2JE8zRP22/HHWUbwHP+zSm1yZyM8VjGmh0pNQ
         kjgnWkZOEo4Be5y42ZWPGrgkicDWr7bVoeAwh2GR49W1kMDsigxuermYl6vAzk3cRpuW
         vhyvhMMGyLGeokT2gf9bj0QB8oOhXduFm6FeAYvxU2JHEmGleoKRr8frBc4L/CiOqYMX
         BOKdGePRDWlR6j7RUiCLChrlNjzmO38Bi4G6uBzJ6KTcKSTw3ZytjyCoaCNQBu1tEz/7
         YTWaquLX7Lx4SbfCUasGbgcOwmegnpDSBOOEFvfYiXdL7flbNy+npJeL8c/rzjRsUbjO
         LZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772042; x=1796376842;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jn5vbA2HA26YYZAVHurR2qnRXvY7PEKSS/j0oDB/fbA=;
        b=2QD38b7jDHOmtBzvOoKCiradkZwfP9+9ecBlkdKYb+Q40G5JwZnRtCGSQQ2Aln5FiT
         f29jEZ73AzvvwpiENoOAW4dLLAVtN3lip4yn3ebFTkZWHGSVzwShwlXZXbsGy8+O33B4
         64K1ksaiiwRA7gcHTssLlcKABqVqDAItfEioa7iSd5O0PPKxZnDRwXAHn7d1srEzr/8U
         OhhoY0FCsEUAykTaZqJtAxhNQD+sKRM/w8DoInSNS3eYYaldXlR1k/xhWSTeSs8hD3vA
         Vmn/+29CjZ7O2or5gyDW3xGHHq6vwsDxv2qq8FNTVU0Jbhrj5AfaiueqJbcm8BxBjrVR
         rhPg==
X-Forwarded-Encrypted: i=1; AL+hErHLm4yQtBNjHO6uskNyKNcKMtfCYYzi7cCu9W+IO0NbYAwLigB+oef1xfUu6Cid6VY6qfJhSC71E0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yIaShOBYZ0WpdMvT2EIPypJP+dWKZ6IlQnssT2WXiqo7f8TH2
	srfC0/zSR81CNcuNPdKlVUIgrTkuHV4kF3Fs+V7I4mH2mJuDlyapZ/kOY009tFnVb1c=
X-Gm-Gg: AZFdTZdky4ort2g0Svjk1jzA7vfVBbKJJ94W4nT/hbrASq6zhb+sQSAm3QFPMdsoMNZ
	+s6Z/X7I/j/j/7Z8EwH/8W7dMWJzuR8nJUvZKL06thLK/NL+2EB3XeUmY3E7AVBnvUiZ3+WRJU6
	lS5L6iEriIUumclZClD2+BLo6BmGqT7+jLkxpBADKAiMhxjPbPzBL23YbOPiYeshbIXX10LlRoe
	852ioY/M7ExXjYPZMW3tnSS8OP1XLXx15yWDxv0KdiSOD4lK2a4Pv5EEewi6Lga6bdk6Fry3Qsk
	Gtwa/NhoZ3J5F/GtQ+vlmx+cLTtuiARjbbuO/H/SVX8Yg9rwqQTwIjzoBQsGGjsj2Vf2OD0zjP7
	JvSctMEYvolwrQQ5JReDjjxI9iFpUMfO+g3+M1IkzlHjg9XtI4fD3bU71NwFGRz/SSTkSR1rDPM
	QPpNyYnSG7WaG56KjF9lQTd4t1Cb8mblW7Sppi35f7xz8t0/4KjTVulTOlxhzxtNlnPUlsOOhzI
	uqb8rIgRuKFUkKP+lrpsItwY5McpEWwlr7EZMXfgouDsKMaURAngOTmkXUZgB7V7MUfKtPxkDlI
	2l50BA4MpH9Ccqfjb5XE3xWnXpOTJ7crElpefP0uxqg/f3CxK8aQMc8ysaENxhZCJTtVFQ==
X-Received: by 2002:a05:6402:2403:b0:6bb:aaf:5d94 with SMTP id 4fb4d7f45d1cf-6bb0aaf5f7emr8353882a12.25.1795772041771;
        Fri, 27 Nov 2026 01:34:01 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc020sm10607522a12.25.2026.11.27.01.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:34:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jiebing Chen <jiebing.chen@amlogic.com>
Subject: Re: [PATCH 0/2] Add Amlogic S4 audio clock controller support.
In-Reply-To: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
References: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
Date: Fri, 27 Nov 2026 10:33:59 +0100
Message-ID: <1jmrquwrco.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On ven. 27 nov. 2026 at 17:11, Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> S4 uses the existing AXG audio clock driver and reuses the SM1 and
> G12A clock hardware. Pad clock and data selection is done by pinmux,
> so those pad clocks are not registered. The controller has an internal
> reset line, like G12A and SM1, and an audio power domain that must be
> enabled before use. The new compatible is amlogic,s4-audio-clkc;
> power-domains is required for S4 and forbidden for the other
> compatibles.
>
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
> Jiebing Chen (2):
>       clk: meson: axg_audio: add S4 support
>       ASoC:dt-bindings:clock: Add audio power domain for S4 soc

This title is messed up - Remove ASoC and proper spacing please.
Also you did not collect the trailer given on the v8 by Krzysztof.

Next time you send something like this, keep the series numbering
please. This could either be a v8 RESEND or v9. Like this, it looks
brand new, which it isn't.

>
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  17 +++
>  drivers/clk/meson/axg-audio.c                      | 165 +++++++++++++++++++++
>  2 files changed, 182 insertions(+)
> ---
> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> change-id: 20261127-clock_audio-76eed7ee7ca2
>
> Best regards,
> --  
> Jiebing Chen <jiebing.chen@amlogic.com>
>
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome
