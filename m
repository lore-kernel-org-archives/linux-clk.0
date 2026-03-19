Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F7737AA99
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 10:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916578; cv=pass; b=DEY09h465p7f/xfhfigTyuHprmzAjM/LTTeazpnZ69qeqxBqGh9u543Oyja2n6xC5bPuThaD0+pTwFnUTZmWXcaI0+5aLx3cMgnQ6KhUbgNoyXYJkWi3QDj4KQQDYtja+i/z0xFgGA+C5Jn4jVmgVEir1b19CT1KXlQtm+kYiPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916578; c=relaxed/simple;
	bh=pes/PKv1sYMmXYsc1FkfweThi7GN4133sWjCMWtOINc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k43Z5NAAcCWlvGQjs7WAAF1TY8w7bIac+aBF73yJpLlvQ7ImC/KPrgN6qQZ6si5pAtBRGRgDFo2xZohJgotBszsgPTRae9IM9mU3XaSMPWKBTHZ+ALMrVZAuE27SIFrxshporC2KfCc2kqalVxn+C3/ij3jVqlfmsELsRwiI/rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VzdjfPhA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SXcXgWnR; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VzdjfPhA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SXcXgWnR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773916572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0uhh3Ua2c6hHhtVGJyoRB12XzB8iE6gZftrl0dyvmo=;
	b=VzdjfPhAdXtHbbGz7X3IwFlLsYtgA6KcM9qurX5FLyWj8vkCY5IOaBBN65EOxBrS5dJqqi
	Hi0AendN2k4lQb33itxNDQYz/8ToSvSmlGULRCwcVpZ7I+MR5JXlPImy20gwO6CIFovgda
	eNZZrDAEBqZ1ZY28RILdkFq37WXKPFg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-ioTBK9VMNZuE9sMJSDm_Aw-1; Thu, 19 Mar 2026 06:36:11 -0400
X-MC-Unique: ioTBK9VMNZuE9sMJSDm_Aw-1
X-Mimecast-MFC-AGG-ID: ioTBK9VMNZuE9sMJSDm_Aw_1773916570
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b9800aa2787so62831466b.1
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 03:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773916570; cv=none;
        d=google.com; s=arc-20240605;
        b=Oz/S6HR7HHSc4lnJjIuPagfkXkEprVVGya1AKjgIP+QhiwmA/iRLTa7+Z48ZZVgTMe
         f07f7BWumMjcALpxQwn+hIO5W/HDT2OL1tzEzs+PGo/hCBcNRTBXPqKnUDTCv0lTfVsB
         P9HfRTWTYkbqxnxl7/R5idxWGvJUeztvcXsgcTWRUyeauEDPD0MuE9+T9/cY6VP5kHHR
         WVJcKDOiwbrfeqRRBaAkLhThwpmk3aTXjR150sBxKk2hP9BBv70OCt74+6XZcj0NPQ+p
         MfPGuN3KcFXvv+XAZ1+UTEuB90fwvlridjlwzF1Eek2lsYqle0kXQeOMuBB4jtKXQ+4b
         lgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u0uhh3Ua2c6hHhtVGJyoRB12XzB8iE6gZftrl0dyvmo=;
        fh=YYU51lBhbCngPIuSU6/YuS8ITygstE7zdA+A0WKtd10=;
        b=FUM20d3jcYczWB+KSf//kUJZ1REBi65IRm2PxNJQi1X6FYhRfQJl+rL6RXgUBX739Z
         Z5gsuBiI+gytz+cX+tNWronPMcWojKs2GFIbWM/eMjm6t53C2TkKRppM0viQ2jGMvAhN
         QxSAm08eCgfNmkXsYMKQeiLGpKOEFeTlL5R4gNfTYtN5vE+w+4GNTuuGTxJQgzYosZ2D
         QTkcQqZcf9lnLD9o49Uhg1zoNBXI2WwJqtU6+jtexU0a39Z35ZzP/arHBmQGa5VLgI5W
         obUBWIeZbbfo0AvEaGpqkrgdeMA7uQZ26SWK4t00qUyafo8QpgTlnyLUDS6WTZOWesEC
         +MLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773916570; x=1774521370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0uhh3Ua2c6hHhtVGJyoRB12XzB8iE6gZftrl0dyvmo=;
        b=SXcXgWnRoBlurlarRnnbZ7faeOIeAmja2SNQCg1Da4WhUjCOfP/jLJHwnrhXLtvu/1
         YJQaVLpELoHntoBQXcXWZyNNB2+PaRjihSvXdYgEn2qvN+s4FxGmLG7OxuZn1kFnwpx3
         b9U4fdRmxl6i2yygfPz5MpXA3awmhmd4PLheDJ+NEo5rBpR/jILxHjGpWcrl9Y8c5uhs
         z7Qqbj5uNancD6xOY0bJYq4QU1dwjNPRoST1is6A/41y8EZiDyrSdvUhBbVbTFjeAxUO
         OehNrEj7x2k8hhUlz/jr8+tGYgZrpWI/7kbkr1GGp63fY4HDXzxawgwDlDVPsi1Fv2YF
         NpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773916570; x=1774521370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u0uhh3Ua2c6hHhtVGJyoRB12XzB8iE6gZftrl0dyvmo=;
        b=OdD4yg8UlPPDOVsBVxtbEUhjfIoVqkLERGCdP9qkzXVeiHBYk7UuTSzVxIEEzxcc6k
         L+f2eiiQHExEQgVCBr+Hjp4AEWeBpXVNd0oLJP4LT4M/SF574SbJuFakh0m6jeDTDlYm
         iFeaDkuWxt2C36IQP/lte8h/DG70PFPn1+/6D0Hb6twVLUT6RNV8UJjolrwHB6LNmgjd
         rYfzLHwRV4wT5z3URIbfgyd5DId0u9OqqOhLaAOlMPJ2Of1gart5PzCfXAilAY0tPsc1
         lzWq1qlqCNAgHAlqBPixAB+eUlnBCt3gl2E2JMXZrRegzYYU4+jdbx0tr/CfsJRrNrOj
         7EJA==
X-Forwarded-Encrypted: i=1; AJvYcCW/iFKB1WMOYvMqoTFoZ6IdXpNO0jbDm526PKGYBJSSgnp0GSEKbj6lgpBhykwbn+jEzRXkTJWrEUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqaKczv2ZXrd00mkeE+EoSqPyidRXFGYtZsP2ss1CZkGaTJWs2
	ADtyTRd909yX5ueomhoPSEhBgo1Cy3csSBn7kLPfxhbIdmOLSmPEaaSYJuFUnIGLthAauKxlSCv
	EMSyggjTfX/TmF71LX2FWCmTe3XewBKhwx4Zv01rz8hGXZ8sakZATegTL6aEuPVDjo+X+yZO4e+
	XafQlBTkvEL9JfoDhoX7P/lcX1/g1lsurIi9xc
X-Gm-Gg: ATEYQzzdF5L9MRbt5TlWSj0ncC6L9kasPJo0D+lJxzeDw3GeTn23HOwCo21jaZnm+LU
	jRsuO5WNFO+PYUT7N3QNRO7OnaL+5g2h4bcc17L1xbf345YVKCmYQ0PHG+5UM5dNhvR3aqjln3G
	BYuv6/SySOqJ5KHAECf8qJbgMZTh6YhAK3N7vTy5eco0P8IH6AGuLcPd6NPdFCMvNdfN74lIJ3C
	EJ12g==
X-Received: by 2002:a17:907:3d52:b0:b97:698d:1e with SMTP id a640c23a62f3a-b97f4971d9dmr394556666b.35.1773916570129;
        Thu, 19 Mar 2026 03:36:10 -0700 (PDT)
X-Received: by 2002:a17:907:3d52:b0:b97:698d:1e with SMTP id
 a640c23a62f3a-b97f4971d9dmr394554966b.35.1773916569592; Thu, 19 Mar 2026
 03:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-5-ce89968c5247@redhat.com> <20260319-quaint-coati-of-genius-9ffc0c@houat>
In-Reply-To: <20260319-quaint-coati-of-genius-9ffc0c@houat>
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 19 Mar 2026 06:35:56 -0400
X-Gm-Features: AaiRm521B0n4DYs_4UdP9WxuEKbp-V8SjyfQqnOnQBNxp8kTbcVJ-mxjf68p5EI
Message-ID: <CABx5tq+JiJVYaWyBSh=-R8Ymb-8pJdTB6U5KKb2he5SyvBQHqw@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] clk: introduce new flag CLK_V2_RATE_NEGOTIATION
 for sensitive clocks
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 5:35=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Fri, Mar 13, 2026 at 12:43:12PM -0400, Brian Masney wrote:
> > As demonstrated by the kunit tests, clk_calc_subtree() in the clk core
> > can overwrite a sibling clk with the parent rate. Clocks that are used
> > for some subsystems like DRM and sound are particularly sensitive to
> > this issue.
> >
> > I consider this to be a logic bug in the clk subsystem, however this
> > functionality has existed since the clk core was introduced with
> > commit b2476490ef11 ("clk: introduce the common clock framework"),
> > and some boards are unknowingly dependent on this behavior.
> >
> > Let's add support for a v2 rate negotiation logic that addresses the
> > logic error. Clks can opt into this new behavior by adding the flag
> > CLK_V2_RATE_NEGOTIATION, or globally on all clks with the kernel
> > parameter clk_v2_rate_negotiation.
> >
> > Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> > Link: https://lpc.events/event/19/contributions/2152/
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> >  drivers/clk/clk.c            | 70 ++++++++++++++++++++++++++++++++++++=
--------
> >  include/linux/clk-provider.h |  3 ++
> >  2 files changed, 60 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 051fe755e3bf1b0a06db254b92f8a02889456db9..64c6de5ff5df2117b8d1aca=
663d40b41d974bf92 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -886,6 +886,43 @@ unsigned long clk_hw_get_children_lcm(struct clk_h=
w *hw, struct clk_hw *requesti
> >  }
> >  EXPORT_SYMBOL_GPL(clk_hw_get_children_lcm);
> >
> > +static bool clk_v2_rate_negotiation_enabled;
> > +static int __init clk_v2_rate_negotiation_setup(char *__unused)
> > +{
> > +     clk_v2_rate_negotiation_enabled =3D true;
> > +     return 1;
> > +}
> > +__setup("clk_v2_rate_negotiation", clk_v2_rate_negotiation_setup);
> > +
> > +/**
> > + * clk_has_v2_rate_negotiation - Check if a clk should use v2 rate neg=
otiation
> > + * @core: The clock core to check
> > + *
> > + * This function recursively checks if the clk or any of its descendan=
ts have
> > + * the CLK_V2_RATE_NEGOTIATION flag set. The v2 behavior can also be e=
nabled
> > + * globally by adding clk_v2_rate_negotiation to the kernel command li=
ne.
> > + *
> > + * Returns: true if the v2 logic should be used; false otherwise
> > + */
> > +bool clk_has_v2_rate_negotiation(const struct clk_core *core)
> > +{
> > +     struct clk_core *child;
> > +
> > +     if (clk_v2_rate_negotiation_enabled)
> > +             return true;
> > +
> > +     if (core->flags & CLK_V2_RATE_NEGOTIATION)
> > +             return true;
> > +
> > +     hlist_for_each_entry(child, &core->children, child_node) {
> > +             if (clk_has_v2_rate_negotiation(child))
> > +                     return true;
> > +     }
> > +
> > +     return false;
> > +}
> > +EXPORT_SYMBOL_GPL(clk_has_v2_rate_negotiation);
> > +
>
> Do we really need to export it? I'd expect it to be abstracted away for
> consumers and providers?

This is abstracted away for the consumers, however the provider needs
to be aware if it wants to support the v2 logic. Patch 6 of this
series that adds support to clk-divider.c uses this export. Well
technically clk-divider.c is built with CONFIG_COMMON_CLK, however
other clk providers that want to use v2 logic will need this export.

The way I see it is that there are provider-specific things that need
to change if the v2 logic is used. For instance, the current behavior
of clk-divider.c is that when CLK_V2_RATE_NEGOTIATION is set, the
parent rate is just set to the new desired child rate, without taking
into account any of the sibling rates. We need to keep this behavior
for the v1 logic for existing boards. Moving this to the clk core
won't work since it doesn't know what kind of clock this is. Maybe
some need to compute the LCM, others may need the GCD, some may need
something else possibly. Some of the existing providers will need to
change to support this.

Now if we decided to not support the v1 logic, and just go all on on
v2 logic everywhere, then we won't need this export, and can just
update the providers.

Brian

