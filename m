Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFA0430CD0
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786382579; cv=none; b=f5DLQ7vwyZjhEg4Kj7Iae5jwW++gDBljZtZ5QfktQmd6zHlFkwu9VCWAMTJT3LruiUD/nxO0GPqio8XTBmkMtPYwkgrk5z4O4S3KdG9rxWilyV9RxYO9uV03BBWcSgjDcmZcUCFQ5RkdPBlOMkmxzNmi16yMZpzb0Ka3AzY0guE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786382579; c=relaxed/simple;
	bh=8gWEwUfsO3F33rc5Vr/t2TJpJxPQT4ef+ZgW5fdDpk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/ag3WlaMuUgLm0lvoRINBmFbL42Jd1A//07be0VjdEqdMeoaIr1IaYCY5N932p5C6ED4MsESw+RFhga/NhI5qa8dBe8z2ZaqvkEBj8d+T4accGqCSd3CPXOn2MXnxJb+yACcFGQR3B3XVdtPMdmnlTDxPbaAHLreQXqrL5Cr5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E2n3Qe8w; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MDXTH48a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E2n3Qe8w";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MDXTH48a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786382576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=scdHE3f1gT3tI1szOZtkMdShahjFVVqLG8G2E2kb/84=;
	b=E2n3Qe8wIJQhZS27N99nOIEwobd5OHY5DVhvFUZFSdC+VdkLquJYCeEvDGJ9WSjUvBTXof
	2avMiPJGX4igGevSorI/TB2Vfol3eNNW630mtxUdljvD6O3PXHbxW0cgttYoJCpcFYvslI
	vs1GIcwhVGymKX1ks40LlbJw66uOWO8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-RMY5CmS5M-2AOCUWaum6GQ-1; Mon, 10 Aug 2026 13:22:54 -0400
X-MC-Unique: RMY5CmS5M-2AOCUWaum6GQ-1
X-Mimecast-MFC-AGG-ID: RMY5CmS5M-2AOCUWaum6GQ_1786382574
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81aea53d559so51762757b3.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 10:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786382574; x=1786987374; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=scdHE3f1gT3tI1szOZtkMdShahjFVVqLG8G2E2kb/84=;
        b=MDXTH48aQ6UhqSgqDegVF+Oiwy/odGrUx4dk5PpilLiRC9HIVCg4Yv3460G5qZQEO9
         Dv0WbDtqg2x5P54QuykjdCKMGtENfEsNQoi8iXUjExfUpMr41mw4VdnND6EECNNUarAh
         sNVqSxO8IPfdbZNuMDnNVdBM3GVjDGVnKdv2GTDO22vQmhnN6+OdCif6WeTjC7vdyqB5
         bAjZkT+AtqMkl2r+4Jk5/XoN3TZjQOSd0fZqBkaaOaHEQcp6hJhOXEosFtw3om4n+DwI
         oMNUU6B5h/N/ZCWVz3MUpAuDMjSxxZHxX2Keo14ZPtruHhwTK7F2vEffRu1ogmR531el
         sOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382574; x=1786987374;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scdHE3f1gT3tI1szOZtkMdShahjFVVqLG8G2E2kb/84=;
        b=HFoWXs0nZ4oK5lp3hLV0VvGzVXFU4+eaA6SYcnSKmcOXQuD8aDADitxkEl8sVVcTFS
         TJDYSOGd6YKgnQzdJT9QHB3P3qE/pCdGYNpAnqw2zTWFvXhO3aPv7ECJTHzoMV1qbeaV
         aE5J3cTFBXjAHWHdEz8g2wURacpHyZUlPBLApoAHzDnC5Zk1fCSPKaI4E6Z4KhcjGNmv
         +jYghySpa4hVebK86wqLUlOP1o7SW2XOIpxFiYfPvII0fuCsjM/Mg/vIQL+SCcGogZ2N
         UJZYJepVRPhbLfPf3/rCPEnHgibDlYU+JJTF0whCBwyHqWbLhk9FjB1EX4Vyhm8KLj8D
         C0Kg==
X-Forwarded-Encrypted: i=1; AHgh+Rqb+4KKriI0jG5/KuhX1AQ52e2QV0LEVCzwtWDLyPxHGAn8VILpO86nQMmRt/7c2dJ+ZmZqRhTHeUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2qQp9YXti6kWX97nbzGGD1SqSkdkl/h3ajPQSisJeb6HfaCV/
	v5wNUHm6pWYuU06iGLhCA4KUaGFzMFQFEKM2vyc/f0tZKC+bu2dr5H4yWOygQyZcWfgSXPVHZFJ
	uJanW5lWKmWa5AMlOA+A+E8abxinkaHTB9XP60tk9tGE0h2BUuYE9pZy600roRA==
X-Gm-Gg: AR+sD13S2zsflLYTDOAFCyBSvG6fSQMtNq6I3H4fqkiwSZsLplaKtH13sFPi9Xr6c6e
	lLrDguCvi8TsX/Nl6DWtBSMS/30P586K8VaW5znxfKHDVSz8pZFMFPJS5RjDiY8dW3gdyICJojv
	kOt4T71oDXcbkfw/IHEgDU2iVe1qaf5Td2u6aYBELzYIq/Pdn+iU/qhqhaHwLgJZZOlWnPCxoMY
	tNNSZ8ha4Xce6ML+k9uDpDPAY9s72RXkF0FcJy4yejIhbymgWwbLwKy8JzrsUtPXlDUQe9P8awP
	uxkI3bHnl/0cnQ7oa+kyZkNKC9ml1LVzwn5hLV60lyZF0rMd08yPtcpqwT9YgZP8EAbUbXkxAac
	DPJ8A91JtnE199TWwAEj7aKEb/+LHb5VrN14=
X-Received: by 2002:a05:690c:f06:b0:80d:c2cc:f673 with SMTP id 00721157ae682-82d2a8c4531mr20803997b3.20.1786382573957;
        Mon, 10 Aug 2026 10:22:53 -0700 (PDT)
X-Received: by 2002:a05:690c:f06:b0:80d:c2cc:f673 with SMTP id 00721157ae682-82d2a8c4531mr20803727b3.20.1786382573576;
        Mon, 10 Aug 2026 10:22:53 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f577c580sm60710857b3.27.2026.08.10.10.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:22:52 -0700 (PDT)
Date: Mon, 10 Aug 2026 13:22:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp-lpcg: fix runtime PM cleanup on error
 path
Message-ID: <anoI6eX9OzI0bsFy@redhat.com>
References: <20260808080215.2669452-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808080215.2669452-1-lgs201920130244@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 08, 2026 at 04:02:15PM +0800, Guangshuo Li wrote:
> imx_lpcg_parse_clks_from_dt() takes a runtime PM usage reference with
> pm_runtime_get_noresume() and enables autosuspend with
> pm_runtime_use_autosuspend(). The success path drops the usage
> reference with pm_runtime_put_autosuspend(), but the error path only
> disables runtime PM.
> 
> As a result, the reference taken by pm_runtime_get_noresume() remains
> unbalanced on registration failure. The autosuspend setting is also
> left enabled instead of being undone with
> pm_runtime_dont_use_autosuspend().
> 
> Add pm_runtime_dont_use_autosuspend() to undo the autosuspend setting
> and pm_runtime_put_noidle() to drop the usage reference on the error
> path.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 18cdbad40c6c ("clk: imx: clk-imx8qxp-lpcg: add runtime pm support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index 1dae3410ee99..262645bef62d 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -277,8 +277,9 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
>  		if (clk_hws[idx])
>  			imx_clk_lpcg_scu_unregister(clk_hws[idx]);
>  	}
> -

Don't remove the newline. With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
>  
>  	return ret;
>  }
> -- 
> 2.43.0
> 

