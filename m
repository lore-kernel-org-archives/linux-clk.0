Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5496E32D0C5
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631122; cv=none; b=qu4hg/BU7z+a0C6BokgIFeBU7I2IywuvPndLzSXuBVPt6mjpyKH/tlQn6+eAhH8wBfVJx+3bH2vMK93j+UfAZBqV+NLRbuhP4c6015eoRNauwWrQEulEU3NadEcvczHI+NogXn0pdOn/aFaOxr7EoFTpv54bCEX3vJP7HgJDoqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631122; c=relaxed/simple;
	bh=bKJ3I/p2e0Vh4IFYAmqyfM7NJoRWxLa5VofXn+LHCDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYOZFscP5fYhdtKkKSV8f509ChECYcIBM205OonSwktC7cpLz4lDKcybhfI20nLVJNnjqjLIRDThygdI6FeFKNfG3zS4cQNO5zYeMKHOqebiog1joU3N2nsLyaqgCufziE0Oo5adFYokzfzyXsh311/10VBvOPgwqVu2lOOjYJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W77zh9SV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W77zh9SV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ACAqVbHWeoat6K3HL1ahrRzqT6qreY6/QV4aq1RfvOI=;
	b=W77zh9SVR+LFj2IXO697t8vf9ClY8nXFWdBSQhalgak0/Y8FPDgj1Uc9PellXXaDcGQ/xJ
	eS5qZqSam2zLgQjBPAHU5Y80kRAAYjZmeajJa3K1+Zsc/LVlrHx7KUQq4HTfQ6SnqR3uB9
	2NgM1eJPXyDb2iMAmM8In02L572g/Gc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-WyewiszcOP6HvE4CA03CFg-1; Thu, 16 Oct 2025 12:11:58 -0400
X-MC-Unique: WyewiszcOP6HvE4CA03CFg-1
X-Mimecast-MFC-AGG-ID: WyewiszcOP6HvE4CA03CFg_1760631116
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78e5b6f1296so29518956d6.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 09:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631116; x=1761235916;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACAqVbHWeoat6K3HL1ahrRzqT6qreY6/QV4aq1RfvOI=;
        b=rzkES5dXICoKQ3nExKypPbk1dfuB1DzFqnipqmaS8U93eK0rUFf+qjuIEn45ujCE/0
         UzRXd/7Gh7GlrPSkFgF8JnTPOWmdDCDzm2aNLiYqkxqWT3cN6eQLnEVNnhR9dD7scrEW
         3AtJ7+7+yKRwwgO7LYwezq9I+bEg2FKzWwU3WZ+o1cJaAIysH2dd8eolCnaU7nV+TrV7
         xj+Y6FRBw8QNHd3LGT5YtwqpZyUxoD1NhA8/i4nBefYaLFWuKH3VrP5pUtJB3jR4svOi
         hCr0Xx/iPVnJnzkJmLcNYygQF5Gswu49AryNJB6R/GREMqHLvBXsYfduJDldhoRzbOFW
         bLOA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Ur6HEgFx1kZ38rhCFp3OE0Hhk9y0MLfxEwaquyJN/UdRivoz8xLYYJ6cMN+3ymeMMvmDdZAWFRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI2LX4qWw6ftbqWg1Ok+zUuycYKrBqYvIPDzK34d5LakGVfWzp
	LCrkCDz7nIUMCECu1HF8TzeENFj9GmMRmTloeDn6/Ccn0FBFcVfz4jAHIJQLCwPKFBpLBSX0MP3
	CcL626MVA3fuUrpH6rB8P66MnqbXgFWNrVNMFMG4+q1WNy55anIZm9yeVzbiotQ==
X-Gm-Gg: ASbGncvPEYF2YXO4uhFaZV26RB2L3NtqSF9AG09A9XZ3xanIFW1jPatvEqAWepiyY3U
	rmNLNIN/dftWcW/yDSJkbLSTqYpgTrztpKINZWBnF539eZKos7cD8YbOtIyQtZY9q3C3r19onST
	xhn00wvzJ7hxCK87WowWuIvc89lFMXPpnt7Ds7WJStv9gmOeurR/EswmiPZbb2kCnJuJXUYFY8s
	vC4FuN+np9wvPSkThYOWpj3GG9EIY9pNyiBrvWv0fqFqV4AHBMqCdO4vlKauUM8TUqTNufi5w7C
	rm5B37ajmJ+MaUL1YfgSOzLE2yVQHTjVirraa9LSFKxEo/6YqRON1uQS73+u9cYBxbg4FGy/xj2
	xRnC7swUTioPDIa/+daG0hUzLsnxIboHMt2Bw7Vmo656Ss89oekWFtWY66ZQ766961w==
X-Received: by 2002:a05:6214:319a:b0:87c:20b5:6685 with SMTP id 6a1803df08f44-87c20b56795mr9221776d6.55.1760631116549;
        Thu, 16 Oct 2025 09:11:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3K3iFq5m/T2G5n5k1Ub/AwaYH7OwwIxLCZt5EEaLCKub8NnH0J3P6LhBuV98s17jbVOVRfA==
X-Received: by 2002:a05:6214:319a:b0:87c:20b5:6685 with SMTP id 6a1803df08f44-87c20b56795mr9221106d6.55.1760631116071;
        Thu, 16 Oct 2025 09:11:56 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b4608sm42179536d6.58.2025.10.16.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:11:55 -0700 (PDT)
Date: Thu, 16 Oct 2025 12:11:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	Joel Stanley <joel@jms.id.au>, Maxime Ripard <mripard@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Message-ID: <aPEZSY6RC-UVclxN@redhat.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
 <aMatZAX6eFI1RmDH@redhat.com>
 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Andrew and Iwona,

On Mon, Sep 15, 2025 at 02:36:48PM +0930, Andrew Jeffery wrote:
> Hi Brian,
> 
> On Sun, 2025-09-14 at 07:56 -0400, Brian Masney wrote:
> > Hi Iwona, Joel, and Andrew,
> > 
> > On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> > > The round_rate() clk ops is deprecated, so migrate this driver from
> > > round_rate() to determine_rate() using the Coccinelle semantic patch
> > > appended to the "under-the-cut" portion of the patch.
> > > 
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
> > Would it be possible to get this picked up for v6.18? I'd like to remove
> > this API from drivers/clk in v6.19.
> 
> My (strong) preference is that Iwona applies it, but I'll keep an eye
> out for any unusual delays.

This patch wasn't picked up for v6.18. Any chance this can get picked up
now for v6.19?

I'm hoping to get this merged so that we can remove the round_rate() clk
op from the clk core. The clk maintainer (Stephen) mentioned this work
in his last pull to Linus.

https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/

Thanks,

Brian

