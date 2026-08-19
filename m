Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA1B3B5311
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 21:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787174548; cv=none; b=qm9xtwN+RRq2DpWgrzMp8fhGVV7XsEtS554DXJe6Bntg1PEcMK+DRnLlK7l7WteTRw5Gb4eYHfUCCZ3KcJn8/H67Qro8N5xt7v8cHrSIJnHPpxTmAK+P62c8rhXojVVtnhPBiHImuaHrpv/K115uCZrQwY+0KIylFbJaGZ9nEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787174548; c=relaxed/simple;
	bh=ZzdoD++VvHeUKmBu7FDDxPK5u0C7i3uGZGCaEX/ePk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prva9kZH/7MQKi8j3r2BndS4gdqearlk/gwQx3m34+tNg+ahBkbPMmO1uOJkiOsN0EkfYPe55Plwh8JiCBLtHWVTveZ+ceux++HdCNo7dHyRjDZpkiaS4A6jgl3hUFUepSXR2JtbfuxUU/+zIIU2wPiPtjUcmijMP83p6vTcuBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RE5VTG3K; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KNeaH5Nw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RE5VTG3K";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KNeaH5Nw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/BxA7XcUttIdzHWbOyyyGM4mWiq1VkGr6i1wmE/8c1I=;
	b=RE5VTG3KPs1CYT5imkvkp6vZdKRrbnBSpA99awsj15XAUnSTMvSgPjZg2P7e7ei5ndfG1T
	9+diIQLTiSsn5UJjnh890Z6HsNkO6yk3HpJA0OoKcMR4bVKvlKTrQb3tuaROdXv6nQ7YHO
	jc+nS1zS7YC3e87KaxNrFc/BGMwpL80=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-vpyhwtHUPpypVojrrVd-Kw-1; Wed, 19 Aug 2026 17:22:21 -0400
X-MC-Unique: vpyhwtHUPpypVojrrVd-Kw-1
X-Mimecast-MFC-AGG-ID: vpyhwtHUPpypVojrrVd-Kw_1787174540
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so28054591cf.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 14:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787174540; x=1787779340; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/BxA7XcUttIdzHWbOyyyGM4mWiq1VkGr6i1wmE/8c1I=;
        b=KNeaH5NwoTLtvwqOqMMCgUy92YE1e2DS49yaxNI6PWtSO30S50ithGGWkZbZBBS9kV
         crb9/uMkIWqF3hYy9Y4SQyWEimFnYxwdUteEmOZgXIaBaonRP7jamZovvT9GG3EMG6KX
         jE4gkeVYWTYywh99g/bYqOQk5FNRJXAMRYsJ+MgSG60xzePXd/zQp0y2paGQhLKgmdYr
         QM9tpzVQUAcGjLn71bvuK/dml08tlQuGJTJVGPfyYgHuAP9vbidIw402Dnq2VVG1JYLF
         06Zd+LufUJVgntF5pSqH/Qmkg5/nQiv69ynA1iI7aMvQEW5AMkWgojY+IM9KtvDMWkdC
         TBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174540; x=1787779340;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BxA7XcUttIdzHWbOyyyGM4mWiq1VkGr6i1wmE/8c1I=;
        b=CsGeZmHa1+52RN4s+w5C1hRCOF3K3KaYsgsCL17RAo4tZb2DuCns3fEHKOVb2Y3yH9
         w2pIjGHwiLY76jMH8y1LQRcMMpX2JfqdbtgIKlSvrHei0DWFCEx9WC9OI9sTGA069t/c
         btZ/3zkwf8CGOBKN0pAUj8jKVWgB2ozBz3lgcTuMIORyvR7Y0ZRieWpqTuadY3vJK6G9
         zAtIxdyyv9L3vfJiBMggXGAwz5SoCZYwXs1h23cbDeW1iZqma6slvX33NV9HM0FpjmOf
         Wp1y0hBIgR6K+hG+NEaCpT5z5X23qBAH1Xe4tafkLESf066z0KmMEfBhd+6cQJDD4bQF
         m0XA==
X-Forwarded-Encrypted: i=1; AHgh+RrQ6RnEZZPnH1shjz7ph5TP2B9EOGvO2ULglHx8qrWIvsaFxksffocd5pJGgTNW19Sh1vgnA3/MYSw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9nJ7m35StTYSb+uf0+4//w+Rl60kQXmvewg3hhwUkqLPECLzZ
	HxIgiyM884u912VB4vBYKrjCS+7qsV8DF0GtABXYI3p8SU1XQDyHN5Z+l/JiuUAGQ7zNk8WS2qx
	dBxjKPA9Qkk26/9JeWlMlebzW1aGgayLuyYfX91HQCVqlFRa5lq4yO+Qr+CrpZw==
X-Gm-Gg: AR+sD105mDyhARlESCr5ShaHRWT0YuQvMGBCMuYNLH4U0d4gi+Qc7Oc2l/7W2Hfhddn
	A19TGFQmk5/wQXXXUWsvfaRUtTjz4Ef1R1BaK1JsQcETn1MlZ5tUMO1SlqovR8yyYA38eRYV1oq
	e9GDguPoTE0mYOgJ8WmpHpd2PSmNcbRRp+RX+GlCT/78unZ0pvdITcRpgXAxNOiRuYBWoZClAl0
	df42o2Z0Aici4cpHZLKFewo5iqSMn5b2Yzaix6WkWFWXOw8zJaiCq1vsPNHXsvOFVX97IqZ2zhW
	9t2MYBS0opXWr+Aw5BkcBvyIaBEVS8cmG+bQUgeokm5HWAxrA4WwBC5pZMFJkvVlU3ILlo4y7tk
	0d8Gxsxgmy4bX8Pv0km3kmSulnKW3p+4RHMQ=
X-Received: by 2002:ac8:5d04:0:b0:516:e249:e30f with SMTP id d75a77b69052e-52dd5e05a70mr71524951cf.42.1787174540395;
        Wed, 19 Aug 2026 14:22:20 -0700 (PDT)
X-Received: by 2002:ac8:5d04:0:b0:516:e249:e30f with SMTP id d75a77b69052e-52dd5e05a70mr71524431cf.42.1787174539914;
        Wed, 19 Aug 2026 14:22:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd857b36fsm18734791cf.5.2026.08.19.14.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:22:19 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:22:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux@analog.com,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 3/5] hwmon: (ltc4282) Make sure clk_init_data is
 fully initialized
Message-ID: <aoYeifWtRNoksCoR@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Aug 19, 2026 at 09:05:17PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> ltc428_clk_provider_setup() does not fill in any parent clocks, and
> assumes that init.num_parents is NULL.  However, the latter in
> uninitialized, and thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: cbc29538dbf7d740 ("hwmon: Add driver for LTC4282")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

