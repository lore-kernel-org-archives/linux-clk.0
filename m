Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FF940629E
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100573; cv=none; b=B1P8KUmlvY9YKiuwxX8HrmyhYy1WDnGZMhEPQzmbF29cJukKVv39QLdy09xPpADbkr/v1lkfYh9yx2i//+rSN6NDEbV2JcNo6GVLaMMTQjai79Kzv9I/gt8viUnp+uU2FJc8IxWgCS4dIJ2d5FX6o8umWypenMM6Z2bk5fu8Q3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100573; c=relaxed/simple;
	bh=xOBnAKbfMwDSEwiOfNlKTQ/sIOMtTg3T6ON0DZHh4gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4Djj/ZYEgI7SDbkqNTDnI/tHbW6JuSZd9muhIut4cyOX9Kq/mCJWTNNkEbyAdPSqUHQBP4wyq+m5AHDpbwmjboarS7GxkXyb/ri4dU5PaFEHksIkZCJjxecUXbDkMJGpq3sSijY28zNUUSNP5JYA+HzBgNRStaX3Aa1CDsqv34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0LL6f+u; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N0LL6f+u"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so3420400f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 07:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781100570; x=1781705370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Yp7dQIH3qFqTFCTwClldJqvJ4eJdBAvpo4TLN8Qmpc=;
        b=N0LL6f+uTVBdblveTqDHTS79wedP5+/lItTb5xiZmk11jHcWHRP0qYD7PTINm6tfrP
         sWcUsVITDTYAG2HLwO0cM16/KVaXPtGa6IcDvQq7FKmQczuWXbwGKo1UnJ4+VbYOZci9
         8IHDBDqrLzLUxh1UXLsvXtwM7GMxwj30OnAOUNFDy5nqS/0SA65VjbCgkCS3RxR1mxnd
         P6WpfwyME7QQo+niO5/H2jBNkwIeIm3W4Q40dV9/zdTBUnT/JJPlhPs8hDFE9hIclAEd
         WpNvFp1lrmvrYOOsEJpiZQpy/+9DFz2iXJ2kgaanNCk4Rc/zaH8mmXfGGPBFO92VXSi0
         9I2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100570; x=1781705370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Yp7dQIH3qFqTFCTwClldJqvJ4eJdBAvpo4TLN8Qmpc=;
        b=QCWnAR74MVZ93kgQ5d64Xhm0a/RJ9NU42t6tqO/RLqHL+D52nLm5A4gsz7fDbBgN8o
         RjfKxVNRfVuN8i/KLklymqDl5qeNPlFzBBKBIJPhH/cWet9JGxXd4lIoRF36Y07vF3ST
         V9ZfT/45xSN8Hl1FKMigFqGin3lcgxKdQCKaiGZRmTyuxgtimCcOGU2ZtPFcgNvDKh+9
         P/exzgCutbkwgSS2qYPgpxE73f/rH8yAR0rxMPWAYUVeeGnhEaX3sjzc6HJ5zVHYp8tO
         gNFuYAvBDiZdgTcQW9NcMkb3q8yz4cVznNsg3JNiEJ6lKAfH98jXQTxkFuxhfTPKyd9i
         ZqHw==
X-Forwarded-Encrypted: i=1; AFNElJ+2hxajVfpd7meEJzeKpBsZrNWVzTZtak+Dndgv1I6XomTSmOx2pKVfz39j1QHy9g+0nafyBMIBCB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YybJjxvG6PHksVDBk25rWs1aha57zKpkPJtY0nNtmueHW+KC9Hx
	wnOSZM1XeQ0GSbRjTlSP2M3UEerFAjdq1lubnKACncxxZ+gyk1E2iwBcYroM6RXFgAo=
X-Gm-Gg: Acq92OH9TdgEwouwo1dTK8iSvlOX7cm4Hg44DCiSSOWIuhfl7ZvNrtMHSozrRXVAgEY
	+J2+d6I+ovPqyWgtsQyAKfb5C2Q4RnsNYHrmesTqwa41SLRnSkoTtsoxA8ScQG0ouVjGZ97Lltn
	aqnOlLcRUtEiJ5mzb7OgQp88h0T+QeiBMbaZ+ugUMIOa0sv9BIOCbji+VvtoiY9i+5fODBk1nv6
	8Ex8QwA2LR7hFwfmxsJ6ZxVotp9KnQTq5jPs2sx/vC97XNAn84WpdjJd6T8QaKKsO7vhGPEKAoV
	DKRrpB5yQ03s3kk8fEOpCU6ztvvi4RoKzAXinbEyJNr4dSJeRgwo2jTfHt9ysa5LOEDTkWWvsJq
	LeUmhW3EXVb5OfT2CfN9Hnb77ZvnFN69Nzp6F8Lg0EWBR4MHE+tjJ49tTlqUITM0Ci07E+wr5in
	7pWqCEvt+zsUguPMSPrWDBvsfBr6ss8caW+NYs9Efyj+ure3I=
X-Received: by 2002:a05:600c:4e14:b0:490:4e3e:b483 with SMTP id 5b1f17b1804b1-490c2600ebdmr362021485e9.22.1781100570315;
        Wed, 10 Jun 2026 07:09:30 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:7c57:ff85:2733:9342])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc0f8sm559839415e9.8.2026.06.10.07.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:09:29 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:09:24 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 07/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
Message-ID: <ailwFPgY13_7dZ-C@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
 <f55526ad-ecd2-47b2-8b8f-5aec429bc1c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f55526ad-ecd2-47b2-8b8f-5aec429bc1c0@oss.qualcomm.com>

On Wed, Jun 10, 2026 at 03:50:11PM +0200, Konrad Dybcio wrote:
> On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> > From: Stephan Gerhold <stephan@gerhold.net>
> > 
> > This clock does not seem to exist on MDM9607. Reading/writing the registers
> > always results in 0 or crashes. The math in the frequency table is also
> > broken. GPLL2 on MDM9607 runs at 480 MHz, so:
> > 
> >  - F(155000000, P_GPLL2, 6, 0, 0), // 480 MHz/6 = 80 MHz, not 155 MHz
> >  - F(310000000, P_GPLL2, 3, 0, 0), // 480 MHz/3 = 160 MHz, not 310 MHz
> > 
> > Presumably, this definition was mistakenly copied as-is from gcc-msm8916
> > (which uses 930 MHz for GPLL2). There are no branch consumers of this root
> > clock inside gcc-mdm9607 (notably, gcc_apss_tcu_clk has bimc_ddr_clk_src as
> > parent instead of this clock), so we can just drop it.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> 
> It does, CMD_RCGR @ 0x37000
> 
> Interestingly, there's also an SMMU instance.. although downstream doesn't
> seem bothered with it
> 

Thanks for checking, but that still doesn't give us enough to work with
it. In particular:

 - What are the frequency tables? Which parents exist with which IDs?
 - What is the hid_width?
 - Where do we hook it up to some children?

The way it is right now it's definitely wrong. I don't think we'll need
it so removing it like this patch is probably the easiest thing to do...

Thanks,
Stephan

PS: This platform has the weird TZ-managed SMMU (like MSM8916), so there
isn't much you can do with it from Linux. Unless you are running TF-A,
then you can describe it as "arm,mmu-500" and use it for everything
pretty much exactly like you would normally expect. But you still don't
need to do anything with this clock.

