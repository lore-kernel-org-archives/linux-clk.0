Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9A63161A1
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 14:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436279; cv=none; b=M8C4CgoAvKbn3JerQyaiJ87UEkO409MslM/5r2GpHavq9DD/7BSDbslOCuuJmN8BSPUKto5dEJSeiFVEQlvnTFYaeuX/PJ9iIhClx3v4iFQOMugFmRmGo4Y4O2SkHTqkNLkecFw3taqAMHOQyr42ix9rWMifoMhLLpV16+x5X3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436279; c=relaxed/simple;
	bh=34cmiOT4AUQDB6/wgRLO9dq+0zBHPmY/oLQ2eesmocI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2oBDcB4OWwcerKm6t0oF4CSkpsIe3DKigkH9+TQTPlnt44U9cigjJ4zfIIlWJfIGHaPBgqGBpOI4PWdliK8swa3JsoIeozHPkyBTTHcSAcrueH1L+spuRvybsQKrZVDsgrZmPTAGMgyqjyXaffnWkd2q07GLvU+UpyisU2mz3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rht7jV/y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UZnmmT0W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rht7jV/y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UZnmmT0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783436277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mFGcKpezQc2FdGn9v+N6oSZlIFNYCsG+Imjq35hvLSI=;
	b=Rht7jV/yJiq1rsZeq6FaO6daN1NUKS22YADSHhvxmJpLG9m6Xv83qK1/+ucWMBmFZcNdAc
	yUr3HxLlLDrkrm7UenHJ28eGjCOm8XVFykyb++wEMeQdK26xsv9fWOrSLUSbu96XHpSM/+
	cmrnmcvjgo/lB994tFNQLv8n/oCWV8o=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-Agtqgk2XPZyIOz6j2FDmQg-1; Tue, 07 Jul 2026 10:57:56 -0400
X-MC-Unique: Agtqgk2XPZyIOz6j2FDmQg-1
X-Mimecast-MFC-AGG-ID: Agtqgk2XPZyIOz6j2FDmQg_1783436276
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7eb64224fd2so6791920a34.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783436276; x=1784041076; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFGcKpezQc2FdGn9v+N6oSZlIFNYCsG+Imjq35hvLSI=;
        b=UZnmmT0WlJgjV13s0/NDquotBQyRhYrnh3DsyC9VEOwb0qwCkYrrKc7byPfR6fY/AC
         xfu26udKNC1tuHphh3I27XPF94SnzCVHySamxvuOuf4uISvX+GFLRoLrGVUHezwwm/DN
         +Rz1qwSy9qJfiCQTzTWc7jYEomvLWNjGZA/MBkZQr27SOpGvddm6FUwv0vdy6b/X861C
         2rAi292FzrrqeTPcZ/KK6CXkU9ZkoA3Ko04xZk7M3diAtdYof3Os/BCTHa2NBm356/CG
         mM2biU6JoqWMdhE0INsM9w/MA3ZNRCPW8krDfOI5+h+58cARGhExLasZJKKwDHENnAN1
         OtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436276; x=1784041076;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mFGcKpezQc2FdGn9v+N6oSZlIFNYCsG+Imjq35hvLSI=;
        b=bw62qRv8UwSA1IVLcVT+qIGno3gtgpKaL3HJupmVO/GDEhYVfHRc8t1zjHYaMxLJ7o
         w3ybsyPsaiZ7Ms2jEEjBj7mBlLi4zoAyIlp1O+T2vbcw83Ww9pESxDlF7zRIeG+uf/OX
         0bUb7GU2yyGqe4kusyNYsWGKNimeGyLhb6zQ4/JvYt0bms1lGvpd7jxLHcehjr3BVkae
         nq+qDS/Dd79c4cYLnPKD0kS5SijjDgeUEOoiVxxjzVkYXK9n7Ut5TYMVHpBnNOfKG9Fr
         5SjFOXnKqRLBpeaZEtrSiuRZvNuL6D1iDv/mv0jEBppu+jQtH9+rS0l2avkuZ6wwQzTF
         DJog==
X-Gm-Message-State: AOJu0Yzqymot+D6VzhanT2ownmSKxdRB5bDwOgtQOebvHHO5ohTwT/ET
	9Tx6PRqBuShHbEI9TTiCDwAnZSi9j9zHTeTo23yTg0TiRUUyDarte0PsUENpHKQXEsCbDlzrwTJ
	vKZ8H7bWksNHIZDyoWYkH2iSb5UrLg91GsQlRi27e/PBMGAc2E+Nho4Z8FelDsw==
X-Gm-Gg: AfdE7clDq+OtVlTtRwbyhKMgaMc8M1ppkWabWZ8NCawMwZ5uTLNngMXHLLTYd1QHe2Z
	jC8YWcMajBUpCApX+UVo+rV57m8kez4HYNbElDRWW4KB1X3s3Ylwo+jDFb6tBBfljiuoBzVAh8S
	OiRXb291i3YMsnM7Kk7Pt+swdCkltfq8ce1gosKr9foM4uoFtgNOcubGlqI5H015+wm7ZadkQ9q
	JbgzX3c8ejZUUg1/WgfDohdvUtvIR4BHmh4WGIfJU3QPEdaTw1qSO+efAM9RY6+0KLtztmm19Cz
	enSfmAfH1NXgT+vs9u3BY2C+tYj6Jow36tUAG8I72S6cLLYLEZA5oTHu750+0t+qE+dhgD+BjED
	5/rMpT8BP
X-Received: by 2002:a05:6830:660a:b0:7e9:f8e8:d8fb with SMTP id 46e09a7af769-7ebb231d6c0mr3396704a34.21.1783436275536;
        Tue, 07 Jul 2026 07:57:55 -0700 (PDT)
X-Received: by 2002:a05:6830:660a:b0:7e9:f8e8:d8fb with SMTP id 46e09a7af769-7ebb231d6c0mr3396674a34.21.1783436274867;
        Tue, 07 Jul 2026 07:57:54 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm14082217a34.8.2026.07.07.07.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:57:54 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:57:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCHv2] clk: thead: allow COMPILE_TEST builds
Message-ID: <ak0T7zxwwSn_L57X@redhat.com>
References: <20260707005619.1229238-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707005619.1229238-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Mon, Jul 06, 2026 at 05:56:19PM -0700, Rosen Penev wrote:
> Follow the pattern of many other directories in this Makefile (sunxi-ng,
> tenstorrent, ti, etc.) by using obj-y. This allows COMPILE_TEST to
> select the driver without having CONFIG_ARCH_THEAD enabled
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/thead/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

