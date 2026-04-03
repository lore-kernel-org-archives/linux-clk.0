Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CAA3B8958
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775222981; cv=none; b=BLROo5RwBbFSamCQMR+d2PJ2Ub8S7MhOQ9J4cfCmvzstYZYkR4dNNHpLNOtMIU4gzAq16BGCEq5YLGiMgkHlQbjMXHl4nbMWrjqF+2NZHW9AItJhzuRf+116xT+Sl6YKnQuNr/x4c88gD8QLjgrALamM0jc9EPWuHYAwK9d2ia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775222981; c=relaxed/simple;
	bh=blHK4KzH5lgN9+DZFvRNfi2lm0KKMuYwwQPYPh1mRlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1DrFvjnD7lUpxRH7xpcd5+5g2Gaeok1PdKvcBwEdW+EJA/Ig5cAUYOG36vFm1QD5KEh7jj2CQpfr5Ddg0BGN0eWUCuOMmrJ66FpYopVPuUMM6Bj8kBr2c6jMib7pG+z+DbW0ZQWZDlzhsKceQB/BtdjBnvwp/rGEmxe1dyn3xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bVd52k2T; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=n1/H0g5l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bVd52k2T";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="n1/H0g5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775222979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D3TgrwVgeoZcZASDHDP/iFsOkmG4q/7olBpiPeQBlYk=;
	b=bVd52k2TjX7B5LBmWygGKiAek45hFxT+YzQ2sg/iDCErJrzNZH7sSuEBoQHXWDfWyaoLL9
	Qp1U+uSNPTsUw+8qIeI2uxHD3F7ZqI7Vq4VaRzatE3xnRsUtWizaJ7TcvS3JYQ/jWmOAMc
	iZ+XUaGCnKPqYFkn8vFaOSHssUtKFvw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-g5vl0vebMbyszX1POvUXTw-1; Fri, 03 Apr 2026 09:29:35 -0400
X-MC-Unique: g5vl0vebMbyszX1POvUXTw-1
X-Mimecast-MFC-AGG-ID: g5vl0vebMbyszX1POvUXTw_1775222974
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5aa81907so35926761cf.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775222974; x=1775827774; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3TgrwVgeoZcZASDHDP/iFsOkmG4q/7olBpiPeQBlYk=;
        b=n1/H0g5l+Wt+UglShP9dlBz56Adl2/J8MreOxAgRdrDVktUgB97yood706NGDaLwDR
         F9ZVgwYDm/xvLjiqq+QiJ1/+q0x0rMmuptfsG2oPjsx1o1Ym0oXm11WLUt2ijgBqJvtL
         ITF1Lc9rZ2283OZGVPbZKJeDM8bUq+5Jnsusefkdn1U6CJpCnQpB+CPo1Cya8KHD9vL5
         xj3xyYbll693OYvMLdi4fIc/pxpeyHyddG8SonEKAnCYBdJU5RkWFASJ3UDZCZ0qK7Y3
         XNIwWl2Sy4nGJVSDzRVT14RudHuJzgy/VePnqmQIprKFcuoTUfM2oM8QVU1W7YW9Ppdc
         ch3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775222974; x=1775827774;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D3TgrwVgeoZcZASDHDP/iFsOkmG4q/7olBpiPeQBlYk=;
        b=iyj8XiFnsGN+kNH83x7uEiizeCfHveqNY5iUCwOF+yqBRoLKKE8cy3QV2GN+kyVgsN
         22fgudcl0NYZZSKwY4YFwI0SK4i4C4PbwNFwWqsQLXkW5pcY65WXT0qbMsHEYmER1R11
         nphUI0vTnEtuc0K+o3mCwvBC8fWC2918xuYK/rr7KoXl+6y7qGcvZ4WJgvgPkUlNuLF9
         SW9drRrHJeO5Ttsk9QsN3VoSTfFqJJBDQzJCC6cTlXYl7j+Z5igaPkcNbboLiua20/aO
         q4NPF2RK5RCOXVEgkNKsKVDQ7lOaEdwO3IRXAfghE/B40CNtEeWUAo6Uf5oye2GHvTtY
         bS8A==
X-Gm-Message-State: AOJu0YwT7bDY6UOvxgou0KS28+pZkYwJyrCsh083bPBXs39Kly1s98SO
	wM0JITppS38BxtaYnVBUhkxJaTCQEUXXRhtosejC9MAT384i439os5uRc0LYhd55J+EilmEDLx2
	yTiWhSpZNVIuV9uNukZ00ld5tDb5/HoVQF5DE+kmhuNEBrxrwWC1HzIC3H1Pcwg==
X-Gm-Gg: ATEYQzy02yWz9LP818SIFVf9m0k6HR0JY7e1WK6r/enVmf9z74rThnEak1EX5COO/hA
	bjYEdMnqNo4z1AzibuB3XIjPG35nQQOkQXWoR22Aj3iM3btHegs8UB+SIzCJ6brFZsTr5wUGK5M
	ElNwnnUG+RVxxBprbaMxyYk/Z4RGJXhgxDSyy42hmfIl1BK17TsUB9boHoRJm6Jqe2R+eArZCng
	zCPFEuQAI178Ftl7kx2nB6IqXpxVBYlUdfjZj24YgltvXU3fu4raU8BIjk5DDF4rk2YV+VmpIOo
	W9KrhGC9kZEtCFDW0/1bUHoYIUkdFOabyrRnDX74kCGPbsX6v8GEfXrSIgWoCh1Dg0P9qBFsqmO
	+HytXF4SUZZlwON8+TD6BX/o5iuk8LCHW6GMyEM/1EsDxiTR7L4andaF+
X-Received: by 2002:ac8:7f88:0:b0:50b:37ff:727e with SMTP id d75a77b69052e-50d62a95729mr48480281cf.44.1775222969274;
        Fri, 03 Apr 2026 06:29:29 -0700 (PDT)
X-Received: by 2002:ac8:7f88:0:b0:50b:37ff:727e with SMTP id d75a77b69052e-50d62a95729mr48479561cf.44.1775222968488;
        Fri, 03 Apr 2026 06:29:28 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d63962c30sm17886441cf.10.2026.04.03.06.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:29:27 -0700 (PDT)
Date: Fri, 3 Apr 2026 09:29:26 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] clk: mvebu: use kzalloc_flex
Message-ID: <ac_AtoG1j_I2m9Ja@redhat.com>
References: <20260402002011.89926-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402002011.89926-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Rosen,

On Wed, Apr 01, 2026 at 05:20:11PM -0700, Rosen Penev wrote:
> Use a flexible array member to combine kzalloc and kcalloc in one
> allocation so they can be freed together.
> 
> Add __counted_by for extra runtime analysis. Move counting variable
> assignment right after allocation as done by kzalloc_flex with GCC >=
> 15.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/mvebu/common.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
> index 28f2e1b2a932..4129690fcae0 100644
> --- a/drivers/clk/mvebu/common.c
> +++ b/drivers/clk/mvebu/common.c
> @@ -189,10 +189,10 @@ DEFINE_SPINLOCK(ctrl_gating_lock);
>  
>  struct clk_gating_ctrl {
>  	spinlock_t *lock;
> -	struct clk **gates;
>  	int num_gates;
>  	void __iomem *base;
>  	u32 saved_reg;
> +	struct clk *gates[] __counted_by(num_gates);
>  };
>  
>  static struct clk_gating_ctrl *ctrl;
> @@ -257,24 +257,21 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
>  		clk_put(clk);
>  	}
>  
> -	ctrl = kzalloc_obj(*ctrl);
> +	/* Count, allocate, and register clock gates */
> +	for (n = 0; desc[n].name;)
> +		n++;
> +
> +	ctrl = kzalloc_flex(*ctrl, gates, n);
>  	if (WARN_ON(!ctrl))
>  		goto ctrl_out;
>  
> +	ctrl->num_gates = n;
> +
>  	/* lock must already be initialized */
>  	ctrl->lock = &ctrl_gating_lock;
>  
>  	ctrl->base = base;
>  
> -	/* Count, allocate, and register clock gates */
> -	for (n = 0; desc[n].name;)
> -		n++;
> -
> -	ctrl->num_gates = n;
> -	ctrl->gates = kzalloc_objs(*ctrl->gates, ctrl->num_gates);
> -	if (WARN_ON(!ctrl->gates))
> -		goto gates_out;

The gates_out label and kfree() needs to be removed.

Brian

> -
>  	for (n = 0; n < ctrl->num_gates; n++) {
>  		const char *parent =
>  			(desc[n].parent) ? desc[n].parent : default_parent;
> -- 
> 2.53.0
> 

