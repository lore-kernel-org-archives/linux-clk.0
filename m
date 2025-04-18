Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703FF269B11
	for <linux-clk@vger.kernel.org>; Fri, 18 Apr 2025 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744970920; cv=none; b=h5kVPUH+4ecq2Zugjt0sAwEh15qFmh4yIGK9D3c9A9gpuFrpd93fxyDTR+Tt+dW+AJ6DrsHIWQ8hFb26Mr8hA2Z3fIQ6qEWy9eoDEYKb0ZQ9cXDtKuzsL1pamGl5qe9knz1oUmw8i4fVJuY9fJFslF75gZLBHUeQRNnxTC7MN1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744970920; c=relaxed/simple;
	bh=+RdKaGSYUCfEJiJFPdvtZA8GDr+MXvsxZc3B1z2ldAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9U57MXa/PNHHoQ12YSrdqIPVtZawRII2eP3y8BgFwKSt5DERrb/H21OuGlN9xqlqTMR7g12UZFUFcx8UoOsgrzpBB8pUSOqq5WqG29M7Yc6fbRw5WdAZmn8Mybq8ARSFUeRNqagnfEr0grPJmRWSNhVHoA+C+IxSdj5QjKNUUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MHcTT8YH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MHcTT8YH"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1039441f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 18 Apr 2025 03:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744970917; x=1745575717; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/qSOlMwG1tBEqwfJZ1I0Em2NJMBVmrSeT8vIpdwl2s=;
        b=MHcTT8YHqz0sPIsVXD3PjHYlZOJYmOSryhjogdewJJh/JRO/PPQEfABxDHFbvXi2z/
         TxSJ2GVuBkflbuZF7FZDkphpx7k0tlWQrr34twF3Bzt9HG497z2zFqaf/eOZGo/m2tS0
         c0kj+c29EqVoTgAgOATw0xgb+uwucPZrO7NX7qmOq1CbsphQQvlu+UsV0RTWJjt4UHoR
         dVaB5GbGhPT8xIBh5fe6PCHMaLVPW9MR6+hL+kLLib5xzbJVi0mISRG1w+/U/iri6xGI
         sKM0NXpXqyIOmScvXHoeLpfYRwL11ocwK8AuYrp14HpLc3L2ek5zTly0vsym/qAQkYqi
         jwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744970917; x=1745575717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/qSOlMwG1tBEqwfJZ1I0Em2NJMBVmrSeT8vIpdwl2s=;
        b=T0pkfe4ppNxcon5t8cdLgsIBvBd0wMhmlJ9bWpHcpAR9BzdsQ5/Zqj0NmF6EFb2sIA
         aFO+8nyEJ+VejbTZ/Fkt8CoUISXAn53FaVd/I3a2vswfG5XS76SA9FFiOHCMPySsSl8Y
         catBjJMmBVPxBbK2IeQRRFWaXBOxvWBxrsjeU0mcxjxKJTPbHc+7VGHT+sNc3lXrZ/lP
         jFH2bGOyoMjBsNEEDRFcnNmBRcUtTD9OwODix8QC3zeQioSXV2UWlXIwCpyvv/O8W12i
         Hi21qA1cob/dPF4ta13ZV/5Tofw2VA/sYUjjJk4sOBaVIKfxekpzRBkba6XYozl0ljuF
         v8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCX+pWngwbxugIquELdAXeq4inGiW5YD6pdy85jKWMMWtD4kf0ryCFSciC5mXcU63B2wh3bi+jEl4FA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiEk8/KZtI1dP69LyALuZ1bqXXOBoGiZ2NFWFlQEPsxlFVJdLb
	LHWHBdFckSJ8SoHhSwhBj8oYTUVijWuk5BGqEdqxyQFg9p04rMygfw6xq2KiUVo=
X-Gm-Gg: ASbGncsWKH0A3xNPHxlg7qkau6y0gFAOBtAHvyGPyXi6U1F2RWtoReCUUbj7ZLWZs+u
	beh1D+9vDdnJ7C1in2PoNcJOlwep64SCCIfDB1HCy5O+A61QnvqWTkFXM7eMO9Y/5q2vjHyMaUS
	fpeeFGQ2iam8VeEEN856fWCYvWy3E29huzPhBZg6ga6O3VWfSuyEi5jVZTaetXG+NQqfNe5ePOd
	ck2DmS0AUA0F6NYfDAiz/AxIKYwy4Xpv3ZB+i50z1IgNeJOvFNo0eheWMicuI2yaKd2jN3i8l59
	gs8FABArOa1T+TPxa6xcTnIfcNhjloRNJF8B0t1aW6E8EdDMGAtaDKyaX5SqNXnN2T7x4RW4flZ
	GAHA=
X-Google-Smtp-Source: AGHT+IG1L3VfWz9J+obAaFerB2Z59MsSd2dFbffUprl7yAb1d+1L7oSTlRW/aqUm+C4DsUsSsv8Z1w==
X-Received: by 2002:a5d:6da1:0:b0:39e:e259:91fd with SMTP id ffacd0b85a97d-39efba3cbbbmr1721753f8f.17.1744970916627;
        Fri, 18 Apr 2025 03:08:36 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207fcsm2342052f8f.19.2025.04.18.03.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:08:36 -0700 (PDT)
Date: Fri, 18 Apr 2025 12:08:34 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] vsprintf: remove redundant and unused %pCn format
 specifier
Message-ID: <aAIkouhM_ePdhgJY@mai.linaro.org>
References: <20250311-vsprintf-pcn-v2-0-0af40fc7dee4@bootlin.com>
 <20250311-vsprintf-pcn-v2-2-0af40fc7dee4@bootlin.com>
 <Z9BKW_06nLAOzYfY@pathway.suse.cz>
 <20250407184647.3b72de47@booty>
 <Z_TRZSxwzfAZ9u6I@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_TRZSxwzfAZ9u6I@pathway.suse.cz>

On Tue, Apr 08, 2025 at 09:33:57AM +0200, Petr Mladek wrote:
> On Mon 2025-04-07 18:46:47, Luca Ceresoli wrote:
> > Hello Petr, Daniel,
> > 
> > On Tue, 11 Mar 2025 15:36:11 +0100
> > Petr Mladek <pmladek@suse.com> wrote:
> > 
> > > On Tue 2025-03-11 10:21:23, Luca Ceresoli wrote:
> > > > %pC and %pCn print the same string, and commit 900cca294425 ("lib/vsprintf:
> > > > add %pC{,n,r} format specifiers for clocks") introducing them does not
> > > > clarify any intended difference. It can be assumed %pC is a default for
> > > > %pCn as some other specifiers do, but not all are consistent with this
> > > > policy. Moreover there is now no other suffix other than 'n', which makes a
> > > > default not really useful.
> > > > 
> > > > All users in the kernel were using %pC except for one which has been
> > > > converted. So now remove %pCn and all the unnecessary extra code and
> > > > documentation.
> > > > 
> > > > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> > > 
> > > Makes sense. Looks and works well, so:
> > > 
> > > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > > Tested-by: Petr Mladek <pmladek@suse.com>
> > > 
> > > Daniel, if I get it correctly, you have already taken the 1st patch.
> > > Would you mind to take also this patch using the same tree, please?
> > > Otherwise, we would need to coordinate pull requests in the upcoming
> > > merge window ;-)
> > 
> > I see none of these two patches in linux-next.
> 
> I see.
> 
> > Anything I should do? Resend? Or just wait a bit more?
> 
> Daniel,	Rafael, Zhang, Lukasz,
> 
> would you like to take both patches via the linux-pm.git thermal tree?
> Or should I take both patches via the printk tree?
> Both ways work for me.

I'll take care of them now

Thanks for the heads up

  -- Daniel

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
