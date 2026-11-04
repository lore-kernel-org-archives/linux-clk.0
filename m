Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799450;
	b=3IywT5sw4DxTD6IGWTaen2kokI6Wr4j1W8kQiQnMAxQJZgK34WxhGnfXGUSst6nfKwfZ
	 w9L3CaQN4hxOFhJjd+oQ6fdt3cWdn7EKMtBcw4R3xHEkSby4nZYgOeBNMqrTGsr+D7YrW
	 FuQb88dmQAC+efp0Bzm2sEqXWkqBs6oTGp4pEpueR/rf2FFZfHus1SpvGXmbsak+c+jMw
	 nlWiPdb8AgQy4bvB2+aTrmH1oDnC6N15RTqJNXnos7GOosnYyA4VdooRz9Zu/WFt3TXTx
	 zyrbTQ+IRpSU0l4T4aAOR8j2Q0aJ4Gc1orhplhbP4dE1oW6JcxfKjW4WIc+KgEUU9hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
	b=wBJbmN/aQM6fwJZpjoqzVOconGNFohLP7MkEkISaRru7A8UQ005IdWhbu/A5fWMrxZ4f
	 +HxnSYjpZ05Q33Jr1qG5yDZsZ/so99FYo5vKHJ1Cks/UaodE7gP1a/6oUuG1o8mvLGaSd
	 auLlB038iDK/yWiJC+hrcocos1o0j5g6CwlGXo8Yjt45+oooElJN5gfRASttcilJXa8Az
	 HEndZ9bIKDTKmxANej/hmhSf4iZAzLJEq+HmfdmA97vBH1BsT4FGrMO5Ovq39RlprgNiZ
	 hTQw0JiT1XRZfz+0mhh5k8V0a2uFB83LL4WZ5JWelG5D+EqRgHAQ2a84cOP0kheHaBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HbJKKYLo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDB7606A32D
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 13:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEDB7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HbJKKYLo
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8470d7d430fso273050a34.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 05:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799449; cv=none;
        d=google.com; s=arc-20260327;
        b=O8u3VX30oUvHhTHmzavKID3YbfG8V/kdcx1By7M/6oSb8wCn/pQOW6b4yA9PTBW+8E
         OE8ZH9yNQbmxzAomjvUZodrPruQZsOd9IjjwuCGoigT8ANY9D4U99pnQU6vrI7THRVtA
         fbwYycxaa3e7rUL08Jf7UmGeHwW8Q5ItN1Tax7XsPENtzVVHLNI411d0fpMR6KHqHP4H
         dm6nAVisUjh1ofromhYBNdXgs2FpVQFrJBAETB50bAL8k7X+ZccSsUoDx+EH9kxkxzgV
         toVSgWmViX2OupKBblZfXH5Xxbkqw0nG5342x3xEx9pO2VK0IfyohqUXvP8psr+T+uMj
         054w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
        fh=HeXQQ0vApGuCIBhfWhwDIpewiK6On/vqBtzH94VPoSU=;
        b=qEWNjidsQWDcX/5sFpZByYxXug3xgne9yhENidRzx4ubbdYZoD0noWt2eO8F68QIRM
         t1yWPiV1LcREkI/ivwpNxqNmPHsGB+W7q4PR0vjRiffo0QOefqHgP/dhqXbNLPqByskH
         5NgPcN4JBN9C19HaHePaLY4A7MhnlPTzTP8XdR6P4wst8OhjvJ9WeS57/6gaKAb2aXPd
         29H1G8RLAAVQ5wDZuaIbPkIkItl2fMJduiPiDqbKjNTocUVutujd9mYeYt1wEIlIePnA
         e0k/ny1E3iV8zZPtwhZZ8euTFwwYkJVQYcVGANgEL83ZJo+Aos1/oKOW/hXzX4c2lAgx
         VjMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799449; x=1794404249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
        b=HbJKKYLoRFTbv88+u68atuiDsGsfEkhGD9eTclvuReNcQP7HDpMEPxVstZpud3wUT6
         md2aFf7Jl64Aqg2kr+73B+6+DSf7K3bLWhJo2zrkqk3pqlIOsIe9A5YSq6/f+UixpVjh
         VRGj/VMu4gDKqlk+/zOSkVxDRi+cM3RrjL8MChQV+8pukxf7tOoKwoPrgN0KaLN3/Xqh
         kq6Z4jqJwJb44vLVtS61kwDPbUN62SiGYDeByPHe4MWzzGtGKyBbmt1WBYpY8S8p/OSP
         kyeRQA0DrCZ2eFtyujgQ1eNKJGAaCSgkM9/8eaW/Sa5cyU8h/0N2xH4wH1qcQKuV0PSu
         uM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799449; x=1794404249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
        b=RMu/lLNonxmvzsZt0VbWh1ehzb6vNuZ5o81IVi3+YS/V3KT7+puK567RRgrp1YOrUl
         gx7mCTVBh9I1JKH2iS9+6vC+x+HvHLi2st8H9qz4//hDCfvLKbLhdv8MRzW5WUhZDK+a
         s3A9hR/ErtSrLEpW2IqWZaEs4Wa8GgOqWNlifdPxY5iRlnVu5aTOhp5AMqoBA36FbEbP
         FNcpmqzttJqWr/Ss9Q0fJDHGOVffN7KNbpmdWBJzNybleAxzSBMkjKYcZNA3aunyizmq
         Av+//y+JgpNWf2XJfWzgt3tqZLllwfaQycKG8BgIUPN7O2wES5sEIXqDnQt1T162eMod
         5o6w==
X-Forwarded-Encrypted: i=1; AKwUvBxL340gOXSECjjEPSeCrgHj9tMCqis1MPUQLHMNj+4TxqUa7k5LQqETeAfdrHWwdCOYh8w0oH2avRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MqLGE0L6QcASsiFEUodDwpP1fSl4xWh01Malg7+y61baN5oRT
	Vh62pfPnnyWvzEshbX90um0Joj7GTAkwZQqC1ivox8VzteUW7Mma3Sr/+6J6o7i1+Z1ieC4+w3f
	oILn/1CSyU4RfyU6oFs3VV/N+vM6UJTQ=
X-Gm-Gg: AYBFou2N2kwuI5JyxpnujsFE3YjwbZErmJwR2xq11xoBphZJPWzPYddMeXCGf3lVZju
	uDLjYtErMXlBrFQIxoIxqPq9LFIwaHdaVzBu+LqbMqQ6EKXu0XLyuV53gMBP6EncCnv3+6kgIH2
	N4WIl3qAQRzKiRU0UANR9hZ6Kbe0NGkkYnvI2WKAKUU7wPRI/B7HIWkA9dYDV/jEenZNwuSCsWA
	B2NVkqMhtlaBnOU+IHq2JqqjtFOpvD2AXKcSjjBJapE3+Y7K5tpDLNEJcdjVmbcPQf77y6eVrTR
	vF7bH/KxsH2pkHTHHcUONplzrQZq1oZ4h3DEYx5BipR+OeBUhSCKkBZb4u8T78r+dLQlDCgRn7I
	xEXlfLx/l7I7ZeFZYwGLkB8YAn1j3XF7F84wAWw8bRntHvRJjBQ6TO/Kz5TACyt5/7R4iqG1Vsu
	DcSyGi
X-Received: by 2002:a05:6830:2a8e:b0:843:ed9d:1535 with SMTP id
 46e09a7af769-85eeebf194dmr2565221a34.19.1793799448718; Wed, 04 Nov 2026
 05:37:28 -0800 (PST)
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
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <e4474a7501c9e2a355dcc80d632bcfa10e1959e8.camel@pengutronix.de>
In-Reply-To: <e4474a7501c9e2a355dcc80d632bcfa10e1959e8.camel@pengutronix.de>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 4 Nov 2026 21:37:17 +0800
X-Gm-Features: AclHuK8-JeRODUOUq-HqZqaALo40tyoUFGXYArDC07Ims6VRBqfkF1PB6rfGKec
Message-ID: <CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: joseph@telaak.dev, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, Nov 4, 2026 at 5:25=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
> [...]
> > +
> > +static const u32 sf19a2890_gmac_resets[] =3D { GENMASK(1, 0) };
>
> Are these two bits separate resets? Are they individually controllable?
> Why are they bundled into a single reset_control like this? The commit
> message doesn't explain.

These are reset lines from the same IP block for different clock domains.
They have to be asserted together even though there are two lines.
See nUARTRST in [1] for an example of PL011.
The gmac lines are for two sides of the same async axi bridge.
Asserting them separately causes a bus lockup.

[1] https://support.arm.com/documentation/ddi0183/g/signal-descriptions/on-=
chip-signals
--=20
Regards,
Chuanhong Guo
