Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B4522097
	for <linux-clk@vger.kernel.org>; Thu, 26 Dec 2024 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735224064; cv=none; b=qZa0v47j3l6BczpLjnrOz8EKuujNGXuy+EagTDHFsie/Ozej4UNgJH5rf/be2oO+zRwAZx9C17BcXo04x2PJGPEpdLn2W1f7M/KMRwO6nv6ztK5iVeAhV4l+QvNUHay5vlT3ME+J1rhFpxhOa7erC+bec62PzRXS1unApnANlt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735224064; c=relaxed/simple;
	bh=CDJo8kESXFKCvYAWUmatdZJVWIm0WawwcEFXIhXwWVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6rNwRZUp3oRCrViJwHyNyoGKUATfY6NWmV/NnQsVGEb+9i7GPyYEjiHpyB886a2PQX5Dp9gk5vPxDcyBFBNYt7hYFrB34uqWXK3QScc8Ddy9cBMTaFQL73IwtYEdM4OdyOoMW57c1XaCkjxFo/4CZFHib3gHbeTVcFIlynoM54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fzBXx8qb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fzBXx8qb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361f796586so69044025e9.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Dec 2024 06:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735224060; x=1735828860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EaV50W72dcye3DySmDtBOo9K9oTUuHhi5CzxEbusJOc=;
        b=fzBXx8qb9iEDzxbpIzeNMsNukKzqysaWXUx7rtw/XVxewNWV3zQSAS7z21AJKXPluA
         Uoi74+umF70mlWuZ64wR+xHBVO4u4tWsjrYwaRGhE+UPiAsN3lVUlAmjBmXJIF+XZFBY
         EpX9XBubNc4ySkAPmmb73U7DJbOKDsmiXPwOY/03/NFUiocflPXjNjk67mJNl6xan/MU
         GQSQJdudCl8QwBrN/FRNwJYG3bKylp8lCogFwrklIFzkAdUCDejqXnQH6hHpP/AnU+TS
         +37TL4XVOvnUdWiJQ4/MuwT1rz+RZN0LEoiDPI804nJQbVXeiE0Iud2/kgAQUAtQWgUr
         jpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735224060; x=1735828860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaV50W72dcye3DySmDtBOo9K9oTUuHhi5CzxEbusJOc=;
        b=aTD/IDZz3iP+L97FqSX/C5dJZyzJ/DCg3qdGyC+D7C/xh4+HoCbRDq/zkkzpkM5wI3
         nVp8AtrXoZWolOjSxrrG0HFkWBp5ivPEKcz3GLvS95pJCODXyKJCg5P5BcpskGrfAeXx
         fMHfudBJnazdX5IbG1CN4CZ4olbWEzYQFCC7jmNbnEOtbh5h//kd24Dzbx+Idwl7XYdI
         rfsmzVl1bbLoGaSu25nl0M2P56WJVFXnX7DK4gy1dsVNP/cJZFO+gFi3ALlRgU60FdgU
         bzhyBYChcbNE5Qp85h3if76UP4pCU+F89nzCxu5u/m9GJ/t31etrd5Do/AcZ6OJYIzfu
         lflQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMtrkwZzvDwqrI6PNuBsMn2qdFfUAbS4U6uI5RYtM+L+XXviUJ3/XBzWOl3d3p1Qt8olWngyMJgvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxZhIfe7PDC4Kn9hfE595vhq1P21vD+jHzh1W5QU3iMAaottRh
	g6ZDknl2/cKJL8FSlFeLN6SLfZha/wS1fvvY1RFYDmW/BOhfql//e/63MTrxK8c=
X-Gm-Gg: ASbGnctTlIVRwYRat3Jv8DynQXo6tIK3S5VNo/IWf4nCU+kaXPk7p0F1RvOJMFjenqp
	UJZg7pgjpsU9w0R0YWlbhVbDs0ZYGFWOnekt7SJ9F6sTqwkFnAwaILKRBqKezGV8nCe9E+DSKc8
	gtyzTBRxJObso3dWZY1DZRlPlLUvEeo1ACJjn87wk2pv/HW0MQ4yCqCpmBhmesqPFHmE7p5mzPQ
	kNeFxNx4SUaBwLB/i4N2PFlXjvUr5Lrs1p3J+EPhZHDXoa0wvaKjAA=
X-Google-Smtp-Source: AGHT+IFAkeYRxenuSnMh5whe4fj3qf2FXC2/YY8gmQiLBoDE4x9299sSrv8G4XcwveZUu2qAO5Z/wA==
X-Received: by 2002:a05:600c:1c95:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-4366835c1b0mr210961505e9.3.1735224060629;
        Thu, 26 Dec 2024 06:41:00 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4bbsm233695145e9.32.2024.12.26.06.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 06:41:00 -0800 (PST)
Date: Thu, 26 Dec 2024 16:40:57 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: abelvesa@kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
	peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev, shengjiu.wang@gmail.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as
 SPDIF IPG clock
Message-ID: <Z21q+Xyz7bQjN+yJ@linaro.org>
References: <20241119015805.3840606-1-shengjiu.wang@nxp.com>
 <20241119015805.3840606-4-shengjiu.wang@nxp.com>
 <Z1bkixjbyFhH3ZgL@dragon>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1bkixjbyFhH3ZgL@dragon>

On 24-12-09 20:37:31, Shawn Guo wrote:
> On Tue, Nov 19, 2024 at 09:58:05AM +0800, Shengjiu Wang wrote:
> > IMX93_CLK_BUS_WAKEUP is not accurate IPG clock, which
> > missed the clock gate part.
> > 
> > IMX93_CLK_SPDIF_IPG is the correct clock.
> > 
> > Fixes: 1c4a4f7362fd ("arm64: dts: imx93: Add audio device nodes")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> Hi Abel,
> 

Hi Shawn,

> I guess it would be the best for you to apply the whole series through
> clock tree?  In that case:

Sure, will take this whole series through my tree.

> 
> Acked-by: Shawn Guo <shawnguo@kernel.org>
> 

Thanks,
Abel

> Thanks,
> Shawn
> 
> > ---
> >  arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > index 688488de8cd2..56766fdb0b1e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > @@ -925,7 +925,7 @@ xcvr: xcvr@42680000 {
> >  				reg-names = "ram", "regs", "rxfifo", "txfifo";
> >  				interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
> >  					     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
> > -				clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
> > +				clocks = <&clk IMX93_CLK_SPDIF_IPG>,
> >  					 <&clk IMX93_CLK_SPDIF_GATE>,
> >  					 <&clk IMX93_CLK_DUMMY>,
> >  					 <&clk IMX93_CLK_AUD_XCVR_GATE>;
> > -- 
> > 2.34.1
> > 
> 
