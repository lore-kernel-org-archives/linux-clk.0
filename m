Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8151F9F6D;
	Mon, 13 Jan 2025 23:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736809964; cv=none; b=OkYVBzFKtloqnr9Er8XIfGhNuzuY5yr1R3FJQ8h0DGu4XP4rvyH2j+LEe4NaE5ecUoiyCZTdHZIRJfyLolG1QWHhpmH22sGVE3hVr01bt1222a1zlgt2rThOcPvsvyRCck3TxhK0tIpFhYzCQ/xXYnTXPrdnSPUZGyV5Ji8+qGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736809964; c=relaxed/simple;
	bh=OxdqALPYbC8AHAtMeN/IRPfMzgwIUN2nhBx9EsKG/hk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcybOjdXyg2dDntuwr5f1182iTu5pZxQygIZUIooCNC5DhCnc3Zsygdl2VaveLD5d9NWs7ebNQapJnBmwBGTZ6kLaXt7wWDcFW04NpoSz2YbhX8EFQNB2BDmJJAxbYRteweET7DK3JfkGJnoL8xd10T8CD41gcYFMdzGZiKYK3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVE49cnd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVE49cnd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso35001925e9.3;
        Mon, 13 Jan 2025 15:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736809960; x=1737414760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kx8PXHEebO5/aVclGcZvE/Gv+JDFq1YsvtVYPBY6g3s=;
        b=kVE49cndngV7TxGc0pOFttQrh0wzP+aY8c/VadAHdb1dSVOgnt++QxVmtSrTEOyXpy
         GRrH2d3Bhj9ydeI3fmkvNxSNvG3FDFEWVa08hTpfcOqRp6zPMWUTzvUhGTyhpXzfk4B9
         W1+AWJcQ35G8nhUfHn/BYvw4vQiUgirSTZA1t0OyyZi11bzHuV6WHRJQ09xX33eJN0I+
         nQ4AcfRJ2/R7ifKG6VL/mD/FQRtc3NGA7cMLuQGIRFBlzUh85n6GlVy/18ez4NXTm2bT
         Q3YCRIcSk3+WjlisjHpDXUfffbCNfj5xPFI4IgHthhAT8B9e1LIcpUNoEzTTsjtfQZMd
         jJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736809960; x=1737414760;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kx8PXHEebO5/aVclGcZvE/Gv+JDFq1YsvtVYPBY6g3s=;
        b=YsHIEv9towpm1H01vyXtD3Bbc0ifd4k0rMPT/tyU27tHr7i+/8j15iyeiBHaJ9Jerf
         SugA34lAqNuuiwFXWKUUQt93Xn4koMUNta/8ZV/rnP5PqJLCf6PKrSROCapPDwCs9yhD
         /Wv9s6k2YZpTHT2cOzNPJPEAQr6I+oq2VJWSB/WaMwmCEBJxAcdmkpRNPYLtuXEjoZfE
         +pSofyayRDgXvvxoCzK3xapQwhNycM+YN9qYORHYEjb47gEVoHoNX+YGJiF1p7P0QSP5
         YcStvFwpoGrSExx+uc2a7NBRn/Pb1IEpF3o08L6fw78kIyrivrVh5ic1tzwuaaX+2XaA
         obJg==
X-Forwarded-Encrypted: i=1; AJvYcCURM9yTKch46Xl9xCOtObxiTNM0syfFCm3VubSG0LpVL7p4hphjMo1YkKBq2DT8/FEtU66FQepr7mhn@vger.kernel.org, AJvYcCW2HOB91CeDXqeMT4eybpDj9k+d0Q0gsl6Utk5+HnFKFfl/qHFoOpgKvggxS23EZQnc8nyRozzz116/@vger.kernel.org, AJvYcCW72ooApuCsf1AjBNt+GsbvilFJyHeiWpaGezMasOdxieWR5PRIkGttS/kJEIerNhLFESN8c1M8dDPpI1yE@vger.kernel.org
X-Gm-Message-State: AOJu0YwLeEeWg3KNkt693DYgZBVHCTTj6Qf84dIaCi1po/eoPhfSs+hb
	9iEGyp3CMVz5z3U06lr5suPZ3c2hZt1wrXfrEqtFFc8YqTW2aJsl
X-Gm-Gg: ASbGncudZ/+FLWjFuqrtRHWvNVZVxwGb/rA/g/OTA+WeqtUlh1bXbGKca+/c3PMWEil
	PY31GiIKUOm+TyIpZo1UxT0+tNjM0SCMblbMHBqbXw2gZtiA0hAZY8v6gb1GKm60C4B/kGcWvAL
	fu7ARZjUliQnkVLrcJOum1/hNkkHry4jdVdpwBuVibMsw4Yb062vbveatAwEmpBW4ZIJ1B7brp2
	bkJP+5s0OGGmNr7sAbxaNfAmqwiWG2+uwnT8tE0H6Li4BhE/E821niskZQwKFZDImP6G8KEYEjN
	8MdrUZaTYKQi
X-Google-Smtp-Source: AGHT+IFDz+NJFMXug6dZac/WOzSGHpi4jkLgKJu8Kp0xAIFURCC3A24XsIharH+RSYakSyvhfWyhPA==
X-Received: by 2002:a05:600c:1987:b0:434:a386:6ae with SMTP id 5b1f17b1804b1-436e267850cmr211279395e9.7.1736809959712;
        Mon, 13 Jan 2025 15:12:39 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e92794sm189006885e9.37.2025.01.13.15.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 15:12:39 -0800 (PST)
Message-ID: <67859de7.050a0220.184b6e.ffee@mx.google.com>
X-Google-Original-Message-ID: <Z4Wd5N8b5IibhJyf@Ansuel-XPS.>
Date: Tue, 14 Jan 2025 00:12:36 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: clock: drop NUM_CLOCKS define for
 EN7581
References: <20250112133953.10404-1-ansuelsmth@gmail.com>
 <20250112133953.10404-2-ansuelsmth@gmail.com>
 <15742b3ea7b5ee1cfdeb78657e9dc4c5.sboyd@kernel.org>
 <678587b6.050a0220.32320f.317d@mx.google.com>
 <3b60a7a7775b6bae58d231a52bd9ef10.sboyd@kernel.org>
 <67859111.df0a0220.a316d.bad1@mx.google.com>
 <944dfd5c97e44d8cff3e576e0fa4a711.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <944dfd5c97e44d8cff3e576e0fa4a711.sboyd@kernel.org>

On Mon, Jan 13, 2025 at 02:45:21PM -0800, Stephen Boyd wrote:
> Quoting Christian Marangi (2025-01-13 14:17:49)
> > On Mon, Jan 13, 2025 at 01:53:46PM -0800, Stephen Boyd wrote:
> > > 
> > > Please resubmit the entire patchset. It doesn't compile.
> > 
> > Hope I don't get annoying and sorry for this extra mail.
> 
> No worries.
> 
> > 
> > I can't repro the compile error, it seems patch 1 of this series wasn't
> > applied and changes were tested only with patch 2?
> > 
> > Patch 2 depends on patch 1 as we drop the define.
> > 
> 
> I applied the first patch, but on top of v6.13-rc1 like all other
> patches that don't tell me their base.
> 
> What's the base of the patch series? Please resend with a cover letter
> and use --base=<commitish> when formatting the patch series. When I
> applied the first patch I got this diffstat
> 
>  drivers/clk/clk-en7523.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> so I suspect I'm missing something in clk-fixes for this patch series.
> Please call out dependencies in the cover letter.

Indeed v6.13-rc1 didn't had the counted_by fix. I referenced the
clk-next base branch and sent v6 with the cover letter. Hope it's clear
now.

-- 
	Ansuel
