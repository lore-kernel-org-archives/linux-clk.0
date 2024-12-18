Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87564156225;
	Wed, 18 Dec 2024 07:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734507093; cv=none; b=lnQcyjZgilUz+yRE5fu4nWfr5/n82B4pfiPOLxMLWs4eM9VWo1occKQ6yQ2HJ7R7SBehLIHbxEWPhH6VWQjI07tgp3kwMNVsKwIhApApQwkTvLxsguWgqFo0oYo2BLNrOI1+6IRofQz3nVoRHBL5BhEwBP2cBgl8JhTpYa4YQXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734507093; c=relaxed/simple;
	bh=UJHL7dweLmwUGR1PHEDUo2QcNCYWaHLFMTGNoQy3tFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIf8T293JMZhB5ovmqcynqw1Hnwz9LamOkeakKTL6QhwpzaXdD4UjkkqmOVfJHCp8Ze+pWT7K9SnOLcH5TcryuRu57gdXOxI+EcW6VsTq4xiyKpRWplB0zi1C5Ba8NgvJWyvfD7+OUo/v2DdDsIqmRmOaEY8E+3sPdW/v3wXtic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Wed, 18 Dec 2024 15:31:26 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 0/3] Add clock controller support for Spacemit K1
Message-ID: <20241218073126-GYB3467167@gentoo>
References: <20241126143125.9980-2-heylenay@4d2.org>
 <CAJM55Z88=jq4brJeDuXF37yAHqQKCCs7L8gVOdHQhjVT7r-eZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJM55Z88=jq4brJeDuXF37yAHqQKCCs7L8gVOdHQhjVT7r-eZA@mail.gmail.com>

On 03:54 Wed 04 Dec     , Emil Renner Berthing wrote:
> Haylen Chu wrote:
> > The clock tree of Spacemit K1 is managed by several independent
> > controllers in different SoC parts. In this series, all clock hardwares
> > in APBS, MPMU, APBC and APMU, are implemented. With some changes to UART
> > driver, CPU cores and UARTs could be brought up (see below). More clocks
> > will be implemented later soon.
> >
> > No device tree changes are included since Spacemit K1 UART needs two
> > clocks to operate, but for now the driver gets only one. I would like to
> > defer the changes until this is resolved.
> 
> Hi,
> 
> Do you have a git tree with these dt changes though? It's impossible to test
> this patchset without them.
> 
> /Emil

I'd suggest to include the dts part patch when sending next version..

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
