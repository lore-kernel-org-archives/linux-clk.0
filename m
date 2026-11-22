Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368148;
	b=UOrXwdPFdhOlX/dWpyIS6ks/iGByz0/M4Zuvs3wSA6sNzGHGdd1h0HC388V7zk12YiFt
	 L71f+QDPvfr2+KVNX4V04zjGMOlHBOuWywsIJfFmSaTkONt1i8QY5ZzT0Mw2OkUXVCA3R
	 /Kku6ZXH6bSJ+8EGhgaWts+AjU/AVPXJ1b8AJ3Lyx/aFJ9WyiY99Qp/KvF5xt6EYIjcXL
	 zmYa/hl6P2aoOtToSPpYUH6TrwLrkhX/nyqqF2hwuR1TcMl5KFsgAZtWtZQE78EUr30II
	 Jw4agWmHrI+Ddb6V8NRjGPrPMXDj05L19Ag6FkO9vAhUjf88X8mOwWJSnzaL7o77dVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
	b=KkgLAspl8CMvS2rlHIS0cphaIzbxNlOy+DkeZ5K3gBCqOau6X44PmuCobR0J3euwT2oY
	 FQi1r3H05i7uca52HEKQxTMna7Vy8aKFC5o2SPjl4AnFFBfl1vCrR0thpPG3HZX4r2zZI
	 Yg7/sS0lEyD+zLA+2l+/RSO823ANQ7kGeeWjOvlegxgWX3VYobyblt5ePi6PFjISWv+Rn
	 8c1E2gUgvvMGmMJdLOLDQsbxhoeAHlvyKhqTSyhbFpprRn3T2GMEO6ezspBhWSYHuSwxQ
	 onZQPnc0ryCEtAJ9ETtWFizejEH8H/JRZiUmVcVoF1HI6rQP5Oqls9dKPH7LflPws1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBAzZYcv;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB585606A33F
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 17:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB585606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBAzZYcv
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1852144a12.3
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 09:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368147; x=1795972947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=XBAzZYcvI0UAjxnxRcreZ2xa57tWzsBIk+xJyJfakPnjZQLRqB7gnVTc6Qn5CdjUbO
         xXTqI9r+rGRXSGvF5d9u/Gnt8cBL/N5/xf6tBndcQ9TnX3hHeuD9tSzX8sNkkbj7vhA2
         NeZPxacRSsaOBC0O3QO9DSW6vT50WIL7fgQmtZa0YNtC+iyBs2ZZbCtUEdbBWGXZZsl3
         XzMwvQ4v9H33vCd27VDcugFyzLDIPGo4nIjz28dfG3CtbzZTvpHODKvnyuNs3l4NIsgV
         rmrwLL0KqwTgCr+ubLcXoPp9NBBDnxFxRbDWkoQYlII4OMLRVrvsRiSieYn+T9Gsvdjr
         irPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368147; x=1795972947;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=KQRgWEQ7dW0a+ub0iqEITKsPnFrzx0Z4FF+nI4HaT9SX6EBDf7DIKB9SXnspR1MJuL
         A2/GVh3sNoMNCiuTzu6XqKycmLh7YNQhBORcudHMCZQfPTpF8nHpJD13JvypQMZUrpKX
         M60q9Q9xPs6E92c3Tuy0FYoqQQ7a/ONsGAtz3P4GIJ516JBfIhN9IExndpZQlwhPw6qg
         dXUkF1b4IgjfdX/kuhEPtN9L3YCdsARH9Odk2XOGoTu457Gzp7c3xoEwPFoyuQrMNLV+
         GA/9YyFm5XMQHt6PRYjSxkV8X+Yc0tzQkU+A4xM4NSA8lEyDrx71RoRsL2f4tZUt91At
         WkyQ==
X-Forwarded-Encrypted: i=1; AL+hErHtqXcRoNtTihLKUkP1NbsZUjDfpmSdZnhbrEn7p0CufTH5XLQGkcgUr3VVxc+nGD1Wwiikzx4Omak=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kEFgDWr9Wk1+q5CQOHS6apUWvv/y4c+KL85gaOVN7m58xWbDG
	WkJw6wg4K5myjWxUq+vhEiQF9bi/zUUz9Anp4NyR+M9CxVgX1PjX9qVP
X-Gm-Gg: AZFdTZfhfXmAa07o+iHAQHpep2YRcK+xXR4rvrRzCIyI7u8BE+19iWGDhlkk/93NDsK
	5vVsrjen6J/33QnuKz4GsBop3b/2tT0GNSJygG/Grm9McBxn/7bK6EYPMMGHSO0rn8EbVwo+3O/
	Da8a36mnGK3YNi6BSaAITcjV8nGEEGu9njzwHj7RpndSybwcCUMaSEf5gvNk/efqq8evJtn5Nz+
	cgpHJWRueVwlghNqlL6Z1M3vnZKASn/Vt9XZDCAnNji1Y6+Ig24KI3eYOmBDG2U+EH+lNM0uKlx
	yJ9DMgXBJmOiAdB22fhfEHGE4slN0Up/68bFXd8e+9swvoPzQH+c9A1REMFcJe/4gIFPGfjVK/c
	5+8v5zS7N22jI0JtFdUnjwYyZwFSZYZ3PcZB18JFJj045SaYhOmHnE69ZPPeAyqRbnWqt+EzSH0
	Lu+W617WsDRXdIAbrEaMbkvvBEfgTFrW+147QXFEAtlVti02mVHBmjtd1OWxhykpOahk6fuczbc
	dfn0ZEOhsjzMW7e1mSrQTWBZB+XFi8r2fqwFwi32/sgsHqsPpyZMFusz599dWHImhjcGuubWIk3
	50W180eZCVLpm0ulf6cJAK5a4qDMWkF7WzAVRRyjuyTpH+bOTSuvp8t4zWrti5/taRCaTmRe+Et
	MdYI=
X-Received: by 2002:a17:90b:3d4d:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b41c905a3dmr8081661a91.27.1795368147033;
        Sun, 22 Nov 2026 09:22:27 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm13471136a91.4.2026.11.22.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:22:26 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Mon, 23 Nov 2026 01:22:15 +0800
Message-ID: <20261122172221.3552455-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
References: 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 15 Nov 2026 08:31:11 +0100 Jernej Škrabec <jernej.skrabec@gmail.com> wrote:

> Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni čas je Han Gao via B4 Relay napisal(a):
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > Add the main CCU driver for the V861, based on the A523 one. The CPU
> > PLL, the CPU subsystem clocks and the E907 clocks are left to the
> > firmware.
> > 
> > Unlike on the A523, the second divider of the 27 MHz output is a power
> > of two. pll-audio-4x does not pass rate changes up, as its parent also
> > feeds the UART clock mux.
> > 
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> 
> Do you have any user manual for it? Or at least BSP code? It's hard to
> review patches without any of those references.

https://github.com/RevySR/linux/commit/bb06380bc2e5a02049cd01e0b10cb3c3c694b750

BSP code

> 
> Best regards,
> Jernej
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

Sent using hkml (https://github.com/sjp38/hackermail)
