Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497400;
	b=zsJhaD2QhpdeIgWghOPJaD4+/6iZQ3JaUnRJkXsQCEtOH7aEhD08i6fWwzJ6utYx03Ik
	 hfvFa+11LU02DBIWb1E4gkzQl+XFGlFhK7RJpSVraNjb4EWi2P4tgHVXJnC30Nkk7/Bs2
	 yXdWTefKpZIdtA4NHTopPN5hYR9VOsGyacttgpdqqXUY638lPqkWC6qNWJey38utjd/nj
	 mBJNzIvOkY1WwLIze5CmFrT3m1rF7Z5D55rXLfC2cxdswQlF6U12REDQa34M8rGCLDXoF
	 FHqFoEOHIVhGycW524vg4JHn1eh7pOtn94cVaMk2so3+V7lvK8sxvwkBbrxuIEy+WWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sXKCxy+bE4cVo53T4AreBZzLm1An/Wq3dYnZ7+mgP64=;
	b=oiDFBeiADnnUWIG7h35jCft3k6mCNKl8qgVeaabHgYu7Rz/16RPUKdGwi+dr3i5Ryn+e
	 6xEQWfDBOPlVhbTKThKYkycIJLoNp0Y+7TmihMG8L4TtUVwaHXFEiGFHfpNmPgBxAXDPA
	 +gR9ljhomaHePtZd00ysFmge0nAp4Sr/6bttCl4eb/NMIV/meJc/7tQnMlpgnB9eQ3Nux
	 TAcO5lMl3o0SbVL8HETUw08kpdDF/N2wG9oP+V7UXVmqib14mbI/CJOYOINj+YNhP8VMQ
	 Y890Cydf+rGMRnBOpxSC95/JHLwCsg6lof6LhPrynClH3eiHYPpL8vSW6svBzfjcOKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XQo2I8AU;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3DD606A33E
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 15:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A3DD606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XQo2I8AU
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so39207885e9.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 07:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794497398; x=1795102198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXKCxy+bE4cVo53T4AreBZzLm1An/Wq3dYnZ7+mgP64=;
        b=XQo2I8AU2JZFjXotOEh/MtTS520xxs8DfEfBd9wETl+E2ZmtkRe79gDj74QYO89b5x
         hf4QSQ+sIe8piZ0lCKDt+R+t/q7G+nHZ8+pU+AGurpVT7TBiakfL9gt6X3tuuQNmqU3G
         Tm3HEmQDjKnijAlrjvI/wgQPntEOZZqlwvATW2+LZho74rNSNN9ww282P2cQqNFA0nVW
         T60Y1ex3JVvHZqgs/wS29aF3MPa3JVY8X/KGe7fxSxIwym4+qpo0pZXm93nZEg6iexhZ
         SLXbhCjrTQRWzMkrfmx6A82OrJvmCB5OarjoigTmLttYcsPVLjDWqYquHUz2EN2kUjoi
         HHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497398; x=1795102198;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXKCxy+bE4cVo53T4AreBZzLm1An/Wq3dYnZ7+mgP64=;
        b=SSa0GQRdcRcXHoqmDPNuD5ZFExdBhPMoW5VQ/oU0fW+CEutHXzkDfcWmbU7IbCJatM
         cIEwjGs8d251O+Fo0Yy9HNwg9wV3uEP3YK/O73OHQoyhjbhB9bciAghiEaxzUf4lBpac
         y6g5OLWaKVQE3G1OB5S+HdvUDnK232IC9e8EZF9RE1cRRJKV+5g8cU2Q9PsbKteChLBv
         vwC8WR2cnW5H/+jSH2MDt19i3lW4DuAEqVn79OW36PK5DTa5VII+jppMcxl+s7JL+0Ll
         SXraR9lt0zKO2oe/IEcPRXkVfBmSsOm04Ev/cyYtnRRI+Om0gLJd9xTn20CL/8ZKOJe0
         208g==
X-Forwarded-Encrypted: i=1; AL+hErG2GVTwmQw/sMz/ZhhFvOftK05bvATRZ9pRXCgqDXiLs+jkUmFGxDirFKN/XEaNUvlmyLJrwH2qTUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S1v+TPrQ+N0hrif1keBtJcOAheLS9XtpLsNPn10bnSFFXe42v
	xAnPu2BnePOyRJYGBcdeELjYLzm99MDW3x7GMVpsoyCzcAgRUKK3u5ohUUiW2IRVdjw=
X-Gm-Gg: AYBFou3slUY0rhnkyXTePPyHfwvvI7RBTE30twCR8LZefJ97A4TwbAc1pnYrUJTq/Jn
	3V+0rS3nVKX6fE0dEiGh9OUsJxT5yyzaVlM/qlck6OCooUsOIKpFHegVSIYnDnqFrrQ9XRJTffF
	GGGWV/vRYXZxmEACPi0PiLPueKDLNe0kdcSrRQ/itz+Z39UGNEojMMW7+pBGPBOUouSqFbMZHz6
	z8uJQ5NEcY3Qezqf5q9YIOlHFAluj6KFbqwUodasXOI1Wn89l00u7YGjTWXy65REHz/MxdFLDxS
	siOt7BUBVxcK5SZSi4JVTXKXxmF+0mtye1jjYYtuHrtSb+NaR5cqAWomXBRClgMsxI/Wg2QT0F2
	hfeOY0xefTb0KDjauqN3BXEQDKCLFl1Q+S+SJOu6RHAEdr8gRkulANl3OQ/Ojzmhbs2KPqB8pJq
	sImJ98QJjJdYuUmdtxPiOCgMVfxMIDzVu93SIcsuG5nqDQ9a+ClY175HjQFUTjafYD6pJaat8uS
	1wInuErQyybYkH0wZM02zkJos2vuuIlCK56xkldy8TqpLKbg0Up1vT2edsupPszxtvBLoZWyT+b
	gMi4tVygNtP69vAMUI2DTn48M/UpBzPVMp5619zVYGqiFyfs2MJadKmjmwypDSDMgg1KE6fbQg1
	LZt8BBfbdtVb0zAAtjyEwDZcR1ioxYU0CbqDa/wozU8xK4zs=
X-Received: by 2002:a05:600c:1911:b0:4b7:6b0a:a2f6 with SMTP id 5b1f17b1804b1-4ba09381509mr118693605e9.21.1794497397629;
        Thu, 12 Nov 2026 07:29:57 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm86582715e9.10.2026.11.12.07.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:29:56 -0800 (PST)
Date: Thu, 12 Nov 2026 16:29:55 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, 
	Maxime Coquelin <maxime.coquelin@st.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Michael Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, 
	David Laight <david.laight.linux@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 1/3] clk: divider: Fix the divisor for rates above
 4.29 GHz
Message-ID: <avXa2Z3R6Xogr6Sw@macbook.homenet.telecomitalia.it>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
 <20261112-upstream-clk-divider-large-rates-v2-1-18f3bb888b0c@baylibre.com>
 <179449618653.1227210.1767827907767958978.b4-review@b4>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179449618653.1227210.1767827907767958978.b4-review@b4>

On Thu, Nov 12, 2026 at 10:09:46 +0100, Brian Masney wrote:
> Hi Carlo,

Hi Brian,

> >  static int _div_round_up(const struct clk_div_table *table,
> >  			 unsigned long parent_rate, unsigned long rate,
> >  			 unsigned long flags)
> >  {
> > -	int div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> > +	int div = _get_div_round_up(parent_rate, rate);
> 
> _get_div_round_up() returns an unsigned long however it's downsized to
> an int here.

Right, but wasn't also DIV_ROUND_UP_ULL() previously returning a u64
that was stored in the same int?

thanks,

--
Carlo Caione
