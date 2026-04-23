Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39033DE438
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776939692; cv=none; b=a3P3vcN1a3hVYL7yWVktPm9Elcq7cu4wn1ZfvApVW+v5qJsPY9bzPY1qZrifhZxgJ6j6crvKO22oegHcSoJuOjpQowa7vuSwnyK9hYMdhFBCja8htlgv8yuocEHb99JxEaBtO9fPF2wGXOHtckWOfkPpZB2Aqbg2ls2YVHj096o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776939692; c=relaxed/simple;
	bh=MQj+NkvzLGbphyghyqnRUydWH75Iu4oOv77s2k1GF64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLKzn5wrUeTFWmDuCvMSIAPHFkaCUGRFS0KM97T1DXG2y0fVKk1eS2JqlRLaLd/KmQT3UDF2iGRsnImINbbjVeCJXZjLMnkZczLMH8vWIntiZ/Z8//vFWAYFTWhH+rrAtqp0vItFcefPD6MFcbjseir2bGZ+bft0gkx7aYt8BN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QZKTbzvc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pWBneR7L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QZKTbzvc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pWBneR7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776939689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mTg9sbHKN+9vulckMtUQdG+5iYxTHu8NLB2gac+S3kM=;
	b=QZKTbzvccLTzLMN5bmA1MVLqWCqmI6cwUf+J7gYdgYTBsWy6nRO7ti7ZLtnyuFdKvEkUD+
	AlSKOLhdUWZq0q88A4BKJqCNfNnJa3nmyr19g8vcECTlNDlzFjeO5XeNU7Ws5LHhWkU+bE
	Mo/R2dg8z0fTIU61NjNZGjbZrRXuVTQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-8Gd22qoMMYqT_J09MByvAw-1; Thu, 23 Apr 2026 06:21:28 -0400
X-MC-Unique: 8Gd22qoMMYqT_J09MByvAw-1
X-Mimecast-MFC-AGG-ID: 8Gd22qoMMYqT_J09MByvAw_1776939688
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd722c1a69so1156984385a.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776939688; x=1777544488; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mTg9sbHKN+9vulckMtUQdG+5iYxTHu8NLB2gac+S3kM=;
        b=pWBneR7LKLIrjhqdxRfwut6x2g4wJVm+3x2R6wey+uaK2MUZJ4TosyYQh9CYoe6Rpf
         qvc87H6SraFtNaXdmgM6QAW7tr2ydXdZs/24cjEWbrbLbFAgNL0wDh+HBEVO+vKsu4DI
         dWfBhfkXjNbFA3GWup8U7xlzvPgjC22/OIsrNZP0FUN5L/zJGdqi5wcPTzd+DGbgiSSN
         /BJ/0Lk9SmW5G8xe2q8gN7zTSI/IOasE2SRiluk3KoXJdsSAUpCLQHeebr5uIBZGSbyP
         wUD9BDXC+4FaNB17tUSgwCeWbuFHkUH92sFYoLIxf8JE3BIN5nXRYswInphla5hChl4k
         9M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776939688; x=1777544488;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTg9sbHKN+9vulckMtUQdG+5iYxTHu8NLB2gac+S3kM=;
        b=UmE/2YVjq0wt6T/HD9964ZXUtE2BSPyUxNREnHQSGl1XOPZGFrPYRmiLAybJNpGNcr
         SwZwV4D0zCX7ff/4MDK4RUtJW15GZC92w80qHZ6XsWC4xUenGXmhn8/ym4AQRb0fFHcd
         neMatmPIiJY84Y+E4gGOJlHM4rmupkYxxLBdZ43fJN+OyOO6CZA6MHcAWRIl4Og8JF9R
         zuSMC+jv+ho5boYsvNjvI+ypGV2M//oF2MfcV97lYfe8X8Or3/PNUm4InXeB4cEcqfPp
         u+zaTKR8xH1vMCstgRySJ57BrMqjC2rgB/ZEf5VGcsScYBcQlxy41IaMV97oc1j3PHMk
         Q2Zw==
X-Forwarded-Encrypted: i=1; AFNElJ+F6fFpAR6WQ+2NpjEWItEwlDBYU7c5G/KmjCqqL1NLc3SWDwEC/DB6KEHgTkM0jUYYgEgW+omood4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQJRfAnbo02P7J7jkORCETBJE212orrSJt1cBE+tU1ZHMn569d
	bkRcRKva+zW3LQD5P3rwlRjK7TGBWzm1+Yzm+jC4/cmgtcekqpnCYq7Cgf3GycDxpaD03tU2IrD
	rA/SqkqiezC2Ldc3B7m4F1qLmCxn8Y7HL6gkXD9zsXeHfpKLUGEUMoLYyzhBTZw==
X-Gm-Gg: AeBDiety1q/6IVpwN0kPO0qQmeDpLRPi6AG6ZCgYSsRVcwdsC/iXwdzvg5vbTOzEOun
	uRruWT82SjRkIpU26DyVirB889bCw09wQODwgKp90kQ1Eez2RFZfKX3lK/hEkA6C8TGu7b/seWI
	37ZOl9bRwTerxI4N9Kmo3mBZ6zqX9J3LU5oZ6649zi78/OjBeGHQPJOyoXH7B3aVoWp03fi9vUs
	5QUiKgIMYXF51bu/S9g7PUlHEN7xy3TjlUtY0/YkIwlpGW8Wb95SJaFfVOPO8swpjO7PXvtWgqa
	ftaJ6RE34+YSmGuNI6Vq3HhZGP4KpdJ5aIh5APFg2CmbfL6aJCC5Iij25ZX2YFaj+jRGeF1zDvV
	URKfxNZlhLN7i2MN6ZLnG3RqXgBib0Ctnkj4/9reFap0LStHEzb7mDT880PAE6bTvOrA=
X-Received: by 2002:a05:620a:4101:b0:8cf:e946:bb56 with SMTP id af79cd13be357-8e792276307mr3859064085a.44.1776939687818;
        Thu, 23 Apr 2026 03:21:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4101:b0:8cf:e946:bb56 with SMTP id af79cd13be357-8e792276307mr3859060785a.44.1776939687339;
        Thu, 23 Apr 2026 03:21:27 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d69abee3sm1541253785a.17.2026.04.23.03.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:21:26 -0700 (PDT)
Date: Thu, 23 Apr 2026 06:21:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [GIT PULL] clk changes for the merge window
Message-ID: <aenypBUNgqrr9nCE@redhat.com>
References: <20260420183208.2287306-1-sboyd@kernel.org>
 <aeeHSrZmAqE4ugXY@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeeHSrZmAqE4ugXY@redhat.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Stephen,

On Tue, Apr 21, 2026 at 10:18:50AM -0400, Brian Masney wrote:
> Here's some additional patch sets that were posted this development
> cycle that I feel are ready. I don't see any objections from the
> community, and some such as the Mobileye series, looked like they
> were going to be picked up during this development cycle.
> 
> - Feb 18 - Felix Gu <ustc.gu@gmail.com>
>   [PATCH] clk: aspeed: ast2700: Add missing NULL pointer check for devm_kasprintf()
>   https://lore.kernel.org/linux-clk/20260218-ast2700-v1-1-2388e0fe3597@gmail.com/
> 
> - Feb 24 - Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>   [PATCH v2 0/3] clk: x86: lpss-atom: A couple of cleanups and a feature
>   https://lore.kernel.org/linux-clk/20260224121159.3503754-1-andriy.shevchenko@linux.intel.com/
> 
> - Feb 24 - Shawn Guo <shawnguo@kernel.org>
>   [PATCH] clk: hisilicon: reset: Use kzalloc instead of kmalloc
>   https://lore.kernel.org/linux-clk/20260224021912.54365-1-shawnguo@kernel.org/
> 
> - Mar 3 - "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
>   [PATCH v2] clk: hisilicon: Improve deallocation in error path
>   https://lore.kernel.org/linux-clk/20260303-hisi-error-v2-1-7cd9b43d8fbb@posteo.net/
> 
> - Mar 12 - Peng Fan <peng.fan@oss.nxp.com>
>   [PATCH v9 0/6] clk: Support spread spectrum and use it in clk-scmi
>   https://lore.kernel.org/linux-clk/20260312-clk-ssc-v7-1-v9-0-0a9d2e188d9e@nxp.com/
> 
> - Mar 25 - Rosen Penev <rosenp@gmail.com>
>   [PATCH] clk: visconti: pll: use kzalloc_flex
>   https://lore.kernel.org/linux-clk/20260326042317.122536-1-rosenp@gmail.com/
> 
> - Mar 25 - Rosen Penev <rosenp@gmail.com>
>   [PATCH] clk: bcm: iproc-asiu: simplify allocation
>   https://lore.kernel.org/linux-clk/20260326045324.240150-1-rosenp@gmail.com/
> 
> - Mar 25 - Rosen Penev <rosenp@gmail.com>
>   [PATCH] clk: clk-max77686: kzalloc + kcalloc to kzalloc
>   https://lore.kernel.org/linux-clk/20260326052847.335089-1-rosenp@gmail.com/
> 
> - Mar 25 - Benoît Monin <benoit.monin@bootlin.com>
>   Mobileye EyeQ7H
>   This message lists the merge strategy for 3 different patch sets.
>   https://lore.kernel.org/linux-clk/2786053.vuYhMxLoTh@benoit.monin/
> 
> - Mar 31 - Rosen Penev <rosenp@gmail.com>
>   [PATCHv3] clk: hisilicon: clkdivider-hi6220: use kzalloc_flex
>   https://lore.kernel.org/linux-clk/20260401023551.27978-1-rosenp@gmail.com/
> 
> - Apr 3 - Rosen Penev <rosenp@gmail.com>
>   [PATCHv2] clk: mvebu: use kzalloc_flex
>   https://lore.kernel.org/linux-clk/20260403194701.11902-1-rosenp@gmail.com/
> 
> - Apr 7 - Johan Hovold <johan@kernel.org>
>   [PATCH] clk: rk808: fix OF node reference imbalance
>   https://lore.kernel.org/linux-clk/20260407095027.2625516-1-johan@kernel.org/
> 
> I know it's getting late in the merge window, but if possible, it would
> be nice to get these in via a second pull.
> 
> I don't want to hold up this pull since everything there looks fine.

Mark Brown reported a boot regression on March 31st on the on Raspberry
Pi 3B+ in this thread that's now in mainline:

https://lore.kernel.org/linux-clk/18719902-4b4f-4766-ba92-658f3576f68b@sirena.org.uk/

The corresponding fix was quickly provided the next day:

https://lore.kernel.org/all/20260401111416.562279-2-mcanal@igalia.com/

Could you also get this in?

Thanks,
Brian

