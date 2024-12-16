Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF2625634;
	Mon, 16 Dec 2024 02:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734315699; cv=none; b=LUrB8pOIiT9kbsBDfqKxSEm85vZCcAZRqDasLXgtoY1jLnG6wg9Y8NUxD20RChfkf0Yulqh8H1+R8d9TF4DUk1Ef9kuQt2i36n5Bq4mh19yRLXzpEeFjirF5QyxGVlf52ayjpVJJatezrlCw7dXwVxkdNdtxULbwQA8SZLvAnc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734315699; c=relaxed/simple;
	bh=WJCK6mPQh4O5v54yrGr4V873isLAFtUlfV81FaVl/o0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajEs3zo3ZBQr+JlIXj8Zapp2pc9znhoe7IDCmk+Ipr1q9hINmRDCIu0WRNfV8rIywbroaSUk76pZG9WMhZB7F4Q/9uiSjpMVOeMV9Wr6cQxuj8jtYAzZSszykQOR4otDn808Io7JI89Udyw1XR0epou/emGwJti1l6BGFi+sIVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=i7U8Wabg; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="i7U8Wabg"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG15MMY027859;
	Sun, 15 Dec 2024 20:21:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=bylJqcbNEoECl5j0rQ
	n8XLGztdJvQuXGQfJkaJLTkgs=; b=i7U8WabgaJ92KpAK1vIMVxh1Xr+HNKQJS3
	wSveWcejYJdhDzbXZbIpThOjfPXjgv0nK9UfUEzF9QbcBWaAQZecBirXSHwbEuHU
	twquoQIHEeRT94lweLfjbcFlAuCm5Klr0++sZR3vv6NFKK0Y4ybrCIOCbdBvypOo
	INKMYEo2Z6tk2oH+/Uwi6F9DGOUd1soijgZNQbPckGKppdpEArj2AtLGjZ2oijkp
	weCUYfombVWlbp0YR6IMhjnZbeV6/1zkIhr047O/ySEemnaJQ5nM2A3S7N1Dn5Qn
	bH+ZBK3uqY5OaLmvmh4xI3eP4gApgkwY3f4yOiuaNgHZAKbczISQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43h8a21dya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Dec 2024 20:21:18 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 16 Dec
 2024 02:21:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 16 Dec 2024 02:21:16 +0000
Received: by ediswmail9.ad.cirrus.com (Postfix, from userid 15641)
	id 04655820247; Mon, 16 Dec 2024 02:21:16 +0000 (UTC)
Date: Mon, 16 Dec 2024 02:21:15 +0000
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-binding: clock: cs2600: Add support for the CS2600
Message-ID: <Z1+Om48JULLTzUjj@ediswmail9.ad.cirrus.com>
References: <20241211003236.2523604-1-paulha@opensource.cirrus.com>
 <20241211003236.2523604-2-paulha@opensource.cirrus.com>
 <gofhuzpxqm4fmusebwkjbgblffk5ail27mtgdk4vpwjvyhipcw@2ep6gpgjkgwl>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <gofhuzpxqm4fmusebwkjbgblffk5ail27mtgdk4vpwjvyhipcw@2ep6gpgjkgwl>
X-Proofpoint-ORIG-GUID: YmhNa6zphvhP_UvRE_hDQZ7ZYxNlQEmE
X-Proofpoint-GUID: YmhNa6zphvhP_UvRE_hDQZ7ZYxNlQEmE
X-Proofpoint-Spam-Reason: safe

On Fri, Dec 13, 2024 at 11:55:22AM +0100, Krzysztof Kozlowski wrote:
> > +description: |
> 
> Do not need '|' unless you need to preserve formatting.
Ack

> 
> > +  The CS2600 is a system-clocking device that enables frequency synthesis and
> > +  clock generation from a stable timing reference clock. The device can generate
> > +  low-jitter clocks from a noisy clock reference at frequencies as low as 50 Hz.
> 
> Be sure these are wrapped at 80 (looks like 81).
Ack

> 
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - cirrus,cs2600
> > +
> > +  clocks:
> > +    description:
> > +      Common clock binding for XTI/REF_CLK, CLK_IN
> 
> Just drop description, kind of obvious from the clock-names. If you want
> to keep it, then rather list the items with description per each item.
Ack

> 
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ref_clk
> 
> s/ref_clk/ref/
> (or xti)
> 
> "clk" is just obvious.
Ack
> 
> > +  cirrus,aux-output-source:
> > +    description:
> > +      Specifies the function of the auxiliary clock output pin
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum:
> > +      - 0 # CS2600_AUX_OUTPUT_FREQ_UNLOCK: Frequency unlock notification
> > +      - 1 # CS2600_AUX_OUTPUT_PHASE_UNLOCK: Phase unlock notification
> > +      - 2 # CS2600_AUX_OUTPUT_NO_CLKIN: CLK_IN is not available
> 
> I don't get the meanings - how clock output could be clock is not
> available? clk_in is a required property, so it cannot be unavailable.
These are the values for the enum.  I see how this is confusing. I will
change it.

> > +      reg = <0x0 0x100>;
> 
> Drop reg
Ack

> 
> > +#define CS2600_CLK_OUTPUT		0
> 
> Drop "OUTPUT". These are names of the clocks.
Ack
> 
> > +#define CS2600_BCLK_OUTPUT		1
> > +#define CS2600_FSYNC_OUTPUT		2
> > +
> > +/* CS2600 Auxiliary Output */
> > +#define CS2600_AUX_OUTPUT_FREQ_UNLOCK	0
> > +#define CS2600_AUX_OUTPUT_PHASE_UNLOCK	1
> > +#define CS2600_AUX_OUTPUT_NO_CLKIN	2
> 
> Not sure what are these, but feel like some register values. Otherwise,
> why these are exactly bindings? What part of driver do they bind?
They are different outputs for the aux_out_source pin. I think it may be
best just to remove these defines.

Regards,
Paul
