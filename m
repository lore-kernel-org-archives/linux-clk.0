Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0A8281376
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768577369; cv=none; b=WXP32LHD7t5jhqTNmq0xyMO/FSY1RkrPuLrsBYjK0vJSH1OICpiIE6C/ak1YH06s12sLbUEH82uG9UMfmofiOkTReDCLKGrziQOFTpW/sVgUJR7e9j5+NlZwT5nexYl8b33dcWBpvwsyCDSfV1icD7tMWkBd8z2soigy7wEohCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768577369; c=relaxed/simple;
	bh=sSSS54Xj0ShsXOZuK37+sEwwv3XAEF1W6I/qaNYc2oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkdn35pNWieTT1lMNIhwuIpCdRwEawec1CgSmrlgXIPWds/txMbstfClDHAMefoW7W6Lcggq5JuJGg4qhxbUChgJHtHr6W5lbvkjbZV4pn66OPp7L1BWFYol3rSn37eFHO6gUVSFzXBQl7sa8wf3VMPvRdNM3lL/+gpQe03+1Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I4CReuRj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QWmDJhWi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I4CReuRj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QWmDJhWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768577367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HcYNjtrM1tx5MNCL5NpuqMAZtAxO/Nx7W07L/efi2Ek=;
	b=I4CReuRjzgSaiXRkNYZJmkNae0ZWwbaz6HBvMbwpWlVr4yMxoNDshnfMq+ENAIVpcO9NC0
	4gVXVoHp+bfeJDvehoSxeAHub22cS1zYft43km0nQf8chxAOM/wY6KNNnI5zY2Q6lAaKio
	D5r2DqXQ0b1jsAWEoqAaeKYoT6XTEMw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-NFkBFIt9Pleu6N7R7sQUew-1; Fri, 16 Jan 2026 10:29:26 -0500
X-MC-Unique: NFkBFIt9Pleu6N7R7sQUew-1
X-Mimecast-MFC-AGG-ID: NFkBFIt9Pleu6N7R7sQUew_1768577366
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a316ddbacso52478216d6.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 07:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768577366; x=1769182166; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcYNjtrM1tx5MNCL5NpuqMAZtAxO/Nx7W07L/efi2Ek=;
        b=QWmDJhWizZeQX7ThvA+HEBcNpD1udgrGnfEz/3IN/acHKmkPs1b2+ISDWgTqiDaPU5
         zqCahOiL0M/eq6XLqxRXcVqKjkjPQcjk3IGhJppZHbQe/T9zzdPCvP4mPf/kLBwPdVPJ
         z+Qom/dk5p78WgiYyyuFupRmpSopFcoolW5HayQ2amZ2X1KMNpt9bMO1BUN/DTFXVmDi
         zX8W+01EnDd4L3uQ3asFML+5/U6jxueoWhLT4QugsZ2kNzEKrK9Al0fxQ5fV2L3bwAwK
         OiwxWS8kwlVMhd1+9BmMVZ+EpWVIynBKLDC1963Kewt0ZT+vVvsbQhzQMKNd0LpUw72Y
         R31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768577366; x=1769182166;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HcYNjtrM1tx5MNCL5NpuqMAZtAxO/Nx7W07L/efi2Ek=;
        b=aQv+5w/R5i/iBxFunyvXLeiwIV/rSzRslx/vJnKb4rtp5GTg4Vpem4eyzYlqw1G6Ke
         JHSYhJBAscDahj+xBNzb2W/yoxII//JQHDN24Ljz5uMs5XjvvCG+i88gtTg54P19Pf2O
         y87ClCMNCIO1QIgdIOVFWso3HYPcKZBlyGhfNTMhtTmmADS3djD7faLH0K52hH/uqN5j
         tLh3CIQuEqTdSY2axweLnGnMoTfjm1XrM4eUvnLZqU5SvC6qjMWSoSvESPYL1nOHni9o
         H9x3ijG4abT6chRLfqi78CwnLFYu7fgNttiEirzjMxe8zr16m8/LF6Q0pD8pbRXj1T0e
         Jz1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUh2tIVXw2fBnc7hPj8QgdFvhWMMPpPswxZ1x2w3bR7rO+jSB2rfS6Cmhl6KdQPbg6xZktJ1Ub9Uf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKLbeYmKX0xxXa9tmyzdHEeSodKqjNSacwSpdaUGqyIxae1QFX
	qimn380LPc/MGR0xHcNzFxrN2YkcNbttxDWRtL/d49HOgltGwUwxnLNOsY8ozDfHe/Yp3Xn9aJU
	wxj+Z7VbfcWjdhoS4uZ5ACnGs4H8bBzIiXeBLAFSvH4x2QxKf0fQJxeZwQHvHNg==
X-Gm-Gg: AY/fxX7vgrecibQ20RIF2eyvMTnVwLPkIAaHfCCttinyWY4RxeY5TCJOGs3yybw65Vj
	RiWlgExs8PKvtVbZLErLVH/TiCKi8bIhAE62330ZFdb9ZGpE0zToId2Ojv3wlZKPQTSuTSlZJeS
	M6gqCQIh5z5zOOSlHBCJkXa1MqlHN5u33fZRYtXtmPQ46GFo36NLUej6V+TR9aMnFjRm4SH3xv5
	dRCHX0UmuXaf0zGZ+FM1SxNa5wccrQ/acbwBl9t8cdL20rlueptsr6mkVqDCxqtOKTSXbJOcJQ0
	2NOD8RkWVNqJNElNgBlRjl826fFRZE6R0sBCoczkq69iQ9r3pIOvonnpGhY4QwclBKQlIQbqjrL
	7FGGCLXCLBr3CsVj+uInX+Qjufgyy6gDIgqcwdCojU0G0
X-Received: by 2002:a05:6214:2305:b0:88a:589b:5dad with SMTP id 6a1803df08f44-8942dd07f96mr46350726d6.27.1768577365724;
        Fri, 16 Jan 2026 07:29:25 -0800 (PST)
X-Received: by 2002:a05:6214:2305:b0:88a:589b:5dad with SMTP id 6a1803df08f44-8942dd07f96mr46350456d6.27.1768577365381;
        Fri, 16 Jan 2026 07:29:25 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6cd63esm24958956d6.49.2026.01.16.07.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:29:24 -0800 (PST)
Date: Fri, 16 Jan 2026 10:29:23 -0500
From: Brian Masney <bmasney@redhat.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/7] clk: st: clkgen-pll: Fix a memory leak in
 clkgen_odf_register()
Message-ID: <aWpZUz46SQLGf8WX@redhat.com>
References: <20260116113847.1827694-1-lihaoxiang@isrc.iscas.ac.cn>
 <20260116113847.1827694-2-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116113847.1827694-2-lihaoxiang@isrc.iscas.ac.cn>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jan 16, 2026 at 07:38:41PM +0800, Haoxiang Li wrote:
> If clk_register_composite() fails, call kfree() to release
> div and gate.
> 
> Fixes: b9b8e614b580 ("clk: st: Support for PLLs inside ClockGenA(s)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

Note for next time: I sent out a Reviewed-by tag on this patch on the
previous version. Please include those tags on the future versions.
The only time it's appropriate to not include the tag is if you make
changes to the patch beyond a trivial change.

Also you may want to consider using b4 for your workflow since it really
simplifies your workflow. There's some documentation available at:

https://b4.docs.kernel.org/en/latest/

Basically, here's a quick workflow of what I do:

    # Start with a clean branch (say today's linux-next)
    # Create a new b4-managed branch
    b4 prep -n my-branch-name
    # Apply your patches
    b4 prep --edit-cover
    b4 prep --auto-to-cc
    b4 prep --check
    b4 send --dry-run
    # Send out your patch series for real
    b4 send

Later if you need to send out a new version, just use the same b4
managed branch. It'll track the patch version number for you (the
PATCH v2 in the subject).

You can use 'b4 trailers'
(https://b4.docs.kernel.org/en/latest/contributor/trailers.html) to pick
up tags from the list.

There's also a b4 web submission endpoint you can use instead of sending
it through a SMTP server:

https://b4.docs.kernel.org/en/latest/contributor/send.html

Brian

