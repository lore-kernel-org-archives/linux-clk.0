Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795481052;
	b=NSH+isJKIr7Edab36SBoaaUr1tagGZaUUQUE43SdIpm2z3HQAi79GY2GH+5RCdP52C0+
	 h4BkFdmDwrLu0ptfUJ2+3t8YXa2MvZoR8avaXIqyWnb6Kky2s5AeQGVUt0a8UBGkF32Kp
	 nM22baaKxl/lpxtlUq3Hz/I1XYEbWzYhzl0ajiPgtY52axhxNJPw0MZh/67wDJL+0Yz6/
	 wO81Hgy/diUV6+KvlxYCLqVKQI5TF8P7BgOGmXu8HGmMw6tU2xzWrpBUU3V1DhynS2NAu
	 plPYfPZMB2xBz8sVM3+evXxig0BAVsfL9C2NiKB+M0RLKtMhMdM8jDaIcUv1wPEhX0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481052;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=Wi0fAXmXePj9clIxSj/PDaoYWKJnO/KlO0YBgvh950U=;
	b=m0zfm0OUGUBXx2qZ6EtmQSJHIdF3zhVdq9Z3xhDPn1SeB93Wjw8bZ40/FKpF8km/yMSP
	 vogcEZP9dSjQLXIuV2VzWEDRpcvzHM8a9p2EKylgRA+1qNsPy4SQQdXhgjqZm055ZWV5w
	 RGse3wwjocpCE8SDU/xpaImyouhScta73qCEKcFOZV1z/dXiR/zKmY4S8AmLgIcxgaNj8
	 8s4ARkvTXQAGT/Gva/bwsB1uDlCvzMH1MQnZfalU0ZmcW/hZq/BouWq/vo8ZSsGaFRjF9
	 Lb/bks/hb/7T6y22rmfRMdxu6T1wvH7N3eugYQ5VucR70iEl7xPrfzy2wF6narOYdiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q6sO6vDc;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kgZQwC01;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986EA606A322
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 00:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 986EA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q6sO6vDc;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kgZQwC01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795481049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wi0fAXmXePj9clIxSj/PDaoYWKJnO/KlO0YBgvh950U=;
	b=Q6sO6vDcn0vNTAdBOkD9I8pG6Jps8ysB0S6TUN2g1/lKQseopk+cvztOTJhPaTe9v7ZaM+
	GFBOorTnTs6fOr5gfuu6j0dmuRH6iGNwPOcn+gKwnJlrFf34ROGO+lYFYL+qVcoGAnxro5
	YOI1GsFmurPn5IsKiFljmPIhC0OOsjY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-daROEJ--NzaKSLQ3XN1MQw-1; Tue, 24 Nov 2026 00:44:07 +0000
X-MC-Unique: daROEJ--NzaKSLQ3XN1MQw-1
X-Mimecast-MFC-AGG-ID: daROEJ--NzaKSLQ3XN1MQw_1795481047
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92114c39cadso75853316d6.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 16:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795481047; x=1796085847; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Wi0fAXmXePj9clIxSj/PDaoYWKJnO/KlO0YBgvh950U=;
        b=kgZQwC01Z3ML77UaoMtUPzjhGMHfbsltqAwcZZlf4stEdeC4aavxqkjWbiOWpDUPLv
         pXFjLPqYRFJEbQQTIEI72onJGGAojnConuD7nOyEhAeTL1KSLPz4aDLRUaZ3OXxImwU6
         jwg4+Pqn72WkG77cJgmHGscQgaV89R2bvTMtnUvKeGachK5im9weIyI6CwNh1a5dM2Su
         6T01u2QsG6I0IzgZjOxJElhTwq5Iqvby5pzBrcrczlCAT2uxHV+jN96aChBuxMoq1S8H
         z5PLKxC22x2GWeaGmQiununGtlSpDLEJoe9/Y33b/6I04LdkOispCMTKmz+RtxIUKkca
         lJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795481047; x=1796085847;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wi0fAXmXePj9clIxSj/PDaoYWKJnO/KlO0YBgvh950U=;
        b=btBWVnRpGxsMYmL5ayyuEwjBeFRhvLk4CeWg4sA8NkzjasEDD+sGAo4FJRevuYSaoJ
         YLCjGS3vwz0cv0gCP8k65wVUYPPWUVTr3UnxCidkUtxnp01qokw/udMc3+F3l+7Cuwds
         t2A2fq6OY+ck6FwKwJI8OmPc657aedLiqHEZeZk/+iSgce7+oaHWZfBcL0qIm7v4+9bR
         YiJ4mEoWfuB3W6aPTbf876pzH21dhJJjVfQqO8qtW9NFT21uDMAZPuM5wHKZ5E39Ev2z
         CO6QddsTq/M+IwbcORlLUQ0m6FVssB+V275bQ9dLfDpFEtGVqpivh1k1PUzsybJTeaSd
         4L7w==
X-Forwarded-Encrypted: i=1; AL+hErGRxppgqBEN9XffISQBY7xaENZEy4pxbq73Hbbn+DOycKqAo+3AWr+S2amLWykpvh8ONFFXSmNwv8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OJKaWSrHaNN2YAmNKUQItMsvMEMYSJazv+F2fLrgPOMWazzgH
	MGcwuWZY59yQ7qtq7YdTbEK9fRPDvp+6pYwNkvcyOo2Y7RknXvzev1gxBOnnqcDVGwNY+/brL6I
	r1D9Sg5iSaCouWSxuXCuhhHd4E1tvp1WI4x3gI3By7Ecb9y0L3PnVzkTsbSDNRA==
X-Gm-Gg: AZFdTZclNKTq5RKaaLWX2YAOYsB1TLsX0bLbYI71mFJa9P+gbo+3EwRzERt7r3sRrxh
	sx1oFS9zKr5GSuZUVOYuq5CDnOsCBireq0ZQc2xL3dRINxeTXPFMFEUKCiShM3CN9XMymisOpxF
	G/kceKfxgKtU2fBsM12IexNQG3rxSqB3hxinF8OdBUN86//pDvyOKWLO6x5CawpaOtzcBlU/mvX
	ZxJGfczEx9G1/X34n0QPdN/mUwPMckCS6IVOs2kWQbpDsdjNiz1ppF1zH+tZ8zygoh7MUGu/nUr
	+Ck5/GuvJubkkIGxTQShmutvjGsZw3bRCBefHzmpgrAyOQzRVlfOjtW81C97B1MrxxP11B57AQP
	92qjf0NzID+0um3dvhr9wOZnxqm9Ou2ciEa6i2CjUbcS30dyj4Z660Nnx1hIzIizppTRrIwvJMi
	71
X-Received: by 2002:a05:6214:4e04:b0:920:fc07:1e4d with SMTP id 6a1803df08f44-92134b14149mr196492136d6.43.1795481047262;
        Mon, 23 Nov 2026 16:44:07 -0800 (PST)
X-Received: by 2002:a05:6214:4e04:b0:920:fc07:1e4d with SMTP id 6a1803df08f44-92134b14149mr196491816d6.43.1795481046791;
        Mon, 23 Nov 2026 16:44:06 -0800 (PST)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b456csm121669456d6.13.2026.11.23.16.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:44:05 -0800 (PST)
Date: Mon, 23 Nov 2026 19:44:04 -0500
From: Brian Masney <bmasney@redhat.com>
To: Joshua Covington <joshuacov@gmail.com>
Cc: masneyb@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com, andrea.porta@suse.com,
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: rp1: allow the clock provider to be probed again
Message-ID: <awTd1OGm3Munmah9@redhat.com>
References: <179545567027.246915.947299820828330388.b4-review@b4>
 <20261123233827.61587-1-joshuacov@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123233827.61587-1-joshuacov@gmail.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Joshua,

On Mon, Nov 23, 2026 at 11:38:27PM +0000, Joshua Covington wrote:
> On Mon, Nov 23, 2026 at 12:41:10PM -0500, Brian Masney wrote:
> > There's presumably other drivers that will have the same issue as well.
> > Rather than having drivers all try to fix this themselves, let's see if
> > we can fix this in the core for everyone. Can you try this completely
> > untested patch? If that works, then you can take it over. It will need a
> > kunit test.
> 
> Thanks a lot, it works. I tested it on my Raspberry Pi CM5 (currently
> 6.18.64 with the Raspberry Pi downstream patches) with your patch
> instead of the clk-rp1 change. Unbinding and binding the RP1 PCI device
> again, which oopsed in __clk_register() before, now brings all RP1
> peripherals back without any warning.
> 
> I also wrote three KUnit tests for the following:
> 
> - registering, unregistering and registering the same clk_hw again;
> - hw->init being restored when registration fails (-EEXIST on a
>   duplicate name);
> - a parent referenced through clk_parent_data.hw being an orphan after
>   it has been unregistered, and reparented once it is registered again.
> 
> They pass on the CM5 and on QEMU x86_64 with KASAN. Without your patch,
> the first two oops on the NULL init data, and the third reports a
> slab-use-after-free in __clk_register().

That all sounds good!

> 
> I noticed two things while reading it:
> 
> - clk_unregister() now writes to the clk_hw. So far it only touched it
>   through ops->terminate, so a driver that frees its clk_hw before
>   unregistering it may now write to freed memory.

As far as I know drivers shouldn't do that, and it's a bug if they do.

> - hw->init is also restored when the clk_init_data was on the stack of
>   the registering function, so after unregistering it can point to a
>   dead stack frame.

This could potentially be a problem, however...

>   That only matters for a driver that registers the
>   clk_hw again without setting hw->init first, as the updated comment
>   in clk-provider.h says.

All of the cases that I've seen across the various clk drivers the
hw->init will be initialized again with data from the stack, so it
shouldn't be an issue.

I found there is a function object_is_on_stack() that could be used
here, and if true, we could just set hw->init to NULL to avoid the
issue of it reading stale data the next time the driver is bound. This
will still assume that the next time it probes again, the caller sets
hw->init again. But honestly, if that crops up, then the driver already
has an issue that needs to be fixed.

> On the CM5, clk-rp1 also keeps a cached rate per clock that survives a
> rebind, so I added a small clk-rp1 patch that resets it on probe.
> 
> I'll rebase on clk-next and send a series with your change, the tests
> and the clk-rp1 patch. How would you like to be credited for the core
> change? If you add your Signed-off-by, I'll keep you as the author;
> otherwise I'll use Suggested-by.

Sure...

Signed-off-by: Brian Masney <masneyb@kernel.org>

If you end up changing the core patch more, then feel free to take over
authorship of the patch, and just list me as Co-developed-by.

Brian

