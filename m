Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609500;
	b=zRLtDDX+BUHoBSUwsbaX8G7KeT5upDqYiFBHUIn5MGHnsUtkRy/B1y1XWazyfjyDwBlG
	 6cRPKH+gdTVCh9OtyDsCyCtas23bGRByxEqafBLHKkUgOgJzRgegrM7BTIT4Zz/P+5cVY
	 Pio8dWt0aT8122DdC0rRBjfR7YhURYSsV8Buc2A1vtfKlniLfwngLcoUJUFh8l1r9LtL6
	 8XnORrQQtg13+z8OhUhgkUBtTMALlxIRe3QMxj+F6dBqrJtJvmi9sF2E0q9IZwX3elo7M
	 GrfTXrke6/+EAdVGK0Vxpxaj+JuWR/H+P700hajFaYia88jj5H1UhcHiU5VeVzUwmMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609500;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=nJaA1oVQlfD3Td2+HTDf6tsxtXlDuEgeg0sbDdSaIuw=;
	b=t6S8tm1CFX2j9Bvgpj3cNf18geuPIoHOTKaTNZ+La44utg8NbLfluBVKBuFembSOzW1a
	 G3+XYQc0jkHhNQAOhpqVxLzoLcb27pLZlcEFbNOUuSXsz+fuCTE2oqe4lfR8vnWmYG7ku
	 IcWoeTyW0DNY/qy8ow1jJeXeCQX1tIt4+ENDoNcb6Lscu+9xn+agL5DGu9RULPoefcH96
	 JL0qjGuvApd7dfSqdl50sHXujHFWZS8W5I9KSNfrNEHrJWhezDic4lfAqNS2d2zAY3eqV
	 dbh5hHkwtBrYFYx30TqfGP0sxARVuXT7DsI0SiWyV3qZikUFkCEncVP1b6tRa/GOByg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=u+vVcdZW;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603B8606A31E;
	Wed, 25 Nov 2026 12:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 603B8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=u+vVcdZW
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id DE1744C930;
	Wed, 25 Nov 2026 23:24:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795609492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJaA1oVQlfD3Td2+HTDf6tsxtXlDuEgeg0sbDdSaIuw=;
	b=u+vVcdZW4+pQIvPMqTSScUsB2Z1KVWtGuyYxTL6kPLXAXgewuFltXTlahkwwEKTpQama05
	t1wosTGBvOYsvck0FOAtpOIseOvoTHPnFlMH3qF4SY/IEf2li+X7AbwWtOe0gKIsW9UznD
	u4Gn8UItfKrV7kTpQoVKUpecD4wsRIrh3yg68MBMSu/j/StiwcuBLL4hI9YoL/IP6x2lEI
	zYso/XIDmQP97v4Cwi1afQCtMPrj+cmBrC2SI9HkhpxsMcHx3cRH788kzElMcalgldVvm9
	fgSpC7adl2DxgZyvYGfRFRauvnqrFpZFCmy6akE+cuEnFdDhPeUZLPmqVZf4oA==
X-GPT-Reason: The email is classified as legitimate personal correspondence.
	The mailbox (alastair@d-silva.org) perfectly matches the sender
	domain (alastair@d-silva.org), indicating a trusted personal identity.
	The subject line "Re: [PATCH v7 4/8] clk: sunxi-ng: a733: Add PLL clocks support" follows
	standard technical/developer communication patterns for code patches,
	and there are no phishing red flags, urgency tactics, or suspicious
	links.
From: Alastair D'Silva <alastair@d-silva.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	netdev@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v7 4/8] clk: sunxi-ng: a733: Add PLL clocks support
Date: Wed, 25 Nov 2026 23:24:52 +1100
Message-ID: <20261125122452.3966873-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-a733-clk-v7-4-db7c5451ffa2@pigmoral.tech>
References: <20261112-a733-clk-v7-4-db7c5451ffa2@pigmoral.tech>
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

Hi Junhui,

On Thu, 12 Nov 2026, Junhui Liu wrote:
> static struct ccu_nkmp pll_ref_clk = {
> ...
> };
> ...
> static CLK_FIXED_FACTOR_HWS(sys_24M_clk, "sys-24M", pll_ref_hws, 1, 1, 0);

While testing this v7 series on the OrangePi 4 Pro (24 MHz HOSC), ttyS0
switches from earlycon to garbled output with:

  2500000.serial: ttyS0 MMIO32:0x0000000002500000 (irq = 414, base_baud = 1384615) is a 16550A

Because the hardware bypasses pll-ref (0x02002000) when HOSC is 24 MHz,
sys-24M physically runs at 24 MHz from HOSC, while pll-ref remains
disabled with reset/unprogrammed N=12, M=13 fields. Since
ccu_nkmp_ops.recalc_rate() computes parent_rate * N / M regardless of
the enable bit, pll-ref reports 24000000 * 12 / 13 = 22153846 Hz.

sys-24M, apb-uart, and bus-uart0 inherit 22153846 Hz instead of
24000000 Hz, so 8250_dw calculates base_baud = 1384615 (instead of
1500000) and programs divisor 12 instead of 13 (+8.3% baud error).

If pll-ref is disabled/bypassed (or if sys-24M is physically fixed at
24 MHz as the comment describes), either pll_ref_clk needs a recalc_rate
that returns 24 MHz when disabled/bypassed, or sys_24M_clk should not
inherit an unenabled pll-ref N/M ratio.

Tested on OrangePi 4 Pro (Allwinner A733).

Thanks,
Alastair
