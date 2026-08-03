Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8693FDBE8
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 12:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761969; cv=none; b=A1lvlJxLK0m6ZOuRT29+fOH9QeB20KdyRsB1QBg/adt2aN7GUeEaZkxrZoP+Ld0BojyAmvBlgaIUByBQwhqIgl/LuKaliOUtT+deEYk8j6uOSI+SwK2LMIrPUpV6t1K2083HKAkzOtQcdDP+ZBZnmF3ONCH4+FT748S6cg3Zz1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761969; c=relaxed/simple;
	bh=R3tlCNpmTwBj0yKhAIoalw5DgQcVtLN5bYuhBmyCoM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5Tpevj5rvcaM3h1dfbqpesjufG+oPicWhKQ0J2kDi+43+Xpd5UNaK8F6YZ/gvUlvvjyzrH6M6bDjHPO4hhgkucBecowOIHd29R1eIc/H3rpmzC5HHjKuw6aQPDqOffVdZASCPhcJXl9MTb4dHfjQbSw8l2sKNCktqO0DV/cU9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U24hMzx2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=neflrMU3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U24hMzx2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="neflrMU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785761964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vyzXCjgWOyXuqJ0/mqD/AnRKkls0LW3h0CWtAPFpsi4=;
	b=U24hMzx23e2WG8ZCmby+zbHMFlrQu3z9Ah4zgo8lk2NucACd+iAw/cSv9Toy1JNoXO5wng
	bePC49FXVN4vLu7AUtTrv/vsgYyk9s8hb/geYxL8pCnBSlK18OifGr1sSQyfN2yNwmqEz7
	jaCEuTIWUhhzIZEPtSSjGEi5hdkFBtk=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-ve9pvHe0OLq8VuPw0ep6bg-1; Mon, 03 Aug 2026 08:59:20 -0400
X-MC-Unique: ve9pvHe0OLq8VuPw0ep6bg-1
X-Mimecast-MFC-AGG-ID: ve9pvHe0OLq8VuPw0ep6bg_1785761960
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81eedabbefcso113040047b3.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 05:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785761960; x=1786366760; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vyzXCjgWOyXuqJ0/mqD/AnRKkls0LW3h0CWtAPFpsi4=;
        b=neflrMU3HoFkB17VE+QZcCVrg8Vd+26zJ74FJfD4mZ6/SNkRf4ZyiddzONiXWV9Jvk
         frr78A3yS0OmFbn3tDme5cItCiRfceV3ul+LJtBpH1SrSwaTlJ6FOe9uXWEkZ1OBWsTI
         fTn2Wv+D1m6v9wUl4xTopnpaEpSwH0So/okDI/hRpeuI2X+KZt6mEP56GtXCIYChQxPm
         zF8b6B2mDOMjPFncTBso+Lo54YMgVyp43VhI1JAaS5Uz/5r3kULd3jXkSNjS8j2S/2RQ
         cb9AqMvpJaA1RmBW+E1cIWwd6f5UcQ4UeC9HCIBVHbH8iJR/H01Vnw0yEpPHD5vRCi4q
         gVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761960; x=1786366760;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vyzXCjgWOyXuqJ0/mqD/AnRKkls0LW3h0CWtAPFpsi4=;
        b=KMWDRH4iwNxBi6NqJmIqDNVXQNj9NlukYUH+0z9atnjD7LyIE6QMRqDwZZI33zW9Z+
         SIg4sHrVcOI/gpdDloSWlr55YZxtNZk6xGqUmkPPMMxNF98oVOjXx9UEsV4d18pe77W/
         cuSJScXeXwuIB5nnAmY04/hEmfMkyWgtRMe00x75AO41k5WVltT3QIBDn+CoU/Vk1I4y
         EpQMcWtXE4Sn89RFY6ru0piWJfRwoC7YQZEYkDoADRvClQ0+yqV5mRUnet1vQ5TS3fsL
         gS/KHrmQ4Wm8BAZI+cTMlXIP7I7issAbXlEW04gXvQcV3Bg6dpi5R+VxnEEn6fwBXPzc
         CCTg==
X-Forwarded-Encrypted: i=1; AHgh+Rr26jj2nI5XIVK5HI+hoBfhXICNPOtlv03m4vlJYiLuXfd7OGxsknnu3XxsrqeuXS1hXeDF77WCL0c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1SceJrdnx0+fyyRo3JALvtFI+XYm8kE1I9z4GSVeBVD2EKX+E
	D27bIPlhrK0hevdqmMaXcSEgpldqS82zn3TmkovTqx+ZdlKM6nI2hs+pZnF/Mto/gbw4OIic2W6
	bzWPnk2lgh1/7aj4CIIzfmjCy3u3iDwNOs5zwyv+D7Qw2cyz0FFC9iEzYbzzzWg==
X-Gm-Gg: AR+sD127Wi9tmHRHkKHOfAHibW98whL6BUfZaGDi5MDJ/cVsKaDV+wUBbWubIw5FttH
	EDbdB/Fb1eonOjZxKwPM86rJOMaw3drcUSpCuOQ/VWsXADYetDCIbF2pcSgUYLQ2ylqkK2vmwiV
	g2O84bgWRqTZLplYBQ9YF5EWnoWZLm/JkoeiMkbZ6GvratbIw+vEMldel9D0N6tSTqXDkMXhyRc
	xJBTMXubQpeB5Cq7shjaPq2RqR5qwdnoGLfaNpfywoGBkRrOU5F1KWTrFdyDsgZmC4clWFmWSLk
	5rtnLhFNkE3umQg81TvHGCxufHfY8fOt+0ga4yAYokvXZWlB5odb1Y7U6VTYg1FnW/iqy6cWpeO
	bG6Ckx31n7Z15FkWMqfqh3Bix5EPjers8MHk=
X-Received: by 2002:a05:690c:670e:b0:81c:c77b:3546 with SMTP id 00721157ae682-81fd4b5a1fcmr127824487b3.21.1785761960057;
        Mon, 03 Aug 2026 05:59:20 -0700 (PDT)
X-Received: by 2002:a05:690c:670e:b0:81c:c77b:3546 with SMTP id 00721157ae682-81fd4b5a1fcmr127824077b3.21.1785761959385;
        Mon, 03 Aug 2026 05:59:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd1240d6sm53683327b3.40.2026.08.03.05.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:59:18 -0700 (PDT)
Date: Mon, 3 Aug 2026 08:59:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: zynq: pll: Fix kernel-doc after determine_rate()
 conversion
Message-ID: <anCQpAdZI0jg-KAe@redhat.com>
References: <20260803063126.7-1-bbnpreetsingh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803063126.7-1-bbnpreetsingh@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Aug 03, 2026 at 06:31:26AM +0000, Babanpreet Singh wrote:
> Commit 1547747b55d5 ("clk: zynq: pll: convert from round_rate() to
> determine_rate()") replaced zynq_pll_round_rate() with
> zynq_pll_determine_rate() but left its kernel-doc block behind, so the
> block still names the old function and documents the removed @rate and
> @prate parameters instead of @req.
> 
> Retitle the block and describe @req. The Return: line described a
> frequency and referenced the removed @rate; the function returns 0
> unconditionally and the rounded rate comes back in @req.
> 
> No functional changes.
> 
> Assisted-by: Claude:claude-opus-5 [kernel-doc]
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

