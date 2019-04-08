Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3A2C282DD
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 09:19:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F33F208E3
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 09:19:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="D+8Aa0uI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfDHJTv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 05:19:51 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1939 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfDHJTv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Apr 2019 05:19:51 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cab122e0001>; Mon, 08 Apr 2019 02:19:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 08 Apr 2019 02:19:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 08 Apr 2019 02:19:37 -0700
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Apr
 2019 09:15:23 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id ABE334199F; Mon,  8 Apr 2019 12:15:21 +0300 (EEST)
Date:   Mon, 8 Apr 2019 12:15:21 +0300
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Joseph Lo <josephl@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/8] clk: tegra: clock changes for emc scaling support on
 Tegra210
Message-ID: <20190408091521.GC12975@pdeschrijver-desktop.Nvidia.com>
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-3-josephl@nvidia.com>
 <20190403092250.GG5238@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190403092250.GG5238@ulmo>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1554715193; bh=qZ/0BVxdGvFM/MJMBzrJI7TIJp88XjuKWlDfuOTvVPA=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=D+8Aa0uIiGSVbKBHesCGlN2y9XjlTtN5qsconDomyEjkw2EOuRLNxQ0wPNiK+qp3T
         lAGMkIoArn79gpKTN/3shIfS9hcLxkB2FzJ+WIEdVBG8Akq/UbASjN/dPDJkhk//Ct
         et3c3II5Sy2196Br7QcDlm8L51ZAOmKJpJRiTWC0m01lzQjAWMIdz6VXIWQJlFTFqK
         OR1pYbe16i3ewaW8A7Hl6Naoqkb2YRZnMEMYkquL53T+dBDduvUKFxx/lVy9+xmIlQ
         dXjiQQ/AsdrvnfZ6yFdHfWRgtZ5gbLpGW7sPdMG22FvVqYZEcLZsU6RcJ4IvhUKu/8
         WNxixeLXhgW4A==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Apr 03, 2019 at 11:22:50AM +0200, Thierry Reding wrote:
> On Mon, Mar 25, 2019 at 03:45:17PM +0800, Joseph Lo wrote:
> > 1) Introduce low jitter paths for pllp and pll_mb used by the EMC driver.
> > 2) Remove the old emc_mux clock and don't use the common EMC clock
> >    definition. This will be replaced by a new clock defined in the EMC
> >    driver.
> > 3) Export functions to allow accessing the CAR register required for EMC
> >    clock scaling. These functions will be used to access the CAR register
> >    as part of the scaling sequence.
> 
> The fact that you can enumerate 3 logical changes made by this commit
> indicates that it should be split up into smaller patches.
> 
> > Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> > 
> > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > ---
> >  drivers/clk/tegra/clk-tegra210.c         | 112 +++++++++++++++++++----
> >  include/dt-bindings/clock/tegra210-car.h |   4 +-
> >  include/linux/clk/tegra.h                |   5 +
> >  3 files changed, 103 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> > index 7545af763d7a..e17b5279ea69 100644
> > --- a/drivers/clk/tegra/clk-tegra210.c
> > +++ b/drivers/clk/tegra/clk-tegra210.c
> > @@ -47,6 +47,7 @@
> >  #define CLK_SOURCE_LA 0x1f8
> >  #define CLK_SOURCE_SDMMC2 0x154
> >  #define CLK_SOURCE_SDMMC4 0x164
> > +#define CLK_SOURCE_EMC_DLL 0x664
> >  
> >  #define PLLC_BASE 0x80
> >  #define PLLC_OUT 0x84
> > @@ -234,6 +235,10 @@
> >  #define RST_DFLL_DVCO 0x2f4
> >  #define DVFS_DFLL_RESET_SHIFT 0
> >  
> > +#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET	0x284
> > +#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR	0x288
> > +#define CLK_OUT_ENB_X_CLK_ENB_EMC_DLL		BIT(14)
> > +
> >  #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
> >  #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
> >  
> > @@ -319,12 +324,6 @@ static unsigned long tegra210_input_freq[] = {
> >  	[8] = 12000000,
> >  };
> >  
> > -static const char *mux_pllmcp_clkm[] = {
> > -	"pll_m", "pll_c", "pll_p", "clk_m", "pll_m_ud", "pll_mb", "pll_mb",
> > -	"pll_p",
> > -};
> > -#define mux_pllmcp_clkm_idx NULL
> > -
> >  #define PLL_ENABLE			(1 << 30)
> >  
> >  #define PLLCX_MISC1_IDDQ		(1 << 27)
> > @@ -2310,7 +2309,7 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
> >  	[tegra_clk_i2c2] = { .dt_id = TEGRA210_CLK_I2C2, .present = true },
> >  	[tegra_clk_uartc_8] = { .dt_id = TEGRA210_CLK_UARTC, .present = true },
> >  	[tegra_clk_mipi_cal] = { .dt_id = TEGRA210_CLK_MIPI_CAL, .present = true },
> > -	[tegra_clk_emc] = { .dt_id = TEGRA210_CLK_EMC, .present = true },
> > +	[tegra_clk_emc] = { .dt_id = TEGRA210_CLK_EMC, .present = false },
> >  	[tegra_clk_usb2] = { .dt_id = TEGRA210_CLK_USB2, .present = true },
> >  	[tegra_clk_bsev] = { .dt_id = TEGRA210_CLK_BSEV, .present = true },
> >  	[tegra_clk_uartd_8] = { .dt_id = TEGRA210_CLK_UARTD, .present = true },
> > @@ -2921,6 +2920,82 @@ static int tegra210_init_pllu(void)
> >  	return 0;
> >  }
> >  
> > +void tegra210_clk_emc_dll_enable(bool flag)
> > +{
> > +	unsigned long flags = 0;
> > +	u32 offset = flag ? CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET :
> > +		     CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR;
> > +
> > +	spin_lock_irqsave(&emc_lock, flags);
> > +
> > +	writel_relaxed(CLK_OUT_ENB_X_CLK_ENB_EMC_DLL, clk_base + offset);
> > +	readl(clk_base + offset);
> > +
> > +	spin_unlock_irqrestore(&emc_lock, flags);
> > +}
> > +EXPORT_SYMBOL_GPL(tegra210_clk_emc_dll_enable);
> > +
> > +void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value)
> 
> Do we really want to pass the whole register value through this
> function? The register has three fields, so perhaps it's safer to pass
> the fields individually? Or perhaps we only need to modify a subset of
> the fields and can reduce the number of parameters we pass? Letting a
> different driver pass any arbitrary value here takes away any means of
> checking for validity.
> 

The EMC scaling driver needs to modify all 3 fields. If the DDLL_CLK_SEL
field would be fixed, this function could be left out and CCF be used
instead.

Peter.
