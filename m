Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03272DEA8F
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220132; cv=none; b=psgEoFZIbpbh1KTC62xlTdGSwc8nZJnnUqUAumh24WxWYmg46EWndHNmK5dOvcxK+XisK2oY4T9HihIJ9LMuAkzU6lyS8SARHbIbtzUgQrP71dQSLz7nN85AxikftONsN2efQIRx8Yek/GuitlkO1Xp2AWVUp4UuKsYfDyE2xis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220132; c=relaxed/simple;
	bh=bm87lO1WY51W1JQZ6AFcWt4PscTutQWjvvP0wDQnS1Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ii+iO7q0Dc/GTCYnB6MNlw14wKjRe4/I1guaVrKVFmmaUwBHurshY2pMOpQItbgyb8J/fhZDFazNjEIaQTaz7M+PF0zBSfEU3UNwHyBonnTU7Ifzz3rYQK+lXP4G2EwtKf9PzQLWUMUcgK1ORL98I6ctLL0IzS+WcLFRvGmGYoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=Jfhz3xEZ; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="Jfhz3xEZ"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1782220126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bm87lO1WY51W1JQZ6AFcWt4PscTutQWjvvP0wDQnS1Q=;
	b=Jfhz3xEZlv0Q/ZeopIdCK4IgxmFSrBVcWyz29qGDLMc8XkPXOHioHSga9BlFaVxY9HuI9a
	aqAMSygPKToaLFrwHsPS/k7X6p7vGrWrslP4snAR90xFkskfU+g9BWurucH1/2VEyc+OkJ
	ZnvbLs1IDCpcOPj9pnMCkJCOEaBKhm5g9q1bXncD6Jk7aRotmJqW9+fmunVLMtr1ZnUpr3
	lomYuMOsjFeeIae+QHegz/esBPyhuYs41Sfx86eHE2nimZXQ0g/LqlNhBKZ4YsM2+IkI+W
	+5E/KpafopJ63ZXZAdaA93513l1NksHGgrDh9kORk5tTqmrOjDJhiZz1GAFevA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 15:08:36 +0200
Message-Id: <DJGGAYJ6I48X.1EWZ2H4TB116A@cknow-tech.com>
Cc: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Ricardo Pardini" <ricardo@pardini.net>
Subject: Re: [PATCH v4 5/5] clk: rockchip: rk3588: add GATE_GRF clocks for
 I2S MCLK output to IO
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Diederik de Haas" <diederik@cknow-tech.com>, "Daniele Briguglio"
 <hello@superkali.me>, "Heiko Stuebner" <heiko@sntech.de>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
 <20260419-rk3588-mclk-gate-grf-v4-5-513a42dd1dcc@superkali.me>
 <DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com> <2100447.PIDvDuAF1L@diego>
 <20260623123316.4111002-1-hello@superkali.me>
 <DJGG8DEAKSPK.1GJ8FARAHXPXM@cknow-tech.com>
In-Reply-To: <DJGG8DEAKSPK.1GJ8FARAHXPXM@cknow-tech.com>
X-Migadu-Flow: FLOW_OUT

On Tue Jun 23, 2026 at 3:05 PM CEST, Diederik de Haas wrote:
> On Tue Jun 23, 2026 at 2:33 PM CEST, Daniele Briguglio wrote:
>> If that turns out to be the case, CLK_IGNORE_UNUSED on the gates is a
>> reasonable way to stop the kernel from closing a gate the firmware alrea=
dy
>> left open, for boards that would rather not switch their DTS to _TO_IO.
>
> I'm not so sure I agree that CLK_IGNORE_UNUSED is reasonable, but I'll le=
ave
> judgement up to others. I'll do the test regardless, though.

Ah, just learned those should be added to your patch, in which case my
objection goes away.
