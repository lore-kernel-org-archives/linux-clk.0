Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AB013AA38;
	Thu, 19 Dec 2024 11:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734606184; cv=none; b=JlwIc5BHgoKXuQ+M2XeACbBWd9stOXteNs6Qjf1LDH6YPbnQcWJCMX9/S7/nQVudPdI1rp6rL0DvzGukjoJeuwYljVTKx7qriSDazopzHVCy+KEKJoonds5dI2lxsIUXIwm7i5euvoYLII0cdAaGokDwikvmDEv1WdhwG5b+/88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734606184; c=relaxed/simple;
	bh=fyUEfXPY6lKhmiZ1cchTmokYBC/rMnAsQzTQoK63ZDc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Je3oxAC7qbwG/pNVqyBySBBDvQ/Hf8l8Yrpe/wu5KG/l8zafGxJSeTNesd9+LWrYzvnG2O5GLc7B8n3Q/GAMjHJOLRzCODmZflkzVcrMTRY9Oq2bNQkez/0Xm7SAKnmpVshZRArj9zccEu7S2pafNIsXxUKP+MnHKILxOT8NCwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cy4g7p+a; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cy4g7p+a"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ5KRf7027660;
	Thu, 19 Dec 2024 05:02:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=sQWyzpmCoM3LxXAslG
	B9YrBesBsIhfjE9Yu44zwZ1Jo=; b=cy4g7p+aOonVPWTm/Df86aNVmO+yMENRr6
	M37pVSx9yl+2FUfxXUPuoXther18/V0VIHpAQIs0wVlgzs0ilEB3wWUDj+skkZHp
	dJ+5n8RGwhz2Kz9rnMEZzvvjFXNBDDHTW6c8PmFXbBGbbDvlIlZAgIO50CfVA9ME
	d9VzVJugdLl9bleo7IEriNSe4+Vff7Ygk+Z3Mq41EcMR3ngAqG9qc/DIYgRUGJhu
	zs0dGqgWhqr8PJhafD+591staMrzx6BDL1V/tJCqY55mTOF3PG1Sr12flwV5sK2U
	6zBYLRtzfovkG9ymFy8sjDiB9KOblvpYVWeHe5g8B2LRotFykjHA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43h8a266ub-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 05:02:59 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 19 Dec
 2024 11:02:56 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 19 Dec 2024 11:02:56 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 65AD6820247;
	Thu, 19 Dec 2024 11:02:56 +0000 (UTC)
Date: Thu, 19 Dec 2024 11:02:55 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] dt-binding: clock: cs2600: Add support for the
 CS2600
Message-ID: <Z2P9X5b+oTo4Du/n@opensource.cirrus.com>
References: <20241219024631.3145377-1-paulha@opensource.cirrus.com>
 <20241219024631.3145377-2-paulha@opensource.cirrus.com>
 <3glyuu4yg7wbykdsfm33m5evnn7fwg4dbplrkgzcceld3cgu2s@t3xjlhryt2y6>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3glyuu4yg7wbykdsfm33m5evnn7fwg4dbplrkgzcceld3cgu2s@t3xjlhryt2y6>
X-Proofpoint-ORIG-GUID: XiCh5Oco17bndUKHslANQbc8c4BSB_ha
X-Proofpoint-GUID: XiCh5Oco17bndUKHslANQbc8c4BSB_ha
X-Proofpoint-Spam-Reason: safe

On Thu, Dec 19, 2024 at 09:51:00AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Dec 18, 2024 at 08:46:30PM -0600, Paul Handrigan wrote:
> > +  clock-output-names:
> > +    maxItems: 3
> > +    description: Names for CLK_OUT, BCLK_OUT and FSYNC_OUT clocks.
> > +
> > +  cirrus,aux-output-source:
> > +    description:
> > +      Specifies the function of the auxiliary output pin
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum:
> > +      - 0 # CS2600_AUX_OUTPUT_FREQ_UNLOCK: Frequency unlock notification
> > +      - 1 # CS2600_AUX_OUTPUT_PHASE_UNLOCK: Phase unlock notification
> > +      - 2 # CS2600_AUX_OUTPUT_NO_CLKIN: CLK_IN is not available
> 
> I still do not understand how "clk_in", which is required, could be not
> available. To me it contradicts itself, but maybe just description is a
> bit incomplete.

I think yeah the description perhaps needs to make this more
clear this is setting an error output pin, ie. the pin goes high
for the linked error condition.

> > +/* CS2600 Auxiliary Output */
> > +#define CS2600_AUX_OUTPUT_FREQ_UNLOCK	0
> > +#define CS2600_AUX_OUTPUT_PHASE_UNLOCK	1
> > +#define CS2600_AUX_OUTPUT_NO_CLKIN	2
> 
> I still don't see why these three are supposed to be bindings. Drop
> them.

In a binding one would presumably do:

cirrus,aux-output-source = <CS2600_AUX_OUTPUT_FREQ_UNLOCK>;

Apologies but I don't quite understand what you mean by the values
are not used in the binding? The driver reads the property and sets
the pin to have the appropriate function. Admittedly one could drop
the defines and then DTS would just have to do:

cirrus,aux-output-source = <0>;

But that feels a bit less helpful when reading the binding.

Thanks,
Charles
