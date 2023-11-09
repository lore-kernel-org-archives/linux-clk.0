Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA7110A11
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="II7DCAcB"
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D609D18C;
	Thu,  9 Nov 2023 01:05:25 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4B68466073C9;
	Thu,  9 Nov 2023 09:05:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699520723;
	bh=VZujYMPKmLejiw85oagZfdMcNt6QF3HzE/oXVKwjZHU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=II7DCAcBHDtMNaI7+BirK5Re8/X8GRIN/JAsDBypjm+++Vj0AzHaioRWNUw/asGqY
	 J0ykE7NMxnyVkGtS7cSmWJ8Z7F/UUerze5xNAfazPhKT/XJ6VBVTn3FoYNnp1uwX3l
	 S13/fsKUtkJeQaQ/O8tTfZrRfdraOY9GesvwLT6mFzFfb7dQSgfyPt3O+js2D6boJn
	 NaZKCwimUdtykWCv62Of/W86RQiZhaFeJKtNyQBfgZYhagr94Dtoka6jr208DRZMmL
	 njtWtvcSBbLSu04UrbzN/bSwmtwb7ewBqCKk1xR7StVH+YtQP/Wao1Mvn69OqEV/ae
	 6lHecDsIV78Pw==
Message-ID: <3b6c474f-669d-4c6e-8d56-ea65958a3b48@collabora.com>
Date: Thu, 9 Nov 2023 10:05:16 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clock: mediatek: mt8173: Handle unallocated infracfg
 clock data
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
References: <20231108213734.140707-1-alpernebiyasak@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231108213734.140707-1-alpernebiyasak@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 08/11/23 22:33, Alper Nebi Yasak ha scritto:
> The MT8173 infracfg clock driver does initialization in two steps, via a
> CLK_OF_DECLARE_DRIVER declaration. However its early init function
> doesn't get to run when it's built as a module, presumably since it's
> not loaded by the time it would have been called by of_clk_init(). This
> causes its second-step probe() to return -ENOMEM when trying to register
> clocks, as the necessary clock_data struct isn't initialized by the
> first step.
> 
> MT2701 and MT6797 clock drivers also use this mechanism, but they try to
> allocate the necessary clock_data structure if missing in the second
> step. Mimic that for the MT8173 infracfg clock as well to make it work
> as a module.
> 
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---
> I've tried adding cpumux support to clk-mtk.c then switching this over
> to simple probe functions and it appears to work for me, though I don't
> know clock systems enough to recognize if it's subtly broken instead.
> That'd remove this piece of code, but this might still be worth applying
> to backport to stable kernels.
> 
> If I'm reading things correctly, it looks like it would be possible to
> add cpumux & pll & pllfh support to clk-mtk.c, then move most if not
> every driver to simple probe, with one file per clock and module
> support. How much of that is desirable? In what order do the parts need
> to be registered?
> 

Thing is, if (!infra_clk_data) at infracfg_probe time, then INFRA_CLK_13M==-ENOENT!
If you do this, you should at least also send a devicetree commit that adds

	clk13m: fixed-factor-clock-13m {
		compatible = "fixed-factor-clock";
		#clock-cells = <0>;
		clocks = <&clk26m>;
		clock-div = <2>;
		clock-mult = <1>;
		clock-output-names = "clk13m";
	};

....otherwise this solution is incomplete! ;-)

Regarding the CPUMUX support, when I've restructured the MediaTek clocks, I've also
been thinking about doing this, but decided not to do it because that'd be a check
done on ~10 clock drivers per SoC, of which only one is expected to succeed... I
see that as a waste of cycles at boot...

...but if anyone thinks otherwise, I'm fine with it...

Anyway.

Can you please fix the commit title to be consistent with the others and send a v2?

In this case, that would be
"clk: mediatek: mt8173-infracfg: Handle unallocated infracfg when module"

P.S.: Good job!

Cheers,
Angelo

>   drivers/clk/mediatek/clk-mt8173-infracfg.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> index 2f2f074e231a..ecc8b0063ea5 100644
> --- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> @@ -98,7 +98,17 @@ CLK_OF_DECLARE_DRIVER(mtk_infrasys, "mediatek,mt8173-infracfg",
>   static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
>   {
>   	struct device_node *node = pdev->dev.of_node;
> -	int r;
> +	int r, i;
> +
> +	if (!infra_clk_data) {
> +		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
> +		if (!infra_clk_data)
> +			return -ENOMEM;
> +	} else {
> +		for (i = 0; i < CLK_INFRA_NR_CLK; i++)
> +			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
> +				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
> +	}
>   
>   	r = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
>   				   ARRAY_SIZE(infra_gates), infra_clk_data);
> 
> base-commit: 2220f68f4504aa1ccce0fac721ccdb301e9da32f



