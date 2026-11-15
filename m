Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752859;
	b=QW0reEgb4HBcnR/LYfPHfo9KsoEfqXNFWLqEsC2WAf7nMhoGpb38HV6gRLaejPBjW0KO
	 mgk/Jguzk4VZ+WY/cIqM9HNjjZxJKc/vBA2t2WU2dhrtqMPWDeXGKE+GhFFVzDUYnGpEG
	 4H2kIZfnTsplzoda44VDPlplR9abkdsHJG4OavTCgI/+Fy+odczcdVoDIYLofYI7uJgVs
	 KyarRxLfReKIafmoX1trIpw1rb00X3RQ0HtVSP8JJDxAxMBl2A53dWaEjsCPL/fAd9urS
	 CLIWU02nfNX9GU1Tc8iyzodtJBbrlyJDVf0/KB13JpvwryP8tPxcDIPbTnLbtZPsDLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752859;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=kCawLRA6+IU0oelNwl5dUn/guLy83xt/1yBxt7PC4hE=;
	b=0AFbaEeAPbIzGA0Zt02fGVxtLTKgzkBCQ7+5uk+v4PlrtNBgWFo7PacbkN67bMbwtYW3
	 BWXtNbgZt+tVC9Phq8P4IPNOWdzucyOCiiUt0yqVSZxeeWxrvJs9z4yL2FOKDgrTjOi2W
	 Km4WNEaPEu3382WNYXvP1xPr4E+aEgQSB0H3dUlBRGfFc5HpvpBrrAz89qQhYGySi8gNn
	 DEJSEbLai3Z5ewcM90c5rAruu4Iud/yMvjmujyjKtbZeF+eR03L/4wY9u+uZ5TkbJLTez
	 nHFzoiVIwY+f17iKDPju/Ahst4Zkby0/I3LoxncIEK+2+Mau07BLWdOVlA/BB1MwJDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E42ORuad;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15E7606A31D;
	Sun, 15 Nov 2026 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E42ORuad
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A46C1F000C4;
	Sun, 15 Nov 2026 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752858;
	bh=kCawLRA6+IU0oelNwl5dUn/guLy83xt/1yBxt7PC4hE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=E42ORuadxu0R04p2j23jD3e9gJwasbPPgO5KnmTpkb/rKDf6SFu1aev+tFk7w7NO7
	 PeEplVzbO8b7L3NI/u0g8pAGsQSTHsUCBrV3XEPZYHH/V3PJXq7xwpGsCFx8aakNI3
	 FqZubuGwbMCr/+GLP6PHYJi1wdY70yadR1OFlzXnqrJMC6ai6s0qAOyET/7B9CIdof
	 J35d7LZdEnePKIIFi2rpP6MjU46HRBlAJwzBdCxNtxG9te8S8GBqAkBrWR4Pa/TwaT
	 3vrj281nVIMUW9k89RHjzWCGXAo7FM3+cyvX++kiuSAquqZkSFS5yiQXwdAGLg/leK
	 BHQ1GDrpgkxyg==
Message-ID: <1d45ab58-9e5a-4b9f-adc4-691a99f0e05e@kernel.org>
Date: Sun, 15 Nov 2026 16:27:35 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/16] ARM: dts: microchip: sam9x60_curiosity: Enable
 OTP Controller
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-16-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-16-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 13:06, Alexander Dahl wrote:
> Allows to access the OTP memory and Product UID now.
> 
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>
