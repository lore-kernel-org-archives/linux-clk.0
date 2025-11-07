Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B8925D216;
	Fri,  7 Nov 2025 10:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510005; cv=none; b=Z44AJP4ol27uO5dLZCOaldgoRaTYeBS17vdow9mMJWGN+zWkS7uXSBGjbFU4GPgBGwTki4HH3XzhNbQvxULBafGh+gmtjgV8tfdAp9h8zTI9KANagKfh4EPyR9ybmE+l8Fm8v7DMMNdguespf4wNqEk+If0xpmTeAtEx0KF+hDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510005; c=relaxed/simple;
	bh=CzbhWzzPRA0VPC0U8OE/aM1Rzy7psH7/2sGbAgGckik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MepcAMBWmU9ps2fiGinho/3f+PLWl2XOCJGommfcpfS383NGRekXWa2jSaVeYIbwFprPSOB3CsrUNUDtq+mPuwyFn3Mha5O26nM0eA2Ow3ELiJx1VHDV3BMMEWD9b6cYKhruJFjU/702glve68uLtGu7FTWm9kWrgLWo5j2KqTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=do1NU0w0; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="do1NU0w0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762509933;
	bh=VTkegRKBWplfZMqxYq1U+U6T9BH0DS2NDSH/ODE771Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=do1NU0w0jURnCPYL/OYVeo6CSHcq05KBc4I0yai2nZoj/gnrDgVH4iolBH2rFlXqe
	 K5BZGNj7DcpkMSDZDYaMGxAuEF4LxXUpMFNXcpT4hv0bA/B9Q0TmIcrUAyDpvlrOU7
	 3NGA6awZpfU6RW1GvQFP3mv6jzfVjnUNgKxYYAtU=
X-QQ-mid: zesmtpsz4t1762509925te2c1ed2f
X-QQ-Originating-IP: HeNHNwiRuASLexM+FBE0aMEym+/kX7SFhEyilbzv62Y=
Received: from = ( [183.48.246.190])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Nov 2025 18:05:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17184048273143584487
EX-QQ-RecipientCnt: 16
Date: Fri, 7 Nov 2025 18:05:22 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Xuyang Dong <dongxuyang@eswincomputing.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, bmasney@redhat.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: Re: [PATCH v7 0/2] Add driver support for ESWIN eic700 SoC
 clock controller
Message-ID: <6C7E97902D2C1367+aQ3EYikxWNtINfyj@kernel.org>
References: <20251023071658.455-1-dongxuyang@eswincomputing.com>
 <1abb85b.c11.19a582bcbbc.Coremail.dongxuyang@eswincomputing.com>
 <039a3a41-c60f-4296-afd9-2bf3467574ca@kernel.org>
 <6d2d7ddb.cbd.19a5cf92465.Coremail.dongxuyang@eswincomputing.com>
 <1618037D174FDF5F+aQ2hU1J9oLEKCq25@kernel.org>
 <5a9911a3.d09.19a5d8d32cd.Coremail.dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a9911a3.d09.19a5d8d32cd.Coremail.dongxuyang@eswincomputing.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N9mUyT2YXLEuH70ZsKHaFLuWFqTG5q4x4vk975Lf+dd+abfJsK2Nk8ai
	UMW1gZCMJAlary3aRLN6Kn4zLvRIvwUD02RlXsR00b3X6JQJ9lLIf/4iEFQCg7+GSmNQ3b/
	FOrxvs3Rm8ytnnMULLDaWYUUpv3QvDEIbKJx9gVdycpDD0T3ZxCgDNFvQd0Ht7KJL6oqiIl
	6LkClaXEnvSgF9SKXQ1SAv776vYznwp3HJb/m4+++lE2hMk0R7VWuLlrnjBeYcFo6ZaLI94
	WMetNIpPxFTe2Wa8pB2+zLQbPgGc1mUB+9dPAcebZMvuojF6/24f3VVPcjjdRThXZ2P8IwM
	YbGejN/bi5ObTqeFfKKgLB5R0JWTPgqnhijf1Igg56iBOzE1WmBF4YipOhKH6oWcBZhuoKC
	ULycPkKZJq/lVor+PCYMsEZWssMUa7WZZHLtT/X4lEPgImXTGmQol8RIY5ROQWSOc5bXVLI
	vXqDHPvSuX0wkiPou36NxQv8Q5+sjFpkNUCSrQiK3YSbcHf+fD0Sr16zgOnBF/hkgkuulVN
	0iGdxCrE1CCkYzuZZnZTCsOtD2mGbGnvk4q+OvXXplv7Pxt5CmleCSxMRlMT+X40anen0BQ
	h0oJJYemCC/uyzycKLe+ImWfe9XnrIAHa2ti9ntva6womcXrgmmyYcJ0BoPTo4VrVxYW5Nz
	m9pD5yCyvDdDEzzu6NN+VWUEg1OMxpLaOUCI7oBPtQIgZ2mwP+f/WwkxWcw5Sxu4+1Zq8mo
	qMbRofNL+7rxFinOd2ysQFMFUBjHOkE7SDO9jIE/qr3MijetqC3HWf5FqOK/nH/AQcxwtgQ
	RZMqPDU1ECE+fZrE+FQEAGkxdrx9N2tqPWtrc9wwBxH2gMb7pTFuyoRnenOzPmNnNDHtrBY
	pmZ6w7wICvlUurCvSpNhVlSO0NWAX5IP+l/eKGZwFyKloVj0hqUp7J5JK6xCERQ6+QgTPCL
	mbB+LmT2PCg2CJpx9BitcIwvWAwbrOkVnLxWGe+LMBuni8jt7n0wk5znvgh7HV/WzAQl8Eh
	29tKy9mejDh6bAwbdkqOHdBXVjVcA1b8zFlS2sKdeHPmQSdnPeIGHWV6ecRJR8QIZ2SdTLK
	erOr4V4GEmDnkP48NrIqPgaXLtv6c2PGeUE1iaLCiJklvlOidPBt+s=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

On Fri, Nov 07, 2025 at 05:02:06PM +0800, Xuyang Dong wrote:
> > > > > 
> > > > >   Gentle ping. Looking forward to your reply. Thank you very much!
> > > > 
> > > > Please do not top post.
> > > > 
> > > > You did not add any maintainers of these drivers, so I would not put it
> > > > high on our priority list. 
> > Do you have any plans to become a maintainer? If so, this patch might get
> > reviewed with higher priority. I think that's what Krzysztof meant.
> > 
> >                               - Troy
> 
> Hello Troy,
> 
> Yes, I plan to become the maintainer for this driver. I will add my 
> maintainer information to the MAINTAINERS file in the next patch series. 
> Would that be acceptable?
I think yes.

And if you send next version, please dont't send to this email:
troy.mitchell@linux.dev instead of linux.spacemit.com.

Thanks.

                              - Troy
> 
> Regards,
> Xuyang Dong
