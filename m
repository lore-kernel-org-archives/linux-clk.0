Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F761B0F30;
	Mon, 13 Jan 2025 22:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736808514; cv=none; b=MVXomAj0fLnXGv9gOhtU8GKI5m+RHz9/9kVliTu+Er6NzaDgumfvGRiNdJavZysUMoIt9cDhydwEQ2SeDJqDmI1ZvYK7fCVbgc0eW5W0WcttkBVyhnQLAHAZVcKHMxZntSCcWhIVUO9bb2dyqypsxZeTVwJoEHUuw/S6adVTeLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736808514; c=relaxed/simple;
	bh=RSDy3tV0WkGi6e5XM5mPLnpc1TEvX1BLpFEcrVU108g=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=TrvLf5mVdOfJVFObzHs51AmGmHQq0m73JCIsPks+gsOvrE2BQylDqRQOL95UsEgchLG4ihP6Rsk7bBpy/EkWv6lxKZ/Tns408VDDjOzg+SLLUnuX/vUIcokur/x1jOXh6ovyELkkrG5aYRDtWnGtgpf5Aor54COTrdGFvuacrOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYYZzBIX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYYZzBIX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55F2C4CED6;
	Mon, 13 Jan 2025 22:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736808513;
	bh=RSDy3tV0WkGi6e5XM5mPLnpc1TEvX1BLpFEcrVU108g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cYYZzBIXXeD99Isj81gPpKA+vzLMsdQmYdduFPOHz6TWUd8eFaVO0mez9bS0xGS+B
	 OYLXzH/op6NdoWLBUM5zdglhdg4D3SGFK5/vjoFc2XYltv2c2+CyOLypmP21vicgu8
	 JjSgW4tHyQFK15GBQ/lkPrRzVOdycvXnAaj1lYoNS8U7Y8OrnguETH0AL6xZJZ1uEo
	 8in4w047Hf+Q0scqZ5eTBOGYQAfda4WfIVv1JxX4jnEtxNlW90P2+LedB3fbj8mKlh
	 SnXoY6Urqz/s1PJcPWDaHuLvS2O2j71qoWpkDtvpeWtngGRSZ5T/qMBBbgljFzVY8q
	 LJAIWjQRPYyNw==
Message-ID: <09c880a81cf21272f245c2118b923fef.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241121031426.36588-1-changhuang.liang@starfivetech.com>
References: <20241121031426.36588-1-changhuang.liang@starfivetech.com>
Subject: Re: [PATCH] clk: starfive: Make _clk_get become a common helper function
From: Stephen Boyd <sboyd@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 13 Jan 2025 14:48:31 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Changhuang Liang (2024-11-20 19:14:26)
> Introduce num_reg to store the number of clocks, this helps to make
> _clk_get become a common helper function which called jh71x0_clk_get().
> With this, it helps to simplify the code and extend the code in the
> future.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---

I was waiting for someone to review this patch.

>  drivers/clk/starfive/clk-starfive-jh7100-audio.c | 14 ++------------
>  drivers/clk/starfive/clk-starfive-jh7110-aon.c   | 14 ++------------
>  drivers/clk/starfive/clk-starfive-jh7110-isp.c   | 14 ++------------
>  drivers/clk/starfive/clk-starfive-jh7110-stg.c   | 14 ++------------
>  drivers/clk/starfive/clk-starfive-jh7110-sys.c   | 14 ++------------
>  drivers/clk/starfive/clk-starfive-jh7110-vout.c  | 14 ++------------
>  drivers/clk/starfive/clk-starfive-jh71x0.c       | 12 ++++++++++++
>  drivers/clk/starfive/clk-starfive-jh71x0.h       |  2 ++
>  8 files changed, 26 insertions(+), 72 deletions(-)
>=20
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/sta=
rfive/clk-starfive-jh71x0.h
> index e3f441393e48..634d8cb91592 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.h
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
> @@ -117,9 +117,11 @@ struct jh71x0_clk_priv {
>         struct clk *original_clk;
>         struct notifier_block pll_clk_nb;
>         struct clk_hw *pll[3];
> +       unsigned int num_reg;
>         struct jh71x0_clk reg[];

Please add __counted_by() annotation. Look at struct clk_hw_onecell_data
for an example.
