Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948042571DA;
	Tue,  2 Jun 2026 06:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383087; cv=none; b=HlgW/XQCXvOHdzMwZrIvD1R3CMWW418N+SZ6aoESxXCp9sj4iSo2AQE8wXvGwR/w3+sDz9HU8yjZ7LpUW9qpHFjyH2ZZX0wvOVZ/dT9T64BYJc5oj3cbgvYnLtWCobfAaCrwWEwaV/SpEI9WOlhxNRKR/AerDZ0uxptvuxNBKyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383087; c=relaxed/simple;
	bh=dlD+K7ZMV8ywi6W2vwFGICDOBzhL02lerZ46DebjTpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uvgm0QWJA223NmaBBSsD/FGr3jR9sdDWaSNZOtN6D/1+DHmuYOEtA9lgUxyXOVqbQu8ge8Uz+e2CgutkqnclFln9auY0DOh5aYjxOz9stEGiAA/QF/od9sZgVeM6EApjHLGVpen2PpCUU3v8HIyimIbBK2poiih/2oUOhjaU+Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66D41F00893;
	Tue,  2 Jun 2026 06:51:23 +0000 (UTC)
Message-ID: <17775f6d-3f72-4a05-865a-897d76f6feb3@tuxon.dev>
Date: Tue, 2 Jun 2026 09:51:20 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] clk: at91: keep securam node alive while mapping it
To: Yuho Choi <dbgh9129@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Brian Masney <bmasney@redhat.com>, Kees Cook <kees@kernel.org>,
 "Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
 Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260529042051.1626978-1-dbgh9129@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260529042051.1626978-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/29/26 07:20, Yuho Choi wrote:
> pmc_register_ops() gets an owned reference to the
> "atmel,sama5d2-securam" node with of_find_compatible_node().  The
> success path dropped that reference before passing the node to
> of_iomap(), leaving of_iomap() to consume a node pointer after the caller
> had released its reference.
> 
> Move of_node_put() after of_iomap() so the node remains referenced for
> the mapping operation.  The unavailable-node error path already releases
> the reference.
> 
> Fixes: 4d21be864092 ("clk: at91: pmc: execute suspend/resume only for backup mode")
> Signed-off-by: Yuho Choi<dbgh9129@gmail.com>

Missed to mention, applied to clk-microchip-fixes, thanks!
