Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4611C14D2B7
	for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2024 16:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714063767; cv=none; b=nf6fmVhnrxImv1oXuWLSYVem/knf9PIA8LHbRGpuEsX3YETOslkJtMREsE6KKurv4sbG4OLmfIqCE1TSys5ATYCdsO6ld+nBEbfFGz+sXIaXt8SoH/sYaKpiWDw+pHquEZZLt/nDXdFeJYe6C37/VpQHXu/VarQnqH3CSTdNgN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714063767; c=relaxed/simple;
	bh=MKvfwVZ3VjEw+spXFJ1a2UjO6QfAGuRev73DVWZbaUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cm7/ERULX9y7zBLxS0e1EPWXw3YvfWsh3hwfPZ0d/e7U7zqCtWBeodsBRNrveK/VROrlu0vFs+ee4qPjZD2g2XJGDwy/RBsV+/Aw+XoBCyxBH3TRf2MvtTb7EY6Up49mESOHGmuuBvX/x3sxLdZUMLSLtT5bemfMJ6DiIF6I+9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vwaP65CK; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwaP65CK"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c70a55988dso717006b6e.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2024 09:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714063765; x=1714668565; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ukGEv4eef9O4oU5FT2ArMRccMeqiVjOsIZWttkttWM=;
        b=vwaP65CKWUR3Hgjrge/MD9U3FiR0QCLRSgkkd6qnbHpKwaqwezALAMIrPNLr4PO6Th
         2UuTdThPNxET3UfZsx3QG0bleJjXqL45JtT0a4C8LsomG1e/UGuU6tTEbIjxWXlmO4fc
         eKq40JXudTgJNVjUX8AY24dKyzSIQEw1I0Gevxx+oCAojID+5Gwi2hriLKsbX1mt1881
         x75IB2RaRGMiNbyjK4p8FLdgZB+Sr4Uco0EafENGEjJahSFGQjL8KdgBTCno5uCfmm8z
         lTteC30TYtJggxSSy6Iep4KPkoQKjdR62UhCogPpFW6zZA5MgHlIPX+oyK1lQG8y6hE/
         Q2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714063765; x=1714668565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ukGEv4eef9O4oU5FT2ArMRccMeqiVjOsIZWttkttWM=;
        b=cedfEqXEjGNp/7msu4wKUffQK+GEIK+dpbdwhfXs1Y7gnG+yLfqOxSVgNNiVZwqiCl
         jO+eliLZdsOyIszX00O/lAyrlP/COCHNiraB2DTJ6Zofjk4JPjv7IXcbJG8u3SMLk1dZ
         f00jPLFGKg+u6qnh1+Sl2xh62bgDTg8z1ebbK0NP55xSj57tkZ5ipHHJ3pwoF/gOLC4h
         9meYPUMrIinH2HYnYRV9aNyIc4vDKXRLbIpuk6bFypjgkBGQCsRc7qcVElGHPqkkENyj
         RD/hSCD2QTERWVegdnnHfqFC4HvhTAuSLJuiXnyxbMHo0r5cwn38a5JjnotTG6Vx1jUv
         igBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbNTOvc7SjKJJk9HkC//CdfDX77Ap5a9ZIxmFJtXHDgSvVMoCm78Ko6zlT0AzMCeAWBsZadrk2dwNAXy+YI4QOABHfzVRfF0M2
X-Gm-Message-State: AOJu0YwBL9uTesi1y6yUpAwygOSNSUM3Sjz53qTLasqnShfXsDf3Lna1
	LgFJcdGu1OpiXn9jnDfMwUIUYqtVE44bo5I5saKTJ85C6VE4H55dahIxhdQ/S6sQNvEYD+b6MDs
	BlqF+ufqIzNuWhQATt7AHoUwv5EJ9o7VNs8MQVg==
X-Google-Smtp-Source: AGHT+IHZ1YGe8mBmpi+s6MNal/Tnn6pc3qt4P8KtR6rNBxE+ojMFISn6UD+3xJRSRmAITd10pNraylhnueFfb1V3Mzo=
X-Received: by 2002:a05:6870:4201:b0:22e:e26e:73ad with SMTP id
 u1-20020a056870420100b0022ee26e73admr6867939oac.58.1714063765265; Thu, 25 Apr
 2024 09:49:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
 <20240423205006.1785138-4-peter.griffin@linaro.org> <20240424195318.GA367166-robh@kernel.org>
In-Reply-To: <20240424195318.GA367166-robh@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 25 Apr 2024 17:49:11 +0100
Message-ID: <CADrjBPpQE2bMkVUHQHmBBZfRO8Hjb86xPvLQgSvn4BN0guY9xQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] dt-bindings: ufs: exynos-ufs: Add gs101 compatible
To: Rob Herring <robh@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, James.Bottomley@hansenpartnership.com, 
	ebiggers@kernel.org, linux-scsi@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Thanks for the review.

On Wed, 24 Apr 2024 at 20:53, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Apr 23, 2024 at 09:49:55PM +0100, Peter Griffin wrote:
> > Add dedicated google,gs101-ufs compatible for Google Tensor gs101
> > SoC.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/ufs/samsung,exynos-ufs.yaml      | 38 +++++++++++++++++--
> >  1 file changed, 35 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > index b2b509b3944d..1179527d29d1 100644
> > --- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > +++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > @@ -12,12 +12,10 @@ maintainers:
> >  description: |
> >    Each Samsung UFS host controller instance should have its own node.
> >
> > -allOf:
> > -  - $ref: ufs-common.yaml
> > -
> >  properties:
> >    compatible:
> >      enum:
> > +      - google,gs101-ufs
> >        - samsung,exynos7-ufs
> >        - samsung,exynosautov9-ufs
> >        - samsung,exynosautov9-ufs-vh
> > @@ -38,14 +36,24 @@ properties:
> >        - const: ufsp
> >
> >    clocks:
> > +    minItems: 2
> >      items:
> >        - description: ufs link core clock
> >        - description: unipro main clock
> > +      - description: fmp clock
> > +      - description: ufs aclk clock
> > +      - description: ufs pclk clock
> > +      - description: sysreg clock
> >
> >    clock-names:
> > +    minItems: 2
> >      items:
> >        - const: core_clk
> >        - const: sclk_unipro_main
> > +      - const: fmp
> > +      - const: ufs_aclk
> > +      - const: ufs_pclk
>
> 'ufs_' is redundant.

Will fix.

Thanks,

Peter.
