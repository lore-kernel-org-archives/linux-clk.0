Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697888;
	b=kakIUY/G2tPWnVMXD8JZY300sYh50bCTg2yZgNz5oatzuc6Uef3en4YKfFAdZKcHagzs
	 MArzwWcLNCk2CmbLly13RLtqBe+CTW8ytyhRyy4dKxbduwlv6h0Ts750rFmPKkpoHCoH0
	 RrHDfja8EGSJZEmCcmBrf8k5XCe9gHQSGDSYueLi7Ha6xe1w4c+cCoISZViEc58KG7S9E
	 WwV7sbF9Lz6XBG6fzExBIo2Svxbph5d3rQu3BJX8NRjmZDmhogxGPXuWcUBJRy/PmjI5b
	 Bku+BGllEgpxPrszucBjE4998wfro49u32kEjrPa+ccvPnAZsNubOejLtxvLQ0cHWgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697888;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xxW8JN/Y0KCbuZrpXSaBVqEQmNUxkhkOMH9G0xvrG40=;
	b=I3Pj6BigmUopSAi7MW1V/V/YK7auQySMx3QS1Zuc2Y7mj5kCI/zXN8hhstJzpUvcfrJm
	 4DIRV0A7MdktymXsyzse2bCFOlLjIhoWcxikhmz+0S88WYTlUwPSLBfiwic3vjx0teuFp
	 aGS74Q0+PVpIX6fuen7zmMIFETHG9ItABygLaNfYzD/Ou6F//7Rn6BC3ekXvKPDXewBiI
	 KOGbmr2VUydHhGJsw0TL3NRm+i6uWrxVdb7s7dNDyy2HY/WhXwayadN5rrfMlStyTR0ec
	 BViSwvulC+kObvJEqPnA/antoICrz/oanbgIOOUTlf1GC8BXTzqbuqeFQ5oV65APcKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2OMRWwO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D2B606A32D
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 12:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2OMRWwO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B47B1F00A3E
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 12:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697888;
	bh=xxW8JN/Y0KCbuZrpXSaBVqEQmNUxkhkOMH9G0xvrG40=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N2OMRWwOIZIr3SX5v/CoGDRGsPPHjWiRV7OcWqFsHo5iJULUScB+hFmCLPs/lXRRY
	 tfmKM0ZHbrnm9N1JPXOOTDapVE18izEy2rnka6AMgYcOjwgCnZbF6x0TzNfy7m4Q77
	 I6lvEiFVGGCncNny7G7AMIKPs28WaIYRfUpH1FZkphXp3pco58DIvZjjBKMU1Q0AW2
	 g8RN6VGoysZimrdpmmgQRUpHXZgUdyYXAlbuh3EIo9AgR9jQ77/wEXl8vZlTqXkXhZ
	 qQTotmM/QVH6N8FO9vwm8asjgLfL+1gPqfGZ+ps3APN+OuKgfrof0X6CTZxyzRi2M/
	 NrdhLNDajx+qg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so391269e87.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 04:58:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGJ4jsmmd8WjiniyZarN3sDqjJuVPxARRTy2TdeTbNBNojPgEniOjc1QBlt891/rAd9zYizWXJcRLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VdDoROk4dNmLHOJMsA2WVibQ5KATV/KSh6XEn7yQM9gBO/aNL
	6tf2KrNfhFEcxS9AHit0097ZMaGhV6OCPH4jmc6miw/7DqdJ9vzuDMAxNZpEYdfC1oPSjbs+yQU
	38OWPj+NoSRhkTBLWOdfBuHPsaO5YNRE=
X-Received: by 2002:a05:6512:3d14:b0:5bf:d54c:c189 with SMTP id
 2adb3069b0e04-5c1bc660a0dmr6649201e87.5.1795697886865; Thu, 26 Nov 2026
 04:58:06 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115102401.3520-1-jszhang@kernel.org>
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 13:57:54 +0100
X-Gmail-Original-Message-ID: <CAD++jL=TE0pF60vR-Y==z2LDfs4n2rvfZ5FMOuEoFsD2PwMXhw@mail.gmail.com>
X-Gm-Features: Aa3M54p6XoJWkVp7q4vqRmQARyVxQsd0uuJbzgC_NhGGCjDNxq9tWPObFVl9RBU
Message-ID: <CAD++jL=TE0pF60vR-Y==z2LDfs4n2rvfZ5FMOuEoFsD2PwMXhw@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] arm64: add Synaptics SL2610 SoCs and RDK boards
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jisheng,

On Sun, Nov 15, 2026 at 11:44=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org>=
 wrote:

> Add initial support for the Synaptics SL261X SoCs and corresponding
> RDK boards.
(...)
>  drivers/pinctrl/berlin/Kconfig                |  16 +
>  drivers/pinctrl/berlin/Makefile               |   1 +
>  drivers/pinctrl/berlin/berlin.c               | 259 +++++-
>  drivers/pinctrl/berlin/berlin.h               |  17 +-
>  drivers/pinctrl/berlin/pinctrl-sl2610.c       | 759 ++++++++++++++++++
(...)
>  create mode 100644 drivers/pinctrl/berlin/pinctrl-sl2610.c

Can you break out all the pinctrl changes and send separately?
(Also any binding changes.)

It's best to review and apply this in isolation, hopefully there are
no build-time dependecies.

Yours,
Linus Walleij
