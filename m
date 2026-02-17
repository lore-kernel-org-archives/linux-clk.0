Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5578338590;
	Tue, 17 Feb 2026 12:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771330415; cv=none; b=rd9CKbVx7fxUybFOJFNDVQVgvOZHt7DbpNSLGy5vDSBflouR20CS8VVNCZRAIQBaQepY2S+J7kdSeh1NNM0ddApGKxfe8Ek5JlWj5iLs5ffraKmMmUdQDYsXThDJVSlTOVPQw6kdTobMtyNGq4I3emSKo9s2btCgL87OoTH9ess=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771330415; c=relaxed/simple;
	bh=66fkRRWSnA15EdP6wDQO6snlgWoJLWLBikp6ptrEsKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IF/gZKVHhPX4IAbhZT7jR/Zr3YxjvqLl37HzSE3uSlVAU1Uixi10cKupGTMeVNdBkuEcL1EIfIyZhTbVQqcH/7fFuj+77KlUe1AIX0onDUq4dEnfJ0lMG6ChNve+q6voRur7AU/w+WlReDCxSonCI5Cy00+usA6nWwLsSYQhm8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jq4P/jOb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jq4P/jOb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A1CC4CEF7;
	Tue, 17 Feb 2026 12:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771330415;
	bh=66fkRRWSnA15EdP6wDQO6snlgWoJLWLBikp6ptrEsKc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jq4P/jObll0BRthLOPvT5YX+WpPPzZp3Sl0U2OrFlrZOWbllTign6kR/NRSO2QFz9
	 ChMyn7kJL0wVpqF71K8jeb+gZ0WsSsWzVvhWQPIZuuk0ymwqo08b+3Q7y9ViQEzJNG
	 AcdcfNpywB1ASd2qBFs2gKKU2wIM9hvyEc1dbedj5q+CgX+W5EoTBy/q7ThSQu/VtL
	 CagjExM2QZjJy2NAR18huPwwsg7QsBreGUZyW5IT7SVm7GTg0nhEilwmlp/RKImU0Z
	 MwH8kmUKjMj75ErCfhU1EOLpd0HzHHU06uC5DEYW9rRLcB0IWuGD9SzAaDCV/DzVM3
	 fUD8EKqQGQ3Cg==
Message-ID: <b27ed4eb-bbdf-42fd-a54a-0c893de504c0@kernel.org>
Date: Tue, 17 Feb 2026 13:13:31 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ASPEED clk updates for v6.20
To: Billy Tsai <billy_tsai@aspeedtech.com>, Stephen Boyd <sboyd@kernel.org>,
 "bmasney@redhat.com" <bmasney@redhat.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <OSQPR06MB72521F40C1F2CD858B8D83FB8B9EA@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <OSQPR06MB72521F40C1F2CD858B8D83FB8B9EA@OSQPR06MB7252.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/01/2026 03:36, Billy Tsai wrote:
> Hi Stephen,
> 
> Please pull the following ASPEED clock driver updates for v6.20.
> 
> The series includes:
> - Reorganization of ASPEED clock drivers under drivers/clk/aspeed/
> - MAINTAINERS updates for ASPEED clock drivers
> - New ASPEED clock driver support
> 
> The branch is based on v6.19-rc1 as requested.
> 
> Thanks,
> 
> Billy
> 
> ----------------------------------------------------------------
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://github.com/billy-tsai/linux.git tags/aspeed-clk-for-v6.20-rc1
> 
> for you to fetch changes up to dc345e213f16d3ae5dce01bb0002e46bc4eaff4c:
> 
>   clk: aspeed: add AST2700 clock driver (2026-01-28 14:58:47 +0800)
> 
> ----------------------------------------------------------------
> ASPEED clk updates
> 
> This pull request contains the following changes:
> 
> - Reorganize ASPEED clock drivers under drivers/clk/aspeed/ and update
>   the corresponding Makefiles and Kconfig entries.
> 
> - Add MAINTAINERS entries for ASPEED clock drivers to reflect current
>   ownership and review responsibilities.
> 
> - Add support for the AST2700 clock controller, including initial clock
>   definitions required by the SoC.
> 
> Patch series:
>   https://patchwork.ozlabs.org/project/linux-aspeed/cover/20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com/
> 
> Reconstruct with:
>   b4 am 20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com
> 
> ----------------------------------------------------------------
> Ryan Chen (3):
>       clk: aspeed: Move the existing ASPEED clk drivers into aspeed subdirectory.
>       MAINTAINERS: Add entry for ASPEED clock drivers.
>       clk: aspeed: add AST2700 clock driver


All of these have incomplete DCO which triggered next warning. If you
apply patches and send them in pull request, be sure you understand DCO
(see submitting patches).

https://lore.kernel.org/all/aYHcXJPhxIVgvAp9@sirena.org.uk/

Best regards,
Krzysztof
