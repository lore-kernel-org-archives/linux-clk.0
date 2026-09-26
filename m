Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DE03783D5;
	Sat, 26 Sep 2026 03:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790394708; cv=pass; b=Zf7/TbINKla8dqul1TPn/OoLAS139//a21tpmRnpoukUg9xAHWICBWyxCJ3CB1x1jUCNKcBobM7Tjy/upmhoODF6tqhoN+DVWp4z2273MSorehZm8/w14X4iijXXwfqAGGqtrt9SmkMBbPY9Ymf1mqFGZ0v4Q6Z3qarovL4X+eA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790394708; c=relaxed/simple;
	bh=AenLVsR40v/I2V8hU5aFSuC2h6bdaoca/ZaMMLXD7LY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ap0aFJ3Ec3Dx0kF8xpgNxhsGIlwWC4pfl/SQQTXNrycqHiS8iG7XizbrZ5szqrzOC9JHOtYY+CO5auY9mn46LGr2j3YNpbfWBT2M7Oe10kLKh5x8keP0LkXixXxMmj1uV7HAbODVVxEbXyibZgnynUGGJkuhJM44mjNA4E7oWtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=X9lR9t+O; arc=pass smtp.client-ip=165.173.180.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="X9lR9t+O"
ARC-Seal: i=1; a=rsa-sha256; t=1790394679; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hcdUvlqhEAhvRwAd7ZHCQT0gA3kxGMGPiAyYPWNCZ3G8o3ICf6DG8HW4XXQoyinp8Dppzog/zOwvDF3WNpPGwVQonoBsB066ELV/QNiO4yCaU6D0ywjK0pl+B8/W780RbHxzqgwGGBsUlcnlL/WfXgfOjHDi+wRp+25xj8X5SrY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790394679; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fV+OYR1a5s/03fbYdkCOSm1nCeOMl/C4++YXRNfv/rg=; 
	b=A6Odpcw+ofPIswzOf3mZfaQ1MKlujgpIij6W7tJcCYX18DcMHZ1EHUxISK4UmNiQNnpL8e1TBwT8TLy0Ms2nG30G4EOJwd7Ftf9IrtGu7A/IE6QVtm5ag1/0EdCGEdngAVuZEJ5iMrbUEbeusTrWqFPPL4vZ8+x2ngxs/r6WV1g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790394679;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:In-Reply-To:Reply-To;
	bh=fV+OYR1a5s/03fbYdkCOSm1nCeOMl/C4++YXRNfv/rg=;
	b=X9lR9t+OuCotMH0uHQ8o8QJqXn5RtaRSmpncPreAeFoM9AHD8rLb3cP8wrVJvUJD
	XqKQRx3lZV7yJmrtrWTjxdfdHS/1hcDrSwLiL+xO+jexE/Setw6wvVxawenMaUoITX+
	4aUUZkQ1K0LFuuxUx2f1bh5SJrP7nKSr0x7xI6rM=
Received: by smtp.zohomail.com with SMTPS id 1790394677967246.7571969104904;
	Fri, 25 Sep 2026 20:51:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 11:51:11 +0800
Message-Id: <DLOXXXFCEB5G.15XI8896GM7B7@pigmoral.tech>
Cc: "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>,
 "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Andre
 Przywara" <andre.przywara@arm.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 7/8] clk: sunxi-ng: a733: Add bus clock gates
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>, <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.22.0
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech>
 <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>
 <20260921200512.3179109-1-enzo.adriano.code@gmail.com>
 <DLLYUYMR3CZT.17I8APGBH9H8S@pigmoral.tech>
 <20260926020313.911537-1-enzo.adriano.code@gmail.com>
In-Reply-To: <20260926020313.911537-1-enzo.adriano.code@gmail.com>
X-ZohoMailClient: External

Hi Enzo,
Thanks for the feedback.

On Sat Sep 26, 2026 at 10:03 AM CST, Enzo Adriano wrote:
> Hi Junhui,
>
> Thanks for reproducing the ahb-cpus issue. Adding clk_ignore_unused lets
> the Cubie A7S reach an interactive initramfs shell.
>
> I reused the September 21 uninstrumented comparator: v7.3-rc1 plus the
> four single-divider patches, CCU v4, the seven pinctrl patches, and the
> minimal test DT, with only ahb_cpus_clk marked CLK_IS_CRITICAL. The Image=
,
> DTB and initramfs were byte-identical to that earlier comparator; the
> only boot-argument change was adding clk_ignore_unused.

I tried to reproduce your software stack: v7.3-rc1 plus the four
single-divider patches, CCU v4 with ahb_cpus_clk marked CLK_IS_CRITICAL,
the seven pinctrl patches, and a minimal test DT based on my
understanding of your description. On my Cubie A7A, it completes
clk_disable_unused() and reaches PID 1 without clk_ignore_unused, so I
still cannot reproduce the second failure.

>
> Without the flag, that comparator stopped producing serial output at
> "clk: Disabling unused clocks". With it, the confirmation run recorded:
>
>   [    1.263452] clk: Not disabling unused clocks
>   [    1.292364] Run /bin/sh as init process
>   [    1.526500] mmc0: new high speed SDXC card at address 544c
>
> Commands issued after the shell prompt returned the expected readiness
> and completion markers. No panic, oops or SError appeared in the capture.
> The RAM-only run was followed by a guarded 120-second power-off recovery,
> which restored the vendor kernel and eMMC root.
>
> This narrows the second failure to the path bypassed by clk_ignore_unused=
,
> but does not identify an individual clock: the flag also bypasses the
> runtime-PM acquisition and traversal before the per-clock disable calls.
> I therefore still cannot add a Tested-by for v4 as posted.

Could you share the exact minimal DT used for the test, either by email
or through a git branch I can access?

Could you also provide some details about the boot firmware you used,
including where the U-Boot and TF-A images came from and their versions?
I would like to reproduce the test with the same firmware and rule out
differences in the boot firmware.

>
> Assisted-by: Codex:gpt-6
>
> Regards,
> Enzo

--=20
Best regards,
Junhui Liu
