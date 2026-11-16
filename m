Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817380;
	b=FicWMNtwZQkhEbcyV4PY45ytXhrU/VRQbvdskkptypLLXZsnH2QIVIC1Rem+R1CniDQd
	 pkwh3vUOWOsiZF8u92E5KbNU37SvE5p+f8oE/ADE20eGKn0UTB/NFu6tQXTDQ7VuYvhHM
	 UZ1a+xmx02QHj3v5i6RLly+++ohJCwCEbsYMze04u5gWO4Jrwblq88wgqHLO6LjiMi7Ro
	 9Me9byHa+I3gZ+dwvmly6C8gzjLoXoO2hRUU1wRJyz8TbGr9JjG3GEcjaGAAR0s2u3H45
	 EeVB1/qJ/PStbR/UCgJcTcgGxxRSyASD1+Q0aFAiK9zyVcNjN+hYEQXWJxgkb+VibvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817380;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=euH0BJNlYcSHq5yr15pcFlaT205pABUUGFubW7NpuMk=;
	b=4Af/kaZH4Yf0jj7z1Sf9nJp+J09eFGhgamTWEmLvjumSK1xE15+jIt7Qw5ZEwJO2E/Yb
	 Ne3nf7Qyi8iu+vO4hX1EIbZGx66pV+7PGWQLYJpxXJr3QtJryncuIdeuxJYErLeTsyG4F
	 Er7I0J/k3iBzU4mTX67YdXLTC9n93ioLN+De37JU9tT6XyP+PshqxRDKYcQojVRNPSTsj
	 UCgArkiJTpuIeUJb46P2mF3EAAA3KxPXFfB5WtXj44P+A5avF3w2CK4PqCRPSHMxNo1/i
	 8CnfRsB/NdEkIIt2Qb+7v2Vtgncg+3bNW/zoKv31BnLjFk775SYw4vvqoC493cy39hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Q95X8rex;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395AC606A334
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 08:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 395AC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Q95X8rex
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=euH0
	BJNlYcSHq5yr15pcFlaT205pABUUGFubW7NpuMk=; b=Q95X8rexII/3mzewfYJW
	zxeUCE/7KqQCyMLyUMmoeiOuyWjlTDU3Yc5WuzAQun5UV9NomJD+Ib327u1CS29D
	shtsvpCX0eqF0eEivl5cIuWdGSKGRcdUNH2AUiHRUHIvA3n/tvaSrHAzyc4CYfoa
	uipewViPV66CHwwtpqiRO3D6fefOqCDADfJNOpl2zduSD8JVzHk02Nu0VIHQZ9YS
	TjLAmPZw9mgkrkzy2e14AgsJ6ndq0fnQYF8CsGybikyICE2iFjgDs7qW6VY8MGj1
	laiTd9GEpgasBafTlf2S8/PayX47qKq/sVSbGcq+BQ1DSzqGvQ/lupXTlDUfliK6
	NQ==
Received: (qmail 1195362 invoked from network); 16 Nov 2026 09:22:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:22:56 +0100
X-UD-Smtp-Session: l3s3148p1@uvIkfGBgKooujnv5
Date: Mon, 16 Nov 2026 09:22:56 +0100
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
Subject: Re: [PATCH v4 8/8] arm64: dts: renesas: ironhide: Enable SCMI devpd,
 sys, clock, and reset
Message-ID: <avq9YAeAsAgc-btt@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <a66c5ceda67314eb9e86224eb555adf5ce00ecbb.1792163045.git.geert+renesas@glider.be>
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
In-Reply-To: <a66c5ceda67314eb9e86224eb555adf5ce00ecbb.1792163045.git.geert+renesas@glider.be>

On Fri, Oct 16, 2026 at 05:55:47PM +0200, Geert Uytterhoeven wrote:
> SCP FW SDKv4.28.0 and later for Renesas R-Car X5H Ironhide not only
> implement the SCMI base protocol, but also the SCMI power domain, system
> power, clock, and reset domain management protocols.
> 
> Enable support for the latter by adding the corresponding SCMI protocol
> subnodes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

