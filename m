Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C047B30B505
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 23:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762470706; cv=none; b=QxV43TuDxxQnrLOk42BctLV+r0d5bo2ZWAIcnN31oOW7Nu9Y5akaxzHQAooHy6gE9oao33EZMJA7I7nLq6vvYu/VGASjILgMhGl3esinsBPZy/KtS0dxY5su6VgFik8niM1vAxuMBxHejZlyCdRjfDtxez7IOW1ZOwhW9po57LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762470706; c=relaxed/simple;
	bh=jnYyMdabvpIDS8ikxG1OUNDRq/l1mITuGWaWLHaryfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcYvdcuZ1RNoROXft6hAltFKse0It+KqPZRVLXN/JXG7HeMGQ5A3bR1a3n7H5dIA0NrXqtPZO1WWqZhss7UM15j/sin/OcJh36DZGN2sTES5HI4FRZHPmg1iCDyD+hWBcP8RmOU77J+tzLh+/yRZW6sHNyp+TmxbJXFUriBXzSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ffoNfZt+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KaOHgvWE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ffoNfZt+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KaOHgvWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762470703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QXr28wg8D7Sns2qkEeLZq8j8Ed6Tt4Rhy3ccABxhAR4=;
	b=ffoNfZt+4EwKYQZhUq9CmQ7krU9OWDgy2PcqqjcavAJ+302QZWMBE3OQp41akYkDml5xQN
	t3j3R2sh5X1HxLx4VN/LXhD7SB3EphW4bAd6qdM1rpG4YJAvhcd1ojiAtG0LH5EI6ap5y4
	JxnRcLKT+5R8dCkk6Uzz3dJI5ySmWHw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-sQB9Kt1IPQuK0JSX9bhXrg-1; Thu, 06 Nov 2025 18:11:42 -0500
X-MC-Unique: sQB9Kt1IPQuK0JSX9bhXrg-1
X-Mimecast-MFC-AGG-ID: sQB9Kt1IPQuK0JSX9bhXrg_1762470701
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b1c1d39066so39066685a.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 15:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762470701; x=1763075501; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXr28wg8D7Sns2qkEeLZq8j8Ed6Tt4Rhy3ccABxhAR4=;
        b=KaOHgvWE1Zj9SbX4hUgrpggXpxlcdnYy7OYNLde0PqOkLCTvT24d9dgdQgZhcIla7e
         XDwv+t0pSz1DTc+TMwVWAiSWAlj60OskvFgHvg+ioyP+AvfWa49WUQ8dGeezpEOEAHt/
         PZzBFMyLPJlXr7/qXE0xHkyG8h63T2uJSbN1ENpbaY4LaHab/atys/6rCm/HKpxZURL9
         /5SQsDXHlO+3BoU3Fon2f9HzPOYcU+5rbeBIQeFdJ5g4XoN2STvWYAO4yl6bInb6Jdsc
         qb6CYgf0I8JLKmUxhq2+w2XR4h82hA3iq3eLzfcCcCR7KEtIWUPN+0GgHRQF66vKBI3l
         z3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762470701; x=1763075501;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXr28wg8D7Sns2qkEeLZq8j8Ed6Tt4Rhy3ccABxhAR4=;
        b=ao4wWz5nWpxCIFOEf7UMx45LeEQ2jWDaHVFUf+YeTSj5ZFo1U9Rnjkm5l4VAfxVTZF
         U8QIx8zEIK5XalSRUJHC99OUuhS93hW6bzrfghB+GulLzV6Lq9DuDiMjpNaEd2xLY2WL
         sbZiqaXvQahb2RXEhaatxiEIqEfNyxWk/zO11TvzgxyK23eRwC1FCByO64mMB5iHkxNN
         zMnsjP0xzyBxi92JXuFB+pNnw5ZNcfu19GqAfxxo9XZqrovvKg2yrxT0MuGN8KmDEVpC
         XVjIGZB/TA0/981cHSjt8akTB+oV8/o6rrHaVxurT6UJlrMN4JCPcgBWRm6SCu1womNn
         xXcg==
X-Forwarded-Encrypted: i=1; AJvYcCWRGKxr5uYSj+7crwyeTV/Ei9n9jjMnIdW/9WPm7mhuQzxcCx62/gTWb50d/L4TL1e9T+4Nt5cwTcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQgyGVd7GgiY+FuUvvcN+OT1vlRCLeYD81pcln5oZYssP2cr/T
	Xw7p7cHZSDsz6bxPbY1+tkCqQ4DvJwg/ze0RAviclubePMO1pJcDAqVBlIJaY9ZRo+DMZ+pJAJ5
	pXR+8/JAUMRyUN2S0etH4EDByY6X+mqZl0yCb1jTwVn2oxq/L9LlscLwxc2Y7wA==
X-Gm-Gg: ASbGncswK3u6m7waoEmL7a7pE8n1ZdyPm6fdj1WC9uoTbRIA/0FmDFxY4tAE3rnLbgV
	JetB97al6RENxRitOjxIaY8/sWe+WYaUzHI3M5AtB2LLRCugpb+fgFIG0+pVgOuhd9Z77Aikg26
	J8FJSF7+uQmE1Zx6QTS34bgOv41+kx3BEpnFKln37B6xRSx3vjKwYfNpfpJGksEOXnD2OotBRNb
	pQUvLhSItnWzjjiQQ4BfQQzMsl+MWpWxKoO7RnWj1cPYl8eG7WwiRcqeP21AAtjHULeMPrWuq8Z
	SMCE+naWMlUEgM1bT67G0PwR/Z/hyh+kG1aIueUlDeE7ED0YeUJ8bpSwDReNHw7u+S4NlMJ5doa
	Sok+Bybs+fjPbHSueO88O9RT7LPKvOmmhMQ==
X-Received: by 2002:a05:620a:31a4:b0:8b2:43f7:c07a with SMTP id af79cd13be357-8b2452a2167mr193180885a.22.1762470701615;
        Thu, 06 Nov 2025 15:11:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVetiFRByjjykyfxVb5wuiQuE2TgT+5D6JC3vwCG5rcTtdy2u5B3i2rGtKd9IxnXFml+2NaA==
X-Received: by 2002:a05:620a:31a4:b0:8b2:43f7:c07a with SMTP id af79cd13be357-8b2452a2167mr193177985a.22.1762470701157;
        Thu, 06 Nov 2025 15:11:41 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2355e56c0sm281056785a.14.2025.11.06.15.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:11:40 -0800 (PST)
Date: Thu, 6 Nov 2025 18:11:35 -0500
From: Brian Masney <bmasney@redhat.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"mripard@kernel.org" <mripard@kernel.org>
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Message-ID: <aQ0rJ3ahOV0gmUVM@redhat.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
 <aMatZAX6eFI1RmDH@redhat.com>
 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
 <aPEZSY6RC-UVclxN@redhat.com>
 <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
 <2025101759-runner-landing-374b@gregkh>
 <2975918e3f3a7de245e93fbee52335acb78bb23a.camel@codeconstruct.com.au>
 <2025101721-twiddling-huskiness-4852@gregkh>
 <13566a08eeaed313ad789abcae1920d9b00483b0.camel@codeconstruct.com.au>
 <d53256b35ee7089607463c66bb4a8c3420faf058.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d53256b35ee7089607463c66bb4a8c3420faf058.camel@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Iwona,

On Tue, Oct 21, 2025 at 09:01:23PM +0000, Winiarska, Iwona wrote:
> Sorry for the delay - for some reason this entire thread didn't land in my inbox
> and I just found it now, randomly browsing mailing list :/
> 
> I will sent it as a PR for v6.19.

I'm just checking if this patch should show up in linux-next by now?

Sorry to be a pest. This patch, and one other series in another
subsystem is all that's holding me back from removing a legacy API in
the clk subsystem. I'd really like to get these dependencies merged for
v6.19 so that I can do that cleanup work in v6.20.

Thanks,

Brian

