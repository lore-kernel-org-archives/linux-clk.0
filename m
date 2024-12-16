Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A5225634;
	Mon, 16 Dec 2024 02:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734316050; cv=none; b=D0Rr/oeSFtuaxoq6o/vq4WRZSzfWJLWHjaSbxEN2kdbBDwWKEZ1o3O0Hjc6RPL0Ey2MXEoEOt+yL5C3/uQfx5ncTpUUfVIoil0AXIGiHadlx1lBcZXFNzo3vVTxR3YFl8zeZflkQrHkJHQ1NJe9Mq4tv6lEZ1pdjZB4HRIub3NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734316050; c=relaxed/simple;
	bh=MC4ZpvjCJBnzbJnBz/EU+WU3vFxHSCVryE0mPqM0FDA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2YksdzME4ofepUoyD6jG0YQ7cmsCr76qFwCuQrXm0v/czyWcJQsS6I7UaD9Ov1Z6THwG6V7DxKxdbQLN0sYVfkic4/3OmEPvqnUAmuBjFV/NJIUCizFIIao8y5uRzI7IeUv4mOs8riRCvlh0GcxQf6x7joTNcb9Ib6YevSjUf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p8kE34KS; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p8kE34KS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG0X7tn005959;
	Sun, 15 Dec 2024 20:27:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=z7qov9yZpLTGhZcDNr
	1LgPuzt3VXOtWROrjP8ErflU8=; b=p8kE34KSy7X4Sy60h7gRJV9WpX2DJkke5l
	PT6wPXOv1vnCbhJjhiCnB8KyVu9I4wmajE6PSDep9q2zBePkxkWPqpED1ZAjMHPh
	igNMHttiUjHLkxwaOnBps7QUCjEnPOWhmOVEmDH+Vk6UF8CIUDOGR+8LD+KciBam
	ermj6UEr/srLTt8F/LqrHucARXVcJiHod//XCBdHuflYL0ZQecyUrCXuiIBh6lr/
	ORF4V4k9mVW91iqqdzn6ZC0tIMnDGHu0LRTvRN2ZK9/HZdHbpzw/iVuwLDTTYdw1
	oFEx9sMqGNyfe2ntjFBRXQT8Iv/SAqHs3RybJ1b7mh+QtdVmnpyQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43h7ak9f8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Dec 2024 20:27:13 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 16 Dec
 2024 02:27:11 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 16 Dec 2024 02:27:11 +0000
Received: by ediswmail9.ad.cirrus.com (Postfix, from userid 15641)
	id 75ECD820247; Mon, 16 Dec 2024 02:27:11 +0000 (UTC)
Date: Mon, 16 Dec 2024 02:27:11 +0000
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] clk: cs2600: Add Fractional-N clock driver
Message-ID: <Z1+P/0sy1Xsbp8rV@ediswmail9.ad.cirrus.com>
References: <20241211003236.2523604-1-paulha@opensource.cirrus.com>
 <20241211003236.2523604-3-paulha@opensource.cirrus.com>
 <gjkknwwxvzdkljonsfyl42vamr6kjngytf2mbbhbfxkmwmhnyt@rry6pqzxmnsi>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <gjkknwwxvzdkljonsfyl42vamr6kjngytf2mbbhbfxkmwmhnyt@rry6pqzxmnsi>
X-Proofpoint-GUID: rqX2_1H10KEyhjf1d9FpNDxX58Xt2CHZ
X-Proofpoint-ORIG-GUID: rqX2_1H10KEyhjf1d9FpNDxX58Xt2CHZ
X-Proofpoint-Spam-Reason: safe

On Fri, Dec 13, 2024 at 11:58:07AM +0100, Krzysztof Kozlowski wrote:
> > +
> > +#include "clk-cs2600.h"
> 
> You do not include here even the bindings, so clearly
> CS2600_AUX_OUTPUT_FREQ_UNLOCK and others are not bindings.
> 
Ack.  I will change this.

> ID table definition goes here or somewhere around the probe.
> 
Ack.

> > +static struct i2c_driver cs2600_driver = {
> > +	.driver = {
> > +		.name = "cs2600",
> > +		.of_match_table = cs2600_of_match,
> > +	},
> > +	.probe		= cs2600_i2c_probe,
> > +	.id_table	= cs2600_id,
> > +};
> > +
> > +module_i2c_driver(cs2600_driver);
> > +

Regards,
Paul
> 
