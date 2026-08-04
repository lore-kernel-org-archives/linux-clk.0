Received: from out-2z4y-a153.jellyfish.systems (out-2z4y-a153.jellyfish.systems [198.54.127.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229E423EAB0
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 06:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785824841; cv=none; b=CR08FtAYPPrp1vnT8kGYLuJ++lVtyJcmNhytJ6mMsn60JzxsjZnwlrv0Zxc1TPwh2aYr61OYD5lnsOxc5d3/3640CC1YDxnZsA7iM4nqXEXUsLbc556anN3SoTLweJKsC87OfYMl2CuU/qXReXVE4Mw6Rj/bWhnEuFoyw03LZho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785824841; c=relaxed/simple;
	bh=lOzqX6Wy2nSakwBrRt0SCZhHihdfu3x6QmzMaWt90Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4jW6hZpcdrxePniBuZKoP1LC9kLRVHESIMZK/m68MUEijHl+mJVMjOvSTnPuC2axulD35mQUIeqjNNEzwz+C8Rer1zSZzsxaBiQYQ+KhvWVX042PJn65FyyADii3o42T2u+4fbOfD09IWGxNq1l9ZfinDdW2mvVVqEYssslXWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=e52EOm9Q; arc=none smtp.client-ip=198.54.127.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="e52EOm9Q"
Received: from gurudas.dev (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hDjv55x8rz6tkM;
	Tue, 04 Aug 2026 06:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1785824098;
	bh=oS//Vk7TT83gIs8sXgHDLQHLb8n9YFC0RWYbFuLvwzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e52EOm9QgsUM2lsTkQXhHST4o2WaGSg4l3MWdBP8iCTgL83XtC30zggMo49sUIW7Q
	 5VXYgOiAHwvncjTu7mSmJpp8uQT8UKcOwxAFTsNd/E/iTSyV8QllHGoO/vhe5tIPkV
	 aDAmYyNyF1Q1rtYkSL/Q4oBooQSdMbGnpTi9h4cCBzla1aIXj5QmbT0wQh7qqsfqE+
	 iX3jSV6EGqoEQsymOKWRqOBfyEvTTjjA9U6U5Fywkv6MaZXowzqb67462xwJdnGw/f
	 I5UUOlkBtoLoh/W1J9+SyY7lUQjGnUeD8JHHIYGvnXGG368gVVkX7mZ4v0EdafZCEa
	 94cVR7cuvQRRA==
Date: Mon, 3 Aug 2026 23:14:55 -0700
From: Guru Das Srinagesh <linux@gurudas.dev>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Nicolas Palix <nicolas.palix@imag.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] coccinelle: Detect clk_register() anti-pattern
Message-ID: <anGDX4xWItkoXTo9@gurudas.dev>
Mail-Followup-To: Julia Lawall <julia.lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org
References: <20260802-cocci-clk-register-v1-1-df68afcb1eef@gurudas.dev>
 <31eb2139-eb3c-912b-9f61-4aa77df7a5ee@inria.fr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31eb2139-eb3c-912b-9f61-4aa77df7a5ee@inria.fr>
X-Envelope-From: linux@gurudas.dev

Hi Julia,

Thank you so much for the review.

On Sun, Aug 02, 2026 at 11:01:08AM +0200, Julia Lawall wrote:
> 
> 
> On Sun, 2 Aug 2026, Guru Das Srinagesh wrote:

--->8---

> > diff --git a/scripts/coccinelle/api/clk_register.cocci b/scripts/coccinelle/api/clk_register.cocci
> > new file mode 100644
> > index 000000000000..fe5bcd4b00d4
> > --- /dev/null
> > +++ b/scripts/coccinelle/api/clk_register.cocci
> > @@ -0,0 +1,125 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/// Remove error messages after clk registration failures, because
> > +/// clk_register(), clk_hw_register(), and their variants already log
> > +/// an error when they fail. See commit 12a0fd23e870 ("clk: Print an
> > +/// error when clk registration fails").
> > +//
> > +// Confidence: Medium
> > +// Options: --include-headers
> > +
> > +virtual patch
> > +virtual context
> > +virtual org
> > +virtual report
> > +
> > +@depends on context@
> > +expression clk;
> > +identifier reg =~ "^(devm_)?clk_register$";
> > +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> > +@@
> > +
> > +clk = reg(...);
> 
> From a performance point of view, it would be desirable to put instead
> \(devm_clk_register\|clk_register\).  This will trigger some
> optimizations that won't be triggered by a regular expression.

Done.

> 
> 
> > +if ( \( IS_ERR(clk) \| IS_ERR(clk) == 1 \) )
> > +{
> > +...
> > +*voidfn(...);
> > +...
> > +}
> > +
> > +@depends on patch@
> > +expression clk;
> > +identifier reg =~ "^(devm_)?clk_register$";
> > +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> > +@@
> > +
> > +clk = reg(...);
> > +if ( \( IS_ERR(clk) \| IS_ERR(clk) == 1 \) )
> > +{
> > +...
> > +-voidfn(...);
> > +...
> > +}
> > +
> > +@r1 depends on org || report@
> > +position p1;
> > +expression clk;
> > +identifier reg =~ "^(devm_)?clk_register$";
> > +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> > +@@
> > +
> > +clk = reg(...);
> > +if ( \( IS_ERR(clk) \| IS_ERR(clk) == 1 \) )
> > +{
> > +...
> > +voidfn@p1(...);
> > +...
> > +}
> > +
> > +@depends on context@
> > +expression ret;
> > +identifier reg =~ "^(devm_)?(of_)?clk_hw_register$";
> > +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> > +@@
> > +
> > +ret = reg(...);
> > +if ( \( ret \| ret != 0 \| ret < 0 \) )
> > +{
> > +...
> > +*voidfn(...);
> > +...
> > +}
> > +
> > +@depends on patch@
> > +expression ret;
> > +identifier reg =~ "^(devm_)?(of_)?clk_hw_register$";
> > +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> > +@@
> > +
> > +ret = reg(...);
> > +if ( \( ret \| ret != 0 \| ret < 0 \) )
> > +{
> > +...
> > +-voidfn(...);
> > +...
> > +}
> 
> I think yourpatch rule should have an extra case for where there are
> currently only two statements in the if branch.  In that case the {}
> should be removed.
> 
> julia

Done.

> 
> > +
> > +@r2 depends on org || report@
> > +position p2;
> > +expression ret;

--->8---

Thank you.

Guru Das.
