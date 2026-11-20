Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133056;
	b=PUPJt9UXZPrb7HxHi7qkwIOORvXdg3fEgnLzxbeHf0c6cuS01akToW2eTRl/3OjNt2Kp
	 1ZjUh6P4oohLocz0xl56vtCTGr19WrecBgplm8PGuvj8XujpXwjEmOODIErinH0mFg81Q
	 rbc1PzO8PmbR404Hh0N93cur3BQfR9nv/0n+AnTKpf7S/UnagSYmdojXAxTcxaf94qEGa
	 SJR8FNpyQl/qnv4L33cALHiRIuoN7VgfOuKXwNI/FOB8mItv6fVXX06Se4GdX16fBVOCs
	 dqZyitxSWfMjsBImN1YjCIRV8QcAxFq63QY3aKaZ6wURTMuAbONNn5lBl0SSpBc6Xbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133056;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=QZm1Eg3g+b1U6lqoa5z+DXcoErLYDpoVsvyKs6vZ7C0=;
	b=pI3leZJqwTSl2N/c4NydIg0mirIUA89rAlPkFN+ywYu2a9IvmqdOHQnwYIaMvtR6RerG
	 1r2zMhSMbWJYIk5KM+37xm3ix9yyXzJep8TiYeIuqZsW3I44GZLdzR32e9MaKbkyOHFMJ
	 ZfSw7dDOHBp7UbXdaA+1oS/A/xeb60lTNmsbDmKdw/y6D8gaVjMA5fl97yEBqjLF3J4a3
	 NJiv4ofTfL+UFM8IsPZKM2noo1qqyWxXK0cPQw2wJqwHUtq5xtGC41+bidlMVee4TeRXB
	 2AZs92GMY3YiOYzns5d/TNT0ivSrFeV+dyQFACFRURpxjBm8RvLfaKKNdZrOQCs3wvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y4+jhXyY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756E260A2603;
	Fri, 20 Nov 2026 00:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y4+jhXyY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFA11F000C4;
	Fri, 20 Nov 2026 00:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133056;
	bh=QZm1Eg3g+b1U6lqoa5z+DXcoErLYDpoVsvyKs6vZ7C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y4+jhXyY9CIf1Sw0EHy6JJNHXActu3RuCrMOJk4au8lwzqcb+pygIox3Z7T94PERi
	 npDwhForakFS3AZuhGXOs8NBRVAsBO4SgW9CaCy3GSKSxWSP56LfKvKYVW2NPdMwwI
	 8XYjs9H7Ld8NHyrIYiwitju4V9iTZ+QsCy/3cg6n5EcGjHlww+6WiiqM88dJuLIgME
	 lxi+LSFLkZjjt6atEps+QvhjrShy81wE0fD98ethTrzZG0MRtDL5SD/OLfivZ/TL1S
	 OkTkCdAGN7ZzveJ/INjqdy2d54HmeSjkyHvd1+P/hZlaD5Rvf8Cnqga9ZrIFsc4KPd
	 K16uTkP4VNVTg==
Date: Thu, 19 Nov 2026 19:04:14 -0500
From: Brian Masney <masneyb@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 4/5] clk: en7523: generalize register clocks function
Message-ID: <av-OfsUwqj-iM7ft@x1g10>
References: <20261117182444.103123-1-ansuelsmth@gmail.com>
 <20261117182444.103123-5-ansuelsmth@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117182444.103123-5-ansuelsmth@gmail.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Christian,

On Tue, Nov 17, 2026 at 07:24:42PM +0100, Christian Marangi wrote:
> Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
> register clocks. Generalize it to register clocks defined in soc_data.
> 
> Add the clocks definition in EN7581 SoC to support this new implementation.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/clk-en7523.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 6aa6dfaf414e..f12b69f8d453 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -147,6 +147,7 @@ struct en_clk_priv {
>  
>  struct en_clk_soc_data {
>  	u32 num_clocks;
> +	const struct en_clk_desc *base_clks;
>  	const struct clk_ops pcie_ops;
>  	int (*hw_init)(struct platform_device *pdev,
>  		       struct clk_hw_onecell_data *clk_data);
> @@ -802,12 +803,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
>  static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
>  				   struct regmap *map, void __iomem *base)
>  {
> +	const struct en_clk_soc_data *soc_data;
>  	struct clk_hw *hw;
>  	u32 rate;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
> -		const struct en_clk_desc *desc = &en7581_base_clks[i];
> +	soc_data = device_get_match_data(dev);
> +
> +	for (i = 0; i < soc_data->num_clocks - 1; i++) {

Can there be a proper count stored so that you don't have to do the - 1
here. If I recall, that's done in some other places in this driver.

Brian
