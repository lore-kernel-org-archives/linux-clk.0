Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727877;
	b=fmZ4lhKvJyEYkRhFsD2Y7hgU+RJnTZLoPHlKd9eC0QKx88eEqvQDBet86Svf62VHhlP6
	 +Ccd0/s2L1iwZKkjBPHtvGIyCCxDgQIOUhsBay/q83e+Tm+n3jKdRz5AwUNkTZN5Q1ZPD
	 x2QLICFDB4qIAifenA54dhuqAbT3JpMmkZlprMGkHGEQc2+tmHgu3SUPB0lWfJZNwAG8m
	 ceiZabljLnZnHPfOwV/AcPH6DWgpO3ISJ2AownClTb67Aq7QuVIki5EGXFsfGHcxQxfud
	 +qWGK0oBzrBZ6qtBoFlzDaK22xjquyu8T49sV8h5Pj83vSrpS2HqR55S7532T8dUlcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
	b=25R1su5tumKn2YMw1aHau/jujdHvgtqHHH0mC6unuwpAiC4D6XXxmDG8D8P0pyHHLKsv
	 kviqsDxHsJsteAxMaZiiJPRWGrgh+SREwVTm8oz8met7xDXrjkcVR4NHLINU0XdTieeIm
	 haTOTwPb/09DrMqTJZN3yGH8LwtM2iGRfa09CX8/j6Z3Hu/4qRQUytDpGpnb4o6llHEdW
	 P0xkQGdSilCjRDv5lWrIDucQZc8T+FgN51HdFxx5Wjqoni+PppHkIYa+dIdSeCISZxP1e
	 +QoeYTMXn98KmYYPe/HHdDdzB+KJoKBUi4OFYmTUk/+KpxNcZxyYecTxZzt4YUWmSPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfHX33b9;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C718606A329
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 07:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C718606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfHX33b9
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2719971f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 23:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727875; x=1795332675; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=sfHX33b9HzNVq08BaSf4y0sViK/MK0chzVBJ0Q+gvrAe9T8wXjtDwJMVvfNxxjvT9l
         SEWTWE0sZtcsNwKWEFyXzvLZNe89AQsVdApUgEXQBL0TJsoj+jbScFkEv+3jRZ1lB8vf
         d/rISxDPp+F/K0bJHknHkk8CXnGYEM/127Yv2NeUvCKPhYO+eTU9rpQmEU6Dd62/EQvB
         fz0HUNzeHXC6U3b4kz52ODEk3D6rWUXeADFYBeeqPtDrSrS3EHKV1D44l3N4ZEbUKSDw
         GOdF9hL5WuF6stzHu5B4BcrufdthWBPcUDcNVZnPgxjB1MxYoePPvR2o1eoXKeb9bMzV
         K9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727875; x=1795332675;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=fU8Z9b4zDautEkr/Lr67tcYzZ92oRixJjKucQb5eCBb/4nFsvJJwRAn9fayIE+VQ/m
         NYK0m/2FxkOSxtMtp5pwCjuPn4g7mjGhwRntmKghImhBJ8itYGpqFvP3c1BBPcSB7l9h
         DyF4NyyyaH+Twk6RsEUNEaMhTX6sZH96bqCxn4BY0CkoKLGOqOBlMg3+E2TiaQH0c4u5
         eM87cfSWfYrzzvtW+q7OPJswcL1G7UR2PI+s7gkham85vIjiT1N2f3KX3Ojd3IZB15Di
         fXqe9q7ueV8RDAr1Qs9gasWv1pi8KS4ImSBqOG78CslWERptAZmxwphjZ5+mEDhDPlVW
         xxfw==
X-Forwarded-Encrypted: i=1; AL+hErEI7doLBLG/ezDtkXqQuw4K1JkROzFo101PYItic2rkefFEHZeodRZOO5143/Ime66ZlwVLOZdYu94=@vger.kernel.org
X-Gm-Message-State: APuU4Z94OaQWschCJZ+20RbkNHDPMrr2+RixbdaAk9vD4AMQ+zuSSQrL
	TLx/6rxEkQpHBpQTD8cmRo9vWA9eKwaXxKAJS1hq/qJvUP8EyInOa1Rv
X-Gm-Gg: AYBFou3tdy1EM7tv1lK8HQGgDU+z81HVQvZ3lMfssBe4LszGUPgjFWhc6O5NcUj+0WR
	Q+mc9N+CKZt4/ixyBUt/2L1077M/6Xtn6BruRzS3rPhp0UNOgcnYrVE05FEaCDT9EhI1vINHkN8
	4q4wb3ilgOLNnzlsye5yryQH0i4jmy0NUTDZTpIG4UbwUxfqEo2dQHCboT58FmA67heJdzYOGnv
	xWTacW0Kcz/O/ZsEyE7UqLHwlGu0IawMc3A1YNaUMuXetPjhDSp63VGq06uLizHqCTwhw7/of1d
	EyjtU5qpu+uqrXG38TdHwa6ZTMNvsbPtQ1O+jkyjZbsApZiAoMbpaR4bDEJPsqIM5OrsB7rd88O
	F6gwXytJgbfnO+1JBs+RDF8ubcF/j2kD/toz6oZpbWKATcnmpY5XRtv8xMbz3B64gxAaIKSm77m
	6B7/3vYmLjyHOfWh/Zr0rsOx2euocJFuz6BOMlfI4dZVthzhnpOmQO+QK66GyRsUFVzQW6A+6jd
	1PlobQ1cFvUjSuobeviCvaVhJzVgp5GrLFc3aq6AXj62m1iJDR/ph7j6ClSC7D+vY/taSJOcGcJ
	dsHlBTQOorqklHKOK0se3QAynwTanOtPfAeVsuo9IWIy07z8cdfPDNQQLWq7ah3dCZkv2YntiAg
	x+yszeySpydBna8Qk2FVoviIouUuPbfLqpNyRSnBO8gcRjHBpqtKHIM5iXhyynAQiQloO34R+QV
	hRfKgBXnD+1RNrEBrXEkR+2mawu+67l5BjaKJfoitI4OCDNlxmAB1iQ5iw9euk4MlMkoKbgnawT
	wq7R/bEYv+8uBVI86yXNgq0Kg==
X-Received: by 2002:a05:6000:25ec:b0:493:803e:800f with SMTP id ffacd0b85a97d-49c725e5749mr15660384f8f.29.1794727874441;
        Sat, 14 Nov 2026 23:31:14 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm12992274f8f.19.2026.11.14.23.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:31:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Han Gao <gaohan@iscas.ac.cn>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, gaohan@iscas.ac.cn
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Sun, 15 Nov 2026 08:31:11 +0100
Message-ID: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
In-Reply-To: <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
References:
 <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni =C4=8Da=
s je Han Gao via B4 Relay napisal(a):
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> Add the main CCU driver for the V861, based on the A523 one. The CPU
> PLL, the CPU subsystem clocks and the E907 clocks are left to the
> firmware.
>=20
> Unlike on the A523, the second divider of the 27 MHz output is a power
> of two. pll-audio-4x does not pass rate changes up, as its parent also
> feeds the UART clock mux.
>=20
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Do you have any user manual for it? Or at least BSP code? It's hard to
review patches without any of those references.

Best regards,
Jernej


