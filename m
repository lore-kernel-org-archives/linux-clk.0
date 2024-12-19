Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB50221DA0;
	Thu, 19 Dec 2024 12:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734613163; cv=none; b=Qm/87OVgnnTTtPaKF04m5F71N+3DeGpX33tJZmmZVfzw9AV+4ujlbP5UYh1d2Lmvl3j8uxbnWnH4G4h3xL5A5WgGA9sh7fffgAyTIk3eERJ+6ZvxY7Sq1WvtQxzK4ATK35mvUCjB4iM3C5E2Xa6tHlwRdlB2nuwhm130v+kzo0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734613163; c=relaxed/simple;
	bh=+xzJVG+hM0KAiWsSsFCrmeQD4FEfre6Rs4Hp8/QQFRY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfoD5Ol+f/0inJvQn6lJTmCmtP3T10H9WEabawEgrzy33JNzeVnhpKuSwndSHoGcBeivSWnRs9XLBnKV/USJlRZS949NDswKHrNFtnBcO3FwYdti3PmgfM3iPIY8i1td52eAMFYC1NXP60zRq3r/hcpJ0MrPxrIYywiclfX2E4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HelIsifH; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HelIsifH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ6RKrD022531;
	Thu, 19 Dec 2024 06:59:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=BZZS0PhjBhxrRWfnWT
	LnqvrbDywCGkojiIIZKI5i86k=; b=HelIsifHmydNLh62B9qn7Ke2FAE1pygIrW
	PBu34vA1XGd/XASjCzkXA7uCT+4ChRGYO+r9ZljWj24jKr2Ia1EvJItpbN/RXmkx
	YpKd6I8qMCEv5xXubRUtIMfcNqA4njejVbMhOM3wCZAyZtrBSDIwzu3qPINqWh13
	MG/YLxqmgIy/fb0ERoRZM57OZlUA5ygkoJVDPPDK+rd3+ow1B4YM9rRCwJYlT8nL
	HZaZq83QsHp1uQWvgOtfXMuv8+hycVk55OyvTc39Kh++umDRemLrEkyb9ShgroGM
	EdnXPmZZIk3n2vO5cA6fJUFW/QMeJWJNiGEiDC4Jj+HrZbl9eBDQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43h8a269n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 06:59:17 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 19 Dec
 2024 12:59:15 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 19 Dec 2024 12:59:15 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 6790F820247;
	Thu, 19 Dec 2024 12:59:15 +0000 (UTC)
Date: Thu, 19 Dec 2024 12:59:14 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] dt-binding: clock: cs2600: Add support for the
 CS2600
Message-ID: <Z2QYooZJ9kFeYzgc@opensource.cirrus.com>
References: <20241219024631.3145377-1-paulha@opensource.cirrus.com>
 <20241219024631.3145377-2-paulha@opensource.cirrus.com>
 <3glyuu4yg7wbykdsfm33m5evnn7fwg4dbplrkgzcceld3cgu2s@t3xjlhryt2y6>
 <Z2P9X5b+oTo4Du/n@opensource.cirrus.com>
 <3c09367c-808b-4414-bf6a-99e0bdaa3a27@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3c09367c-808b-4414-bf6a-99e0bdaa3a27@kernel.org>
X-Proofpoint-ORIG-GUID: XKnnldY7xqcGH429qBlMjPYUA-DYS2Mi
X-Proofpoint-GUID: XKnnldY7xqcGH429qBlMjPYUA-DYS2Mi
X-Proofpoint-Spam-Reason: safe

On Thu, Dec 19, 2024 at 12:39:38PM +0100, Krzysztof Kozlowski wrote:
> On 19/12/2024 12:02, Charles Keepax wrote:
> > On Thu, Dec 19, 2024 at 09:51:00AM +0100, Krzysztof Kozlowski wrote:
> >> On Wed, Dec 18, 2024 at 08:46:30PM -0600, Paul Handrigan wrote:
> >>> +/* CS2600 Auxiliary Output */
> >>> +#define CS2600_AUX_OUTPUT_FREQ_UNLOCK	0
> >>> +#define CS2600_AUX_OUTPUT_PHASE_UNLOCK	1
> >>> +#define CS2600_AUX_OUTPUT_NO_CLKIN	2
> >>
> >> I still don't see why these three are supposed to be bindings. Drop
> >> them.
> > 
> > In a binding one would presumably do:
> > 
> > cirrus,aux-output-source = <CS2600_AUX_OUTPUT_FREQ_UNLOCK>;
> > 
> > Apologies but I don't quite understand what you mean by the values
> > are not used in the binding? The driver reads the property and sets
> 
> There is no user of these defines, so not a binding.
> 
> > the pin to have the appropriate function. Admittedly one could drop
> 
> It's not a proof that this is a binding.
> 
> > the defines and then DTS would just have to do:
> > 
> > cirrus,aux-output-source = <0>;
> > 
> > But that feels a bit less helpful when reading the binding.
> 
> Binding and being helpful are two different things. This to be the
> binding, it has to be used as a binding, so some translation layer
> between driver and DTS. It must have an user in DTS. I keep repeating
> this over and over...
> 

Apologies, but I not sure I totally follow this, and apologies if
you have already explained this are there some docs I can look
at?

I think you are saying because these defines merely represent the
valid values for a device tree property and are not translated
into different values you can't put defines for them in the binding
header?

So this would not be allowed:

  #define CS2600_AUX_OUTPUT_FREQ_UNLOCK 0

  cirrus,aux-output-source = <CS2600_AUX_OUTPUT_FREQ_UNLOCK>;

  device_property_read_u32(dev, "cirrus,aux-output-source", &val);
  regmap_write(regmap, CS2600_OUTPUT_CFG2, val);

But this would be fine:

  #define CS2600_AUX_OUTPUT_FREQ_UNLOCK 1

  cirrus,aux-output-source = <CS2600_AUX_OUTPUT_FREQ_UNLOCK>;

  device_property_read_u32(dev, "cirrus,aux-output-source", &val);
  switch (val) {
  case CS2600_AUX_OUTPUT_FREQ_UNLOCK:
    regmap_write(regmap, CS2600_OUTPUT_CFG2, 0);
  }

And this would also be fine?

  cirrus,aux-output-source = <0>;

  device_property_read_u32(dev, "cirrus,aux-output-source", &val);
  regmap_write(regmap, CS2600_OUTPUT_CFG2, val);

Thanks,
Charles
