Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE74CB3BB;
	Thu,  8 Jan 2026 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875060; cv=none; b=ZCtV6VNWQvhp4vXKYs0MxBV+dBdyjOoUFU02FJbq2uP1DhGf6RpCQ104y5LQh/8fsQHqa1OR0Kp7omDO1M0TbPH+K9dQbgiga+Yr+zEYamNgYBLIweSqJhfWQeq7oWp7D3tU74qyc+pIiY2hjnHBlG2WdBbl13qcPvMaGS3EqkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875060; c=relaxed/simple;
	bh=uluj15nv0I39/Rq0UuYS/cxHYmelKtaJjmNgYItHxnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+70V14AQBSZuqgCuZAAJ5Bu8kXsENKZlqVVafWs/D/CNvF4n7O0dXQ3vvXkJKhHL20sEBDGTF3qPRIaMxRVawOpFPY4oIn6lk1qxxf2iq3U81Cf7cgaIWhUKDuvEnmCcDMMo+evvCh+eWS3rdLwGf/1QhAFdi1uXPx1KKtSe18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A82FE340DF7;
	Thu, 08 Jan 2026 12:24:17 +0000 (UTC)
Date: Thu, 8 Jan 2026 20:24:13 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 4/4] reset: spacemit: fix auxiliary device id
Message-ID: <20260108122413-GYB4052@gentoo.org>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-4-6061d9f69eef@gentoo.org>
 <058d3911-ff2d-4151-b585-5bcb8810bedf@riscstar.com>
 <e7fa69f1febc37062a59f566be97537a3a1e6ee0.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7fa69f1febc37062a59f566be97537a3a1e6ee0.camel@pengutronix.de>

Hi Philipp,

On 12:07 Thu 08 Jan     , Philipp Zabel wrote:
> On Di, 2026-01-06 at 08:43 -0600, Alex Elder wrote:
> > On 1/3/26 1:26 AM, Yixun Lan wrote:
> > > Due to the auxiliary register procedure moved to ccu common module where
> > > the module name changed to spacemit_ccu, then the reset auxiliary device
> > > register id also need to be adjusted in order to prepare for adding new
> > > K3 reset driver, otherwise two reset drivers will claim to support same
> > > "compatible" auxiliary device.
> > > 
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > 
> > This would ideally be merged with the previous patch.  Maybe
> > Philipp can negotiate with Stephen to have that happen.
> > 
> > Reviewed-by: Alex Elder <elder@riscstar.com>
> > 
> > > ---
> > >   drivers/reset/reset-spacemit.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
> > > index e1272aff28f7..cc7fd1f8750d 100644
> > > --- a/drivers/reset/reset-spacemit.c
> > > +++ b/drivers/reset/reset-spacemit.c
> > > @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
> > >   
> > >   #define K1_AUX_DEV_ID(_unit) \
> > >   	{ \
> > > -		.name = "spacemit_ccu_k1." #_unit "-reset", \
> > > +		.name = "spacemit_ccu.k1-" #_unit "-reset", \
> > >   		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
> > >   	}
> > >   
> 
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
thanks

> to be merged via the clock tree.
> 
ok, got!

and, here is my plan, I will prepare an immutable tag for the patch 4 -
the change to reset driver ID, and merge it with the whole series,
then send them along via clock tree.

the tag would be useful if follow-up K3 reset patch[1] need to be merged, since
both will change the reset driver, and with the tag, patch 4 can be pulled into
both clock and reset subsystem, future reset patches can commit on top of it.
even there is no price to pay if above doesn't happen.


> Note that the commits for both patches 2 and 3 will fail to probe the
> reset driver when bisecting.
> If you don't want do merge the corresponding changes to K1_AUX_DEV_ID()
> into those two patches, to make this series (runtime) bisectable, you
no, I do not want to merge changes K1_AUX_DEV_ID() into patch 2/3

> should add a warning to both their commit messages that the reset
> driver will be adapted in the following patch 4.
ok, I will send a new version and add a warning message

> 
> regards
> Philipp

Link: https://lore.kernel.org/all/20251229-k3-reset-v1-0-eda0747bded3@riscstar.com/ [1]

-- 
Yixun Lan (dlan)
