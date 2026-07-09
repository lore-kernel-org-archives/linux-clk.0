Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EE721E098
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 14:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607294; cv=none; b=VXJz+AXsT5FJb4muHtCi32oQS9U7ECB65rLYjGaa828cdMuEcW+SQ2r0guiRe/8iwnKNhzrbamPosAnIud/g0mRr6a8JbTdoQ33OssvJhdtcxaWsT07g+ScAEWwDsxS+NkW+8NGItF1exN855fPVG51ULvV6haok35UxIGymqGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607294; c=relaxed/simple;
	bh=PgUeHneBxAfToAshr4h3JMYv/lZaBMB1tn2P/BKrqhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPX+scNvNxnI+11HgSxxjqQqQ+f3azRLsMJyA3uuM5li7wvwhTFw+/L7uFOO27ixMnAidWZy027BTm9ze/a4axwNJTSlFPp7JJVhvdSe+uG9iAzQ1Xk5Hiz05IIHRLYTYof95MNHglXJmBgtSF0nT4B3+Hax85jFIF0GnazM+k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jTjzgptw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=krMgrhtg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jTjzgptw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="krMgrhtg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783607292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=92JJ36rrwvvb7yLlV9W9rV0xnJPT/KBmVXI1YNHLk7c=;
	b=jTjzgptwPo20f9zD7f0S9uwQWmbqDBjnYzNBwkMSWoLfWn/OhaJvNvzzffNfpZiMFPiPXA
	/ASFojpjyIFs1/DbXAd5dA2vqQ+Dh0mT5waEYkGFMHzHwVo4teWNOLKxqPRB64F24FpHez
	RAgI11AEJJp8RfEY9s/k8INxalFygFc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-xSGb0xv7N16fGfodsII63A-1; Thu, 09 Jul 2026 10:28:08 -0400
X-MC-Unique: xSGb0xv7N16fGfodsII63A-1
X-Mimecast-MFC-AGG-ID: xSGb0xv7N16fGfodsII63A_1783607288
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e7ee64b25so286102885a.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 07:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783607288; x=1784212088; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=92JJ36rrwvvb7yLlV9W9rV0xnJPT/KBmVXI1YNHLk7c=;
        b=krMgrhtgg99JnjZEuGUQQWlW4YlJi+2KY3mz+PM8lyccdTbQLQu/eoPTZuR3vgbkOL
         N3jVMxNvIsfbK4uId2Om81UQFY8aUIE+BLjIq9kNkdHOtI7QZ6cHn4/r8jdQ/fppLFU6
         2Nw0bX6nZs152M3lnmlJC1UP7gKjpSA8oJtZSIYc7FskcyAWcuSyurOBMvivnzrTwT6P
         7GFyyJgpC+byfAzZ0C72VLWIGYlPnPCuOrd+QP1677uj5aazT0Ic4CnMqSr4Ta/aLluU
         9dzxWhfP0kLOfVMd9KmHH5uwEaNo1AQBIH8ry647JKLXVpIk0umoYGdsDAWmfepRcC6J
         BGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783607288; x=1784212088;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92JJ36rrwvvb7yLlV9W9rV0xnJPT/KBmVXI1YNHLk7c=;
        b=VBV+iqp3LffJ49sFzzdmcK9s9yCntGxE2QdhnThpf/V+FL0flrclYJDQ+bL+nNN1RH
         d8M+BuYj3yv+c2aY/15GYpYNL1uMj7sB3YEeOYIshxiC3dHtZfLtrMb9AtKx5eDr94cJ
         nyOEVdaQ/jS7vIIks/HX7L15hV5Mdhss22Jx/7CMhkY2ix4U85PNBn/MDIZRkjnNmsjX
         3yjVNgQRlbRrHUeXKeVIJVmiQ6EXqV4oFn/z942fUyoG93RHDdOQR4kBQb0rwRvPFpiN
         EvAzPJTOyApUrvr4MbSaA4tHLS6f0WByRJ4tu3KawEBYgUSN+x1K7ezyy9gZ4IWzjp33
         fbQw==
X-Forwarded-Encrypted: i=1; AHgh+RptzY0yiVvnc/NPoH80OwVyvwDSIf7U8PdRhLbMlJ4QTMPMboywzFxu3LrLiciWFPOeVs1soVzDm0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNMOzERt/yhFShw8JcSUTmqdxh6pSFnzI40yqN8AM6BENeTzk3
	A6eXC1KHs+1jJImqO6S8wQr3mwvu9qyRN0kOPPwgvv16N3PbTpSeSLCrN6H780RTm9+rNkRsz+c
	GEuY16vKlZan8C43mEg0r4XqHbYw3Yxro7Js6KKnXwM8HpfieGjHNkN8omf7hiA==
X-Gm-Gg: AfdE7ckTU0oAgY4/RJhxaY5CYSWSikJbs5JZHShUss6fd+EFvyTdC/5R+Xe3sQ1wULI
	vMvKX89m89K15OGd3/xxMNzaRhfznVHICfnS/qx1T0lbHZdbsG19SSn5bh3Brm+y2NWDwTm76jq
	p9LRTrT8klk305Zb65s+vkoIZ22AAGyDCzE/eNoAK48879K51FoMqG+C6rcn9npO8BSPIaPI0il
	DEoy1QHPOelBe8FUYgu6YVWO1Oeo7Rhxs+Fc9MDLm/xjCSjruQKB4P0WBwwdfadzxiXPKQzeY5F
	LDac5ClZzZGj+iREflFL0xNXLf/tFrTzY4SE9e52ZOwTtdg2JAWS7mD1anVNnovGpZkmTa+s5/8
	sa2BvxcnXCAkbaIEz2yDPUMRJ50gpTJn7YiVwKisF6U/byw==
X-Received: by 2002:ac8:7fc8:0:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-51c8b399047mr79250311cf.5.1783607288345;
        Thu, 09 Jul 2026 07:28:08 -0700 (PDT)
X-Received: by 2002:ac8:7fc8:0:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-51c8b399047mr79249991cf.5.1783607287938;
        Thu, 09 Jul 2026 07:28:07 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41d2cde7sm173167731cf.18.2026.07.09.07.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:28:07 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:28:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] clk: mediatek: pllfh: Fix IO remapping leak in
 register_pllfhs error path
Message-ID: <ak-v9MPymB4rg9rP@redhat.com>
References: <20260709-clk-mediatek-pllfh-fix-v2-1-a235078fe9d5@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-clk-mediatek-pllfh-fix-v2-1-a235078fe9d5@collabora.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Thu, Jul 09, 2026 at 02:23:00PM +0200, Louis-Alexis Eyraud wrote:
> When mtk_clk_register_pllfhs function fails to register a PLL, it
> unregisters all PLLs and cleans up itself in its error path before
> returning, so the function callers don't need to do it.
> 
> But contrary to mtk_clk_unregister_pllfhs function, that does almost
> the same sequence, it does not free the IO memory mapped on fhctl node,
> leading to a leak.
> 
> Fix this leak by factorizing the cleanup sequence in a new private
> function and use it both mtk_clk_register_pllfhs and
> mtk_clk_unregister_pllfhs functions.
> 
> Also, change the loop index start value to avoid the -1 operation on
> index at each loop.
> 
> Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

