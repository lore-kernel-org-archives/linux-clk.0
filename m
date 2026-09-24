Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AFC48C408
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 20:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282595; cv=none; b=Pee2qp4KUkkMCc68khIeMWzWEoDi4PWQVkHYAqZpzRI8lcmNZrcCRSg1uZHwew2VzaM830Ke0v3YOR17nkYPos4EohOoe4gROKEytw/8a/Mc8O0zM+lHHJ6J9Xawo2koaEMttCUy14Fl78ijdrUQDW/piltLfNw6DQCig7qb6NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282595; c=relaxed/simple;
	bh=n9qJKZgIWNT/TpycfMHGX84Iy61PGMLpE6exJirYMEY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kryfX93L/GZcHPSF6hD7c+lGHgvT7Dpn8+gDj39qOr7MuCzhT8/lHoiPY0RD724bBQsWutADG5L+Fjrn1Or2IlcqZh5/ggQdcz1SlT91Uww+tz8zCC/E46Vi0wOdlNLEm/XH08RwkX5WLLWIOSfIhulfkXE0n8LLmzpH1VFrYlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MEeNceBP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sFZf7xZS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MEeNceBP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sFZf7xZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790282581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5CkCEyDQzgVPhkiN5y/9tLvwKtrY/6iZcsRbiIgpyDQ=;
	b=MEeNceBPPZnUpntty9CHv9ydWeB4qdTLG6mLJCMfkMlyc4Bu1NuN/S5Givade6N8nFdWPs
	kOiMxr5zv4AbSyJYoHfJanYXiCDnP2Ljesy1zvhH7qAY9pq/T+Xim1Q5Zp2HGp3mCWkDKm
	j4o8iNpQIfx/3oQSsExhC2veEhEFJxk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-t2t5uRE_MV6hp8Z0ebcLkQ-1; Thu, 24 Sep 2026 16:43:00 -0400
X-MC-Unique: t2t5uRE_MV6hp8Z0ebcLkQ-1
X-Mimecast-MFC-AGG-ID: t2t5uRE_MV6hp8Z0ebcLkQ_1790282579
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f925ba4eso41128885a.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 13:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790282579; x=1790887379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CkCEyDQzgVPhkiN5y/9tLvwKtrY/6iZcsRbiIgpyDQ=;
        b=sFZf7xZS7PhuGAZ6Ei1Ts0bLnqsZ6UcxPGaM4s063LM3ghc5GgkD1Y3tDZ2kbt49Jx
         C0/CnjUj5z0Dj6AUv4Y3yxpbNaaKNBFYyoQ6zwWC9cfm4g0pI0TVGdgb1Fx5VxTvKUz9
         Gi+igF9C4u+7S9B6/AH9x7u3jDTKwqwgdFcjoMKwv96ImyHBkAkEMX4C8A3l5DV+v/DI
         nGvsxqr9x5j+TRT9egc3oNT3cCer0apsD1DCWVCqBKaHuTD71v7B0myy9Ox7yur8Cr7U
         HHj9szlrKX/Dk8a9ouUuC1j4X3iUBXsnYAwcmpSBoDeKEbXPqKx9jggftUPTRPiSvOMf
         g7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282579; x=1790887379;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CkCEyDQzgVPhkiN5y/9tLvwKtrY/6iZcsRbiIgpyDQ=;
        b=r3QIxNaukVaLInKfX//31M2wl+ZCTTFhDl4zoXBJ8SNmOb9sjDtDOQT0kGZssDXDgG
         5EHaUJE8bIqb/sFLqqxuxvIZBtrwy+MLN8XW6WaGUHufp1BTSgbGIKJFjsW36oxSRZIM
         bxMBhzPBj8U5Zju/MmmdQvwvuQL6UTwZbJVKXTr4HYvBlXnwhc49dIm66VDo3cZDgxTJ
         uHk5O6N3nzvWDuHWc3iWGWgvhS2vr1Dk3epQuNXeNUxSAFyxZlwUkIZUkHrEY7Kofno8
         hOjBsuolRgwUJ2aJP1kocdkypwGQIJp2sDGtReK7Lmch9svEFSmaUcU3pMGYvkunoA2z
         PhEw==
X-Gm-Message-State: AFuF++mYfB8W8Zw016ff5K8Gtn5DwFzwNGu0IRHkhJHxnhj/u0FvYPzw
	/8AelK42AWwgxeCuiS/eOXCwjhxQYUcIrB1xoF4sIxLh/8ef+wSd8SUB7YmNIqkUzVTCYSTLg42
	znyiMzvBZ7g6BLmro/303dBuLpHCWSM0wZ+9hJ5nyTjA8Hew94ezRumzKoXpV1Q==
X-Gm-Gg: AYBFou39h5Z6PLqz4+PFSFSc44YgQ3Y9YwqAz9hqzGTqaC6tRWWmTKfSJmIX7wV5azF
	dEVTy7OChaE6lgQdcAoTO451ZDCtWtnMvyDDbswWKlVMyVSqfq5vbhFJOqDOlS5QJEsinlAPbGb
	ECKmwdZbbtuubtMaqw1te0XD28irQ3ZQZAjmn4nzv0qqFxriGwbfN7KzgBjCBY65x/jMjvj7jvP
	fjbzTIwoCbO6ItQgM/I5Wf4rHSs++yQTSMg5VczgT99C5FXQixMEKfeChEhHObIJUuNFCuAdqlU
	btVOjV8jdFvXAYZrnSsK35C6N+pEW10MebCSw1r1RblapSO+YFlpgVPDHUIrzbXGSbe1T2h3hDH
	wS8qnDLh57nzWc9caUrXUnpnAMSKIPzsfsssW0PtJ
X-Received: by 2002:a05:620a:4105:b0:939:707b:ec10 with SMTP id af79cd13be357-93c43dca32amr84393985a.52.1790282579378;
        Thu, 24 Sep 2026 13:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4105:b0:939:707b:ec10 with SMTP id af79cd13be357-93c43dca32amr84389585a.52.1790282578743;
        Thu, 24 Sep 2026 13:42:58 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448f544asm20179885a.18.2026.09.24.13.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:42:58 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 michal.simek@amd.com, shaopeijie@gmail.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260909131412.3051635-1-shaopeijie@gmail.com>
References: <20260909131412.3051635-1-shaopeijie@gmail.com>
Subject: Re: [PATCH] clk: clocking-wizard: Fix overflow in clockout0
 divisor calculation
Message-Id: <179028254070.218801.10108489974991747895.b4-ty@b4>
Date: Thu, 24 Sep 2026 16:42:20 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=346; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ux0dnfgDZkR6Z8fYUi+Fxf86Gv4PesUYUmg9HR0c0+I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK2druWdNeVsjhcTFkw++OthhLWw76nt+mZX7pac/xz/
 BIljQq9jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaiasPI8PbybOUNfYFKXWYf
 jnKcbRRLcS5raNxo9tZ4vaPRg09pXxj+B4r9sLGosJnw+O3LQx6ZQdxfai6cMWVtOrh9k986y0Y
 9bgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 09 Sep 2026 21:14:12 +0800, shaopeijie@gmail.com wrote:
> clk: clocking-wizard: Fix overflow in clockout0 divisor calculation

Applied, thanks!

[1/1] clk: clocking-wizard: Fix overflow in clockout0 divisor calculation
      commit: a1d0465f027d341c6855324a5c63e54780ce20f3

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

