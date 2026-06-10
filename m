Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38A232D43C
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114298; cv=none; b=UrECD3ocv9+B7pUqkm6dT6AHELUc1sTXTLOkxIusp5NrKaO26ab680/ooucx86ZURNSsAT6zZxl0acZZkrs9S9t/Xf7PzCmFCxhB1B3GQS5D/XFFvCGnVwqINvEDo1U812TWMxidEWSeHG2ZmCua5Vv5nlSe34KZ3Z52iWozQvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114298; c=relaxed/simple;
	bh=DiEo+/bq8ErrnBnt4nPE9U123/wIPQRXBvgM8yxpiRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHY9MANhCuydHl90swsuvqKE93jxO4Rj5q/RbSzMenP8VNMPgiRGIMPi38T8aJ4ikvqAimEiusy2vUbVZR418hk3bmk27HOEdj7tdDYxvxfD0sb1oiMyaEyAV6eSlX1EHBe1DgY02BvTKBz7PTx6tz2Cnhi3JcPy6eo6tLwQEc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GjY5cGN7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GjY5cGN7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so78797295e9.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781114295; x=1781719095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3avyTluAk283iBEga6wGPVoycf0Awj4BxU+6wyL2mC0=;
        b=GjY5cGN7ou2yfRyQ41eAQ7Z7N03FLBFMGgEAy+DhN0ouFqI/A6gT4khKZmQVmKUtIL
         DV5VoqyIrO4MEBC7Aq8suZgNzPbchhj1ufR5/uebsFcQqwPNQYE5dqDBAkENzfZTkDwE
         YflnOwzRSdt4TjbK9hVN292GCNwbDZ05tqZzlxwEcRzjEcahJ71b27x7oLaRiAAum+H1
         4P8uQSyfbcy1TCePpTMm5JI+z0Aq+Y0MJuwSaWaUU/+NpyBzE4yOvlk7IEQca6cjoXgG
         fDVVrok86/SYgRcUIWzxYDXc1HtzwrxgBwBgiy56e/hMayAPkN6i6JHYswFtdSsBwN9f
         eTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114295; x=1781719095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3avyTluAk283iBEga6wGPVoycf0Awj4BxU+6wyL2mC0=;
        b=hUt8hP+hUQaJUAAMZZ6c7P0Rr5lzJXTZASR3M/qsmoSB3i8nX3VLGZuSu8iYt/uP4k
         HgjOKdfQAyPCglspW23kU9z35Q5qlct/jlP0STlIw7hRSirDwY3qH/3yO1rWSVLF/zsO
         8tWXcHkhyDMRH5k+b7RQuWrb99YbRzhPzW9YbyTebtvJU3E2MFZV7avyKVgW2HAknmbg
         nOGk83L9YLqXngGMvC7vgZdYbpavg5R0E2LcmLENZgShqQ6fPTf1VdhDkLzTPSz1Q2U9
         Mpsx4vNH+RhVbZKK0QKTFqYZ3vZ+sjLUNjQxNPXaKrRsBIWbX7gyWFRsMLknORRXQsuO
         /xMw==
X-Forwarded-Encrypted: i=1; AFNElJ8y35OZXzVYXABxTbwbgQK6XxeC6PWIPK+W2mXriCUoz24c3hltczYe0Q92mydnz8PYqJ9rOFaVtD8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx37Ald9KNn8BnoDLWN2mlYItRat4HVYPgPBwnz+X2MXKsGu0tx
	FIxyVf10Jt4uvGOJ/OJv7ROBTr8vdT9wFT178AZ5mF6vcJwXYsG29U83+8Nvj6lJhvI=
X-Gm-Gg: Acq92OGuPvwTt+vCkVVeMVF4OZ0BcPMS8+ai+VElOvmk3vEQKiuPzeCIAWsU5olfCIB
	UBo8g4r9OzfYgoOMBAuV1yNy5dxgcIfFO5+2GBgrRq8blO4UWhNauGWLtBP4AcwUsdk7s5dgSGK
	3I6tb/vE9dKD9V+s6/osYE48qhiUvhI7vDO+KHuWtat7ajelP4CJlTAXzZs3PdGj4VMTvYRBDe6
	NwyalzjW7ZVd2c0O2K6owgXzEoM0zXYFdLhZOnp1voblwG6/5yJmENCSPKV6VZBEiWJBowRYWtZ
	d/37kyrioMCXP9Jk9JbOOapZQ7IFIbeALZODIVoLet+yOUqRJY62PZ6HANGQtDVcwQegT8QLgBP
	tHR3g+IseHMSaF5vR3NxooMqOQQ1er5Lpl5fCBV6ZjffB2kVq03UDDsrCOzicc2Gk92rFQ9QIWs
	xzFlVgHbs1CRs6X8lMJBLrod51Q1yQAbkhRd2JO0J/Uhhs
X-Received: by 2002:a05:600c:1d2a:b0:490:bbc1:d508 with SMTP id 5b1f17b1804b1-490c258f3femr428587595e9.1.1781114295096;
        Wed, 10 Jun 2026 10:58:15 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:f160:c480:bee:c914])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc471b6dsm63912895e9.0.2026.06.10.10.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:58:14 -0700 (PDT)
Date: Wed, 10 Jun 2026 19:58:10 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
Message-ID: <aimlsgJssczxBGhQ@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
 <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>

On Wed, Jun 10, 2026 at 10:43:12PM +0530, Taniya Das wrote:
> On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
> > The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
> > match nowadays is gcc-msm8909. Looking at the differences between
> > gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
> > definitions for the BIMC PLL.
> > 
> > It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
> > MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
> > used for GPLL2.
> 
> BIMC PLL is never controlled from High Level OS (APSS). These are
> controlled by other subsystems and voting should be via the ICC for BW
> requirements.
> 

The driver doesn't really control the BIMC PLL here, the PLL is defined
with fixed/shared/read-only ops so it mostly just exists to model the
clock tree properly and have the clock rate readable for the PLL itself
and any downstream consumers.

There are multiple drivers that do it like this (e.g. gcc-msm8916,
gcc-msm8939), is there a reason why we should drop this?

Thanks,
Stephan
