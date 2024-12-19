Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0443722577A;
	Thu, 19 Dec 2024 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734612335; cv=none; b=l5CqCeF6ZQ+4QvljEDugIqMV6UzzHNbmiUwPF7L/kRNlslQNCWbV/Acyaz+QWTHCU0OW/oTw7FmKRHlUdetczGlCXiyXsYWQ3A/yR9vgzhShb2ttdx12rdu6Xm5lNtozt+xOebFyHdrTE0AleLX2CgH6t3yGmv7+VRaUk263Cp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734612335; c=relaxed/simple;
	bh=pc930QbH1LZBmbJCg4uBRJG/q5/rCNRl9DqkL7RO2Yc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PG+Z2B0C5Uh0a7IlByzet0z1rAO3tJ8DXuKLTZ+2sau0bfR09AQ2As6VDsPAzUNiQC1LQJKHEYOfmuyVLtS6wyawAl3cLBkrNE1iNckUOef4TswshqjCBBHS9uX5nUBp4gIr4IfMBSqTGP+/zIpRwU7iUJF8Y3aMmmlU3jin/Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NJzET0ha; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NJzET0ha"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ5GCXa018786;
	Thu, 19 Dec 2024 06:45:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=nwsi7sAFtY50lg6CwA
	zpkvIfWbIqiiS4IZ8jXa332Co=; b=NJzET0haeT6hcR7iMHMBoM3psj26UL/C1z
	zN4tBcnonNBiUWA+9xJfNwM7zupSL3m9qDcWU+Jb9Gv+jNDEpzp+iUdJH169/qbI
	pqjARm6e9C3U5OX2sM9WLsFpqrM87ixui5YvRxGRLrboKHDrYhT9QIudKYPNdzBg
	zLo2DPteuW42sCRCW9myRuG1LY+1BO52O++oCFIbvS9hZMuIE5QXisg8OG+8iPHy
	pXKn5EFK/N6NGcxoIOUWjflOSa5mN043rRoUH6bhROCbcy+3qU4sPi/zP46Z8Lmw
	tZvHf9zLgMyhG+f/o2EgfM/z7ECS+kKYlAUZ0e4gxw/0+jXi8zVw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43h7ake41u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 06:45:29 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 19 Dec
 2024 12:45:27 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 19 Dec 2024 12:45:27 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id B86C3820247;
	Thu, 19 Dec 2024 12:45:27 +0000 (UTC)
Date: Thu, 19 Dec 2024 12:45:26 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 2/2] clk: cs2600: Add Fractional-N clock driver
Message-ID: <Z2QVZjSfrptMtTv6@opensource.cirrus.com>
References: <20241219024631.3145377-1-paulha@opensource.cirrus.com>
 <20241219024631.3145377-3-paulha@opensource.cirrus.com>
 <wv5od7uzup275onlvq36w4gvyh2j5oxepqkxiptanm5udidq5u@mbr64dxodkwd>
 <Z2P6wgUowoW3v7UX@opensource.cirrus.com>
 <73077b74-10b0-4191-a024-8b9edb21f507@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <73077b74-10b0-4191-a024-8b9edb21f507@kernel.org>
X-Proofpoint-GUID: bfIybjK8Xj_Gg0teJFWJVoFwRLAETI4v
X-Proofpoint-ORIG-GUID: bfIybjK8Xj_Gg0teJFWJVoFwRLAETI4v
X-Proofpoint-Spam-Reason: safe

On Thu, Dec 19, 2024 at 12:40:30PM +0100, Krzysztof Kozlowski wrote:
> On 19/12/2024 11:51, Charles Keepax wrote:
> > On Thu, Dec 19, 2024 at 09:48:05AM +0100, Krzysztof Kozlowski wrote:
> >> On Wed, Dec 18, 2024 at 08:46:31PM -0600, Paul Handrigan wrote:
> >>> +#define CS2600_PLL_OUT			0
> >>> +#define CS2600_CLK_OUT			1
> >>> +#define CS2600_BCLK_OUT			2
> >>> +#define CS2600_FSYNC_OUT		3
> >>
> >> No, the entire point of the binding header is to bind. Drop all four
> >> above and use properly your header.
> >>
> >> Otherwise I claim your binding header is not used or not really a
> >> binding.
> > 
> > This excert is from the drivers internal header not the binding
> > header?
> I replied in patch two, stripping unnecessary context. There is no
> binding header here, so I do not understand your comment.

Ah sorry yes my bad, you mean drop these defines and use the ones
from the binding header instead.

Thanks,
Charles
