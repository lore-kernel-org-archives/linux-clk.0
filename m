Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECE41A9B5C
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 22:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731105268; cv=none; b=QSulFaUHI1Af5mskbjiF8tEcY6kTkjlyruFK4jSURRFMmee/7WJvSAh7mtYz4iaEdJO7cWua6FbdPPOPAZa3hhz4e9oxt1JIfmZtFZ3pTQ7C4QcSbIAVVaf1AJE6AbyZ611fCtFjBjYhMxu4UyJjOD4aZeDCCxWY6EACFgouZ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731105268; c=relaxed/simple;
	bh=0/KVC12+xjNHJl5r/ukwtRlJS3R/y9oBNp7Io2lNEIo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HNmWDTli9/XS2k8UIYioZ7RYX6RtSSf/yNo82l+7losbYV0QMXFKl8aokx77C97xXs4ze9AHWehqTZqxNuVG6Pi7qvZvBQvVyFBtmLST0PNaVkWoKs7pPp//reJwz3dmtHZumx8XCCLg5TTM6oyBXKcj/GJGU6AkoxPDrskNcaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C8DD497;
	Fri,  8 Nov 2024 14:34:53 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD8473F6A8;
	Fri,  8 Nov 2024 14:34:21 -0800 (PST)
Date: Fri, 8 Nov 2024 22:34:00 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Evgeny Boger <boger@wirenboard.com>
Cc: jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev,
 mturquette@baylibre.com, samuel@sholland.org, sboyd@kernel.org,
 simons.philippe@gmail.com, wens@csie.org
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
Message-ID: <20241108223400.460982d6@minigeek.lan>
In-Reply-To: <7b63b316-4cd7-48ee-ae32-3750d25e2307@wirenboard.com>
References: <20241025105620.1891596-1-andre.przywara@arm.com>
	<7b63b316-4cd7-48ee-ae32-3750d25e2307@wirenboard.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 8 Nov 2024 23:14:51 +0300
Evgeny Boger <boger@wirenboard.com> wrote:

Hi Evgeny,

> Tested-by: Evgeny Boger <boger@wirenboard.com>
> 
> We had stability issues with some of our T507-based boards. T507 is the 
> same die as H616, to my knowledge.
> They were fixed by essentially the same patch, which we unfortunately 
> didn't submitted to mainline: 
> https://github.com/wirenboard/linux/commit/dc06e377108c935b2d1f5ce3d54ca1a1756458af
> 
> It's worth noticing that not only the reparenting is mandated by T5 User 
> Manual (section 3.3.3.1), it's also is implemented in vendor BSP in the 
> same way.
> 
> We tested the patch extensively on dozens of custom T507 boards (Wiren 
> Board 8 PLC). In our test it significantly improved the stability, 
> especially at low core voltages.

many thanks for this reply, I was hoping for such a kind of report!
I typically don't test those things in anger, and only have a few
boards, so having those reports from the real world is very helpful!

Can you maybe give some hint on how you tested this? Does "at low core
voltages" mean you forced transitions between the lower OPPs only, or
were the chips undervolted?

>  From my understanding, all Allwinner SoCs need to follow this kind of 
> procedure, however it's only implemented in mainline for a handful of chips.

Yes, I saw, I have added this to my A523 code already, and prepared a
patch for the H6.
Do you have boards with any other Allwinner SoCs you could test on, or
even already have experience with?

Cheers,
Andre
