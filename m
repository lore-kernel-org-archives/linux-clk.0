Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817364;
	b=hfDrI6GbXinayZ9NHk2hWDOXuXBd9BarCdfWk45lhovJff4xbD7mcoPvSkGaLuuulFVh
	 Z8ZgOkMykKgSIPFBUEC1zDtZCFL/Mf75rjWbLH50yFngzE92u6Nevjzp3PbDhxFlSzwFh
	 PG2aif2m0CZArC4VFdZzkkjfo+NagwLB7dCXOkb5pGDPZM2ZFnG9FDyL9w33c8QSVnicG
	 1ZN4ADDUILqgIS4tFTUNFEijrgpFI4lSwJUcQ78lsXK2W/NdJ+s868BJUsqOz2+m+Rriu
	 odcq0PfOhHfKjS0RJlREqv/Ju4GDthbxxPwRO3TQ6RK4iyd4GLvtCLK6q6daI0NiFmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817364;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6drHvhTiX4LbvHsMxKCSa0vXCxeP0oTnKR9T3+ALxLA=;
	b=JOshPFYxtHogHbOEVZl+j7007bN91blyFLXh/YWODL8CGQPJwg5dD9N5OaIcefO4hICi
	 qrVOogsh3vbaopuw6n+Fdf7BzzfsB+sRQ9jvF7BmSEU/eaJUvM721mAwjTqKwGXABA/AB
	 B9RrOY/W2b3cNCwwQOxbpqwqTkIE1hudXz1cQ/nwlcwXdLPxgHPrrufYOmzmicKXSYOxr
	 8MEHQGI1QyX4rnRI63C+2FefA8YW0lxxFIoy14vQx3/IcGx/CqK/WOIMIB8lOHltq3and
	 SQKJVPb6AgYVWCPko7fxA078ZMvT+3nAYsc6DuvoqbOUY8AqGWGHCbrsZ+GRNeaWCdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=doTUqjFR;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFE7606A31C
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 08:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EFE7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=doTUqjFR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6drH
	vhTiX4LbvHsMxKCSa0vXCxeP0oTnKR9T3+ALxLA=; b=doTUqjFRZjPPJWMbQ+Tr
	sbyo3Gv86lly0r3r3BPeY2eFFgRhoAHd/2VpZTi5nPl9Zg6NWB2SrHUkRBf3nuOs
	3PT+xTyC+AVmfzPfTObi2+Pm6yBU5BDr6H6mDEWIYSaypZBaoeMoib6zUGEdKbz1
	AZBgZAjobfdzuTX9KN338lkY420pVPebdq0KcloW16o0SOt7o9AHem3r7zg6a1W1
	5lXlCP/zV/2rf+vcM1211mWClkN2OMWAHnlBbFLxUsHJWJ/3Q1ttUJD4WUzc7k7m
	/WrQHjZOzlZKMG7tjlX6cM+KPfVUBk8EdBP5ES1DAobSOunyFXrLLkh6oxtRUaiV
	Wg==
Received: (qmail 1195074 invoked from network); 16 Nov 2026 09:22:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:22:40 +0100
X-UD-Smtp-Session: l3s3148p1@MwQ2e2BgAIkujnv5
Date: Mon, 16 Nov 2026 09:22:40 +0100
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
Subject: Re: [PATCH v4 6/8] pmdomain: Make genpd_get_from_provider() public
Message-ID: <avq9UNth7O5DhxzH@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <e3b9d76d5b4a254d561b6e734423063e94225a28.1792163045.git.geert+renesas@glider.be>
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
In-Reply-To: <e3b9d76d5b4a254d561b6e734423063e94225a28.1792163045.git.geert+renesas@glider.be>

On Fri, Oct 16, 2026 at 05:55:45PM +0200, Geert Uytterhoeven wrote:
> Unlike the corresponding function in the clock subsystem[1],
> genpd_get_from_provider() is private, and thus cannot be used by PM
> Domain drivers.
> 
> Make it public, so the R-Car X5H Module Controller driver can call it.
> Add an "of_"-prefix for consistency with public genpd function naming.
> 
> [1] of_clk_get_from_provider().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

