Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E817387362
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778532103; cv=none; b=Tx1K6O8JQKtd1XQP3LhBtWUA1izkHQUtkxmx/k2Rp66iUzBlIlQKpJjcSCiJHfC9mpRV7GsIxOeTQGpjE/SnSPy4pBbR6iEvl5NkescdrGWNW+89rWQsAq0sVxnDSTsALPBBvRupQGJH0TD4uBV9DnN1Vi/Gxm0pn0OAfR2L7Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778532103; c=relaxed/simple;
	bh=71MReg26wB1uti72hY48us1SYlnbAwvBMD9vyF1L6VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EC0OoDNSm/WlRPJOvLzfRjIEQRry/CAqNfBie82exo8BhY3APt/o6hwhNSyQpu67t/FHrhWCxNuWH+3nKUZpfSbE7t8LQSbTwUcgdDk9iBzABQK1NwSV0qP3aW5Nc/C2iSD1IV35FeYsLk+aEJ3JROGYjqmWz8XG69NhfG8swoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J5BjjX6B; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=T7H9r5mt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J5BjjX6B";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="T7H9r5mt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778532101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xDfLIv6tiWpmACcsMnlD5yn+pQeqBizpoJHnp+m+Mek=;
	b=J5BjjX6BWmkvVStnPPEJnJ0dpkln2l9LC7c7EkwUk9MiwKsoEFOCFOpOnr53maUczpjNPs
	omxafssGgLLGafekPODPMMr8GFx45GXlWDN3n8bvDTJ87G43mMbtIXG43vCYiKYilQHzON
	O8hijnVC8dd3dIq1Eckwlz3oW1xpXxE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-cK_xjJ06NKWQbCFBFYTMyA-1; Mon, 11 May 2026 16:41:40 -0400
X-MC-Unique: cK_xjJ06NKWQbCFBFYTMyA-1
X-Mimecast-MFC-AGG-ID: cK_xjJ06NKWQbCFBFYTMyA_1778532099
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b640ede74bso82831046d6.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 13:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778532099; x=1779136899; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDfLIv6tiWpmACcsMnlD5yn+pQeqBizpoJHnp+m+Mek=;
        b=T7H9r5mt7ronuowycgz5mPuhHc043Mnx5pclao9ue3Ne1mu4DUZM0trJQkAkXJ3g5Z
         7Fl8vwFtk2nyrCpG40H1HmORiLMZOkACsO+/dCMEREZ/bx7naZ+d3IVko4j51tUaualh
         1uh9r9K3aVCljFAJl0lafxFDPxnprWGh5wImwcMQGQnRBdQ30EfoIy6nInnLW9tbp1gu
         GZDePyWsOfRkt1OL3MKPEmmabJW2gKKdTOEX3K+9B2JjYRW89w9FulfmecmKVGSUWhjj
         eDbFbBB5lhz7PWLZdmiEBSIQf0Wm3FngG8b7BOv++eFUg+n5P1kP7T80/jSNQViNRG6F
         seTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778532099; x=1779136899;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDfLIv6tiWpmACcsMnlD5yn+pQeqBizpoJHnp+m+Mek=;
        b=Y+lUWlFAmH9WTiJD+facgwqCJNbYEkWJLjrrYR44RaDx4+kH25XwQ54txJDUFtzYQd
         oFHW26tDG8noj2UA0mZKCOMrEbp4esoBkJakXdNTLi46Eq4b5dzg1qVa769OoUIE+RB6
         +vtCsRm+6YNs5aZWy9j6GMjxNQg1K2kWKB7i55SozAANIs/r2aHviMNDIsdnA2ryoUrW
         dbS9NUIuWnZKSzl+yBbPC4tQvuJScEOPqIktBcxUM4wQ92+JJ+ypW26Ok7eUzuSCvuC0
         XHYtO9rVe+FMBuywfR1qmhIZFuzgOA3LUO6zARHJqFN7vXgVZ2DbC1pUiIVMd4xGDPNc
         Ce6g==
X-Gm-Message-State: AOJu0YyCyb/16QpvXlzHwnOoLTJEs36iccHQcM97zv7yhElo1M1j4yNL
	zBSF2XrKjzM9HilFWl32h+ZM8M1758VN/u5IuUvH9/PEnNJCzgfSZKkTrEtZmFGDal4SgtbkOS5
	MSRQjCCcQNkptst5kVLrezHwzT4x2pZoJaEW+pzCaT4ECEYomW+xIeVFrYg5o86dwXRlvOA==
X-Gm-Gg: Acq92OHZiQEWj1om5V7bDeYAYTkTWvxZLUVSO40aISptiSe3M+rZxeUl/r0szeGJU2P
	MmiYJoPUXfmXKN2iWaNanJri3T7V9HBhq3l22yomtWWoGU/wET0x6rxgvRYA0Gy5rXFuSlIm3jn
	ob1nIKTTwV06Nmv33XkBlGDCERZEGt0wNJH2fPJz9HX3mN9lYNOXiamOqnwvVTUES/Fh/GPgZMc
	XR6Owyp0rgy6dTLWa/PydiOtIcJAo1QoqWBxdYE+GONDn52ZkyR2wjojM6phlUp7NAsomgVzGCB
	9z5d5yZtVRNGcqQREFi9L7pOUHO5L5zTt5SHp/xaNJ6qtGUOk1rew/D9S/E+UDY4TYn43wfJx7G
	Lyvzaqcb/3nKBt9xE+/R1i+r1tJrVQVuR0yP7lhgoFhQnUwaw7JeToJtt
X-Received: by 2002:a05:6214:3c8c:b0:8ba:942:3e38 with SMTP id 6a1803df08f44-8c661e86acdmr4794276d6.19.1778532099487;
        Mon, 11 May 2026 13:41:39 -0700 (PDT)
X-Received: by 2002:a05:6214:3c8c:b0:8ba:942:3e38 with SMTP id 6a1803df08f44-8c661e86acdmr4793766d6.19.1778532098935;
        Mon, 11 May 2026 13:41:38 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0c4c9dsm108806616d6.5.2026.05.11.13.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:41:38 -0700 (PDT)
Date: Mon, 11 May 2026 16:41:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH] clk: rockchip: Use flexible array for clock table
Message-ID: <agI_ANymmPyyWxuE@redhat.com>
References: <20260511032252.361906-1-rosenp@gmail.com>
 <agH-ivEdw12_3OJz@redhat.com>
 <CAKxU2N-nEx-=KFh9djQRGZVTR_HJTSrJYzAa8NR+4QcNvbkxqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N-nEx-=KFh9djQRGZVTR_HJTSrJYzAa8NR+4QcNvbkxqw@mail.gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

+ Gustavo

On Mon, May 11, 2026 at 12:08:56PM -0700, Rosen Penev wrote:
> On Mon, May 11, 2026 at 9:06 AM Brian Masney <bmasney@redhat.com> wrote:
> >
> > Hi Rosen,
> >
> > On Sun, May 10, 2026 at 08:22:52PM -0700, Rosen Penev wrote:
> > > Store the clock lookup table in the Rockchip clock provider
> > > allocation instead of allocating it separately.
> > >
> > > This ties the table lifetime directly to the provider and removes a
> > > separate allocation failure path while preserving the clk_onecell_data
> > > lookup interface.
> > >
> > > Assisted-by: Codex:GPT-5.5
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/clk/rockchip/clk.c | 17 ++++-------------
> > >  drivers/clk/rockchip/clk.h |  2 ++
> > >  2 files changed, 6 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> > > index ee8c79b938d3..dbb4b6f33abb 100644
> > > --- a/drivers/clk/rockchip/clk.c
> > > +++ b/drivers/clk/rockchip/clk.c
> > > @@ -359,26 +359,21 @@ static struct rockchip_clk_provider *rockchip_clk_init_base(
> > >               unsigned long nr_clks, bool has_late_clocks)
> > >  {
> > >       struct rockchip_clk_provider *ctx;
> > > -     struct clk **clk_table;
> > >       struct clk *default_clk_val;
> > >       int i;
> > >
> > >       default_clk_val = ERR_PTR(has_late_clocks ? -EPROBE_DEFER : -ENOENT);
> > >
> > > -     ctx = kzalloc_obj(struct rockchip_clk_provider);
> > > +     ctx = kzalloc_flex(*ctx, clk_table, nr_clks);
> > >       if (!ctx)
> > >               return ERR_PTR(-ENOMEM);
> > >
> > > -     clk_table = kzalloc_objs(struct clk *, nr_clks);
> > > -     if (!clk_table)
> > > -             goto err_free;
> > > -
> > >       for (i = 0; i < nr_clks; ++i)
> > > -             clk_table[i] = default_clk_val;
> > > +             ctx->clk_table[i] = default_clk_val;
> > >
> > > -     ctx->reg_base = base;
> > > -     ctx->clk_data.clks = clk_table;
> > >       ctx->clk_data.clk_num = nr_clks;
> > > +     ctx->clk_data.clks = ctx->clk_table;
> >
> > Where's the __counted_by? Also struct clk_onecell_data is embedded
> > inside struct rockchip_clk_provider, and I'm not sure offhand how
> > that'll work.
> Not present. __counted_by does not work with embedded struct members.
> No need to add one IMO.

I'll be honest that I'm not sure what's correct here. I added Gustavo
since I saw comments from him before about these types of changes.

Brian

