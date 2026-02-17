Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102832BD030
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 23:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771370574; cv=none; b=iu9L34rU0bVOPdTokyedKP9VDwid3LhYpKECaI/tn31rZxsQiKbJJ/R/h1zX3jOnKDOtnBUDhyHaO5G64Rm35VWdVUImaNFKCDScUfCWAhmba8olx1BFXf3ZcSAp0QXJp91TFw2eBAXz887J110ps8bURxHV4vcq25AqtFvTrd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771370574; c=relaxed/simple;
	bh=fT2sRGh/Fthzt1N+eQsgIYRWMI25aFYgD6n85ujm+8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0xeRBDG4SPzt+QwRvNa6wOS8tUI4fRoqNpRnXsRkPvKTPkrrk4OPa+eholajwiTrG9pvByRzLWbXWxIx3aqLI8uRHahYC3p9WxrsLmNXEtRfZ8RQeoe6Q1QAP2wXCOJo6MkVYcDFDlaZ36hPVYFx4q3S5nDZACcRr3k8tS+dxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ecwZpaI5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RA4wcICz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ecwZpaI5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RA4wcICz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771370572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pu6xIl0G77mqVnN/koO35p0gUExl94drv061er+Ef0k=;
	b=ecwZpaI5Mm4TTYGeG+jmn90YidJVoJDKooacmRpKn9/On0VAFIG9nY/uGWAbCShEzk2621
	FVoLZtb4Qb6MmJFLHFIwxu+3TdfHxNQho6McQW6f5Sc2wmPjUSGG1FZdftcPwaGXSGDEg3
	gQhfmHFz8Ycb1w1SGgeLGWqKNjzZCN4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-P1JcIV_2M6GYJprfLEnsew-1; Tue, 17 Feb 2026 18:22:51 -0500
X-MC-Unique: P1JcIV_2M6GYJprfLEnsew-1
X-Mimecast-MFC-AGG-ID: P1JcIV_2M6GYJprfLEnsew_1771370570
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70b6a5821so2643835885a.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 15:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771370570; x=1771975370; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pu6xIl0G77mqVnN/koO35p0gUExl94drv061er+Ef0k=;
        b=RA4wcICzmrF0fhmSw5cDWngiWY9UMpR0NULfELJQTnY7L2TYu5LIXCITvf3tsMLKHU
         CTyrC+5ct7T2byup8C0aw0+h9Bddnu/2EoPbe8i66v+xEq8OJ1jUJtpkytEtxECYbGf8
         Vd1tBU2ruz8+nJJHWGpIOq8LIR6BI80r1tmHKaDiqVJ85UNXiI2lfb9ZQS2rpeSGieYw
         sBOTfNjnRHgbSwwNJ+hhmz5ySdtOVw0Pk+h4nE5mh3y3NwV26RJ96FMc9fa3D1yiy/kZ
         xehJDQixcry0efXr8Ay8K3IvMjby6HzJYCUTX3jvUJMtIwN+B8GcMhIo8xMPOqjou7LG
         ClSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771370570; x=1771975370;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pu6xIl0G77mqVnN/koO35p0gUExl94drv061er+Ef0k=;
        b=eEcUKQRvtfcQxHgIV8H03Ev/HopMEOJSnNXmnFn2VKb5le+pD/K3WQmtNLZ9edNCTy
         Poe3aDkzl5TNxV1xJfRoWEcN006PJJ3NwOnsmICxiim1/l/2ke7Hy2oYnb1zTe4wDAmH
         v2aUbFOL7klSya/Pg0vP21IVa6dGJ2Dgay8RMACmxDh0N0vIhVGWNpwudAod7ENzvUf/
         FrcaJlST1+o4k8cqJbc+keo0X0YqaTWRou1eRjTybK8kie16aLFwPWXGC/eBJp019Oli
         9Y1/TiXU4rCy+wbYPEfIZoQMJTRre/4LmvQ/eS2brqLi9MZVh/6BuZt3zdhCK16bUm8k
         vlvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwCZ1eJCMsFQC5QEgutroSt74nAGq7GcaXiK96NeNb6ZnQxUWpIhAkrVFbnE1zZwklXmnWYWge7qs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0BBE+eAhbJjeIeLnW+pxd1LYrZr4KtS7acj9pu+dKQM89GXYQ
	mCelVtY/R0NuiDzd85DKPuXZ5eH+DhmpC6/Zn/roxMm/DqHBkse8jD4O7bNPurylb0oqfoihrl9
	Ixv0YBiEimULaxKEMDI/okMPfHfnqCc318VtbeXIs37HLEy5fxSvGKCXitWPVPDpNJH8pxw==
X-Gm-Gg: AZuq6aL9VEHxIvz2bkEen8F9KI0HVBBHtQPmvPR06uZEXhmxZ8gZLMc+az/Zr2D6x1S
	uzlP1UvuOd6guNwutc/4EtcwFmCoSKTKx8d9CmbWQEfBn4jjv9v/VF7dC3kL8aSfg8GD167vZ53
	LlLoTABZZtwidxrJNJ62Ow/zmFjz3rLhRlCIDQpvncW23D3dfmZLxHpkT4K6nrenSrfL8czFsms
	3M5GDdheibyodX1iS3IqdRnnEudp5oT5hqJ4gEE5w6UM6fPmj4kyv3B5SESzd0a5op94vCJoU0B
	LpghlTDkUphIqbMk13nYMxl+TZPS7CuuJ49tuT6X+tAYHOzH0OvvDoWK+n8YrL6R+pBXn47zHT+
	txMJ/HfvfIiUVRuJsVYTT
X-Received: by 2002:a05:620a:450f:b0:8c6:ae78:f750 with SMTP id af79cd13be357-8cb74029a2dmr17236385a.14.1771370570404;
        Tue, 17 Feb 2026 15:22:50 -0800 (PST)
X-Received: by 2002:a05:620a:450f:b0:8c6:ae78:f750 with SMTP id af79cd13be357-8cb74029a2dmr17232885a.14.1771370569874;
        Tue, 17 Feb 2026 15:22:49 -0800 (PST)
Received: from redhat.com ([2600:382:8113:e835:467d:eb0a:6604:e0dc])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cdd1541sm178290736d6.49.2026.02.17.15.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 15:22:49 -0800 (PST)
Date: Tue, 17 Feb 2026 18:22:46 -0500
From: Brian Masney <bmasney@redhat.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH v6 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <aZT4RsGnu1qlZl-l@redhat.com>
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
 <20260216-atlantis-clocks-v6-3-cb46d6a59c73@oss.tenstorrent.com>
 <aZST4Yywv09u65MP@redhat.com>
 <CAEev2e_XjxD3kHbOxVYwbf0Q0cwEr96dSQ3hWZE9eLdgeXhs4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEev2e_XjxD3kHbOxVYwbf0Q0cwEr96dSQ3hWZE9eLdgeXhs4g@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Anirudh,

On Tue, Feb 17, 2026 at 05:12:38PM -0600, Anirudh Srinivasan wrote:
> On Tue, Feb 17, 2026 at 10:14 AM Brian Masney <bmasney@redhat.com> wrote:
> > On Mon, Feb 16, 2026 at 04:16:34PM -0600, Anirudh Srinivasan wrote:
> > > Add driver for clock controller in Tenstorrent Atlantis SoC. This version
> > > of the driver coves clocks from RCPU syscon.
> >
> > ...covers clocks..
> 
> Thank you for your comments. I will address the typos and add the
> static modifier for the different variables that you suggested.
> 
> > > +
> > > +struct atlantis_clk_gate_shared_config {
> > > +     u32 reg_offset;
> > > +     u32 enable;
> > > +     unsigned int *share_count;
> >
> > Why is this a pointer? Could this just be a plain unsigned int since
> > all occurrences of this are dereferenced?
> 
> We have a group of gate clocks that have a single enable bit shared
> among them (instead of individual enable bits for each clock). We need
> to keep track of the number of clocks within a group that have
> requested an enable, and only unset the bit if all the clocks are
> disabled. share_count is used to keep track of this. It gets updated
> by each clock. Hence it's a pointer (and the mutexes around access to
> it).

The code currently has:

struct atlantis_clk_gate_shared_config {
	...
	unsigned int *share_count;
}

That pointer is dereferenced like this in several places:

    need_enable = (*gate->config.share_count)++ == 0;

I don't see why the pointer is needed. Can you drop the pointer
and the dereference like this?

struct atlantis_clk_gate_shared_config {
	...
	unsigned int share_count;
}

    need_enable = gate->config.share_count++ == 0;

[ snip ]

> > However, bigger question is if this message should be dropped entirely? If
> > this condition occurs, an error is logged here, and a second message will be
> > logged in atlantis_prcm_probe() below.
> >
> > > +                     return ret;
> > > +             }
> > > +
> > > +             clk_data->hws[common->clkid] = hw;
> > > +     }
> > > +
> > > +     clk_data->num = num_clks;
> > > +
> > > +     ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> > > +     if (ret)
> > > +             dev_err(dev, "failed to add clock hardware provider (%d)\n",
> > > +                     ret);
> >
> > Should this message also be dropped as well?
> 
> So you're suggesting that we just print a single error message instead
> of multiple. I can change it to be like that.

Yes, and sounds good!

Brian

