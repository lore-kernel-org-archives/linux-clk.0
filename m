Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B4A3DB629;
	Mon, 27 Jul 2026 06:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785135363; cv=none; b=X2vzQyOQrJVbEZNFSLJ3nA6RpaHK0Zse+QkjmHqk0ptU3c6VQdC6+sixv0G91JKEjScGmAmvbaGsiCRtApFUhlnz6pPSs5L+aCyDtBip/G8LTuJ78+XZhTAYG0vLARHL3E9ItFA6yad0jXjF4HwMFFyEsDgilbyLCCSlhGNQ0YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785135363; c=relaxed/simple;
	bh=Gf6yuUrsHmI2vP0pfMHPBOIVggLI5oeXomjDKC/a0oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yo50Ia+/kypQAgPE8uB2xoLrntGs7nNmLEDJuGhyVgwvuL+xNUS8wHkyaJP6fhNPUkgpd2iEAzOgzdE7YEZTi7dGYYoFTYeBPKuOrpa1ReswkjEW+6xd1gi5bJG0qg8d951rgxAD7VziVap2anxjNTWNa3+eE8QgIRw241Q1ErA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284731F00A3D;
	Mon, 27 Jul 2026 06:55:59 +0000 (UTC)
Message-ID: <322c0f62-775e-41b5-ac4c-73c77dadfa37@tuxon.dev>
Date: Mon, 27 Jul 2026 09:55:58 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: Read "reg" with helper
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260612215251.1888345-1-robh@kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260612215251.1888345-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/13/26 00:52, Rob Herring (Arm) wrote:
> The "reg" property is an address-sized DT cell property. The AT91
> compat clock parser only uses a small bus id from it, but reading it
> with the u8 helper does not match the property encoding.
> 
> Use of_property_read_reg() so the code goes through the helper for
> "reg" properties, then keep the existing range check before passing
> the bus id to the clock registration code.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm)<robh@kernel.org>

Applied to clk-microchip, thanks!
