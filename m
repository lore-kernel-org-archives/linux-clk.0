Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801A02236E3;
	Tue,  6 Jan 2026 22:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767738487; cv=none; b=dDp3Buuc0COGaidYoZgQX/1l8MJE8JVC0huS3g9aB1K+HjBQjXd1Uw7QyvcPH2IeOxwDJsYsyr2wrlFjU7GO4LLPXW9wN3kkvoB1iNcedK6vgTppBu/7WWhnWtB8oYmpTn3Cnm6MpyU+olyh3qlgGbWDLoMVEpBe7fEXh4wpwBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767738487; c=relaxed/simple;
	bh=6CiPxeQxVfJU8cdBtL7Wlr0ubBG27Af5dVrFloYcVzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7WYFnhdkIAFLCuW1Fnmiby4tdOulaX5lA2iQuBcyfhRW0rLiA3RjLN0l9/HHIUHXDLiuGj4vORpaKz74epixQlt22Z2R2oheYNcNPOZK4lCRnt3obuWbwOBjSozVn0dMYwHy2CJC6XZVq+P5xXgJ4RthG5u8siX6TN9JupNmtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7B48C340F7B;
	Tue, 06 Jan 2026 22:28:04 +0000 (UTC)
Date: Wed, 7 Jan 2026 06:27:53 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH v3 2/4] clk: spacemit: extract common ccu functions
Message-ID: <20260106222753-GYA2092678@gentoo.org>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-2-6061d9f69eef@gentoo.org>
 <a198d2d2-0c82-4c9d-abca-d17221ef1453@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a198d2d2-0c82-4c9d-abca-d17221ef1453@riscstar.com>

Hi Alex,

On 08:43 Tue 06 Jan     , Alex Elder wrote:
> On 1/3/26 1:26 AM, Yixun Lan wrote:
> > Refactor the probe function of SpacemiT's clock, and extract a common ccu
> > file, so new clock driver added in the future can share the same code,
> > which would lower the burden of maintenance. Since this commit changes the
> > module name where the auxiliary device registered, the auxiliary device id
> > need to be adjusted. Idea of the patch comes from the review of K3 clock
> > driver, please refer to this disucssion[1] for more detail.
> 
> Are all of the hunks of moved code moved without change (I
> think so)?  If so I think it's worth mentioning that.  If
> not, you should explain whatever differs, and why.  (I would
yes, no literal changes with this patch except probe() refactored,
and the real effective change is the module name changed which
I mentioned already

> expect the only thing that would have to change is making
> spacemit_ccu_probe() public.)
to make spacemit_ccu_probe() public, we move SoC specific code
out of this function which should have no functionality change..

(I think the above commit message is ok, and would not plan to send
out another version if no serious comment incoming, unless you insist)

> 
> I made one minor comment below.  I didn't verify, but I
> assume this is all just moving the code around, and based
> on that:
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> 
[snip]...
> > diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
> > index 4412c4104dab..5f05b17f8452 100644
> > --- a/drivers/clk/spacemit/ccu_common.c
> > +++ b/drivers/clk/spacemit/ccu_common.c
> > @@ -1,6 +1,177 @@
> >   // SPDX-License-Identifier: GPL-2.0-only
> >   
> > +#include <linux/clk-provider.h>
> > +#include <linux/device/devres.h>
> > +#include <linux/mfd/syscon.h>
> >   #include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/slab.h>
> > +#include <soc/spacemit/ccu.h>
> > +
> > +#include "ccu_common.h"
> > +
> > +static DEFINE_IDA(auxiliary_ids);
> 
> I'd insert a space here to make the definition above stand out a
> bit more.
> 
do you mean a blank line?
(I could do this while applying this patch since it's quite trivial..)

-- 
Yixun Lan (dlan)
