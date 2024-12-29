Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D699F208AD;
	Sun, 29 Dec 2024 19:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735498987; cv=none; b=gFEtpxn+kx40FaCZoncrYle15mShBvYr/unULcoc/g9k27hHAweThXT7ssHGpEpYFLIJTkgzd1Tewhg5j4f1ECqrqTIiCg1uH3yLHG/tXHzud9EFtdhA4RzVcztUUIv93xO7sutjGZ9dPiRgBOp+od8TgZv1DomoowKylaJP0/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735498987; c=relaxed/simple;
	bh=6rydz9jmNEWrNv6Ob+I+E4zx2pdXVAWF2FOiNHh6dFI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAXL955uOcE/qCoxJJfi8/WbQfY3r65z4Ax4oVIda8q6WJfMLnQ0bNUzG3Fz1Uoua7olMBhLBTUjEoj+yF+ezGKG1unfVRj/T8aUllkOfF3cG/yhUB+MCM+xhmu0E67Prfat36vWYgOXM/0gGBg/3hJDkRHpw4tdLF0QFcYNwdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ii/cE93K; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ii/cE93K"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTIAHWx021820;
	Sun, 29 Dec 2024 12:40:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=BlY3+LcpOaLIaVsQOB
	uJHs9VKCkU8Oe1BRoOI48Y884=; b=ii/cE93KsBxD9Ia/IcMng6q0TwiOA19vb0
	nMhyAblbrbna/+8yZSF7GA6hYcSjEepQ/qE1ctHWu3OA5r5cOHLZvANrvaQZt6QA
	umHCqURWAvfMOLJ6flgpaRrcEvNvAkobUnoLY71jHcFOEubouhqaGpcqrGypwYAL
	dhOoaP4SrFVeQHTwZ17HunWNsobYvXs6aeXovA2ZqqrUuGMSS6k3Dx8+0K6Xx/xG
	G3+zbBqXaOPFCUpdtBnT4/qig+/3rvQD3Jegpy4rsDXwMY2iTO/ozgVF3ZmWqs0c
	e31VVzxtHe9yoQ9EM2IFeMY7nEjQf3AVflhMADqmtFbKMPzrmhIA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43temk12px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Dec 2024 12:40:02 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Sun, 29 Dec
 2024 18:40:00 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Sun, 29 Dec 2024 18:40:00 +0000
Received: by ediswmail9.ad.cirrus.com (Postfix, from userid 15641)
	id 60A0A820247; Sun, 29 Dec 2024 18:40:00 +0000 (UTC)
Date: Sun, 29 Dec 2024 18:40:00 +0000
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/2] dt-binding: clock: cs2600: Add support for the
 CS2600
Message-ID: <Z3GXgEMhishvkAeo@ediswmail9.ad.cirrus.com>
References: <20241227224915.3813253-1-paulha@opensource.cirrus.com>
 <20241227224915.3813253-2-paulha@opensource.cirrus.com>
 <gx7ripx5jf42ytxja6c3cqb67je5uy3hf65tmr3gntj6wfytxq@5lox64h7s4ct>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <gx7ripx5jf42ytxja6c3cqb67je5uy3hf65tmr3gntj6wfytxq@5lox64h7s4ct>
X-Proofpoint-GUID: Juwh-CGBJCv_x4jOQosGcz-T4aR4QBnx
X-Proofpoint-ORIG-GUID: Juwh-CGBJCv_x4jOQosGcz-T4aR4QBnx
X-Proofpoint-Spam-Reason: safe

> > +
> > +  clocks:
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    items:
> > +      enum:
> > +        - xti
> > +        - clk_in
> > +    minItems: 1
> > +    maxItems: 2
> 
> This does not match clocks. Nothing here, neither commit msg nor
> description, explains why this is so flexible.

I will add more detial into the discription.  You can have one of
xti and clk_in as clock sources or both.

> > +  reg:
> > +    maxItems: 1
> 
> Keep the same order of properties as in required list.

Ack

> > +  clock-output-names:
> > +    maxItems: 3
> > +    description: Names for CLK_OUT, BCLK_OUT and FSYNC_OUT clocks.
> > +
> > +  cirrus,aux-output-source:
> > +    description:
> > +      Specifies the function of the auxiliary output pin with "PHASE_UNLOCK"
> > +      to indicate the input and output clocks are not in phase, "FREQ_UNLOCK"
> > +      to indicate the PLL is unlocked, and NO_CLKIN to indicate the clock on
> > +      the clk_in pin is not present.
> 
> enum and lower-case

I'll change this back to an enum with lower-case strings as the input.

> 
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +
> > +  cirrus,clock-mode:
> > +    description:
> > +      Sets the device into smart mode whith "SMART_MODE" and sets the device
> > +      into smart mode that only outputs a clock when clk_in starts with
> > +      "SMART_CLKIN_ONLY_MODE".
> 
> enum and lower-case

Ack

> > +
> > +unevaluatedProperties: false
> 
> This is supposed to be additionalProperties. See example-schema.

Ack
> 
> > +
> > +examples:
> > +  - |
> > +
> 
> Drop blank line

Ack

Regards,
Paul
