Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6D851A130
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753247; cv=none; b=kb47drP4WgBPaUhQYSZEq29Jxm1Vc1D4Ddz9M0CEkR/aj691YOamuM6YCq8GBX4o63t7173NVdK4lODiC+EbbBemtDGxeT7kop81JOkdKltTdwYmOV9tQXfsUx4ro4Fj+5TYQMmHU4nIo/l3xLdXhhc5ohqj+iwBsw97hAI0nnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753247; c=relaxed/simple;
	bh=tukjza51ngGmnD3n2gVCf+uBLCZRkX8un5dih4QbPlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBRBqkJWiZyYdrShdVYn+BL+97lOxYFAMHwJRff+KwEEoNeEcKEl+WC0XEPeTGQb98r3t4dPAuVpj48AdjIGw/GC2cnRj79Je6pDd1sgDu8/+fTh7z2JCeO8dgENpa3jFjD6UGltnbKecXdnNefckDLsazZ3iLE0itMQNgCtXTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PeLOd/sR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gGjbTdMl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PeLOd/sR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gGjbTdMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789753241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UtUsYSimD6K1xLItLoYKB1WWd1TCjyyOy2jIzUuov2s=;
	b=PeLOd/sRL7GULnMiNpZ7qPE5TWcO4K2wfPo8LgW9HMvJ/12IBnAhnDyupIOVpKLcSfsAur
	ZqQPlP1gaZPuInhtHvy7hBx7QGqAvpO2CUbycDEeA+kVoap88mjWHWZQErM7H2VwLCA/Vf
	4VygqW9RChGNeohTLd8yf49MV9oq3ng=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-QGkSkXKhOV2JU5wLgbz-fA-1; Fri, 18 Sep 2026 13:40:40 -0400
X-MC-Unique: QGkSkXKhOV2JU5wLgbz-fA-1
X-Mimecast-MFC-AGG-ID: QGkSkXKhOV2JU5wLgbz-fA_1789753240
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530f968ccb3so14600631cf.2
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789753240; x=1790358040; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UtUsYSimD6K1xLItLoYKB1WWd1TCjyyOy2jIzUuov2s=;
        b=gGjbTdMlpT0CU0bWuHlyORmE6bmeQ5mQCHHtXpj2aMkRA320Wqeb/Kx809yKMOPCj7
         DDT1GlCeXRNA4I0Indfo9AgNrR7cib6A4Mr/03nnxUBU9pwhxgbHZNYG1GMT7DN4zMi/
         09dUkBqlxpnKhagJjpCkidTZ27sH8BhlJ+XFrAwN0Lyt9sCN7Gv8Y1zRP/Pe0FgedLIX
         H4b5SkteaGcQi6ei5XMok9oKqt32DBH6/rZxt9IHdpAW4feojp3iQSIHwS6fI6iRpA0N
         53kA7nGlTf944mJvoTlNT/Ddy2Dm7VDqGeweIMCgIFZW0HrE4tZ2jwfhs3tJ4GFKxHAY
         5Mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753240; x=1790358040;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtUsYSimD6K1xLItLoYKB1WWd1TCjyyOy2jIzUuov2s=;
        b=V9p3wLG1NWE90319EfiB3VBih1g/GlIMDD7UYg1Z/+RDyrXGYqJSRVivCxDza7vbz6
         zw43auqSfB8/55hQmSuUt0iHk2PMNkApoNVWhbS3/tbJw2AwOVXOdzKDH/HqtsJ2Z3rC
         IywGQ0M+HMzxg4DyYj7d3nfZJi8YexSz7Qo1oUNQdcFKv+1qzeE6YRv2FML0JJhxjuVT
         9Bpw1kYRiO80wcsZN5BHwv8Dt05JlT5PwLLT8JoexZOZqvp0pd/csNj6XbkFAd3HC4jo
         r5P64un/jQSHCVY4lUT5kG/h/TAU4lZ7jDADvRCqN+oAy5xQqV/FjWH0K+51YA6KxuNj
         V3qw==
X-Forwarded-Encrypted: i=1; AKwUvBxGis5kk8DIVmHIWi2rSrvEVTWTcaQmn++Ytnrxme9i90DDCkdC73lTJ6hZrFoK/xFlxvHjYFD5+OA=@vger.kernel.org
X-Gm-Message-State: AFuF++laG4eWq3RPJlss1YccUSSMpvL2FLo+VedzCpOJ1p+oqRkobJXx
	GYMhA85JwcS9Dnu2kj2r7E19yezmAL/qnTleyDq3mX0rVHYcRSmHoDBDw6RB1JB9ZCbbSR7X0F0
	ZGq4XnDHT/vTD6UUAtW+RolHwIT+Z5ZDHCvcvUTkF4zf/8nVkoaRMXXA9KLjP/Q==
X-Gm-Gg: AYBFou1hPYfHlUTuv4Ldq0DBm+IONJZyfY1gYzYCF/mKjoY7W1Nx0gYMLBVlD5CrSsZ
	4l2THnOgTHZ3nFJ254V17gb1TWQtH/TU+8nepmMozDG3Nww5agTsj2xXWpLPuz3SsK4KbTOw3D6
	S90hkrF1I7xuKpxtfHm2NVkvIDxpMks6Zt6n4qtmlarkdWSUda+9Nkdijlam974J4alHL6cklpW
	jqdaPDPKF6kgqMqjHDEH9vauqyhwdqvc/Ty97ync54GKVqgHQ/2POTv32q5CL+b8ar/WdJH11bS
	dsT1mmEvBkpCSkL3d9DrtnSwjubfSPUVSEuthZsxo4t+1s2oNHDuTkL3WAKLMV3thYFtIXrvmLG
	dAd0X2MGhpGDZh30vNjx63DQv81B1QkVQJws=
X-Received: by 2002:a05:622a:8cc:b0:532:9add:cdda with SMTP id d75a77b69052e-5329e3d11b0mr50950991cf.63.1789753240081;
        Fri, 18 Sep 2026 10:40:40 -0700 (PDT)
X-Received: by 2002:a05:622a:8cc:b0:532:9add:cdda with SMTP id d75a77b69052e-5329e3d11b0mr50950411cf.63.1789753239363;
        Fri, 18 Sep 2026 10:40:39 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae730a9fsm2075781cf.20.2026.09.18.10.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:40:38 -0700 (PDT)
Date: Fri, 18 Sep 2026 13:40:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: spacemit: Fixes for v7.3
Message-ID: <aq13lDqmJjfDn4zI@redhat.com>
References: <20260915004456-KYC0593228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915004456-KYC0593228@kernel.org>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Tue, Sep 15, 2026 at 12:54:54AM +0000, Yixun Lan wrote:
> Hi Stephen,
> 
>    Please pull SpacemiT's clock Fixes for v7.3. This solve an issue
> that will trigger PLL clock closed due to the frequency not available
> in kernel side, a shutdown of PLL will cause the system hang.
> 
> 
> Yixun Lan
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tags/spacemit-clk-fixes-for-7.3-1
> 
> for you to fetch changes up to d558af8ee0bb1b2e88e696be84adb93cf2b7be6f:
> 
>   clk: spacemit: k3: add CPU PLL rate tables (2026-09-15 00:09:55 +0000)

Pulled into clk-fixes.

Brian

