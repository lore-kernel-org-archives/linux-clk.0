Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EA14028FC
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 14:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200231; cv=none; b=cwZYtdY0X5ReAIFB+Siin+7cAMZYGr0vVOu+ycnesIIalSQk77rcWgVwiTeaZwcLUDSwqySiBIl/JqUvF8yu4674LCUE2TVtwljOXgXXdK7eBvXnQd84G7kFMy4/Kvrrekia2N+9pKWUtUjfH79igqCO8mc8PQvm4ne+s814JnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200231; c=relaxed/simple;
	bh=JPEGfwYDm+wtJBdtPNA1uHSSeOC3hKxmFQdM64SV/Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4rbcx8ViynF9vb2V82Hrd+2JGfxhen3C5lDZnjIZSQpVEubct5eAfaYsPs7LldRMAYAkJ5lRkkfDyOY41j4OMiJ8OZ7XvbyW6VGj4xwtKhybj9cNiRMfts5s82O+zWIlj2A28ZJrgbT7oaYW52QCD4nphZnkn5TRFzPSssx0WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CGHAP314; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X4fbREXZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CGHAP314";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="X4fbREXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779200228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WrmbyndpK9nGCZ/GyDIT140wuqKj2glshGplDtAamKU=;
	b=CGHAP314J65Ktpwz0rttC1pmy282ctuU4EzgaR76EOfOJONXBoSGr/6GDNQoYpNaoyYAwe
	QBz4SOeLc9RuNyNrxUF36Dt+YPFjxXORnxhv+ETdqjAGuToMRqctN/WTlj9Cj+Tx6i0i6N
	7PmeS3XK8XpqkYO646R3w68eEHSKUrY=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-MHjBIye8NFax_loBU7aHNQ-1; Tue, 19 May 2026 10:17:00 -0400
X-MC-Unique: MHjBIye8NFax_loBU7aHNQ-1
X-Mimecast-MFC-AGG-ID: MHjBIye8NFax_loBU7aHNQ_1779200217
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dc41904354so10616774a34.0
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 07:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779200217; x=1779805017; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrmbyndpK9nGCZ/GyDIT140wuqKj2glshGplDtAamKU=;
        b=X4fbREXZlQVU8+TDpaaA73Kf05V1pl5fcluQSxAj3lEAXXd9JstEDQKCdhmqPgkhzd
         FJXw0M4xOXKtKo0Mg3/tTCmJUSgcHiCsncm6WHffhCBOwk4Eo4NRcRYI3RF3EbxV9gpb
         Jum2CqvVphO4ClkBChQR3w4t8Vfi9bbfQJrnuFmcowZEdlccNVNu9JF4q1+EylDup013
         r6JWO4YQ+SNVNA7G+n2oou8gxjD0f8pWfRynLDfp7x+qb0rDx7kUFP7AkCAYNZzHgP8R
         Frq1MIEnvrOZLIZqV/SkCOynhWDMEjt1s9LDA0zGDFH8Z2vFh+CQ1wz54au85OoRkakx
         /QDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200217; x=1779805017;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WrmbyndpK9nGCZ/GyDIT140wuqKj2glshGplDtAamKU=;
        b=U8DuG3iWFpujUV97Itwr2GMlcaakxF8dVfuk8HPE6aDxF9hjfjXM73oswpHvZUGTSx
         IX/FqIZOkMzsN1luzUOO8QX0pKnVxpLmokTT7NCf3nYbbcYPViV4wQ8E388v6AZMrCQg
         sPTMqSV7QzAARMs9FBefcNoise4PrlfCPt2b6ccyn4KkDamn7P0bGMPkxDBeZ/ZF/Qmc
         LxpQI3DM+1AWwkbDgHVk37EkUWsrkpkpIrzcBKesEq/xk4i6BgLhVRt/0T64UrCbFGqe
         iNFlOMnxoQiBm1wIiUfOS9ZE5Ljzb4HmdTCAkVvXZczm3TrznqXgTg5BH9i2tRAx15m+
         4thA==
X-Gm-Message-State: AOJu0YxyssEWLvrOttWHTpufu+Bdxlu4znGe+lfy2tAjhneuSIpqf60W
	gDAQ5cXWgzSVUa2M6FEjrQUsRjLYz9h2Z6vZxrdXEynXtdZTBZ0MS5VNQ8cYLwH07sSkJqoZjJD
	ZTCvgoqQuuX1usJPagVy1tPhTIhNzStOSItERm8v5unISLstd68Bh/ySUFLGlng==
X-Gm-Gg: Acq92OEqtCzHL/Ss4++lGW9T06o53gYKLB1hRIzoD+PEEspplIXPKBvlZdUa2hYQgVE
	2unL/HsP8UzgkjFgNDoHcMF+C2SaX/5V87uMUPCt0d12/HlwN/5hUWHesWtXzN/MtvNUvLdhWZb
	cN/mhb3lcJEnl8uSeVo42EH5qJM4fqF130rEBMvYU3f/v0n0rEvgzVbE3gIgxFwazmvYk5E82d4
	E7+7zPvIUOh5adtiMmrL9UAjA7pUrQRxi5Carsh+M+41EiAcN5P3ZkDIWGseAzTsuDV9Vh23VML
	g+GreCXX08yGVYF7Mb0d4B9ZWOzMxjc44CnBJghocgd8uR3xsLNCZqY5q3sJJSuZeBW1rPoPqJK
	JcEtVbSL2bRj0+ZkRZ9lqzVheULq/vfAKM3J0Pu6+cMeZcM7Ud8+Fzej4
X-Received: by 2002:a05:6830:4704:b0:7dc:e090:68a with SMTP id 46e09a7af769-7e4de651649mr13481225a34.0.1779200217225;
        Tue, 19 May 2026 07:16:57 -0700 (PDT)
X-Received: by 2002:a05:6830:4704:b0:7dc:e090:68a with SMTP id 46e09a7af769-7e4de651649mr13481185a34.0.1779200216870;
        Tue, 19 May 2026 07:16:56 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51645856d4esm163498791cf.27.2026.05.19.07.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:16:56 -0700 (PDT)
Date: Tue, 19 May 2026 10:16:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: Use of_device_get_match_data()
Message-ID: <agxw1glcXB2fpA-s@redhat.com>
References: <20260519003950.626727-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519003950.626727-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Rosen,

On Mon, May 18, 2026 at 05:39:50PM -0700, Rosen Penev wrote:
> Use of_device_get_match_data() to fetch the RTC CCU match data directly
> instead of open-coding an of_match_device() lookup.
> 
> This also lets the driver drop the of_device.h include.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> index f6bfeba009e8..a3cf0dde05be 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> @@ -9,7 +9,6 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
> 
>  #include <linux/clk/sunxi-ng.h>
> 
> @@ -353,14 +352,12 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
>  {
>  	const struct sun6i_rtc_match_data *data;
>  	struct clk *ext_osc32k_clk = NULL;
> -	const struct of_device_id *match;
> 
>  	/* This driver is only used for newer variants of the hardware. */
> -	match = of_match_device(sun6i_rtc_ccu_match, dev);
> -	if (!match)
> +	data = of_device_get_match_data(dev);

sun6i_rtc_ccu_match becomes unused after this change. It'll use the
table associated the dev from drivers/rtc/rtc-sun6i.c.

Brian


> +	if (!data)
>  		return 0;
> 
> -	data = match->data;
>  	have_iosc_calibration = data->have_iosc_calibration;
> 
>  	if (data->have_ext_osc32k) {
> --
> 2.54.0
> 

