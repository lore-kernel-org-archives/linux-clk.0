Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5618EEED8
	for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2026 14:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781140; cv=none; b=Xt7q1y0PGlUoRUzZtk0rN3byMRBk3lzNMfLq5a+Mo/npl+xRSsMn6cI9AJ8ORbiTdqqyQaoBk7rdC1BvyInS64NQ3l+zLAAesLtYP8T4o5GtJ05MmPx5k8Yn9nBcyLW/dcyZ1LetZvlovalW7/JywSzkx3sLvs8T75fDml0/5gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781140; c=relaxed/simple;
	bh=QSjra5bg9ku+My/hVMHn6lvM4yG5JgbWs2lHlIq6YHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+/Gl8XNMKndnAv6Z8wSudnkoGSvgmXCz9vOl/2/2r31BPwBaU+/mIH3oUaEWBML8B6cmkt0gExDd4wmNfCFEPVh0tdR0XaDI68wjsoubxon1PrpWvizm2F1opZr81WZ91kgo8GodcRYHaMcDSFVdEx6ttOQ6cEB5Y7Nka+OJUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eI4ZEody; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DP31YRs3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eI4ZEody";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DP31YRs3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776781138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fd0pSxqVE2XBnNijY7cnmD9nWZLu9zqooCWoQGlMm3Q=;
	b=eI4ZEodyt5yWJZSv2uPKpyy+6ctuXl2znjZqVYE0M3G/0Fl1cJi2XFH6RZEkqizuwfAum1
	kFHXrt4TRGAWxTYU2CnokeozgG8SNIw2bG8aq3jVVfW7hrof8v+boWyczl33p1NCNzoXNg
	nuztk87eyaXyEqRTZQznbO7iKy3FnoA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-mK0Z48fCNTaaDgsR4BlJRA-1; Tue, 21 Apr 2026 10:18:55 -0400
X-MC-Unique: mK0Z48fCNTaaDgsR4BlJRA-1
X-Mimecast-MFC-AGG-ID: mK0Z48fCNTaaDgsR4BlJRA_1776781135
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d58bed44aso68623731cf.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2026 07:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776781135; x=1777385935; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fd0pSxqVE2XBnNijY7cnmD9nWZLu9zqooCWoQGlMm3Q=;
        b=DP31YRs32Qb4tJsjk/XBY/Dxx5F3jgqfXF8dbKrZosUwILPwz0y9R3FMR3n3Qa5VMg
         T/XIciC8IWBm3Va5pnYe/isQERKFy60x20M5b6/FHYXdlLKXGPtDIBjJ8SKY8Eg+Um6N
         k4lZTHsTuaiJxi5uZPyXTi2RIChc6rRumEPpb4g3211cHoy6ZlUd2fe4lBgxKI93lm66
         HEJBNsvQYgmF77bdp2FKyYDyi4s/jN2Cl5rgdnBXnkOnUDkYALuriWba44dCnq3tK1PY
         KzmO37NiiLGlWuw2Q6CnftqsaYR5SzH563nV5LFNPrBph0ajl8QsFIDUqjB7DC+vO3vO
         6gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776781135; x=1777385935;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fd0pSxqVE2XBnNijY7cnmD9nWZLu9zqooCWoQGlMm3Q=;
        b=eXlyHeW8GB+jyzixex6pRX/tq7HfWVsVuGk162+00dbg2Liul+phcVUVUvSNSa5p5g
         U+zcNwHHhHJRgqY/d1uBbLlYJUHOjbym319q+r4DBSfAvoAHfaIcD9wYbaikyoQd2NCb
         wzgLDg2FA1SggpvGz7x/WHL+dFJEyUCxTDKW1nx2nuARk/FKTaX6HGpDMlx3XQDH3BMr
         zBEOLbQl9oCkZTn7TFnryMWLsMjmkCNjaDnzW5ZWBHg0zzh7P/FjqV90ZGV4vXq37CCc
         78u+o+VIK1GA+adj4T1hNdc+JXPZ+fQPh+r+LKkhzDQgrng7yJB9eu9+5bGClXRUfAxw
         qOVA==
X-Forwarded-Encrypted: i=1; AFNElJ9INHhhwpKRCUgpVMTK2sjUBddouU7jAexWMDk1I8wqois7cUl7irGhgKdL3G1P8qB1AViBZy+RO7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWSgVI6i+TuhMUERInQsFXOdT36dwkXJCSQjUuP9dhC3vI451g
	xlJnXIdewTO4Tb8Wini73u9P1vZJsIx31qf+ITMvKKwedh/opo3NdFFTp4rxlLmiXcCkWNakePU
	c5W0NGgKBQw16csgtcVNKjv0f4f8mWLLToFTGLR2bvnxd17nM2sZLycm6PhcaXA==
X-Gm-Gg: AeBDiesWxfttdaOmBgH3Ng/rpJfRR+zuCsL69oSH//ktJK0Z9mi8ekletnHGq09n7a0
	J8WEP/AykmWlFxv6rvsVNx/59xOY5LeAwgEQYxkVm5TBVIjUIV3VZj5don1QhCHOnvAuGRhk3Jr
	DvTaitfkjykD/wZyUeuK1Tv7PIAKgeZWWI42Ax/GJ5nZufgdOkUJik/t4LK/bBCHG0UTYbEX0IC
	R3PTgs6Vjk6JXhdVkp3pEEuhHzveJNYbHlvEi3bknVtOu/1tChhS7sUmkf+YtYPluByaNF1mCzH
	HXvTBJcDWgGV4iZ/dAdyk9yGMu4DeP/FyoWFU3GSI0jLOg+1dWnPHCR91dTosCy2voSp9RTHI2I
	dcXzRFfrOhnv0UGIDPvPZ5kMNy1X3VO8HxHv/u8ibp8xsd/uLacEXXveqIEfFepT9vko=
X-Received: by 2002:ac8:7dc5:0:b0:50e:6054:ba with SMTP id d75a77b69052e-50e60540c69mr101241201cf.9.1776781134798;
        Tue, 21 Apr 2026 07:18:54 -0700 (PDT)
X-Received: by 2002:ac8:7dc5:0:b0:50e:6054:ba with SMTP id d75a77b69052e-50e60540c69mr101240621cf.9.1776781134080;
        Tue, 21 Apr 2026 07:18:54 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e392e4db4sm107869201cf.11.2026.04.21.07.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 07:18:51 -0700 (PDT)
Date: Tue, 21 Apr 2026 10:18:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk changes for the merge window
Message-ID: <aeeHSrZmAqE4ugXY@redhat.com>
References: <20260420183208.2287306-1-sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260420183208.2287306-1-sboyd@kernel.org>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Stephen,

On Mon, Apr 20, 2026 at 11:32:08AM -0700, Stephen Boyd wrote:
> The following changes since commit b822fb82505af4cc3f14fed05b8069c67d2ed5fb:
> 
>   dt-bindings: clock: renesas,rzg2l-cpg: Document RZ/G3L SoC (2026-03-26 19:44:48 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
> 
> for you to fetch changes up to 6b701fde9b31f085f39fc2a371cb33212fab6f68:
> 
>   Merge branches 'clk-samsung', 'clk-qcom', 'clk-round', 'clk-sai' and 'clk-cleanup' into clk-next (2026-04-16 10:12:43 -0700)
> 
> ----------------------------------------------------------------
> We've finally gotten rid of the struct clk_ops::round_rate() code after months
> of effort from Brian Masney. Now the only option is to use determine_rate(),
> which is good because that takes a struct argument instead of just a couple
> unsigned longs, allowing us to easily modify the way we determine and set rates
> in the clk tree.
> 
> Beyond that core framework change we've got the typical pile of new SoC clk
> driver additions, fixes for clk data and/or adding missing clks because the
> consumer driver using those clks wasn't ready, etc. The usual suspects are all
> here: Qualcomm, Samsung, Mediatek, and Rockchip along with some newcomers
> making RISC-V SoCs like ESWIN's eic700 and Tenstorrent's Atlantis. The clk
> driver side of this looks pretty normal.
> 
> Core:
>  - Remove the round_rate() clk op (yay!)
> 
> New Drivers:
>  - ESWIN eic700 SoC clk support
>  - Econet EN751221 SoC clock/reset support
>  - Global TCSR, RPMh, and display clock controller support for
>    the Qualcomm Eliza platform
>  - TCSR, the multiple global, and the RPMh clock controller
>    support for the Qualcomm Nord platform
>  - GPU clock controller support for Qualcomm SM8750
>  - Video and GPU clock controller support for Qualcomm Glymur
>  - Global clock controller support for Qualcomm IPQ5210
>  - Axis ARTPEC-9: Add new PLL clocks and new drivers for eight clock
>    controllers on the SoC
>  - ExynosAutov920: Add G3D (GPU) clock controller
>  - Clock driver for the Rockchip RV1103B SoC
>  - Initial support for the Renesas RZ/G3L (R9A08G046) SoC
>  - Clock and reset controllers (e.g. PRCM) in the Tenstorrent Atlantis SoC

Here's some additional patch sets that were posted this development
cycle that I feel are ready. I don't see any objections from the
community, and some such as the Mobileye series, looked like they
were going to be picked up during this development cycle.

- Feb 18 - Felix Gu <ustc.gu@gmail.com>
  [PATCH] clk: aspeed: ast2700: Add missing NULL pointer check for devm_kasprintf()
  https://lore.kernel.org/linux-clk/20260218-ast2700-v1-1-2388e0fe3597@gmail.com/

- Feb 24 - Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  [PATCH v2 0/3] clk: x86: lpss-atom: A couple of cleanups and a feature
  https://lore.kernel.org/linux-clk/20260224121159.3503754-1-andriy.shevchenko@linux.intel.com/

- Feb 24 - Shawn Guo <shawnguo@kernel.org>
  [PATCH] clk: hisilicon: reset: Use kzalloc instead of kmalloc
  https://lore.kernel.org/linux-clk/20260224021912.54365-1-shawnguo@kernel.org/

- Mar 3 - "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
  [PATCH v2] clk: hisilicon: Improve deallocation in error path
  https://lore.kernel.org/linux-clk/20260303-hisi-error-v2-1-7cd9b43d8fbb@posteo.net/

- Mar 12 - Peng Fan <peng.fan@oss.nxp.com>
  [PATCH v9 0/6] clk: Support spread spectrum and use it in clk-scmi
  https://lore.kernel.org/linux-clk/20260312-clk-ssc-v7-1-v9-0-0a9d2e188d9e@nxp.com/

- Mar 25 - Rosen Penev <rosenp@gmail.com>
  [PATCH] clk: visconti: pll: use kzalloc_flex
  https://lore.kernel.org/linux-clk/20260326042317.122536-1-rosenp@gmail.com/

- Mar 25 - Rosen Penev <rosenp@gmail.com>
  [PATCH] clk: bcm: iproc-asiu: simplify allocation
  https://lore.kernel.org/linux-clk/20260326045324.240150-1-rosenp@gmail.com/

- Mar 25 - Rosen Penev <rosenp@gmail.com>
  [PATCH] clk: clk-max77686: kzalloc + kcalloc to kzalloc
  https://lore.kernel.org/linux-clk/20260326052847.335089-1-rosenp@gmail.com/

- Mar 25 - Benoît Monin <benoit.monin@bootlin.com>
  Mobileye EyeQ7H
  This message lists the merge strategy for 3 different patch sets.
  https://lore.kernel.org/linux-clk/2786053.vuYhMxLoTh@benoit.monin/

- Mar 31 - Rosen Penev <rosenp@gmail.com>
  [PATCHv3] clk: hisilicon: clkdivider-hi6220: use kzalloc_flex
  https://lore.kernel.org/linux-clk/20260401023551.27978-1-rosenp@gmail.com/

- Apr 3 - Rosen Penev <rosenp@gmail.com>
  [PATCHv2] clk: mvebu: use kzalloc_flex
  https://lore.kernel.org/linux-clk/20260403194701.11902-1-rosenp@gmail.com/

- Apr 7 - Johan Hovold <johan@kernel.org>
  [PATCH] clk: rk808: fix OF node reference imbalance
  https://lore.kernel.org/linux-clk/20260407095027.2625516-1-johan@kernel.org/

I know it's getting late in the merge window, but if possible, it would
be nice to get these in via a second pull.

I don't want to hold up this pull since everything there looks fine.

Thanks,
Brian

