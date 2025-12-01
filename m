Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88AD2620E5
	for <linux-clk@vger.kernel.org>; Mon,  1 Dec 2025 21:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764623365; cv=none; b=e9fdeH8lUZ5SK9ffjGuvTJxs1Zb+yyoos7Coxx6rgN1Co7SQyf+y43nkvJuyMetz+y65qYN92PgrRyS32vavdsVoFHPQa7IAD4J3+srd5ZgTPE8kbIEZ+DnbpWJ2eXKcsISKjISMl/RrB9sSxG5YkldYIn+WK8NIcYROf0SGntA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764623365; c=relaxed/simple;
	bh=QEFTpiA4jdcK+obzDN8LLf+OuMZ7NPIfG5FPTQGrnF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QP/FcyeNS8u+/dXWGMb2JTMnwQ/2ZerFKwa8ta/X/Ltbj5Bzy47hUquEePoxtPVG9vFRzFDqR8DSneKiY3P4XduIs5aFNJcb5QokepWMA7VRTPUwR1TSZ3sxefRkPa6NxJnLNRX5QVDbcCeVpukeon9pebH1D4t/pEAWJwmK0uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WRrtFINV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=E8i5bsll; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WRrtFINV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="E8i5bsll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764623362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8SHK0GgTMkdkR7XbF1dI3j8n6K6I3JIufMpUjg1aD5s=;
	b=WRrtFINV2L2uHwcz/6c4F4x1YMm3fCUb7RkwI6HKWN+/rSA4cxGzOugU2/Y3RuhEf7Aeah
	53A11M+9BnRkIQyaw1SQFNLJbHmFhzt+rkGP6KJRaHPtVH9wTZpdv8BN90hRdDWXN3qM3S
	jqfG0D4DCsXz5SWx/qKT0jz+Uzbqfgg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-PnBWBj0ON0asD4Ot5DL2uQ-1; Mon, 01 Dec 2025 16:09:21 -0500
X-MC-Unique: PnBWBj0ON0asD4Ot5DL2uQ-1
X-Mimecast-MFC-AGG-ID: PnBWBj0ON0asD4Ot5DL2uQ_1764623361
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b233e206ddso889882085a.3
        for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 13:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764623361; x=1765228161; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SHK0GgTMkdkR7XbF1dI3j8n6K6I3JIufMpUjg1aD5s=;
        b=E8i5bsll+dEXoNUr52dLfD5l3mvkSPqUjoWj5biGzf+znhCMRrwNQARnYoY5mkR6ll
         I5uqq9uZLJrtOJW8jXkw6xiE5Snm3UzO+3979cxuedM0hNv1hQZnO/9hXsg4eohSTDjv
         SZ9ts6HBfedW6+42AmMWGMW09ogzJXS8+XUmVzmLQ7TVahcqKTGjTP2H1nvOq8r0fg14
         qnRyak3aJWblQ/4wTFXouIsk+lp2anLYTcLnUAAyWraUeEYxFRrIhJIlR/MmuaYqepLu
         0ZE5Kn5eMVChQ3usaZY3Xa3+ZhrgJehl4dCwTrYe6pfFzyvGYlvNgirKwUllOK+RQdGH
         KE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764623361; x=1765228161;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8SHK0GgTMkdkR7XbF1dI3j8n6K6I3JIufMpUjg1aD5s=;
        b=NbzvI3Qg/SrKPNLNdG27FVj0RbDRs65agSh4cVlaumBnZmTWGJbjvXEeh5Ry/Fksgi
         mkPKCj9oUGK8BdJM48S9S7BByTzXvtibYfPndDU7CQDU78T9c8AvgGZ0/SUVNbOvsiWG
         WPld/xgLn0BkqvlTk5yypQ3zy9X9tgvEyvDf5Xms5Jc8vQDYYuee5P4mOAwI5vbOjKh9
         t8FMnmD/LoJMO6ouahPn3h9KB/59CHySC9muqlgXWnHTog89nJ4RViTnZ+KIxdcNn5Bw
         pltjl3PIsjHKgd7ml5Mk8YihCsAmH9AN+DTGWhFksrAyvPqSjw+DmIcHuGeTkG47z3n/
         bHvg==
X-Forwarded-Encrypted: i=1; AJvYcCXZgs1qhuiLj8rvTDck7UnjubzKMxHbeixmtPAi7gCjlwITtvILWj81xIj6CSOt8/TwxjcYKH8VAm4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl7RMPEaGtKsAAkJbwRQ3w6nDbf98Em/kBL5Nh6pM4P0wn3qeo
	+y24KdF4zSPWiS/JAue0BsocUm1F63zZy7aNsMjX9aik56EP2yFBhfS8uDY1tyYexHFiR+KdUwP
	hf9tI90sWxVs49rfP1SM+AIfN4PUZkWsmJAb46bs/yVvGFPeCC5Z4rLgNKgTPkA==
X-Gm-Gg: ASbGncsZ/SOJJGXA4PBFpNKdf6Ckh4TOr7UoEsQxK2iWp9JRyPC5AnjkaNl/yYNPUlT
	iMMHGSZIbq/r+sAVp/nplZW1o0itFshA5BmYbnSd39AxOYdxbLArW4gm4FkBRruShqMjr0I4uxY
	pRafXEySxg/QGKbeGzHkJs3mwcabMPb/aBqcpnlVoDotoNq0uaMMPyhMXhvabpwJdPGT9zkDsvI
	PJ1Tf1h82oGGznabjo0n0TNT30d4UoLw27pjZZcKO48WMpmaWy7qjExe5m7xVoO2dECciRxQDwv
	mbvYEJu5IHeT8ohIkVo6X7grdd4vDs3N9Zita28Q8cu9RyVF1F3hHObcXc+MipG2T8JUb1RQBf7
	axaftTKfZ
X-Received: by 2002:a05:620a:4556:b0:89f:1204:504a with SMTP id af79cd13be357-8b33d4cfb46mr182302185a.57.1764623361047;
        Mon, 01 Dec 2025 13:09:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLBXLt5R30sfkx/LSKokz5L+c4dmVBfSQ7M5hd5ZUATTNnUb4iBmqHZoGv522WLAbsmulNcA==
X-Received: by 2002:a05:620a:4556:b0:89f:1204:504a with SMTP id af79cd13be357-8b33d4cfb46mr182293785a.57.1764623360577;
        Mon, 01 Dec 2025 13:09:20 -0800 (PST)
Received: from redhat.com ([2600:382:850e:4ee7:c142:114b:2df7:89ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b52a1b75a9sm923069285a.25.2025.12.01.13.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 13:09:20 -0800 (PST)
Date: Mon, 1 Dec 2025 16:09:17 -0500
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev
Subject: Re: [PATCH 2/2] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aS4D_RsvasDQQael@redhat.com>
References: <20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9@redhat.com>
 <202511270924.0uDTpEE9-lkp@intel.com>
 <aS3X9VXVlKNQyDoz@redhat.com>
 <20251201-outpour-defame-49a3c68a362b@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-outpour-defame-49a3c68a362b@spud>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Conor and Claudiu,

On Mon, Dec 01, 2025 at 06:09:25PM +0000, Conor Dooley wrote:
> On Mon, Dec 01, 2025 at 01:01:25PM -0500, Brian Masney wrote:
> > On Thu, Nov 27, 2025 at 10:11:12AM +0800, kernel test robot wrote:
> > > Hi Brian,
> > > 
> > > kernel test robot noticed the following build errors:
> > > 
> > > [auto build test ERROR on 92fd6e84175befa1775e5c0ab682938eca27c0b2]
> > > 
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk-microchip-core-remove-duplicate-determine_rate-on-pic32_sclk_ops/20251126-035403
> > > base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
> > > patch link:    https://lore.kernel.org/r/20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9%40redhat.com
> > > patch subject: [PATCH 2/2] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> > > config: loongarch-randconfig-001-20251127 (https://download.01.org/0day-ci/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/config)
> > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202511270924.0uDTpEE9-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > >> drivers/clk/microchip/clk-core.c:12:10: fatal error: 'asm/traps.h' file not found
> > >       12 | #include <asm/traps.h>
> > >          |          ^~~~~~~~~~~~~
> > >    1 error generated.
> > > 
> > > Kconfig warnings: (for reference only)
> > >    WARNING: unmet direct dependencies detected for TSM
> > >    Depends on [n]: VIRT_DRIVERS [=n]
> > >    Selected by [y]:
> > >    - PCI_TSM [=y] && PCI [=y]
> > > 
> > > 
> > > vim +12 drivers/clk/microchip/clk-core.c
> > > 
> > > ce6e1188465998 Purna Chandra Mandal 2016-05-13 @12  #include <asm/traps.h>
> > > ce6e1188465998 Purna Chandra Mandal 2016-05-13  13  
> > 
> > I only build tested this on arm64. I'll post a v2.
> 
> MIPS I believe is where this is used.

So looking into this further, it looks like asm/traps.h is actually not
used by this driver, so I'll go ahead and drop that include in v2.

> Hmm, I think this is in a MAINTAINERS blind spot, Claudiu not CCed on
> it. We should probably do something about that. Can you CC him on v2?

Yes, I'll CC Claudiu. I don't see any existing entries in MAINTAINERS
where it looks like this driver would fit neatly.

Brian

