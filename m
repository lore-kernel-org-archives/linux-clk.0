Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95013F4103
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167901; cv=none; b=TIPYu0tCfGhHaxcsp9nAOsX+IlWI1xVp92Hdb6Wfv7QQMB9C8aDe+zCR1Z+94dzmhiY7jO7fsNBSknLW073ut8L6TCiITMkK4+OcgUzGQxCQNkaqCRQELL4/i5qcdwjQMpAi3Yp42sf4diNPcGoIhIA2AIVDu7J+5eE9cF6q6+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167901; c=relaxed/simple;
	bh=iCiarSCuW3q4ChQRODnHqSxkIANQKGTG92VF4M6+0so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WjNuPYfLqQGX/mLA+rlyg6VjeNKwrwnAA0+371n/+/Ezn4/hZFHjho7MJXYDi5VqS9KsmvAt4cbTLx/GtK8/2YBHDx0eJ1dXHFJIo+n1IHQSW2pXxa51zA6kNoK209NUlwBafyxc+mlNtC9vAC2PVikXZPaHc05G/ANwlymjRO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NgTJald8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=A0uqysN+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NgTJald8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="A0uqysN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785167898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mFdWPVxbPSNgdFlp1FXPzOluFs4XWj1Cw/g1oEMc7zs=;
	b=NgTJald8r+ZmbjwtQW5uxGNj2RSLVeG083vI1y+DBJYBrXCg2IFtGmK9biywpupTS2SNBJ
	/RRgQRShT71IZCZoIUXfMlZVp7nhbXyKw3opD22YA7bD92vhJARFClcEnM9bXevaOXDBUp
	/FLahjCm6aXfWHydzaDC4QyXhkgsqb0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-EKgQIPXdNHy32LQF4yaUDw-1; Mon, 27 Jul 2026 11:58:17 -0400
X-MC-Unique: EKgQIPXdNHy32LQF4yaUDw-1
X-Mimecast-MFC-AGG-ID: EKgQIPXdNHy32LQF4yaUDw_1785167897
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e820609d9so282299985a.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 08:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785167897; x=1785772697; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mFdWPVxbPSNgdFlp1FXPzOluFs4XWj1Cw/g1oEMc7zs=;
        b=A0uqysN+DdL5I3c5Bp+UdFY6uuPMVj3nx+XS2NjB9YOXMiK/4baoaFtKKjDQ1Ad678
         bx2w9vowrFAW2xrN4SJWqZstBN6Yd0xv/swqpn3FidsUbQcwnVLCyngjLvOHIey2UkG7
         Twvpgh9I/dmAsipSJ1jpnhq35MmIAHQAKpD+7Bu2QPNaXUpiY//XZelyM4kDroGAfM2k
         jyZZzDwpCv/iuPgzunwMB3/Q0VzM2yFVK9KOf/UJ4cbvXxvzMObQBFEOwk6SwCW/y3hE
         WRqiqrKrIrZDS/kFOEtOJCULpml4oX4Xha9JYW/TQRLbsZlCI7LjoQ+Xdpdya8Ngj/rM
         YePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167897; x=1785772697;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFdWPVxbPSNgdFlp1FXPzOluFs4XWj1Cw/g1oEMc7zs=;
        b=fEJhdMFa8ggqgIgKxfce8D6val5zGzVZMhFKo7bVK2xKjEbFHM+IarsArHJWE3Dphs
         m6qgOfdSBoRCA6dIMgfD5UXzi9mCMZwywQoz4hHnjoA3LcfG9zNHI2PPAnOkb7a6+l8F
         4szwMOU4cSLyx+c4Cw6CQXeqjI8DW+pSiCzk6RCOjnskZdnwujai9Z1t+/luVpcfxPuX
         iu3IPyp2ncSgqnY3+1ShisgbmyPbXwfmGShTNHmpWycFkNSkHZmYWoRyhfgyX5bTzgMd
         eiX9xZdEqsVZoGiq1jhoWhdF+gdCd76Sd7Qk/C10FbJXdUyA+JrVJWpR97NfciK0M6ps
         rpDg==
X-Forwarded-Encrypted: i=1; AHgh+RrfUQyN5GEqqwjmRVnfRLzNuDaYVT77R9TFh0WpFWx3xrt9VubnZsJ97Tk0MfzLUedchU4MYXW1a1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV2pV1xV5BhapZ3Tyuv/9AhJf/Dj0bMz3dtLnrsjcDV8heScty
	skDea3mce+8OmSMGh1uDVpepIzVjQAVQwET9xv2ssmUCrA1hZdMSkCiSy5ICtDVp2AJ4ZngMmAR
	7JYAlyvtXQDbLrI+TBRwMKcWI2lwgjjY/2IrPf0LeT1DWlIu7tShO7o3wXV8PKQ==
X-Gm-Gg: AR+sD127Gvl28Jl32IllWj6OAJlkEY4lx7hh7g8x5gaQZmBgclmhBuiHSvuZlvtsLIP
	CE0k+UgLZ3rx7fv8y9VcfzrwJ9Y10YFhRZySMp+3pi5UQNRE4LHv9ymk2SPuByvtfoLq7StsXbX
	1pXhwaJFG/6+GomnTV78CXuQkr3m0/C2ZFICbEgqy27d0ectFbaPufISZdGDS8FkaDiokJ3XWIM
	xz0/R6CD4Lf1zz1bOainp6MlmFoJqrNzjOJBqz+twydFkhdnNN0GEjQ4sBNmGKNszVpqArMvaXr
	nkR8Yd71d5JqsykWYa1B2ozN4iTCmvrzGWske4eHOfFJaGlgOc9k2tVjG8iovG7PkhZ0HkiAtqW
	YV3SuQMMS/nKTUkbPWL68ydptImnEdNHirs8=
X-Received: by 2002:a05:620a:298a:b0:915:fb92:d599 with SMTP id af79cd13be357-932df5d9720mr938361385a.25.1785167895887;
        Mon, 27 Jul 2026 08:58:15 -0700 (PDT)
X-Received: by 2002:a05:620a:298a:b0:915:fb92:d599 with SMTP id af79cd13be357-932df5d9720mr938356685a.25.1785167895425;
        Mon, 27 Jul 2026 08:58:15 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de519154sm656292785a.5.2026.07.27.08.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:58:14 -0700 (PDT)
Date: Mon, 27 Jul 2026 11:58:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: bjorn.andersson@oss.qualcomm.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, konrad.dybcio@oss.qualcomm.com,
	mukesh.savaliya@oss.qualcomm.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com,
	Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v2] opp: Use clk_get_optional() to avoid leaving
 opp_table->clk as an error pointer
Message-ID: <ameAFGDhmmu_gYmo@redhat.com>
References: <20260725-fix_ptr_check_on_clk-v2-1-7f269f7d33f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725-fix_ptr_check_on_clk-v2-1-7f269f7d33f3@oss.qualcomm.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Jul 25, 2026 at 11:58:22PM +0530, Praveen Talari wrote:
> _update_opp_table_clk() uses clk_get(dev, NULL) to acquire the
> device's clock. On platforms where the perf domain device has no
> Linux clock and is instead managed entirely by firmware via
> devm_pm_opp_of_add_table() (through
> of_genpd_add_provider_simple()/onecell()), clk_get() returns
> -ENOENT. That case is treated as valid (the OPP table can still
> have entries sourced from firmware), but opp_table->clk is left
> holding ERR_PTR(-ENOENT) rather than being reset to NULL:
> 
> 	opp_table->clk = clk_get(dev, NULL);
> 	ret = PTR_ERR_OR_ZERO(opp_table->clk);
> 	...
> 	if (ret == -ENOENT) {
> 		opp_table->clk_count = 1;
> 		return opp_table;   /* opp_table->clk is still ERR_PTR(-ENOENT) */
> 	}
> 
> Consumers that only check IS_ERR(opp_table->clk) treat this as a
> valid clk and pass it straight into the clk consumer API. In
> particular, dev_pm_opp_set_rate() calls
> clk_round_rate(opp_table->clk, target_freq), and clk_round_rate()
> only guards against a NULL clk, so it dereferences the error pointer
> to read clk->exclusive_count and crashes:
> 
>   Unable to handle kernel NULL pointer dereference at virtual
>   address 000000000000002e
>   ...
>   pc : clk_round_rate+0x3c/0x188
>   ...
>   Call trace:
>    clk_round_rate+0x3c/0x188 (P)
>    dev_pm_opp_set_rate+0x114/0x33c
> 
> Rather than teaching every clk consumer API to special-case
> ERR_PTR(-ENOENT), fix it at the source: use clk_get_optional()
> instead of clk_get() in _update_opp_table_clk(), which already
> translates -ENOENT into a NULL clk. This documents that the clock is
> genuinely optional for such devices, and keeps opp_table->clk holding
> either a valid clk or NULL, never a lingering -ENOENT error pointer.
> _opp_config_clk_single() is only wired up via opp_table->config_clks
> when a clk was actually found, and every other opp_table->clk
> consumer already tolerates NULL through the standard clk API (which
> treats a NULL clk as a no-op), so no other call site needs to change.
> 
> Suggested-by: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

