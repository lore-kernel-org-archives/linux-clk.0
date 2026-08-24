Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955013644DE
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584593; cv=none; b=n/kDgAtliaPht1HieK1GpqX2eTfs/atnXp+bQPsHJozSCn0H4gaElLSNP3QkSzZprlotl0faV433fLVnWGzOfvx1HcX6sD09T9hUfvA7mxbHoiS6caQSjJCeUb6g66ifcW7wXIsm2iBfpaw6+AcdZU2ya/s+DENcU/fvJB9cQ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584593; c=relaxed/simple;
	bh=s55TdVXCadSeUHxoO8iqmpRHfDLK5jShkPGaR9oAdFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lE4vHi+nUWbzzGEXmAkCnXYYCRl8fM8v4Nu4PyanGNufnDg7SrzGHYaL7vmcMunm5XSqq16J05t3FGwJpAo8lBlX+spARcT01LX/rD7Dg7CIw4KIrJwsV7mgW9MVFl71MmHaJLl+3G4xHdzhEi4SaweWogrOOyBhURgUzSWE2xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fCTI2Lak; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LW7lF2p2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fCTI2Lak";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LW7lF2p2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nz4z837SgWBU6BZap0nYTTwDo8TkFm9YBjxokHawMCY=;
	b=fCTI2LakGRuzqVsi9B++2Yf0xLg78TUzHndjn/DUWEvl/nYEXtl8mp8lAkfreYIrCHE0u2
	s0NVY6D1CyNnRMWwSvC0ZNkt035+mIIwPskEl896XgHTx7H6wID2XbZ7sRuk+4hKqHPQSP
	igMsaQK9UADiPC5reZs7iSwaQCNgtR0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-9BhGzvdPOAymnfB1CuU3YA-1; Mon, 24 Aug 2026 11:16:28 -0400
X-MC-Unique: 9BhGzvdPOAymnfB1CuU3YA-1
X-Mimecast-MFC-AGG-ID: 9BhGzvdPOAymnfB1CuU3YA_1787584588
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d9cef8d15so68383691cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584588; x=1788189388; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nz4z837SgWBU6BZap0nYTTwDo8TkFm9YBjxokHawMCY=;
        b=LW7lF2p2uOrpj0R4ibagPBjAc0OiMUy7VBAkhxateCV+vxXOtR6FLW8JHbG/8YJCH1
         ONMaHjKc/fQ8gPS3f0EW0Wyro1NVnDwnf1ulNuUMFCNrx3hhgsT6vGOZpJvFZJ8wdmVS
         o/bkPLdMmquhP4SPI6kZfEkB61cghFGogl3qsVaBAxN7abS13cpUGjW2W709x2lTgRGv
         3AzxAPQfwb4MwYautt09C+j7GCGbDWNk1Se6U6SbXJS0ANjwfVQaVojSaemuF+fmQCo3
         8+jKcZayNdnKgN2xEih2Mx/QrUhG23+3SMW9VKi77Y73pdkw5GebLSmFczFSGwNkErNe
         O7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584588; x=1788189388;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nz4z837SgWBU6BZap0nYTTwDo8TkFm9YBjxokHawMCY=;
        b=Dff4DuPfjkG487zhe6gDyGQHWylGiJ8DSGwif5mq5hJzyYHl1nJdkV9URCRTZ/57Uf
         8b7Bnt6kfAPRa1fzenG7qeHP6odUF1nQUDfI7RZqzn1M5AIHedrPn6jEXrrnm4xjmw8G
         ELLRWa3JDBOKtw3m55eyr1WaYUG04N4CmCDJRvY88+0ZbpG4AuF27/s/kReW1PfqerSO
         KRvbMMQP3EL5cE7uN7pbKMm49aJowJsVMbDk/V8YA83BPe/nkuoe8trKOCiVHtUXgLTC
         Yzejuk+amnESJS2jFbKwbWSqdd6n4vZdcwhbJ0UCVhPemSzaCGxyoIrm9MhpEmFMqQSI
         8pKQ==
X-Forwarded-Encrypted: i=1; AHgh+RoI18kC7D/VbBxuhT15wt9dCv0V9pTfmfhqGPuTB8OMSOhD+2FSHpqje6c9dl5RCjCfuhag1BRHryQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m6GEao5ZejnhyH85SJZqTBZI1KavDIK3PWTIKkio+VKA+LNf9f
	18q/IN2gEtiqYbIpmqWLRwkOUgGiM+w2p4W66DIqJRSz28+aG4DnWCma19VWLdxpd/Q8/m3vZc4
	OfryoAOgKoLMKIcjeDLdCTam6xYSv+Yv7DcyCukzXiSxiis5AvjZe72ij0hv/FA==
X-Gm-Gg: AR+sD128HE0sCV/RXfB1vHNbYpFU1Z8Hk6Hy2gxPxZYG8ed8dYCX3REbDvzK/4PVzaS
	dDa0oZ9xsUyMQzTRcCkVZlXPJAUJCxHXVxeU2w0aeXbh2as4nNC+BetURrJyjM6NZM9BNmv/JOr
	8A7dkC0zVzeynSPZhLXfphB7ld4v5aGGoFZY/OI4zwGb035FPWd4wn3ddLkmVynzNCYMWUtwKNj
	T+MJC4BI4+T0jpnhQ9rvC9cPerrBq8rMrABCcTrK/UnNylosHg48mnB4er88wv/aRu/6OPTVnpU
	Vcc467N0SahbpIYYY+dNVu6dO9IfAMz4TNdMc0QWM+ZriTVyMjVFI24m3Qtp4n4DM2eEZMmTlfq
	AWoYNdZeiq1Z0cNUniYS1u/r+OC+UjoUP3ig=
X-Received: by 2002:a05:622a:48c:b0:52d:6de2:906c with SMTP id d75a77b69052e-52e09bd76b6mr191238801cf.14.1787584588116;
        Mon, 24 Aug 2026 08:16:28 -0700 (PDT)
X-Received: by 2002:a05:622a:48c:b0:52d:6de2:906c with SMTP id d75a77b69052e-52e09bd76b6mr191237961cf.14.1787584587678;
        Mon, 24 Aug 2026 08:16:27 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09975f5asm50565271cf.2.2026.08.24.08.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:16:27 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:16:26 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] i2c: bcm2835: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxgSkSflxgaZO3K@redhat.com>
References: <9f82f37e6d6c069cd44326bcd5e5a2a8069a13a9.1787239980.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f82f37e6d6c069cd44326bcd5e5a2a8069a13a9.1787239980.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 12:03:30PM +0200, Geert Uytterhoeven wrote:
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

Reviewed-by: Brian Masney <bmasney@redhat.com>

