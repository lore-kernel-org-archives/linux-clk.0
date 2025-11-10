Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A877274B30
	for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 16:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762790740; cv=none; b=DvObScjtS2998j9OBvBf0RlusISYEr5d+h6O2bMVR0iOUcgsGtnZYYdkk2vXKRup6+rEInbJaSO+nMtaEzsIZftGEV2FO+QPBJYULoolmwTG3MAULtsAGMytDRncAxWO+lwUCg2xBOpI7Pu6jvSyQjzJLCUZ91fAhi9NWx6zMxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762790740; c=relaxed/simple;
	bh=onmwgzWvrykN1fzVZiejcYemdHDzwD/isE77f44YfsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAZlioBKLgiMzZPvI7Gggi2Fn4IULgYkFQcvJGC8+UilHkqQqAyZjy/21A9ZCfR38eDQlCQM88RZG4APMJdsttX85F95Rw8huuTvU3L4Jp5Cbu93JBG8z0uW0Oox3dAKg5ghzfUc+d/dgkyRqvCIEpT25BiitaecL5vqGdUxKqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjywY3vc; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjywY3vc"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7afc154e411so1861853b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 08:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762790737; x=1763395537; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TgZgArONH6lr9XvODSMICWYyuVWCZCYNoJZs+MKJ66o=;
        b=TjywY3vcQXDoDhOBL2QUPL3GrA9bfCkCgSDkEN0ZkZ6QUTpCX2HfscTf7vUlOejh2g
         yGFpKy7Iv3SR+lxHXIrxE3fIEjJtKsLBe0UAkGofwtSPUihwUfEN0JpTE93NTf7XpPt5
         WjlBK0qsBbipX+zh5dUAy6p/Tn/ay/UbU+vmReprN4QBeRJuPTLHloueGF/yXZd/7fb0
         M2DRdOrSsiyNULogKUUgFr53pA9Y3sIDfURklD0RF5RW6XWY6sLeqa1z1JxBhHAnZqfD
         8jT9emaNuxMfzvFBwLpzcxfSE0/IUWRN5D0MAxLeygtGdoQBGl27tx5cH17RaE1oeBTm
         3pAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762790737; x=1763395537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgZgArONH6lr9XvODSMICWYyuVWCZCYNoJZs+MKJ66o=;
        b=c1PzX5w+5kcvR8mQYDMh9b5D4dl5JM/awF9Rw7LL7ZKlk6GpyyQpvYGJPkuzi+jWgK
         rro4/g2R/Ffxhx3DejgQ9zodoUU8ItIHwCDTVeMcZRdlaK2SUA54lXWIjwD2sUyP2j/R
         pNSkDJPEkDj5M4FmacP6zC06tVD68wxHaxJjZplvuNV30WwJI3vytvI9VEkDV4YvvohE
         uBF5KR+Jw5+r0kzC3RfDwW+J8oz+6Qb75ZFK4mxauQc+LkpmBba0P/VWDLZCsops5Kjp
         h/LsTk5/n+s0czuVzAogmq9gxpj6NLT0d7YJFqxjsQJ2ycwUeRCL9sliwrwMt+u/7PpC
         SvpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiDIt0oqTUKPmhZ2Tk4zek4pPa7sTgvHQUOSQhoGG2mPddXvSfvSY++TACFPQobQaa0q+9QGF49kU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP1VfClHlZKtvM1L1Npzsih2cjmbWlYTA6j+LumNN5NIzrSBsK
	pgHryYLSb/weFJg5uHw1mXxd+uUG2WBg6nuDWqMGIgk50MESHPla8AXn
X-Gm-Gg: ASbGncua5FUHuZSFcuBcaWmxmdmWaTG8q8CUDPsXGDM+1Os3ShrLN5j6minUoBOPdrs
	X5C3eA7o65EUySBwo8nn2If14JdzhwPkk7ppaSEdWzXqdO6aPC/WgtQSl5mD2WozOjpA9/MAnhh
	51OeLEGn1iDWCmfTYBu950Bd2d+jwKjYdfSdn2zMu17qzfTzDJNZgIdHZtnmp8Oda83maZym/qv
	KVfkFEu6RVJYdxps0R7zMdpnOh/8Z0NXjpHo5HA8JGUsHbZ0DbMYuEuRPIKBBHjnPthlWJcJmzu
	E9R6ZBxWB2RSOqklXlxkaP3Ns3ujEkZsTkL51mT2Y9RbKxHw2HLNHtpLhrTV06klaB1MAU6rPpV
	kXqmqxjJeHyhkcSZrTehp1P7iCcHXE1znz9q18WksHk0XLEi0rrJFiHoLJrVoxO6syk09ATjUHu
	HubZxEMJM=
X-Google-Smtp-Source: AGHT+IF6WNNBzThjDgikYB/HqeiGseOlAPwbhWtHTRN1quM7bZZi7LqL9mv+idqwSvzAApOMFvrtbQ==
X-Received: by 2002:a05:6a20:1584:b0:344:bf35:2bfa with SMTP id adf61e73a8af0-353a31550dfmr9952656637.33.1762790736506;
        Mon, 10 Nov 2025 08:05:36 -0800 (PST)
Received: from localhost ([2408:841b:d00:77aa:3e0a:b50e:a68d:6665])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba902207227sm13072965a12.33.2025.11.10.08.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:05:36 -0800 (PST)
Date: Tue, 11 Nov 2025 00:05:29 +0800
From: Encrow Thorne <jyc0019@gmail.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: spacemit: fix comment typo
Message-ID: <20251110160529.GA18666@hailin-HP-Pavilion-Laptop-14-dv0xxx>
References: <20251029-b4-fix-ccu-mix-typo-v1-1-caddb3580e64@gmail.com>
 <20251029223337-GYA1549833@gentoo.org>
 <20251110141251-GYD1651402@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251110141251-GYD1651402@gentoo.org>

On Mon, Nov 10, 2025 at 10:12:51PM +0800, Yixun Lan wrote:
> Hi Encrow,
> 
> On 06:33 Thu 30 Oct     , Yixun Lan wrote:
> > Hi Encrow,
> > 
> > On 00:05 Wed 29 Oct     , Encrow Thorne wrote:
> > > ccumix.h was copied from ccudiv.h and the comment after #endif was not
> > > updated.
> > > 
> > > This patch fixes the incorrect comment to match the filename.
> > 
> > Just describe in imperative mode, see
> > (since this is trivial, I could amend it before apply the patch,
> > so no need to resend)
> > https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94
> > 
> I have no other clock patch queued this cycle, so how about you respin a v2
> then let's ping Stephen directly for inclusion?
> 
> for commit message, I'd suggest simply as below (short/clean, also enough):
> 
> Fix incorrect comment to match the filename.
> 
 Thanks for your feedback.
 I’ll send out v2 soon.

 		- Encrow
> > > 
> > > Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> > > ---
> > >  drivers/clk/spacemit/ccu_mix.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> > > index 54d40cd39b27..c406508e3504 100644
> > > --- a/drivers/clk/spacemit/ccu_mix.h
> > > +++ b/drivers/clk/spacemit/ccu_mix.h
> > > @@ -220,4 +220,4 @@ extern const struct clk_ops spacemit_ccu_div_gate_ops;
> > >  extern const struct clk_ops spacemit_ccu_mux_gate_ops;
> > >  extern const struct clk_ops spacemit_ccu_mux_div_ops;
> > >  extern const struct clk_ops spacemit_ccu_mux_div_gate_ops;
> > > -#endif /* _CCU_DIV_H_ */
> > > +#endif /* _CCU_MIX_H_ */
> > > 
> > > ---
> > > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > > change-id: 20251028-b4-fix-ccu-mix-typo-038c19fe30c4
> > > 
> > > Best regards,
> > > -- 
> > > Encrow Thorne <jyc0019@gmail.com>
> > > 
> > 
> > -- 
> > Yixun Lan (dlan)
> > 
> 
> -- 
> Yixun Lan (dlan)
