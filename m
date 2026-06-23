Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD179313543;
	Tue, 23 Jun 2026 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782221037; cv=none; b=nedpXtk6hQxWCxzGDfIFFP3ifSNjf7vD5WmGKwULT5k5cmPnKyl9cFfdepx/YNvJEYior2W6RlV9hrTB6CsLQ3b+Tdlw8WSneKhr9iBDXcDmO/6LQUmk+8RLS08vNdTCYMHEMpYhznFRqLxgfDDdn+kDhi6rf+K4NuQKMsSWuUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782221037; c=relaxed/simple;
	bh=PVy4S/eNaNAAxNj9kHLDxwcgqSAw69kke2AJz1Kb9pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QU6RrL8mpdJktNP8PPgZQgi6JwJzUcSEjBp7cQ1gDmYs40+TlpMiDxB/FiLenDRtcoebAZPSjJKttetxSNrgvFOVMC94qcxpq1jyj7kruYdlEYUnG80bSoXDcxZOI4BakVfnPFDlcj2cVdhs7kzmU/so9QypQt9o+sd2XxjHjwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=pass smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=YKi5a7gj; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="YKi5a7gj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PVy4S/eNaNAAxNj9kHLDxwcgqSAw69kke2AJz1Kb9pY=; b=YKi5a7gjyQM1wxwm+vvyuvL6+m
	o/dL7T7k53Z0zxFUgYtLOThwC8F7dF1IT0TDRj/R88bJu588o0gzioJEZVMqmNdOG4NJMjb1Zk38a
	9KCxA48kSac8oPHZJlKEOJbxsjTQBWzMKM7FIsQtv6ZkwMM5enI6BpRmLfTzi2ddbRIs8XuvBfLT5
	Yu8ZGfXW/Fo1MTzrwD01i+QNA5d7aQB8JAqrNCt3HFPjVGG0MDZqmyh/8bjt9UEaW2vrNfKCeUcg4
	134O5NTk2LBdItF1XzsEinqSxwtpRYoAbMUFOVFn/iZ2RM5+HrCjBt8L/XhQSBgV75yS/cr3XQhJg
	VGyp0ESA==;
Received: from [81.57.40.39] (port=52518 helo=superkali.me)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1wc16a-00000006qSa-0t0n;
	Tue, 23 Jun 2026 15:23:53 +0200
From: Daniele Briguglio <hello@superkali.me>
To: Diederik de Haas <diederik@cknow-tech.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH v4 5/5] clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO
Date: Tue, 23 Jun 2026 15:23:51 +0200
Message-ID: <20260623132351.4144457-1-hello@superkali.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <DJGG8DEAKSPK.1GJ8FARAHXPXM@cknow-tech.com>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me> <20260419-rk3588-mclk-gate-grf-v4-5-513a42dd1dcc@superkali.me> <DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com> <2100447.PIDvDuAF1L@diego> <20260623123316.4111002-1-hello@superkali.me> <DJGG8DEAKSPK.1GJ8FARAHXPXM@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Diederik,

> md.l 0xfd58c318
> fd58c318: 00000600

Thanks. Bit 0 is clear there, so the I2S0 gate is open at the U-Boot
prompt, after BL31 and before Linux. That matches the symptom: the
firmware on your T6 leaves it open, and the kernel closes it once nothing
references it.

Given that, I think Heiko's suggestion makes sense here. Marking the four
gates CLK_IGNORE_UNUSED keeps the kernel from disabling what the firmware
already left open, and boards that reference _TO_IO still drive it through
the consumer.

Could you test that change if you get a chance? Just set the flag on the
I2S0/1/2/3 _TO_IO gates in clk-rk3588.c and check your analog audio comes
back. The series is already merged, so I'll send the fix as a separate
follow-up patch, this evening if Heiko is fine with the approach.

Best regards,
Daniele
