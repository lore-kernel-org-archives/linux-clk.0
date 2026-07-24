Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095F13CFF68
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 18:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784919515; cv=none; b=BjqZy0dJ1eoWjFTBh26QOiixTAYQu95H8a+DsMOy5dfXg8YmFqHyPc+cheLn2aZxxYFN85rdb9OhOOoH5JP0RjBsVrg3pNzWEC9E2wgptaILYocrMOCyM2LWUd7TFTs0soS8VmmcBmxfaCMSCgb/UZPJzfIcVmcNOFpGHk4IgII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784919515; c=relaxed/simple;
	bh=xb36rnHhHxJP3fnwRD81ZfzaPo5oVPfctJUhJ4Tm3iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDd6dNwbRUyiuIjjLphauzImP7s9RepdKUVG51tY5vYCUNJusepiqs7nKPf7iRIW5hL5jId5Z2WrkgN/rBQqQeEEaQqqCX2VdutEgS9S5RVFBnIy+ZeZdU7cBKDLKAAuhg6I2KDCmdqWs25Emweod4omuMlnLyDWuLm77BA+A74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ggV6L2U4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iVvlD8zt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ggV6L2U4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iVvlD8zt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784919513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gBMRr6TvKYhqWhyjtezFAHe9SIUiCvw79jDIQAiN8oU=;
	b=ggV6L2U4qPvSCSEmKpfdFl9N08HMBttJk5x4SiRA+3Qg7RyeyhATPVDRrhW9pFwZQ3CnSe
	cjmBTW8syH7b97EdY+g6lOZeM0mJaGLZsSNg0yN9fGDwEOiZdwvsEuzkMTgw6TUYKDHmyh
	UuL9cJkYq+gB+X2SdbifOtO7i2BcVJc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-fP9UxG3yMLCOPzkS7RPI_Q-1; Fri, 24 Jul 2026 14:58:31 -0400
X-MC-Unique: fP9UxG3yMLCOPzkS7RPI_Q-1
X-Mimecast-MFC-AGG-ID: fP9UxG3yMLCOPzkS7RPI_Q_1784919511
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fdace20927so7368226d6.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 11:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784919511; x=1785524311; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gBMRr6TvKYhqWhyjtezFAHe9SIUiCvw79jDIQAiN8oU=;
        b=iVvlD8ztcmCFwoJ2E4Bye95vccJzB5Rf2JDafPQZf5IGIZZ5Ye667NpF0JOSdsUMi3
         6mudkZ31EbhxvgrHGKWDx3GGh4X/x2ALjNRiNwwmOmNs6vcgt3BD33by0IpRMWp1Qd5A
         Sij9RD4rbAIZG8aEIJXtalEhpOTJEkruMSZiPMPoNXZ9s8cU7RkP3jDcFwkFUd4ESvdN
         ki7LvvRSbadOHWpXR41vBTRx3EyRAX4TBbg2mK4rWFMQlAEoMEyqUj7dtxpog7Y2KavB
         ZRxUBDSFKrjdfLpN6IsfzNrWqn7KHgZ9nWvIEA6d4xVplxP8ceXNM/iw4dsa8XPA0cF7
         NmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784919511; x=1785524311;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gBMRr6TvKYhqWhyjtezFAHe9SIUiCvw79jDIQAiN8oU=;
        b=r9vnaUOGqov30z9WjNyd2LD1sRSq+bDp8F6IudPYtbRIYqCVWVSRH+C60XIsW4og4G
         RiGydosy3j00JGjo2RKGv7D45vVqe2oi+Kd90oVvGOAl0wwIKw3G/KFEWGWE/1z8pNbq
         dY/c94M7pVWonPVv9Ddu/Tedj27KtKIyjADgFvfvjuV36Fsd9+gsnx0jdUhvQNPwTIW0
         Iw14jApgyNBJSzcyFv4T0/Z9lzl3wAqBThRko9UV1tm5WEFQZ9ENOmm119aFVmnN+Y3l
         dmk9KTKNmfoOtJQXKYj8H5e5+/9rEgu0hR1DQsSO0O9bLeqbTGYzG/uJ8/UcsSm5NGz9
         bi4g==
X-Forwarded-Encrypted: i=1; AHgh+RpHWE+DzThgGxLvZaMc52IOUl4q+Plh3N/l5HOgK7gn92U2TQHDqLt7lkpl44yRckiHf56+/eNB+nU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVGJEH9qbvwNJW83T6r6wC34EaKGfkBoIUtGEsmeicyw1DHhTc
	/wkvc9fR8jHvqhllc/iUTR5E/UH6rU0Jf9yrZ1ssOM3f6RCySyxnhVdn188H/IqC/3XM/9gSsPX
	DMGa1XWtbHE3fB4DE6oiQeHArT9WZ0zK3iE4sb7eizQ1ZaqpEVfzoV6RvwPRNlA==
X-Gm-Gg: AR+sD11Wsi2Ntn3haqHZ068Xj/JzIrSHoO9tX6KXOjuNnbGlsIPQ+cwfm7WSJia5FQy
	geh6dGN/D8TQreWcaJQXa9KDvWl9xHPQEgBfM+Ok7rPO3M8yYV3pYAoBeJp+uGI4J6bH4BQTlv4
	RGoKXsk1SDqZyB1Q6aWkqNh/rjtU7NWRhKY7jH3XD3EvzYrz5i4X/8BPA7yv2auMQ6AmVwam2uU
	mBnHaR2lUzjhQoGb/GLIPIfh9ZGVYOwCpldHPyjqU9rm46a9kgNUQJxO6E1p2Sxd8zWzmmnn4OC
	NkoGakot4hCBZqbO9dIejudVKhhtPsrcpPdvmiBQTIv1SAm1rBwoamsn7i4yoGXgdoVfBReYi5V
	utjFu3ElQ7o1lS7uZhAp0NZJ59yN8pJFYaOo=
X-Received: by 2002:a05:6214:f6a:b0:8e1:82d1:8e5a with SMTP id 6a1803df08f44-907ca6255abmr97472416d6.35.1784919510872;
        Fri, 24 Jul 2026 11:58:30 -0700 (PDT)
X-Received: by 2002:a05:6214:f6a:b0:8e1:82d1:8e5a with SMTP id 6a1803df08f44-907ca6255abmr97472206d6.35.1784919510424;
        Fri, 24 Jul 2026 11:58:30 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm4291076d6.25.2026.07.24.11.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:58:29 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:58:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: phucduc.bui@gmail.com
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: versaclock5: restore cache_only on regcache_sync()
 failure in resume
Message-ID: <amO10zgmVG2dquks@redhat.com>
References: <20260724074603.28731-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724074603.28731-1-phucduc.bui@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi bui,

On Fri, Jul 24, 2026 at 02:46:03PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> If regcache_sync() fails in vc5_resume(), the function only logs the
> error, leaving regmap with cache_only disabled even though the register
> cache has not been synchronized with the hardware.
> Re-enable cache_only on failure to restore the state established by
> vc5_suspend().
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  drivers/clk/clk-versaclock5.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index 913fcc5675f1..d87899118905 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -1240,8 +1240,10 @@ static int __maybe_unused vc5_resume(struct device *dev)
>  
>  	regcache_cache_only(vc5->regmap, false);
>  	ret = regcache_sync(vc5->regmap);
> -	if (ret)
> +	if (ret) {
> +		regcache_cache_only(vc5->regmap, true);
>  		dev_err(dev, "Failed to restore register map: %d\n", ret);
> +	}
>  	return ret;
>  }

I don't see precedent for this pattern anywhere else in the tree. Is
this an observed problem or something that could theoretically happen?

If this fails in the code today, the pm core will propagate the error,
and the device won't be marked as resumed.

Brian

