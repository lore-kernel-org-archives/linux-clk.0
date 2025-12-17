Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC3C30C624
	for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 22:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766012032; cv=none; b=XPO+aT1jB/y8Gxix1THqzBwPm4s54Fefl+jaypHSRh59P5FjE0tzN7rzqWxAxMKAGVlaNhTB2SCMj4QcEhDGsjJsQLYoL2zshJZfRluAcB0jwvqKyoQkV+XYQzujLkyGAJWwsR5uJJva6rZ9MCItKIfALLlIT/BCh8wulXYyYmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766012032; c=relaxed/simple;
	bh=wrsa5hImt9ys+Pi+4ibjKij5Rrx99H8+r8TMmkVYJNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hg7QtDZunQxdVfGF4NM3GHAnQW79SbygSRKvwYbDYPLD4n1nVspKcOjDiQbqEEbwse3JVksSiHPx2cgpxgOTVB6gY1MrMXTj8GuZsNkKjpToUiol+sSnOIzQnHdviZxnfh8mVbBrVHBVZSzgnAP01vbmIdjxPA3xrzHJTC3ghKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EBA1F340D31;
	Wed, 17 Dec 2025 22:53:49 +0000 (UTC)
Date: Thu, 18 Dec 2025 06:53:45 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2] clk: spacemit: Fix module build for spacemit common
 ccu driver
Message-ID: <20251217225345-GYA1943598@gentoo.org>
References: <20251216233514.646263-1-inochiama@gmail.com>
 <20251217001833-GYE1903981@gentoo.org>
 <aUH46Rqb-bzsqUn_@inochi.infowork>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUH46Rqb-bzsqUn_@inochi.infowork>

Hi Inochi,

On 08:33 Wed 17 Dec     , Inochi Amaoto wrote:
> On Wed, Dec 17, 2025 at 08:18:33AM +0800, Yixun Lan wrote:
> > Hi Inochi, 
> > 
..
> > > +MODULE_IMPORT_NS("SPACEMIT_CCU");
> > the name should be ok as long as no collision and unique, but..
> > I personally would prefer "CLK_SPACEMIT" which follow "subsytem + vendor"
> > 
> 
> I disagree with you, after doing a grep, I found it is more common to
> use "vendor + xxx" format.
> 
I do not have strong preference, as I said on condition that it's unique,
and I do see Allwinner driver using "SUNXI_CCU" (driver/clk/sunxi-ng)

so if clock maintainer have no objection and don't want any enforcement,
then it would be fine by me

> 
> > > +MODULE_LICENSE("GPL");
> > I've got a comment [1] from Ziyao in the review of K3 clock driver
> > that suggest to distill the common probe function, which make sense.
> > So, I plan to have separated ccu_common.c file, with this change,
> > it would be more proper to put MODULE_DESCRIPTION/MODULE_LICENSE
> > into that file
> > 
> > It might takes some time to get there, as I now got a weird panic/hang
> > issue with that change..
> > 
> > Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie/ [1]
> > 
> 
> I have seen the K3 driver, but I think it is still necessary to add
> this line to this file. As this is a fix and it may be ported to the
> other version if got merged. So it is better to just add these line
> in the  ccu_pll.c and then you can move them in the file you desired.
> 
fair, let's push this first, then I'll try to refactor on top of it

thanks
-- 
Yixun Lan (dlan)
