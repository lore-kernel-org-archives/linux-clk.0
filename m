Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C79F2FE586
	for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869198; cv=none; b=lmJd+D90cZ5kfSN2johQ5tdlthVopmmbdHbz3ibF0RkEPJ3S+ZZCq6tVc0/MHqaqKWUPHyhxhpKPoNDrSJGodp4KV4tylonH76OyNYI0LUyz6AoNkmCjJ8V9NJd45L5CTpGJShD5HafjZL3YEwJ8Tq/fsiYl4ltqyGcA7xghnGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869198; c=relaxed/simple;
	bh=RANV6Gs9Vh0y/VAo+p5yE7zNz6Jq6kT91iEhVGdXL7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1gpWagznZhFcMhJ8M74sHLwmFrzJKt1jhHp4lCd96doqo56mCKqM7ir6vFSEyz1vzLfAQOHth1j3W+Mzx890Ts5OK+bwlIEyx4W+/n4HL77U9jlF0inmE5fNlkUJXgy21jZarlXq78o7nBcbx/FExoJgkDHHx7WCLcxBfJFtDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K/GlXmF4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K/GlXmF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755869196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S420RL60CZZdB1VzGp1TEQ2bkpwHaqIWzRVn6C44bUk=;
	b=K/GlXmF487aTMGebj5udL4zdugqo5EPDOR0RJyCEOBkqmNtjhqA2Nx1kFafLpGRari5Lg6
	vPAvVHzPnWOW/YawXZRdqt2O7iQ39HdFGdh+9sXMAqVWEWUdiSRaCQ4LGuAekj5fuWJAVy
	DByqYEVV8nuF3ahxIapPUel3qsqU9+I=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-nsYl_phDO8COoRO4FHipZg-1; Fri, 22 Aug 2025 09:26:34 -0400
X-MC-Unique: nsYl_phDO8COoRO4FHipZg-1
X-Mimecast-MFC-AGG-ID: nsYl_phDO8COoRO4FHipZg_1755869194
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109c4c2cfso80582471cf.3
        for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 06:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869194; x=1756473994;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S420RL60CZZdB1VzGp1TEQ2bkpwHaqIWzRVn6C44bUk=;
        b=fPB8u3PCRBUy/+Slt0+9J+bVp/thVCTK3FsLui93/mBpn+apm0+CZeTZMADGzpHmNH
         MKlljOChALcejGmZXInWBD+j2V8a3DBOT5yNOrS/IiJEZ8DJ+2ku6IFImQ16PLl264ZC
         4SvHR8F3jvhfUFZkRts6QpNuVW+0CqJj8sPVhj97jiO0ham03MHN4LGXpyMslcO1xPde
         kkLKxNqEt4t8yVBqmzekXsVnYqUjYv9IVOpoWb9DxlgNqd4eaj5f12qL7QU41JwLDH1S
         vgOaS7Hw2lkg5Q9OVIH7DFzWlsSqA7eEN55Jtw74NyamCEj+5GjGh1/1OGcJbOmdBM1B
         xnOA==
X-Forwarded-Encrypted: i=1; AJvYcCW4LST9kHa1DI1rO96ioytkjDXw+gxHqDMsIS9ibwA2Eq1OzYH4SK5ZDj+9ewtC+23ErsVIXfHyWOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR9tsyFt1bSsHIt4F7PdFAq4cfJySdLwVGQ2waob+IFDR8FAcP
	0qKt6i2Ac3jRlnW+p243GsHZZQXhTKw+ozBveitQx0lzFPTy17CFayXaU52aj44ZlMwuBOooClW
	Ro/+7f3MLF5wuDIldtkoPJPy2Kv3pIxZ0aH7ukMMDfx8IQK+uPDFvOhXsdew6gKRptfzT4ijR
X-Gm-Gg: ASbGnct9H4b+DIgJEmv1k3gK1BYFcgjKplRxHKqCr2jKRhOzryrjApL2sn/XQVJ5JGo
	uupKh4ugoNocpD9VXBhaodJlaRqGmR5V+7r9E0MGWmsgoXzWe3Z7UjgNkdzWKCCyXgJkscaOrTz
	J+WwDQTej7b0Xoj7wPZrZXQy69XfHjrv94MGUaKIQheXNHnbOj5qv+ZdiX6k0oMvH8yv54UxpZh
	B8CEew1AzHEk8+OlMTWzJ0/qhkeHGUKdWQWjfvcVnLrTAx0Wp5h4ADQHCHPZpqmA7Cnbznd54V3
	4h8ULOCZe5H/di3WgJv7OoF1KSCmyB8xiF5vyxCAQtRuwok8dkAJfKU51wCixDY4L87uHuXmcEL
	fu0ZyK0zczLort9Scu5o=
X-Received: by 2002:a05:622a:1f10:b0:4ae:b1c9:85ff with SMTP id d75a77b69052e-4b2aaa7dfe9mr37005141cf.2.1755869193843;
        Fri, 22 Aug 2025 06:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHUHzR1DMxxA6MQlfrHhbtm3IrPOrR8xfmuEXbXSQpLFypKCHoC/yBGvnM/QYtIjFKFdfpwA==
X-Received: by 2002:a05:622a:1f10:b0:4ae:b1c9:85ff with SMTP id d75a77b69052e-4b2aaa7dfe9mr37004721cf.2.1755869193335;
        Fri, 22 Aug 2025 06:26:33 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11de15ebcsm120303891cf.46.2025.08.22.06.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:26:32 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:26:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: Sort include statements
Message-ID: <aKhwBxLdOH7R73BJ@x1>
References: <20250814035317.4112336-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814035317.4112336-1-wenst@chromium.org>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Aug 14, 2025 at 11:53:15AM +0800, Chen-Yu Tsai wrote:
> The clk core has its include statements in some random order.
> 
> Clean it up before we add more.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/clk/clk.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b821b2cdb155..2eb63d610cbb 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -6,21 +6,21 @@
>   * Standard functionality for the common clock API.  See Documentation/driver-api/clk.rst
>   */
>  
> +#include <linux/clk/clk-conf.h>
> +#include <linux/clkdev.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> -#include <linux/clk/clk-conf.h>
> -#include <linux/module.h>
> -#include <linux/mutex.h>
> -#include <linux/spinlock.h>
> +#include <linux/device.h>
>  #include <linux/err.h>
> +#include <linux/init.h>
>  #include <linux/list.h>
> -#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
> -#include <linux/device.h>
> -#include <linux/init.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/sched.h>
> -#include <linux/clkdev.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>

Reviewed-by: Brian Masney <bmasney@redhat.com>

Just a note that vim will sort the four linux/clk* includes at the top
slightly differently, however I like what you have better.

