Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55F84A9D66
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 23:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790811672; cv=none; b=fq2Uz+fAsCsrrovecCThP0OfEEr5LxC4WVDXH8jSZ22FoBpgEQAvgzbHjPWlvApKnazWLyDtFDO3nUHI01A7aRh0xuU4GwkY0OM/YzCLuNZ1yaRNkQhDeqRI226sK/hlZjdPp1HWLcavMQn0tQmLlJDxFCXbFq/yd1yTSuGCyCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790811672; c=relaxed/simple;
	bh=3k0Zf9I7WIpUcUmHGwFy14VrJWteGborjJKrNtbtpw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9nHBynMH8BOuzUd5nA6Djn6LU+5mFQe7teH8xK2UhJvIyQh9uUcuGfx0HXgILQL8mr17vtjAzTHZsqqQqksCecmcxwxvfrxNFSptpdMkFFj6QUTKqZs2Z6kaNRKn7Rrdr44H6ns6OqtUaaQYAPnwvB0nr9XWRNTMgd5MPgYfPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S4o5t/G5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ghvKMS2d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S4o5t/G5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ghvKMS2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790811669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dxD3qjh8bcMrF3krjbsimwiCkX7NTaM6faCoDJ4Dbvw=;
	b=S4o5t/G5VzD+DolFCPA7mSFQM3oE6kACy1l46nMyIgpIBCKatm9RG0ubbsf8X11EYffKSX
	TDT8F1nEeyhPERZxCsn7juCTQVZD1A2MZTYgLuIfcOMsaKqEuqDitdWqCogVavN1h6JFFh
	iCeV5H/GdYjDmJOwNLzSNrg0ys4Tsu4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-VE_QIATZNVq1YaSU28h5Nw-1; Wed, 30 Sep 2026 19:41:06 -0400
X-MC-Unique: VE_QIATZNVq1YaSU28h5Nw-1
X-Mimecast-MFC-AGG-ID: VE_QIATZNVq1YaSU28h5Nw_1790811665
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53380b67cfdso13836321cf.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 16:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790811665; x=1791416465; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dxD3qjh8bcMrF3krjbsimwiCkX7NTaM6faCoDJ4Dbvw=;
        b=ghvKMS2dJ4XA1K44LWYrhiCLXS41z1hPzSnHMe/oK8sdcoMQQG10BDQ+RWz8ZHVzXS
         00alK5WqlvpMEweoYQsm7ukdalorQI9HSpP36R0r/k0xX4SZyBet8ZT0Ly1Pnop7acEI
         ii9BLnXxHN73cLMImyXyNL+ezqnMf5BlxhaFcVhZGx61/a8j+B5sgoSrq8wsMOSUuXt9
         u9cFLbez8hUu5e30gxSvTkM5bk9pPMCOjsPhSEJN5uPFpAA1+exqXnKqo+bhG6p/YbFs
         4smDOIWLvziRNvjMaVLDdj4Ie/f62smUYbsQGxhVojP8rBSfcoTG/vlszZ0qRBg1XOjY
         K9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811665; x=1791416465;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxD3qjh8bcMrF3krjbsimwiCkX7NTaM6faCoDJ4Dbvw=;
        b=cdksIDxdseGcUrI+Ed/2EISBB/H8ZMjhiDrptBN6uh5IAAiRaz9LjBDSiK/VlC23ec
         Mj3JrvXnIP5jjAxH8j1TAYuVy+xP22ukSlkECk2HDK4CuaNFanuA8ZdgaKYpBgRZusSj
         HNj9UTX/WTS3JOi0fJslhpdFNvbe+xlPhcHXvq6Mb3tkKQMRqUvtHGgW4N/RBJ00cUQL
         8EMJ9h7SXNlxNpZ/gbEzOVY6U/wFnPLfw6vCPYUX8Y7C1YBWTayTPgEpw7kIEm4jK9kb
         rGYY7JmyHt19YgOvIgKN1vpftjWhdYBP/5Gw/+4TpLwsdl/QFmQNVSIMavOCj+pT9boK
         Pu4A==
X-Forwarded-Encrypted: i=1; AKwUvBw1dJhysc5OYCerqk9NWZVVZuVXZ6MyRpkRZjKF90D4lpD2LZDI79zYa9i9oxYxADgGzPCkHfo4044=@vger.kernel.org
X-Gm-Message-State: AFuF++lwD4bIMDdcjx7b6/I0YinY1XUbG8AlqSu6XCKB+Rp9xbbNeVmR
	5wzzqg/0ozUD1VQZns6g5MevyVnhpcHNb8E5fKt/fVsG3EnqLjO99WaYBDG/plJUc/R8gc4NyoK
	5OhwYzqpRlpTxIe+YkClNjkup+C3hrYECmRPjY4jQ2r+UsRYh8fqn2IbH3nO80Q==
X-Gm-Gg: AYBFou0XTPOUkMXJvtMP711SVrS37eJbthrvo5FYmx/BwaSCU572O+BSpIgGsDBoXDl
	2Z+BU3EgGRKQNoQIJObTAJtcKzGGBX48zZ+JH2UYrl1on02AlGM42WANZp/V9+zSVg86okROnBJ
	l1EHn24zBCtP84oXre6HaZ1oGeatJ99Bik/lnXxKz+pAj08AuWEBPP/By772gSuQp0xh/ftu7JI
	pxYlAc7K4k8fknpnUVu/dACTGGeDdKrWHoR4yUuMTMhF6e9NNdUabos/ywg3Buzk5q/bdljfshS
	139RIGYxe5EQ7TuaxsGgRKqnAhiDT1w5XWCy1KlFtMCgbOgUUX2LAHxvrBxlWP0/4bQdiD6qEqs
	gPwf+SBTLXPLfo8CvE0eFJCyBwk/ZMThEth8=
X-Received: by 2002:a05:622a:5810:b0:530:f7aa:d424 with SMTP id d75a77b69052e-5337427d2afmr62138241cf.20.1790811665549;
        Wed, 30 Sep 2026 16:41:05 -0700 (PDT)
X-Received: by 2002:a05:622a:5810:b0:530:f7aa:d424 with SMTP id d75a77b69052e-5337427d2afmr62137831cf.20.1790811665081;
        Wed, 30 Sep 2026 16:41:05 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5338610ea32sm5532801cf.9.2026.09.30.16.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:41:04 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:41:03 -0400
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>, Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [linux-next:master 11187/12559] include/linux/stddef.h:8:14:
 error: called object is not a function or function pointer
Message-ID: <ar2eD2s6pDLd73DR@redhat.com>
References: <202610010151.2W0MrmxE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610010151.2W0MrmxE-lkp@intel.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Rosen,

On Thu, Oct 01, 2026 at 01:18:36AM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6c2cb8b8b843d216ab549b678a0d8831c43153e0
> commit: d0b72c88671b3c46342bbebc9b90280890436c98 [11187/12559] clk: mmp: allow COMPILE_TEST builds
> config: m68k-randconfig-r2308-20260930 (https://download.01.org/0day-ci/archive/20261001/202610010151.2W0MrmxE-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610010151.2W0MrmxE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610010151.2W0MrmxE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/uapi/linux/posix_types.h:5,
>                     from include/uapi/linux/types.h:14,
>                     from include/linux/types.h:5,
>                     from include/linux/of.h:14,
>                     from include/linux/clk-provider.h:10,
>                     from drivers/clk/mmp/clk-audio.c:8:
>    drivers/clk/mmp/clk-audio.c: In function 'mmp2_audio_clk_suspend':
> >> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
>     #define NULL ((void *)0)
>                  ^
>    include/linux/pm_clock.h:77:24: note: in expansion of macro 'NULL'
>     #define pm_clk_suspend NULL
>                            ^~~~
>    drivers/clk/mmp/clk-audio.c:405:2: note: in expansion of macro 'pm_clk_suspend'
>      pm_clk_suspend(dev);
>      ^~~~~~~~~~~~~~
>    drivers/clk/mmp/clk-audio.c: In function 'mmp2_audio_clk_resume':
> >> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
>     #define NULL ((void *)0)
>                  ^
>    include/linux/pm_clock.h:78:23: note: in expansion of macro 'NULL'
>     #define pm_clk_resume NULL
>                           ^~~~
>    drivers/clk/mmp/clk-audio.c:414:2: note: in expansion of macro 'pm_clk_resume'
>      pm_clk_resume(dev);
>      ^~~~~~~~~~~~~

This isn't directly a bug with your patch, however it is newly
introduced now that the driver can be compiled with COMPILE_TEST. Would
you have time to fix this up as well?

Brian

