Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794462074;
	b=arP487DsfpiL2E6FELJ30UU+xN18BymGltBNc0YrdsSE09QrndNBL1VeqEfIkAwvrDwy
	 dkg1We17cmiv410AFu4BvoPyncJCDPUoOvjoOdK++e/GSFUcma3owp7LGIEwCPaNLfs7f
	 GljXBtd1CU1IJeCB+mmXZbxv1PREwC9LwF2s6OzqNd+ie/YqRyDMWJBu6jeI75hxzqjm/
	 VqoCKZiVZHebRP+66tz16sj1o7l7mq5BxqHIEwMR0zQLSk7Ovsvd/vhtLnKXtk8owkUZw
	 XAm+0GJpDbglpFP2NBbvAzrKgjjFNoO2+Lr9IJW53YGfWzwCCgLyWMR4fMtt5JnqJIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794462074;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jj2X9dt30Fe2WUsQUpllRmEAQwPcVx25v5WNX8im3fo=;
	b=M1AbGoCWwIlvNx0EWxLKe0rgynuXoiiBJf8Qtq7jCgMP39iQ7rNNqn7EhtbZp51xaUm2
	 yovhR+9NgF2tbpGEuFA2zv8pyW1CWaGFYLKfYqQO7/X7zNPXLNpb3vnvVDiMO5ZeuZ1wc
	 AsAOe5WYUHufiS3HbbxrxLdPoIPjw3J4DuT8aRZVpxcG0FohT/WZb1ihyo+9TOpTm+OIN
	 dJjNCdFtzbdp2aSnB75M1LJVfvwJKCoqPC0SJIw35/2vAU6NpWevxagjofKTWyytyIsT1
	 dCkCuVIGlaczI8Lio635SCvK35gfWP8noEEDIcu9zsYnWgSBcr880DDDNQRMY0uCiKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VW0j3asg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99F7606A321;
	Thu, 12 Nov 2026 05:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VW0j3asg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FBE1F00A05;
	Thu, 12 Nov 2026 05:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794462074;
	bh=jj2X9dt30Fe2WUsQUpllRmEAQwPcVx25v5WNX8im3fo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VW0j3asgzbsWVdXK7Zvdbw5afdLiE6FW9aES3TXbx+f/G+5ohOqx+4RgAgB+lmjpT
	 xlQFP838NDbf+OpHJqyx7CT4dyzJMlBWymw562omEDBF3zWpxJSxi0PGnQeNv3uhGW
	 VGBGA03Q1AYNRQk5XHZAUucIqU/mFTYG37I9O/zj8C4OiKPUH3LfAkuVxVkXgwR5fc
	 1in9KqE6XsqbrJWJbOu9qICJErAQSvyEeZo96pjcr9OAgsYlSDunSo/01vx2bT2XE4
	 ywT8Q05eMdLSVxV289KWqOwTUh+6sQs4fo8jrx/cCb83xnAq5aOXPkRnpkg6fnvr5Y
	 Qs1A+hHwe26yg==
Message-ID: <sashiko-outbox-210470@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 6/9] clk: realtek: Add support for MMC-tuned PLL
 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112052544.555563-7-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-7-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 05:41:13 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] clk: realtek: misplaced linux/limits.h include in
  freq_table.c breaks bisect
--

commit bb40f458c667a0d1463f9b5c0600dafb76a332e7
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add support for MMC-tuned PLL clocks

This commit adds clock operations for Realtek MMC-tuned PLL clocks,
supporting rate control, enable/disable, and phase get/set operations.

> diff --git a/drivers/clk/realtek/freq_table.c b/drivers/clk/realtek/freq_=
table.c
> index 0f977a3fc9021..d0e015131e57a 100644
> --- a/drivers/clk/realtek/freq_table.c
> +++ b/drivers/clk/realtek/freq_table.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> =20
> +#include <linux/limits.h>
>  #include <linux/types.h>
>  #include "freq_table.h"

[Severity: Medium]
Should this #include <linux/limits.h> be folded into earlier commit
"clk: realtek: Add support for phase locked loops (PLLs)" instead?

That earlier patch introduces ftbl_find_closest_by_rate() in
drivers/clk/realtek/freq_table.c using ULONG_MAX without including
linux/limits.h, so building at the intermediate commits in this series
fails and breaks git bisect.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112052544.5555=
63-1-eleanor.lin@realtek.com?part=3D6
