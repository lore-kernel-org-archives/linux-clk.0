Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C609A314A83;
	Sat,  5 Sep 2026 20:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788641087; cv=none; b=XvqeMsJQAZ6TuE67IbLMhn9EjH56a0gvlgYeOUoSHXFiQMkCzFQF8iIerigJIeNOyc9IlHynPkokiyHLFKILfD50l2KHleqnuWYY2Wv4GRY+KjuYVHkB29CgINUsaRmxdeq/anBt66gFOra1Brqbby1Rj1wvKIZuMDneHBleOtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788641087; c=relaxed/simple;
	bh=4LzW8lLSjICOYUoYfH/qE6dLKDgYPb2vutHnFbOESbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEAc0VP75Icba708em+Wen020yMtny5KvAZaU7Qu7qLX9BIKl7Vz182o302xX43KJ4GznKP8eM1r5QihjJfwONB+agsxiYdKkLcDEd8mZoTaR632dcMlzL8uAinQrx3llaWFq0+zCN6RHXXS6eb1lI917jR5STMTzEerPhLuinw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1x2xFV-000000002Pj-2B02;
	Sat, 05 Sep 2026 20:44:29 +0000
Date: Sat, 5 Sep 2026 21:44:26 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "hpp.iscas" <hppiscas@163.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH] clk: mediatek: mt7988-apmixed: Publish the OF module
 alias
Message-ID: <apx_Ks4KqoJZgVHd@makrotopia.org>
References: <20260905133417.64373-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905133417.64373-1-hppiscas@163.com>

On Sat, Sep 05, 2026 at 09:34:17PM +0800, hpp.iscas wrote:
> COMMON_CLK_MT7988 is tristate and builds apmixed as a separate object.
> The apmixed platform driver has an OF match table but exports no OF
> alias, so that table cannot be used to select the module on a device
> event.
> 
> Publish the table. Keep the existing initialization entry point.
> 
> Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
> Signed-off-by: hpp.iscas <hppiscas@163.com>

Not sure if this Signed-off-by:-line is ok like that, do I understand
correctly that 163.com is a freemail provider?

Other than that

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  drivers/clk/mediatek/clk-mt7988-apmixed.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediatek/clk-mt7988-apmixed.c
> index 416a4b8..24f4e7b 100644
> --- a/drivers/clk/mediatek/clk-mt7988-apmixed.c
> +++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
> @@ -75,6 +75,7 @@ static const struct of_device_id of_match_clk_mt7988_apmixed[] = {
>  	{ .compatible = "mediatek,mt7988-apmixedsys" },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);
>  
>  static int clk_mt7988_apmixed_probe(struct platform_device *pdev)
>  {
> 
> 
