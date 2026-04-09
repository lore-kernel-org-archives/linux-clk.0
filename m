Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com [212.61.153.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432EB3AE701;
	Thu,  9 Apr 2026 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.61.153.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726224; cv=none; b=KNeBV5Vn8U5vbgnGI5iFpQC1N9+HDgAUkcHmc+w3IrApwqLM5dTw2F5aKsJVqRWnOYUV8STHP5SNr5ABNP4Pi0NA2322Aco7XhlOTkFRtvAJknVH1jYMrR6P1clQUsCNpXUvaJAd+nsuwFm+ei5nDCD3mAhcDjGaKl2oNxfqE5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726224; c=relaxed/simple;
	bh=jVY18RrhX3s9AskLVB//8j0zI2tCSDvQNpsvY71GDeA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l7Nu4W8p+mJU/s57a7Hi2K24ndjgKJDBcS4dm0LJiyXNL51dXfE/1JeYabY61KSm/qNbIyMVtnapJcYinUeZEXd+j4rxfOUQ9HrfsRmWlhYN5FmBe2GIFLFD+B+DIcrlwVOwZImH8/RBXoG6i1jNFU9An5XgaRhDskUwbEErNnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; arc=none smtp.client-ip=212.61.153.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 9 Apr
 2026 11:16:44 +0200
Received: from lnxdevrm02.bk.prodrive.nl (10.1.1.121) by
 EXCOP01.bk.prodrive.nl (10.1.0.22) with Microsoft SMTP Server id 15.2.1748.39
 via Frontend Transport; Thu, 9 Apr 2026 11:16:44 +0200
Received: from paugeu by lnxdevrm02.bk.prodrive.nl with local (Exim 4.96)
	(envelope-from <paul.geurts@prodrive-technologies.com>)
	id 1wAlVE-00FtCh-0K;
	Thu, 09 Apr 2026 11:16:44 +0200
From: Paul Geurts <paul.geurts@prodrive-technologies.com>
To: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <shawnguo@kernel.org>,
	<linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <martijn.de.gouw@prodrive-technologies.com>
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Date: Thu, 9 Apr 2026 11:16:43 +0200
Message-ID: <20260409091643.3787112-1-paul.geurts@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <9f36af74-ef1a-4777-a1c3-ff13b68c2221@pengutronix.de>
References: <9f36af74-ef1a-4777-a1c3-ff13b68c2221@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

> Hello Paul,
> 
> On 4/8/26 12:13 PM, Paul Geurts wrote:
> > The i.MX8MM clock driver is implemented as module_platform_driver();,
> > which makes it initialize in device_initcall(). This means that all
> > drivers referencing the clock driver nodes in the device tree are
> > deferred by fw_devlink, which are most of the i.MX8M platform drivers.
> >
> > Explicitly initialize the clock driver in arch_initcall(), to make sure
> > the clock driver is ready when the rest of the drivers are probed.
> >
> > Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")
> 
> Your commit message doesn't explain why this was a problem for you.
> Does it delay your boot? What makes this patch a fix?

Yes I could update that in the commit description. The problem is that because
of this, _all_ hardware is initialized in late_initcall, as that is where
deferred probes are handled. For embedded devices, some sign of life is
expected by most people during boot. Especially when an initrd needs to be
unpacked, this sign of life is going to take a very long time. Some display
controllers don't even get enough time to show the boot logo because of this.
I don't think the idea behind the initcall levels is that _everything_ is
initialized in late.

> 
> > Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>
> > ---
> >  drivers/clk/imx/clk-imx8mm.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
> > index 319af4deec01..7b2cf867b920 100644
> > --- a/drivers/clk/imx/clk-imx8mm.c
> > +++ b/drivers/clk/imx/clk-imx8mm.c
> > @@ -636,7 +636,19 @@ static struct platform_driver imx8mm_clk_driver = {
> >                .of_match_table = imx8mm_clk_of_match,
> >        },
> >  };
> > -module_platform_driver(imx8mm_clk_driver);
> > +
> > +static int __init imx8mm_clk_init(void)
> > +{
> > +     return platform_driver_register(&imx8mm_clk_driver);
> > +}
> > +arch_initcall(imx8mm_clk_init);
> 
> What happens if you build the driver as module with your changes applied?

On module insertion, there is no initcall level, and initialization is
performed on insertion (AFAIK). Fact is that the system would probably
not boot when this is built as a module, as there are no peripheral clocks
without it.

> 
> Cheers,
> Ahmad
> 
> > +
> > +static void __exit imx8mm_clk_exit(void)
> > +{
> > +     platform_driver_unregister(&imx8mm_clk_driver);
> > +}
> > +module_exit(imx8mm_clk_exit);
> > +
> >  module_param(mcore_booted, bool, S_IRUGO);
> >  MODULE_PARM_DESC(mcore_booted, "See Cortex-M core is booted or not");
> > 

Thanks!
Paul
