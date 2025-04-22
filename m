Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8DC27CB15
	for <linux-clk@vger.kernel.org>; Tue, 22 Apr 2025 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327681; cv=none; b=JRWz4hF9p5z8d7OBsev8kGvOtCmIjC+2jmoOyqbJ27oaIIYexQdfyZaB+MNE1agGazQotQP4rlW49dVOLrqdhpuN/ZBEVMI9h9gyvot9PpZSjMdA84iBAinierolYJUDBHuXGL6tC+CgVg6jFc3dswkoc6vMz5HQcBZVigjmtuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327681; c=relaxed/simple;
	bh=471gRc3HzjQUQw4PVwLo7uOoZBgByN/FB/87Co4jC+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsjWkmmT5pylt6fTKts8wo7Zi016M3BJ+t5rr/+DELudek9N+8/8liNNE7n4As/WEUKTbK79iTnBPoqJJ6PEhy9bLZnjhSn/2MJMOQHeHtVeIXPuuxt5YDXcrhK01UBTaYEwJnCS8l+MeeMI/8JRbfbKzzfXiToyokL4i12nCA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oNEfJKOo; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oNEfJKOo"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acbb85ce788so285016766b.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Apr 2025 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745327678; x=1745932478; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5zqq1b+/6XeRHzzRXttJKkEQgtsEyG1k8HuMNcYU8Wk=;
        b=oNEfJKOoY93vTzSGBw6iIQ8OX5u4NUqq75JVovgzKVmeFgzgxMSjGGG+csgPkdgIv5
         Nj3GTYSLjcvlo0OgZjtYyVJhdeFIur9G3sVOizcE6S/lrP8pKCRPLoeJPZnab/jJCkhQ
         xivlBqfsCNkP9ffyVN+oiD3wt5TIRIHZSVuoadRTxMCkRtc+P7Pgy8eWi0x2MrrTLIwV
         HhrTVZnJ9zjhXJZMgHpaUyUzYZ0FxVd0nEDhRaPN1YAlflU1nioGJLOEPauRLCv+5G7r
         Ym1Uz4frQM9uh9mOH5w/FdO6RJZDUZ4hzOExueptqCYniQ72H9lYHpmC+J6HtjagCmiD
         +x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745327678; x=1745932478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zqq1b+/6XeRHzzRXttJKkEQgtsEyG1k8HuMNcYU8Wk=;
        b=nzCe+BhXCK4qjEckg2dnAwxuwZ9MDwdBj4DxiryAeO5hhw53z7D/wJ0CLbGAd+cwDg
         wzx2+fWVy3cByvPO8xy4/NlzhVIZ68QO2jeGcpLGqIVuxJv8G7fAz35vIcsuREo8VlmG
         iaYnA+xBvv2bTqCQ1l2NEkPtJZ3y21bR4fELK+bKWzXMlFN0qUCtqcyMg4RSUsZhovoZ
         oNJQ695AGQqqTDZKlkIbiHR2bYL3zkMHiZvcLdtV+6OcOrKy9QEz+IVOxuDU+KZ1kAI7
         8piXscLrUcLTf6kg6vFY7FmFxUM1pzNyQZWgv5YF98eNsignNBeoEENJEAqkeH1MCQki
         a6fg==
X-Forwarded-Encrypted: i=1; AJvYcCUnoEdTuudsGuiVz8B61NCOxWr/JXlpvLtAbU+8mdGAz3kxABQtru+PN+UqWkp27SsCv0M4N9unHeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxustX5aLEbjyvCOAPJoddE7lw6XZGCuuiC7Xyo5Dwj6kRJBtxF
	vDrd1N7wkd19H+8i1jETFVl88QInW55v4WyaThLb85OGUuO2hCMSy1FX7zQO0B4=
X-Gm-Gg: ASbGncsZNa0h6ng4Rpt8p7//rnX2zPPyEUSq1z9WkNrsIrEpSbjmajO5Br0vEN+3mlr
	aowsii2fF1pAP6so4jygZkRXTzNyhN/RWlLhlTUY4OxKS1gpDV+v0a032QnFDSC115Wx4TEqM1l
	fxjiwUnZ1hOFEce8Z1Zfpyi+HJltOAcB01HOUiuqozwL+HzgMZ7alf+mZTx3onLrHDNoiZs0i62
	kMLrS6Z3r3NtOgaaPbZrbRdDfdeE0ZpRj+Ea3/Rt0LCZVs27s7NX+swHuI9wtslj8ssS4s+woeh
	tOTA7/9ZZkhqd1YvfCLBnfDEYdDCfMu6YxWXUA==
X-Google-Smtp-Source: AGHT+IHTXXC4b0G4QfA+kk60IhLLae377q0zTFxBB+eBZqx0IkvXugcFNIxSpugNQp492BWJKEid2g==
X-Received: by 2002:a17:907:1b17:b0:acb:3f1d:ca7e with SMTP id a640c23a62f3a-acb74af0066mr1171765766b.8.1745327677594;
        Tue, 22 Apr 2025 06:14:37 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef49e40sm650708166b.139.2025.04.22.06.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:14:36 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:14:34 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v10 00/18] Support spread spectrum clocking for i.MX8M
 PLLs
Message-ID: <aAeWOryhXosM0Rat@linaro.org>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
 <20250314093503.GD12210@nxa18884-linux>
 <CABGWkvq2X9L6P39K5OeQW4+c2OmSYGHN03mUW-96U5okO1CK5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABGWkvq2X9L6P39K5OeQW4+c2OmSYGHN03mUW-96U5okO1CK5A@mail.gmail.com>

On 25-04-11 10:38:17, Dario Binacchi wrote:
> On Fri, Mar 14, 2025 at 9:27 AM Peng Fan <peng.fan@oss.nxp.com> wrote:
> >
> > On Thu, Mar 06, 2025 at 12:27:49PM +0100, Dario Binacchi wrote:
> > >This version keeps the version v9 patches that can be merged and
> > >removes the patches that will need to be modified in case Peng's
> > >PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> > >The idea is to speed up the merging of the patches in the series
> > >that have already been reviewed and are not dependent on the
> > >introduction of the assigned-clocks-sscs property, and postpone
> > >the patches for spread spectrum to a future series once it becomes
> > >clear what needs to be done.
> > >
> > Although I give R-b, there is an idea just come out in my mind that this
> > might break OS distribution that use firmware(e.g. U-Boot) to publish
> > device tree for Linux Kernel, such as ARM System-Ready complaint OS.
> > I overlooked this point in previous patchset reviewing.
> >
> > Since this patchset is to move anatop stuff to a new driver to reflect
> > the HW truth.  And requires new entries in CCM node, so old bootloader
> > with new kernel will not boot for OS distribution, such as Fedora/openSuse.
> >
> > Not sure how to keep backwards support as before. Leave to maintainers
> > to say if they are ok with this.
> 
> Many thanks to Peng for the review, and a gentle ping to the maintainers.
> This series has been ongoing for a few months and has reached version 10,
> thanks to the reviews from Krzysztof and Peng.
> I kindly ask you to consider it as well.

Hi Dario,

Please rebase and resend. I intend to apply the clk ones. Hope Shawn
will apply the DT ones as well.

Thanks for this effort and sorry for the delays.

Abel

> 
> Thanks and regards,
> Dario
> 
> >
> > Regards,
> > Peng
> 
> 
> 
> -- 
> 
> Dario Binacchi
> 
> Senior Embedded Linux Developer
> 
> dario.binacchi@amarulasolutions.com
> 
> __________________________________
> 
> 
> Amarula Solutions SRL
> 
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
> 
> T. +39 042 243 5310
> info@amarulasolutions.com
> 
> www.amarulasolutions.com
