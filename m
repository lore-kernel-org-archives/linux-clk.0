Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D4A38A9B5
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 12:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308365; cv=none; b=SsyjhQhBxphop0l/8tQL+hZOPBjuI8vtSBMEYZTCuCjHWxJJUUzTmjrjMuKBmyS1IPZ9W0KTcCLOLritSB2tliJRxjXHhG7Bz5SOLX6jGwOmhfAGN/Z2Twg6Iwvw+cOZTyJMIWIZTsIFUUNe8+HHm9ao4nzKLBa692kAEi5x9bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308365; c=relaxed/simple;
	bh=MyaAOHYPHbxc/iBoPPS9kTtbzD6GQg+dZ2uHUZuS+/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQyej/llDZOczaM9VJI1ydn9FlatcncC+YGVFh4hlFefTrmEq127i5nisdkNjFv4LDDGCTNTsIEP/jSBMnLEAgBuB+D1wd/uiaXByWip/90eL9yb3ZX6p2kNNhPHg9i2Y/kp5wDS/1KXLOP9XEra7fivmcOhNk8XVbgmu235y3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfdmU-0007Pm-HP; Tue, 13 Jan 2026 13:45:54 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfdmU-000QP4-2E;
	Tue, 13 Jan 2026 13:45:54 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfdmT-009sZG-2q;
	Tue, 13 Jan 2026 13:45:53 +0100
Date: Tue, 13 Jan 2026 13:45:53 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
Message-ID: <20260113124553.qe7rai3bn6bff7hy@pengutronix.de>
References: <20260113-v6-18-topic-clk-fracn-gppll-v1-0-166e674aabf1@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v1-2-166e674aabf1@pengutronix.de>
 <CAEnQRZBfVjX=vpzrU9sQuOmZGt-NY0P6dt1dZpciLVFa3w2bSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZBfVjX=vpzrU9sQuOmZGt-NY0P6dt1dZpciLVFa3w2bSA@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On 26-01-13, Daniel Baluta wrote:
> On Tue, Jan 13, 2026 at 2:29 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > Some parallel panels have a pixelclk of 24.19 MHz. Add support for
> > 241.90 MHz so a by 10 divider can be used to derive the exact pixelclk.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/clk/imx/clk-fracn-gppll.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
> > index 579f76494eb041dfba58b8cd10eb2453a0ec4178..eb3d5e3c53946f3caf83bcff654c6481611375e3 100644
> > --- a/drivers/clk/imx/clk-fracn-gppll.c
> > +++ b/drivers/clk/imx/clk-fracn-gppll.c
> > @@ -89,7 +89,8 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
> >         PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
> >         PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
> >         PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
> > -       PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12)
> > +       PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12),
> > +       PLL_FRACN_GP(241900000U, 201, 584, 1000, 0, 20)
> 
> Can you please end this line with a comma so that next addition at the end of
> the array will create a simpler diff?

Thought about this too but I don't know why I didn't added this.

Thanks for the input.

Regards,
  Marco

> Look for example at int_tbl array in the same file.
> 
> thanks,
> Daniel.
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
