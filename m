Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A0D309EE2
	for <linux-clk@vger.kernel.org>; Mon,  1 Dec 2025 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764612101; cv=none; b=XvhhuGAEdckNwMH2VM5KfJql4LCbZixFBnlVAAjzK+X2z/Mlpnts+rDbCdDQhJkIOix7Ecq4LEMie7u/dntWuwzjVMjzrilZg3DKZhqAQIQPfifdoQSLoq6oY7DC5uBV9OblopAMCnWrrw1lUoBplzlpLciHDS0W3ywVoYRevkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764612101; c=relaxed/simple;
	bh=Cl5MfZTmygfRTiyyEyEUElbsEfjllDUBjhPeeZiTfkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOWVStYtqffGmEoi04TUNv3W3CLC+8kISiVq34n4/V4DsBew5KK302q6Q3VR6scqQ1RTgf0jG9RN/EbNr8/kzuqUkDmrhDopQvnEm0V2/t7v3VGapdtv23lmcjmrEDCzujW3KF+NOlUFyzlIY4JbxFhbOe6R2QsSfn23qL+Szj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LMJgiBO+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TnnXz8dD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LMJgiBO+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TnnXz8dD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764612099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cNpwF+vE1biwEuxq5v/m4qt1meHle77L6rU4xp3q9yw=;
	b=LMJgiBO+r8BmYuLMWpz9z/u706x5Wn7EkLaVsVdxgWhjLkjVw/aqXFkP3o01kEvnH8AYS3
	/MaGfgesIymlOBhrc2fdG8d8Fixwm/dCWYEqMZOzRE3F/BxSOG1jOF7+1wbj3pVWMTsGm2
	kIxZcpDAG0ieVNeyRYlkx4COyslslNU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-tYPOtIyhPOWK1PLtORppMQ-1; Mon, 01 Dec 2025 13:01:35 -0500
X-MC-Unique: tYPOtIyhPOWK1PLtORppMQ-1
X-Mimecast-MFC-AGG-ID: tYPOtIyhPOWK1PLtORppMQ_1764612094
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2de6600c0so1036755485a.1
        for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 10:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764612094; x=1765216894; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNpwF+vE1biwEuxq5v/m4qt1meHle77L6rU4xp3q9yw=;
        b=TnnXz8dDYvWtzB+FWgw8KksFxU2p6kdY3d0G1m3WmDRL1L1439QnIP6ZT5503zRAYh
         jhZ05jjkJeDxDaRZnqX/FUpP/BUS6bnAFbAmwLbLS6Y32P8JqdpO9prEFQ3cCX00lciX
         wHMlzU3enpItYUSP6RJecNhqwQxYaXYVvQz6ixKzo3NMqbTEwVLQV4TuMlSxPiLkk3p8
         Ev9Nt6BkAKCi/nSFJWCz0fKvTHdG5M6ZdrcLCmueLxA3JiZkO6OtZGkU49ljsnDtn+uO
         20vZNQiQEHZbDT1FlQOdP71TLnMLwjPP291HCfvwEW5nbxX5XBY992kaELPhhU8HRgxO
         xz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764612094; x=1765216894;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cNpwF+vE1biwEuxq5v/m4qt1meHle77L6rU4xp3q9yw=;
        b=CABXcEgY2xOb3zuSWSvdm2+v1tDB8UXXjrNb/Dyqhu9qO8a91Xk+etCBpCAvXi1oxS
         zK9NGDyvRfl3RTM8ss2J7c+fgREMVUSHI0qC3kzMUoz+ZjuHd0PHDEW2BKbdyc9K7nid
         kIG6G3Z6v2EVrNm4YudHUtkBDBZ0S2IF3OorkjuX6LV9ck0uAI3n9rJy5R4ZI6eZ1iyT
         OQ4fvztzOblHgYx1xonMxoEIhAXV1IjblVEo5IMhAfbsiYVefSag/YKSUcemaCEN+S0R
         t9sdF7eWzABcuJ6zwuBufI0UjJs9Sg/ydfmUKSFdOUip1U2J1o1bjCj/ejoynMVvNxAb
         Drpw==
X-Forwarded-Encrypted: i=1; AJvYcCWItLyjRRWy1kA/+1aBLAh5lcSp5NiRZ13z4auHIi5WR1eZsaq9nHFNxUgVXWyXrK4QVRFOb1QrDZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjuyqRpM9Ex/Amt+ovcMZ+2wqgHhBNeqxcNQkcPLHxxHEanyRb
	PjjQMlyxKSR803KDqcTliyJyV3D6CJF847Glh8PDyDBsU4IySQ8ExS3MJE6V+hD9x5AS5pCMdhY
	R97qQX+xUeGcJf7y0i2KP9V4NxgJ2RJob3XgN0r1ZyWVfh8KcC/NUhokJ7RE4uw==
X-Gm-Gg: ASbGncs4mY4I5x81kaH49O0xchOU9jvmjvW2uXJTDwL6k/3irLP98kuFhQkoyUtQCwM
	NYsq7KgG4D2S95VT62t8ehJAg9i0cA7A1sNp/xKKWd28diQNc5Ss3Q/gUa1hcaX1zgz/0T5cMIE
	KRq6midhfu57PgWgVBKny+91ng4g5PiTmm1/gXgpSAV52OhDh7kpqhPZP+pgP9M2LGcrVPBwpCd
	TYa+BJhNdDt4ln1/GqsdPDF2N99RVGkL/ZMqPIXZ8TCMeNQ9pYxK5ujMoBxkrMAhrrKrNlVh9u+
	ZEF7fHFWEw81Jvc6Kb6ff8XHHCzZvudPwwq7a8dpJVCMcgT9nK0/6NomFNCj0ojjJ2nLyY/8Q4u
	yRfInTUR7162kFP7p5OR7fqcmEYkWmMUs/36SOPt23WE/
X-Received: by 2002:a05:622a:1394:b0:4ee:1b36:b5b4 with SMTP id d75a77b69052e-4ee5883fc8cmr441494861cf.15.1764612093607;
        Mon, 01 Dec 2025 10:01:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFka/sclAcykb4EafMCqkmrz+Srgtgtrntu+M3uKtzXPbszU0pI6Loxjqn7JQekjtJjw+Qepw==
X-Received: by 2002:a05:622a:1394:b0:4ee:1b36:b5b4 with SMTP id d75a77b69052e-4ee5883fc8cmr441492521cf.15.1764612089955;
        Mon, 01 Dec 2025 10:01:29 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd2fbb8d1sm79292921cf.9.2025.12.01.10.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 10:01:28 -0800 (PST)
Date: Mon, 1 Dec 2025 13:01:25 -0500
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aS3X9VXVlKNQyDoz@redhat.com>
References: <20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9@redhat.com>
 <202511270924.0uDTpEE9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511270924.0uDTpEE9-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Nov 27, 2025 at 10:11:12AM +0800, kernel test robot wrote:
> Hi Brian,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 92fd6e84175befa1775e5c0ab682938eca27c0b2]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk-microchip-core-remove-duplicate-determine_rate-on-pic32_sclk_ops/20251126-035403
> base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
> patch link:    https://lore.kernel.org/r/20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9%40redhat.com
> patch subject: [PATCH 2/2] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> config: loongarch-randconfig-001-20251127 (https://download.01.org/0day-ci/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511270924.0uDTpEE9-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/microchip/clk-core.c:12:10: fatal error: 'asm/traps.h' file not found
>       12 | #include <asm/traps.h>
>          |          ^~~~~~~~~~~~~
>    1 error generated.
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for TSM
>    Depends on [n]: VIRT_DRIVERS [=n]
>    Selected by [y]:
>    - PCI_TSM [=y] && PCI [=y]
> 
> 
> vim +12 drivers/clk/microchip/clk-core.c
> 
> ce6e1188465998 Purna Chandra Mandal 2016-05-13 @12  #include <asm/traps.h>
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  13  

I only build tested this on arm64. I'll post a v2.

Thanks,

Brian

