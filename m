Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C7040E8C2
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099775; cv=none; b=c6PLLr8qTq8U4+R1ZHrTUE+RYwD2EXQKfh4rT38cPkCufGaLQNf3cDhyBsMUfERQ0O1dxdrLacSNHIROyWTwab2w2IsKphUQTOL/bzwKx0g67zisSwV5BqWFb5loUDMVdMbIs8+ct0raf9F4Gn6bNt2lQo0Z8bXSQH/LcwlJg74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099775; c=relaxed/simple;
	bh=vce+NqjQ7OjaFBCXPFO1vr5ngJPOjbpOuZAOPi0vtGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcH3BXzvLrDClGBwxEA9b0SQh4rm88a45TpGB8HBttoPTfNEnfoDFcZamQbhGRsxV0W4xblM+Kp6EXqVsIzWV8Tkd7+t2Gi6MYGSPgzS+oLkubLG3lQ9RwHJJG1GRT2hgAsbkgFfFhTpztv1rqI20fpjAu0Fd6D0CEDYLdc2Fig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IDf90Vp0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IDf90Vp0"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so5308922f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781099773; x=1781704573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6x/S1LXWAlJufNMKimrj1YiILxNLEh0GgAmijqMitjY=;
        b=IDf90Vp08ivu0qRkijHQYXx6AE4dMuLY3EEGc4KYjfAisGUGyYGViF2AMKKrVtT5aL
         AB93YZBwJo9h41L7aGFbude9ZUQOqbkcaHCp4qlQxSqlWxDJXS9BJnT31CecXdPQtfMG
         dRP9aYkKDAgaJYYr0nD6F/il8qPzkvdQM785K1UWsmV/1z12ADMK/snw0wD6DIEYsAr1
         L/A4lmhxauH74r+5Po8C/dvl7QRtWm998q3TejijL06KGur7uRu6y9Yh1UDv610UFs0w
         WNyhxS1AyB0VkaHDsPtALTDCjuZPbHfXENq1JT2vD9o+slBzQRJZEKp+DXWkXwCGdN5M
         yhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099773; x=1781704573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6x/S1LXWAlJufNMKimrj1YiILxNLEh0GgAmijqMitjY=;
        b=sIvnZpb8nPJDNsbiQ58IoQpU9Ad92EBH0rduextlM12ewexNs2o3cRFacXOhN+p60h
         +V2Dcs2zgzyQi/MZukFE9KAXJ8IvKCgSrWIK2PPxsM36J/8M1ly4BQDqHttK4Litj2NM
         sAAlb7eUGGvf8JwsE8uOGJ1GuA+oXHopqvdbghv7hivZqVNaJdqXJdxmzhnjSAHq8t8y
         XhxV7kcAtim/UwebrltKN/+dr0q1vK6PWqi42oiEJ+q0dM+BoqvCOway8lVdliUqxgvM
         admSYLrfy8+0ig61jhNcK2y0IMvYev3AuzU/C292Df0HOU+VzacXQarlEF2WSF7rLdok
         aZjA==
X-Forwarded-Encrypted: i=1; AFNElJ84DbU2M83w8DhKGLojLYczo0HPj3A42NJ7AKgm8K/kbTMBJRbqKQNr40hLNvlYBGi857DiNoBWWJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9AI8Th1rvRBNWRoOyl6Xor+aCiugFRg6MWiI4k8nle1zO6UdI
	XCPhbaWbcuN3t5gBSuJ8nWyVcMfE3umAdNLFEgPQCnD2IPwL7kT99wMCMIZo+n93rnU=
X-Gm-Gg: Acq92OGdnJy8vRfLswK8BRItZeW2rJxJkcaxFv3QJv4zx8t7a9ry8k9BezW5q40T+3d
	QDa1SvBYCx8AItbJA5E9D8yT7lSQHbv5mAhEfEc38hfISr2gLRRQas0oyuDgABlztsiAN7b9zTQ
	qAeZtSZzDkdrWi/uHDo5kZgVqpyCPy6BSfJJd7cd8WW072SVqmZR9cGB5NdhtPF4RXg5JeQ2x8h
	TiqvFH6Vs1/CEtr6lF4/I7G0VS5/Ds2fmjGFXK+SD9V6b6ZzRyP5yBlappYJH/1feSOs4cWOwOp
	G50r5UDa1QcsIcZcpI2mpo9yX5tAZoLpGqRqC6pGbx4TVLqTdCyO7u/SesuwUNkNsTYD/HbUSGe
	TF76KXvfF2axQ626c7kKe3c5StsQSpHbN06WTfRREgoHDYvVPKfbejzwYKWKeC7pLO5LnA1s+62
	tQQYsVR4EHrvMbkJBJW9+fMNxDsCXNBTpzEpSAPwSzrhCAeS71lDStbfmwDA==
X-Received: by 2002:a05:600c:c491:b0:490:b9d3:a9ce with SMTP id 5b1f17b1804b1-490c2606a1fmr426581085e9.30.1781099772623;
        Wed, 10 Jun 2026 06:56:12 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:7c57:ff85:2733:9342])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413541sm606240735e9.14.2026.06.10.06.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:56:12 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:56:08 +0200
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
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
Message-ID: <ails-CZAOrq_wWBm@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
 <69cc948f-bb4f-49e7-b050-9e3805aef758@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69cc948f-bb4f-49e7-b050-9e3805aef758@oss.qualcomm.com>

On Wed, Jun 10, 2026 at 03:46:00PM +0200, Konrad Dybcio wrote:
> On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> > From: Stephan Gerhold <stephan@gerhold.net>
> > 
> > The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
> > match nowadays is gcc-msm8909. Looking at the differences between
> > gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
> > definitions for the BIMC PLL.
> > 
> > It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
> > MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
> > used for GPLL2.
> > 
> > Replace the definitions of the BIMC PLL in gcc-mdm9607 with the ones from
> > gcc-msm8909 to make sure we read the PLL status correctly and don't make
> > accidental incorrect changes to the PLL configuration. With this change,
> > the rate of the BIMC PLL (600.6 MHz) is displayed correctly in debugfs.
> > 
> > The clock naming typically used for Alpha PLLs differs from the older vote
> > PLLs. There is no device tree upstream for MDM9607 yet, so we can still
> > safely change the dt-bindings. Nevertheless, by keeping the old ID values
> > and swapping the two entries we can preserve ABI compatibility for compiled
> > DTBs. Previously, BIMC_PLL_VOTE (71) was the final PLL clock to reference
> > when needed, this is now just BIMC_PLL. The previous parent BIMC_PLL (70)
> > is now the parent BIMC_PLL_EARLY clock.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> 
> I think we may be better off removing the NoC PLLs and defer controlling
> them to RPM, on all platforms that define them..
> 

Well, this is not controlling them, it just allows reading them. And
that works pretty well, so I'm not sure why we would need to remove that
on platforms where it works?

Thanks,
Stephan
