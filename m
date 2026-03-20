Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771D13C9EC3
	for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017859; cv=none; b=B0Pu9oJzi6o9cnDzprdjEaudOFqjqcC/YynpZsDexr4wK1JyJHroyQDiZSE/7R9eFZJHteE2XnJuKjuc69Mu5uRmjeedjwMkLFyT+DvVYQCoTzQ1O9ryOtCAlORXWSIzQX7S87MxLQJA3PFN6Bmpo6TzloaiZefe+IxiyBu07gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017859; c=relaxed/simple;
	bh=jeHzfq9gYIUk5jAxaykyy4WmrX69AwNpx2AR/murGTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUuWDq7UQTVRzZTPZ7Jx//2uZaZgpBjxU09uyCMY9wAcMRq1gXD14d/cdSZFY6LkYkYxn3aKNlkYPU2o6wh65DxaFbLXgOrnCTKKUMsvSu7Klp5+EQgtbkdA07Xz58qKoPaPe/JPMrpCBFRBDYJui6u4OfwQWYF8PYvDPOFDfLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OGQz6xss; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FxHZFPXi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OGQz6xss";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FxHZFPXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774017856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ghmqrm9W8jJunYiq3s7F5CdRqev6baYKcblb4T9Ru8=;
	b=OGQz6xssFcim9HwKyXxq6IhP8jTXU+Vr33XDkbebMLrr16FoUxuZIBzHRp1oBsuW9eTk8u
	UY/XlojEv0j0Tx486R9yqIwzSHxxG0hMmy2KM5HTDmNmWGb+mKhXKNxffYI3ArujPcr+2b
	OZt3ktnkw38IlX0SWvte60xkvoltkUg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-Q0i6V_GWMFezypNDJVhNMQ-1; Fri, 20 Mar 2026 10:44:11 -0400
X-MC-Unique: Q0i6V_GWMFezypNDJVhNMQ-1
X-Mimecast-MFC-AGG-ID: Q0i6V_GWMFezypNDJVhNMQ_1774017851
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c4ec516e5so108011896d6.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774017851; x=1774622651; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ghmqrm9W8jJunYiq3s7F5CdRqev6baYKcblb4T9Ru8=;
        b=FxHZFPXiJSnJojzFlSbNbRFsYA7qL3Co/daYaRsrMfTXB4YHlEMUWLo9afNMaWxVFz
         XIaZ0zQrd/Xu81ra0vlw6GWEEFBXosXh6z2N2L68HlDTfCIn0teJTWdsPmLnhp1qBzhi
         7okGLV6KpMiW1KNUW4aVS5tNGPhsLGUSaLvkQcC3nlsBLAp09quEpy0YnM49tYGrPR4K
         p/2B8NsoibL6ariMZacoqBl/jr4Qw/GopbIgorBzkauiI26qVP9t2obF3pMkTaBZpYdU
         dQCrwfBS5svdSHkyhiHjUYDTYQDyxk4LnShkC1hVcWxOHUAP4cgnsHlRoJcr2vhVttGq
         kk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774017851; x=1774622651;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ghmqrm9W8jJunYiq3s7F5CdRqev6baYKcblb4T9Ru8=;
        b=CQhma69mHRXHWrTeW5KMMXU0fRfxcY1PP4ldJKbTkaO8DBXi3LlrWrZ2EtFmhocQqM
         TPgVwLoh+PugXbPkPpVfKhxplAV39JW4uKcqaqnW3vc+cSM4qdjXH1n2j81S4D90kUUM
         sOYnH0zTvPn5627GQBZWl2atby3gzBh80GQ3jgiwh0WkHRwqqeh0i+x5U5roOPknvYJq
         kUcI5hHe0l5AAJHNTMHZ7V9OKvFle8n6pN/CWhGDTiSpTP3YxDBQ5d65J7VsktGVaLGW
         DexXgs2mHzLkq9aCxfb2OEbU/fPtroe5JRQPex0mcsHReFl2NqWRqdIdsWa8VvFISjIG
         H/TQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8XtwpMWZ1IKcK7bYLkk4LqOVBhsjDKjtZAHd3xpclw8w+A74pwK7putFO5pBkYe1p2/lfqIt/Txw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjPdezPY60IkTLlXEerPix1oUEftmHCUSRxjeth2D1sU0FhIpB
	AYU7N96K/AapxADhPrrKtaZ9LmdlWNtEoboR++CHsDFJ1flTMF/Yb4jiPiZcDWmAbfNyslnBcf4
	l7SCZy50yxKwVeK9MQszF7ljra4dXTsc94i61+CpFntoshP3/KMq32Td7mF5Nw639R7Vurw==
X-Gm-Gg: ATEYQzzHtCxv9mB05wJDFnaHNz0OLUCtAT2qj42sww+tI1tDelXRqyxZOqbuvfrp4pt
	aRCa+ixH7mafrH7t0VptqIEaAodboxC5mo07Gp9vQFYQDtdv73oPw9aGDT0+PDipmUImx4AuY/r
	ULJ2jAKbavRr9wZTdVfP80B3U0UiEWa6GK0kncNy7hNoe3Xhmje0Q9B302D6iAEbzPbpXvCiP9B
	sD541ZIrjx32jBnc7A2wxay9AEnEreNParOao+qKIs3bgfBAkZ101FuU8XaZa/m+skqYsMDJPOO
	BB+VYP/svAtb8lL1tVSISW1N/oVCeVwuKWPhs9eDIxec59hw7dWn6yv7IRZHtorlmHVIGc8cbZe
	bwuM5J6tf8HwttBsW+yFyWAyhtZK1eiUZRxAbwtBzGfws0gsYjvuA5e1V
X-Received: by 2002:a05:6214:3018:b0:899:fcce:b1f7 with SMTP id 6a1803df08f44-89c85a7e246mr50079896d6.45.1774017850602;
        Fri, 20 Mar 2026 07:44:10 -0700 (PDT)
X-Received: by 2002:a05:6214:3018:b0:899:fcce:b1f7 with SMTP id 6a1803df08f44-89c85a7e246mr50079166d6.45.1774017849900;
        Fri, 20 Mar 2026 07:44:09 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85251b04sm20895876d6.17.2026.03.20.07.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:44:08 -0700 (PDT)
Date: Fri, 20 Mar 2026 10:44:07 -0400
From: Brian Masney <bmasney@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Alberto Ruiz <aruiz@redhat.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/7] clk: introduce new flag CLK_V2_RATE_NEGOTIATION
 for sensitive clocks
Message-ID: <ab1dN7VsmyrKv8AR@redhat.com>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-5-ce89968c5247@redhat.com>
 <20260319-quaint-coati-of-genius-9ffc0c@houat>
 <CABx5tq+JiJVYaWyBSh=-R8Ymb-8pJdTB6U5KKb2he5SyvBQHqw@mail.gmail.com>
 <20260320-amiable-amazing-armadillo-f48820@houat>
 <20260320-accomplished-wrasse-of-temperance-5806e6@houat>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320-accomplished-wrasse-of-temperance-5806e6@houat>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Fri, Mar 20, 2026 at 03:33:36PM +0100, Maxime Ripard wrote:
> On Fri, Mar 20, 2026 at 03:31:41PM +0100, Maxime Ripard wrote:
> > On Thu, Mar 19, 2026 at 06:35:56AM -0400, Brian Masney wrote:
> > > On Thu, Mar 19, 2026 at 5:35 AM Maxime Ripard <mripard@kernel.org> wrote:
> > > > On Fri, Mar 13, 2026 at 12:43:12PM -0400, Brian Masney wrote:
> > > > > As demonstrated by the kunit tests, clk_calc_subtree() in the clk core
> > > > > can overwrite a sibling clk with the parent rate. Clocks that are used
> > > > > for some subsystems like DRM and sound are particularly sensitive to
> > > > > this issue.
> > > > >
> > > > > I consider this to be a logic bug in the clk subsystem, however this
> > > > > functionality has existed since the clk core was introduced with
> > > > > commit b2476490ef11 ("clk: introduce the common clock framework"),
> > > > > and some boards are unknowingly dependent on this behavior.
> > > > >
> > > > > Let's add support for a v2 rate negotiation logic that addresses the
> > > > > logic error. Clks can opt into this new behavior by adding the flag
> > > > > CLK_V2_RATE_NEGOTIATION, or globally on all clks with the kernel
> > > > > parameter clk_v2_rate_negotiation.
> > > > >
> > > > > Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> > > > > Link: https://lpc.events/event/19/contributions/2152/
> > > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > > > ---
> > > > >  drivers/clk/clk.c            | 70 ++++++++++++++++++++++++++++++++++++--------
> > > > >  include/linux/clk-provider.h |  3 ++
> > > > >  2 files changed, 60 insertions(+), 13 deletions(-)
> > > > >
> > > > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > > > index 051fe755e3bf1b0a06db254b92f8a02889456db9..64c6de5ff5df2117b8d1aca663d40b41d974bf92 100644
> > > > > --- a/drivers/clk/clk.c
> > > > > +++ b/drivers/clk/clk.c
> > > > > @@ -886,6 +886,43 @@ unsigned long clk_hw_get_children_lcm(struct clk_hw *hw, struct clk_hw *requesti
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(clk_hw_get_children_lcm);
> > > > >
> > > > > +static bool clk_v2_rate_negotiation_enabled;
> > > > > +static int __init clk_v2_rate_negotiation_setup(char *__unused)
> > > > > +{
> > > > > +     clk_v2_rate_negotiation_enabled = true;
> > > > > +     return 1;
> > > > > +}
> > > > > +__setup("clk_v2_rate_negotiation", clk_v2_rate_negotiation_setup);
> > > > > +
> > > > > +/**
> > > > > + * clk_has_v2_rate_negotiation - Check if a clk should use v2 rate negotiation
> > > > > + * @core: The clock core to check
> > > > > + *
> > > > > + * This function recursively checks if the clk or any of its descendants have
> > > > > + * the CLK_V2_RATE_NEGOTIATION flag set. The v2 behavior can also be enabled
> > > > > + * globally by adding clk_v2_rate_negotiation to the kernel command line.
> > > > > + *
> > > > > + * Returns: true if the v2 logic should be used; false otherwise
> > > > > + */
> > > > > +bool clk_has_v2_rate_negotiation(const struct clk_core *core)
> > > > > +{
> > > > > +     struct clk_core *child;
> > > > > +
> > > > > +     if (clk_v2_rate_negotiation_enabled)
> > > > > +             return true;
> > > > > +
> > > > > +     if (core->flags & CLK_V2_RATE_NEGOTIATION)
> > > > > +             return true;
> > > > > +
> > > > > +     hlist_for_each_entry(child, &core->children, child_node) {
> > > > > +             if (clk_has_v2_rate_negotiation(child))
> > > > > +                     return true;
> > > > > +     }
> > > > > +
> > > > > +     return false;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(clk_has_v2_rate_negotiation);
> > > > > +
> > > >
> > > > Do we really need to export it? I'd expect it to be abstracted away for
> > > > consumers and providers?
> > > 
> > > This is abstracted away for the consumers, however the provider needs
> > > to be aware if it wants to support the v2 logic. Patch 6 of this
> > > series that adds support to clk-divider.c uses this export. Well
> > > technically clk-divider.c is built with CONFIG_COMMON_CLK, however
> > > other clk providers that want to use v2 logic will need this export.
> > > 
> > > The way I see it is that there are provider-specific things that need
> > > to change if the v2 logic is used. For instance, the current behavior
> > > of clk-divider.c is that when CLK_V2_RATE_NEGOTIATION is set, the
> > > parent rate is just set to the new desired child rate, without taking
> > > into account any of the sibling rates. We need to keep this behavior
> > > for the v1 logic for existing boards. Moving this to the clk core
> > > won't work since it doesn't know what kind of clock this is. Maybe
> > > some need to compute the LCM, others may need the GCD, some may need
> > > something else possibly. Some of the existing providers will need to
> > > change to support this.
> > > 
> > > Now if we decided to not support the v1 logic, and just go all on on
> > > v2 logic everywhere, then we won't need this export, and can just
> > > update the providers.
> > 
> > Yeah... If we take a step back, in your previous version, we were
> > reworking the entire rate propagation logic, which was potentially
> > pretty hard to test and not easy to do a partial test and opt-in for.
> > 
> > With your current work, you have a clock flag that does the opt-in on a
> > clock by clock basis which makes it much easier to enable, and also
> > wouldn't create any unforeseen side-effects.
> > 
> > So I'm not sure we need the module parameter now.
> 
> I'd even think it makes it *harder* to test since now you have to test
> two combinations for each clock you convert instead of one (with one
> being unlikely to happen). It's something that would be easily
> overlooked, and	would receive less real-world testing as well.

That's a good point. The only reason I included the module parameter was
for testing purposes. If a board happens to use clk-divider, and has the
clk scaling issue, then we could ask them to boot the kernel with this
parameter to see if it addresses the problem.

I'll omit the kernel parameter from the next version. If we want someone
to test this, we can just have them add the clk flag to the relevant
part(s) of the clk tree.

Brian

