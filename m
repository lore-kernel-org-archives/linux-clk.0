Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0881A3D45DF
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 20:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783368267; cv=none; b=ndYa2zas7Kft4ehpVCncZ0B/eo3C91h6OI4H8Ad5+pBu8zEJJZGMau+v8gaUyt26fJjy8RF+kOPIAMO6/buBQxFw0cqKIin35PWl4u/rrD3Rf3e5SPjdvsJ0dvWSifKaEhQdDQ5zknxPBf4nRr6tKYXnnOwMjfQG9Ip16gHm4q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783368267; c=relaxed/simple;
	bh=cs2yBHOX5oyI2jRYpGq6JzwexFF3gKQEOOrC7alrvCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwxQMqWxx38rZSADrT+SII24luo78nULX23ook9K96gRSTxM5SEbwMrijk5cn7SPrhBEx++/+50VKFmXZijkE6ER/FKqCv1MU8Nf6Rq519k4lWbD11CY/nJmZzz3UN15e1m88c3oCLDKyFDFT3ju/YnOBS1O64K/MaDK8FAJJtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gUiS6pgi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NUYs/FIZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gUiS6pgi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NUYs/FIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783368264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5wdjn2ILuT01gLTBdftJHP++YDd3DzxJNeXyKRqGWZY=;
	b=gUiS6pgiHKfA1UVKs9nji1CHoVvjLh5sRpWEkOd5AC5DT243vWieE2B13YyIYz7F0OXK8A
	UH0cUifaSk87SbBvGP8pm/6ZijNLV+7BoIVpS0fcfXJONWLW7nZ6QNNhvIRf+8dxQqsEO9
	ksgNEl25ov/Ph0rov+p2Mt0UzKyKlPM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-_Y77BQwNOXCi5gdRpICz9Q-1; Mon, 06 Jul 2026 16:04:22 -0400
X-MC-Unique: _Y77BQwNOXCi5gdRpICz9Q-1
X-Mimecast-MFC-AGG-ID: _Y77BQwNOXCi5gdRpICz9Q_1783368262
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e73fc29bfso490388985a.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 13:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783368262; x=1783973062; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wdjn2ILuT01gLTBdftJHP++YDd3DzxJNeXyKRqGWZY=;
        b=NUYs/FIZoIRlhjDUyWK9tv/cibyR0Le/uqLaeRoB0Fss7hKYybW88GMOu9OV255uO/
         6Vd/X3HDv257kc/ifv43a5luF4d7ihzyQh+qWITyvX7/jGpt8/wT4+nlmcMGYFhQ9Orx
         ZUiflCyXouAVjWgQIW6VOUkuYgm6HtReB95cDd8IKUI9MMIKV1SHxzwJrdOFlUt1+iRx
         jlfSmi47wz3wuAcE4s2SowSzva2QeB5x8WpEevFwOdHGyLAwnJkyIGBScyWVSXHtPO/w
         etBvoKDasforr7Q/JT9KINotmFZzBBpgWFo3VZJX/rH6Q/uIUd5EOrUi0jAmBNHUatf2
         hZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783368262; x=1783973062;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wdjn2ILuT01gLTBdftJHP++YDd3DzxJNeXyKRqGWZY=;
        b=C/QhKTeKY6VM6Pgiqn+HJRhHLo/dSz/Ovb1WWoetHBv6qGXB+30gx6L3qFYCp5RDhY
         muSyhYoS1Vi7m7K3Bk8S9rlcv+iXEI+geT1ffmXs9yHm6rhl+r8qQ0ZFoHklCR7NTgxk
         06dZF4PIxKJeIqF9bawyk5/He/vpnhmyeOFv4QrTmEtOBm6JwKounzCORg9Q9HVzegCB
         CsDO8pogt20pRlY/NX4tP743HMFTeJ7YV/S02PUeWNaI/JVq6PHzeOj9Qz6D8qtL1uNI
         sz1vuOefReAOE1Co1sNmeit2ELu0bOxv6lZiRpEdxr4gP/rrT//K5Ln+Hsx9lUChdJDD
         mWvQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAC9WNasQFI7D4v5HpiFzx4Wigzk6KSIWkU4cCucQ5+qRVDIlUa2ct/iiirkZwKZlD2ZMMr8wG+90=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJahNwOFPxdkq9SkefDhW3EcZYGeWb/aH3FtAIMEtlEI8TfgB
	xNG4P5KgEie6Bwe5mF3JEkm89xBBVpC9kd+53UsMtt0Ae82XSU8GNjP1cdWldFokc6SH3f2pu3v
	O8s7V3iEhTNvf4VLeSTJQGNXb+5F2qaNA99rDGzxBDwcghYm+mxMbaJ9BiReKAA==
X-Gm-Gg: AfdE7cmCRGNwyUQJ/9hxEG9dw9driKLqPyGTxGABi9KMqSPUX6GHn34IvIltsA3M/ph
	Yq7UAsysFmf7w7P1m4ujPMGJ9/Iq8z+lz8zLjGezcTjoHomDJihRWxLj4IDNmBCTn6MGuONOIVe
	NO2XOMujtrp37TqZCbtOFcJD0L26BMuc4HD5uq+6RILpW2vwavd5FxNcQWUAicV43/6uZF39wOL
	7cUpBwoPEcq3Ju9QQMqWpVYZyIhdzrpbTueO6akyRBbmlVNoSM7MDs5/bpqpqeNlkJzejkipBX8
	uq0DmMWGchprAHtBDKZ9e7JOgXnoR5bvQXG9kaPYCv9iLNECml96mBeuh+J1ahC/HoyjzzYIfa9
	snvYSyjKRrP3XLqGn1zNbMJj+/9jrNWzESDXticUjenaA9Q==
X-Received: by 2002:a05:620a:2954:b0:92b:6805:9191 with SMTP id af79cd13be357-92ebb5dc455mr291579285a.73.1783368261930;
        Mon, 06 Jul 2026 13:04:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2954:b0:92b:6805:9191 with SMTP id af79cd13be357-92ebb5dc455mr291574585a.73.1783368261495;
        Mon, 06 Jul 2026 13:04:21 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b7fc3asm982333385a.9.2026.07.06.13.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 13:04:20 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:04:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pavel =?iso-8859-1?Q?L=F6bl?= <pavel@loebl.cz>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: si544: add support for si549
Message-ID: <akwKQgdNEO0Z_Gp4@redhat.com>
References: <20260701145101.3932655-1-pavel@loebl.cz>
 <20260701145101.3932655-3-pavel@loebl.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701145101.3932655-3-pavel@loebl.cz>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Wed, Jul 01, 2026 at 04:51:01PM +0200, Pavel Löbl wrote:
> Add support for Si549, which only differs from Si544 in internal
> oscilator frequency. Si549 also comes in three types A,B and C.
> Each having different maximum output frequency.
> 
> This patch also fixes maximum frequency of Si544 C. Which should
> be 325MHz according to datasheet.
> 
> Signed-off-by: Pavel Löbl <pavel@loebl.cz>

Reviewed-by: Brian Masney <bmasney@redhat.com>

