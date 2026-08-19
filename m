Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754B538AC9A
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 21:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787174594; cv=none; b=VhpM8gD4q08fRA2CvTVFr8kIpSN2UXPrQ7pZDXaIKv+t4Cl5Q3Kp6KN7Tlqz00cbPbc3RJGgoZ2k6uTlNU+hdKwT5irxjuHciISKZPm22kXe52ibF5PC27FnVvWy6RofMejaoTmDma+eDxj/PkiKNKO74Lu6vt96me7uCC+dixw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787174594; c=relaxed/simple;
	bh=e86+tyxRdQKzE4t52ZefcteM0bRE88sbIL68NZYIiAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFnOb5hvWp6WZT3WyZzTfKKjRhvKTdnijebBc6bsYVxVGb+vHuGzTOQxcpAtVXSeopAHprOYh7OA9ve6hH5ITsUgccsFYsSf4QMOT/+EbzJdoGR5HanVsR7IvZTQs0o3hdCnmn3PQiBWUZJncTVZ73STSYGMZclyZmXvsItZixM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WDV4nx5+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JCKAFLrZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WDV4nx5+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JCKAFLrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2Nq6oWt/A+GglsE2R04tSZrXRfphvvWNtrnE+gHf8s=;
	b=WDV4nx5+PLOwIzrIQxoQ6LLCzzqU3/+keFXokh9Pryo0QEUVlRmboSpm5fd0azh/DSbf/p
	3boOmdCIV57EmyvbiXw7jtwbCryXG2i0h5/f9hXKXq9ay6AB7rOZG232kfYlnmeOg3mLq9
	NABj8Dx/ejWZLPrEtwsWXCfnL1qkA7w=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-ObEHwc5aPjizHR1NWyrdlg-1; Wed, 19 Aug 2026 17:23:06 -0400
X-MC-Unique: ObEHwc5aPjizHR1NWyrdlg-1
X-Mimecast-MFC-AGG-ID: ObEHwc5aPjizHR1NWyrdlg_1787174586
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9083b049f73so19732506d6.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 14:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787174586; x=1787779386; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y2Nq6oWt/A+GglsE2R04tSZrXRfphvvWNtrnE+gHf8s=;
        b=JCKAFLrZWsJlDyDL0n3WLYXT63egpUnZ+e9sB2o8Cu52PYgoPA+qrgX0HMk/lPmuhg
         kcZ+OnAOPFAPoYKI9SfWNtt/wNFfb/l1B6Qdpjt9TXkwa43DK7+RdPkfUnPYcbSp4trw
         Y17ETv81mfJFnM6opMhSYQfXk50NGBWU+qwk2peJLmDw+Ewga6+okxmFUof/ZIMerVvb
         1M+0Hzo+ltWLG+vER+nwoKKVNLyJN8Nnj9uBk8EtwVn/j5vuBSOg0S9tvxz0J4D9NJmo
         mhM/RptbedIlUzfhAEYhLCvT3YX9QmZVBkAYg7TGMhcQn3/sfMzWQIBbnVAkWKY11f4X
         qF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174586; x=1787779386;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2Nq6oWt/A+GglsE2R04tSZrXRfphvvWNtrnE+gHf8s=;
        b=mDfvt0nB/q27eQBxxUIJgoYO08gSIpacUtHJovRxxZQLKRvKrw8SwWtwnTttiHpEkt
         nBtpm0BVlpkCerGjjl/tU985/35Oyz+SxbQm6ivENyqwZIxMcV7VOUMHOZaLJUCPP8FZ
         vtzIU84fnL0m0/bdqqBIsmYvsB9s1ihcvYZCBntOYfY3HDBcbZUvwqMDxr8Df3bCJFOA
         weS86ev7IAh98o9UI0b+jfyHud2Y07kXVysczYYW7Q1fPLeq4vV/oikUc4V2G/cjZlJP
         Bw6f35mUZc8rnpsvuI61uGlDHr5lf0Q210mep/krRL9Pl/X0jpXOIzZ4FZyKRuwq8B93
         bQjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsDheL0wg/yrRSJ/1RNROcuEfYSL/lxIWUJz9d8TM3cZFDxv+wfJT8SWw4r6s1ayCB5t8EP5tJLN0=@vger.kernel.org
X-Gm-Message-State: AFuF++kzV8Ei7VAfZr+MIIDmq6BBcBwBI8DxFVui+cpITMV8z64IDKWo
	RpyxOuCz0+pAufVHqNz1kHGFBL1ai9fUTHdpy+1qQll6TE41OtD2st6v7OPVReN3h8xUgF8ylmu
	TScRLqnF93HeC+IG6sY+qW+2BxNW9DwvGDULDZWulKBdKKP7f2BVjK0Y/9ec1Zg==
X-Gm-Gg: AR+sD13wpiTvAMRI3FbyAltxly42dzTAr0IfXiv4C0EEVqvLwtu/rcHHmMVVKswwoy0
	U24TWMdQXv4SFOJFj8/rqCG32DCHFahOOdpxGPSIZM0j63McpCIGobDYaX1oaJd3vsa+VIVoI86
	pDJlSwkzRuW7UDmRpA2j6ayEXC3TUQvs5MQSKlLQU5jtmud3iXzDPnj8/XYW9ddCv4VaFc8Ci13
	zW7fe8i9X/Q2k0UlOSZLaNUcUB0aAEjQgJplsHvqaelu13crIyIjHmLHtng0Iy/VBK/4RACcibD
	nBfbb5NdDxHM/qTzymFzOE3ax7ACwfxr7NUT43756fDiYd1sGRJEysSp/vmuFL53ywANoMux/G3
	Sk3IhpHMhm8G8FK6ihu0cJyRu+tEj4NmJWIg=
X-Received: by 2002:a05:6214:260f:b0:90a:804a:968e with SMTP id 6a1803df08f44-90c5eb8132fmr77665756d6.32.1787174585753;
        Wed, 19 Aug 2026 14:23:05 -0700 (PDT)
X-Received: by 2002:a05:6214:260f:b0:90a:804a:968e with SMTP id 6a1803df08f44-90c5eb8132fmr77665056d6.32.1787174585342;
        Wed, 19 Aug 2026 14:23:05 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2a1139sm23455876d6.34.2026.08.19.14.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:23:04 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:23:02 -0400
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
Subject: Re: [PATCH treewide 5/5] spi: amlogic-spisg: Make sure clk_init_data
 is fully initialized
Message-ID: <aoYetnpb5fu2M9u6@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <9fb35ae0aedb7a6db0db6c78a8193c7602dd9d44.1787165329.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fb35ae0aedb7a6db0db6c78a8193c7602dd9d44.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Aug 19, 2026 at 09:05:19PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> aml_spisg_clk_init() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: cef9991e04aed330 ("spi: Add Amlogic SPISG driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

