Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A33FAE01
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 17:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774460188; cv=none; b=gFU/SpSYlQOYXdUUvD8WqTTAvQtgOP2rmhCPH9BPkmHqQV5CZRrEg3Gv5wBu1bIjogRLhzLCqCRR5XBkpES51lOp1DGGrLmXuzlh/Nqd9EdkWLzPXgvUDuQFUWRAeVlEJo0qamn/lKsQoCN41wf8WfKpkb2FoDowQ/xY8sXRoIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774460188; c=relaxed/simple;
	bh=qCDVecj5QCgSr3zZu913blQ5g9xa4s4lt/qWzaQ7d3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJBZ+Rp/xwxVsQn2GR1pKSxnVWDcETTKPk1d8MsybSE1+L/SIE6qNOCxH1j5OPUeinLj65qqZW/S8w3+32z3Hgx1Ds3FJ3JXBGMmyK/2HtonT3DLdql7EwvUa8tUM7zer67dFmU0kCveaqUVibmMyK351X4KPf5I6QV/OozK/5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OvAF5Oho; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IKHIGa4/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OvAF5Oho";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IKHIGa4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774460186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNw0ZFgiMOnQP2ne8rHfNoam+u45DQkKLqODz/ohX1c=;
	b=OvAF5OhodONjRLnl7YPjB/zis5zfmWqW1v7FKrsNJnMCC59/KgWnesvSaSTw+QXcbOB89Q
	UeM5mQHo4d+FKtwceC+xaV9WxCwp/dpybJcsjPy1l5VKDQ/rpFrnn2UoZBAjy1WZpKWDgR
	6ktg5WoAWkVYr2MqPGvwgkJ10TkZbQc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-B8x7rpB4NMmvPJeLOnvZgA-1; Wed, 25 Mar 2026 13:36:24 -0400
X-MC-Unique: B8x7rpB4NMmvPJeLOnvZgA-1
X-Mimecast-MFC-AGG-ID: B8x7rpB4NMmvPJeLOnvZgA_1774460184
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4b81c632so5764571cf.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 10:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774460184; x=1775064984; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNw0ZFgiMOnQP2ne8rHfNoam+u45DQkKLqODz/ohX1c=;
        b=IKHIGa4/GrT4f7vRfeS1ByyzKc8j+2o/QuPfgbsHN2bOF/XdhugWWH5W3unkc/09Db
         68Wzoyf8wBgSUpJfwZFX0ShE5v3tlsO3LZyijpT7QAk4CGi4r+SRPoVEttqDZOeHLD4O
         VCvv3lnAwcfjPZeKfnN0nqHkbb2NR4iMkAcX1MJF6iGDM41eQJctGVYarSNtn8NvDAXL
         IHan04v8TJ1C2LOxWJoQCi4ltd/acH+bxc5DF35Y8CP3KW8CimM6TvvIZwlKCHX7iRJd
         gQtlM4tfTabVWcd61rRnUpmH8gNnOfGB6Gjqp1jeNjk6XCnTKf4WzM5cfDPyXqjS7001
         beyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774460184; x=1775064984;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QNw0ZFgiMOnQP2ne8rHfNoam+u45DQkKLqODz/ohX1c=;
        b=Qk3nlpcjg1g4gn3XexpZVClKGtc5uGjJ226HAO9fzaH0BZhnwrOqeOJnGg1QNCs9CA
         1NiXYpO4thuKgqlnWFFOFbU/wDhbTbP5E85H99IVLAhmo+0JW2f3+bswBNDdylBFlAXx
         R7YTJsXqM8Xi1ZzOxwEzCGSUMpi+8kH5k1tEr0Bm9ugqKd60duAkEYGCLQtH+7chOqcL
         DvIDKC7bG68aDEn19p7gWhhk48RQcxYB/l8xpqKncFJvhe+Lp52I2GXUkFHyN40UIbY2
         FbTTuoRd/xb3AfxxbDl/pOMqt7uTM3YSuHeFGq0VDkp1tMQMq0o2lQaBzUxpkj9JN8NP
         jM9g==
X-Forwarded-Encrypted: i=1; AJvYcCXIqp0xanJcvQ3p30Fdf1RzbEvwCwbYh4K9DTZxZKRz0aCAQ6nCivUrGYCqK1RujrxlX4i15g0AMOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXq/nvoFsjz1zJolPCNNZduMDuYzi9xjMPGW3YaJ/HyMhq0gm6
	Trfd4+1EtxtY03A0trVqvffZBoS1HeUdacGQGJL/ip1h+gmJEn3+mby1Wab63ZKQ54wrS+b807X
	tX7SZA8VqfSkld0enNJBc29pCLVQ0C7v9C77fwDRlg3HlIr+ekIBxkmC9NNTo/Q==
X-Gm-Gg: ATEYQzwn4WyvzzCDhh2meltHqNgOIuaKdCZKSwK19EWEpiqA7GYvReXPdFHu48a7/jw
	7EGvFQQj1YaKoWTKlF3E+uCtCprFO0HxYU2tn5x49JLr1WU7Ot2Ar34HEU5blofgq2gxaRRddV7
	BnYYGAgxXrESUQ4ssb1F35QjHnUoWppFq/velL0+GCehBCN4GyEZS+98yY3rwZzUK052EmJCApy
	drcqOHd5qDJ4M5aa5fV/TRGfAog2iYtRgVZm4rAYPt3fmp9nRdEbvN29kxq2XW8tTRbaXIQn8Ha
	LNbDgZ37IuA5zoQO4CiJ4zMwfjbecGU6GCUvTtexI3yFziHYOZ9qbUZ28xzEAte16kpzEojCb3r
	tIf8hkpWEzgS4JOc=
X-Received: by 2002:a05:622a:10f:b0:509:3cd:b22f with SMTP id d75a77b69052e-50b80d14417mr66101391cf.23.1774460183812;
        Wed, 25 Mar 2026 10:36:23 -0700 (PDT)
X-Received: by 2002:a05:622a:10f:b0:509:3cd:b22f with SMTP id d75a77b69052e-50b80d14417mr66100881cf.23.1774460183228;
        Wed, 25 Mar 2026 10:36:23 -0700 (PDT)
Received: from redhat.com ([23.25.77.22])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b9217ca02sm3790261cf.13.2026.03.25.10.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 10:36:22 -0700 (PDT)
Date: Wed, 25 Mar 2026 13:36:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: add kernel docs for struct clk_core
Message-ID: <acQdFMOp1HEJK4mA@redhat.com>
References: <20260304-clk-docs-v1-0-fee468db99f1@redhat.com>
 <20260304-clk-docs-v1-1-fee468db99f1@redhat.com>
 <177440586383.5403.6563786360526680278@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177440586383.5403.6563786360526680278@localhost.localdomain>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Tue, Mar 24, 2026 at 07:31:03PM -0700, Stephen Boyd wrote:
> Quoting Brian Masney (2026-03-04 14:51:03)
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 47093cda9df32223c1120c3710261296027c4cd3..18b7a14e3f2c595d82401be9382a062fbca8a5c6 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -63,6 +63,65 @@ struct clk_parent_map {
> >         int                     index;
> >  };
> >  
> > +/**
> > + * struct clk_core - This structure represents the internal state of a clk
> > + * within the kernel's clock tree. Drivers do not interact with this structure
> > + * directly. The clk_core is manipulated by the framework to manage clock
> > + * operations, parent/child relationships, rate, and other properties.
> 
> Trim this down and use active voice please.
> 
>  /**
>   * struct clk_core - The internal state of a clk in the clk tree.
>   *
>   * Managed by the clk framework. Clk providers and consumers do not
>   * interact with this structure directly. Instead, clk operations flow
>   * through the framework and the framework manipulates this structure
>   * to keep track of parent/child relationships, rate, enable state,
>   * etc.
>   *
> 
> Does the longer paragraph description follow directly after the one line
> short description? Or does it come after all the members?

The longer paragraph goes after the description of the members.

https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation

> > + *                     initialized to clk_core->rate. It's also updated to
> > + *                     clk_core->rate every time the clock is reparented, and
> > + *                     when we're doing the orphan -> !orphan transition.
> > + * @new_rate:          New rate to be set during a rate change operation.
> > + * @new_parent:        Pointer to new parent during parent change. This is also
> > + *                     used when a clk's rate is changed.
> > + * @new_child:         Pointer to new child during reparenting. This is also
> > + *                     used when a clk's rate is changed.
> > + * @flags:             Clock property and capability flags.
> 
> Can we somehow link this to the CLK_* defines in clk-provider.h?

The kerneldoc lists how to link to things at:

https://docs.kernel.org/doc-guide/kernel-doc.html#cross-referencing-from-restructuredtext

I don't see how to link to the #defines the way it is right now, unless
we link to each one individually, which we don't want to do. We should
be able to do something like this:

enum clk_flags {
	CLK_SET_RATE_GATE   = 0,
	CLK_SET_PARENT_GATE = 1 << 0,
	CLK_SET_RATE_PARENT = 1 << 1,
	CLK_IGNORE_UNUSED   = 1 << 2,
	...
};

We could then refernece enum clk_flags in the description, and it'll
automatically link it for us. I'll try this and see how it turns out.

Brian

