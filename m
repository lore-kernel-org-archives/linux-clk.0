Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970E543D51E
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383563; cv=none; b=UrN96m6R6VcMnzaKBe7fJCc+hOH+D/YiTHQgr2LYmKbjRnPzVyeThCwGboL9+IltdTxthLmKqqhhoSqmjkH26WKjPruyWFln2iHlGhG9ifDB5/06x5x/jWb6/msXSz9PjjAAEAawCJapmoaJw3D9c2jCKUAf6j7qe8JSsFFXAjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383563; c=relaxed/simple;
	bh=2Nntu3egbUh/u7IpfDHTCoOFDbjKhMadOhI4rtSRJSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHWV7mc53rSXEU1XscKqLQk3huF2eIR3+uhSG5f853n6XQ9uEEnDn/hsRXr5cQLylvfH7syrl9i4z24DemkOXEqnjzftj3VoXc7BGy5xxfqHXmvdO8udqLCCD3XoxhFfLMgv39H6EUlLbMNw97VHA3PobuhZYkAH0uY167cZ/sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IaZJO97F; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tUOHEbh9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IaZJO97F";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tUOHEbh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777383560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPYMWkvIrzN3gEn5sFq2jPlLqaoi5Nb4/O/19cEGdcw=;
	b=IaZJO97FmBeakiuKZnzKaNXO1rkVGteKNOItJTKI0Uc3heHxrnC0L5x6JUBMJUi5jradEs
	4NHWmHsJ8VbIzCzgdvFBMxT+rKh6eUPcalLhUj+91AoROTkv/yoNXFW3pfWxxYCi8EkYh1
	WwNFCEb+QpPc7ESW2iHBLaQR8NpnidA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-DfQXGOz0MTSmQpv5krzsfA-1; Tue, 28 Apr 2026 09:39:19 -0400
X-MC-Unique: DfQXGOz0MTSmQpv5krzsfA-1
X-Mimecast-MFC-AGG-ID: DfQXGOz0MTSmQpv5krzsfA_1777383556
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89502dfd7b4so112369056d6.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777383555; x=1777988355; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SPYMWkvIrzN3gEn5sFq2jPlLqaoi5Nb4/O/19cEGdcw=;
        b=tUOHEbh95n+V2BEctt5N5fK+qzBAF07T61VMq5N+CZst9+E69gRngKv/Kn1ymXTXDT
         teYezLTvkdlpWP20C6Zaqy9x1xfnbkbZbL173RUBe1hAdRBrqo9FsNRBWwT2e9NRKhnh
         aurbUw2DaR76Fp8PYjYcjUiEuDbr5q7hqNnw/cByR86Afttt2IR0dj0GsZ9pfa2chPKD
         q48P0y+4HBpr3LFAIocqCmYYkImnnrpPdiqEboELjduUFd1CvpOXU+N9ZuIwPwzNEpPw
         vBgTHYKLxeLu/y1R1p1umkeJ22ug/JqXPn9cqIQ4yRTJGAPlBEtL3p2mbO8OErdGP/kB
         0TYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383555; x=1777988355;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPYMWkvIrzN3gEn5sFq2jPlLqaoi5Nb4/O/19cEGdcw=;
        b=C3eaihGZMIyE+zEHyI47GZof+4+VFrftJ8Gl9Lfh80Kt1hCNDL0C8yaaJxaMIpPoTR
         pl0DnI28uOZU+VVIFxD5yCkigKrwR/Ev2jjce8QlmPn2rON6KjrCL/d2z6OJ9ZOUNl0n
         FXIJ50m48i0xNoq/MADgrE/H4sJUPYm3jLJrncFRlJR19rXZyXg9CgrfiPYzrXb1u4bd
         kMYa8Ualf51FuuF56c3mrHpb5Xgztf8d5NkFs0J19zMYe9Kh1vnNEaW47DmPUxfYHNhx
         748Im1g96p4ZaXzWbkKpcv4plT7JYYuj985OfdBkcN3zPMx35H4c6n/JVAsjN4vdYn+0
         osOQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ot1lU65Hz7RjV37lB5U3fs7UoDNs8OYMLXY5WXVgiTt8XRSBx0Qc8WTw5oEV14oNrNS+3vsOlQT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbxC3zFm4oyO/8K+b3pg67likdMAW8STedIF5gsRe7OdDhOHdz
	bOTKMpONgAjUciTyvpTlmZ0bBPbluDOC7wvZsdmDbZySkTl7gGYu4it4bJd0UjTZ8TgF4mV5PFW
	EJYkdbm3s2wYBzYRVai2IGuaqJOR0aMFX+jKo8H/OWJXzmUpjjxP7PIiApp/03w==
X-Gm-Gg: AeBDiesyHN0bkGMP/5Z5oxJBckjvdhGk6lyLr8RfEs2SzWiRRdHvPaVThA2SducK9DG
	FYImrdIz+rpNU2Bv2LtMs5zkcUD24alICskeNIbmGMhWivsYDHt6M7Ci8Dq+eJLZH06bFNDgMW9
	anaUlMHjRj6H7224p/JSgtANL+QCSMCSo6pEnE4P/34f4AKRG5WIoZKIiGaFqyTfELJ9JWIZOKH
	LloWnOnuxEKgoidkW4nIedur/O/+VZV+ODHE2IPl9lc/x9Bk1j+qXijPyCve7zaUal74GF83hp4
	Apx1Qf3cZu+o3Zxx91K2uvNwA6TslrMyxgu0t4eETegAuD1MsY+PhPcNAsrMToXTK7MNcaascAQ
	aO4hSccVJNiLnku3gJDueOmxeLFJSIlr6u1LBmExfVleozKPkvFn91CuCbD/5UITvGHs=
X-Received: by 2002:ad4:5ccb:0:b0:89c:4cac:74c5 with SMTP id 6a1803df08f44-8b3e30828ecmr51378686d6.25.1777383554374;
        Tue, 28 Apr 2026 06:39:14 -0700 (PDT)
X-Received: by 2002:ad4:5ccb:0:b0:89c:4cac:74c5 with SMTP id 6a1803df08f44-8b3e30828ecmr51377366d6.25.1777383553408;
        Tue, 28 Apr 2026 06:39:13 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3e2956b79sm24018236d6.29.2026.04.28.06.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:39:12 -0700 (PDT)
Date: Tue, 28 Apr 2026 09:39:10 -0400
From: Brian Masney <bmasney@redhat.com>
To: Xuyang Dong <dongxuyang@eswincomputing.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
	benoit.monin@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: Re: [PATCH v3 2/3] clk: eswin: Add eic7700 HSP clock driver
Message-ID: <afC4fqX_6eeE97mB@redhat.com>
References: <20260423090904.2108-1-dongxuyang@eswincomputing.com>
 <20260423091114.2326-1-dongxuyang@eswincomputing.com>
 <aeo8nn-eigzlojWx@redhat.com>
 <4e5c887.5a31.19dbf179fb6.Coremail.dongxuyang@eswincomputing.com>
 <CABx5tqK7p_XJHfXZ70gXhR88PzAteV7cVSFPoRzccgmjanADMw@mail.gmail.com>
 <177733570840.5403.12558106273673899411@lazor>
 <7a76d8cb.5bab.19dd3645d4e.Coremail.dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a76d8cb.5bab.19dd3645d4e.Coremail.dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Stephen,

On Tue, Apr 28, 2026 at 05:21:03PM +0800, Xuyang Dong wrote:
> > Quoting Brian Masney (2026-04-24 04:15:46)
> > > On Fri, Apr 24, 2026 at 6:45 AM Xuyang Dong
> > > <dongxuyang@eswincomputing.com> wrote:
> > > > Thanks for the feedback. I did some research based on your comments.
> > > >
> > > > lock_ctx is a local variable declared inside the function body. It is not
> > > > in scope at the attribute site. The attribute expands to
> > > > __attribute__((acquire_capability(lock_ctx->lock))), and since lock_ctx
> > > > doesn't exist at the declaration point, clang's analysis cannot resolve it
> > > > and silently drops the annotation. That's why you see no warnings from
> > > > make C=2 or -Wthread-safety.
> > > >
> > > > Why -Wthread-safety produces no output
> > > > Two reasons:
> > > >   1. The lock_ctx->lock expression is unresolvable at the attribute site,
> > > >   so clang drops the annotation silently — no acquire/release tracking,
> > > >   no warnings.
> > > >   2. Even if the expression were resolvable, spinlock_t in this driver is
> > > >   a plain pointer field (spinlock_t *lock) accessed through a void *
> > > >   callback — the analysis can't track lock state through that indirection.
> > > >
> > > > The closest correct expression would be:
> > > > __acquires(((struct eic7700_hsp_regmap_lock *)arg)->lock)
> > > > But that also won't work: arg is void *, and clang's thread-safety
> > > > analysis is type-based. It can't trace through a void pointer cast to
> > > > determine which spinlock_t instance is being acquired. The analysis
> > > > would still silently ignore it.
> > > >
> > > > For void * regmap callbacks, there is no clean way to make __acquires()
> > > > work, because the lock is always hidden behind the opaque pointer.
> > > > The annotations should be dropped.
> > > >
> > > > Based on the above analysis, I suggest removing the annotations entirely.
> > > > However, I'd like to hear your thoughts on this approach.
> > > 
> > > I agree to remove the annotations. Before you post a new version,
> > > let's let this series sit out on the list for a week or two, and see
> > > if anyone else replies with the proper way to do this.
> > > 
> > 
> > Why not use a regmap instead? That would enforce locking on registers
> > and then you use the right regmap APIs to update the register under the
> > lock (like regmap_update_bits() or something).
> 
> Hi Stephen,
> 
> The common gate API, the HSP private API, and the reset driver all access 
> the same register space.
> Therefore, they need to be protected by the same data->lock.

To add to Xuyang's response: regmap is already used by this driver.
These annotations are for the lock and unlock ops on the regmap.

Brian

