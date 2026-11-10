Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270267;
	b=TLd2KeZkBYxBLpVFJdB2sUgvm6f0zdBURCMEUwhscuIYLMyms/F1SwQV/frlo07siT4O
	 vAWawLYRB+oRyE2oDVTHNBTmTgJ8GMcIAnHZkLwcyJZqFcZGULCIbpHUooIV9lRLlXpOI
	 1+8P3GZJ9jJkxhJkhRtTuBR+KnX/O8UYLX4chUPGwJ0hLIdlqU3j9I+oziuRR2Dk+LI7g
	 LcjNEVgaj5bbO/4W8hODJeGB/A2O17Su7yRvfci5CVXXeQZAgNYt22AEsvGJPDQhVfz4d
	 w2wJWGtQYk9A+s8j7S/lv2dT8GYVko8dR+9R4Pi9tHHZogN+6vx5Yn4gCW9YMqZgrxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270267;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=cot/NIJQFYT/JaRuXN1YSdNLoPCmSz56TVO1VgSYzR0=;
	b=DZo0rryzMJ+WHf/xtbrRN0msMiWQXKx2hGXyBPA/wKmpj4p90sf/TlUhJjvs/rhP7Z2L
	 UNx/cgK96GXMoVnZcXcvmscejzZU3qMgh6m7CkxMyfJ1lG4DJXUhIzxuAWH+jTXPoz2TZ
	 J+M/pKCOB4PepeEGn57DOd776+MVSn8Kv76/9bRl3pWaeQFsTXJlHobFmwCt+6hNZAj2I
	 q9PrEO8oCDeT4/UqMlOHnhXFzHxmLfIqVvU5BWhi/FroGJ8m1XfQXEVWSzu8GFKrnjlEH
	 /Iy/NN6CwIos30zZT0xwBAktfJZvw2G28b9ccPRFXXE2tgBGahZmvbGJIG3mWnetUew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsbuHSJ4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F711606A31C;
	Tue, 10 Nov 2026 00:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsbuHSJ4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19ED01F0089F;
	Tue, 10 Nov 2026 00:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794270267;
	bh=cot/NIJQFYT/JaRuXN1YSdNLoPCmSz56TVO1VgSYzR0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=AsbuHSJ4beFlEWYzINviFgnLbC4ZNtBFcbBx/RS+XSE6jyp3ilZfUvAi20tmVWHKV
	 zMIk9LA4fIvo/b9zeZrzVzL6Z7IbMRSDjMCCyzgWKb6BhUuNlkcqDpoQFqGfLwyW1A
	 9qubFztj886dimr38SDge0cLxzedsvMHsnSkmUEoeQr8LnFVkTw8FAYOGpejRiXEre
	 pp1NSxnbqaBZ+o5Ov13wo6o6+2HS8oDj/GjtFGESATlxeUo+h46vn9ks2159ZdRkPP
	 NpqhB8XdrMm2osLOXI7cewmIl47lkqTrGNrqdoN+ldQfGjv9O8R1KPBzm7jt28FwzQ
	 57usr0mWMQwnQ==
Message-ID: <90ba5a4e-12e6-49ee-856b-b0d9d8eec4db@kernel.org>
Date: Mon, 9 Nov 2026 18:24:26 -0600
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
Subject: Re: [PATCH v3 1/3] clk: socfpga: agilex: register the SP timer clocks
 early
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1791871090.git.adrian.ho.yin.ng@altera.com>
 <1fc28c08edede0f96b5eca860d5c344e185f18da.1791871090.git.adrian.ho.yin.ng@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <1fc28c08edede0f96b5eca860d5c344e185f18da.1791871090.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/13/26 02:07, Adrian Ng Ho Yin wrote:
> The DW APB timers are probed through TIMER_OF_DECLARE() from time_init()
> and cannot defer, but the clock manager is a platform driver registered
> at core_initcall(). The timer's clk_get() therefore fails and the timer
> is never brought up.
> 
> Register only l4_sp_clk and its parents (boot_clk, main_pll, periph_pll,
> main_pll_c1, peri_pll_c1 and noc_free_clk) from of_clk_init() using
> CLK_OF_DECLARE_DRIVER(), with every other clock left as -EPROBE_DEFER.
> The remaining clocks are still registered when the platform driver
> probes, which reuses the early provider.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>   drivers/clk/socfpga/clk-agilex.c | 242 ++++++++++++++++++++++++-------
>   1 file changed, 187 insertions(+), 55 deletions(-)
> 
I think this needs a Fixes tag:

Fixes: 80c6b7a0894f ("clk: socfpga: agilex: add clock driver for the 
Agilex platform")

and the Cc: stable

Other than that, it looks good to me.

Dinh
