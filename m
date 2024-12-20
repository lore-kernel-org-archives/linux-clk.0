Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB371BBBE5;
	Fri, 20 Dec 2024 23:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734738924; cv=none; b=NpPNtNCJZW6d4ZJA6ostIMIp2SCKwIbgyg5JetOzzScCDyC0BrCXnE4yXcDBaV2ku3XKnbLcf0BHBR+yimJitPwMJt07rL9feurFW+vKZzTn3TE5EthN7mWKN/24iIQhGuxXAVyBd4zJ9uYU7a5WZ7ynfVotW+RXZUZq2tEdaJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734738924; c=relaxed/simple;
	bh=+anQ9xF+0gz9v214qO3fi++5Sf130otJ9k+BvwMiYQ4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=tMuVKVdk53urAQKQRF7mgACWeZQ5zBG268SjhGRCh2x5zfiZ3Sl8jTZNmU4rJtPeDnyIe9j1Nlb5HrUlXrvpGG5OHnZGg6+0Swj9m97bKDxSa5hzo+f31pMI0y5801Ckn9A6oti9Xd/zUFQhj5s49F+NCB6qkg4/zvnHoB74q1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXZ70aLM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXZ70aLM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B04BC4CECD;
	Fri, 20 Dec 2024 23:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734738923;
	bh=+anQ9xF+0gz9v214qO3fi++5Sf130otJ9k+BvwMiYQ4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UXZ70aLM6AURxPoYjUrcCrTLvxdpkaXPlVrWvwr1c+L1AtURicOd+xpOWhedqUojm
	 x6b/fUBVBzNww6IKkWzCaKwEbG+CN78sMwdOz+7nEL9VdH/9ay8pKAV0jtVsb6HfLd
	 G0ECtdXJ8KLKrCc3L3oz/GOPaQY+m4sVgVRCannf+Mr6gtPVfaI2HHgXlTNXRO0ahp
	 1PrMORqQD2CuCSBKfdh1pjOBjskTInkQ/zPbH3smA93blin2n6cJF5KGCdVmEzird8
	 upPThBce+Sp2T4YBM4YMwG45mHIuMREqV4eDf0kA0828Dh5H24ACcpBWCVE8TLP4pd
	 aCObeNDPhfPeg==
Message-ID: <6ce3260dafcf3b1ace3d6bb4255e2d9b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-1-96dd657cbfbd@baylibre.com>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com> <20241220-amlogic-clk-drop-clk-regmap-tables-v1-1-96dd657cbfbd@baylibre.com>
Subject: Re: [PATCH 1/3] clk: add a clk_hw helper to get the associate device structure
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Dec 2024 15:55:21 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Jerome Brunet (2024-12-20 09:17:42)
> Add an helper function to get the 'struct device' associated with

Add a helper

> an a 'clk_hw'. This can be used by clock drivers to access various

with a 'clk_hw'

> device related functionnalities such as devres, dev_ prints, etc ...

s/functionnalities/functionality/

>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/clk.c            | 6 ++++++
>  include/linux/clk-provider.h | 1 +
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9b45fa005030f56e1478b9742715ebcde898133f..7e734d2955978cafd77d91156=
2a26f1646684ec2 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -365,6 +365,12 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_get_name);
> =20
> +struct device *clk_hw_get_dev(const struct clk_hw *hw)

Please document with kernel doc

> +{
> +       return hw->core->dev;
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_get_dev);

I suspect a quick KUnit test can be written up as well that confirms the
device the clk is registered with is returned.
