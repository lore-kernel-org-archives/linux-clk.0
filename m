Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BCD27464F
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 20:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760647958; cv=none; b=hmBZy5ttJL/2jJMLjzU/6+CCU7urHmQ7HaWpe9Hb4X1YYpBEplfK7kAcceg1CFUk6igocXf9RiReFN545GKeOawy5DOTbCLQvG13hrd0p3c01yuHyCGADCRC8XhTno+3DFXVFdiJMDA++5K8zpUS50KDliPRU4gc9ui3SQveI/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760647958; c=relaxed/simple;
	bh=PU/TdxNHBz7m/8QSydcfpOGU6UIjKJsiLDtqA4s9uLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Se8Twmj8bnUO58KdGgH8cEDukjb8HOMwvSad2fzbZ6d+0svLhpXe2Z2qpjXbLAsGR6uN6K0/aO99oaktWmcRhf91oW8mdMbJyZQAUMA7OBnwVx7imJkNC247qLxOeyeQaTR5J/mTKRU28mmVs+tKErqzVF/KkCP94hS4Zk/Jgm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LdSJQzpj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LdSJQzpj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760647955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/cKRiSBHedJeuF2YiPC1JdZMWW96N+8/8JV1od4hamE=;
	b=LdSJQzpj6VonGYUkTxhD6cg7fx6ksYNMBWqfCoJxDsrxiYT3bMbnpvJKBGU6RMq5xMZTUM
	E5G4qHRdcNT+6dqMw+2O6QDXOnAtL1hxcFaZuHsI9Noy22zpKysZMbTQE1RjKGz3e8A35i
	hjddUnYxW0Up4Ihq3FrHbck0xWBRplY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-2_vhe8jjMOCEVAZW99NOnQ-1; Thu, 16 Oct 2025 16:52:34 -0400
X-MC-Unique: 2_vhe8jjMOCEVAZW99NOnQ-1
X-Mimecast-MFC-AGG-ID: 2_vhe8jjMOCEVAZW99NOnQ_1760647953
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-86df46fa013so530071985a.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 13:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760647953; x=1761252753;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cKRiSBHedJeuF2YiPC1JdZMWW96N+8/8JV1od4hamE=;
        b=e2VAgkkGhNZ/YrX6caois+B/cPL31uohHeXq1MYAysqsNm7t8fJFIoINkAfLjtFSOf
         HoKzr3um0lHEsI42E1Ggk1HIgcORADgAbSKnp/1H9In9S/gp2taWPXWKqvdJAPtEfk/m
         6YCJmOzZo5IAktMxzjGCbQOdBnDqm8qwkRNhHAPtNZnlbaA6JXge3SiTVmkv0SImObf8
         a+rvnHJeX50uSDKYyuVFnwGAm7obQaL7nFhVh0tnbAjkWM5lUzuV8V1WHvdSyROgG+PH
         7vY59W8XJjvGuyxMt3YrY97GySoLadDWtnzJeaFNSVqt0mgaC4drMQDRzbzyANwUIqJb
         OUkg==
X-Forwarded-Encrypted: i=1; AJvYcCVfxFF1/+43Q8afpav0rVXss/imgKDQnMYf6/6zrkzSJHWj9SIg+LpOXKM2CSA1OawxevAc0Ba1yhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbJAHabARlNvNxW45FMRV9aE8B1156Hy33+x6I7VjJPkpVyaU5
	qBAjcI/HmOlYlo2VxDIBKooHHr9S+IbVqqdhyUQlXoOh3F6E+YQMgKCo02OQ3RuO3GUbaundTtt
	QBYvMcNPJXHGDyWVws8MIRxJwMsxcgP/uE7u1FVC+xavBrlgDW0F3XoLARtQU1g==
X-Gm-Gg: ASbGnct5JA9LuIfVd3h+/RJEth1TOj9f+wpCp+J0ynzS58zNIXtytcGNhF4A+/GgqLJ
	0JUbIZlfqV7gxrLbFnSiAkX+ZnLnlJODBklzDf8aE9e2cH4hnp2YewsaRaiFbjpImRrsQoJ2z3/
	spN+6XR0xjyffWAZPkSxri9KSD+W2T9niLTDoJgWZD76s0T9TplPzFOT4DPmD+phk23ZmiTTAEA
	bXPgkOfqeFCIVSNMZZHWUh++JlxjOTjNVeWJ+olpg5sFHRZRMw3hZfCEvZmKJ77GKu+ZiWNfstt
	q09uEx0+MOW7DdaXShdqszhFRLd8co4gICSPLQXch5ZJEZ5dmHJAenbEd11+P24h0PBx5h8QoXs
	YQZjn099cfMELUBQ1qMV1kkNopEFTLnWCMtv1uQ19r2hKPigMmamYFjAjK1/VszZ0MQ==
X-Received: by 2002:ac8:598b:0:b0:4e7:1f00:2ce8 with SMTP id d75a77b69052e-4e89d281865mr19862011cf.18.1760647953511;
        Thu, 16 Oct 2025 13:52:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHATwA2Ecq5ayw4bx1RtADAqnB2jb/OZrDzGJ991Q3kxbxfK4bp4SH8V/S+x7MWZzR6YqvEcQ==
X-Received: by 2002:ac8:598b:0:b0:4e7:1f00:2ce8 with SMTP id d75a77b69052e-4e89d281865mr19861681cf.18.1760647953054;
        Thu, 16 Oct 2025 13:52:33 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0120cc36sm47970366d6.2.2025.10.16.13.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:52:32 -0700 (PDT)
Date: Thu, 16 Oct 2025 16:52:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Message-ID: <aPFbDl_JKyDay1S5@redhat.com>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <20251010-mtk-pll-rpm-v3-1-fb1bd15d734a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010-mtk-pll-rpm-v3-1-fb1bd15d734a@collabora.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Nicolas,

On Fri, Oct 10, 2025 at 10:47:09PM +0200, Nicolas Frattaroli wrote:
> When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> operations, such as setting the rate or switching parents. However,
> another operation that can and often does touch actual hardware state is
> recalc_rate, which may also be affected by such a dependency.
> 
> Add parent enables/disables where the recalc_rate op is called directly.
> 
> Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents enable (part 2)")
> Fixes: a4b3518d146f ("clk: core: support clocks which requires parents enable (part 1)")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/clk/clk.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf360f0618a4a382fb51250e9c2fc4..1b0f9d567f48e003497afc98df0c0d2ad244eb90 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1921,7 +1921,14 @@ static unsigned long clk_recalc(struct clk_core *core,
>  	unsigned long rate = parent_rate;
>  
>  	if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
> +		if (core->flags & CLK_OPS_PARENT_ENABLE)
> +			clk_core_prepare_enable(core->parent);
> +
>  		rate = core->ops->recalc_rate(core->hw, parent_rate);
> +
> +		if (core->flags & CLK_OPS_PARENT_ENABLE)
> +			clk_core_disable_unprepare(core->parent);
> +
>  		clk_pm_runtime_put(core);
>  	}
>  	return rate;

clk_change_rate() has the following code:


        if (core->flags & CLK_OPS_PARENT_ENABLE)
                clk_core_prepare_enable(parent);

	...

        core->rate = clk_recalc(core, best_parent_rate);

	...

        if (core->flags & CLK_OPS_PARENT_ENABLE)
                clk_core_disable_unprepare(parent);

clk_change_rate() ultimately is called by various clk_set_rate
functions. Will that be a problem for the double calls to
clk_core_prepare_enable()?

Fanning this out to the edge further is going to make the code even
more complicated. What do you think about moving this to
clk_core_enable_lock()? I know the set_parent operation has a special
case that would need to be worked around.

Brian

