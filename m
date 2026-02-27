Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EA943635F
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 15:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207303; cv=none; b=W2vj6nrqtxfwY9+W+UvXTToDbph3ggDd7uofuNhoDOioy9hrGxED0znjiVP/1L865ooi/dAkDrHqw80yUm0GH/lh4sEODUAR5x81bDjdv8SBiy8lPt5667jiU4pIWLvBfEfqu9ScThmtwqwHckXX4whwolxuSR1LpnOPudij3fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207303; c=relaxed/simple;
	bh=7YGmHhwwLBOPKdL6VDCe25943/DRSiWfrs5wdK01lSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZ/6BSQgOstSk5ZO4faQ27YwJJ/q/n5JHSFhmPilsLoy3J+KfXid5ZY8TJY5rTvHWTCOmJ6nYq2mX4AFMqZeSU2dAW0vIXsf0Y8fpAKow0zSoATuh4vM8vzsFtIn1rpqbi0w6XEmXpdH6Ijk9jvO6rxwSkZ/1oRTmbZmp1/qWf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D1207F6b; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rPBo3/v0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D1207F6b";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rPBo3/v0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772207301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lvpFtOiJwNSzgfAcSgZ710nE/mVUo3cuXlNU4qHPIW4=;
	b=D1207F6b+Ayz1imX9jKYJ8kYO6q6psvKeXw4A6k2fXTpKp9mLQw0tLFPubMovQQy3YHuHs
	NvmtYI11Evgjy5VVsGeiM/nYHNV65ySDdcAK0o3IvM2EpwKQXOqtvz5rPle+d2t8SGQfyV
	4VWX+aM0Z9AJL2db6PEFrXatyflB1QI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-44Y3vdmtM6-6jiM2_43LJQ-1; Fri, 27 Feb 2026 10:48:20 -0500
X-MC-Unique: 44Y3vdmtM6-6jiM2_43LJQ-1
X-Mimecast-MFC-AGG-ID: 44Y3vdmtM6-6jiM2_43LJQ_1772207298
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-896fa0fcf27so228491736d6.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 07:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772207298; x=1772812098; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvpFtOiJwNSzgfAcSgZ710nE/mVUo3cuXlNU4qHPIW4=;
        b=rPBo3/v0/qu5FeBOzAKkYn1B9C5lsWr+bmXQMK5j8UQtDOrnLgYltZXpXR2vMcoY/o
         p1oYyh+6qXGShLSwclo0bbUpSEjVRsa6Q0W1XWcVzSyQMpBBRHEl6eOpZOQb+Qsrw/HC
         54E95Fe03hd2yMN4M7pgjckN00+/Xw1IbfGWvLWcmZXWPGHi/k5F6IDDljRnF2tOTqHT
         eMEtgagiObtaauJwYTXZuE0dipqlCouGEsgcPHON6V51Ct3Zx3WTIWvqLONXh9b4t6VD
         PxcLLl4ayVO9bZZnZnTFtL5nWcJtdDdrPuDaz2SUzJtw/Z8C07emTVlTiEvsrAsBagny
         7n3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207298; x=1772812098;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lvpFtOiJwNSzgfAcSgZ710nE/mVUo3cuXlNU4qHPIW4=;
        b=gcYy2yvPatdaFsVg7eFzYxO+K8NkAn14J9pY3Q3/gZvizcY7vjj2x91kMpUMfHW17/
         N3dN3YEBFptDjwdbJFD4b3qaJD45V0F/ZgUh8nR805fTVOQjbODPaBdpFpglUO9Ce137
         rhnB+W1iFMadaRH285IhLGcCnKNdgw83eAZeYjvauOslrYSs7pUZ8VrWQfPLYLCLz+A+
         qmFD7x7OiTwBM6eMczrzOZDRqw06qiG5i4fo3jqBbwuaTPHcn8NkasyLZc3z9JRFBLpz
         MeyukjLX1hXO+jwRIYEZg1rzK6Zqb8l810Orc/6qfOBKk8AsSzmptq6AUOohljWvll5N
         o6wg==
X-Forwarded-Encrypted: i=1; AJvYcCXWyV2oHhkNfZ4ieBfwzxsHWwxfXOq1rA/xhd4ltrXBUTlKRZoOrc6wmLY4HPoDXxP1uAxH8x+k0Fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyVCePD3TV6wv6BwtTGSBMHdzI2pcNxBR/7OL2VNBB5RvWDR3s
	R1A9kGfeNkWE2Vr7uISr6vUfHng388dVCQDyPWjjjYb00Vf4QNJatVBlBIk/X4063qNa2u/OM/s
	wFVVJJEfpqhdrA2z2CHUyOlblzUxNzi98r69n5TF/XoMTV+nlyQhB/CWAtceCokUDq/1o3w==
X-Gm-Gg: ATEYQzwkBs7pAN74uq8Mj8LSzk1iy52dNWQAV+TgbL5MTg8CvhgFq99KrcnpZggESrE
	m1tlmPkZR6rJiisZ/pji7F7NNcZpmf8zS8XsV7oP0CPEMi7HwU4TPNPvjNzbC0vWK27gH0FemNy
	EjlSi8F48VqZv5fqNJdbz1kSeQDW9zWJk+D91DLXrHJdU1UI5u86rDch6mmhcUIPfKG2E4661no
	LNpcN2rqd+Zdn6KpuzWLAVw07Zhqn+ZIpybngCYWI9WUy66umwtge0LRKccb+YbUv/jWKPdKUNP
	tFQXVgVhfRZEh7qWO6hrejx9xU7dU2zyYL7qLdtCbKWmhviFUvRyaV+xV2H19eoTawEMm2uH4Nj
	ezzBXhGwhc0tU9XZmfgM2Rs+jF7k6rdVRl/X1G2dXhDzhWW68B64naccx
X-Received: by 2002:a05:6214:1c45:b0:888:23a9:7b01 with SMTP id 6a1803df08f44-899d1ebb2a5mr48638096d6.42.1772207298271;
        Fri, 27 Feb 2026 07:48:18 -0800 (PST)
X-Received: by 2002:a05:6214:1c45:b0:888:23a9:7b01 with SMTP id 6a1803df08f44-899d1ebb2a5mr48637686d6.42.1772207297762;
        Fri, 27 Feb 2026 07:48:17 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c73a0ab8sm46507566d6.47.2026.02.27.07.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:48:16 -0800 (PST)
Date: Fri, 27 Feb 2026 10:48:15 -0500
From: Brian Masney <bmasney@redhat.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: geert <geert@linux-m68k.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op
 and use CLK_ROUNDING_FW_MANAGED flag
Message-ID: <aaG8v-y9UqsgOZxy@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
 <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
 <aaGxrm0SqwaJWCph@redhat.com>
 <CAMuHMdXR1T-VUnk87qpCmdkrYZr=UbjRJNznLw3YV98JAoN=hw@mail.gmail.com>
 <TY3PR01MB113460B83239C8251DD2FA39F8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113460B83239C8251DD2FA39F8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Biju,

On Fri, Feb 27, 2026 at 03:23:19PM +0000, Biju Das wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 27 February 2026 15:09
> > Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op and use
> > CLK_ROUNDING_FW_MANAGED flag
> > 
> > On Fri, 27 Feb 2026 at 16:01, Brian Masney <bmasney@redhat.com> wrote:
> > > On Fri, Feb 27, 2026 at 09:20:09AM +0100, Geert Uytterhoeven wrote:
> > > > On Thu, 26 Feb 2026 at 19:18, Brian Masney <bmasney@redhat.com> wrote:
> > > > > This clk driver has a noop determine_rate clk op. Drop this empty
> > > > > function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> > > > >
> > > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > 
> > > > > @@ -1041,7 +1034,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
> > > > >         init.name = core->name;
> > > > >         parent_name = __clk_get_name(parent);
> > > > >         init.ops = &rzg2l_cpg_sipll5_ops;
> > > > > -       init.flags = 0;
> > > > > +       init.flags = CLK_ROUNDING_FW_MANAGED;
> > > >
> > > > Iff this is the Right Thing To Do (TM), it needs a comment, as this
> > > > clock is not managed by firmware.
> > >
> > > Before I start a larger discussion on patch 1 with more people about a
> > > name for this flag, help me understand why this provider has a noop
> > > determine rate. Is the hardware eventually programmed with a rate
> > > that's close enough to what was passed in? Or it doesn't really matter
> > > what the clock rate is, just as long as it is running? Or should the
> > > determine_rate function be filled out in this particular case?
> > 
> > I'd like to defer to Biju, who added the empty round^Wdetermine rate function.
> 
> PLL is capable of generating any frequency. that is the reason.
> 
> But we could, call rzg2l_cpg_get_foutpostdiv_rate() from determine_rate()
> as modified rzg2l_cpg_get_foutpostdiv_rate()[1] can return errors
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/clk/renesas/rzg2l-cpg.c?h=next-20260227#n590

OK. So how do you all want to proceed here?

Do you want to fill out the determine rate in this driver? If so, we can
just drop this particular patch from this series.

Since the PLL is capable of any frequency, do you want to keep the empty
determine rate functionality? If so, we could use a different name for
this flag. Maybe CLK_ROUNDING_NOOP?

Brian

