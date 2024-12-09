Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E9E21481E
	for <linux-clk@vger.kernel.org>; Mon,  9 Dec 2024 09:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733735529; cv=none; b=CzyYeb4S1siwX/wwWqlgapeWrtVFeXJ8eYd7DhysQBTDB+zDtZAfLqNQWNv1AYbtUWeD8mj7KxRQXQB3smWEGCo/4l8SK/rME24WBSaXNYraSOBdO27Krg5ry+gYtbaHoj6gARyQX8T8eUU/d26rUxXudnaUIZzlthYKzfqwnho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733735529; c=relaxed/simple;
	bh=h3U0EZ1mrb3gqJxM/laxxDr92i5qpfvAUQ7Frf2u+Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgqgX/3kghktOk43A1wtFTwO2F6SK2NpPsZ6Fueapp/Iigs5sFqhGstJNz6i4vDUOJprovVTY9xeKnajwxW7vnt64tiIHZpUYG+4YY2zuUWYWrTkD0y2vxBI4qzeeTloQHN3jDwz88YO9xiHnH+WWRRzGTIF6NmssfSRMATzXjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zICO4v8+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zICO4v8+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434f094c636so7957635e9.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Dec 2024 01:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733735526; x=1734340326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eHbMlbgWO3bzBNNeHS2sHD9CC6+WaWdJ9GK1c1w2/jU=;
        b=zICO4v8+sl+XTdx7l2Ej0inS29aJcL4pngShGuPwmGkkRPb5Gun2AZXdGi2tAF33gp
         QrBP9uQAG8a49BqFUKG5Ep+dBvffRdCA4d8BXmjSkM78+vd6LsFVoRf21cVJwILsOA58
         xmTFDfBcbB2zCKEWeBl6MyJoy4eg1rIeH0/6aeMGnkPsiddkODlkEdVOLS4Uz0Qm5SVG
         c/zju4stNovoZBbl2HKimfg0Fb+OieVsR/nuvkJcK+7kwfJkLEpSS1JQgFqN0wyJ+mWz
         GONHKGYB4h3Q0cfqSa/lWvTEuIqucqewRX1b4NYx6cxeQz+D0+pmRk451YXpXkDJJAJw
         beBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733735526; x=1734340326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHbMlbgWO3bzBNNeHS2sHD9CC6+WaWdJ9GK1c1w2/jU=;
        b=qEMH7wRO22hXzqXfV119NNFqNVk8wQCVNZLMf7HZHTtQSNV2KilrLSTjPtx9nvTxcW
         eYKxb4An2xOBoLdff6YAbdy1oEolbsOzEc5c66ZbniIHsqVHjrGRfl42Cz6pdARgioY+
         OYBUTO9evD1q9t5FD3HIRJGj72kGMatmx1gyOXJ1NABKcxG9CLikawi99hVL1YGR77+P
         65eO4ogWPQqqyKbVZEhBYv/DR+nG3D0wv3qN32IGogO58VqvOJBM5G6PtfZKOhVNojD+
         h/Y7ETOescjowtIaHH5xWFnQ3R6oBWk9mEuyKNEM8kG/4N6ZyVXqqmAKCLtSnf4jCSba
         z/nw==
X-Forwarded-Encrypted: i=1; AJvYcCUgb9lXoWJtkfmQmu/xbmabhT5BSwwUJY/Op6EixK4ZiJcIghXX7vq8lBfAL7wEfVZHPAKq29QEXuY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8nJpBTyQ4H945FG5OlRsuQXITEZd2gzYzJvs8q7lb4W42B7Ok
	VTlfeFTuY2T1Dxset3hybpF1GCo7U7qYSkpPqCj2+RLWdS/mzXWCSpj6k0Z+wwy7Cw7kDwR52ao
	W
X-Gm-Gg: ASbGnctMRJNiT0cKFm/rFEYqQxQYqpMDbk5yOUM9KugUM1KFXbwwePbiKisGJZJyjXS
	04AN1iujCnlhlcGSrrtyBGQXFuWfcFpBNrpzQ0SzCvvgWSefVwaWFYaQpcxHy01p8QBP7Mm6x8w
	T9ZjSP45jUst/BkXvD4GZyaLYG9ysYxuclPeGBA46Ct+XhUB5YNnVFwPWuPig3a7rPYcCNdOQcC
	PJ+HtmbXSy1iNf2HOjzRJCSQ0MY8vo3sQlmwwGNKZDNLjjuEai1HXw=
X-Google-Smtp-Source: AGHT+IHhPb22PMaOGlccXXjnxqHxj7jC1Q4B6r+s69ZPmdovPN8G0ra4/yZH2uddmSFXwQMRXgGvAw==
X-Received: by 2002:a05:6000:470a:b0:385:dfab:1643 with SMTP id ffacd0b85a97d-3862b378d0emr7400128f8f.27.1733735526245;
        Mon, 09 Dec 2024 01:12:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf4045sm12708923f8f.8.2024.12.09.01.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 01:12:05 -0800 (PST)
Date: Mon, 9 Dec 2024 12:12:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: round rate bisecting in
 discrete rates
Message-ID: <e75495ca-7cc4-48eb-ba27-607de6951181@stanley.mountain>
References: <20241203173908.3148794-1-etienne.carriere@foss.st.com>
 <20241203173908.3148794-3-etienne.carriere@foss.st.com>
 <7fe840af-d56d-4cb6-8d82-d42631409b2a@stanley.mountain>
 <4c39a5a437fa42d483d1f704ec7ab4ac@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c39a5a437fa42d483d1f704ec7ab4ac@foss.st.com>

On Mon, Dec 09, 2024 at 08:16:24AM +0000, Etienne CARRIERE - foss wrote:
> Hello Dan,
> 
> Thanks for looking at this change.
> 
> On Friday, December 6, 2024, Dan Carpenter wrote:
> > 
> > On Tue, Dec 03, 2024 at 06:39:08PM +0100, Etienne Carriere wrote:
> > > diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> > > index 09ccd6cea7f2..7bbb2ee55f4f 100644
> > > --- a/drivers/clk/clk-scmi.c
> > > +++ b/drivers/clk/clk-scmi.c
> > > @@ -61,13 +61,20 @@ static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > >       struct scmi_clk *clk = to_scmi_clk(hw);
> > >
> > >       /*
> > > -      * We can't figure out what rate it will be, so just return the
> > > +      * In case we can't figure out what rate it will be when the clock
> > > +      * describes a list of discrete rates, then just return the
> > >        * rate back to the caller. scmi_clk_recalc_rate() will be called
> > >        * after the rate is set and we'll know what rate the clock is
> > >        * running at then.
> > >        */
> > > -     if (clk->info->rate_discrete)
> > > +     if (clk->info->rate_discrete) {
> > > +             ftmp = rate;
> > 
> > No need for this assignment.
> 
> It is needed. The round_rate handler in scmi clock protocol driver 
> I added in drivers/firmware/arm_scmi/clock.c expects the argument
> to carry the target rate as input value and provide the closest reachable
> rate as output value, hence initializing @ftmp above. I needed to preserve
> the value @rate since used if this round_rate handle is not available
> or returns with an error.
> 
> Note that I could have changed scmi_proto_clk_ops->round_rate() 
> function ABI to split input target rate and output rounded rate into
> 2 separated explicit arguments.

No, no.  Leave it.  Sorry.  I wasn't paying attention.

regards,
dan carpenter

