Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6D73054F8
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 15:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758728032; cv=none; b=J1I2B2YjihtFmZezQDHKkL5xGVeuAaF77u4UpVip9ik5CMcMXLE2jlYbUY9NlF7cBPX2Ax1ZYfkAgnduGOD6Tr+cDq1i9Aa6eQy/h5y8sk4O3ZQxRknWF+SVUGjmOZNrxYwiLb3VhTKa44rgO2+iqbybyd70PVeRUfdMwt1HfeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758728032; c=relaxed/simple;
	bh=wRch98PTr07OsPbOEWFR6ZR70W6lFXly25dnPdzBGHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUZR8YMikT7DrgFyT1TSZ1DpjnOryGb9LFcOgILj+Qpae0MbZ4PJtjv+1ddVuupjtyjcIZRnii2NRaL+fJg8OuzHZrFddMnrchHHv+dx4TQL+w5Kxdcor1ZgcnkL0Vi0O+OzIaXXLMgfAodNtfcsiV5AxAEFuY7UkPfUukUljMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FrVbhAZj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FrVbhAZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758728030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ic7zvcyBVtaZcEmsf3hW05wAfmOMNZ5JL2VpkYQoXsc=;
	b=FrVbhAZjnj+3afecM9iyrE8dm4m7eM3bO9kNMWMYSajELoQ3LWp+5t/KXwf0DRetEtgIYJ
	9tvyr63oCjkhBxIpB7FEQtNngbjeciwlUJtVZXsW0/6ERUDfM5c3Mh7rIcDIR9VY98+h3q
	XauT2v1//eTopNsr1NuRTAn9tnroQxk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-1ax7o87HPTaAiv_4ld_NSw-1; Wed, 24 Sep 2025 11:33:48 -0400
X-MC-Unique: 1ax7o87HPTaAiv_4ld_NSw-1
X-Mimecast-MFC-AGG-ID: 1ax7o87HPTaAiv_4ld_NSw_1758728028
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-856d34460a3so2805785a.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 08:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758728028; x=1759332828;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ic7zvcyBVtaZcEmsf3hW05wAfmOMNZ5JL2VpkYQoXsc=;
        b=WEWXijE0NCrPHifyKNqB7MPU+B8xvyJi3KbTsjImhV6AOUfPZdMzNJlYea3ARaHoFA
         Hi6/1drAkopgcDWvFX8+gQQ97OSzkzGUmZuucaVr6B4iJLctzciKc31P+ehyp3Abzq5l
         5UkvVfle1vrgBL6A0d6rlqGdtUb8hh4M2RvHwlesij58l8EJg6++1oMmauMnM1VdxgtS
         qJp/P9ByKzhA8C7ZrR2Cq8raUk0TMOUTRczTcqC2U1gZi8x6gF3v6X3KmyqNpl7EqDZT
         +l5se8PiOOueC9thsuzUREO9gb8enF8/9NQF4/rZv59pT91qHzo1OcNOJ896dysjv2ei
         jhCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuFWwrHb5BSC3BxBx87/uLonsoe3n93JMzjFeXkyNIXxhZ1q9iDB3QTa+S7geAm0Z6KWl7HwQJvGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhQg4JIL+KiSNBVc2Bru0ltP94naOcszv2vUdCyfSOxh3kYGGf
	wsdlJjNJhUS6CjavMoMc/j+6cIOdWWuacBq8zapr+gLlGcN+wICwqY3fzzBi3OcHmvX6COuDeWU
	3pADodJ0QFsd9SPQvHhz01xotB+n4fGbHyEf0mL2RHEFAOttyybYhPSWfJcfl5Q==
X-Gm-Gg: ASbGncsfZfGPJCJorb07l2xWWu6WJtMkof+pp2bAuVzTYCxnaJzy8670N7VgydjuvsF
	MS6gNxrGLdOwDQwaRencOEuq/R6AseQD59lCvQu2BSKlkSv7PD74NCdO3xAF2lzYWgZ0fQ4pqz3
	e83Vhy4uOafmP4iY4LwH1v+dTdHA2C7I+nuRXMMo2gDFTGPwqRHt1DPRkRDSDNhykMH40llmiWk
	Q+xkeHeiepPbxMBlbid6H3BjsuW/n4EHao1gPSTiubsbrQ2M9j4w35G4FxR5ei7pBEjOrrdbu05
	jAiaLDNtJI3zzymHQhefhzndmuPWKiPEvnktnKGTNYj9aUaNXy0wkVTjGMJSOOql3wF5xw==
X-Received: by 2002:a05:620a:1a89:b0:828:1529:d028 with SMTP id af79cd13be357-85ae7cd4ac1mr7327085a.61.1758728028088;
        Wed, 24 Sep 2025 08:33:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7m0/cbnvCoTKElfyKlC9Akk8QQ848roxwkCAlIQudXokrBobnZdaunrFKeYAlTGXQPxdHhg==
X-Received: by 2002:a05:620a:1a89:b0:828:1529:d028 with SMTP id af79cd13be357-85ae7cd4ac1mr7322385a.61.1758728027583;
        Wed, 24 Sep 2025 08:33:47 -0700 (PDT)
Received: from redhat.com ([2600:382:8504:5608:ca95:838:d4f0:316f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8363198b0fbsm1167921585a.50.2025.09.24.08.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:33:46 -0700 (PDT)
Date: Wed, 24 Sep 2025 11:33:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 0/5] clk: Support spread spectrum and use it in
 clk-scmi
Message-ID: <aNQPWO6pfA_3mmxf@redhat.com>
References: <20250915-clk-ssc-version1-v4-0-5a2cee2f0351@nxp.com>
 <PAXPR04MB8459265997E9822F17AD2BC0881CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459265997E9822F17AD2BC0881CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Sep 24, 2025 at 02:44:21PM +0000, Peng Fan wrote:
> Hi Stephen,
> 
> > Subject: [PATCH v4 0/5] clk: Support spread spectrum and use it in clk-
> > scmi
> 
> Since clk-scmi.c for spread spectrum support needs some big changes,
> we may need to change scmi framework to make OEM extension
> in an elegant way. This will needs some time.
> 
> To patch 1-4, do you think is it ok to be in linux tree without patch 5?
> If yes, I will post V5 soon with your comments in patch 2 addressed.
> Otherwise I have to carry patch 1-4 in future clk-scmi patches.

This adds a new API, and there wouldn't be any users of it at this
point. Personally, I think it should probably wait and be merged as
one series. Unless there's another vendor that's ready to use this.

Brian

