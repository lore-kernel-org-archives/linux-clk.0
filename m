Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14487208A7;
	Thu, 19 Dec 2024 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734605527; cv=none; b=PKUFTBGF8G45uIO/7L9sPmcqRXgkd3tKVaGEzRNPv0DgSJGDZCi3Z4SLLuA7qmeblh/kzdETEMCERlZCtAE0vwXbt3sLRGZzyGI/D9pFecnMXj2CGb/5wNDuW4qJHHNZyN8nXNioRiwIjcUp+ieLQFYayYOLiM0Jyvg2vS2IVCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734605527; c=relaxed/simple;
	bh=wBUK7+rKLRuHZH2CMR3yei5t3BON8FwX1RUYysMH+Ho=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJdJwp5jbxU7Rzmf+XyxCKB6aBfOGT+Rkv/FZB8VdXOcpWOh9yQrYIAbR2gfkosD7bYUfJDRaBlSCvLokn7nXeDqIr/xBBXHh12YJ6lPd57wmRkRRT+6QlCXIYuhm1ZcTZUdj7TVmg+mneUb7tPnyPH7lKsrxrd+W5YlNEE/C8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hUily0q5; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hUily0q5"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ7FeGG023978;
	Thu, 19 Dec 2024 04:51:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=GI8wmABLWW6RdZjo36
	kAMFPsgMqY6Mcbk6sSJ8H49oM=; b=hUily0q5GIuQUrypLAtPshRhwISuwAZN6Y
	r1w23hh9IvnOhTUZgDpzQZpDtB2cOI+vw2pkHmiXzRGLZzLCKMkPjemvl2fGRByp
	MDGIWZZYExSLUdMThWJKOQQN+PNqmR3wIpnUxtY5JY6e6Tg1q75G0yHuXP1Ljphg
	mVJS8Qq8xvoMDNM3i3WJsFprPfrOqszrsdjpm0UkU+e8VgMPeaMroihJVXn00TLQ
	qWAnqosPGZz1FnjTl3iKhQdFDOJOQCXINg03n8P7jqYr5MMAAL+eOb51S5SwUI7F
	MwG1HYHL5/g+8S1ZpwkSoHnkQGH54Vavbspqc3dM0xcGwIAtx1lw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43h8a266g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 04:51:49 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 19 Dec
 2024 10:51:47 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 19 Dec 2024 10:51:47 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 88E19820247;
	Thu, 19 Dec 2024 10:51:47 +0000 (UTC)
Date: Thu, 19 Dec 2024 10:51:46 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 2/2] clk: cs2600: Add Fractional-N clock driver
Message-ID: <Z2P6wgUowoW3v7UX@opensource.cirrus.com>
References: <20241219024631.3145377-1-paulha@opensource.cirrus.com>
 <20241219024631.3145377-3-paulha@opensource.cirrus.com>
 <wv5od7uzup275onlvq36w4gvyh2j5oxepqkxiptanm5udidq5u@mbr64dxodkwd>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wv5od7uzup275onlvq36w4gvyh2j5oxepqkxiptanm5udidq5u@mbr64dxodkwd>
X-Proofpoint-ORIG-GUID: X1s2aJ_6-1fY9fEMps7Yd01IZyuXaCAa
X-Proofpoint-GUID: X1s2aJ_6-1fY9fEMps7Yd01IZyuXaCAa
X-Proofpoint-Spam-Reason: safe

On Thu, Dec 19, 2024 at 09:48:05AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Dec 18, 2024 at 08:46:31PM -0600, Paul Handrigan wrote:
> > +/* DEVICE_ID2 */
> > +#define CS2600_AREVID_MASK		GENMASK(7, 4)
> > +#define CS2600_MTLRVID_MASK		GENMASK(3, 0)
> > +
> > +/* UNLOCK_INDICATORS */
> > +#define CS2600_P_UNLOCK_STICKY		BIT(3)
> > +#define CS2600_P_UNLOCK			BIT(2)
> > +#define CS2600_F_UNLOCK_STICKY		BIT(1)
> > +#define CS2600_F_UNLOCK			BIT(0)
> > +
> > +/* ERROR_STS */
> > +#define CS2600_ERR_DEV_DEFECT		BIT(7) /* Device defective */
> > +#define CS2600_ERR_OTP_CORRUPT		BIT(6)
> > +#define CS2600_ERR_REG_CFG		BIT(5) /* Invalid register config */
> > +#define CS2600_ERR_PLL_DISABLED		BIT(4)
> > +#define CS2600_ERR_HW_CFG		BIT(3) /* Invalid HW Config */
> > +#define CS2600_ERR_REFCLK_MISSING	BIT(2)
> > +#define CS2600_ERR_CLKIN_UNSTABLE	BIT(1)
> > +#define CS2600_ERR_CLKIN_MISSING	BIT(0)
> > +
> > +#define CS2600_PLL_OUT			0
> > +#define CS2600_CLK_OUT			1
> > +#define CS2600_BCLK_OUT			2
> > +#define CS2600_FSYNC_OUT		3
> 
> No, the entire point of the binding header is to bind. Drop all four
> above and use properly your header.
> 
> Otherwise I claim your binding header is not used or not really a
> binding.
> 

This excert is from the drivers internal header not the binding
header?

Thanks,
Charles
