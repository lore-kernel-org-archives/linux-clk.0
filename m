Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110AE364EB2;
	Fri, 23 Jan 2026 01:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132724; cv=none; b=m8HRY962xvrB+VSRpk1nKogEnnndZMb6UnEsJxKENTvxIzSXkHWXOYIyWbtq+lRdwxFQ9kmF1DH/n/1Jp4mfGkeY+NcI2PnmIYHMuzBiZ7A1ZpqYLzO+rq/se0oc7PeG29QF7aTHmTdqHJm3s6tJUsU4+/3dpOVwkyXynFwg7sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132724; c=relaxed/simple;
	bh=SUqt5//9x6ikkcTBwd39LjEZbg7/SrQDa2wNA7zOQow=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=TJjXLWKFwGYJmY/yV3zCnTty+a/RrCthlCCPsgqXVZ7QEhpakLVDPHvQE5K/8c8KGB2VExYKPw06jBux+k3+bZMZJIz8Ya2cg/nake1MYlmKpQD+2V8JrSJLUooRzIbFFmyt42ay8f/rUEEkrXOUYyLImUTCskjtXnrNAu+lIXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhENHPB5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhENHPB5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080AEC2BC9E;
	Fri, 23 Jan 2026 01:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132721;
	bh=SUqt5//9x6ikkcTBwd39LjEZbg7/SrQDa2wNA7zOQow=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NhENHPB5ww4MTDz+GSgWQrvVQlmm8vLjHi0m1XU6gUMIwMrOiFWB/NUytwI8IvE+y
	 erSmmJH7L7Lfql6j7XJmDFPyDeYn3JzpHWvuB4dfYDyQH+o9DfvjeQ0KsIzj+NNPs/
	 Fxd5uY/Db7Wa1UJAfNzSBTJ72mxWKAmH3fJkPgvaCdOKj7oV3atXQjsktQc9NY+zNK
	 aEXJ8jEWshAqH0qVUinuv3uYB/pz0Om+c6zH6l9P9eGPA7E4290y5IWOPKGSUXrOmu
	 h6Sqt0jdb79DqhtwvlFwZcSPil9OrTxoL1huIM7U97FPaDU3weAsHtByXDzCjHECBZ
	 mcaKFBdp8Iurw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251215-mtk-pll-rpm-v3-2-5afb3191e869@collabora.com>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com> <20251215-mtk-pll-rpm-v3-2-5afb3191e869@collabora.com>
Subject: Re: [PATCH RESEND v3 2/5] clk: mediatek: Refactor pll registration to pass device
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Date: Thu, 22 Jan 2026 18:45:19 -0700
Message-ID: <176913271924.4027.2857487573564767197@lazor>
User-Agent: alot/0.11

Quoting Nicolas Frattaroli (2025-12-15 03:23:59)
> As it stands, mtk_clk_register_plls takes a struct device_node pointer
> as its first argument. This is a tragic happenstance, as it's trivial to
> get the device_node from a struct device, but the opposite not so much.
> The struct device is a much more useful thing to have passed down.
>=20
> Refactor mtk_clk_register_plls to take a struct device pointer instead
> of a struct device_node pointer, and fix up all users of this function.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Applied to clk-next
