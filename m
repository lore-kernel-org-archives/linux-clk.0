Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640339;
	b=oU9qBM73Tb7aarul01lpqBsd66d57Ea6wDi9MStXfZFPBhYMXBu++AgeEph+KuX+2Npd
	 I6CVv5AYC1oOMLkJm8qVejQ92SG8zyUohKeAUoUSJdarmA1GTk3pa3NmLDduIdbO8gMoX
	 gCCnHWjXNYhUlRrJ1+1jg6j7/8RC/grTZPS+kG08jancjwO8q0yeCasLAhQqOTn2i2Hk2
	 3hZNojMqLsvB8CDix3rinIotaM3qU+JhkMRt9o2ESQEmg5bEuKyFw9DCfBwde7bwKACee
	 1Q+5aEbWAEPO6Xe0SsKsbUIwkWbQQ2QtJ206XY85TWyUtsCJvQJaG7hp7MdnFNeaU/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640339;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Yi8HbY7avl9S/WCaQ0l/DLFnbsp+kW/rpAuDBKM+Wwk=;
	b=PO3gdmNeDdDphyTEF8ZdUI/P/TkNPJ/pgAcoBzyXnjlR1mwJRwRR+1EC21N7f6UpLXpC
	 g84Hp+0+qf3KK23ZaZQxxUxY19zwJ6AV1zaO9zwApVmVK+qf7Ide/h+zAqm0hap9iKzDi
	 3ZmZyOoXYTgl2QSdWFRpyQ9tvvB82OvNSm+jMkh4GUbmgUrGfY3wK6RT7rDkNVHANOECG
	 tiCuV4K+lMLpH50nXRxvJKzblcxfosJlMH6rt1cdFi8dLf1LpDwpN4rHo56wGSefbryoY
	 L+rohm2CDydTmgQqEQDhfYzmJU7Bs/cTXSFR3STUEiBwB3YHoUiq22NEbO8+HOv7xjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Z16QyKYT;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF79606A321
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 20:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF79606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Z16QyKYT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Yi8H
	bY7avl9S/WCaQ0l/DLFnbsp+kW/rpAuDBKM+Wwk=; b=Z16QyKYTJXiCk1GBl7qp
	8OSv/TFvPsvbxjRerrVgd8aSkTHmaLr61YpEJktg9X+4ADStTJECdOT4ahpnz1Yc
	7eU63v6K7T4fpS3/snmspxQ0itWHB7Pk7i9r1Xz58BeNI/EG9thweohVbkbxdSID
	krbLBkJlkNs7VcbnIKLMyLV+ME40bAsEWG1Zf8QtMGZYdkzMt4DBzRujIN/4bS/h
	309VFtXc8H6DFmzzhXSygyAjU1ebEHgczZW68rtq6ZYq2r13xwBTZstawhD9f+xz
	WXQKTwNPHbWl2feGv18UhJwSAdk28vH5pmDnv4/tQoXzPaAY9JtVZ5WTw8o0biHF
	+A==
Received: (qmail 1133866 invoked from network); 25 Nov 2026 21:58:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Nov 2026 21:58:56 +0100
X-UD-Smtp-Session: l3s3148p1@MnZjGCBhIOoujnvc
Date: Wed, 25 Nov 2026 21:58:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <paul@pwsan.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 6/6] [RFC] pmdomain: renesas: r8a78000: Convert to
 dev_clk_get_from_provider()
Message-ID: <awdMEJReSkI-YEdo@ninjato>
References: <cover.1795094688.git.geert+renesas@glider.be>
 <81de8a7aadf587377916763d24181c44b5d13775.1795094688.git.geert+renesas@glider.be>
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
In-Reply-To: <81de8a7aadf587377916763d24181c44b5d13775.1795094688.git.geert+renesas@glider.be>

On Thu, Nov 19, 2026 at 02:40:39PM +0100, Geert Uytterhoeven wrote:
> The R-Car X5H clock domain callback uses of_clk_get_from_provider() to
> obtain clocks used for power management, so the latter show up as
> "deviceless" in the consumer column of the clk_summary file in debugfs.
> 
> Fix this by using dev_clk_get_from_provider() instead, letting us pass
> the consumer device, too.
> 
> Sample clk_summary change snippet on R-Car X5H Ironhide:
>     - hscif0 1 1 0 0 0 0 50000 Y deviceless      dev_clk_get_from_provider
>     + hscif0 1 1 0 0 0 0 50000 Y c0710000.serial dev_clk_get_from_provider
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Works fine.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

