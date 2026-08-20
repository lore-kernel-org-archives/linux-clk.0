Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750B337F31E
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238545; cv=none; b=JwCjbmZbIxpJHzP6Ejrtxuq4sPa0XzMDx8RDWlzFQ7Zjz15K64di3OBg50QOREdDsgv/2I2wPofCS7L/ZAYdbeNR1Rujss2KWXYjsIwXihjemECY3dPK6y33xGDZX8pwhCfO/jXM7tp94Da/KU8SXKiuwo3NP7alvE0ifoXHkro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238545; c=relaxed/simple;
	bh=I1DtpNiKv1KnqpYZERtbv20FbK7xO5TjOqNoiX5FaIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EL8YM2kmdUgGTFMYboQ3dFUTacgoLchAA7c3EgV5BnJgfHCvqRCFaCeWc+Dnx9ajeDH6ygHruqZ1o068i9k919T3VfUDF0ytflTkneZetZxDPxsUHmjL/cA7XZ2T+0rVu+yV6Fm76LgGDtIC2dZZXeprSRj3XLi1sE67A9nLLeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IRRMS3b3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X1w8HNWb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IRRMS3b3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="X1w8HNWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787238540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gJnamaX6JlRGHuZ8sO/4OG43OjrZQHiP9rUJ3vO4bbE=;
	b=IRRMS3b3hJ7r+xeLNWemlJLoHwdh43oSJYez1onoEZpd4f/bM96CFZ5oA/g5SL4mi8lHhY
	5zjt0nDEraDG+nDURcT0lb26FF1bRoKC2vfl21Zz5m+ysWdOZ6I4vzyb6+/3EkeSx2GJdg
	UFXiRp2UP5TAXGJ22IR/8FVE/lTQHjQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-7wUfs7hOODiyY8TvO1d_1A-1; Thu, 20 Aug 2026 11:08:59 -0400
X-MC-Unique: 7wUfs7hOODiyY8TvO1d_1A-1
X-Mimecast-MFC-AGG-ID: 7wUfs7hOODiyY8TvO1d_1A_1787238539
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-822ce245c5aso67375767b3.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 08:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787238539; x=1787843339; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gJnamaX6JlRGHuZ8sO/4OG43OjrZQHiP9rUJ3vO4bbE=;
        b=X1w8HNWb/tapYuZDzYmwn4lddtV8e/WhF3vyNs6d6R5K6IbHdfJ+A+avl8BCxKweO7
         AI7bjJww1EwWh9fajvO3QQs/Eyp0cyJeXgpUIu4O8kO4Yj2bSqK14S+EvkGQk8+QAfA+
         KEFBzq+tvIcqVTPlqG7iVq4i4pj3lLPyXWzLDPaN5IxjvNAAaSp1JHWprMzSun1sqwXe
         FRez0axInHrneKlGqOfuZ6IcnEniPOiSdADATuo23SyA5DbOj+uX9qpGl+9XFIIZGFJU
         5BORRToxDJoYJQAoQ+hHv3DynpqUZbtRkBd06VMr9Xr/PkFqHQUOLxKrnSr/G+TkfC5W
         3mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787238539; x=1787843339;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJnamaX6JlRGHuZ8sO/4OG43OjrZQHiP9rUJ3vO4bbE=;
        b=JpUiIgXYsVZa5uw7fPpnVFxnQhKcaF1BhaLAWfKtwUF/AIa3iXAIeiU7QNuBpGlCJo
         Gw+1oP4LHNB7qPyqWHCmHTktmBCbFDVkYS1uhg4MqfEmhv6cxGAMurbM1G509WD13F+f
         8BHOkJOpSk/DwddvDmYTjAQWxFmcI6HFE0pmpE+3l6PR4+X1O943KI0D6EpEH5xD1173
         hVYTIjD1ieUqwiv5gBHnUA6gfsuP7qxuvTw0KR22uxFRKT4RevHXzxedSmM/PoQAfcnN
         nMyNWOJMUIJ3Q8BKYVh+Ei1OuaC7RjrHqbrmYainV2J2xMVPsR5nL1r+WM14ItVMyOK/
         xBlw==
X-Forwarded-Encrypted: i=1; AHgh+RpK49uMcF8GDWHGTaB7XYuUpg/mLJg0xe9780YkYIJNxvghvKBokr8ERwrbYzZGmmRQYsONsUrZoWI=@vger.kernel.org
X-Gm-Message-State: AFuF++ldGpbEDLtNSrt0Jx+SQGvvC7tilkTqBqVXBWPRt4xsDDh/DP/b
	FSFaq+AHvbc+go1oS+zgzlfohXC0b5o1tq3e5hR6//W3fnxNdOCGIr4uBBy6RhLyvNFm/umARHb
	J1y4gMUmu0Ksdi4KLIdoXDgO6y0v2S2oyvFgqeJQs7WMVluXGSJ+pZ7hi/O0R4w==
X-Gm-Gg: AR+sD10vW2wnUu9gPm5ZI7RiaZqA0LWNz9oGWufTRoDRTUVluas3bFdmVHJzZUce7Xc
	v+LxzCbwTUQw9JomSt4m5DduRuXYJgEIumivbCnHjhb1maBUcVAGjuI1dYrYk5rQGwvbDoB+kz8
	evzGUy6UJoQTH4uIOENpasWYe8QzJZqGXwhyCMeblE3Mt5/Gsj6YOpiaIfnQyIVnsu5PWD72+dL
	ifMVi/5itzyGbCj/D03JaVEe0rVYQP/ZHVFL9jIIM0gPp8mSmFRvW9323mJTrNWB25EQI1OT9ut
	x1qF/v1BhyEw3ly42idmeRE9/X9nVyMx80rxZQuFOwzqLJ62XO0GzKRo5nPu0BfOOrCMGcSTHiZ
	9U2GInAgfldcd2alt0+GuMQCHIrlb+SmfDek=
X-Received: by 2002:a05:690c:c59d:b0:81f:3b6d:a0a4 with SMTP id 00721157ae682-844e3d5d5cemr41714227b3.25.1787238538977;
        Thu, 20 Aug 2026 08:08:58 -0700 (PDT)
X-Received: by 2002:a05:690c:c59d:b0:81f:3b6d:a0a4 with SMTP id 00721157ae682-844e3d5d5cemr41713897b3.25.1787238538408;
        Thu, 20 Aug 2026 08:08:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845186c0dacsm26600967b3.36.2026.08.20.08.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 08:08:57 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:08:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, luca.ceresoli@bootlin.com,
	krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com,
	michal.simek@amd.com, shubhrajyoti.datta@amd.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <aocYhz_ASVhW8zfm@redhat.com>
References: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Aug 20, 2026 at 01:59:04PM +0700, Triet Hoang wrote:
> Convert the deprecated SIMPLE_DEV_PM_OPS
> to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().
> 
> This lets us drop the __maybe_unused annotations from its suspend and
> resume callbacks, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
> 
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

