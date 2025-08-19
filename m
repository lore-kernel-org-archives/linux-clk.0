Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2959F1C8603;
	Tue, 19 Aug 2025 11:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601357; cv=none; b=tg9xzJVzhiG9b5+OtrrD1SHVeOt8eipljTTOijhkvx51R8Ixe0MMbUNp2Ndxbsv062NKb1iyYiGKWVyrYG2pYk75tocBl4Xz/uumnLnw9E6Z9eZCiXajM5VOPziCy2rs+pcTOHQeOH0SQtzjx1GrvifzTvtI5prE5P53dTVxREc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601357; c=relaxed/simple;
	bh=WC9IS1/5hp/B8CDpamo3rTlcOzp+6KKdkODQNL1hGoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B98empx1mJpTH1jiEcOYIXBFwDYqX3POWNzJwcuf9io/WYhOF+dQ1qfu/AU8hdOQF1xrV9NCMzLfvXSQ/ahp+YoHc/QQYhwSWnWeuifeNEdB5vAM54D+XPFweKQpCF71crl6yKxpHk/SmHulmxfISzd4e0atTkxdyEBezsLJ8r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CDEA1BD0;
	Tue, 19 Aug 2025 04:02:26 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF4FA3F58B;
	Tue, 19 Aug 2025 04:02:32 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:02:29 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: <cristian.marussi@arm.com>, <mturquette@baylibre.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <sboyd@kernel.org>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <imx@lists.linux.dev>
Subject: Re: [PATCH] clk: scmi: Add duty cycle ops only when duty cycle is
 supported
Message-ID: <20250819-fat-taipan-of-fragrance-303c25@sudeepholla>
References: <20250728070446.949095-1-ping.bai@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728070446.949095-1-ping.bai@nxp.com>

On Mon, Jul 28, 2025 at 03:04:46PM +0800, Jacky Bai wrote:
> For some of the SCMI based platforms, the oem extended config may be
> supported, but not for duty cycle purpose. Skip the duty cycle ops if
> err return when trying to get duty cycle info.
> 

Fair enough.

LGTM,

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

I assume clk tree maintainers can pick this up.

-- 
Regards,
Sudeep
