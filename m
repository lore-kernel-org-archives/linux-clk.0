Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AD91D555;
	Sat,  3 Jan 2026 01:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767405534; cv=none; b=jb4tkdPrBNrrVfVFd+lubILYf/C4pVvbyPdRneTOvlkphyM5teY1LnzmOSMB5Ru/1CbWBJz5Ud5XmF6HoOYe9kAw+XsKLTimhpv9ndL0ce1o89Al8zaKSQlPtbWCDCgUcgJhQRfHCJVEZBDZ1DqJB7TkELvSbH0t+7dJyXJc/go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767405534; c=relaxed/simple;
	bh=23zNtDxWyBX6HS9V9mpDSlycmlai8rIbmU1moexLUPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zxf76qSkr42VexjS44+pnV9RxHdF9+RonPAMAPO5OHdvaNqRqTeATiDDLhj4N7SiwC1JQBRgEj5lSUsQxhlJMMONnNJ+JRnHLIqpL7W6xjWsaBTjmB66XWgkYP7aXs+QyjUcB3cupKDdI2MnwZfzsLEp8NoE+UbMUS+k+5+mOV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 28519341455;
	Sat, 03 Jan 2026 01:58:51 +0000 (UTC)
Date: Sat, 3 Jan 2026 09:58:42 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/3] clk: spacemit: prepare common ccu header
Message-ID: <20260103015842-GYA2060612@gentoo.org>
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-1-28b59418b4df@gentoo.org>
 <17c27455-897d-4249-8206-88364230af7d@riscstar.com>
 <20260101143810-GYC2019108@gentoo.org>
 <cc1cb833-2c4a-4e20-a50d-109a4919e274@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc1cb833-2c4a-4e20-a50d-109a4919e274@riscstar.com>

Hi Alex,

On 09:42 Fri 02 Jan     , Alex Elder wrote:
> On 1/1/26 8:38 AM, Yixun Lan wrote:
> > Hi Alex,
> > 
> > On 18:50 Mon 29 Dec     , Alex Elder wrote:
> >> On 12/26/25 12:55 AM, Yixun Lan wrote:
> >>> In order to prepare adding clock driver for new SoC, extract common
> >>> ccu header file, so it can be shared by all drivers.
> >>
> >> You are moving the definition of the SpacemiT CCU auxiliary
> >> device structure, plus the to_spacemit_ccu_adev() function,
> >> into a new header file.
> > yes, and this is explaining the code which I consider not necessary,
> > it's more obvious to read the code..
> > 
> >> The reason you're doing this is
> >> because these two things are generic, but they're defined
> >> in the K1 SoC-specific header file "k1-syscon.h".  So you
> >> are creating a new header file for this purpose.
> >>
> > right
> >> These are things you should explain here, to help orient
> >> reviewers and will inform anyone in the future looking at
> >> commit history.
> > I thought I've explained the goal/motivation already with above
> > commit message, maybe I can improve it, so how about:
> > 
> > In order to prepare adding clock driver for new K3 SoC, extract generic
> > code to a separate common ccu header file, so they are not defined
> > in K1 SoC-specific file, and then can be shared by all drivers.
> 
> This would be much better.  You don't need to explain every detail
> of the code, but providing the motivation this way and explaining
> it at a high level helps the reader a lot.
> 
> >>> Also introduce a reset name macro, so it can be both used in clock
> >>> and reset subsystem, explicitly to make them match each other.
> >>
> >> This should go in a separate patch, and should change the
> >> code to use the macro so it builds and continues to function
> >> with the new change place.
> >>
> > yes, I could do this in a separate patch
> > 
> >> However I don't understand why you think it's necessary to
> >> introduce the reset name macro.  Is it because you want to
> >> incorporate an SoC identifier in the name?
> >>
> > I've explained here:
> > https://lore.kernel.org/r/20251231020951-GYA2019108@gentoo.org
> > 
> > It's necessary to incorporate the SoC identifier which will help
> > to differentiate K1 and K3 reset driver, otherwise there will be
> > driver name collision, lead to reset driver probe failure while
> > adding K3 SoC ..
> 
> I just had a talk with Guodong and he helped clear up a
> misunderstanding I had about this.  I was thinking about
> what happens at probe time, and that only the K1 or the
> K3 CCU will get registered.
> 
> But he explained that the issue is that two *drivers* claim
> to support the same "compatible" auxiliary device name, and
> even if only the K1 CCU got registered, both reset drivers
> are available in the kernel and you still need to specify
> which reset driver you want use.
> 
> You are implementing both the K1 and K3 reset code in the
> same module, which I think is why this is necessary.
> 
> >> Even if this is your reason, I still don't think you need
> >> the macro.  I'll try to explain what I mean in the
> >> next patch.
> >>
> > If you still have concerns, and we can't reach certain agreement,
> > then I could drop this macro in next version, leave this optimization
> > to future patches, I don't want main clock driver delayed by it.
> 
> No I no longer have concerns and I accept that you need to
> encode the platform/SoC in the reset auxiliary device name.
> 
> > I personally tend to keep the macro, but probably the naming need some
> > improvement..
> 
> What I'd prefer is to just name the resets directly, to encode the
> platform ("k1" or "k3") where defined.  I.e.,
> 
>   static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
> -	.reset_name	= "mpmu-reset",
> +	.reset_name	= "k1-mpmu-reset",
ok, I will go this way
>   	.hws		= k1_ccu_mpmu_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
>   };
> 
> Does this lead to a problem somewhere else?  What does hiding
> this convention behind the _K_RST() macro do that's better
> than this?  Is it because you want the separate clock and
> reset drivers to use the same convention?
yes, I was planing to use same convention for clock and reset

> 
> I think it's a little more difficult to talk about this because
> we're talking about changes that are implemented by two separate
> patch series.
that's true

> 
> >> One more comment, below.
> >>
> >>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> >>> ---
> >>>    include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
> >>>    include/soc/spacemit/k1-syscon.h | 13 +++----------
> >>>    2 files changed, 24 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/include/soc/spacemit/ccu.h b/include/soc/spacemit/ccu.h
> >>> new file mode 100644
> >>> index 000000000000..84dcdecccc05
> >>> --- /dev/null
> >>> +++ b/include/soc/spacemit/ccu.h
> >>> @@ -0,0 +1,21 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>> +
> >>> +#ifndef __SOC_SPACEMIT_CCU_H__
> >>> +#define __SOC_SPACEMIT_CCU_H__
> >>> +
> >>> +#include <linux/auxiliary_bus.h>
> >>> +#include <linux/regmap.h>
> >>> +
> >>> +/* Auxiliary device used to represent a CCU reset controller */
> >>> +struct spacemit_ccu_adev {
> >>> +	struct auxiliary_device adev;
> >>> +	struct regmap *regmap;
> >>> +};
> >>> +
> >>> +static inline struct spacemit_ccu_adev *
> >>> +to_spacemit_ccu_adev(struct auxiliary_device *adev)
> >>> +{
> >>> +	return container_of(adev, struct spacemit_ccu_adev, adev);
> >>> +}
> >>> +
> >>> +#endif /* __SOC_SPACEMIT_CCU_H__ */
> >>> diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
> >>> index 354751562c55..13efa7a30853 100644
> >>> --- a/include/soc/spacemit/k1-syscon.h
> >>> +++ b/include/soc/spacemit/k1-syscon.h
> >>> @@ -5,17 +5,10 @@
> >>>    #ifndef __SOC_K1_SYSCON_H__
> >>>    #define __SOC_K1_SYSCON_H__
> >>>    
> >>> -/* Auxiliary device used to represent a CCU reset controller */
> >>> -struct spacemit_ccu_adev {
> >>> -	struct auxiliary_device adev;
> >>> -	struct regmap *regmap;
> >>> -};
> >>> +#include "ccu.h"
> >>>    
> >>> -static inline struct spacemit_ccu_adev *
> >>> -to_spacemit_ccu_adev(struct auxiliary_device *adev)
> >>> -{
> >>> -	return container_of(adev, struct spacemit_ccu_adev, adev);
> >>> -}
> >>> +/* Reset name macro, should match in clock and reset */
> >>> +#define _K_RST(_unit)			"k1-" #_unit "-reset"
> >>
> >> The generic-sounding _K_RST() encodes "k1" in the name,
> >> and it shouldn't.  Also, why do you use the underscore
> >> prefix?
> >>
> > want to make it slightly generic/short but still keep it local for K1 driver,
> > and also avoid potential collision with other drivers in kernel code..
> > 
> > or do you have any sugestion for better naming?
> 
> First, I suggest you avoid even using such a macro.  But I
> could be wrong about that too...
> 
ok, see previous comment
> I would name it RESET_NAME(_unit) or something similar.  It's
> only used by code and DTS files that are related to SpacemiT
> platforms.
> 
will drop the macro

thanks!
> 					-Alex
> 
> >> Anyway, I'll keep reading.
> >>
> >> 					-Alex
> >>
> >>>    
> >>>    /* APBS register offset */
> >>>    #define APBS_PLL1_SWCR1			0x100
> >>>
> >>
> >>
> > 
> 

-- 
Yixun Lan (dlan)
