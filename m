Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF4DDF59;
	Tue, 31 Dec 2024 01:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735607374; cv=none; b=UqOk7rNCTOWndgFLTwqqDCP0iPxwJtcQ3glwaGphA/bFwRoN/Kd1PY2kQ2dHXVvdggpQCPc3IT26Xy5goPGZl14tAGFPXhGetfvDUiQv/0owGyhXk27tPa9IvSjgthvsO4w51N0vJdc+4TQy2u002/GbICUlyjIIk15uv3S+pR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735607374; c=relaxed/simple;
	bh=R2977F/vnqyUBER9tNZQq405KupuOFUv4wjLFhd48yk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=nD5EXHm5tYqDLYL+7SWlwldLRFjxmBXBsCKLWQa4ij6U7tGtjrw/SSi9/ibA/xvJACWMjZVvzxhUN2mJVOExFbfly7XFexfWKD5JA33GzjSWMezpbadMKyDc+WbYGBUZyr/2Yys+6Ke89iGi8qWGSTbccpRxWYm8AVGVSvvJw9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ineBT4yO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ineBT4yO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2294DC4CED0;
	Tue, 31 Dec 2024 01:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735607374;
	bh=R2977F/vnqyUBER9tNZQq405KupuOFUv4wjLFhd48yk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ineBT4yOUiXBvn2+CodK1YF7hwKVCCNuLyQu5OH4u16pqhUgBmf7U9QkzPa63WGk4
	 Zg5Q1rdhujUIxFErggh6/iTv1PSrWghsyEPFEwBeKMnhNIlLzz3VdXum0ysOFo8KuY
	 bIdeuTIuUj9ZwsngrvVFS66fLt8LBhXRCvWSmLzRsLSAhLEBaKCMmi2CnkP31sNL1R
	 fHi5rTvipoQyzOhMQsqheNpGiLCUkSsEzcoF7Y75/QOmbamiDA/ih3zz0gAfZ1Xl08
	 iKDt/xGirMiRuvToAgNTnJbtpOOl0k27CEThxpeahTgUTqmr+nMnpYfoK/qt+9USXM
	 R0pFoa27MI7eQ==
Message-ID: <3bcf5bc1007c9ed2900780fe07e66cb8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87jzbqtfc3.fsf@bootlin.com>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com> <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com> <fd2b473bc7c3c70ae0e85b2a6315d9e8.sboyd@kernel.org> <87jzbqtfc3.fsf@bootlin.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when walking subtrees
From: Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Ying Liu <victor.liu@nxp.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, Herve Codina <herve.codina@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 30 Dec 2024 17:09:32 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Miquel Raynal (2024-12-23 10:38:20)
> Hi Stephen,
>=20
> >> +/* do not passively change this clock rate during subtree rate propag=
ation */
> >> +#define CLK_NO_RATE_CHANGE_DURING_PROPAGATION BIT(14)
> >
> > Why doesn't rate locking work?
>=20
> Can you be more specific? What function from the API is supposed to do
> what I need? AFAIU, none of them is properly locking the rate during a
> subtree walk, but if I misread one of them, I'd be glad to drop all this.
>=20

It's clk_set_rate_exclusive() as Maxime also asked about in the other
thread.
