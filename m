Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5917A179A3;
	Thu,  1 Jan 2026 14:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767278303; cv=none; b=mkxkxGk4j0Avq6ZGaHXR0IGI9XzcHqdzTnWlJ4glkl1W5tTfQTn7obYbIa2SblLpNTptfL/LmRLPc8qkeCYIY25dz4fcml7j+0gCMgHZ45ebTLpFtKE9uFTGCAW7G2tqTfCJHLOrB+OrFwYHxQxEu2Z+O1FbobpGHpZE6/YXnfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767278303; c=relaxed/simple;
	bh=T47W/F1l2yWVLSGFayW2suCfigXYHmLyi9rRC0ZXRcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eepcaFblNs/Z0L3R1hK3I72mlSAIB3m/8USxrxjmsYD1ePxe7OSu1FInQyinkEfYHBsVjtOdeDLs/+OF5TLYWO4c5xdx6SBrll1e9/PFwgud0LPDdkT0DWaoOwQ7MkxUKgSFKA+n78p7Efr1xmEv3eMJI9p8mkExsYlkBin9+F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4F0583415D6;
	Thu, 01 Jan 2026 14:38:21 +0000 (UTC)
Date: Thu, 1 Jan 2026 22:38:10 +0800
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
Message-ID: <20260101143810-GYC2019108@gentoo.org>
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-1-28b59418b4df@gentoo.org>
 <17c27455-897d-4249-8206-88364230af7d@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17c27455-897d-4249-8206-88364230af7d@riscstar.com>

Hi Alex,

On 18:50 Mon 29 Dec     , Alex Elder wrote:
> On 12/26/25 12:55 AM, Yixun Lan wrote:
> > In order to prepare adding clock driver for new SoC, extract common
> > ccu header file, so it can be shared by all drivers.
> 
> You are moving the definition of the SpacemiT CCU auxiliary
> device structure, plus the to_spacemit_ccu_adev() function,
> into a new header file.  
yes, and this is explaining the code which I consider not necessary,
it's more obvious to read the code..

> The reason you're doing this is
> because these two things are generic, but they're defined
> in the K1 SoC-specific header file "k1-syscon.h".  So you
> are creating a new header file for this purpose.
> 
right
> These are things you should explain here, to help orient
> reviewers and will inform anyone in the future looking at
> commit history.
I thought I've explained the goal/motivation already with above
commit message, maybe I can improve it, so how about:

In order to prepare adding clock driver for new K3 SoC, extract generic
code to a separate common ccu header file, so they are not defined
in K1 SoC-specific file, and then can be shared by all drivers.

> 
> > Also introduce a reset name macro, so it can be both used in clock
> > and reset subsystem, explicitly to make them match each other.
> 
> This should go in a separate patch, and should change the
> code to use the macro so it builds and continues to function
> with the new change place.
>
yes, I could do this in a separate patch

> However I don't understand why you think it's necessary to
> introduce the reset name macro.  Is it because you want to
> incorporate an SoC identifier in the name?
> 
I've explained here:
https://lore.kernel.org/r/20251231020951-GYA2019108@gentoo.org

It's necessary to incorporate the SoC identifier which will help
to differentiate K1 and K3 reset driver, otherwise there will be
driver name collision, lead to reset driver probe failure while
adding K3 SoC ..

> Even if this is your reason, I still don't think you need
> the macro.  I'll try to explain what I mean in the
> next patch.
> 
If you still have concerns, and we can't reach certain agreement,
then I could drop this macro in next version, leave this optimization
to future patches, I don't want main clock driver delayed by it.

I personally tend to keep the macro, but probably the naming need some
improvement..

> One more comment, below.
> 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >   include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
> >   include/soc/spacemit/k1-syscon.h | 13 +++----------
> >   2 files changed, 24 insertions(+), 10 deletions(-)
> > 
> > diff --git a/include/soc/spacemit/ccu.h b/include/soc/spacemit/ccu.h
> > new file mode 100644
> > index 000000000000..84dcdecccc05
> > --- /dev/null
> > +++ b/include/soc/spacemit/ccu.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef __SOC_SPACEMIT_CCU_H__
> > +#define __SOC_SPACEMIT_CCU_H__
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/regmap.h>
> > +
> > +/* Auxiliary device used to represent a CCU reset controller */
> > +struct spacemit_ccu_adev {
> > +	struct auxiliary_device adev;
> > +	struct regmap *regmap;
> > +};
> > +
> > +static inline struct spacemit_ccu_adev *
> > +to_spacemit_ccu_adev(struct auxiliary_device *adev)
> > +{
> > +	return container_of(adev, struct spacemit_ccu_adev, adev);
> > +}
> > +
> > +#endif /* __SOC_SPACEMIT_CCU_H__ */
> > diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
> > index 354751562c55..13efa7a30853 100644
> > --- a/include/soc/spacemit/k1-syscon.h
> > +++ b/include/soc/spacemit/k1-syscon.h
> > @@ -5,17 +5,10 @@
> >   #ifndef __SOC_K1_SYSCON_H__
> >   #define __SOC_K1_SYSCON_H__
> >   
> > -/* Auxiliary device used to represent a CCU reset controller */
> > -struct spacemit_ccu_adev {
> > -	struct auxiliary_device adev;
> > -	struct regmap *regmap;
> > -};
> > +#include "ccu.h"
> >   
> > -static inline struct spacemit_ccu_adev *
> > -to_spacemit_ccu_adev(struct auxiliary_device *adev)
> > -{
> > -	return container_of(adev, struct spacemit_ccu_adev, adev);
> > -}
> > +/* Reset name macro, should match in clock and reset */
> > +#define _K_RST(_unit)			"k1-" #_unit "-reset"
> 
> The generic-sounding _K_RST() encodes "k1" in the name,
> and it shouldn't.  Also, why do you use the underscore
> prefix?
> 
want to make it slightly generic/short but still keep it local for K1 driver,
and also avoid potential collision with other drivers in kernel code..

or do you have any sugestion for better naming?
> Anyway, I'll keep reading.
> 
> 					-Alex
> 
> >   
> >   /* APBS register offset */
> >   #define APBS_PLL1_SWCR1			0x100
> > 
> 
> 

-- 
Yixun Lan (dlan)
