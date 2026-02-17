Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B405931A57C
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771322119; cv=none; b=W/LlBHS/belARShT3IhPJZxNpg2uQQLGEv12nFKOC/r//4T2IF7d6JHI1EIz+GN/dghvAWPuTNppnqDiyTdqcX5sx53XjGikEFpdZdR/GymsOM1Jm0aIcnIorj8bc+fFyRSHp7i50DI6OPoQN3a01aXFEEhiQEQMvMNQO23OwgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771322119; c=relaxed/simple;
	bh=REVLzExhtQah2WMy6jJLDAGKfvvxas7NSqRHuI2XzCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+EdP+N5ejr5BX50TBLUazlEajqYKi/JkZZGldjKHZEVVKz7UWxbAn4m56NKGuNqDwAPmAOX4+LmkVf2vTw436p2epcgu6vJ8dL29hKy1st5kif1xHZUrrTN0TAtzcRmFLyIXg5azGdx671qsj6zQMcaVkNBZkVwHiL0SZJPFOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vsHn7-0007Wp-SS; Tue, 17 Feb 2026 10:54:49 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vsHn6-001DDS-0B;
	Tue, 17 Feb 2026 10:54:49 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vsHn7-00000007fIL-1EgV;
	Tue, 17 Feb 2026 10:54:49 +0100
Date: Tue, 17 Feb 2026 10:54:49 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: pll14xx: Add 756 MHz entry for PLL1443x
Message-ID: <rvz22m6k4g62gopbghfssyuwz43raxzoxeohfn7hpvbou3htoi@de2ajdoeybm5>
References: <20260217094152.19958-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217094152.19958-1-ian.ray@gehealthcare.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Hi Ian,

On 26-02-17, Ian Ray wrote:
> The PLL1443x is used to implement VIDEO_PLL1 on i.MX8MP and can be used
> for dual-channel LVDS displays.  Add new rate 756 MHz, which divides by
> 7 to provide 108 MHz LVDS pixel clock, and by 2 for 378 MHz LDB clock.

the on-demand rate calculation doe for the PLL1443X PLLs is not
sufficient for you?

Regards,
  Marco


> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> ---
>  drivers/clk/imx/clk-pll14xx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 36d0e80b55b8..84279cf9f12b 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -63,6 +63,7 @@ static const struct imx_pll14xx_rate_table imx_pll1416x_tbl[] = {
>  
>  static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
>  	PLL_1443X_RATE(1039500000U, 173, 2, 1, 16384),
> +	PLL_1443X_RATE(756000000U, 252, 2, 2, 0),
>  	PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
>  	PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
>  	PLL_1443X_RATE(519750000U, 173, 2, 2, 16384),
> -- 
> 2.49.0
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
