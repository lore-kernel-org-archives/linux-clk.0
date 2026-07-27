Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E578731F983
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 20:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182965; cv=none; b=C1G7V3nUk8m0gnjx8Z94FnhvjOs78cMbIUs4MUBrFmNVoqWx5vM8YcTUE/8M3htdwGb9RgbOyHp3A1BVmvor+gERuRMO9bwMBhyEZfjjIs+aPEdXwj62OVKJwvLaJkIi4CwhSTAzYZdhYoJWYDuBkNtESVu+CiUbffjAuh9Yhho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182965; c=relaxed/simple;
	bh=UX0fY/srS7ZdKLjNF4jSsVtmLoiLZ3JytKNGESCF8zM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJw8pp96craZOtKjZQQ2QoD+leGu3DES9yTuM1islOr3VJHHfCAi+70i0XmUExMSTpcThsfGg7jxDqsf9GiuDrnHptfdqTTZtzHyPnIfQrKcQjXnduxJxz2qRlUvVy1Oz5X6NU29oASRD+cfjDkce2IEsiv74w3qEy2pOij28e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MihgiS3W; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MihgiS3W"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f84023916so3111480f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 13:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785182962; x=1785787762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ktyHTP3B+cMJl8bG0aNDWYGz8VV/iyh11qcgZ6wVcQU=;
        b=MihgiS3WV79yX53tbugK52iYNWobqakyCnulMYkHHaWwq4RstWdm5FbqumieHefrBl
         Vc+cpRGUHfMh6TloEL5isRtbXw6LTwMQJAPCoV+ZTJ3o0D1v0U9r+11M9QAfmqo8eKhx
         yFVCZW+EWVmLBUOV5/LEKsozUsysVm/4eYVlg+fKTpFVa3HCt+qV23BMO9btjCYXIqsH
         h54NSVMiT3WqVuP/Ctv8qgxaH6PhZRLcBIALg+erfiMKWOIOZff5KAn5jv3Yj51MSQBc
         7rawBjVpSioDKucz389RynchYahhsj8wEjo4jZgnKCmlPa+EE8uCrqGASx/WpDPn6SEc
         8KsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182962; x=1785787762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktyHTP3B+cMJl8bG0aNDWYGz8VV/iyh11qcgZ6wVcQU=;
        b=h6hwKbbUtDRTV8jqFPJYVLz6DiutEAyZUeZVlidxgsZkz3bYgXYRNrK0FXlke1atWR
         SCA3X6B0n+fTfNW8XszIj+o45ATkPi+i96MqwiLiTJN19mrb4bgbW6H5YrsHkg1/H3OM
         wWwkDjjcA4uZ4cZAEvn4R8nZit4RQDJ6d8Tp7AkwiHKmu6FN0pds3scPJ6f/vt4W1Qur
         TjtbvXJb2t/GzAls4bZMBcJmPtipZtvJgPoKdoUYZp8APiHmbvDbGarY0uHPvCHg8z4s
         RjsvREDsRwmbZleejiifEdTOcEtoavxc85SKPjteAicYc2W18aRhc7IHRQ2VaE3ZzljW
         chiQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRXBd1KAloesLCUVJ1PT9xdRbplsaqM6RCpbliC1PM9A7gc7JHMnTTVpD2Xx6GenAjkOveWpIStSw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+izd8fgz1bwrHk+fIhymI2ZGNlDvGKWHHEp4EpbUMDvsnLlaN
	7RuVRpDRphZwqnsFr8AZevLaw18vVtJakPf+0/nk3JX5qd9mQImisTZf
X-Gm-Gg: AR+sD10hbLIdoFAlyNK5KwYu9gRoqR7HIRJFSFGr73PgLirRo1mZXvszZJS6xMFSCa8
	4LeXH9S5JmyeP3LHsqv65Led6Nhf8h9xNk+eOfqu/v/N2wqX7WvSTYYOoZrR2VnQI7DHHlYKqgv
	RkFFig5qJIrA2bMMUkfg5UqQPieUPQtrNrx6ls1G0NTq6QtiC9D1AP/p4snW+oRUj1zZBBTPNQp
	U1gcKJl9KJ5UVYGbcVjuVUigQaLgLsN1dTDw8sWKPcVhz3M0fUqY/aTN2KkK8T9CRZLvCPF/DPe
	IbRm0Aj0UZNk6tKAclPx7P9WF5fPd9d7EeXFrjsCtqps7yITjrj6uEOhvXVWcSgkDPOVYbVYNPL
	c0dANysYSMtJAVKgJZ/holD2TO3DIdvYSvE/t7KL7M/BvBRmFcsKDIID4H7tMYQdvEjr1Zttc7l
	9n9r1B21dlA4zPZ95YmXq8diwcnKbxOQEUYzF+g8XNMsxE2FS96jqB2D4=
X-Received: by 2002:a05:6000:61e:b0:47e:4379:a4fd with SMTP id ffacd0b85a97d-47fafa50cb5mr632815f8f.19.1785182962035;
        Mon, 27 Jul 2026 13:09:22 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-0-193-91.retail.telecomitalia.it. [87.0.193.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bc62basm54589595f8f.13.2026.07.27.13.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:09:21 -0700 (PDT)
Message-ID: <6a67baf1.d9578069.494be.a993@mx.google.com>
X-Google-Original-Message-ID: <ame67YYQqp7WVe8c@Ansuel-XPS.>
Date: Mon, 27 Jul 2026 22:09:17 +0200
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
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ame6F0auneo1dGtq@redhat.com>

On Mon, Jul 27, 2026 at 04:05:43PM -0400, Brian Masney wrote:
> Hi Christian,
> 
> On Fri, Jul 24, 2026 at 08:43:01PM +0200, Christian Marangi wrote:
> > Add PHY cell property for Serdes port selection. Currently supported only
> > for Airoha AN7581 SoC, that support up to 4 Serdes port.
> > 
> > The Serdes port can support both PCIe, USB3 or Ethernet mode.
> > 
> > - PCIe1 Serdes can support PCIe or Ethernet mode.
> > - PCIe2 Serdes can support PCIe or Ethernet mode.
> > - USB1 Serdes can support USB3 or HSGMII mode.
> > - USB2 Serdes can support USB3 or PCIe mode.
> > 
> > Add bindings to permit correct reference of the Serdes ports in DT.
> > Values are just symbolic and enumerates the Serdes port with a specific
> > number for precise reference.
> > 
> > The available Serdes port can be selected following the dt-binding header
> > in [2].
> > 
> > [2] <include/dt-bindings/soc/airoha,scu-ssr.h>
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/clock/airoha,en7523-scu.yaml     | 24 ++++++++++++++++---
> >  include/dt-bindings/soc/airoha,scu-ssr.h      | 11 +++++++++
> >  2 files changed, 32 insertions(+), 3 deletions(-)
> >  create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > index eb24a5687639..fc37786ac7ed 100644
> > --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > @@ -23,6 +23,7 @@ description: |
> >  
> >    All these identifiers can be found in:
> >    [1]: <include/dt-bindings/clock/en7523-clk.h>.
> > +  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
> >  
> >    The clocks are provided inside a system controller node.
> >  
> > @@ -50,6 +51,12 @@ properties:
> >      description: ID of the controller reset line
> >      const: 1
> >  
> > +  '#phy-cells':
> > +    description:
> > +      The first cell indicates the serdes phy number, see [2] for the
> > +      available serdes port.
> > +    const: 1
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -65,12 +72,23 @@ allOf:
> >          reg:
> >            minItems: 2
> >  
> > +        '#phy-cells': false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: econet,en751221-scu
> > +    then:
> > +      properties:
> > +        reg:
> > +          maxItems: 1
> > +
> > +        '#phy-cells': false
> > +
> >    - if:
> >        properties:
> >          compatible:
> > -          enum:
> > -            - airoha,en7581-scu
> > -            - econet,en751221-scu
> > +          const: airoha,en7581-scu
> >      then:
> >        properties:
> >          reg:
> 
> This chunk is new since the split out v10 series[1]. I see that you dropped
> krzk's Reviewed-by presumably because of the new chunk. However I don't
> see a changelog.
> 
> I'm collecting patches up for a clk pull to Stephen. (I'm not sure if
> he's going to pull but I'm going to try.) I'm not going to include this
> series until I see a Reviewed-by by one of the dt maintainers on the new
> patch.
> 
> https://lore.kernel.org/all/20260702093812.15918-2-ansuelsmth@gmail.com/
>

Hi Brian,

yes all correct. I dropped as the patch changed (change is trivial but not
correct)

It's ok as long as stuff gets eventually picked ahahah 

-- 
	Ansuel
