Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961F83749F5
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585107; cv=none; b=ardSV0ixd+sduDOCFeEIRAIxq4lrIN9ccEM3xPvJ9oWZJx+VMLu0ZXeZDkr6I/ZfD2zZJ/CsV4dmcggJ2Bv2wFQ0GVjiT5MT6SWLh/3nIUr/DvmTHbl5qB7qRm0bJ0bN57Qmh6WVQQzuJq3PXmgoZPV/cKUnrUMAOwLHrsvIH5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585107; c=relaxed/simple;
	bh=O0mU7C8nx8yvGb7lTO7xBvxzBs0jU+eoc/vSCOedZFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsZ0uCMgLdu9Jd2caUtEANHVXYuej1MFhV8ECJqVVxkata+RoLRIgBrCQO4HzSx0nRwu/t6njl7nkBdXgc5LgwGr4E3RNOHzL45Yahgn4ChGrphp1F3/ocl35cw3WEyoY7ttyLLIoEdHO3IVVvLRcW2TlmgefhCirk/2V29NvgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QaefqwsY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y8L3FbOB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QaefqwsY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y8L3FbOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787585105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QL9QOEew/d6GNE0NYm94GLW/r5dmryOcr7eHZGft5EA=;
	b=QaefqwsYtb1QxoEunfbfbJ+EJ/wCqMBOc/lSVQK/C8trAbEqn43Z36dYTweMVsdhzmxbqS
	lgd0ym0/sXaqhw98jR6qtYvjxXmlWQ3hyf3cFy0RXneC44dhWeTgWgY4z1ntQt7vu4XBis
	cbSY4EzonVPxmplG9HmmGR5zKwA5Hf4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-Ya88sL41Oyu0yKRxOZYpOg-1; Mon, 24 Aug 2026 11:25:04 -0400
X-MC-Unique: Ya88sL41Oyu0yKRxOZYpOg-1
X-Mimecast-MFC-AGG-ID: Ya88sL41Oyu0yKRxOZYpOg_1787585103
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f08560ea44so36588686d6.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787585103; x=1788189903; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QL9QOEew/d6GNE0NYm94GLW/r5dmryOcr7eHZGft5EA=;
        b=Y8L3FbOBj4WmVchuhJ65tjqGVvUz+MZboCUC3rWnUAi8PQeuvnB4zwsvgN5x0zqiFK
         hIEJemlA9/VdDXE/xe5R2C9SRQPSYmC3o7dNZ5boIpW74UaJFV1YpOYzaKILEH1AY6Vq
         36EZsE4i0Aif6asZaXzDSY9dV6iv432q474J4F1ijUU87KaHOLHTJkmchkjWZO3qjdc1
         UgB1UvtKZldjEASN7qsji+oeFuRDmPFZyG2aOC3jXvythglB+rMYFe7d97zWSHXL0lAq
         yf/Wp8iAYLIcBjlAMQXSy61RMF7yJhGczC35WLV7bly7HebkPIxLab/Olzor6OosKkkX
         peJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585103; x=1788189903;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QL9QOEew/d6GNE0NYm94GLW/r5dmryOcr7eHZGft5EA=;
        b=FLjjadCdXREXQg2lfGGZmj3fLPilDJFOxF7zdLDshC2v3Q2HNeenUrx2Nh5Fk3n+lx
         xFcotHeQHav/WaS2mfDdHj3OZkcp0Kzaajpc9TDGPpk8eWkEXljJlWJ6ive1bP424gmc
         iKuUTPyZ7BCJGEyEppCF8La4GINzHzUAu4sQCwOucS4YSBsFJWGSjDibHGh0efV11teF
         bCrk0uTF2AY775gh1Wnp4MwLyMNCyP1oid2wwHL933AvL8sw9LKG/3jT52xjsFwKQM/b
         G3gKRPMPtlAyOnQH8DHHqcfzuFcc4GEzilomIlkuhy54RNotaNfVXvrsTm+ZxDzYt0F9
         u4Dg==
X-Forwarded-Encrypted: i=1; AHgh+RqGw6/NhGP/z+RmBJrf99g7cmWIsjxpE6nzekUxtuYqHOBIDYIlB/V6VrJ7twvLniseKbSnMJu4bWE=@vger.kernel.org
X-Gm-Message-State: AFuF++nw8Gl3+p2jFfPdCSjcERxX9syITsX2pAAmCXs5jNRgNIlNiLGX
	2TD5RZYY54JGIAGUPdQDHe/l9gHXANedW2QgPi7cFXGsdHQGTmBjfDH7aKdsRVflgNJ3xeY+9Es
	x6rTTRmEes39Ck17ArCaPTa18gWXC1+EcxCrCPDfEyEt4nIGpC+zIOGqL9SzQFA==
X-Gm-Gg: AR+sD104nyDUZ3hc3WqKRq3jri2CvoyvcIDMAerYo+nER4LaYmUr7VCXFwWp1vdzG/b
	Nl2k4G4hNw6w0Ytwmcg9XabwavQfB/tNJoTvRn8rzFlxeVFgH1nfKRRdDEquVeK+SSVUX+j8BoW
	fkQjR07DvB+lUpu8acEh73E+wNxlcrWHh6PxgKKD9HkC0xVZFHUXACxqfGt7aUZvSYp53VJH8Va
	kA7sI/sPlwMZ0/WXOWYey9alOGU8192G0XWrWAL+E4CmPnfc+sOIK02DT9ob4fUGa7rCNypgWQq
	H3jdsU0ukLJa1n/NNdo+i6Oqk4tv8CGMTVPV1F48eoU1rHqkMIXTrYGNE/dz1mot7jhE4n1lIOM
	qzkfrldjjSBnlDEz5Kq4RBP+20igg8GGJGOs=
X-Received: by 2002:a05:6214:4113:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-90c80c5c09fmr261767666d6.15.1787585103461;
        Mon, 24 Aug 2026 08:25:03 -0700 (PDT)
X-Received: by 2002:a05:6214:4113:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-90c80c5c09fmr261767136d6.15.1787585103066;
        Mon, 24 Aug 2026 08:25:03 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a4d8bdsm64019176d6.38.2026.08.24.08.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:25:02 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:25:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Kees Cook <kees@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: at91: main: Drop unneeded cast in
 at91_clk_register_main_osc()
Message-ID: <aoxiTREro0NoIs22@redhat.com>
References: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 02:44:28PM +0200, Geert Uytterhoeven wrote:
> When assigning a non-const pointer to a const pointer, no cast is
> needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

