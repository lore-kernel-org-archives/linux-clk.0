Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145E62E7379
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 15:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436512; cv=none; b=bHU6Nuwuk6RMoZVWKnt4Ae1Ya3ywJn20mC07+sm9CXRf20p2TbyYnpIf9q4OS5dFGkOaCzY0P8TdfXpQ150GjcsGoR9p4yBvNT8WcR+iQ42h4nZG3WCsAQ/hPIVZy8edpvdQXZ2GrbcuDpp0MIieDgvPREjiw0ZlcoUI5ufTagM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436512; c=relaxed/simple;
	bh=9eKZTkFlUYkTAfdvOSFLJcZqVl5eQtDkopkEycmMNMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XL/+AfTmpyVtqQCrKyreuIzxUGkMCKhdGUoAVUJO23NP3zibA2OWo+Jl9UjYlKR/oOvgkuD7fnuTZIMR3vN6hv1whD5btj26cY6weetPE31Se3aEgsuoGIW5bN8SULncfa/R5RTlO95N43InohT17Riqu6tcDAXmY0ySvs/J5Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JAcvcmO/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AHHuw/+s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JAcvcmO/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AHHuw/+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783436510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+FKq8JIf/PC7DPaxskAYH1TCfDD8k094qv4TPNK9Iks=;
	b=JAcvcmO/1PtiPrKgtcLU+nNV6m99hELqVYiN/5MOAx2fYDSFlTzl9owYVWPjsV6Tuu0+T8
	tOh0Ep3TPYgiK9jK7jQ2BAOFjJMKGvCyMxK0HizfAcOLP7KE4WNR6r/Pag+uDp6neWywlR
	CagpVnl8Ni/QqbImlj5KT+4qn8KWOFg=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-wLgmB7glPy-LYqRgdYOMug-1; Tue, 07 Jul 2026 11:01:48 -0400
X-MC-Unique: wLgmB7glPy-LYqRgdYOMug-1
X-Mimecast-MFC-AGG-ID: wLgmB7glPy-LYqRgdYOMug_1783436508
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-485ebc5706cso1202908b6e.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 08:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783436508; x=1784041308; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+FKq8JIf/PC7DPaxskAYH1TCfDD8k094qv4TPNK9Iks=;
        b=AHHuw/+s3CW+adgNsVT1OHCxai+lEKhzizk58YWtPRCGiCNjtcLJ/ZnztyHJ4YMpcU
         wi0mkZsfuC6JExHS9I/tAQCQoSDXx3pUCK820FMpJRBpND7raQrecQwVYH/Qs8s0InQl
         77qgniSar9CxkUxdu8KLv0eHR4aDbaMiwzu5HAqAEx4vyktUVXIR//a9sqD8BWUPczkL
         tmLncaBByvEE6URhLZpUQ70DduGIH/nbU3VcuSzWypLBIxrFcAN8A8SC4KJ7mKibV8dx
         89HPv6xmo5RZxqusoAxwir5gd85CT0I65zyBq93NL1NW6HCBqyViExD3PGieM8yAztdP
         Hr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436508; x=1784041308;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+FKq8JIf/PC7DPaxskAYH1TCfDD8k094qv4TPNK9Iks=;
        b=g1F43F3HN+Rwn6p3Z/a0vb/uUgQ7YAjy3HLjdDemcqhHB00aAbVYMgbzPS1dvvrTPO
         eky2JnHuYo4HdShrjVlUykkX5BS3+gPFovYFGTcmSbrlkcByRttqnbprqOB2dF6b4/Ie
         12F4fH3J3AuT4k6DA0spvJJIsbqKHCE1Vw/4ezqsJcms6ZdzOdswdEHkODVIXmvH3xO8
         Bm51palSZ7SpHZ3tFQkzXuU68zPZfi1vBHdVyCue8YjXDySaq7GqRoihQ4swvRvuj0Rx
         y2yIErYK9EFEQ+NzgBablNxiAQDHdBbTHcujx1AWV56yQ0UylQGCozRdBFaSaUf64Pra
         M+HQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UqxTCvc91QdZa7+Wtq9bQDr1nCRQCVIKUlQwRULigMZW3frOMBYKJ7kECN28JHz8ou3ru+il2rTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmVRTwSTfg6Bl/Vyo7ZxKPl20oXYf1wyyiqQyeQUMgdfsR8WYt
	9SFm4+iU8G7oU+CBbeLQ5lqjkKsNWJybpOqEX/e2E280OXt2SZMNZoU+5pK7YnnaBuX5PyGVq1/
	byDaYK4EBKThY8CiAHV+zVizOuCuaenJ9t1FSeujKTrBBPvUmGg553MLEisJWiQ==
X-Gm-Gg: AfdE7cm9S884QuQFYxt8GaxqCOx91bOoMvnnS35TAx7nwGCxyyTnDNu0RPq8JHzih4P
	MsnlRfaH7GqADdems/MFh9pOjA7rhBhVa66f26+O6yYal6P23n9+8YUyC+WRA4MbreXqmdP7Wru
	Nr32KuDm2jjquyyxYCB5cFOj9WwNhnJz3lAXsc1K4Sb7g87bSzMJ0xMTUUOauj2flgOkZzGxAeR
	gzZqESzQ4821juP5by5PIgemKjybpbMB+xH4ehhFlFZlm9M0y3DltmJiTpcgzmQW+Ob5Fv36J1R
	7xvWtsVtnFRiZEsPieuc/thJ6IKbj87lpqTK9nLk0exhWzKd9YDZwRIOuQ7C16D9fPln1qF6YT2
	3UBn/Bd0e
X-Received: by 2002:a05:6808:c3f4:b0:486:caa4:ea44 with SMTP id 5614622812f47-4a07812f826mr2322304b6e.6.1783436502741;
        Tue, 07 Jul 2026 08:01:42 -0700 (PDT)
X-Received: by 2002:a05:6808:c3f4:b0:486:caa4:ea44 with SMTP id 5614622812f47-4a07812f826mr2322287b6e.6.1783436502199;
        Tue, 07 Jul 2026 08:01:42 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb5e6660sm13216001fac.15.2026.07.07.08.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:01:39 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:01:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
	Timo Alho <talho@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH V2] clk: tegra: Support unique names for multi-socket
 platforms
Message-ID: <ak0U0HQG-jLlNF5J@redhat.com>
References: <20260602084334.350895-1-jonathanh@nvidia.com>
 <ah7F_QDw5hT2KdWB@orome>
 <f1be738e-25fd-4d4b-9854-cdf34412bcd0@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1be738e-25fd-4d4b-9854-cdf34412bcd0@nvidia.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Jon,

On Tue, Jul 07, 2026 at 07:28:38AM +0100, Jon Hunter wrote:
> On 02/06/2026 13:01, Thierry Reding wrote:
> > On Tue, Jun 02, 2026 at 09:43:34AM +0100, Jon Hunter wrote:
> > > On multi-socket platforms each socket has its own BPMP which exposes the
> > > same clock names. Fix this by using the NUMA ID as a prefix for the
> > > clock names on multi-socket platforms.
> > > 
> > > Use 'sizeof(info->name)' in the strscpy() and snprintf() functions to
> > > future proof against anyone changing the size of the 'name' array.
> > > 
> > > Co-developed-by: Timo Alho <talho@nvidia.com>
> > > Signed-off-by: Timo Alho <talho@nvidia.com>
> > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > > ---
> > > Changes since V1:
> > > - Use NUMA ID as a prefix and not a suffix for the clock name.
> > > 
> > >   drivers/clk/tegra/clk-bpmp.c | 10 +++++++++-
> > >   1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > Reviewed-by: Thierry Reding <treding@nvidia.com>
> 
> 
> Please let me know if you have any comments on this or if this is OK to be
> picked up now?

I made a pull for Stephen last week for various clk patches that were
missed during the last merge window. I included your patch.

https://lore.kernel.org/linux-clk/akLzCVzbMbUsgDda@redhat.com/

I'm going to collect up stuff at rc6 this development cycle and assemble
another pull then.

Brian

