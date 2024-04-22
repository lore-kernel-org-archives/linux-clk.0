Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6FC147C78
	for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713789651; cv=none; b=TtiXjYzlyIEZ17IFNHyMcA8NQchHdqNq4ic3Nba2Dt+HcXQHIvLXnonCphPkY/qpevkuHGI8eTTP8/UMogHLokINUWEe9sENTS4tNk8EtMHZj/vC+7/7+v0dK3sIDyR0BM9Jfiw+7XG5B9qt+jl0cXnegfEr9ZfC/WsXp/aipgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713789651; c=relaxed/simple;
	bh=rHwtqOJ7hfOxjOvIBhN3DOgNQntQgRNTBmHT3TVb85g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsXNhREMIj9OxIIipVXlc6BG1kNKFCG03E4E+aSdBe8QFneYQfRIyezI+ttPRZBeeQUmz6t0IyD+xUl/kwGHtui3HVYPAiwRXofYqxT1tN2ocloihP7yyEiwBgwYagJxK741qydVDIuvxoJqN/ZOOtWtoA0eSiGZ3hQLWnJixw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MB2WIfh4; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MB2WIfh4"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c74b643aebso1733520b6e.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 05:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713789648; x=1714394448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CG4hPexSWedosu3J2N32I42487kxLi51E4WCYQ7z86Q=;
        b=MB2WIfh4rnpQvPmiUpr5uUnAIHibvLzy+iAN3xVwvrhEaW0XYXtPsUEb+iP/lShDmH
         dtlFEsrvpKGphAw5yaIjDYshejPLgxIQiJYL+WWO4Pdmh2nIqbJoIl2xygXzgocgpx92
         dMH8Oypugo07UY7vrx+JMOtxIHtet4Ecl6Zr1LkMCLo29tX3ypPgmmiTAdNbR/KYB1+s
         KFVky1O5yt7228LjC2k+7AyRUv9N4AyJStrzgWziosLnrhA0Qs68qGgowC2rjSW8x+jX
         ON6rah4tqFo1KZ+8IijvfUGbY8IdSpUl227PawVTzkwib7eyPaHenxFXln/JIl4P9R/n
         O5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713789648; x=1714394448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CG4hPexSWedosu3J2N32I42487kxLi51E4WCYQ7z86Q=;
        b=rS/vs7cViGwnY9ku2kmPhg8iE4LLFPEdjcDrSufQMODIVL1nWLFvUsNTK7mIrdLste
         pXAGG1a8knxecPUoNiSvu1lJeBm7oAAFLGTSLCY/XxGtMz0JZlVRMcVu3EkWqAUhiVWy
         AN8X+wzz+/SqAAYJKTSx8NGGNsU3yQbQ5+kQ7DOx0uCkAORuS/944wNGSY1Wx4QAXCVp
         dMFI1MX+EbemsGGWmHo93VlLNWMH86N2+3yfx3aGnLHDfHPK6ja64O4hOpw2Dz8L2YAN
         UD6fdrcd/VoAe+Vl8D7KbkolXbjJgYjnmuZ2ERlT6UPGsswAFl+jcQ2zCUuzPUMwM8am
         aKLg==
X-Forwarded-Encrypted: i=1; AJvYcCX9ygLegnvxd2F3j0XQ/4vi2BjazJ+DXcgHRgMPDjDs0SjJRBtevGlj9Xp85DVDsNSp8YONWsSdkNkbJmEs1AJoaYlIUZVeaGUa
X-Gm-Message-State: AOJu0Yz4Rv3Wph7LNIprS/5exteDs96hVg6HjQl0JVpYSNAzqoKZOTAc
	6+KfahI1EPMEO7bPVYvvaSh86a4GoF0GZVUI9A8PM8E5Z1p4WrH/X66gNpn8LfDcmiSsxcyXJnx
	rXSy0UXa1mJaKbInunlNJZAgpVjpRCVsURPvBlg==
X-Google-Smtp-Source: AGHT+IEMfGJHMTEml1VRNaAfoa4qnzNHZkeLKuW9Vl9je272KzGmuVy0hJtkx+vfLt1IPHkVf/BJiDOJlfCqo09Adjo=
X-Received: by 2002:a05:6870:b601:b0:233:5557:c6a2 with SMTP id
 cm1-20020a056870b60100b002335557c6a2mr14543327oab.34.1713789647808; Mon, 22
 Apr 2024 05:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404122559.898930-1-peter.griffin@linaro.org>
 <20240404122559.898930-10-peter.griffin@linaro.org> <95bcdc942cba564f78a6f2fe4cde892575838d5c.camel@linaro.org>
In-Reply-To: <95bcdc942cba564f78a6f2fe4cde892575838d5c.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Apr 2024 13:40:36 +0100
Message-ID: <CADrjBPrnWzT6raAtuswC0AE6EEwtQ7sTUkm8SjpBh=3nibcmSQ@mail.gmail.com>
Subject: Re: [PATCH 09/17] phy: samsung-ufs: use exynos_get_pmu_regmap_by_phandle()
 to obtain PMU regmap
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, chanho61.park@samsung.com, ebiggers@kernel.org, 
	linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

Thanks for the review feedback.

On Fri, 5 Apr 2024 at 08:04, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> > This allows us to obtain a PMU regmap that is created by the exynos-pmu
> > driver. Platforms such as gs101 require exynos-pmu created regmap to
> > issue SMC calls for PMU register accesses. Existing platforms still get
> > a MMIO regmap as before.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/phy/samsung/phy-samsung-ufs.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsun=
g/phy-samsung-ufs.c
> > index 183c88e3d1ec..c567efafc30f 100644
> > --- a/drivers/phy/samsung/phy-samsung-ufs.c
> > +++ b/drivers/phy/samsung/phy-samsung-ufs.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> > +#include <linux/soc/samsung/exynos-pmu.h>
>
> You can now drop the include of linux/mfd/syscon.h

I'll send a followup patch for this.

Thanks,

Peter
