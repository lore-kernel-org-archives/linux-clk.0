Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464D826ED41;
	Wed, 15 Apr 2026 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240540; cv=none; b=pRkIFKZPOrOLdsw16Z/SHNZ95cVV+v99ftIwAsnVKyCReFH0/PyCfgX6bbCt8fbIuHfh8QL5+w2MALYvd6JlF2i6jyLDGJcLon6bRIdm4ojweWrkypeYldpbJ38v74M0c2s4citeoQkL8xBnqyvEqEKGMou3gAmSotpPvKrcPk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240540; c=relaxed/simple;
	bh=qxOZedtYcvkdoQo17b3imz7pKUeW7wVqZFt3XuP05CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hxe7eHb9c03bRleo0v45eVCa9lIwK6TNPXWYlrp10+jY34XXkiBg1hYU4d9T53pnCNukCDKMa8XGSydGYQlFDZtYzF0S121qg2fqOEs4bIu8yK748aaDkioziJQw/sypuHiYjwWvnUIKxgiDB5MPHcRAElN8U3qQSSQJowgGQC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzga3cRh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzga3cRh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E2BC19424;
	Wed, 15 Apr 2026 08:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776240539;
	bh=qxOZedtYcvkdoQo17b3imz7pKUeW7wVqZFt3XuP05CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jzga3cRhoIX/Xy6fevqw3Rh4JU7ZxJipK2MYLlSdC+lkmxw3xJhI2AlQfgfJxHtsu
	 TgE1gupgZ7koYlzsPqyD1oLTGECB31u/hPXcr02HieRaUQldTxxYQtogHDDiHkKB5C
	 HLGg935+d9dHpPaNezB2qKJBw5kHthR341bY/78yjxJOGpPhbYygYElHABO9qfOzzu
	 cT8CCz4eFvjvMeI5K5uUev5MUEEvSU3qeuKH3GqKeA8lLIw8Ad2VMJ6xZRdMMxmi7r
	 kIewpcXLwa0RfPos8r8JXB0uDoSpx08pSrlsWtiAZN/8/mWkBK2fernq60bbYiXf38
	 EXuEsAq6imbtA==
Date: Wed, 15 Apr 2026 10:08:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Subject: Re: [PATCH 1/4] dt-bindings: clock: marvell,pxa1908: Add #reset-cells
Message-ID: <20260415-electric-gay-armadillo-4d67dc@quoll>
References: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
 <20260414-pxa1908-clk-reset-v1-1-94bae5f3a8cf@dujemihanovic.xyz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260414-pxa1908-clk-reset-v1-1-94bae5f3a8cf@dujemihanovic.xyz>

On Tue, Apr 14, 2026 at 09:51:50PM +0200, Duje Mihanovi=C4=87 wrote:
> From: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>=20
> The APBC and APBCP controllers have reset lines exposed. Give them
> a #reset-cells so that they may be used as reset controllers.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---
>  .../devicetree/bindings/clock/marvell,pxa1908.yaml | 34 +++++++++++++++-=
------
>  1 file changed, 24 insertions(+), 10 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

