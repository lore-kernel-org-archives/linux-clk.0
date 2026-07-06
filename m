Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E41F24CEEA
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 16:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356577; cv=none; b=nkH/r5upX8dI95Dr++mTzCk7TPLkDMzX4R0ks99nBZSlHbpQyvaovkolMUA/XZct4na7iPPhjwzqEQ7UM/Mt9S1VVyhxiUE/PzwVSo7M8nKTQvtfnlpKV5beVcNAdVfhqto4kfGOdn5CjkwpYFWorNGfMRe2V24VICXE2xeGf9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356577; c=relaxed/simple;
	bh=kC5T2GQ/hKzJfLTuJiUkkzecCpDXTLKQAc2OfD/zLC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tge1tAp95UaREVmkizlBHi8yESYjpE+bQz31b1BpwqSPUcQgVHRcsIEibCySM3GGnhSL1fbFmO4ee1LHlOLpTHamUfMsFfp6MB4y8jBz/JTuIUtuMgqBUV6+VvgO0O8af/5icEBDmOT1jEjzFv7BLeZ+O7/leAxbH7hymglWQQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ORHZrrhi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qWN0AW60; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ORHZrrhi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qWN0AW60"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783356575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PVODOV7aVkPeaDsm4/A8dtDqzDPixUvA4wB/eutpdA8=;
	b=ORHZrrhi+bHKNueJD+O74R4JGDyFx71J2ctzkS0G3JpvG6SS8wAuD9Y2cniVPkZEKiJTTp
	HFnVIK7s3OgivTVzEEdCU+BZDzziIKDI6Of8JXWZjVu3wfHksPfMxKtk3NzVgqlNETCzY3
	w/KPZJLBZ7SXx3OihIi7qIa5B2dUJHM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-fTtnRxzLMBa01cu0Tp95Jw-1; Mon, 06 Jul 2026 12:49:34 -0400
X-MC-Unique: fTtnRxzLMBa01cu0Tp95Jw-1
X-Mimecast-MFC-AGG-ID: fTtnRxzLMBa01cu0Tp95Jw_1783356574
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-806a62af18aso102407787b3.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 09:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783356574; x=1783961374; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PVODOV7aVkPeaDsm4/A8dtDqzDPixUvA4wB/eutpdA8=;
        b=qWN0AW60NUEy83t8qg49UaqTgrkEg9IqMwjF0vtwWzzdU+YikDy9Rc0wR85FaKlxpd
         Iw1+OwgrJ2gqSSGrHuJJq9ezkG/7ujbfJBj18XHYS/zmhf4Pm9rV9A+MfTjXdgEREBQV
         2CKwSeNzlgF3CJSHjSNFz8JlT1DS/sCHkvZFbRRSBMXINllso8elSvD0zaxUSliXvws2
         /cpEP9JuaatfV72BKREyWuN/+iniqpctSnfMoHST1lrVjowj34SUKmFln6xVijy9alMF
         FChnr4xIUciq3jME6JkbZ376mvo30T6Zs5cAKTWHKQRFDO0NJHFx/BeNhRTj1QlCZ2KU
         pnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783356574; x=1783961374;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVODOV7aVkPeaDsm4/A8dtDqzDPixUvA4wB/eutpdA8=;
        b=pLvr/ZhxIHQsEhvutAMNhSwnrgnGQbAKRFXeRuPVye1m2ZfM+eNKmQspdiPiujanMh
         DzT/QaKS9eq4slOrh6GBMpPHR+uirksD64IkbONfG8RF8fp3IAoE0m8puVmp82qNcmVu
         KgQuYQylVVq1oHpcnoGS8XiKbbCu9x9L9sDXEJOCn0UIOLfO/wXR0naRrjb0AlolscBy
         4fLUKNpIvP9Cfz73bLUEC/6N+qc9psjEJu90JsHKmSb1dCSIWaIzwWJPqGl+Ai1rZBpT
         taz+GNPEi2XjI5nFvIIkmaNuIRwbrjAQSTZGTDDSyENN/wRot7UsBqNSE+TnaOn1ON+7
         yJNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3ynaUEIny0srOQtulm//lXTkO/yRqad+L+Hd/V5HiTyFJz2vVxeHvVw0r8Zhj0VAvxoLg2qcJEnk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu6ODGPZo2z5vf9HK171zBVPpBf9QsSVawPFMyXRF56I3RWvvF
	DcAyLzg0250rQReBts/npZKRrYh3KKGKJ8Q2DBCJ193hmdQ1QMPvot89ZYjEugCeZgn6fMMylSc
	H71qNG3btv511I2K1zInZdUaU64K2S2ZbMT0SxyMYzTcv0wxmAk3MWSks083x6w==
X-Gm-Gg: AfdE7cn8Fl7LkK3KYpDlfTIJmbxnnXDWBg21vWdrPj8b5l5mM4asS0l+cSi1gPpaQcG
	KIQzMA2auOAnj4ItG2sSPbGl3Mxm5AlHFr5z3sZrE22wkBxUK8XZ6Rk7FmiP4Do+xeSn19O9UOk
	o0OYt9OjPtxI7hQRwNftCYlIKG2a1ZXobXqYLjgOXoLKJTxy6c+HhVdn7zXGwmj99XfUnMjQQQN
	utGeIJaPjj6Mw+5j1rg/La0aTY9SJl96fM/MnO0sGGOMRnwh5e1DqLlxvzeY4EN/0FB4Ok95sv6
	CpajEcPg1ynBZuJBRC1IygDlcp3ITdBz/xPsR54kHGagbIg44RIp9fqKZUqS9ymIDlKB47UZh4y
	A3dIxoUP+GZi3LwSnE4WVY8by/ZinvEpTsjilds4reRC1Rw==
X-Received: by 2002:a05:690c:62c9:b0:814:608a:acf8 with SMTP id 00721157ae682-81be38b685amr8902307b3.64.1783356573882;
        Mon, 06 Jul 2026 09:49:33 -0700 (PDT)
X-Received: by 2002:a05:690c:62c9:b0:814:608a:acf8 with SMTP id 00721157ae682-81be38b685amr8902007b3.64.1783356573323;
        Mon, 06 Jul 2026 09:49:33 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144783ccb7sm59799057b3.6.2026.07.06.09.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:49:32 -0700 (PDT)
Date: Mon, 6 Jul 2026 12:49:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 1/1] clk: lan966x: Add MCHP_LAN966X_PCI dependency
Message-ID: <akvcmiJtO4LpHA2N@redhat.com>
References: <20260630103052.413750-1-herve.codina@bootlin.com>
 <20260630103052.413750-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630103052.413750-2-herve.codina@bootlin.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Jun 30, 2026 at 12:30:50PM +0200, Herve Codina wrote:
> The lan966x clock controller depends on the LAN969x architecture or the
> LAN966x SoC.
> 
> This clock controller can be used by the LAN966x PCI device and so it
> needs to be available when the LAN966x PCI device is enabled.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

