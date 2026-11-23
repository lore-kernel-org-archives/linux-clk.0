Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795424705;
	b=lTnWefa1QnHZJhNYifcQyQq3Ql8drrIzb4ge0GaR1dOuWJNEozxvUNGy0YIcMAxx5sd0
	 9xVCEHdereVbf/3iErxQLKJs18wxfA0kv1c3+7XoSlRZ2jtly3R2iEk9pJEsnW+y+WKey
	 sajcwAg0sZy+FX1cc4QGoQI2BxSqul7Px1AzWzTCAmql83wbEMKIzhsdM2v4E2aBYv9kQ
	 ffG9YUS6KbJI1KKnm8XFZzkrFXvI2jPDU4SKVbWC4T0RQEcYlpwW3MQlzYBHs4ihUD5bd
	 s280/Vyz5AH/boBmmnW/yIJ6j9/U7N3rSGVl/lr/uJ976ISO/Cc3SEExvWjHKVqnONQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424705;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=Wr+kWjHpTo7WaujM5d0oISZ/ZZw0eCmzGrhlM9Yi0DU=;
	b=ctGvTiA9FLBfaqRMoUK1qM/r4hQBjn5aEnJhk7fYH6ca7WDek8tDN+Rq/EwCTnIA4iwR
	 sLbpI9a7HafPHtLG+QdSxo8cqbq3G4vnOBRzXe7QV0tqS1sxVpgNBbIm+jAR5L5AYTPjJ
	 U75jON+9Y6DijEyJZ+4P5oxLGjqILloH6KKrpgLwemJfXwH7sVOdcoPaXUznPzB9ix1Ds
	 u2CupyR6DZn7QEgZCrrkl2XmQLirOzEc7RG2Ubrsj1Z7jnSkMKF2OXE+LLG/AU88BjDZk
	 nKrNAg1FEoxyUI0Xj00WOhAryCGgNW52DZBZzg6h00pPdmqD8uTqk2yt4unigioTajQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=W56Kaq5f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C901606A31A;
	Mon, 23 Nov 2026 09:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C901606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=W56Kaq5f
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0E150200AB9;
	Mon, 23 Nov 2026 10:05:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795424702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wr+kWjHpTo7WaujM5d0oISZ/ZZw0eCmzGrhlM9Yi0DU=;
	b=W56Kaq5fn6fASvOPqIXh+677od8Brm4t8jOtXlCuLuggcHN/ogLBmJwKApIBmhC28MAZR3
	eIor5yFLnf6ewenyllkLuUcXizcRBq+kz8vQ4jall4FHUUrettQ9xGHLd9rbDlNYrriGq8
	mLONxpXD60FQkuNNSZC9LUZt7f3GuW8QWHLMv6LiAmZNeozGk8VvKRYQdsMPDW3sVPDDye
	+pISlk2C89ewjgNaVemqsc0qJodGAdPo7y8jPan93JOu7EWeL5LnCVSJ6s8t6cIvKrBc43
	RCO0Spndfd88BRv0laJa03QNcEqFeenHS99xy6+Vg3lWZJw1Wr/G50IXOvzL0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795424702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wr+kWjHpTo7WaujM5d0oISZ/ZZw0eCmzGrhlM9Yi0DU=;
	b=SdGy2ubpY2vVJ4pgQS88011nLIzkNbBlXINeFZe5KFUgk6B84MarTvqhSlmMIXmG/2GqmV
	nUkK3PeqWzqSiJP9+xwHM3IdTECnc6sXWEskW/poR361/GBbF52FvirgI1abJkim9mj/GL
	WCwHNSM4IsPfo1EtNP3pZ53rjj9FLWAcaXoMKSeEs66D0tOrcy4A+epwoGVSi3X/inisBv
	DtQkfs73Z0aTNfeMQh2z9QhkMq6qGFCveNxkgrKYplvpVbtIuh5KA/DuznOUy5vzA/ltO9
	/hevQ8H/DWudwJA6aovOCkxppeTNkGEXXKmhem3xF2kVCQGEHlIk9RAVXdkTsQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795424702; a=rsa-sha256;
	cv=none;
	b=HItAs5iU2zEGkHqGzEjxRGPsjfprtiJOAq5H5wHmtBoXuC14LWXEe5Qx3mxL1/PNn0C+EF
	FaiaqcMswXFiCid0OVgqzsaHewRtWKqUwsLJfucFMsvcz5YSdIV+Bi72gjrOdNJZGcFAeS
	B2gOhxPPtZAYsMjXXMvEeHr6PvWCI9BMrZDzI3W236RMrcRZOGIK9v7g027I7OVYLRB6rF
	I4BxxD7ffGTpcUPliW+qxgDXK1vFmTOhBjx4VPk5kGyaZZIvHDLf/DO7WkRkkK7iHb5A94
	f72LkBApOwR1A/h6V1+qrX6VIF/8k3nAo3+QVPnFmjBrBfxAwK2FHB16WGjrmw==
Message-ID: <447a60519c38eed420f7778ff0cc6de359a44cd6.camel@pengutronix.de>
Subject: Re: [PATCH v2 5/6] reset: starfive: jh71x0: Support discontiguous
 reset IDs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, Brian Masney	
 <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org, Hal Feng
 <hal.feng@starfivetech.com>
Date: Mon, 23 Nov 2026 10:05:01 +0100
In-Reply-To: <179536251467.2728475.8360126735543701661.b4-reply@b4>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
	 <20261118100523.11395-6-changhuang.liang@starfivetech.com>
	 <0ee6bfcc5bb62fcb0c9128168e9367254393eca3.camel@pengutronix.de>
	 <179536251467.2728475.8360126735543701661.b4-reply@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Jerome,

On So, 2026-11-22 at 16:48 +0100, Jerome Brunet wrote:
> Hey Philipp,
>=20
> With the comment above addressed, Is it Ok if we take the whole series th=
rough the clk tree ?

Yes, please.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
