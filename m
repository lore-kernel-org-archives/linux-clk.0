Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C549343E9FC
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 11:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787310238; cv=none; b=svpucrNG2UnXL12Vr+Gm53wmEILRj/EmyrcGNyXnlrNTLLZu+0ai1wjZy4L2FnpNdmQfPRdmox7NI4xo4KSJlZUB6Ca7Ph66HAhU+qdzFOWF8QmlgN1+Dddj7jF+Eebcv4iFlaHIwtklmaI8YbMyPHUY0rKRkmAIWgjkXozonoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787310238; c=relaxed/simple;
	bh=B38wB0vUMdlZRx2N7kf9ZWst50Iqp8nsPF5uH+lKrGg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E7QbIuW14lYhoa/+zw0AWF6kMcjW0MT+jNsorMgYJG/1hiXNSsQyGDl1cWoTecFKQA7nNlLIA16Fz5I9uNf1VKi3te2DKhYVL9ji1xD9HLjURQ2aKAvW1wOXoRwreoyVIZ2zU57cj3RVNIHxZCRrpkoH9ctL8rhHzjLU4w5FZaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F61Za3s+; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F61Za3s+"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15d111ca99so101361366b.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787310234; x=1787915034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pJu78dGyTk0n73zePooVLlpbfkvwvlQMnvrMH6WIan0=;
        b=F61Za3s+8rXlDe0ZAz+ukvDz7sBbHNEQrRAtwigWg/ZnmLRyJN2gByduRRnOOXO7OP
         y6k1ftCxt91+kw1+yiftNs+wCPLjXWxaWTFGNRsTy7DJzilA/D00xUZCba2KZ9TXQ97M
         5kLmw8jInGX8qoYrhqlXr0YnxBwojWp2IHNRzcDHzXTxowFA1jOmkQj/EbzS1VMy1zJb
         HcTb5lXEpp7xhxEKb6x1/zJ9oFX1H3wlXoGBHyD/gIo/QqLpdZaxs7eQl+w435xtO8tP
         buOc/2fNGTvMTJqfB0GU6tNkKbDH7LCJr/6wo+pNllDMB6vMYJ0jMPjuE6yxnZRx+gJZ
         EgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787310234; x=1787915034;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJu78dGyTk0n73zePooVLlpbfkvwvlQMnvrMH6WIan0=;
        b=tGL0Tl0NsbxT3rtCgpy91XtgJfMe/rBeKELXifGC8TFQPFqsUYrGz+74PFbwbf3ETR
         JPGuj3/TBcP0PLOUyMVDbSXgsS5yw6pS0p5i8DvRPabSCqkqhb3nmb1xlUDNAAbG/S4O
         X3MyUfh9kGNdHBC6t70yVCRo4zqbNclhzz0BusBH19k+5Nvk5PNfVvjHQqueVHdoPTcT
         HsX0EvKOvIioR/ChKOYrHe2wCks0arIuK9KGCUZCuUMsabXmRIF0+5dEm7FVWQiU57gB
         bmg2g0ppLbJc0VBKHe1UXeYsLErrnDA4LavWMlFmVqMiJOnOrgPl+B97oQmmz0bNwO78
         wHQg==
X-Forwarded-Encrypted: i=1; AHgh+RqanDusQwyx0QDkEIISIlzUS5B1ElSKhFrgtQWj86hR1TmccK5fd0WWj33bykZdKkAPOnzxE+Xxzm8=@vger.kernel.org
X-Gm-Message-State: AFuF++kCKHaG3yLt30vmmriXQzvbg6/S3XlH7iTd37XQGeOTJGJwYyMt
	K+6jgofjUCpoJ9v2+j7fgDbXI+GouK+Qmmcp5LIfc12K3elQQzxkYbNZ
X-Gm-Gg: AR+sD13A6NkVnAiMd2aKZglRt+hk2bsCR5AHviWlH8xita+amDUtXXXdz8D6yFd+rO0
	N9EOpRiBRJ62IPs3mA7xwX/cZEvSeaJWonUeKwmoWd686rkiLE6l+sqB+lmfWuJsASJH/ObOzj/
	9IVstE3835iDluNuBdoFXaJK7BrNMw9RnUY+Mtp+ypReTzQntYjrFtxoHH2TWJIXRo63s5HtslB
	B8RwkGnCNb9f/limddtT2PdYqyFgiv1sx9GSDCWk/R9MTAkxXCFIEKwVbrdfRiOSXEZ4cYVX9Zy
	P4NCeBlNAtq/+ZJIJ8cX9IYzXctX+P9ydLM329REQVTEf6DYGYOihUe5VQ8dslvs8kC2XOPiJAk
	vTb7kjZDuW5cXvAASSm98uUv50JsMjGtvGvWxtqsj4MbHSH7dEuHKCgdKHe7069mU599kOZAKf6
	bk7XgQ/+Agjf8idF5xhcgJB31ftMaIlwQ2Sj5CHH9OVpsjunrfUNMk77q8Ht2I1yEfp2Raq/iBz
	AvagWPn4D9wsrRHl30zZszkqliNX209eMZFMn4EWpnBayvxa7mmpAX2XfjOpfWEn5Lbs952QlvK
	qLrlb61xTG973sj7OVnZBbmRG/SxxOgEygyULUcc+wpZFqfKhBIuvAwu1vNeyfDh1LuJGCxX9Gi
	ZsySXetWkRR+SqnSAPT+KNUMXTeHg+oqBItu6+gLpk7M1X9IQ8NSc9/b22LVuX/X5EfASaw==
X-Received: by 2002:a17:907:e1c5:10b0:c24:6445:d19 with SMTP id a640c23a62f3a-c246a7120d4mr413937166b.17.1787310234188;
        Fri, 21 Aug 2026 04:03:54 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b58a50sm456656866b.26.2026.08.21.04.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:03:53 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:03:51 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michael Hennerich
 <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux@analog.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] iio: adc: meson-saradc: Make sure clk_init_data is
 fully initialized
Message-ID: <20260821130351.000052a0@gmail.com>
In-Reply-To: <7470364f0d70b6e9c06fd094768cfa91c7784d42.1787240005.git.geert+renesas@glider.be>
References: <cover.1787240005.git.geert+renesas@glider.be>
	<7470364f0d70b6e9c06fd094768cfa91c7784d42.1787240005.git.geert+renesas@glider.be>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Aug 2026 12:04:06 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
