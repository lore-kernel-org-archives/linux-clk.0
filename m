Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270397;
	b=NgQ6+UcPdxJ7IqRODuIvhHtklugXR0sSSY+4OoKUbWZDU3wfb2FO8UH1n+OY8A4nRlij
	 JNXlhE/FhDBb6m+92aVFryyWfCpP3pbrkYG4f5mSI0VxFwn+T9SI9Dq2+wPjQqcTC2LRj
	 doNrF1BIaS0InjieDhfvhsZqxDECXz9ZTgEOs1t4AYV5liWQSsdadPBFedi1hNwq4wbT1
	 g/PGklpz9D9W0mQj8mXpRPYp7bkDwdGSKOaGRWiTKg6mQETv/7pbdzCmeketRom/9C+wf
	 6f5Vn0aMfOWbi2wdFQTYrpvfpdyS7Dz8STGHGfI4gBjm9jBgDaLmJCXVzAJh35AL66Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270397;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9nRKvJ8YfqSFFEgb3DC26B8ynEEvZomzTsxeItgHMQ4=;
	b=1ZfHPnLrWdsG2PEVqb+7AdHGfOGtnMJbc1DHgmFk2nUT+9HkgCniqBIxQY57qcZCFm36
	 u91DJJIUyfPCFuvYR4cFeg4XMXsQs8FOGdFteXbtgYWTrobDO6EGHxfyFSNn4kDMqr2qX
	 T4eYGK/GK3qQ2D2khjLh3nMH0mGBsdRkB4UJMYgpn5LJdRAl6STzuDryliw4x8in0+NOK
	 hzxgY0L0T7azM5wOqGDIV6kggjc2HwBSbXnP/aFOkxbUXKKdDeydPdSpqKr17Hjm99Kwv
	 IkOdGtGwrQrlvGWtmqAt4fv+We6lVffjAYRdG9y3Rw581uaic9mL5HEEXmrXMw1FpAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K950d0IY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0908606A31C;
	Tue, 10 Nov 2026 00:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K950d0IY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACC21F008A1;
	Tue, 10 Nov 2026 00:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794270396;
	bh=9nRKvJ8YfqSFFEgb3DC26B8ynEEvZomzTsxeItgHMQ4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=K950d0IYzKrrjibEjWw8Ag1MUAxXTluakkS+qtqJ6vDofWei1glCUAeP+6WSZr+i2
	 cYESSeTNUlUJLZcwBIBC+gUVkTzoOJ9klb/etilSa/pfo7g5ELH0m+lZ+LxQwEMiv1
	 hUqFzHgqLfUfHglbp7eCK6ebkqulhTGBc06VVX7v3EcCSr8aHwS1ez/18HHPY+6+eZ
	 JcuHaU47oNGZbyCqRYChfJg2MoeCHpeVYtm4LxbNrnRW78z681BsStFNPz/teslo3l
	 MkdjyKQssjsvsDfDODJIad5hCKoQWuPDqnVgOCt1MuVygMoecW0won2DwgfXhNkOCa
	 PH+9FVJRLMniQ==
Message-ID: <64cfd562-b5c5-44c2-83eb-b943d5aa7492@kernel.org>
Date: Mon, 9 Nov 2026 18:26:35 -0600
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
Subject: Re: [PATCH v3 3/3] clk: socfpga: stratix10: register the SP timer
 clocks early
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1791871090.git.adrian.ho.yin.ng@altera.com>
 <7de51d5f9c716c03fabab77d1a2b4dba3af745fd.1791871090.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <7de51d5f9c716c03fabab77d1a2b4dba3af745fd.1791871090.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/13/26 02:07, Adrian Ng Ho Yin wrote:
> The DW APB timers are probed through TIMER_OF_DECLARE() from time_init()
> and cannot defer, but the clock manager is a platform driver registered
> at core_initcall(). The timer's clk_get() therefore fails and the timer
> is never brought up.
> 
> Register only l4_sp_clk and its parents (boot_clk, main_pll, periph_pll,
> main_noc_base_clk, peri_noc_base_clk and noc_free_clk) from
> of_clk_init() using CLK_OF_DECLARE_DRIVER(), with every other clock left
> as -EPROBE_DEFER. The remaining clocks are still registered when the
> platform driver probes, which reuses the early provider.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
I think this needs a Fixes tag:

Fixes: 07afb8db7340 ("clk: socfpga: stratix10: add clock driver for 
Stratix10 platform")

and the Cc: stable

Other than that, it looks good to me.

Dinh
