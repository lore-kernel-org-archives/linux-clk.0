Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E561C862F
	for <linux-clk@vger.kernel.org>; Sun, 28 Sep 2025 00:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759019819; cv=none; b=EYqoxgiQmXy483F/AvOLaO5Hz1geFWQeZB8LMtKItqvjBeaVW+boAQmQ8UE1TJQkQAjdBFpcqXEMwmt7bfdDWfiihZGBLmF0jf4Dg/rI54eGphGaLOo9oq7q3qajzKXHriSKFxCAhDp2VPA/A4E3F9R3rUoSVvB4NA3cMiHeRDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759019819; c=relaxed/simple;
	bh=Ec3kGgJVgDN67m3fNTnX3j9uPixMabkIMaDfK0v9Nc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkVibS18CRY7FnBy7HyqAeTgLi3JYKanzMgBKzTngZ18BZTmUzzQ4Qs1wjrAb+UBZIq47r2Cg5N5bbl+SyRv56sKXDgo5P8sIWGYURVEtRTU+ZtTWoOY6KItXKQrQUYvEeiQk4MvO/GT7LU34h62+15G2ptpJ3GyRUt0y3/3g+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fqdm0ScC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fqdm0ScC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759019817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o9p0c5xcfOvo18Ej2qFhdgXJdkGOw9xcm/Iggm49n5M=;
	b=fqdm0ScCghVY/gUs8COHvDPGkRbQjFfMN7kLn0yy4NuCwX2f6YucWTfkwz8AXoxpre3dXM
	Kcrjd4hCCnXDiiWu+n7O/iCm2pGczbJ+NoAi8vpNXRqwfzAiBNOvWiTCLo9denJqtUlXqM
	tOucHcRMUmw+3so8JgGE+oUAheJ5tm0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-VBAIL_kTMEO7X1-BWv89TQ-1; Sat, 27 Sep 2025 20:36:55 -0400
X-MC-Unique: VBAIL_kTMEO7X1-BWv89TQ-1
X-Mimecast-MFC-AGG-ID: VBAIL_kTMEO7X1-BWv89TQ_1759019814
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dd6887656cso55177271cf.3
        for <linux-clk@vger.kernel.org>; Sat, 27 Sep 2025 17:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759019813; x=1759624613;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9p0c5xcfOvo18Ej2qFhdgXJdkGOw9xcm/Iggm49n5M=;
        b=BohaZOlUXgxjIXXW7N//VKW9r9Y4h2FgPA7y0PzeYHbsB5P6esXx2FaqJwfVSBW9JH
         zGaPkNUqTekNYpQcjkoW0YVVISixjpeZEbbq2HGwOMlBotFHWEUWbTEc8ZWCu60DHho9
         EwEayDLjv2rub38vM4bg45DoiqCK7D583KzQuduxHPB2hhQxTXRueqLp21B4RyLqlMcD
         tijlrUx2eecwGJwuS6oAyqh7lBbMCUuGJBt4LN/oxTMUTR4oyVHC23vYmad3wyH9PZAB
         yq+5lwyTz3JAq0bgAqPsLCR867HH1BhNxQmgXaODpdq0S2Ajzx39xNbIDZgGKEgvaPgp
         +cNw==
X-Forwarded-Encrypted: i=1; AJvYcCV5o6KI8MVc00ogzuHQQOYkInb0p2/X6pQR6Hl9nnvbyKdOVxj76XOo1URTXY4XJ0p6aV3IRL4ElPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMRqVoKy4oyihBBvX6fJl8VixIlxEaWTWJRC9Uvj4Do8zTMqlK
	1b3/JcMR2vcixYZRyj4OYIMJoOsdX1hsPjDQhXiEvm49l+idobfUj/07HMUp8iNUvUQaL+rvVol
	pf3W0cqLnUIyKpjrCXImQLQaQV+dPAG0oRQATPtGpQ7M2LMVIJiHBmUPi0CtXj80KdGPP9g==
X-Gm-Gg: ASbGnctxUceqJTV+NZ3lYnBfkmfh3FUO2G3yDAi1w/IIJtefJ6sUhhsIkkmqO52W2aN
	sZcB/BqzZy6n8zEogkIYXpbZU8XypH0erNQsRXLbEobb/wjYoBDORFfz3SfJS/XtywY6l07nSq6
	RAcrIyM1wVmIcJ289Ru4fr5aoeFFcUnCaNXzPRcskcF0Sw/skz2zCHLdv5sRZDRdeQppkxNvVrA
	eldEaHyKTt8kZF0BSjVP68j2YONzf7tRLPQeC2LPlofIA9nqg7ZxS6aZTBKTFzuj0bBReGrqglA
	raduaAleqCkPVrDhNRFoUy6gXsIoWISLW0tMRSAMFoSPnXawIYbYRrS8kx43vkWR87O0hMoUW2T
	1d5SN3tfTFdGwmodpUp0ZOx1ToIxj9KU=
X-Received: by 2002:ac8:5716:0:b0:4b7:a62d:ef6f with SMTP id d75a77b69052e-4da4d314d23mr77691611cf.64.1759019813695;
        Sat, 27 Sep 2025 17:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6dBVU/UYTrTLhQQPy01sIboyLnnzG/mRBTs7ELQ0XPPLeHKR9n1q4ChDRNNNKAFi28WoAuA==
X-Received: by 2002:ac8:5716:0:b0:4b7:a62d:ef6f with SMTP id d75a77b69052e-4da4d314d23mr77691521cf.64.1759019813331;
        Sat, 27 Sep 2025 17:36:53 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db0b9458e1sm47109601cf.15.2025.09.27.17.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 17:36:51 -0700 (PDT)
Date: Sat, 27 Sep 2025 20:36:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: Re: [linux-next:master 6189/12740]
 drivers/clk/microchip/clk-core.c:391:12: error: redefinition of
 'roclk_determine_rate'
Message-ID: <aNiDIa3o2QLuCHzD@redhat.com>
References: <202509280327.jsapR0Ww-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509280327.jsapR0Ww-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Sun, Sep 28, 2025 at 03:48:14AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   262858079afde6d367ce3db183c74d8a43a0e83f
> commit: e9f039c08cdc9b38665aee9a88ae21f59c09ba8c [6189/12740] clk: microchip: core: convert from round_rate() to determine_rate()
> config: mips-randconfig-r131-20250927 (https://download.01.org/0day-ci/archive/20250928/202509280327.jsapR0Ww-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509280327.jsapR0Ww-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509280327.jsapR0Ww-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/microchip/clk-core.c:391:12: error: redefinition of 'roclk_determine_rate'
>      391 | static int roclk_determine_rate(struct clk_hw *hw,
>          |            ^
>    drivers/clk/microchip/clk-core.c:377:12: note: previous definition is here
>      377 | static int roclk_determine_rate(struct clk_hw *hw,
>          |            ^
> >> drivers/clk/microchip/clk-core.c:411:18: error: call to undeclared function 'roclk_round_rate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      411 |                 nearest_rate = roclk_round_rate(hw, req->rate, &parent_rate);
>          |                                ^
>    drivers/clk/microchip/clk-core.c:926:20: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
>      926 |         .determine_rate = __clk_mux_determine_rate,
>          |                           ^~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/clk/microchip/clk-core.c:922:20: note: previous initialization is here
>      922 |         .determine_rate = sclk_determine_rate,
>          |                           ^~~~~~~~~~~~~~~~~~~
>    1 warning and 2 errors generated.

I fixed this with:

https://lore.kernel.org/linux-clk/20250927-clk-microchip-core-compile-error-v2-1-3473dbae3625@redhat.com/T/#u

Sorry I had to send out a v2 with the tags.

Stephen: Since the original change hasn't landed in Linus's tree yet,
it's up to you if you want to squash this fix with my original commit.

Brian

