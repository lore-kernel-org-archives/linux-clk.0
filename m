Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDB631714C
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 14:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435724; cv=none; b=Cnq9XHLtCbcYsBWKlh4LfyXvEUFEeTYg7roWWy+O0bDNdroE6rRe3kuskFM7FX4JS9/lxS4oHgZH8yKvBV1/TKnnQSwLbJ3kNS2P+Kko+XbdxNORP7OY3zDXRYMTdLOv1cPxXjnjc1fXhHh38+XOeoBIm3FNtVLFY+2LDi/hICU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435724; c=relaxed/simple;
	bh=3pmfXR4Jnv2/fQCMmyH1XbyAye1yx5cOX75L1MFZJgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MK2igh9D2Njz7U/8o0Cp3oN1hJJC5GP7QcmkaRyb4499FaVEMWY/X18ydfOah+TvG7OGhflOko73NIeyenkQXGfZlJiDO6M0CtVaInyMzEbghStYckPivqMnrKv5PQRXhAFe3KdO/hjEoOrhK4+z5aeyM6qVpXt8+wEDU1yZGzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ay/6FBon; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=d7GujN/u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ay/6FBon";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="d7GujN/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h1r3uOYYLfyHkYl7JQXo9+dI1iFhQk/Yi77FdFZjY7s=;
	b=Ay/6FBonifhOZVCrnhuIm13bEyWzTvphdEtGscors/x5YdbPEwJTc+5Syo35zwd4vpyQAO
	1lPcyqGfDGZ/gJBj7ItOgbKwx0oUq76Nx4OZaZmCaNq+de87jCsFwq4e+nOcns8rFv4vJL
	Asd+cl2y859d/h8+M+Wb84KSdkjUDQE=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-oWansfJjMJu5kaLqJcyzQw-1; Tue, 07 Jul 2026 10:48:41 -0400
X-MC-Unique: oWansfJjMJu5kaLqJcyzQw-1
X-Mimecast-MFC-AGG-ID: oWansfJjMJu5kaLqJcyzQw_1783435721
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9f1ee3ce4so1041334a34.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783435721; x=1784040521; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1r3uOYYLfyHkYl7JQXo9+dI1iFhQk/Yi77FdFZjY7s=;
        b=d7GujN/utWCZsHwdlYLricu8E8y2Rffl06T2DWaQiZGONqb5C1T8UzHQjkdO/T0gnq
         QzOsfNUEfVIvvfROMOdoahePli5hbGf2TfAbXl1N43pBx8yht+B5vG1yUc0pdfwjJRql
         ++homkp89CL03hVDVH0TNn5K1f7zF5PQ/t/ioh+qvUlubPmfOaOKugnDVpeQyiPaMToM
         i98WNO2ThJ8wJw+2Wh3EfWVCrVbe5UselEttKu05+E7E4Q7mvF0BfV12NVTnziQmTgoB
         NFGUb01eutobyrkTGttrpqP2UlKkqymGnt50XrMjYl/cExZAa5P6F/8FZJ2+jrFtlA4Y
         4JgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435721; x=1784040521;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h1r3uOYYLfyHkYl7JQXo9+dI1iFhQk/Yi77FdFZjY7s=;
        b=dt4G3VdNUwMsC0Iw4dfZ1Rv7v39nGbMxgsQzTMz0nxBKB+3B60bS9J52tXM8O9Ov9i
         Vu68dBxks0pxmuWsP3UNx07SOwa3mFNgd6XT7VsYk4R8IRgVviFyIynFX1VfarY2AR2e
         ARQ1pJmMJf+YlIxWxJmSjS8S1WxDgKovK6J5SuNS3P1S6jOHd8HNou0s83ZWHRTseDdy
         EVv3qFDDQ/06gyxonoVdFg1wv64yxLigKI1mGS0Q2T6FCNqlBKK5I2zb6h1TP/yOjqxD
         7ZXyx5Dg7RjFHpNHbYbmD4J5BfKTgy/tEiy0n3N+sFMElbrBJjdu/mqEgwlH/hydozx5
         vNtw==
X-Forwarded-Encrypted: i=1; AFNElJ+H/HEJIsuHi5bQUSh4hnIE1Vsr5jrNHLcYj0UBmIjLjanJDH/XKn5auYw/43322SjV9M1kX5T2V3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaRWiLw7+YMCt+KGVQLu0CL+5xHC/wn9mayPx3QHlvDN5jxBP0
	rUJHgWervI2RWilv933J8ArFJcwM58HweN0DvlHCsOaouGbiOHV0z1N0Odcod9YzCtfump6yt1n
	Bvh7ZUxj9dAZEHUt8QMJ0kEREap0yT0/kld04zSS2S4t0J2Veo4BVGgTAlv4sPg==
X-Gm-Gg: AfdE7cllfrhbpjevq+Gf0Iim1DBIlyk5g3iyTvD2wh9Z6UVGzLMLNFJb2AqiJm+KHdv
	grtqGs38S1xd2sOqXonR2XHkE7Nlo3276sZjVUnGjZnU/R9l0y5CFRMYc/7tg+nt6DQF06z48CS
	9ga6j5o9hD/BgA+OYXaCPuD8R1KKSG/bS5W3Qxaa6eOR7Hvhgm1dUCg9HlM0hbjaWMtpoRZp5Bz
	VPR9/L8aUME5z7rEzoHtF1VN6IbQUcK3phR76EDdoXwr1UsCKn0/Fd7RoI8dqjV8z2dgnpeagUJ
	evTsJsv07aiW7EoWjYD6jz7FX3U8fm3goshvZXCKsjh8Y5atWRxYdWR0FUmdMvTVxX/SW5CcHR9
	dYLI39PDl
X-Received: by 2002:a05:6830:828e:b0:7d7:fd71:f2d4 with SMTP id 46e09a7af769-7ebba10d518mr1910789a34.3.1783435719952;
        Tue, 07 Jul 2026 07:48:39 -0700 (PDT)
X-Received: by 2002:a05:6830:828e:b0:7d7:fd71:f2d4 with SMTP id 46e09a7af769-7ebba10d518mr1910777a34.3.1783435719482;
        Tue, 07 Jul 2026 07:48:39 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb544fcb06sm14123177a34.22.2026.07.07.07.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:48:38 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:48:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 6/6] clk: mediatek: mt8192: fix memory leak on module
 removal
Message-ID: <ak0Rw5krDlc_ZXQn@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-7-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707074839.240676-7-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Jul 07, 2026 at 04:48:35PM +0900, Akari Tsuyukusa wrote:
> clk_mt8192_apmixed_probe() in clk-mt8192-apmixedsys.c does not call
> platform_set_drvdata(), but clk_mt8192_apmixed_remove() callback calls
> platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL,
> which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

