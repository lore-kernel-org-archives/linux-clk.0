Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D66D3D47C0
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 20:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183725; cv=none; b=jV+QIgs7p6Cw2rB0dgWrx/GKWUnXbEdtLGc7VCa1xoyfnx8HpDVmVBVc91nLSJxbcKH3dAdA+17pCRPrnIFOXb0j0nmgF03qptFeYm8qCDQmAGv8B1aC8AiklrwIbVIoZfWwNtisX0C2UR+6RnhlAu0SOwKQjhq7oOzaE5irido=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183725; c=relaxed/simple;
	bh=m6Fo2EgIL7XM92/wfw+NDLABcCGPzpi1Tg1Fvr75kwE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3M2wVlbkb8PKAjSM5bH6NQZIbM9x/LLpFbX8mTY0tx5EJQSOhmzJRQ14kNwdOVKlQfdY+Re9/DCOOTlZ0EMtQBHcjyeov3mbKJUXsxMQJx5hh/E0+nZsiGB9F9CTHcDPgaM6PMIWsCZgSOiQJyEzk9tFMdbougD6RbRkHvCaAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8QdOv0G; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8QdOv0G"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-496b7622a83so14649795e9.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 13:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785183722; x=1785788522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YBuCYxkWRbFtl8jK6C5+fJEPvb/XB+dTpWvS0UE7x2o=;
        b=m8QdOv0GSN1/BYJv2LOmcHUkHKQ0rboTo//6fFUKBlrI3fEZ/bfyN9rxMfP+qilBOU
         D8FiSWNtTy5cjUjfPLMqeOsSIJeJnwT87DWTZ+TWCh7cjvdwJGZ56fmZP0KyK6YHPU5M
         ESmCATbDpW0bgoqXo44kTeNmckbdRJr0Yf1tFgyHrDco5l+RcDVZ9eBCGm4zJxVjGvhg
         Spiga4NRZFuTQwXZEM3GDsNbGwT4aI/M6X96UolJC/I8xpdkxBYBOz3DSNusQU+tKj9G
         mUKYxHbQvXq0dmt7Uwp1TukUCvvv0QDr2yi/EqwwRYKxljQGTLdSNjbNe1uQa6YZGCk7
         Idfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785183722; x=1785788522;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBuCYxkWRbFtl8jK6C5+fJEPvb/XB+dTpWvS0UE7x2o=;
        b=S1u5jLj3HRpKsYrydaBQsoNVWH4awqkkMoUIX4MlZNn6XFan8c2bUzoUidKrrhC0vv
         3Y8zKzTM7arL+swR3qCj7z9K3tn/WM2qYOMjSPRp/TEit8ja32mctNvZPY1DGX0dpWjD
         1C5PDuaUfbKozBTEUr1DX3nyUGAEDP8LvaEsRg447HwL2xp77sKw+FGHh8tfbuTta785
         u7RJP5TTLsGrDU/aJuRjZzXf1O+i347fP7IAhj32RBIRmFho2gIoor/o4OtDrYJhMutB
         f2A4BgXnIn6bN7cVeZDSCCeOQjwilOOdHVmnJ5XUZM9i5ry6KlihaIcore/G2kO7RN46
         oJlw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6xZ2N4114w3PN3JwG41a4XMDf9E7ld1dj3v49YLObomozMRDNI5X6F7DeYCFwoTSgZ+V0LsQWKjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh9qsr42G0VrX6544HA8VButDL496yy3cUsCFO1ZMdewWMOSNh
	BBXf2O5ILsjdm65tw9OZFE1WY0h9ALSRQcB6P04XB2dqRCBQW4xC7lNUXTaGmQ==
X-Gm-Gg: AR+sD12rqmG9Thwf0st0tRBco5hza1PLhNki0wsBCyB4oTs/zuzyEBnSii6DAl+3c3f
	zCTdPSa7Jan/r4szEDfL+f+bMY2R0KpPOG1QMgQ4A0Ik3rUuNYiKv6R/15AwuR48E3mLERLyp4P
	70bFk88EvRQxkXo8rQKqUw9UIZX5xoujUzpYJAa5N4YBCr1sn9nhHTOntA2bVUOJ2y60jhBC1KJ
	afnIPLlZcbpFL50a8jZJYP8q3rUgMd0LMbMMT9On6YI4pPwSR0/LtfUyf/LOGMqUjVPHED6T2AY
	9RWo0iUp/gQuHrAkKli+vVxO2Mggd3CqxezXmkYQMVFy2ycSdVmSy2lcdxgQ/aS6eaMJfwK2SLg
	LWjbDKKAkpr5CPZQZZhyf8kcBdktYE2q+/4wSck6rZyOaisyRpMmP/J5zkEAy9zGHsxoMrxUjXy
	lLaU0Yczb/rcT8vP/unMJZ8qfo69dZrPJ7jsxIGlGQSnt97g+2y5OP7ck=
X-Received: by 2002:a05:600c:c87:b0:495:4b00:1bab with SMTP id 5b1f17b1804b1-496b5747e1cmr127217345e9.21.1785183722248;
        Mon, 27 Jul 2026 13:22:02 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-0-193-91.retail.telecomitalia.it. [87.0.193.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6287csm52500346f8f.25.2026.07.27.13.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:22:01 -0700 (PDT)
Message-ID: <6a67bde9.8509f64d.df519.9322@mx.google.com>
X-Google-Original-Message-ID: <ame95QZtOXIBzJxs@Ansuel-XPS.>
Date: Mon, 27 Jul 2026 22:21:57 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: airoha: Add PHY binding for
 Serdes port
References: <20260724184304.192962-1-ansuelsmth@gmail.com>
 <20260724184304.192962-2-ansuelsmth@gmail.com>
 <ame6F0auneo1dGtq@redhat.com>
 <6a67baf1.d9578069.494be.a993@mx.google.com>
 <ame9HVDl-TkzYWCe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ame9HVDl-TkzYWCe@redhat.com>

On Mon, Jul 27, 2026 at 04:18:37PM -0400, Brian Masney wrote:
> On Mon, Jul 27, 2026 at 10:09:17PM +0200, Christian Marangi wrote:
> > On Mon, Jul 27, 2026 at 04:05:43PM -0400, Brian Masney wrote:
> > > On Fri, Jul 24, 2026 at 08:43:01PM +0200, Christian Marangi wrote:
> > > > diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > > index eb24a5687639..fc37786ac7ed 100644
> > > > --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > > +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > > @@ -23,6 +23,7 @@ description: |
> > > >  
> > > >    All these identifiers can be found in:
> > > >    [1]: <include/dt-bindings/clock/en7523-clk.h>.
> > > > +  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
> > > >  
> > > >    The clocks are provided inside a system controller node.
> > > >  
> > > > @@ -50,6 +51,12 @@ properties:
> > > >      description: ID of the controller reset line
> > > >      const: 1
> > > >  
> > > > +  '#phy-cells':
> > > > +    description:
> > > > +      The first cell indicates the serdes phy number, see [2] for the
> > > > +      available serdes port.
> > > > +    const: 1
> > > > +
> > > >  required:
> > > >    - compatible
> > > >    - reg
> > > > @@ -65,12 +72,23 @@ allOf:
> > > >          reg:
> > > >            minItems: 2
> > > >  
> > > > +        '#phy-cells': false
> > > > +
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          const: econet,en751221-scu
> > > > +    then:
> > > > +      properties:
> > > > +        reg:
> > > > +          maxItems: 1
> > > > +
> > > > +        '#phy-cells': false
> > > > +
> > > >    - if:
> > > >        properties:
> > > >          compatible:
> > > > -          enum:
> > > > -            - airoha,en7581-scu
> > > > -            - econet,en751221-scu
> > > > +          const: airoha,en7581-scu
> > > >      then:
> > > >        properties:
> > > >          reg:
> > > 
> > > This chunk is new since the split out v10 series[1]. I see that you dropped
> > > krzk's Reviewed-by presumably because of the new chunk. However I don't
> > > see a changelog.
> > > 
> > > I'm collecting patches up for a clk pull to Stephen. (I'm not sure if
> > > he's going to pull but I'm going to try.) I'm not going to include this
> > > series until I see a Reviewed-by by one of the dt maintainers on the new
> > > patch.
> > > 
> > > https://lore.kernel.org/all/20260702093812.15918-2-ansuelsmth@gmail.com/
> > >
> > 
> > Hi Brian,
> > 
> > yes all correct. I dropped as the patch changed (change is trivial but not
> > correct)
> 
> But not correct? Do you need to post a new version of this series?
>

Also the previous one was O.K.. This is just better.
 
> If this version is correct, then I suggest including a changelog here
> for krzk.
> 

Let me add the changelog here so he can quickly check the change:

Changelog from v10 series:

- Rework if condition and reject #phy-cells for
  econet,en751221-scu compatible.

-- 
	Ansuel
