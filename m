Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B336D3101B6
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 17:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013701; cv=none; b=RDZSUzP38dfJZQgZxNf0xCpkvkSKGaAiycf8QvbERk2abFGB2dtWynhNU3aLGHn2E8/5rb55U5/zkHNrD7Sq9ZwHvlKWDN97Q+hfWMljMsM9TwORXpXbmmwMdH58aYIXr6D/6EDlkIJXYqOW7uHMJB9ePIOujG7ObMX6AHe1yaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013701; c=relaxed/simple;
	bh=hEhWSLr++Q/ZGR1Ejsv0vtyDLrUAeGLaq6Kk+8WBNuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlOh6G3o0R6vzTpftEMcMa6+IFOJIrTJkTrpLbonQ3zQ/f9zn4Pk2B/UedjO/1vqcM/UXCRWgOmh+O89PC6KMTrn1O6zA0ly/GIYC6AFUJ0zsBRYKoEgdlZDuPSd+4P7PMxYAwBWLqpJY1Dg6LsbxFOfl2CBw08TEn4HAqw3Q7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eI4O3yTq; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eI4O3yTq"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e50979c71so204450485a.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783013699; x=1783618499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qJKEGc46A6MaBdapnr1AnlxGbrLJznLMC+lsm+gAYE=;
        b=eI4O3yTqkYrFCqCyWlCfVzUNuQVLysn61BMPKRPIhNyDOsxthbL6/kJwykS9l5YBOP
         2s0qy2DV1W6o/g4KpGIRASIBfv0iVrSqgFHkL6/zR/4b1o6hdUGPdU8Re5LR/r4MCy32
         2ROdZ7To1WYru5+Y9sQxcx76jl8jTv4oP0mH6XEzhu4ui9F6KX7wX49JzCHGI2PwEQMC
         OHdhFpylKGpKvExm4tiCp8Cp2zYtfwKLZdYGyYg1mwC5QCDb/ZQEEof+rCc2+t3jZJNi
         X4g+ah283vxipCg3JsP6VbuzEaqK/qr0EazAsk6t7usLEwo4Chdl3QrVY5kmQg5aOhLW
         kBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013699; x=1783618499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7qJKEGc46A6MaBdapnr1AnlxGbrLJznLMC+lsm+gAYE=;
        b=d3UWUD4M75Tig7DNHTkxmUaCbBGJ1GrYRF0CxjexA6u0QUl6vGFP7lA1OO2nLHz4qs
         gwDLRwqgeGnuj83Ato4HvVah49gpDeUydIEPc4NO1lSp3bCg+OFg77hlBymTedXMBmog
         2cPNrFGX5HJBxtXrkshRdFH4mRKV+UvXLpeLnSykJPnk/e7G+G8VvKsXOUv0T/cs2Djf
         xxJlItxMeV2bAoI7J4h7/ylHsnwpCJEDV2I6185ja1mgA2cufcdnJMGgc3p+d4b9chrh
         9yxLdUxYc9ouNosBolEaZcq4QvqKKoi9Go54uieH2ewVqpkBFswOo7zUGF21Fu2LHez3
         8UOQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Xb3StE42ObBlC1qVLgoLgJKOPdlXupDaBCRXCBVsdBx3r8IdFzS4ne5IWIBVw9viuB7rT6LO5cg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQWgfcnpq6CzLVTIbOR7FegXRzrskqDOlOIrbF0NBgEwxROj+j
	2JPjQ7PnQgpsP2vUtV7Mrp1My8PJKyCsGDvyoEvwFrsF0HqHMJhWyCRA
X-Gm-Gg: AfdE7cmb4Q105r5IMZxN5q4EbH7xpIF0J4x473fVaLBgrdEBcEVO+HDYTQgRNhotzjX
	exScPZsZ4Up6SS5Mfg97kVVs4FyXzuVndlBr+UYoLDKFx2iVvz74zkDSvXkpTdy7nZqxRPP53JV
	RdfmKF7wcHMIkgSJKyuCR760ebekEhcLaGKLl0V59B/2lfFOJGY10OwGh6Ctq8OnqUD2xCKGB7y
	K1ZLj+xVToC1Kj4pO1jHFD56pEpmfBxAM6roe99o5nXoqwBYD/lMpdU9RExeojEAxVxnlMW7WGe
	QhNgIV2XkFk4QUaq9zG0omu8DMWXttSJCRBQsg4Pu3JvDTcguprf1tLaYNuJr7foWc9VGCPJBxz
	yeSslfXw02AIil0GCvS4NGuARKBaqcJpkTLyyjbWa+/L/jMRUiPjDqN/VsBRuwds8OjawvZaf8f
	/ZJs3Nle73xsDu7QSN8uUkvz2V5TrzcFtwQ9LmxLLUDXpki5uD2fALrQiDZjD+
X-Received: by 2002:a05:620a:468e:b0:923:8612:f15 with SMTP id af79cd13be357-92e7823fc78mr907524385a.18.1783013698575;
        Thu, 02 Jul 2026 10:34:58 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80162220sm268889985a.25.2026.07.02.10.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:34:58 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Thu,  2 Jul 2026 13:34:54 -0400
Message-ID: <20260702173454.855897-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-7-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-7-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Following Andre's suggestion I went through the bus gates in this patch
and compared every register offset and bit position against the public
A733 User Manual V0.92. Findings below; everything not listed matched
the manual (122 of the 135 gate entries verified clean).

1) UART1-UART6 gate bits look wrong:

> +static SUNXI_CCU_GATE_HWS(bus_uart1_clk, "bus-uart1", apb_uart_hws, 0xe04, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart2_clk, "bus-uart2", apb_uart_hws, 0xe08, BIT(2), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart3_clk, "bus-uart3", apb_uart_hws, 0xe0c, BIT(3), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart4_clk, "bus-uart4", apb_uart_hws, 0xe10, BIT(4), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart5_clk, "bus-uart5", apb_uart_hws, 0xe14, BIT(5), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart6_clk, "bus-uart6", apb_uart_hws, 0xe18, BIT(6), 0);

Each UART has its own BGR register, and in every one of them the
gating bit is bit 0. Manual section 4.1.6.141 (0x0E04 UART1 Bus Gating
Reset Register): bit 16 "UART1_RST", bits 15:1 reserved ("/"), bit 0
"UART1_GATING - Gating Clock for UART1, 0: Mask, 1: Pass". Sections
4.1.6.142-4.1.6.146 have the same layout for UART2-UART6. So these six
entries should all use BIT(0); as written, enabling any of bus-uart1..6
sets a reserved bit and the UART clock stays gated. (bus-uart0 at 0xe00
BIT(0) and the uartN resets at bit 16 all match the manual.)

2) SYSDAP gate offset looks wrong:

> +static SUNXI_CCU_GATE_HWS(bus_sysdap_clk, "bus-sysdap", apb1_hws,
> +			  0x88c, BIT(0), 0);

Manual section 4.1.6.92 puts SYSDAP_BGR_REG at 0x07AC (bit 16
"SYSDAP_RST", bit 0 "SYSDAP_GATING"), and patch 8/8's reset map already
uses { 0x7ac, BIT(16) } for RST_BUS_SYSDAP, so the gate here presumably
wants 0x7ac as well. There is no CCU register at 0x88C in the manual.

3) Gates without a register in the public manual (V0.92) - these could
use a short provenance note near the entry, as discussed for other IDs:

  - bus-spi4   (0x0F2C)
  - bus-sgpio  (0x1064)
  - bus-lpc    (0x1084)
  - bus-gmac1  (0x142C)  [same question as the GMAC1 clock IDs]
  - bus-tcon-lcd2 (0x1514, and the tcon-lcd2 mod clock at 0x1510) - the
    manual documents only VO0_TCONLCD0 (0x1500/0x1504) and VO0_TCONLCD1
    (0x1508/0x150C)
  - mbus-gmac1 (0x05E4 bit 12) - bit 12 is not described in the MBUS
    Gate Enable Register section

The remaining bus/mbus gate entries in this patch all match the manual's
offsets and bit positions.

Thanks,
Enzo
