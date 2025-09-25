Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0578303C87
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758816421; cv=none; b=SZSZsiYQTqaHJuraYsIw1+DcafJvkiDG7bJ4iMnJ6YTl1Ha77W6iJif47/vs3QsZmcOWsPRqpNOgVMc9uzRBcaaj1hCV6uImHPvSw4yJOCw1As9CAZx+HuVt5CzutGhaJIGVsqvy6bEn1sr9pq1nRRbd5TRqK6Su/vEvupyqNwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758816421; c=relaxed/simple;
	bh=BpXsWsbIWOdqk7uF/WtIMG7A8mOG0ib8Ejk2jxL4vcY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhRi58wVk+bXf4cncWocia1x+i8c8WDqR66Qe5I5wjou8s6MWeH4oJRzmsYexDPe9TSKnFkvNvgniCTti8Tm1SIpTW3+ixycIxmQJ7iAHvJ4zojIpIwZE5F6ru4j69m0S6jqlemDLGtvTbOhZ5SzDdp8nsuRkhodb+DoRrlZdmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIBV1NA/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIBV1NA/"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso683490f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758816418; x=1759421218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v+lassDmCrGUqK1j75W06mPpLprXWJRC5SDVpvwTaVY=;
        b=BIBV1NA/0JnyvO/lqOUBARKBtEQFtciN9/cKnCyRy+nfEteg8ShWM1CM0xBpmQPjVS
         TX9JXzb3EH1MiuFbdcAU/a9RUEhOh3idfouUNu3l3dmKMTL+uU8s25cPK8JS3A/+8BZC
         sEPoxzGcb7Q8Ogc8J5N7c7V2+T9+E5agCkrtt8heHUJcaaaMNwbpmDD0KkGTu7nBjdi/
         kfcZ7KSDnT1GmohZbRgb1BLkLK91j784ooFeBT9B8lEvOfN9ezpBCGCEDWdxwIAHnti3
         goVzJIiYEhEdExoRhKk+9xCbeEqA++P1nZKRygnH+vWBgixId0Hz3GSlEEEYtaC1T3va
         HIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758816418; x=1759421218;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+lassDmCrGUqK1j75W06mPpLprXWJRC5SDVpvwTaVY=;
        b=rkQSRFBqTeaCfijdidPJypURhZPCFQvwnFMuZRdIx8ktQZjoBQpJc1ScVMVLFRLPDc
         6e2wMc2fFU1DPqoQF4j2VC+NWdOfZKuuQGyh3QDzO1UVJ+xKdPT2obpyJEaWo7aqMtQc
         x7rQoPkglBIKEM/MA4Qvaij3mLUlPpyCy44qjuv40pDTr2hQyrBn+6bQrzZIekUEdef0
         ynzInLuze1ir1I9bW2Lle3ggUbjmvYt3fcMt2FY+Yfhv0ZeQj9DEOlp3EdID4c3SNtkc
         Auf8wpQPAKvZ+xtap0+XESXiaNx2uU/Zd8DQgh9P0Cq6Uhdb+Je2jKJMm2RQJFlBKkJp
         osSw==
X-Forwarded-Encrypted: i=1; AJvYcCXSpmzs+YHd4+WmE9XRMI7Y7lijOavXm38d8NKVLXsFi89eYh77sj0CQSzoMBqWq0JFlg1HTeGWCf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLezbSTPV7+DcW+9vkwAyegFET/GyYgswu3Zc9tvcJbxfza5uz
	UW7vBDbmq8HYKQQyEIBBer60eCPFlOp4wFopSi76u4ZDFGiyg/f+rhQm
X-Gm-Gg: ASbGncu6Xj87MHgwpfU0fNixGHDh6uo7Wz3fnC5cN6DpZRyU2dwtGriX8Y1bmmrpFHh
	vEXgLxWclrFOrqCFtuN8YTiP9wIXK7442WIXp7eUUe4cxZoTZ327BlopRlsVwenkOw3Nk09OFSl
	i9Ca6Vm4bnhiSLFLEmXXHwKaRdClipB0QxoUokxbXJyi4me5BDdB4m6A22DtUd+DWKADjcNCI5x
	iz78GbZtqMIWfuLLdOhEbPdZSbAg3ZnvW3E9jte3Zx8Ej3lD8/3TLlDO2XBaMlcb0YH0RG8Kg4C
	SvMzaW6Jkt4Pnps8SUgNfIHndfzw+IF3FUHomSdtpQMHCQs/UHDbWiuZxLlo0b3yu5PmST9Q/3m
	n/IOnwtrF20LPG0lyDCavlzLgtfvil8y0EAOySDfoyx4kFU5EmzO4z9KV2q6577t45ovU+vbOBV
	36PfjN
X-Google-Smtp-Source: AGHT+IEHMIJU9u8ueZDndaal17u8mfKe0TgyHQU77XQdzJ/EbxOIGOMX4Q6Ld8eqXuhgbWlq5qhIfQ==
X-Received: by 2002:a05:6000:2486:b0:3d4:f5c2:d805 with SMTP id ffacd0b85a97d-40e4458c89bmr4101481f8f.16.1758816417869;
        Thu, 25 Sep 2025 09:06:57 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32c49541sm20807025e9.5.2025.09.25.09.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:06:56 -0700 (PDT)
Message-ID: <68d568a0.050a0220.19f5c.8cb6@mx.google.com>
X-Google-Original-Message-ID: <aNVonSpnm70dLOUL@Ansuel-XPS.>
Date: Thu, 25 Sep 2025 18:06:53 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: mediatek: Fix wrong
 compatible list for hifsys YAML
References: <20250923201244.952-1-ansuelsmth@gmail.com>
 <20250923201244.952-2-ansuelsmth@gmail.com>
 <20250924140347.GA1556090-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924140347.GA1556090-robh@kernel.org>

On Wed, Sep 24, 2025 at 09:03:47AM -0500, Rob Herring wrote:
> On Tue, Sep 23, 2025 at 10:12:29PM +0200, Christian Marangi wrote:
> > While converting the hifsys to YAML schema, the "syscon" compatible was
> > dropped for the mt7623 and the mt2701 compatible.
> 
> Is "syscon" really needed? AFAICT, the clock and reset drivers don't 
> need it.
>

Ok I also searched downstream and can't find any patch that would make
use of syscon. Guess I will replace this patch with a patch that drop
the syscon from the dts.

> > 
> > Add back the compatible to mute DTBs warning on "make dtbs_check" and
> > reflect real state of the .dtsi.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> > index 9e7c725093aa..aa3345ea8283 100644
> > --- a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> > @@ -16,13 +16,15 @@ maintainers:
> >  properties:
> >    compatible:
> >      oneOf:
> > -      - enum:
> > -          - mediatek,mt2701-hifsys
> > -          - mediatek,mt7622-hifsys
> > +      - items:
> > +          - const: mediatek,mt2701-hifsys
> > +          - const: syscon
> > +      - const: mediatek,mt7622-hifsys
> >        - items:
> >            - enum:
> >                - mediatek,mt7623-hifsys
> >            - const: mediatek,mt2701-hifsys
> > +          - const: syscon
> >  
> >    reg:
> >      maxItems: 1
> > -- 
> > 2.51.0
> > 

-- 
	Ansuel
