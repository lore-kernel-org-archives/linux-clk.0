Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02E839526A
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 22:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785843; cv=none; b=ENj4cY19LjDLJJFDHiniwJX0MstBQKajZaPqBSgWnrofeZMjdOlK88iXW0XxUzLIue24Jlj9kcoJoCqSoPKOJ924E4doodeSv/XVNqqvcYgyYFKGWqyrG6ZAd5yHdIvwm7K4WOo8WJxsndl1huWv5kaWOIBKAGa3+HoGZI6xctQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785843; c=relaxed/simple;
	bh=gMWzHfXOSUAzAbUgCf0jPYssjSUebade4HuzStLkeZ8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBALMQBvdTKZzRPYr/7XV6fKs9PXsbXJbWiKGJy1EwZr4l0Z8pmW2JtEyOfz14tjzsO26chGx0jpmKJ2TUqZCk7LuEgnxX0T9/B+dgG6qr3Woj47YuSLNyvwTE6+Rx6bEgM0f7+TGYaHFxVKrMOK1JJR8bAPCLG2fVm/zXs6RrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dr2azoJg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dr2azoJg"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48374014a77so68553945e9.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 15:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773785839; x=1774390639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GINAeZ///AzisnC6InzW9YS2TcP/dUfsgkrAnsM793U=;
        b=Dr2azoJgd/oRYJwfm8KQmRaadP4YqZZwEdGOUVYejbOy77EBlTndaih+UMTJ3ETZru
         L6PPb/aeb/dY6cJeY862fvcgC3pNNl+4edma5t+P2rYThQsQpnR7671h6Wa8mPmPEllc
         mUWS876bjZxJ2pHqMAyT03koWBi9XdeYAevnAjAg2Y7MCrggmzDdN5Xm8ySevbgmh1jS
         JGVvrFVzg5ZxNUrywpybgOBYAMosyP0dN4797oszqur8puNafPKtqO+lHM4Pnn9z8Ydp
         DCM0SsPdy99gixw9/8WJQRAPGni7qCfL1JKmNeEkvkw2ToTOoL6ftcXq5b0PCz/AcUkQ
         fpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773785839; x=1774390639;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GINAeZ///AzisnC6InzW9YS2TcP/dUfsgkrAnsM793U=;
        b=CoqXZj2JHyEtrLs92TN0jCnae25pA7I+S1nVesF89BUbd+zr1VL+xUv9NGy6hIf0Fi
         QUGCz0y0x637P/8fftBmXnGf2hdk6YVTVcuicgx9UX740zLLCSq4l9b4cntOrP/sahK4
         JtZ0r0QAOaMuan4UtlGosK3ya75vYm2ZUuwg66WDuEsDJxoZnHLD5juz5un/J9RHqrM+
         Q6GyXokB7xdmnESu4rsGv4SCpDybRmesE8Ut9FaRPgPMcwk5yX/SZbFOLjMmfByb1Fun
         puEX+1oH8sShcMLRr5AzT/FRVAgvuIA7pTv5eJ6yyZ4EwrcC+QD1+IPllPsBsTswQT2J
         CCKw==
X-Forwarded-Encrypted: i=1; AJvYcCWk9nZ2A7hUImBT8eoVsD9YJGO/4ds7NLsfj97SBlIBRjmKICXZxIoMeTwssKjfYyygY3VTZ8enErw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw850ic5OKK2cNZLAPg3dBnj954+dD6W8rKHhpYzJ6VJh2engC4
	c9ex5E14FhdnxOhbGUB3yC9GS8lC7r3bXqjEDDGAeLvwMiEHYCHnt17S
X-Gm-Gg: ATEYQzwmFfVtjl0ARfLbqfb3eGBPxTRT5kpEFikwh4nWc1I7h8OY9Cu/Hh2RXN/2elW
	l0mQAxMbGtn794vrJ+I6LTIrb6psLQrRs6bHytlw18y7Dv+aGgo1A9lyA/fp9mRD3dzutV10iiP
	MJ0zFhV8aaqI7/xP+W2YbT6RBe0m5Pa/fxahpspZIyjEnAqzjl3sW3niO2dwvei2jh9g9Ww7WC8
	zrhl7FcdSaIMBQEgjur9z5flX4ps300kmetXjzHJRs06Ids3lDXU2ccuQAHFao5uMqYz8x+fs/R
	0zP9cVmk4EKtWPMPqoP6V2FKDHwBuk8OfMg3+qZeWqrsqYkUuBLOy9V6oYS+Z7PYcFbB6V+laSL
	Tpb5sB7IGnsotFMInSAncHVPzeWk1AKlhqzuK49ophe0PdoXFUDINnlNja2RFl0bWuFVlM6DeQE
	Bj9NIi/o+OZbYDff/Y7nREMGmjPYB6MZrpQxrXdEc7aQp7ohc53FDrfQ==
X-Received: by 2002:a05:6000:26c7:b0:43b:47cd:8f6c with SMTP id ffacd0b85a97d-43b527abd15mr1510416f8f.20.1773785838695;
        Tue, 17 Mar 2026 15:17:18 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892244sm2488680f8f.22.2026.03.17.15.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 15:17:17 -0700 (PDT)
Message-ID: <69b9d2ed.df0a0220.126423.ca41@mx.google.com>
X-Google-Original-Message-ID: <abnS6vX2Vtq5iIA0@Ansuel-XPS.>
Date: Tue, 17 Mar 2026 23:17:14 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: add clk_hw_recalc_rate() to trigger HW clk rate
 recalculation
References: <20260317173255.5531-1-ansuelsmth@gmail.com>
 <abnRID0SfnQlRw-e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abnRID0SfnQlRw-e@redhat.com>

On Tue, Mar 17, 2026 at 06:09:36PM -0400, Brian Masney wrote:
> Hi Christian,
> 
> On Tue, Mar 17, 2026 at 06:32:45PM +0100, Christian Marangi wrote:
> > There is currently a latent problem with HW clk that only expose a
> > .recalc_rate OP and doesn't have a .set_rate() and also have the
> > CLK_GET_RATE_NOCACHE flag set. In such case the rate in clk core is
> > parsed only (and set) only at init and when the full clk_set_rate()
> > is called. In every other case .recalc_rate() is never called.
> 
> As you pointed out below, it's also called for the full clk_get_rate().
>

Yes but normally clk_get_rate is used from the consumer while producer use
clk_hw_get_rate() and this is where the problem happens.

> > 
> > It's also possible that an HW clk of this type, initially report 0 as rate
> > as the register are still not configured and the HW clk effectively doesn't
> > return any rate.
> > 
> > This gets especially problematic when a clock provider use such clk as a
> > parent and require the rate for parent selection for the final rate
> > calculation.
> > 
> > In such case, since the HW clk rate is never updated after init, it's still
> > 0 and cause problems with any other HW clk that use .determine_rate() or
> > .round_rate() and search for the closest rate using clk_hw_get_rate() on
> > the parents.
> > 
> > This doesn't happen if the full clk_get_rate() is used instead as it will
> > check if CLK_GET_RATE_NOCACHE is set and recalculate the rate accordingly.
> > 
> > Updating the clk_hw_get_rate() to align to what clk_get_rate() does is not
> > possible as it should be lockless and might cause problems in any user of
> > clk_hw_get_rate().
> > 
> > A more safe approach is the introduction of a direct function that triggers
> > the HW clk rate recalculation, clk_hw_recalc_rate().
> > 
> > Any driver that implement an HW clk that entirely depends on some register
> > to configure the rate (that are externally configured) and have only
> > .recalc_rate() and set CLK_GET_RATE_NOCACHE (aka the case where the HW clk
> > rate actually change and depends on the external register configuration)
> > will have to call clk_hw_recalc_rate() on the HW clk after changing the
> > register configuration to sync the CCF with the new rate for the HW clk.
> > 
> > Example:
> > 
> >  - All register zero -> HW clk rate = 0
> >  - PCS configure USXGMII mode -> HW clk rate = 0
> >  - PCS call clk_hw_recalc_rate() -> HW clk rate = 312MHz
> >  - Port goes UP
> >  - PCS/MAC scale the PHY port clock correctly by having
> >    the correct reference clock as parent (instead of 0)
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/clk/clk.c            | 23 +++++++++++++++++++++++
> >  include/linux/clk-provider.h |  1 +
> >  2 files changed, 24 insertions(+)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 47093cda9df3..35e0cf627c24 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1977,6 +1977,29 @@ static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
> >  	return clk_core_get_rate_nolock(core);
> >  }
> >  
> > +/**
> > + * clk_hw_recalc_rate - trigger rate recalculation for clk_hw
> > + * @hw: clk_hw associated with the clk to recalculate for
> > + *
> > + * Use clk_hw_recalc_rate() for the hw clk where the rate
> > + * entirely depend on register configuration and doesn't have
> > + * a .set_rate() OP. In such case, after modifying the register
> > + * that would change the rate for the hw clk, call
> > + * clk_hw_recalc_rate() to sync the CCF with the new clk rate.
> > + */
> > +void clk_hw_recalc_rate(const struct clk_hw *hw)
> > +{
> > +	struct clk_core *core = hw->core;
> > +
> > +	if (!core || !(core->flags & CLK_GET_RATE_NOCACHE))
> > +		return;
> > +
> > +	clk_prepare_lock();
> > +	__clk_recalc_rates(core, false, 0);
> > +	clk_prepare_unlock();
> > +}
> > +EXPORT_SYMBOL_GPL(clk_hw_recalc_rate);
> 
> There's no user of this new function. You need to also include a user
> so that we can see the complete picture of how this will be used.
> 
> If it helps to demonstrate the problem, you can also add to the clk
> kunit tests in drivers/clk/clk_test.c.
> 

Yes I know a user is needed but the user will be a PCS driver and it might
take a while for it to get proposed. If I implement a repro in clk_test is
there a chance to implement this without an user?

-- 
	Ansuel
