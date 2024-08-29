Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C64516C846
	for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 06:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724914216; cv=none; b=VzmmS+06EqxFWubi1uKeOepkz6owCDj78uIotnE3FX8WYxIE6KGvpDsM7v/w7bXpXfx/ugGGqAhOHBNBxsw4/JVPT+bRk+oE7IVLtgU99E6pkQerMCcayvM6Xf5QwaIeZ84Fi/5B03l3F9PPneyuPSsYHXXw0Hto1X0MaJDIMOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724914216; c=relaxed/simple;
	bh=C774xcfWLXiYC7HVHXCktC5RtuHU3NRdVERX0aWozKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pswdIK0vwlnMeuTokY4YY0ZJdlT9Qd7qFhEEn7OpmOwIWMpMzcpu5WNdYgv/xyRpG6PLM2X4A3cGOBqj/F4wUphuOrVxHFh/701d7QaDLF6Fgr3TqNK/z2+8BtqMVcdlWORbrafIDVjXrsyKQMeL64+4D7zb2EhmpXeOrL4RI8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qefp23w9; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qefp23w9"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f4f8742138so3396031fa.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 23:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724914212; x=1725519012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iTbYTU+eEXbesQ1w5uX4PXo79wYQYLg5UgyyuYRsTM8=;
        b=Qefp23w9mBseSKX3RfSEvjF6bOdPkZmi019mI3LD64HK7lQRodhXedxKbBt8DcOzH/
         wB3JCe8f6GV5xa5dUjOSTO4t+CJsJDjDtyiulIMKzEdOwNXBxaU40NlTbXKLlVYyijOf
         3GUW22aLoADXxzCrZsu+Nk8OYlnITH+J7GAhDaN7j3R2YFQGVRJUjwqDEHPzWIkUCLRs
         z8twE+qu1SZjuLMb89MOYkEPAwvv17epFoMC2mL3PlF1azpwT5yHCNUU9DIdLq25qprD
         aTl64AxQDXw245TYAOORoAFL2gL1MCfWfxJ6fOG/is8mbcHkM8v8ISI+6M3ejY80e+G/
         xDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724914212; x=1725519012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTbYTU+eEXbesQ1w5uX4PXo79wYQYLg5UgyyuYRsTM8=;
        b=Rhk2lQkaKnKbiu9QO1iPhI4dOOWscMQz29JQ+O0Iwxzhd3NeNp1FAV13S6FcF+7iYb
         +POGkhx2m5krPA9jWJBNiTAuxBQErrwqabN0sET/rS5nRXMIBuJuapWcaQuqEhs+VBm/
         fK6067FBGL3Bz8zlHCrLQKQXpy+a7ENmQqgcuVC7oTSx63MLYzm7momN87eGxaLXlSkc
         Bzh6nekC46RgX1KR5y8hzeotgfmWdW1MMOGOhyi7QGnJlC5KeIUD+9Hr9lHEI6kgMeEa
         RYTH/1evPS93EHqqGQVw4znusrbSXQWF0aQhd9jianEgo9wkLIY7jE1u+uEiNOL3K5Ds
         CYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx3m9Nms67mpVmA0VmAlS/wZS4iyb1lRpqx0Ns83ZyVu9BqRzZPupk934hVIAD+KlijuhFFT58U7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUe9a2zCvWk0GgTPsVxLeCrbJyt5C3oKfIydnypCg5CCZw9LaB
	ztfPnGcJWJLZAhCLHLl3wkCmwr0hHDpYT+dCV/dkdc0OUoi6t6yzi4zr48Y9saoXtuAWxLzn/TN
	L
X-Google-Smtp-Source: AGHT+IFD1KFQKXHD2NsxEWGSGcXcBDNM5IA3aCJrru/ZgnQkD8KFd2PJDDxrXBnQQUmUPXuRwBUgtw==
X-Received: by 2002:a05:651c:2226:b0:2f5:2e2:eafb with SMTP id 38308e7fff4ca-2f6105b5e21mr15165451fa.7.1724914211870;
        Wed, 28 Aug 2024 23:50:11 -0700 (PDT)
Received: from linaro.org ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6a3f5sm317407a12.2.2024.08.28.23.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 23:50:11 -0700 (PDT)
Date: Thu, 29 Aug 2024 09:50:09 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"abelvesa@kernel.org" <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 RESEND 1/4] dt-bindings: clock: add i.MX95 NETCMIX
 block control
Message-ID: <ZtAaIRQqC15QPoMQ@linaro.org>
References: <20240729012756.3686758-1-wei.fang@nxp.com>
 <20240729012756.3686758-2-wei.fang@nxp.com>
 <Zs7jvCHO+ifC3VaT@linaro.org>
 <PAXPR04MB8510AE921AD67C110F135BB988952@PAXPR04MB8510.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510AE921AD67C110F135BB988952@PAXPR04MB8510.eurprd04.prod.outlook.com>

On 24-08-28 09:31:08, Wei Fang wrote:
> > On 24-07-29 09:27:53, Wei Fang wrote:
> > > Add 'nxp,imx95-netcmix-blk-ctrl' compatible string for i.MX95 platform.
> > >
> > > Signed-off-by: Wei Fang <wei.fang@nxp.com>
> > > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> > b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> > > index 2dffc02dcd8b..b0072bae12d9 100644
> > > --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> > > @@ -17,6 +17,7 @@ properties:
> > >            - nxp,imx95-display-csr
> > >            - nxp,imx95-camera-csr
> > >            - nxp,imx95-vpu-csr
> > > +          - nxp,imx95-netcmix-blk-ctrl
> > 
> > Move this above vpu-csr, please.
> > 
> > Also, for some reason, this patchset doesn't apply cleanly.
> > 
> > Please respin.
> > 
> 
> Okay, let me update my local tree. I use the linux-next tree as the code
> Base, is this tree okay?

Sure.
