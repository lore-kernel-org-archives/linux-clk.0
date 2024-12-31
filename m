Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACE419BBA;
	Tue, 31 Dec 2024 15:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735658823; cv=none; b=QRtEUoeg/qvQuBmU2KXv63sgaW91XS8m66f06yfSMjhg5j6mBcGWP3umsBqpPK1qUQ3UflST8TYQUAPfu8slxY3VWimcGHHficNzP8ZXOAWlrOpOCcoqhBvNmLUk4sMGvFSquqsLEUn7awB7ciu52guAmCEgQNRT94dXA9NTpqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735658823; c=relaxed/simple;
	bh=pFxFqtIZKbQkJulPI+qvjilsw83pSrHIlOHF4B0gP5I=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFlnD+WFgNob6OYX+PrZTwp8NafVt+9Yot/oQeat2NVcpsM27Yd5QPPJaDLaSiSjg2Vy497LMxAA0p1YYjC10Y6mZrGtl2ekLhabxJ7+lxznjFHNBDTHcclqjXrzfJAu16gvSjBypb6Bb/avmBYxwfS84bYEeLrs/+VXbDrRx8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Jgb0ZMPm; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Jgb0ZMPm"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BVFNcU4019633;
	Tue, 31 Dec 2024 09:26:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=zoIDOqVjMZBqcHJl/z
	Tm1Doxm4E16/9zX/9BSPmc/VA=; b=Jgb0ZMPmBu2ianjgw/I8e/kUrB4qEoDFKJ
	2GxquEbJbrE9eAdT/W2uLEuKjYviExrakxBrZu47lvuRks9DQdlCcygGQQ8Q8Idm
	UoJgEW+hw01ULgw26606lN2B9en6U2QyoXglXXIwGvwbHhvzBH+xOn1/zCD9lht0
	uGB55/pYMNXTDg9rxGR195ia48Lui2w0g6aWLn0ENzY8KSBHjXjI6KQorwDxBs34
	HEuTgN/igCUP8lLZJtl7iO1wmNUKr6S31Ivv0QOLdT1GgY3VoyMYgLUYHR5Q0h22
	YGpX3GvIedZ+F1bCS3AzaaZ82eiiVxMAKJZCz3sjCpZ6QhQaV8wQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43tfm2trnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 09:26:58 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 31 Dec
 2024 15:26:55 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Tue, 31 Dec 2024 15:26:55 +0000
Received: by ediswmail9.ad.cirrus.com (Postfix, from userid 15641)
	id C2143820247; Tue, 31 Dec 2024 15:26:55 +0000 (UTC)
Date: Tue, 31 Dec 2024 15:26:55 +0000
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v4 1/2] dt-binding: clock: cs2600: Add support for the
 CS2600
Message-ID: <Z3QNP/NqtZOQr/JN@ediswmail9.ad.cirrus.com>
References: <20241230221246.3927158-1-paulha@opensource.cirrus.com>
 <20241230221246.3927158-2-paulha@opensource.cirrus.com>
 <8f662cd8-19cf-4ae3-8cb6-668781eebb4b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8f662cd8-19cf-4ae3-8cb6-668781eebb4b@kernel.org>
X-Proofpoint-GUID: hV-I_Ik-JtxqezFfWIQzXmV6dW9r6MSz
X-Proofpoint-ORIG-GUID: hV-I_Ik-JtxqezFfWIQzXmV6dW9r6MSz
X-Proofpoint-Spam-Reason: safe

On Tue, Dec 31, 2024 at 09:17:22AM +0100, Krzysztof Kozlowski wrote:
> 
> I was wondering why this is not picked up by my filters... now I now:
> wrong subject prefix. It's dt-bindings.

Ack

> > +    maxItems: 2
> 
> This does not match clock-names. Missing minItems. I already commented
> on this last time. Implement all comments I asked for.

Sorry, I misunderstood.  I will add in minItems as well.
> 
> 
> Drop comments, you just repeated the value. If you want to add comment,
> say something different than the value is saying.

Ack

> 

Regards,
Paul
