Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752948;
	b=1JNh5UGSa1nUSrmLRtly4QWBs2Ytr1tN4Srvzpaw/1o0s4c0EwIxAXPekjWivdu0hJBh
	 sjUND46bhTe8oybHUwNyEZsptoeDLhF1rcgneKyF1xb3PA5Oirj2Res8p85O5aYh9Zsrd
	 ohS4KVlzOoMc1GM7uuJZUrxvsgbWw8fpeHpP6E0m/JLDgi4SwVXHOoJm7nTLhijlJgMGb
	 tCWploLiW1WVBIwEnwgs+Alv9Lc+eZrHcwTD2LMPlHj/0+CHrDSMAFkPL1krJ4i82jfIJ
	 i50oWqNLM+IFsA6i4ZMCcYb8L5ozMbRTETa7ME1HYOhIFVSm/Wuw+/ScwD8tJTfOmWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752948;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bgmHtN/2PdMynT9bP6VE3sLHcXorlitWbwyp8VUnuZ8=;
	b=zu0ZTugb3XboMQCpB+O3k2tBfuZjrNu/df6RMaSq2iffcft0ryHczdywSHmyqs6YDds/
	 RLiuWiXWCOl8orUKcGx7o9J4IinDUQoUtoTFlPpS8mqPsIHB2nYQGSoioT3DPdF6ngjg2
	 BrbHIDNofIc9hEODr1E64cMsYwplcp+bFNIAdJmeAk3zGSrJMZUQG+EMvL+tWgWlDxu3B
	 R7A9gnkUq6INWbBScgmo4woCZrESjBSK/2sA4curaj3Hzp83eoHYT0EYv33Yj1WXtvXuK
	 Fx6nCbEwrQij7/DZ3MDSAn7OTgmsadojHZ5nQnqpw5xmI0TLKeWhQOLBrfAandFizlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vqpq04bn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472F1606A31D;
	Sun, 15 Nov 2026 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vqpq04bn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E70A1F000C5;
	Sun, 15 Nov 2026 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752947;
	bh=bgmHtN/2PdMynT9bP6VE3sLHcXorlitWbwyp8VUnuZ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Vqpq04bnF9Yte5CZmjLtY8Ag47WsXok909DICTc3Q+9ZEaWfe/milJi/fsBg1MjbX
	 l4o8ENyNkRxMorAinGma/UWFwtk0Hl/PfRJ8H9PfJwWjJ3dNUJ+X4tOxmLqg6MzHe0
	 9mm++t1sGQYzkxwvlEAEB/ueWNAHLWPzoBt8et+xBeXgWY46iwEU77bXmB6nPjqaLR
	 Z1ROVHkkK4fJ4yUsilAYlLZRvYeRBs0SDGTjkvzL6BUitqBR+s/UPgk6bTFArUFSLi
	 sf/Opau+cPE16xoqXSQ5tHiuyqdWnx6PCK01Ra63KdjdKOcGCBmFmYLW861Yy9hcWx
	 zGDuc8yGq0gUw==
Message-ID: <c05aefdc-7b60-472b-ae08-2c3af3cd533f@kernel.org>
Date: Sun, 15 Nov 2026 16:29:03 +0200
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
Subject: Re: [PATCH v4 04/16] clk: at91: Use new per SoC PMC clock index
 definitions
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Mihai Sain <mihai.sain@microchip.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Durai Manickam KR <durai.manickamkr@microchip.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-5-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-5-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 13:06, Alexander Dahl wrote:
> Adding missing clocks for only some (more recent) SoCs got more and more
> complex and confusing with the old common definitions, while there was
> no actual need to have them common.
> 
> A splitup of the definitions in the bindings was prosoded and done per
> SoC, before adding new array members for missing clocks.
> 
> Switch from the old common indexes to the new per SoC indexes.
> No functional change.  Old defines can be removed later.
> 
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>
