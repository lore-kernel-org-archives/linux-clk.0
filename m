Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92293370ACA
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182752; cv=none; b=Sx5hLrPBhQk0aAyqellOyDhlrMB1YUWsByqsJVOlhjDqw2nZOjkd6lstGaPqkYm6J7nqQpSNwkhc8wU08VatYw2YafGfXriUtcqITXGzJnNa0UHsC+wsoPW2T/oOAp7rHHOqozwEHRbK99pQq1nZB4iYUyyIIIlmn8FvSS+n73E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182752; c=relaxed/simple;
	bh=l0fyMC2SBur5U3Qh/dOAnUiQvkL2joWBa6r3CqBxMLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7J4O5go71IXCHhHHJQEDLblsTSenqXan4IgMb/NU50Tx3qp82iPECM/m9+m7yezFitvAJddxMAhFAM54qQvVENOTWKx3QmmsvnqePWE8VYD6MTL8xomQ119R8RA5jtEbszAM+TAD2DMy3Sx8oDi3FBmTQw69HQqwZAkTFKRDFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CFL0YpFX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nyZBR8pI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CFL0YpFX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nyZBR8pI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785182749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lHAl5GzXFBvOzawjrxy+mgEHuifdBY8i61HHJ7qviQ8=;
	b=CFL0YpFXYkQujNiEyBLhVO4Xa9a9XruM5z5QJNUQ3ZYK4Yxlfd+5kEinqi8FJwcI78OkDA
	ZqzwYNcgE5arfAFgnbyOPAb/boOQTCoAp81ucmXjv4tdlA/wjV4DCIGwGzYvuk1EtIoIMd
	SAdfXvTgLT5/hVug6d5ke60n99D2cfo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-ycUJtyjbMmuvET20eS41EA-1; Mon, 27 Jul 2026 16:05:48 -0400
X-MC-Unique: ycUJtyjbMmuvET20eS41EA-1
X-Mimecast-MFC-AGG-ID: ycUJtyjbMmuvET20eS41EA_1785182748
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e9a2b95b5so562149685a.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 13:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785182748; x=1785787548; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lHAl5GzXFBvOzawjrxy+mgEHuifdBY8i61HHJ7qviQ8=;
        b=nyZBR8pI180POy4A1Ck+mVzmdDzqEArNCUGYhpiuaUqJJxu//JLaOYIBrlpPaAEf3t
         ZZbKNtcEJp/R/RVxReX0xVTnxxcafODsKzhJ7AiUHpdEiR5UhTi41Xs1wkUfaB/jUT+m
         FX725Wz7EYGkuMR1+euAqNvQbgNtNT0eDqr4uYrjMv29vXL4iXwN0TOj8pXy5DLcN3Gq
         Gdvd8nYlUBCwrYXW6CISs4EKvPrzXadKoVC9kD4gY0bbsHNm/YEQsllcJnQgfSQW8/22
         nBm9/DsVEX4P1u5g8BYEVddvHckb6uxKt5uJgL4oK6dpRs/smmuO7xK8mC/iw6G8YWUa
         dI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182748; x=1785787548;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lHAl5GzXFBvOzawjrxy+mgEHuifdBY8i61HHJ7qviQ8=;
        b=YUyXFIeplo1q9K2fLRvurz9GkFScVlxRPwFPaiHVQyvM8rdLjLV1cdIrSoSjWWTTjh
         yueBMpDk/+NvNtGqPsvG4n+AACLFtW0h5ZM5X9s0Hp5t7rK3ZJ/Y/SaL3/SLXbqD2FJE
         iCUfj2Vt+gD0UTHH8Lr2W539sein1dHalWGCBINncCYicfJXWSrhIm3/pdhM2PmVh8mv
         gvgslavRD1KcGjDrVEx7V0O/AAhrISXaOobgDqL6pZbcA5kyPoJDepbg/mtgEfLrX0ZT
         QuZn42ILZOAjdfbQSU2zXz+5CiAzRYciRh38mVpA9w5kqMhaSOSUsgdNHy4cu8Gn2FEt
         Iu9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqoXebXXmwpdadqfpWOfcuaDGSv5bFwd4mRBO0siwB8M1Oe7EzoRqG0+3WtDz5P2oWH0H3dsITp6/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm00av1py1o62fkIwR3LR/5tWcVV1abBCPUYwtbmi1E04S6NBo
	5GUrIjipcGrRpQ+BhiWy4eeiBg7MzHDeXMENuKdowKlzhgi5WT8JyKoFqGoh5a+sv7XSRXyOHVB
	DEzUd0EWmbVnq/l1MeOq/MKEiL+VboAPSEMg6r/jEbtWAUyASNQ0tx+TIxB+v0A==
X-Gm-Gg: AR+sD12vOibobh0w+gzlLTby92PhSIDGZa7KgAzhn2gaUDintlFCIWkKv7l+eTClIdr
	R/KqUmIzYjVgDBek7LkF29NcKOqlzBORqltuq201YDrOV8ltrTbOPsCycHQNSu3eEY5uxunRT7h
	aadoVmHIVpxWk//Pme0hpoyfNy1T5btFThDyAHAR6iGi6Yyj5l0+7GBlJEkoKmpblGMx+BPuhKe
	v3/mfHBKeECpzKp9fwnRenmoAb1opEUTAaPfOsaDYfZL9FnqVBgA0DkTTWfduRQIAKaMlbGrY0t
	FnXAwv4+JEL8KRPc8MwYr1DVVW0eOtQ3Pb1mtCp1DrHjOyue0Y6u/ZU2UC0wRlMVkgvH2N9n+w=
	=
X-Received: by 2002:a05:620a:48d:b0:930:a74c:f1c5 with SMTP id af79cd13be357-932df72ff1fmr818068585a.59.1785182747586;
        Mon, 27 Jul 2026 13:05:47 -0700 (PDT)
X-Received: by 2002:a05:620a:48d:b0:930:a74c:f1c5 with SMTP id af79cd13be357-932df72ff1fmr818064685a.59.1785182747059;
        Mon, 27 Jul 2026 13:05:47 -0700 (PDT)
Received: from redhat.com ([2600:382:771a:ae2:b914:58a6:76d2:bfbb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e86a1b62sm72216126d6.26.2026.07.27.13.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:05:46 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:05:43 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: airoha: Add PHY binding for
 Serdes port
Message-ID: <ame6F0auneo1dGtq@redhat.com>
References: <20260724184304.192962-1-ansuelsmth@gmail.com>
 <20260724184304.192962-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724184304.192962-2-ansuelsmth@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Christian,

On Fri, Jul 24, 2026 at 08:43:01PM +0200, Christian Marangi wrote:
> Add PHY cell property for Serdes port selection. Currently supported only
> for Airoha AN7581 SoC, that support up to 4 Serdes port.
> 
> The Serdes port can support both PCIe, USB3 or Ethernet mode.
> 
> - PCIe1 Serdes can support PCIe or Ethernet mode.
> - PCIe2 Serdes can support PCIe or Ethernet mode.
> - USB1 Serdes can support USB3 or HSGMII mode.
> - USB2 Serdes can support USB3 or PCIe mode.
> 
> Add bindings to permit correct reference of the Serdes ports in DT.
> Values are just symbolic and enumerates the Serdes port with a specific
> number for precise reference.
> 
> The available Serdes port can be selected following the dt-binding header
> in [2].
> 
> [2] <include/dt-bindings/soc/airoha,scu-ssr.h>
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     | 24 ++++++++++++++++---
>  include/dt-bindings/soc/airoha,scu-ssr.h      | 11 +++++++++
>  2 files changed, 32 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index eb24a5687639..fc37786ac7ed 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -23,6 +23,7 @@ description: |
>  
>    All these identifiers can be found in:
>    [1]: <include/dt-bindings/clock/en7523-clk.h>.
> +  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
>  
>    The clocks are provided inside a system controller node.
>  
> @@ -50,6 +51,12 @@ properties:
>      description: ID of the controller reset line
>      const: 1
>  
> +  '#phy-cells':
> +    description:
> +      The first cell indicates the serdes phy number, see [2] for the
> +      available serdes port.
> +    const: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -65,12 +72,23 @@ allOf:
>          reg:
>            minItems: 2
>  
> +        '#phy-cells': false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: econet,en751221-scu
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +        '#phy-cells': false
> +
>    - if:
>        properties:
>          compatible:
> -          enum:
> -            - airoha,en7581-scu
> -            - econet,en751221-scu
> +          const: airoha,en7581-scu
>      then:
>        properties:
>          reg:

This chunk is new since the split out v10 series[1]. I see that you dropped
krzk's Reviewed-by presumably because of the new chunk. However I don't
see a changelog.

I'm collecting patches up for a clk pull to Stephen. (I'm not sure if
he's going to pull but I'm going to try.) I'm not going to include this
series until I see a Reviewed-by by one of the dt maintainers on the new
patch.

https://lore.kernel.org/all/20260702093812.15918-2-ansuelsmth@gmail.com/

Brian

