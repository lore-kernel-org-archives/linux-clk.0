Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5D25339F
	for <linux-clk@vger.kernel.org>; Thu,  1 Feb 2024 13:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706794784; cv=none; b=Bo9p4VPx6/iKr/Po1E7UFuOW8sQfAoSYjfyqex53/QVrhBC+SDwgvVcApeuocn3I1wSFgPMkpu4jlsN3QL+tTFyB65a61GL4kEphFLJ8LYM66GyMZXVfzv6OD9YuV9nbleZbvih0rdgvaB7pYOjgBL4A3GMxgN2bNciR471AtBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706794784; c=relaxed/simple;
	bh=oKW+ZvZ0W8r2/eWIkuHxCK05oPWdP3Q3wRGNCB5uESc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USCMKNa/t7GKsv6yWPaA0+glOzRnj17Cb9nzwGmTmFWAqETgfZTx2EH9v3NDTtn3dZdXWSQK+yiycU8EzPE56y8jLmqlhAfhgM58w9VY/cPPvhs71wHlxTDxQaamGgnoRIOm4n0iIitJ1qlv7PcFm3UNpTbBBlTUErywij6N8Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yV7H34b+; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yV7H34b+"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411DcgEc115765;
	Thu, 1 Feb 2024 07:38:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706794722;
	bh=wUltm4O22TSdHMMQQnjm/lr+r7KNSZZ/mmQiwWRdgo0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yV7H34b+Xtv/U/aWMv5ChtNoE1oqA7QKbh+RSf8xibF1w2r1Hc2ejTyOxU3HuyC8p
	 4eKHW6ylJxyfDRqQ7LEt5YIuVVAtVAYNkU1BzUnXAqwMoUgYFzp1tsaQQEg/M73WTj
	 m4BBdihQ0FR4TFel1bI6ONuZQg/mBkCqJgVBmGVE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411DcgJ8024036
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 07:38:42 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 07:38:41 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 07:38:42 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411Dcf18124265;
	Thu, 1 Feb 2024 07:38:41 -0600
Date: Thu, 1 Feb 2024 07:38:41 -0600
From: Nishanth Menon <nm@ti.com>
To: Sekhar Nori <nsekhar@ti.com>
CC: Bartosz Golaszewski <brgl@bgdev.pl>, David Lechner <david@lechnology.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori
	<nori.sekhar@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: drop Sekhar Nori
Message-ID: <20240201133841.qcerpmyo4xwc7zxu@volatile>
References: <20240131093434.55652-1-nsekhar@ti.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240131093434.55652-1-nsekhar@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 15:04-20240131, Sekhar Nori wrote:
> My TI e-mail address will become inactive soon. Drop it.
> Add an entry to CREDITS file for work done on TI DaVinci
> family SoCs.
> 
> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> ---
>  CREDITS     | 5 +++++
>  MAINTAINERS | 1 -
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/CREDITS b/CREDITS
> index df8d6946739f..11d918e0fb0e 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -2955,6 +2955,11 @@ S: 2364 Old Trail Drive
>  S: Reston, Virginia 20191
>  S: USA
>  
> +N: Sekhar Nori
> +E: nori.sekhar@gmail.com
> +D: Maintainer of Texas Instruments DaVinci machine support, contributor
> +D: to device drivers relevant to that SoC family.
> +
>  N: Fredrik Noring
>  E: noring@nocrew.org
>  W: http://www.lysator.liu.se/~noring/
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c4828ab15f1a..f74ecde541bb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21945,7 +21945,6 @@ F:	drivers/i2c/busses/i2c-davinci.c
>  
>  TI DAVINCI SERIES CLOCK DRIVER
>  M:	David Lechner <david@lechnology.com>
> -R:	Sekhar Nori <nsekhar@ti.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/ti/davinci/
>  F:	drivers/clk/davinci/
> -- 
> 2.17.1

Thank you Sekhar for over 2 decades of consistent upstream focus,
numerous contributions and helping set the essence of working in
upstream @ TI. Wish you the very best ahead.

Acked-by: Nishanth Menon <nm@ti.com>

I am going to assume this is going via Stephen's tree. If there is any
help needed, let me know.
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
