Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C3E175A67
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 17:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782236547; cv=none; b=oBWSA6wl150g/l5SPZQ5Ud775Wk8NQGGdBEILIhxSNp9BuyVvg74rFWap3/MXXqtKOuIvuayvOKyGb6q9ka1GS18JaZI3V0glaXe7sZ2vcFc9OohHpa1fknAeri+tt1kMnvxHHb3R2PxOOV2xwOC59p9aYENqU51dlx+AYNXRpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782236547; c=relaxed/simple;
	bh=W9uBPlyCQ3blz+hUhtuOZkmZRvfPPuyJHIh4Q5xPYNg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Ma3ofIkmn2P0QfnKYjJBMXwJtEYi/hNhJd0H1/3ISVwXwWiZlp8JgAAh0H2N4aaG0JeQWdIl3fj+syK2ChZz4Sd1cxnuUJ+ZsE67Q34HzW0K5IRioPn1GB0OJ6DbYH9Aarezrn2BM1QxQaYplX1FTsT0y5RQBxcH03yBuRzatMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=Q0PuAcog; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="Q0PuAcog"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1782236541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anXIIGzRFZpi+NzeuxQSLJlrJLRMzvd+LQ042QGuIHg=;
	b=Q0PuAcogSHo6YqMF4M1DObl2CwZSvYOyKWh+wwqNkirzKwnMAErvazQZfpaMcSimyE/T96
	z2P+bFMPWUq2gwjGpNIOlhuTiQjY1YWkU9UMwx2Zuei/ej8hLDnJ2LN3q9V1clcej9nQ+L
	LPI1TkXrJmqztjqKwvSpyE4IxKcB2B+1SBBLm7jr7hBR4vSi/s39On7sBuyr097z8ctoJQ
	xDstumeVTZHvoD6X/qAcNF33W7BBHzE4wWHuwHvObc/pi7YoOIHKvO8VxiLGwv9Mhnoc06
	HX4qLDz44CuDFsesX9JCU7B0X5595CwII/0iV2DAUA7cgt4cWSE2o9k0pejSrg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 19:42:05 +0200
Message-Id: <DJGM4D19H31O.4I5N79CG5Z8C@cknow-tech.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Daniele Briguglio" <hello@superkali.me>, "Diederik de Haas"
 <diederik@cknow-tech.com>, "Heiko Stuebner" <heiko@sntech.de>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Ricardo Pardini" <ricardo@pardini.net>
Subject: Re: [PATCH v4 5/5] clk: rockchip: rk3588: add GATE_GRF clocks for
 I2S MCLK output to IO
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
 <20260419-rk3588-mclk-gate-grf-v4-5-513a42dd1dcc@superkali.me>
 <DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com> <2100447.PIDvDuAF1L@diego>
 <20260623123316.4111002-1-hello@superkali.me>
 <DJGG8DEAKSPK.1GJ8FARAHXPXM@cknow-tech.com>
 <20260623132351.4144457-1-hello@superkali.me>
 <DJGH34DVKL0W.3T6UB4G4WYYUJ@cknow-tech.com>
 <20260623140958.4181297-1-hello@superkali.me>
In-Reply-To: <20260623140958.4181297-1-hello@superkali.me>
X-Migadu-Flow: FLOW_OUT

Hi,

On Tue Jun 23, 2026 at 4:10 PM CEST, Daniele Briguglio wrote:
>> So IIUC that means I'd be testing both variants.
>
> Right, that covers both: the mux path and the consumer path. Looking
> forward to the results.

Analog audio works on both. Plus with _TO_IO and LTS without in their
respective DTS's. So I guess CLK_IGNORE_UNUSED works.=20
Whether it's a good/right fix, I'll leave up to others.

Cheers,
  Diederik
