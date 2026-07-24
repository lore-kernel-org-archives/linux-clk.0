Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EE9441636
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 16:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908872; cv=none; b=kA8P3IT6V14SFkBUaD/iH7TKTKM02SeOPNAMr/WXzYv5IsjpI1hr8aWQbIWvrPKBCR7GTRtibgnKKnEWnSqfh62+3xCdRuYa8DVl7Nr7AaiwwdFHxm9RrBV+ldyfhpucXm0acAoQmHSO/D4UHkXVkFdf2+R6AOQ42ZhRwlxtaYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908872; c=relaxed/simple;
	bh=Fn1LSFnvcQPwl+OpOHERR5ed7+JefDQcZI+Vfb0q8B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoWyejp7UbMgUwT5yWeszMxjNfFQtEefqEBnmvVdozTA5bQKoQPhOuw7cfZjSN5n5Te9yYko+9C098K1rymF7fFN/B4TNvnbBSkQUjS6ZA+NFJ+SrDuhghFgLieFl1ygBE43aOCLBHhM0TeyothLEiCIlrH3U/iBwhgFjn2q6pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V2Frpefr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CwpGYZlk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V2Frpefr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CwpGYZlk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784908870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+bkEHSp7uhvmCp1vkWRoofsHVhKJ4GQ+rCHfCWSCHbk=;
	b=V2Frpefrn+laJxjo6xBnC18ic/k5lWGyDo5ps6ABJ/QP73yoEuUnzhT6Yue2OAkKiU/7qg
	xJNDYSEaRFg35/wYHhd3nep14QCuaf+9Gbih2Pr94vkGiYtlfJTrTVwrQZrR0H3+oVxpGz
	TdJwnoNDEXCKU16Iyvgic0N4OM9zTG0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-fu4tWmNwOs-XTz-oEcxgVQ-1; Fri, 24 Jul 2026 12:01:08 -0400
X-MC-Unique: fu4tWmNwOs-XTz-oEcxgVQ-1
X-Mimecast-MFC-AGG-ID: fu4tWmNwOs-XTz-oEcxgVQ_1784908868
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ef13b61bcso101128785a.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784908868; x=1785513668; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+bkEHSp7uhvmCp1vkWRoofsHVhKJ4GQ+rCHfCWSCHbk=;
        b=CwpGYZlkDgp/G3ngl+mG2+2XfhgnlD2VsR4dXhGoqNYtYHFgdkOTZjuVTJDNAdhRR5
         bJI2jafyYPXtoIWaEwWg+3N925gprqVeMKDuZ1sk9X57zChF5rzZvAbMom+k2JDEhg8Z
         6C012rbygPKFEV6jEeUn0blJRcR/ofpgZ9nwXBGAVvdPhsRxsmrNNVMdF3742MLylyDB
         hKAuVDTaUNAgb7kPg1sJqfqCacxyWigD9pab6YGwI2bzRD3+9c7QCCUSSvIrBhm1HaIl
         jHTcfvqNoJKR/eC6o+/Ucpb4vyxE8gh/UCzFLfMiPPvBkFBy7kO4m0uQYQZ6LTWWYhhr
         C2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908868; x=1785513668;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bkEHSp7uhvmCp1vkWRoofsHVhKJ4GQ+rCHfCWSCHbk=;
        b=G0SaMdl/se1AuELPXMceBVJ2g50UcoDRD2nBjYFk6sQXXRLbt2qgFJtT3BilTW8SyN
         YudMF+rctk/fLW5Ncz5Jxm3urV/D/x574Hvv+k2o+Ol4EokzjcOIMm9u4zJ5baJNndSC
         iJVc3lZco0iQ0sg/OsF2u5OJ7WCKdikxcUbUF76D6AUcacpgHWHHIviBS+ojIEEchFXa
         vaHoXMzvGN0xEwmxICnjc+vLGQkXt0fq1FB+gvtAzXL72ot/jfAoH0F7Mg1YVzgOOyaK
         YHChdvM7UPtmJIXdzGJTodbEV4Z4xWYHzBcG1Y6AW2HGwCYErswZOJ6dnPbO+QoBTaVT
         l+vg==
X-Forwarded-Encrypted: i=1; AHgh+RqrUuyr2ySJRWrsUms+eO06bY/O8XLXohVYR7O/QphqRAsj06k3t3W50ubrhOC6G1lvjGGYyPoyhdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVXvtMJCBmDDFe0+5Y8LdVATg3QVcnC2NPjVJ0zlXHlNgdyYOr
	RFesSsJ2EBPvpI+lXZRPSnKoSzZ7DAmOpnR5ZXg3YJtM+Aml6rAqBKSsm/U0LdhV+b985b9DtgU
	pzWQ+RB4iwKS5WQYus+3UwOufAnSsaw/o6l7LeIFHHxPanMZ+Qv0BswzO6K3GXg==
X-Gm-Gg: AR+sD13bmMwg9vRUByM8HwxXw9IS/jqzfcrdicpGt7vBKi+vWaSmPCm4orKJt4VXjpR
	e3fn2ICN3zvWYNzd8PZPsoKUgz9OKltSLxwsDkGPYwxR+SW9l8RZ3qv1vkPZK7z9lMNu2d0EE+K
	Vp2Q+nMdJko4zFH0BZ/6R79J0PAgJuJ/vSycUMZdlAdwMf49xEU3MYH2Z5XDSWn8Wih22SSuKbQ
	rd+26uhl0WCg5kvTIco4GpomLrKULNguNBEKk7v7vrgakoqF2/LwR8oDWY4AW2/xI41QHZvyAEv
	V22fq52JyOhi4AIiVQeWvVkbgilNr6S1+WlsvYQPfiuD9jQJiOzW5bB/iq4eO9gYXyqyPNzaAQg
	rU5n8bUcIMeEpmBTRhxZJ73hNONJgwT834kY=
X-Received: by 2002:a05:620a:4706:b0:92e:7c0e:5912 with SMTP id af79cd13be357-93103aee644mr937768985a.56.1784908866917;
        Fri, 24 Jul 2026 09:01:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4706:b0:92e:7c0e:5912 with SMTP id af79cd13be357-93103aee644mr937759585a.56.1784908866130;
        Fri, 24 Jul 2026 09:01:06 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a0371asm684521085a.27.2026.07.24.09.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:01:04 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:01:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
Subject: Re: [PATCH 08/12] clk: composite: Export
 devm_clk_hw_register_composite_pdata
Message-ID: <amOMPmn1fBE1gGoe@redhat.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-8-a8b8679d215f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-8-a8b8679d215f@oss.qualcomm.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 24, 2026 at 08:00:30AM -0700, Luo Jie wrote:
> devm_clk_hw_register_composite_pdata() is defined but not exported,
> preventing its use from loadable modules. Add EXPORT_SYMBOL_GPL() so
> that out-of-tree and built-as-module clock drivers can call it.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

FYI there's a separate series for the UltraRISC DP1000 SoC to export
this same symbol. It depends on which series Stephen merges first gets
in.

https://lore.kernel.org/linux-clk/20260720-ultrarisc-clock-v4-1-fe639d63bbac@ultrarisc.com/

