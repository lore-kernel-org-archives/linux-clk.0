Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3C12E62A1
	for <linux-clk@vger.kernel.org>; Tue,  2 Sep 2025 07:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756797126; cv=none; b=aMm4jmP10USUuzx9FD8MRpYPXINysVg/AbQoYzAJeq0WkZNyQg0bT0ei80ylLBRMUZLOA7lWxTiqJpvu3VWiZYvqSC4qpXDUJiFx8C3rSOt6vb5O7+Wp3pllKWNcWNQVzU4EjqPwmMs0LPzV4Eqfbi0oINxqqlBM/CuxtgpmFis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756797126; c=relaxed/simple;
	bh=4Dj8wHzcKZ+KE+l9JlZw2/wgZaNm5SI7Vg6vhkZUvrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzORWWlcaxnnNYDhMs2pCoruRF3SBlYfkF8cNjAiPmPyioNvX02qVBYgfos0ITLzZcND/udQeGGGuDqsIa+xm9MVQ6hsaqQNUBQqrDQLDqMmP/bWcPhmcOmz0Zsb+CKmJcUdXYJ5ObgidMLQIP3ppONEnAWXv2BUctufN8SLLBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NxPGfhMa; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NxPGfhMa"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b7d485173so31215325e9.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 00:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756797122; x=1757401922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=leRMEPgF8RUEvULChzHRAQuhgrQpyQ/k4NKGFx3/OIQ=;
        b=NxPGfhMalr0puieqZ0NjhnLO4k+g37416+742QxVCL39sCZ8MZ0jb++o2JkAxij8ZN
         vJn/GLrFHv4il+X4O+S9k0gc1m3dqqP0sPeNNzTjEIkm47mcjrtddBFWbt0r9Dl7xhtM
         n/Nt60RDPFxYA5LqefiznDa6Dwj1ALVZPuYSoeFC+Po/xGqv2pFlPxJBIAnAM1d4hNb6
         qcND8K1zagmtFFVrGGOii5GgbfTLWGMbqXAYTr3inpqcsYAWui9z0GxlN1GOzu8SK9Hi
         HqUdBxZrkWRxtoDJZRwKzQGI11wktL4skOeXqnTWj9NG88mpdOP4Xw2vAKnsK/vMicQ2
         dE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797122; x=1757401922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leRMEPgF8RUEvULChzHRAQuhgrQpyQ/k4NKGFx3/OIQ=;
        b=UBf5UwhXRgCuAD+cvsldbGUBZfxEmKS7wfleYub2YFfpLFfTg1+2KVVJ0O6XORpYP5
         I33mLd6u+FZjM5sy6msEi6M8ZOTOvBKjcbGx6ErkwccV1u8saa0mO+++NBF9vRa0J6U0
         l6IHOMWUHZt4f+AzvTIytVMBVVwwQiHGkQNJy3F04UGCGs3jR+g4f7XFruTCtj1s+FZW
         40sT6eqCC4K7cJ5T9i8dqXHqyKraSO9Vf9jyPv5QDZBHzKVFLvmjLbv/mJp4rCFAb3ut
         khTOeTmBL3TGIY7y3gU4ZrWgpNDo4/X/i58oEHjQ7qmY5qm1jx3CMW4KM5RGgaJ9hxO5
         V1sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnGBixfyibk0WHnK4yCNwivz2T0el0wGMa3rZUoTFp7/2cj1Jsj19vNsrPGvBPSqJ+2UwzXVsXWYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYK7/GBB5AT3TIeCaNwHeKlq5L5BMvtFlGww9ljnsh9YQd/xMN
	g0mdjske5FUb+HlmsUCbJh7A84iLzVegefcOKhfhHtNuO29RZ+Mu7z3kwNmXNn1Bttc=
X-Gm-Gg: ASbGnct6shbnlmh8Pw4HKROhi5EgVQj6uF8hNPbkEpu+yDaM4RsKYD9r3r6Vog2o7TL
	NoCPLNKu2Q4Uu48Dn6O7pBvBu8ZjCUbH5sL8KaLStqeGH20f9IT8l2JxClGDSL7BSXRuslLs1qu
	r+V6mtgkMJ2eDOP4zY+viWJQ9RgsBfPyO/FfaYnRYZjTdRGQxmqrwGOSxuFLsVlXyh6dYTW1tND
	YnoOdYzhPe6s/Kl0xihcnof9p9KTCSmmAxRQ0I9lvbabPFGa5Mv0xW2pu8/L3tBGI8yc6/8DrQB
	aHMdXo3z9Dc+U4KT4XocQ/sukKCD7Ycu9QsjjPXeNJgi17XIxBkJckrY0vwxuvVqu6ltuZWPMjL
	qyCMSa4F0vhH174biHPhVdiUAkJci3WaviFfiMw==
X-Google-Smtp-Source: AGHT+IFYuCWJOgHXp+J/kYURbVc6VnwzlfI13ByiraVfMdlwIoA3Pz1WV9KjlyYQt58VCk3unM9JLQ==
X-Received: by 2002:a05:600c:4f8f:b0:456:43c:dcdc with SMTP id 5b1f17b1804b1-45b8558baefmr77527515e9.33.1756797122251;
        Tue, 02 Sep 2025 00:12:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6f0c6dc1sm267152735e9.1.2025.09.02.00.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 00:12:01 -0700 (PDT)
Date: Tue, 2 Sep 2025 10:11:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mikko Perttunen <mperttunen@nvidia.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 19/19] staging: media: tegra-video: add CSI support
 for Tegra20 and Tegra30
Message-ID: <aLaYvsh1sCF7uF6Z@stanley.mountain>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-20-clamor95@gmail.com>
 <3643424.irdbgypaU6@senjougahara>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3643424.irdbgypaU6@senjougahara>

On Tue, Sep 02, 2025 at 11:38:18AM +0900, Mikko Perttunen wrote:
> > @@ -282,20 +411,27 @@ static int tegra20_vi_enable(struct tegra_vi *vi, bool on)
> >  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
> >  {
> >  	struct tegra_vi *vi = chan->vi;
> > -	struct host1x_syncpt *out_sp;
> > +	struct host1x_syncpt *out_sp, *fs_sp;
> >  
> >  	out_sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAGED);
> >  	if (!out_sp)
> > -		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\n");
> > +		return dev_err_probe(vi->dev, -ENOMEM, "failed to request mw ack syncpoint\n");
> 
> Existing issue, but dev_err_probe doesn't print anything when the error is
> -ENOMEM, since "there is already enough output". But that's not necessarily
> the case with failing syncpoint allocation. Maybe we should be using a
> different error code like EBUSY?
> 

I'm not sure I love the rule that -ENOMEM doesn't print a message.
Deleting error messages is fine because it makes the code simpler and
saves a little memory.  But with dev_err_probe() the message is still
there in the memory, we just don't print it.  Printing the error message
doesn't hurt anything.

But if we go down that road, we should make it make it a checkpatch
warning to pass a hard coded -ENOMEM to dev_err_probe().

regards,
dan carpenter
