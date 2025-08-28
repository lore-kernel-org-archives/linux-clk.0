Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D896E24C06A
	for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 16:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756399942; cv=none; b=PM0ZsllqhNtlhAn6MZZV9pOelQlRoTQ1IcAXzLdx0XSZWe4KhsRLipPaYjxMb3RfWQMpsl4W7mBUEFGNaZsdJ/KE5vnEZJpE3n0UmCuIeFbeqR2HV48NnO7Ik+o/geKX7QzQRHeq3bfuyEC6pOZwgK9PKY8gYLNmVQ+DEPxxkq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756399942; c=relaxed/simple;
	bh=F6F1t90tDYHI9HHx/dUs3bHIlZY2N4fRir8Q3403KXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqRy48Az3/NO+EnXkTNr3HZauA33gJachpHEQ2IN4vskfq1sIwloihQjqPwXSrnjNvvHafxlK7g0kSuoUZaPuUzBOXERz6AYhJLNXo/WCaKCNpZkoattLRzhvIxLDSvN85keoIH/QxX/BVz0wMXru+krJFn4+aC/fAYQbms1OU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Krc99uc1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Krc99uc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756399939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xee6NKuNIkTbreHLQ12czC3T2u1dvCFe2tAbj30qkQs=;
	b=Krc99uc1cpk9irdvRn6n8Dp8vLR74rbQ7EKi7nhcrnA6Y95L8GIgwjOSsZH7/X8p0x9nMe
	SYgRMd+YId3lZ37pjgzhAKEUPL51abY3rlwQqhsO9Nqy1y6gpH70RoK4kBqb/RWxblg0O+
	qfHkJTmiG94wJpi96tqCrCbyZTISVsI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-x04wXK0RPTq9iHrB0uI11w-1; Thu, 28 Aug 2025 12:52:18 -0400
X-MC-Unique: x04wXK0RPTq9iHrB0uI11w-1
X-Mimecast-MFC-AGG-ID: x04wXK0RPTq9iHrB0uI11w_1756399938
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70dd6d25992so26630896d6.2
        for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 09:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756399938; x=1757004738;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xee6NKuNIkTbreHLQ12czC3T2u1dvCFe2tAbj30qkQs=;
        b=i9aPh9nE34FoNWnGa+46yyC0+e4PjWSMTSek6hUlY3LbLsvWHQSRgzuEt+3SIDOfOB
         ZhCfrt+yRes5BwFi5ZL2zwOdqUjHVLEeCU6XBdUY1sJG11dmVoI07EEYIQwqn4X8BXv9
         rhdynkAHWi5KPrlXtwWkBZhlW+QZY316ejBI4c9YlraShDmciqx3CfvyhCsNig7iIU5w
         iVJtBbs3bNyCNIA37N3ATv1f53xM6LWwIGxs3i7YWqYkUGbopI7DIL9QCwt9Gc+R7Sr7
         QEoFX3HucnyPQGGDJFvsDQNftdF2iw+CjLwWsqQ4OJFUMMdy6i6uR81IJRuG3M0qtZjv
         PSrg==
X-Forwarded-Encrypted: i=1; AJvYcCWmBHAEVW72wbx1Za6lRgU/IS6IBG0iBdQ/+QU7/z/J0NompodxC43fWxobAnbtn47S5aDFwC7KYT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH+fZZJad006WIWX8HTLz8hZ0Jw/YZNL/mwXvivJESCzJvpR/I
	l2eIXUgAKE2BGeJEMmmORlJnjR6KX8ANd/572yYDkLE6xco9SdI5r/DKC+x6gaevnY+oB8Zby5o
	1VAaxwxZSgsXHmsgRFPtmIN0obO64F9tPOnE9E7jshsaVhGLmqu2qVHM6wvL+lQ==
X-Gm-Gg: ASbGncveV+AHplRmcAKK1A7FnfxoMX/eheMRjb2QUtjEwc4SWAJ5EhVmQ2TwrFO/XMk
	cPGvob5GMVmAgKlJZHmMcGBIYh9BWsEaRzf4KNksv96TRuRzxmyNaLdZbdp87M6R8QJkZpyLMAQ
	1cmMLMdnkL+5KuKGJD1vW9yx12RW6mnPzawXe3WbqVDhn70FOraY5oXdq+I2CniwrqMWHvyHAZb
	ySfZUL+AIFXD6u+a0kel4YKgz/HiAk6drN96Eop4jg+RmHT9JAKqGKn++V7JK4DtePtunkvBiE9
	VeU6RttBrrJ0SJFMQMe0XdfHEYCZdtRE6w60XexttaAYc5cO0v1UZuYtVrplo2C6USL7YvKlXhY
	NlgmvHPZJPE8ttGXOD6M=
X-Received: by 2002:a05:6214:4004:b0:70d:91e8:6cb7 with SMTP id 6a1803df08f44-70d9725f3e3mr251186766d6.66.1756399937792;
        Thu, 28 Aug 2025 09:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpZ4ICMlbvyyFxhlVpeB0jL0VatrVSJLDHmA5nepySE1dAK1W4TzFTEvJOVDIu9B0SbTwIFw==
X-Received: by 2002:a05:6214:4004:b0:70d:91e8:6cb7 with SMTP id 6a1803df08f44-70d9725f3e3mr251186526d6.66.1756399937368;
        Thu, 28 Aug 2025 09:52:17 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70de7e0ae63sm30790536d6.52.2025.08.28.09.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:52:16 -0700 (PDT)
Date: Thu, 28 Aug 2025 12:52:14 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ryan.Wanner@microchip.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 01/32] clk: at91: pmc: add macros for clk_parent_data
Message-ID: <aLCJPlWTHcaxUze0@x1>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <f3ef0275345578c504b41710c67bfe1238c44c21.1752176711.git.Ryan.Wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3ef0275345578c504b41710c67bfe1238c44c21.1752176711.git.Ryan.Wanner@microchip.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Jul 10, 2025 at 01:06:54PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add helpers to set parent_data objects in platform specific drivers.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: enclose complex macro with parentheses.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/pmc.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 4fb29ca111f7..0b721a65b77f 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -15,6 +15,12 @@
>  
>  #include <dt-bindings/clock/at91.h>
>  
> +#define AT91_CLK_PD_NAME(n, i) ((struct clk_parent_data){ \
> +	.hw = NULL, .name = (n), .fw_name = (n), .index = (i), \
> +})
> +
> +#define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ .hw = (h) })

If you have to spin a new series, then personally I would put a space
before the {. I see both usages in drivers/clk/.

Reviewed-by: Brian Masney <bmasney@redhat.com>

