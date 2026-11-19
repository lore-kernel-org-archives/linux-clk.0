Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795118940;
	b=QofPjEaYHf9WnhHHGaIxFqhTVvdXnDxNzsNKUbkuXmlqWc5hE6n5rMmxZ+clDWGlJDRj
	 +BuIWZTi2y7/SsOMsNkbO4m92dNCCi0WIDzsr8hDP93Zwvoc0oTJj9czJZYskgK8CRzdk
	 rllyOgiQqbtVGxn4W1gsF0gh1UhSeVc2qULcgI6bO+6cIYA4YTzA+dgZ2N6vcQwC7JCmt
	 B3t50r7dPksNYTSOBoLSnYfXVdQmBwVRAtGTE4RN9ZapxUB/Ik+bBpXQpU2pSlyg2ofc3
	 XSBUsEC7uqGB63fVU9mAhcz5bXTV5YFHz29HQm2ASGIYPVZLJeQo4RLyE2w/hzJ4Zvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HVvG5YHdzvrDiN3SDoFdTlCgaktRbuUsF9vZ6apS5J8=;
	b=h852O0oObw1rt8xynaOINeIP8esYuFz6KjDIMUI+dFMCkU0hdhRRoUkq/hYBefQU6B2O
	 Y3pIUaKz124+B2FN+OQMp7gbRrKifBjGU86DlV+7JU/i64dVh5X4m13fev8NHyc5RdImc
	 2/vfl2J/SA8AvllwZZlz+VzDzmz9iVkH8hr330nI6VkHu9MWZ0Zt467f/EUVvCQ08fEBg
	 KSFnlIkLxTq3v6woPTIgP0S8zeQ7qEr1pH1s9pylX0NDqBIum/QhSJV7cuflXfca2zecg
	 qAXS5J9bPWb27RDrfeMbbzA62n5TrCMjnl5jNRoqYcDGUxLdJKg0Tnvigk/4P0raNCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0KuEiqY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E4F606A332
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 20:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E4F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0KuEiqY
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5495d549924so1930051cf.1
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 12:08:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795118936; cv=none;
        d=google.com; s=arc-20260327;
        b=YtdTPbTGLo85S/jA1r5rIMSa4Juk7JRGqZprvgq0Nhk5tyIIpde1yoUE3lumj5Yj2t
         XjTgnwgHqWSEnbq0Zi4zFoMOofSjzbJkrWIhvzvceEPSYTAPoaq9cw+EeriXLYLhVGAo
         Gt5Me0OploEaJ74lzMS1+RgOAzDb9VITgb6YN9uOaTEPu+kdGKJh9Vbs9Tj6uJjwpcT4
         vC0/TLC9feo03/3I1P65UTlZuRs3Hgevnc/l6vk5npg+LpdwSRReuCe+10NFBD3cjNHP
         QHVQkwtlsqtJy1+7j9DERLiSi2AMtjSJYAlxE6z18mfjNr0Hh3CcVwlLRjhJwcmSuxt/
         zGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HVvG5YHdzvrDiN3SDoFdTlCgaktRbuUsF9vZ6apS5J8=;
        fh=28eSj1T+l/gQIWmBMiq11khaPCJ/0hLlx/vTzytAvtc=;
        b=lU15cAKzVCvzi3xz84AErjtbybz0P4GKWj/Cpk+CiMH4WVOmYX4eVbZg1tqUHzs/+u
         6xe0a1uKzr3umsbmoDskPecOBxbhgsOEHY6Gw0n4k+LeuS1ETL9aIer++UY2qqqjaUQk
         cM5RnUe15K4QqTD2M3dnWspvyVB+fZ8T/6PVJElWvuUK2lB173HRNyjxkvNFV0gh6Ung
         SW/fYn3vYxnStMJbMvU1KnkLmXwa59PQaSqyrxMNpq8Equ4AwIkayRHmc2qmpVTSONY1
         hZhEqr/RGjDHoXJ8yGmS+wEFgV7mueJ+pgyST8LAFGR2Tqi+fGe8hwH9xX5iJs87Boxf
         lRfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795118936; x=1795723736; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVvG5YHdzvrDiN3SDoFdTlCgaktRbuUsF9vZ6apS5J8=;
        b=s0KuEiqY00qid/PRClTWhcEAhmyouVMS7pH3vqel2VuYNNUX5pNhhvzCMuWWbPCna4
         jnwFZDiGReRCvNye7jx8bPUY6yMC/A5SZK44MOa7reT9D0Z88UFDzf9aJA6DUoughDHT
         MS/+bqoeqvnjR2gdomEsmvfiqWNlj70n4BzgF7pfnO5CpXwH44QizTsGOP+5mcDHuSl3
         d3tySToOOFU1AuuwbfiLTSNwJbZrsf0yw/l7nDii+SG03Z3+rqO3r2e+QdfsqLBY80EQ
         6HItXskYZe6OWj00lcIGWlFLp3S/rO7C6DEVMVCTu3kn726vrj5TpM3rcPWoWqrf8f79
         kYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795118936; x=1795723736;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HVvG5YHdzvrDiN3SDoFdTlCgaktRbuUsF9vZ6apS5J8=;
        b=jmtIfFX3pbpTcUjiZgb1irVhmVqd95+sA15jMtEIFSA5b1+K2snKGnPW2e80w1j45w
         AeMjs8SNa4+XcSjhyIObTPPgf+BFP8r6Sbs43OgNIpVtjfkwaa4YQK4n4jQ2iPWQC1oo
         z+X7gA23xSI4/naDYLqhP6icZFQ+w2Oih2npmVGmvas3qS36fOnulsK6bTpoQLPgtWNX
         B+xBFnB4/F6/uOyj0AEDRgqx0CDUb9KiDR5LcSstS9ERDLyItNZnfD6+EdJxAq4kDlpA
         iDFQ3Mzc4Xdw0Dh5pjy3Tpp0yvuIuWjHJuTIPcF67VqqhZVhqNilmL41vqwitYpuybz3
         JVgQ==
X-Forwarded-Encrypted: i=1; AL+hErFkwfIilZHaJj+iSGdJd9mfLtDGDwKUSlOzh9F8jyw6h67wAei6FxRv/KOwU3nBcyx62K95GdLN7MI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G8m0Mwu6IVaaMovWNGrGU4QPz7mOz7bkoqYFZNsG70m+zGKNz
	7TzMhUYYRjOGC/V/8pLGnLMPpE+hJt+6l1459Kx6JgutNdlFVszzzj4ay/yYxWPq1lK8iw+CXzx
	KT6E2M55kptWACg5tuAA/eGir39TR3gFhOA==
X-Gm-Gg: AYBFou1mXqmMrk9FGtl0kPCrqoA1hX5n/HnQw6wFWZNBgYiweCENQ1IBDfVLnkFL7ki
	uTKQ9l3GXpruLXwJP7Sk42r/bX2RcyqnVcXc6VWL1Y4bgbagIVXb0L+n3W/Zhx5h3suLFrsSFkQ
	eKQohDsXLW0h2il5xsMdfMP0jEre1PdQRz5ITKCs0u9V8G6gEX+57SYOBxrXB6r+lD3gPN5BJ/S
	RYnoMcOPJ4d3w2pUz39Caz41y0gG1h+KYdMUoi/uKOd80saJPQuu6Nj3vBL/UMyc+UIuSJOyVxH
	4YbGol63DPubGJIdX3yWE8g/FiAi7zggw8ThMg6wX8IKhj/w+4JNd/MF8qbQ1+oqpLy7sHELlIL
	gjJe5WTmDQ/hkgAKdBC+BeeceBJHbj0Wsdm2W1OAHcv67uJoHd9aNH23y0A7Aliy5RG+jmJY7Sx
	gYdDdE
X-Received: by 2002:a05:6102:3f94:b0:7cc:2674:b78c with SMTP id
 ada2fe7eead31-7d739391bf3mr334599137.7.1795118633257; Thu, 19 Nov 2026
 12:03:53 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110001128.1041-1-ansuelsmth@gmail.com> <20261110001128.1041-2-ansuelsmth@gmail.com>
 <179444135864.1126566.17591616173966524369.b4-review@b4> <6afc8629.c6df0648.3437b8.c961@mx.google.com>
 <av9PgKqFIjNPSkTt@x1g10>
In-Reply-To: <av9PgKqFIjNPSkTt@x1g10>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Thu, 19 Nov 2026 21:03:42 +0100
X-Gm-Features: Aa3M54qAu9YBO9O8U07H3m9oFz0QtjgzL1ohhGwtFt71zpaesqgbV3dEdzubUI8
Message-ID: <CA+_ehUypOdyr4kZ0giRe9_yTweBq+5F6Xi637igt1VVTvxVquA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] clk: en7523: convert to full clk_hw implementation
 for en7581
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 19 nov 2026 alle ore 20:35 Brian Masney
<masneyb@kernel.org> ha scritto:
>
> Hi Christian,
>
> On Tue, Nov 17, 2026 at 05:51:50PM +0100, Christian Marangi wrote:
> > On Wed, Nov 11, 2026 at 06:55:58PM -0500, Brian Masney wrote:
> > > > In preparation for support of .set_rate, convert the clock register
> > > > logic from fixed clock implementation to full clk_hw implementation with
> > > > dedicated OPs for Airoha EN7581 SoC.
> > > >
> > > > This is just a rework and no behaviour change is expected.
> > > >
> > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > ---
> > > >  drivers/clk/clk-en7523.c | 75 +++++++++++++++++++++++++++++-----------
> > > >  1 file changed, 55 insertions(+), 20 deletions(-)
> > > >
> > > > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > > > index 24fdec2e6198..6640e814d36a 100644
> > > > --- a/drivers/clk/clk-en7523.c
> > > > +++ b/drivers/clk/clk-en7523.c
> > > > @@ -126,6 +126,12 @@ struct en_clk_gate {
> > > >   struct clk_hw hw;
> > > >  };
> > > >
> > > > +struct en_clk {
> > > > + struct regmap *map;
> > > > + const struct en_clk_desc *desc;
> > > > + struct clk_hw hw;
> > > > +};
> > > > +
> > > >  struct en_rst_data {
> > > >   const u16 *bank_ofs;
> > > >   const u16 *idx_map;
> > > > @@ -742,42 +748,71 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
> > > >                                en7581_rst_ofs);
> > > >  }
> > > >
> > > > +static unsigned long en7581_recalc_rate(struct clk_hw *hw,
> > > > +                                 unsigned long parent_rate)
> > > > +{
> > > > + struct en_clk *c = container_of(hw, struct en_clk, hw);
> > > > + const struct en_clk_desc *desc = c->desc;
> > > > + struct device *dev = clk_hw_get_dev(hw);
> > > > + struct regmap *map = c->map;
> > > > + u32 val, reg;
> > > > + u32 rate;
> > > > + int err;
> > > > +
> > > > + err = regmap_read(map, desc->base_reg, &val);
> > > > + if (err) {
> > > > +         dev_err(dev, "Failed reading fixed clk rate %s: %d\n",
> > > > +                 desc->name, err);
> > > > +         return 0;
> > > > + }
> > > > + rate = en7523_get_base_rate(desc, val);
> > > > +
> > > > + reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> > > > + err = regmap_read(map, reg, &val);
> > > > + if (err) {
> > > > +         dev_err(dev, "Failed reading fixed clk div %s: %d\n",
> > > > +                 desc->name, err);
> > > > +         return 0;
> > > > + }
> > > > +
> > > > + return rate / en7523_get_div(desc, val);
> > > > +}
> > > > +
> > > > +static const struct clk_ops en7581_clk_ops = {
> > > > + .recalc_rate = en7581_recalc_rate,
> > > > +};
> > > > +
> > > >  static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
> > > >                              struct regmap *map, void __iomem *base)
> > > >  {
> > > >   struct clk_hw *hw;
> > > > - u32 rate;
> > > >   int i;
> > > >
> > > >   for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
> > > >           const struct en_clk_desc *desc = &en7581_base_clks[i];
> > > > -         u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> > > > +         struct clk_init_data init = {
> > > > +                 .ops = &en7581_clk_ops,
> > > > +         };
> > > > +         struct en_clk *en_clk;
> > > >           int err;
> > > >
> > > > -         err = regmap_read(map, desc->base_reg, &val);
> > > > +         en_clk = devm_kzalloc_obj(dev, *en_clk);
> > > > +         if (!en_clk)
> > > > +                 continue;
> > >
> > > return -ENOMEM;
> >
> > Hi Brain,
> >
> > as you pointed out in the previous revision, returning would change the
> > behaviour so I currently skip the clock in such case...
>
> It's ok if it changes the behavior to make things interact with the
> framework correctly. I just pointed out that the commit message says
> there is no behavior change. You can drop that sentence and just
> describe the behavior change in the commit message.
>

Thanks a lot for the followup even if it was on a previous revision.

Ok I will change it for v7.
