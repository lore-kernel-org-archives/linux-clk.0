Received: from bayard.4d2.org (bayard.4d2.org [5.78.89.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB381DB15C;
	Wed, 15 Jan 2025 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.78.89.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736927411; cv=none; b=R+Nn8v8AlGnXyT4o6ABzunpMA9oHpUV/aCmxCueYQLSV6iiepCjQeJqj5UEBvwoyhT4LAF0htOcyiEzZk4NBfNECGFBfQGZKnWSPygHGB3TpixI2UfHeaaeOpn6TJVKjWvwGEjgDrPaotesW3PIjiGKd8igoMprfHQDlnqYuBF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736927411; c=relaxed/simple;
	bh=6nZ7MSfskgPOfJaGxHTVHLkypF/3zP7VLSUDpv6jkFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVO2y5KrPaUjCs0Tp4JuzxgW/6ZSzIhi6Ef4m4WtERxBou5gnMhF0rf0FcrItc5n67rpV75i4JcC92CjHUqt5SNSCowJLJDcB7WTzHtEsIFhXZH0BAiMotDCoufGjPQG21mdQ8fVxx+DhejaCzwiqSx5kXR3/amcyVCD9oT06qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=jrqWg6vR; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=c0NMRBc5; arc=none smtp.client-ip=5.78.89.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="jrqWg6vR";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="c0NMRBc5"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id B8D06122FE26;
	Tue, 14 Jan 2025 23:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1736926157; bh=6nZ7MSfskgPOfJaGxHTVHLkypF/3zP7VLSUDpv6jkFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jrqWg6vRcCsCxus4T8JQ7/eNQZkjzrtfZy84Nw0CZVTvUKmKv+d7mlYnMmAE0JaXF
	 HdV4VdMBuOep40wnFqi6PtmJSclZk7s64Ngg0+sh9bfzcuDms87f0NofE4uqr/1lQ/
	 iX7nIAmlr2ku57/79ltk+WuYIInmNUJBucrNoxCPFbP3slj8wwFKE6GY51QleULCXS
	 3F5yQzdDpG1naRTm159aj6a1jMdM71cUw2r5Hn0gcv7f5xFgAzAYzprGD07+Vcrr4+
	 zojEeuXfQVP26WeyzuSbSJLjjg2xHVqOLkHBo6bqWppIy3fGT/UMWvPx4bcW+AsPWf
	 4Febtcv1IupYg==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jdWJcIIIEqu; Tue, 14 Jan 2025 23:29:16 -0800 (PST)
Received: from ketchup (unknown [183.217.83.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 4CE85122FE1A;
	Tue, 14 Jan 2025 23:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1736926156; bh=6nZ7MSfskgPOfJaGxHTVHLkypF/3zP7VLSUDpv6jkFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c0NMRBc5R6vRo1jNMVN18tfgamNJHbNzBtBK713yGo92DK4NIY+Si47vQS6LVXnMb
	 83ntH91xItw2OjCTMGkzLG4L3Y5SppI7fX/np0GPuxQc+Qw6KTbKD2bdtZzb0dLg7n
	 D2LVOJa+cVqvJ5ewscDV7EEJiN0vYp5Hd+5cQ+X9HpQKzxk4KIT6BdjaiRad+u3YNg
	 oB0H6C9d40F06xMmhxIDVF9o0TowzRKEmBQpwEL4/s0YKMGyrl+J5wcRTQFPslltSF
	 B2Xc6CiFcw+Maz6W4VRUYYzBsRGVabPLQ3/ZDROODVUjnbscAqlhNWA0gM7RelzAAU
	 /TTFj87psIw4Q==
Date: Wed, 15 Jan 2025 07:29:00 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: spacemit: Add clock
 controllers of Spacemit K1 SoC
Message-ID: <Z4djvOcKuFhYbfKv@ketchup>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-3-heylenay@4d2.org>
 <coyp227rh643slvrrtlls6zc4r2fgvajrvsw63xpyxno7b73wy@cvsjtsghmnx4>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <coyp227rh643slvrrtlls6zc4r2fgvajrvsw63xpyxno7b73wy@cvsjtsghmnx4>

On Sat, Jan 04, 2025 at 10:58:54AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Jan 03, 2025 at 09:56:34PM +0000, Haylen Chu wrote:
> > +#define CLK_PLL3_80		32
> > +#define CLK_PLL3_40		33
> > +#define CLK_PLL3_20		34
> > +#define CLK_APBS_NUM		35
> 
> Binding looks fine, thanks for the changes, but now I noticed this
> define.  Please drop. Number of clocks is rarely useful as a binding and
> usually leading to ABI issues.
> 
> Same for all other clock controllers below.

Okay, will drop it.

> 
> Best regards,
> Krzysztof
> 

Thanks,
Haylen Chu
