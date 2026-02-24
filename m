Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30C886331
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 00:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771980080; cv=none; b=SuXQB6TdEqtaUM3BGavb0T235EctNILQ2AzGFFw26QHazHi3rZweQGCcKkBMips2i0FyDkKX8eB3H/CNmYI1T39ZaI73KH1mzwwJzMEXlYAm2Hi6chqnYd0jHX5h2loway4KJAnNTBnz/LvObXFQA6Jb4e5lzs2CC098F3v63V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771980080; c=relaxed/simple;
	bh=tl3OPK/hJINVZ0Pvce1rUGnVr5aWQIysiAoOV5Ez3PY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iIYsTl+kIWLzmOrG+yc1nhdAZZVCYNn8MjUEMo9tYWNkoq3/iUSzvA3QbFbUOfo1kLymS7qwcJWOIjMVYZAjAiWWtVKXPOqM2TaxhRBPRi6Q0r9xRnS8blbdzQRQchjnPSb5+hXJWe1EGm/EL5A1DHxGZD4cd4pQq9Iet0Z6FAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtUCWpk1; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtUCWpk1"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59dea72099eso6340398e87.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 16:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771980077; x=1772584877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6iwHZc2jfg2/r/xq9JQ72DyFmTmkaGJ+WYvMYjFtgQ=;
        b=FtUCWpk13FY9HHi9zGSB5wENUNitWi0R/+4B+hBS2zv9goFz9nGuwSfYQqfSppuoMU
         i/cFq+Tm8x4ydbzcO6osTgw355xRgktRaElPPcOnPU1oni7HNbQryoJyEmEiFkDaf8jr
         RBfGs4tYhYU8ga+0HAD0eSc8N0+yOkE8gfKQIzH010x4sHvXcZg1z9CcN/zo3InLBquY
         5NRUVJT12w/3DQpCOq5PdvfVWbKUP5Wg5ECE7r3DyI1IwCJ6trNIHsjDsUU4Xw/uBopH
         Ef2AdpvHNFJ5VREey66DB8RyPm6oYhKxzjZBQnn1sK9kzuqd6lctahd9gDV/L9APkxs2
         Aqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771980077; x=1772584877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u6iwHZc2jfg2/r/xq9JQ72DyFmTmkaGJ+WYvMYjFtgQ=;
        b=t0meOxMW7laUdJyCs8EnpM7q1BvzG9EnE0iV0bp48vvXybjxTgh7PK0ZvYTIAn+48t
         UzYAd2kARKsziIJzRjs6cy9ak8FmCEZW7MkyUDJlj08FF5aNYgooe3zjBQwyI5aJZLjS
         YlGPowI+Fomj3juyIAOvbO/XtD6OLYENwjPrinuHRv0YbfRDbpKPOGncI3W1rrEoyaTN
         pNxZefF8pPqbTL222pDlN1CwIjHYHvkrEUVEyYmI83NBGM5WvLs6hS5aefIlxKBBn3uy
         pvOxG7zqz9rZnQ5cxmbs4BKUudDmvcqMU7i/OvkpqjdyzmOXAw9kbXcnpUbHvM/F449t
         7ADQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQcXqnrhrC0hzYJLkmFgCdDbpqW9wLO2BOMjfijzXlxq4/uRgj1t8cMsg4EdKxK0gCQX1bR7hljAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9BoJecZmtwJfKJR1zVtN7CXbF9fQZHbJEuHxW/WjwoTiSjTrO
	RQDrqKJsS9eMvOfIF75g6GMKDyGlTNkxUdZzBCldXJy5mLXSO8jQ6vhauVFkBvoy
X-Gm-Gg: ATEYQzzXu3f9iKeGMoNBHbV9ljpuwcj13/WWgBqMts8qEiFD0wvP7ICq6JO7oDLy5Gc
	l7Aw0cy3MvgMcT5PA4V5QsAbO9BvEpWe6Pglbvwn6fUX0pgzmuV1IZCiqGzScLEfUbNZdlUblKQ
	t+9UR7b/L5gO3EyhWmmuhqx2tS515JgtjrmThE76WW67buThFNC9f7ifp4tTorfJ4ezhClJoman
	OVQiG22Yk4mhrFlLDfFZPiK44rO7mn2TxC88Q/DVJ8Tb2kFAUkCy0t7j5Diz48gaVEK5AxtcCwR
	Kdg8Xh4uUwidEV2utiE0VO322/rLXkip4HEtVym10lT6MeyYyXFmrx6WjaDww54WD6JJqb6rHY3
	VGWI5XssIanEfgtFIr1yfrunEyyv9Y/pv7tZPF5VxP/PeYIgetYPrdzPUJTh8RgCuLhoYv1ETgn
	DSFdMVc21im7wU7FpCBPFLzrcEZCC6Agww48mgDF9+CgAjCalTOXexHabCr5XLW3x2
X-Received: by 2002:a05:600c:5289:b0:480:1b65:b744 with SMTP id 5b1f17b1804b1-483bef5c44fmr5962925e9.28.1771973422565;
        Tue, 24 Feb 2026 14:50:22 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd73ea7esm24486485e9.15.2026.02.24.14.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:50:21 -0800 (PST)
Date: Tue, 24 Feb 2026 22:50:20 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] clk: microchip: core: update to use div64_ul()
 instead of do_div()
Message-ID: <20260224225020.38032819@pumpkin>
In-Reply-To: <aZ3YI2eyyYLWl-dy@redhat.com>
References: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>
	<20260222-clk-microchip-pic32-v1-1-ceacbcd515d1@redhat.com>
	<20260223090948.7970ca87@pumpkin>
	<aZ3YI2eyyYLWl-dy@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Feb 2026 11:56:03 -0500
Brian Masney <bmasney@redhat.com> wrote:

> Hi David,
> 
> On Mon, Feb 23, 2026 at 09:09:48AM +0000, David Laight wrote:
> > On Sun, 22 Feb 2026 18:51:04 -0500
> > Brian Masney <bmasney@redhat.com> wrote:
> >   
> > > This driver is currently only compiled on 32-bit MIPS systems. When
> > > compiling on 64-bit systems, the build fails with:
> > > 
> > >     WARNING: do_div() does a 64-by-32 division, please consider using
> > >     div64_ul instead.
> > > 
> > > Let's update this to use div64_ul() in preparation for allowing this
> > > driver to be compiled on all architectures.  
> > 
> > There are a log of 'long' in that code that hold clock frequencies.
> > I suspect they should be u32 (I think someone was scared that int might be 16bit).  
> 
> Instead of calling:
> 
>     do_div(frac, rate);
> 
> Where frac is a u64, and rate is an unsigned long, I could just cast the
> rate to a u32 like this:
> 
>     do_div(frac, (u32) rate);
> 
> Thoughts?

That cast is horrid :-)

On x86 (32bit or 64bit) I'm not sure it makes any difference whether
you use do_div() or div64_ul().
Other architectures will be different.

I originally thought that do_div() was a simpler wrapper on the x86
divide instruction - so required that both the quotient and remainder
be 32bits. But Linus corrected me saying it had always generated a
64bit quotient.
So on 32bit div64_ul() is pretty much the same code with the same timings.
The 'optimised' (and unusual) parameter rules are also pretty much
a waste of time, div takes 38/41 clocks on a '386 (I happen to have the
book on my desk!) an extra register move wouldn't matter.

Divide doesn't get much faster, 64 by 32 speeds up a bit, but you
have to get to cannon lake or zen3 to get a significant improvement.

zen3+ execute the 128 by 64 divide only slightly slower than 64 by 32.
64bit Intel is another matter entirely.
Even coffee lake has:
                                    reciprocal
         u-ops  -- ports -- latency throughput
DIV r32  10 10  p0 p1 p5 p6   26        6
DIV r64  36 36  p0 p1 p5 p6  35-88    21-83
So the r64 (128 by 64) divide is a lot slower, and especially so
when it isn't really needed.

Both do_div() and div64_ul() do a 128 by 64 divide.
Even though do_div() would be likely faster using the 32bit sequence.
(Especially if the condition were fixed to that it used two divides
less often.)

Still not sure of the numeric domain of 'frac'.

	David

> 
> Brian
> 
> 
> >   
> > > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202601160758.bpkN4546-lkp@intel.com/
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > ---
> > >  drivers/clk/microchip/clk-core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
> > > index 692152b5094e00bf5acb19a67cf41e6c86b11f35..2e86ad846a66cd5487f5412c09ab0ad25ebe3f79 100644
> > > --- a/drivers/clk/microchip/clk-core.c
> > > +++ b/drivers/clk/microchip/clk-core.c
> > > @@ -341,7 +341,7 @@ static void roclk_calc_div_trim(unsigned long rate,
> > >  		div = parent_rate / (rate << 1);
> > >  		frac = parent_rate;
> > >  		frac <<= 8;
> > > -		do_div(frac, rate);
> > > +		frac = div64_ul(frac, rate);
> > >  		frac -= (u64)(div << 9);  
> > 
> > Is that cast in the right place?
> > I suspect 'div' can't be large enough to need it, but it's presence makes
> > my wonder ...
> > 
> > 	David
> >   
> > >  
> > >  		rodiv = (div > REFO_DIV_MASK) ? REFO_DIV_MASK : div;
> > >   
> >   
> 

