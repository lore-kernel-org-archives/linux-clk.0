Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0CB227B8A;
	Fri, 20 Dec 2024 23:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734738235; cv=none; b=I7h2cq30T+dXADVTYzzHZXEI0yGb64qrUDG4Y10PGSN3uL8yEDH9MaJ2wsK8sgMUdmH+kLoAOtAWwg7u85LW6wuuYORl95IQ8CupLMoye1KGh/rfkBvO7goo2NR5BhSsu/utSaHrCYWokWp0+BIiXP6/vjz1zrEE3UE0Em5G8zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734738235; c=relaxed/simple;
	bh=Tl3idrE2LCcllxqdl/sbYQYJDQoP869azWPMoZLhxKg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=qpDaKZ8kLttrpaH/M3O1SNvFpNeZSQ4EI5uW5cIAqXu2U88j7r2FHA+0/zXbMQBvTOMPgyS+xk5ikTKEgfYiAnYmAB0TknUs0I1prGUWNVsznnNNSs3q0h9OHC4SPXgmbcR4xFu9WBx+jY+aDbc8Rem2ZOLW8o0Emb/y1D8ur6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rs76IXBb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rs76IXBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95CFC4CECD;
	Fri, 20 Dec 2024 23:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734738234;
	bh=Tl3idrE2LCcllxqdl/sbYQYJDQoP869azWPMoZLhxKg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rs76IXBbEJgspYIxkUgYirKR9qdmMusTU04RfQ8aYSpA7brl0GXjq/Yq4/XWliLMK
	 BVByk3LAviLPBldIHj9nvLbKJrFXPJT04YyDvG41rkMKehi+edYeMbSlAVmHstwkF2
	 dnDuhgBnarL2HzdPqA013C4xnOUYU1rjlJgiyAwHL03/GuiRQlOhkrDu1lpumxFz/8
	 yRbtRkY4o6l9kLyimWgokfGcSoae5SSXslnAEPdyo9/3+g9N/Uaika5PnyU1tVhxLs
	 FMuSGTI2u3HPVTL+BJmSVzTNTndvgtCd3S3ePoqMWT8UdEhVk6HZpKDR2wnErrIVJR
	 ZRj3UaLGkLUXQ==
Message-ID: <ae80d29442890a356289ad1f0caab906.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241219105447.889CB11FE@mail.steuer-voss.de>
References: <20241219105447.889CB11FE@mail.steuer-voss.de>
Subject: Re: [PATCH] clk: clk-imx8mp-audiomix: fix function signature
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Nikolaus Voss <nv@vosn.de>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Fri, 20 Dec 2024 15:43:52 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Nikolaus Voss (2024-12-19 02:54:11)
> clk_imx8mp_audiomix_reset_controller_register() in the
> "if !CONFIG_RESET_CONTROLLER" branch had the first
> argument missing. It is an empty function for this branch
> so it wasn't immediately apparent.
>=20
> Fixes: 6f0e817175c5 ("clk: imx: clk-audiomix: Add reset controller")
> Cc: <stable@vger.kernel.org> # 6.12.x
> Signed-off-by: Nikolaus Voss <nv@vosn.de>
> ---

Applied to clk-fixes
