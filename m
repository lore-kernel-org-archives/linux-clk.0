Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C480331218
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907433; cv=none; b=IBn9JHIEGi6+0c77hU+KYgIg3uaWpoQDkabqRsh52efs80EFfz6T4zD1dezdKs6NT2jT1F4CtFB+VDT1tzc8Yw7CSzLs1k7YsqHXRRB/AnIbNuViwZWkzJWRKq6sgE0ok8etBNLjY6bRerMrtmqc3EjzA2uMJ4VZy6NXU1ZWHZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907433; c=relaxed/simple;
	bh=E8Mx273ImMGVdhCe31382iXpT5eY52kRrfdRCzimLTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuCBlzVJus3eBwETd1oTCLynutShOqvnWXnNPLr7rrXpP+DDhl+TwID9/EdoJa3/c5Im4lCkdpltPxAKbSNzss8uICAceljhKkOniR0mVAmq93rxQrub5OOBvAsHNd6T2qA4P6C4g/pqFo3F/mM2c/QC/BnFsVv0VBGxMhniiF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bwHsY+kG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lIdGqlHX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bwHsY+kG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lIdGqlHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aMZTdMgEwkPQanj/a0OAHfxOFan2ydElF0bb71YGl8A=;
	b=bwHsY+kGAYLKxahTGgT0bkd9nRBfcItTjUzmRbkcl1TAB1OFATg57p5ZrJzeDAcHNyrCvJ
	vaoLicixhAv/sxyd6ijW0J5fWJBBhhlxpV3NEDpaSlIsnpLe0mwqv7xVZ5rec7OFCAj7Ls
	NCF8g1MVaKIPX0RI0sOVwYKFxityBE0=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-CUsqkn2-MzOebMGmCaBUGw-1; Thu, 08 Jan 2026 16:23:49 -0500
X-MC-Unique: CUsqkn2-MzOebMGmCaBUGw-1
X-Mimecast-MFC-AGG-ID: CUsqkn2-MzOebMGmCaBUGw_1767907429
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f57d3a1acso8637771241.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907429; x=1768512229; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMZTdMgEwkPQanj/a0OAHfxOFan2ydElF0bb71YGl8A=;
        b=lIdGqlHXPE83BwqAvpSEQ4bCGh3nn41jiM4IGnhJ1K1shQl0WQz7bRDtnci7sAEuwV
         n25gBT/kVw8Ho2ygFqzu7vomgUoFIvF7igFTWYxQZkBIMRiha62AUON3t1eBgzxZWBqV
         U0gKOf1ogQRN4w+mTSv/zCkjj3m/iyKndNul3zmbGuivxFBkvrpuHdCD72gu3tiqAdDF
         lQQ2Q9ohUpPAsetf5FUUOEntiSeeoP4S2lD1v6s7KRyYiOIcamfMhSGtl5K7BJrcm6p7
         STdX7rzbYazusZRzfQGMiLFEwo9pFSVNxHDJjGgdIYw2WD5uad4IaI8/3a3pCpvkTxyP
         XWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907429; x=1768512229;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aMZTdMgEwkPQanj/a0OAHfxOFan2ydElF0bb71YGl8A=;
        b=f9VH+7MS3ueESTjcDmR2QnVyCMRErCLkktP3AF0SfihK4KNpfAe+2T+EXLacWlHM53
         T67LUlhyfKm/wPuvN5PJRmX0lbSPTvvjLKG7NZUMCYQkHnn+z0GRhRUbRvHeAkrWHw9I
         8tQD60GQFmqMFkF29CZIiud9Do7llJLMoLBLSjr7c85fkJU4w0Ka45WRQMuxbnH1lxiE
         cWezedPPNTMu57N0stk9x3xwPUzaPjYBk3qTup+2stTnzra/k+0EOkCz7OYsNa98AY/9
         oefyZyeR17CNrWJpq4kmXvFShd6en1xRrd/7L7KZrV3WFORyYkKO6km+ZBV8tFg3fxzx
         CIEA==
X-Forwarded-Encrypted: i=1; AJvYcCUlDGJY1Ho1+LxHm66OWna8j0ycW8v3CIqaGasSA5VRWxCUyZreTUd7L2hIWG7Q5w8nP4Y/eTM4REA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOH2DGX8/F4dOb2jNM1C7CLiAWHTp/xDVtQvoxnp/qRxc52awV
	YscaAfO586yH00ejlzYiQGBzL4ImzYnwgxki5rY3xVHxwH9Z+GW52eYyDqfFCl/xaLqs5rBjsZY
	vULnFoFH0a1l5jwFibjL6rpQrgoQ59cgHKi2pY29s0L+Jfh7KAyug4CNT0MNglw==
X-Gm-Gg: AY/fxX5MrN1wO2ae7/p3jeVlHMiwaqaqBPKxxfXiSFQhrNatp5CUJpZMKxVk3ORN9cl
	Z9XTkTyOEJYPyfNMaX9KPndsfhVdQB7FFMUZno3cGOLVXeMkyqZX1TyKv5TO37MUvGcp9XhoIHn
	QwZlN5qUr9Bda04Lu924+EBaERyXlPhHIV4nmet6v6f5JUaKg1fisvvy7pfdJ8hETKkpLskH/O1
	pVDqwmWu3Om3G+iIlK0GaoEBW+pwRry45q823brAXxOZabgXsMraPosybT4Rv4dDnoKtcFZVLR2
	cj4c5iKmFh5j4tlFUxFh8BUFKfc6Z2Y1B1x0SVXqsPb+4yaeGyWYhNEcGE/z/BaQJPTOP6oVcrG
	hfGWCPP7r
X-Received: by 2002:a05:6102:162a:b0:5ee:a76a:8513 with SMTP id ada2fe7eead31-5eea76a8724mr1006311137.33.1767907429149;
        Thu, 08 Jan 2026 13:23:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9+XK5E3OQPztXIo7GPKPfvpra0LA99i0XMQua/Tc/8Kj6tPqIGZY+3/QAUKTGxXE41kQHWQ==
X-Received: by 2002:a05:6102:162a:b0:5ee:a76a:8513 with SMTP id ada2fe7eead31-5eea76a8724mr1006294137.33.1767907428708;
        Thu, 08 Jan 2026 13:23:48 -0800 (PST)
Received: from redhat.com ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772e322asm7790577137.13.2026.01.08.13.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:23:48 -0800 (PST)
Date: Thu, 8 Jan 2026 16:23:34 -0500
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 9/9] phy: ti: phy-j721e-wiz: convert from round_rate()
 to determine_rate()
Message-ID: <aWAgVt599agpNqZQ@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
 <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
 <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
 <aVurM1XRqiYlzi1B@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVurM1XRqiYlzi1B@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Geert,

On Mon, Jan 05, 2026 at 07:14:43AM -0500, Brian Masney wrote:
> On Mon, Dec 29, 2025 at 11:18:52AM +0100, Geert Uytterhoeven wrote:
> > Hi Brian,
> > 
> > On Fri, 12 Dec 2025 at 00:21, Brian Masney <bmasney@redhat.com> wrote:
> > > The round_rate() clk ops is deprecated, so migrate this driver from
> > > round_rate() to determine_rate() using the Coccinelle semantic patch
> > > on the cover letter of this series.
> > >
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
> > Thanks for your patch, which is now commit 27287e3b52b5954b ("phy:
> > ti: phy-j721e-wiz: convert from round_rate() to determine_rate()")
> > in phy/next
> > 
> > > --- a/drivers/phy/ti/phy-j721e-wiz.c
> > > +++ b/drivers/phy/ti/phy-j721e-wiz.c
> > > @@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
> > >         return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
> > >  }
> > >
> > > -static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
> > > -                                  unsigned long *prate)
> > > +static int wiz_clk_div_determine_rate(struct clk_hw *hw,
> > > +                                     struct clk_rate_request *req)
> > >  {
> > >         struct wiz_clk_divider *div = to_wiz_clk_div(hw);
> > >
> > > -       return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
> > > +       req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> > > +                                      div->table, 2, 0x0);
> > 
> > Is this correct?  divider_round_rate() can return a negative error code
> > (from divider_ro_determine_rate()), which is not handled here?
> > 
> > Looks like several other users of divider_round_rate() use this
> > same logic, and thus are affected, too.
> 
> Thanks for the review! You are correct that this is a bug.
> 
> I had planned once round_rate is removed from the clk core to post a
> series to remove divider_round_rate() and divider_ro_round_rate() (plus
> the _parent functions) since they call the corresponding determine_rate
> functions. I'll bump that up on my todo list this week.

I posted a series that fixes the issue you identified, plus removes
those deprecated APIs all in one go.

https://lore.kernel.org/linux-clk/20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com/T/#t

Brian

