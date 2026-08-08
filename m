Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE9A401A00
	for <linux-clk@vger.kernel.org>; Sat,  8 Aug 2026 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786195323; cv=none; b=UMbP7hQmK/y7ragY6meLZVO5R7PwgesPdILXAnchjTGJg21mEFlvMAwQQSTeP5n+7ZiSEnQGKjgIJ2spgdxdIVnwRz1zukBcm1wzSjdsc8mNlxUlkEiQRWB9juktL/Ynpn17vy6LFefvpEvlh/9NHnXg/Rwp5tkN2BoQUQaoHfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786195323; c=relaxed/simple;
	bh=3bY6g03Im9fvI5gkQ67473PMLqfsCYi0JF6q2NRnWt0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8rixrp7AFIXyt5Iwq3JIjSYtRnqn9D4PTtoUxzg2Hk60O1cJ6CiXz4rz7SVu+ZJHkBJoGkhOC7jsbQokmjkHOAePUPH48b2b/B9sS22cseQvAah5q3trDcR41Q2kNLwOCVpLqIyvBxdD30peiu+d13szXxLBPhHGXO+CAKfg94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwhnAhzQ; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwhnAhzQ"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-38dc4f9462cso263052a91.0
        for <linux-clk@vger.kernel.org>; Sat, 08 Aug 2026 06:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786195322; x=1786800122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=li/c4+/312t4GgA151ifIixBtg8Isry/It3D3W9Em4A=;
        b=IwhnAhzQmWKWCa4lG7p+R6zLNuYaAW+iMQv/pmakSeB67DiAy+qJjdxNRAALX0kCXz
         aYUXVoWcoy4+zK5et7nQg4fvX6Cv1hV08471xD5//WhD61bxv7BpHZrb/ZvZETfFmUCq
         xweSxeDS6wx44ul4wZFIP/n4UW8+8wYLxgvXOxXyAqbZf2WP6vn1T+KuqeF+ap4xQkUS
         wIsq+WcTI1GDmJiAvr3fq3ujGohSGKFg2Z5HpM8RdXx3EYqZysqEY10MQ/YUtyx8RsU0
         iIognk7D55UDDXthiXgTw6q3jWzqMssfGHrSidDUB55nZ/dyo93KnbSZHn+luK1PZkf7
         j86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786195322; x=1786800122;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=li/c4+/312t4GgA151ifIixBtg8Isry/It3D3W9Em4A=;
        b=n0Wa73O/7oYdg6j0kSc88pMcX5pc+ZM8Cg3BSKgWR/03gZzHGNR4cPwARJ0RuOrbVC
         hOzGRpIuuQzfewIo7h3V3E83t2OZLCTU3B9ICGaypDk+9b3BRZ4I278Af/Nzn1wh2JEj
         JMKrwRS9Kq+msBVRwJJPWvTXPFeWlkTTpHliTbj8rZXbJDqXRwkV6SeQIu0AmTg6hKg6
         ubsQgZWVp5z1E+X7ayZX3KT27snK2rFfO77EWzF5BES+EyANoEpjvBzmulCYFTDdj7Pq
         N9n/hfTmnB+dXm8zPiCJ5llr9TKfJHAQUMxvBavOTAJyAFicqMInORTegM6poJxyaX7C
         aj4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpQ02w/2PJE6wtBRLB2vfZc/lPjYpXGCABXY/Pe1qNBnXuka8RkNb/WnNA1zl0H4KGyUseLiK01PRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9O1IitFeFktTm2ij/0lxwC0Iv5qEQ44Fd4ohsIwtriiRBDwhP
	rQxXNGKgveE8/w+FfqrL2GyvHG9N6U+0xKtoY803aJ4RY/Qh+KxKHlYV
X-Gm-Gg: AR+sD13Xh+r+W/ge1AthlVWYh5f18g4cRf75GGkFEPbHU2gYCkpsFbtXO4EHEWKpEBE
	H/wK8USD1N4zTFSy9yfNd4Hp3asdYMpyq/UkEeiBJ/ElDyiarrvARcJVbYpcg8VoUWljIJwD7FK
	1vpzhEWWVqN/zBAZxDUuY5W5Fk8CKx9cZw+G4G0+UT69byQKNyAc8oSxmoJWd5HH2fV6EIVrCdY
	U4Lnhp4Nx1cr/R7rSiyXzI5bAFMv7E7w6apVCVbPs65jrQimKLZb8WfI9801OWCqIi4skDutdk/
	NSdhttqr5lNIie7tn2RYpDg2B1jKKVonr5u7fRx/Xy8B2wpnvN2oJ4vnEHWVaGDijkkPPCScdWF
	utAjX7a2P/R47HjIdd/JaP6OQ6smsklgSt2tmtgX7No9f2Z8hpbl3xpg49KPXp2LnF49CwFUSjB
	OLw/U+4JYzEkGrWNNSp040aVFVGN5FpXdFie3YQ/o=
X-Received: by 2002:a17:90b:17c5:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-3903b9f3ee3mr28104214a91.0.1786195321821;
        Sat, 08 Aug 2026 06:22:01 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b343e662sm2307387a91.2.2026.08.08.06.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 06:22:01 -0700 (PDT)
Date: Sat, 08 Aug 2026 21:21:57 +0800
Message-ID: <c73cc405df108dd7c3c5da95a1f8cddc.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 10/17] drm/spacemit: add Saturn DPU KMS pipeline
In-Reply-To: <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-10-6de34d80e86c@gmail.com>
 <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Philipp,

On Mon, 27 Jul 2026 09:35:38 +0200, Philipp Zabel wrote:
> On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Add the atomic KMS implementation on top of the hardware backend: one
> > CRTC and one primary plane per DPU instance. atomic_check validates
> > the plane rectangle 1:1 against the mode and sizes the per-channel FBC
> > line buffer; atomic commit builds the cmdlist batches, maps the
> > framebuffer through the DMMU and arms the cfg-ready handshake, with
> > vblank events driven from the DPU interrupt.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  drivers/gpu/drm/spacemit/spacemit_crtc.c   | 815 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_planes.c | 376 +++++++++++++
> >  2 files changed, 1191 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/spacemit/spacemit_crtc.c b/drivers/gpu/drm/spacemit/spacemit_crtc.c
> > new file mode 100644
> > index 000000000000..b75ff6320501
> > --- /dev/null
> > +++ b/drivers/gpu/drm/spacemit/spacemit_crtc.c
> > @@ -0,0 +1,815 @@
> [...]
> > +/*
> > + * The assert and deassert orders are not mirror images: the hardware wants
> > + * these.
> > + */
> > +static void dpu_reset_assert(struct device *dev, const char *name,
> > +			     struct reset_control *rstc)
> > +{
> > +	int ret = reset_control_assert(rstc);
> > +
> > +	if (ret)
> > +		dev_warn(dev, "failed to assert %s reset: %d\n", name, ret);
> > +}
> > +
> > +static void dpu_reset_deassert(struct device *dev, const char *name,
> > +			       struct reset_control *rstc)
> > +{
> > +	int ret = reset_control_deassert(rstc);
> > +
> > +	if (ret)
> > +		dev_warn(dev, "failed to deassert %s reset: %d\n", name, ret);
> > +}
> > +
> > +static int dpu_pm_suspend(struct device *dev)
> > +{
> > +	struct spacemit_drm_private *priv = dev_get_drvdata(dev);
> > +	struct spacemit_crtc *a_crtc = priv->a_crtc;
> > +
> > +	/*
> > +	 * Assert before gating: a reset asserted into an already-gated block
> > +	 * has no clock edges to propagate on and leaves the register file
> > +	 * untouched.
> > +	 */
> > +	dpu_reset_assert(dev, "lcd", a_crtc->lcd_reset);
> > +	dpu_reset_assert(dev, "esc", a_crtc->esc_reset);
> > +	dpu_reset_assert(dev, "mclk", a_crtc->mclk_reset);
>
> It looks like these three are mirrored, and could be handled by
> reset_control_bulk_assert/deassert().

Thanks for the review. Indeed, reset_control_bulk_deassert()
walking the array in reverse gives exactly the mirrored order the
hardware wants. Will fix in v2.

Cody
