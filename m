Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:60931 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752903AbcGDHvl (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jul 2016 03:51:41 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Russell King <linux@armlinux.org.uk>,
	Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
	Linux-DT <devicetree@vger.kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Linux-Kernel <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clkdev: add devm_of_clk_get()
Date: Mon, 04 Jul 2016 09:54:05 +0200
Message-ID: <7596144.XSxKMDxLKp@wuerfel>
In-Reply-To: <87y45iz0cs.wl%kuninori.morimoto.gx@renesas.com>
References: <87y45iz0cs.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Monday, July 4, 2016 1:04:30 AM CEST Kuninori Morimoto wrote:
> @@ -501,6 +503,11 @@ static inline struct clk *of_clk_get(struct device_node *np, int index)
>  {
>         return ERR_PTR(-ENOENT);
>  }
> +struct clk *devm_of_clk_get(struct device *dev,
> +                           struct device_node *np, int index)
> +{
> +       return ERR_PTR(-ENOENT);
> +}
>  static inline struct clk *of_clk_get_by_name(struct device_node *np,
>                                              const char *name)
>  {
> -- 
> 

This is missing "static inline" as found by the bot.

	Arnd

