Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F893A0B24
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 22:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773786246; cv=none; b=mGWvnxMPskjoCHTob4PdkLlgC2rBwlsel9lf6n4wT5b66ap0P1xFr8DDrlIB0aoFzklRcx3UnbUaTTzRe5KQjE89dhPc+4WIeP11f8FhltdtoI1WQ5yO8A/CFKyZCoYjUK4a2s38qY/o2jYJjfjxi6aUin++E+MRmTydqpXpdJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773786246; c=relaxed/simple;
	bh=XOJsc7TWlX2OR3VVXyws4Z9mCznxegOVcmgKTN/aicg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esHM9b4eTMs5WUdw8DebUeUBW+bW/I7SmuiojbSy57ceF1I3hqKGjQ5x8JQBpnhDi66mIuIyeArrRzub6z7wzAkcyIrbom1QW6/RDWC/cBOFquxoiq104T0rMsvNIR/alcJf0RqDD26xCQBiK7YLyElBp7bEyyGCzLNwYqXpQTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DzJUvt13; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=E2CFADUC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DzJUvt13";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="E2CFADUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773786244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yBl7WuSTPHURhBSfPTM/+0e75JESjPHAQaQXXIuv+YM=;
	b=DzJUvt13tJFtR/moAKPI8jq9A3JKhjKURRMIIPU9mVY7DZm+5mXX7oD9/vGXrAl+v+goAg
	CifltAG7wBDDRVvEqSp4Q1Pg6IzUU0PFuW/X/mr5lSIORHN0Jd/0x7X9GS6d08aJStlMDW
	DLpfiiMMeld+kqjGekQAMJike9Eoom0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-lA6OR4NgN6inQFTk1q2CEw-1; Tue, 17 Mar 2026 18:24:03 -0400
X-MC-Unique: lA6OR4NgN6inQFTk1q2CEw-1
X-Mimecast-MFC-AGG-ID: lA6OR4NgN6inQFTk1q2CEw_1773786243
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50939597b85so5136351cf.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 15:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773786243; x=1774391043; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBl7WuSTPHURhBSfPTM/+0e75JESjPHAQaQXXIuv+YM=;
        b=E2CFADUCafOglPiL2YGqu7Ca72yRgixOoSK4cR1ROgGgLjzQWcSiQM1Ix6eJEwlAbA
         b0NDuAr/TbuyUXyvwLu+ZfL2W3WGXYuqS97xGFeSEVE7IZpoQ6ISRNzyaKOUn9vPXjuh
         saBMOrVgM4zCqi0WaM3mhcr2cHgX/YQdYY9QJ7HWwmekdK5k7RvAZq8XUi5OIO6CYSUC
         yxODIpHy0LUn7TginCaUh7riC1iNENAQcCuUDElhcHWadEUAomAHyI9IuOBo28tfv3zW
         WxGi+8/NnkHlaIHr5irZKBxCweFyrWdJuzvUiv9sCjJWlaqiZS6cbI0DvaG8ptg5oWgT
         xZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773786243; x=1774391043;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBl7WuSTPHURhBSfPTM/+0e75JESjPHAQaQXXIuv+YM=;
        b=o0jcmcxJGQYGILLv++KrI2ZS/TAcE0RzqMGver5ZeMdic8Bj/WjDD9yGGi2pS42p8q
         HhcJcIt3yvSid4Nd3segkSgEE+j0xQZChbZz1hLjk1lbpv/gXTlYy4lOt+x+Av9z934X
         HfpQ/Bj0MTynFMgRvJLG7/aaQm6xR4KouKs9qcsufHfyxHrDptvADgmzKlIKTD1+ZCsm
         K6ESf4V7Tlz8AKsYUceX3qlgYbxjQSu4JYQ4J0uKh+Z0hnLvYMyDrm/Pv3NK7W9vmai8
         JVFXXd2zfuf3Gd9O/fuQdMlFuWmkLXGVmdABqyeTfm4ueSdX03OexLjC2aJuElTa1uOa
         9kQA==
X-Forwarded-Encrypted: i=1; AJvYcCXejoh9Lv5p7lskpHXzSCKn23j8CXzJHNd/Qvnv5IHUxgxArvomipuYGa1LwsIGnCeM7jZMo9jkhB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNgFK31hATYD54H5Wd8ZHzvGUcrTL7YB6tPppN/SB1AERpsryc
	07I8wDg1DpMh1W7D+uZG4Ivw3y5hfcPwvKXhyUCJPGgQnpQXCIp1ztXcxWYX+I0CMpBWLAtuxz0
	GSRXJ7q481cYQKoOY7iuTdtItrMo2O5lmrFIgYT4YK+C47CDzOwP5cFEP8MZrug==
X-Gm-Gg: ATEYQzwjKU1tagZF6UiRmV3dRJbrS11QBrQtUz4uY4Ia5UVdsIBKKPJ2214Iz9MHV80
	aFjmHykAYB+mp2JYSchbTfwE8NB2F0u7MjTbGeGg/KWw+47NUN5UuctGQghaVD7dI12FD33SR6w
	I1WKt/FAgyXp6jWpz+cXVJQ9Vr95mcbK8upQUZK1bVoZ/DdITMUm+xf2gAav3fHgfhQiSzzLiRO
	fqF+trnsAD/dfl+C/a6t+2PLigLkxySnxm5BFTHaKsI50ImMGeJ1HEmFSzj4aRg4AZ9BEh1btGJ
	09/q5pSAIcYWjaR64oJZhezHxrggV4jbQ2Yi/rYC5iRRiZRnY6RCHIjF13oJdDvzmv2l2KKbTYv
	6ui4DGcXtwqjL11pqUzb3PUPDAsLzko1Xwqxh7kwuW/C1OHpLZL851wLG
X-Received: by 2002:ac8:5e48:0:b0:509:23c5:3289 with SMTP id d75a77b69052e-50b1499bdf7mr13768131cf.63.1773786242792;
        Tue, 17 Mar 2026 15:24:02 -0700 (PDT)
X-Received: by 2002:ac8:5e48:0:b0:509:23c5:3289 with SMTP id d75a77b69052e-50b1499bdf7mr13767811cf.63.1773786242410;
        Tue, 17 Mar 2026 15:24:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b135d5bdfsm8075771cf.26.2026.03.17.15.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 15:24:01 -0700 (PDT)
Date: Tue, 17 Mar 2026 18:23:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: add clk_hw_recalc_rate() to trigger HW clk rate
 recalculation
Message-ID: <abnUf13EQA_FNOqP@redhat.com>
References: <20260317173255.5531-1-ansuelsmth@gmail.com>
 <abnRID0SfnQlRw-e@redhat.com>
 <69b9d2ed.df0a0220.126423.ca41@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b9d2ed.df0a0220.126423.ca41@mx.google.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Tue, Mar 17, 2026 at 11:17:14PM +0100, Christian Marangi wrote:
> On Tue, Mar 17, 2026 at 06:09:36PM -0400, Brian Masney wrote:
> > There's no user of this new function. You need to also include a user
> > so that we can see the complete picture of how this will be used.
> > 
> > If it helps to demonstrate the problem, you can also add to the clk
> > kunit tests in drivers/clk/clk_test.c.
> > 
> 
> Yes I know a user is needed but the user will be a PCS driver and it might
> take a while for it to get proposed. If I implement a repro in clk_test is
> there a chance to implement this without an user?

That's up to Stephen. My understanding is that is not enough, and you'd
need to submit this new API with the PCS driver once it's ready.

Brian

