Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E904E86341
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 17:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782234083; cv=none; b=XvD/GoUWgA/0pzSzgj4V67AuLIpreOMXoFeCSK8rqZ8aJME3+BYgWUvQ1Hi4PD3w2p9jieB0uAelrh0p9+b6p5iszQyK4AIXic4yGWEcF3CrfCB8BkWQL6jjjMXSf2Z00EEHiy+m/3iGI+iaD5xpX7S1YusZptRkuCVHKDHBPUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782234083; c=relaxed/simple;
	bh=KLp47J3F3ZEmgySRH6ZoydWxIZaG/J2hxWrFEP1eRUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zz0+qDCtWuLnE221L2dNlYc2vgN3lbrTadZyQfUajYmB7TzCEFbzhMWdUfO1gYwPVnIfyWSS//K1/6GYzy/b2wFY/pubIBkZlFgCqgKPg7aER1Z1A3VL4q2V0hq2aOADhlr+YwMZTh4GdJ+fZ3dM4QiFyVFO5uuojxpUn0foABY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d4voqUYn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rxq3vzZ9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d4voqUYn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rxq3vzZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782234081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHLmvt/hfcPMjp8rNAR4Lzj4cVVJybJjQGa6DTmnt7A=;
	b=d4voqUYnPECaO/CiPmZQ8PlDwBS5ZIS2ENOqZNFzjeRt+3nO5PuAcdGSewMGo9quy0t2bd
	qqYmlOCdswObfFJB2fNzq3obGpDYJl8esIjumK31cBT2aWCQ+gtAJlTqHjacPOrmU9IZwr
	du3PbUjPtmyTOKvGBumLHvbJnCZwodQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-wzMH3JObNjqydbClBcYmQg-1; Tue, 23 Jun 2026 13:01:19 -0400
X-MC-Unique: wzMH3JObNjqydbClBcYmQg-1
X-Mimecast-MFC-AGG-ID: wzMH3JObNjqydbClBcYmQg_1782234079
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8de3cf78895so2652486d6.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782234079; x=1782838879; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHLmvt/hfcPMjp8rNAR4Lzj4cVVJybJjQGa6DTmnt7A=;
        b=Rxq3vzZ9EH0QfWbnGQan4kt6iara7hDJVYoxP4YOYBPjJdLi8MEe/S9rREbvEoy84l
         jtyIFj3uX4UA/o0qknel2nob4GUzZXydYgX1UAfWUzPvYoCJzF2JWktn3kUffiDS6pkX
         JUa7p3HjvwuJIcZRdZSVQY3JnFSwdjHtKiyr3bTvbKh/HoSmhY7uYjT9PVzrZDttITi4
         jJaLNSPx+F149WN6X/joYeWtWHJW8DV1br5bN7f0L6K1ZOIkUMi25lhqUp6p8j3hctXx
         UI39L6Q7lFn2FfeA9K4EsAvyeq4mixyKH6lFF6fQCWctAf0EPD2zLJpvXFKOa9Hm6JTP
         CTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782234079; x=1782838879;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZHLmvt/hfcPMjp8rNAR4Lzj4cVVJybJjQGa6DTmnt7A=;
        b=V5u68TELVj5GDiY+MU1w3FaCQGkk5wdF0mo0GbR8PRcu2t28bTFtgwOF4NRj9pA/xs
         /x9MZ9NDTE74enUxmLwOJGdehjdaGnDxINtokQOWiN8uRBCT1GpnZ/zE4M8/vIczy5kn
         jc7ajC4HZfm1KrzWNDDMF4lDNT0Gt5XbcJ90Ti0wwqIdeIqbb2SVTZywFlZNlA8dzcH2
         umD38aoslcCsRoSA0RIOHYyJj1sTKDXsO6nhDOq+MbYtnwjuzIezmYeZwB+DRjzZoliv
         /vKMIVoALm3UVz/XmA7QMFeJoc1wbm58dQqrV+lJjTVfNP8R2JPBc/UDXvlw1vuhZlKF
         5c/g==
X-Forwarded-Encrypted: i=1; AHgh+RrS/M4fUi5HRd02WJfM6x3/BR1GjZWLDrynf57aE+PBl8wpkWCNFdiMeC0DwujsK8d4SwbVnBSybek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2/+3IapDWj6T974BsUL4ktrvhBnBtOUWfHGpr7bwXPCcsvbK5
	njlOqkmNq7XJ+f/DphLdj31+eSFB0jPNdfwYsK24YUHfXgXCwdDjzhHWnBiGSQG/pDH0/azNYjh
	dC4KaiKyC1HzqOzq0LMjvsHAz6kRI6TsrI5/+oRAy7Zo5MxyGeUXd3VThEnXiyw==
X-Gm-Gg: AfdE7cls0EzR9Iemiczu6foOJZyQ25lHoGiU55gYWKSkxwA68Trtj43MJQY1s8DREhJ
	KIHzdPEsnY/1MiJJVjQAo/DAKAyMYKWFDibp/vFGYpCwt0a47WzNNZiyn/STXDiwpnXBDNq4OTs
	KnwZOb/w6zS7xs80lj2wI0YWZG9cPOIqXmadMAMQIZbXdqX6aEzSx05W+EfsVJ1q+0/lqgCmxSS
	HXQYEc6kqqBukA10lgnt7/m3PNcXnEeGMI4a3o0IXj6QNnaU0IsTSjJ+GQTE9bwPdwzFVkWxhba
	Ld+uuYWgq2uPjq29zUoo/IYJ0QiBGqa/0OEgWJPOg8MKsnPenfD05namiO+YVcsnG+BC6ciu8PP
	akvksfmMHwKMy7QRvDZl2Aor1K00K/J8a7A8YyYwA04aQxw==
X-Received: by 2002:ad4:5c6c:0:b0:8de:7e5c:b57f with SMTP id 6a1803df08f44-8de7e5cb63emr362655636d6.4.1782234059805;
        Tue, 23 Jun 2026 10:00:59 -0700 (PDT)
X-Received: by 2002:ad4:5c6c:0:b0:8de:7e5c:b57f with SMTP id 6a1803df08f44-8de7e5cb63emr362605556d6.4.1782234033037;
        Tue, 23 Jun 2026 10:00:33 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f01855bsm146771086d6.9.2026.06.23.10.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:00:32 -0700 (PDT)
Date: Tue, 23 Jun 2026 13:00:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
 maintainer
Message-ID: <ajq7pziuKDFZqj40@redhat.com>
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Jun 23, 2026 at 05:20:37PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Alex's email is bouncing. Update the maintainers list with my contact
> details to take over the schema maintenance.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Ref [1]
> [1] https://lore.kernel.org/all/ajqWevofEJ3fv856@redhat.com/

Reviewed-by: Brian Masney <bmasney@redhat.com>

Thanks for submitting this quickly.

Brian

