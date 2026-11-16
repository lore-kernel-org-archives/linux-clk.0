Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817343;
	b=bNeIsNJS1eB+cWGSRhByHNUuNPWeZVENqQhBwcXPtk7kCEVlE6iwAcfwO7XGMafBJ+76
	 3dfPkEeKkSVjB+F4O3lWZW0XWQA9TRblGVwm960mBPrFouzMqAMvP/SUq0Ug0QiQJD5LY
	 5gWIMSLfh4I2M6ittKTsi/vTkLqJ0BujlMT721UFUQpflHcdHcaQSyl0Qoa2mfVxWtut5
	 MN2kGHrICsW+stvVZBXqry97JoWjnm6syL3tguppCrELJqU5MhbWtKbgGhiGIz1jbFuNU
	 4BuDl5Zm9Ioat6d/Hx52P+SDt3/cFt7UjMdiYc+Gq6ePmV6xwWdyXzWXyjzeHwPN+/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817343;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=32AAHIWK9+nySJMB0j3qfZjXIrfpuRX6GBrpsnTt5Jg=;
	b=3RmLmM0wYPR2tkqoG/6yCc/UZ6ah7PRucoEoiqt8PKh0GK5MqebwS+leArtM2qX6TPFO
	 CR5qAQ8Wu3H2T0ymFEOwvdHpsIKbAH1l3Marx1GOYdsr2YAsOt+bBEaLNgWkhY8SGk5OS
	 p+kYCZsiMhoLgi3COHJqIuABMr4eme+F0OMn0z2EvsvwN6FVPi/pHzGj0pvUlDuTrNYph
	 /1NGWlQXOdPBYzgxNuRYmJfr8zpfxnAns1Tdn5UWZhIPYG6Ltjp/aSDNOl8WwPkO7AyW8
	 yt1sOL0ayS95vOX88lupwJRJwJB03CaJM+RnIRbmghqm4LKs0BQ+Lkcz6v5uXRL1KTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=eRzLgCj+;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A336E606A330
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 08:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A336E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=eRzLgCj+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=32AA
	HIWK9+nySJMB0j3qfZjXIrfpuRX6GBrpsnTt5Jg=; b=eRzLgCj+1P9TNWlQv6+U
	a+HIghOb2IwHqxqYJv2ZQHGfn0SF4pYehbmUrvheYiIOMbhh/DhYIwvLwcydweRj
	4EVAJh0+3QYe9ncHpgtYpV1kXoJMefuq5/LE5xNBDDJp633A13hviVR5m0wCikAu
	vgGiwOvV3t7KBG63Qlt8I+FmHBzn2QOzek+kn/MlXjLEDZn/6jcAK86jDqZkuj4p
	L4di1uWturUWdAj588oi7pFCFtJshRRK7GE4rHbXI97mLoCel0bZ0i5fqk1CaKVF
	FPcstvvCup77Z57XCiN+RtLGtNSol074MCruuZ/NT1K9+zD4CwBE5+mcmZegdSh3
	8Q==
Received: (qmail 1194596 invoked from network); 16 Nov 2026 09:22:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:22:18 +0100
X-UD-Smtp-Session: l3s3148p1@qn/ieWBgjp0ujnv5
Date: Mon, 16 Nov 2026 09:22:18 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/8] clk: renesas: r8a78000: Add SCMI remapping support
Message-ID: <avq9OvLAHgxoQdp0@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <c38d744c09dffff550a9b882051c211b572b8daf.1792163045.git.geert+renesas@glider.be>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c38d744c09dffff550a9b882051c211b572b8daf.1792163045.git.geert+renesas@glider.be>

On Fri, Oct 16, 2026 at 05:55:41PM +0200, Geert Uytterhoeven wrote:
> Extend the Clock Pulse Generator driver for R-Car X5H with SCMI support,
> to remap DT clock IDs to abstractions (clocks) offered by the SCMI
> firmware when running on a system with SCMI, and SCMI support is
> enabled.  Take into account some peculiarities of the current SCMI
> firmware implementations, and fall-back to fixed-rate clocks as
> replacements for SCMI clocks that are not available.
> Support for bus clocks used by serial, I2C, and SPI devices is included.
> 
> This lets us avoid putting SCMI IDs in DT, and allows us to use the same
> hardware description in SoC DTS for systems with and without SCMI
> firmware.
> 
> For now, it is assumed SCMI clock IDs are stable, and match SCP FW
> SDKv4.31.0 and later.
> 
> Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

