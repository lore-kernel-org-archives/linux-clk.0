Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776E4136327;
	Thu, 14 Nov 2024 20:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731616293; cv=none; b=Ut2UXZq7SLTfQByDDjX2ZrMLm9qWZ//y0n7oJj0CLv1wTxvoit6voKyGZGZyto7ajSvbmcnrXLws22R08a3zcFnMC5bdQ3UbMzXhxPmC98/vFq9r+ErvYyOVchwkYXnCEpxjKMmRajiX1+lf8i7FIMW9CJOEtVcHVC1cNZY9Le0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731616293; c=relaxed/simple;
	bh=kcD7lpOvfok8iwoAEQ7O4TR/rmcLTmp0Xw+RedPXt7g=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=mQqCvCZmXnAvTuColt5rSfIXJznJwHXbuwxlUAEb8rkVqKrdheYJnkfqbcCb5Rc5XGN6jw9kV87bss9eo27VoXHyK/IQdISgVa1ksB0A2f0TOpy/IEt2pOtMwh17ToTYQlXdy43SMsx/5pJXxFJgRpYy/c9HyuEPzrr6cTV0b3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNorJ7yE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNorJ7yE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6A2C4CECD;
	Thu, 14 Nov 2024 20:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731616293;
	bh=kcD7lpOvfok8iwoAEQ7O4TR/rmcLTmp0Xw+RedPXt7g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WNorJ7yEDMNplHX5dphQlyW2bmGqbBL/yHqyMpEVOWl8vc+gXWYFFf9qImfUN3Ppe
	 iT1gtyjYWUKT1F3D14m9rrxT5iwVmet+27+3hMrT2Se6u8fW+sP0/zFzsE33UsXXQN
	 J+QmUbzuaaHZEa8f8inIbdFwWh7RA1sNNzlUi1+TRqW38WH5qWmV/2yiiIW/ZLCNjw
	 zzs12lf3/ihZapP21fK+ZYZI0J3QQz6m9eQfp4KmVRuyG27MEljFs12181TswPg60A
	 /akts2gMDE3j8xSsG8GT05HqyWHKTj9OtoaKB4/1Z3ASvBIHGGPQqCuPP6yTLbaYTE
	 yzW2qWJFzL7CA==
Message-ID: <c6d1d80e4e32439de589e241a596d3bb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241114072820.3071-1-hanchunchao@inspur.com>
References: <20241114072820.3071-1-hanchunchao@inspur.com>
Subject: Re: [PATCH] clk: clk-apple-nco: Add NULL check in applnco_probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Charles Han <hanchunchao@inspur.com>
To: Charles Han <hanchunchao@inspur.com>, alyssa@rosenzweig.io, marcan@marcan.st, povik+lin@cutebit.org, sven@svenpeter.dev
Date: Thu, 14 Nov 2024 12:31:30 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Charles Han (2024-11-13 23:28:20)
> Add NULL check in applnco_probe, to handle kernel NULL pointer
> dereference error.
>=20
> Fixes: 6641057d5dba ("clk: clk-apple-nco: Add driver for Apple NCO")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---

Applied to clk-next
