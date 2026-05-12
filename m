Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5618535B644
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 14:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778597596; cv=none; b=A2G75KqqW5d+QQ9799J1snuaV7lVdA7WywqEdXp0GKryKLDAmgw0E68ckiio5WwFR0VFMwba2uXK1o4lj6DwqwlOr+gv/bMvpcbzcv3C6ENjc9pt0MroPPjc4PfN6vTPQjQXb+Wmrvo5goFOSXwDruLrD3bpeL8aZwKSpFx3m1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778597596; c=relaxed/simple;
	bh=g+xB1b+0v4klI4t+c/HsEqDny7qGlgdc/g9Ova5zLNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Paz1iUl2eyCoKLx+RPv4cNa2kkKJ8ZaP02LxiRT8p+RF5y/72NJPWDYCSHiR5Xvp5iJ+vvXLO96N7SGyUAy5tSXW5TFhlwW8o2euCLs6NK/AcaMcs+ubKfNdbfpfBCdrGWplIVmPg7JWIISKNlToBkIDXwUWRiMAKqfYOfzLeVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CeOr0dSD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MKye7jOh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CeOr0dSD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MKye7jOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778597593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvGPQzQpGFMeIIlaW/c5GkziYATDo16EjcvpZHOssqk=;
	b=CeOr0dSDcn0rYfmDJfz3rOQbG+GIF9GZNs1wZrWBI1W3CeLCCBzX/gXXFbaWi9iIHncETq
	S64PV0KO5ADwOleICy5UYltu6dsbwp6ByKx2aDYUJ6Ul2FN7Ws3wn+d1XjZ+S3ik/eXWqy
	jEsMdz9J0PJEH7LZ9MIUG9JndxSSabE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-gQYLx27hOEGXNATKyb4XLQ-1; Tue, 12 May 2026 10:53:11 -0400
X-MC-Unique: gQYLx27hOEGXNATKyb4XLQ-1
X-Mimecast-MFC-AGG-ID: gQYLx27hOEGXNATKyb4XLQ_1778597591
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d6bf346adso80058601cf.1
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 07:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778597591; x=1779202391; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvGPQzQpGFMeIIlaW/c5GkziYATDo16EjcvpZHOssqk=;
        b=MKye7jOhBB7WrIgb0pIIAEo8Nq4X+4IgEp2Fv8qTY0AJnrVe6JsSihw6dzS0p7twPA
         W6tCgVvGaOi+07jsGLtanEWYVp2KwQELf7XSjcKZujvjUy9EVLXgLlyNl787YaBzTn1e
         DPadQIKJ09nsL3/pAa0kze1TbSrGbT1mmdF4/jzuR+0+WpybIHnLr5IdfEI2CtEETWJ4
         dQ0wYXxKrsRbnjq1ntcPgQnKcoKWEhYaNW8Ufot4dHkAiWlwIVtuomRwAOhE6pLNKqDE
         QUrnAs9CrT8EcC72qpVpHSLGmyxDC99mR8a4NPSBpQdQ17b0VT42wElPvxmkLo0xWpPO
         5fRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597591; x=1779202391;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IvGPQzQpGFMeIIlaW/c5GkziYATDo16EjcvpZHOssqk=;
        b=HemEPujhDQrDTxxOjEMkgE8O1g4hz/lxLkGbSkQQztNrvyHnOogLzEvkojjgw5zaqc
         b/PgbhDXu2J2LVRfnsqrzor0r63JZ+wG5xLjkMMMHc6bjfQ1iopRm8qbONDpqDhWzwgt
         dv20jfNqHUCRYV/6UsLKGMNksL1KU2WPqhZl8XuUekShu3gqQqPNo1rG6a7ECP7vEVMB
         /vYzhoeLGOYN0QVk/Pjoh2NXbRtwPKhtJCYCLq8S1wELuJvgm1CgCJO+euWpFYQQ5uZe
         xlqkUgin+kfnTZJsNczZD/1EJu2MP+fxu8rdJrM6O/PZQDUWzGGdz1g7g6eE6PnZ8Mdo
         IqsA==
X-Forwarded-Encrypted: i=1; AFNElJ/ePJMPSMo89US49B+IQ81mmyETHSz+Q4Y/1OfpHHv3vLxUFxWCnTN+rYVOordRHgdNwx3uB9QMsNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2DT9QNqhL4Pxc1MJo/ef2SJdxBhdkAt8H9b7zQtoDdII0kWv
	lQKRJ3abtjx+8WQvekqg0lMHuyEda63xKUXIewCjxSxFKtfG6444ENWhk7cEbOynOtNeSEJ13VZ
	uHxO5FKkFnPAFX223Lu0mcM2Cjeg9q1GdqhkFbavhLB6ylvfVZ6khnNpqaStnPw==
X-Gm-Gg: Acq92OGDrFx5tafONo8lDW/JfDSl4HRflaT/QqY+uypikRyOY1zAXdoL9dcQaj/TAyw
	XwyZdYPwf3JgFzETQemcHwrBEg2elmxlsnv3NY1G5ZJ7OiC1LTlFHKlAhlRY8B2Btmt0ifHHtqq
	5/pOl6qruCua8xeCxqsC21B2sCrULA5FqjBks0YOqdqqdKe9wxNt/BFdajSvk7OFyPbiynQjJ9X
	z627R0o/EH2tXiCtVqmEe1RJ/oTrKEAqnetRa4pURCui7rvXVG8WpC2LiP1cF2dsFvrixKe+3ax
	BGefXK1cvStyfaRPjcWS+4+BJ0lISTyYHZqSWxc/6fvFgkCl9E0ry4ojhKwzSUUYPw7UNGq0yV+
	A9SBmotNmPWZmHl+GqDy8CuIXk2eBC0NO/3Z6fbw5lN1bkqU6ND5rST/G
X-Received: by 2002:a05:622a:8612:b0:515:189c:e0fc with SMTP id d75a77b69052e-515189ce412mr15568581cf.21.1778597590773;
        Tue, 12 May 2026 07:53:10 -0700 (PDT)
X-Received: by 2002:a05:622a:8612:b0:515:189c:e0fc with SMTP id d75a77b69052e-515189ce412mr15568011cf.21.1778597590146;
        Tue, 12 May 2026 07:53:10 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148fd8bfe0sm120111651cf.0.2026.05.12.07.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:53:09 -0700 (PDT)
Date: Tue, 12 May 2026 10:53:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Nishanth Menon <nm@ti.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	afd@ti.com, sozdayvek@gmail.com,
	Jing Yangyang <jing.yangyang@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>, kernel test robot <lkp@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	David Yang <davidcomponentone@gmail.com>
Subject: Re: [PATCH V2] clk: keystone: sci-clk: fix application of sizeof to
 pointer
Message-ID: <agM-1KOP9gZqxh_f@redhat.com>
References: <20260512110028.2999471-1-nm@ti.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512110028.2999471-1-nm@ti.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Tue, May 12, 2026 at 06:00:28AM -0500, Nishanth Menon wrote:
> From: Jing Yangyang <jing.yangyang@zte.com.cn>
> 
> Coccinelle (scripts/coccinelle/misc/noderef.cocci) reports:
> 
>   drivers/clk/keystone/sci-clk.c:391:8-14: ERROR: application of
>   sizeof to pointer
> 
> In sci_clk_get(), 'clk' is declared as 'struct sci_clk **', so
> sizeof(clk) is sizeof(struct sci_clk **) which is the size of a
> pointer rather than the size of an array element. provider->clocks
> is an array of 'struct sci_clk *', so the canonical size argument
> to bsearch() is sizeof(*clk) (i.e. sizeof(struct sci_clk *)).
> 
> The two values are equal on every supported architecture, so this
> is correctness/idiom, not a runtime fix, but the new form matches
> the rest of the bsearch() callers in the tree and silences the
> Coccinelle warning the script flagged.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Closes: https://lore.kernel.org/all/84a6ba16686347099a3dab2e5161a930e792eb6e.1629198281.git.jing.yangyang@zte.com.cn/
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/all/202512040525.zrHSDl5h-lkp@intel.com/
> Link: https://lore.kernel.org/linux-clk/20211012021931.176727-1-davidcomponentone@gmail.com/
> Reviewed-by: Stepan Ionichev <sozdayvek@gmail.com>
> Reviewed-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
> Signed-off-by: David Yang <davidcomponentone@gmail.com>
> [nm@ti.com: Improved commit message]
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

