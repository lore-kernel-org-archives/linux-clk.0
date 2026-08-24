Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B821B369D56
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584770; cv=none; b=tGZcJ8JbDrslHt+Y491rAUXCSxLk9blmo7pGYbz4B7xHwWYdTv+SJbygk7hpTIYG96BWTbpx52AMpAt98uvhSgJNRISs6W98VwguZUmpnvNaKFdHhzG7i1ipD6n+JSoQu94hP+Dl49fgegVq/2gwmyjLL30epvzgsjv1+ceOzdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584770; c=relaxed/simple;
	bh=QJkM/H1sYCdgW5GrrWH6X/wpv879FHZLFzcik5vvcEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWyfo0nL0N7k17gUpR/yWwdJWRM1LXYXQaYDZ6J8BfjGOGCTpl0Wmxyl/mMJhwMDMHLVPXqRnVQ4nRgG9fMuQVIPZ0VgoEcz4kySI5xv1nialBjZkGg5hmSUuohyVcZJVIGWNZdHaa85fctGrYfF7MLr3grHAOx/MlQMDp3syDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e6t5DEBU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M8s65TFq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e6t5DEBU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M8s65TFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W56P5fyFkxTQYTvITDSYgEvGIOW/RQqOkycdQuJNc4A=;
	b=e6t5DEBUUnx5T/nNL3Yu0E+QNcFrxmcJuyuvJSf2qS64IMU5xCLPmum14Z2Rk0q2xQHQ4E
	iu7rEEkb0gVp/626ImMMsMczKmuy/1kOS0i7nU9uxNgcy/WMNpSXdjQDwCdnmjjbfb5aqI
	g2zANqVeRBAeKoGrxXBL7NnQwjC6Ro4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-_RVquUnAN2O1vf_0KpEvUQ-1; Mon, 24 Aug 2026 11:19:23 -0400
X-MC-Unique: _RVquUnAN2O1vf_0KpEvUQ-1
X-Mimecast-MFC-AGG-ID: _RVquUnAN2O1vf_0KpEvUQ_1787584762
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso51405281cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584762; x=1788189562; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W56P5fyFkxTQYTvITDSYgEvGIOW/RQqOkycdQuJNc4A=;
        b=M8s65TFqflCSVtP+Vp92flMHsrLi77F8vEHeut0US7yXFqtbk44yA8h4c+ox2GAayn
         tqYy1wTMkwzrFXLOyHqlXNLL0+0FJWTH5t6fd4K8cJCMXotTesKWeCWnFFB0OhYuC2zf
         txe+5K+NOnvK45vta+e5gTVWY+8Nf7QiDBp7dkHLahPQW6gp6aBkGhxoeogz2etrVdqo
         cga1RlXCFV5+yxm4nMLWEplU2HBvLLVyQDDH308GNXj2LLuln8mJ7BQRaljzbClO35DO
         29ToLtfXqHYzjf/xzKXjPug+B+AWiaJQv0/KYXtfV26RBaw09PCCZafWkSd2/1PdpwHd
         /1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584762; x=1788189562;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W56P5fyFkxTQYTvITDSYgEvGIOW/RQqOkycdQuJNc4A=;
        b=IVNtmwlKgItH8tWaJZBl4YHoKYNmU1cEwPsKrrUue6qjz7Eore9/q2l9+n1fPKu+lk
         ibv3I/MET5YKGDOoQ2neiyjU/8Uhe0qFF0FMQFaBmXWBBxw4EyPol77O3BeLHdAisCzC
         UYMvtgc/qpY1M9taj7g2Std4G02LNvAoDfntX7gb8hDcIM14R4I+Xtd6IM0cz42X3VqT
         FztZ3E4SVFNGN49/26RYtpazN5lR+mk8EG34G7NtvFuVbt+Sw1okFI0RZSdjUy02vEQQ
         j30TTywb3yB6Puvwxo3bx29hj9Ca73v5urOegIdExLtBdxpJRy+LFKLa85mncqbnKji0
         ljJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0XP+n25tpP5hwgITWB33zNUI0Xk5NRmKHkJydV8gwsYOm+vlH9LstZ+IIi5Q+W+yrodxCD7C5IpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++munTItjvgZD1O2jSqjYDEXzKQY3lbQMmOYoHOG2eVL6DzYrmht
	eFnndCeNS+1LSd1XF5KNGYjV2UvJR9hTO6E6/Sh48vf6jGu83BqUgKL/iz83asjOM75Hx/7kT34
	iEUGlpalb20cqloE5qig2oImqTaNnbPwhOAklLMd2dH11vhg81nbHa5zdSnspzw==
X-Gm-Gg: AR+sD13ZJlM0flBCvYmTRpNDEF23w/SlRil4iWfYJVgTCsBMMloPrwDXbAww8Kxiqji
	YzQkdu5COFwYWQV08bgVI/geuM7isfCuoWNPhuf7Z9IpPXhul68LIwBSaBX4ftfLLc2pZxrJF0K
	ks+cjAW4s6LDOGjoA8EYM3JHW7C7XseWCl8ojRZ9bB3KVqAWaJrmeY/o/Lebg+S+3Pw5665ZWSZ
	WUMDJYkVORvFhV9o5bxnkRQrTkOLc4wvXSthdiljqwcipdi9hSVkJgLIVv99iJeUjhTn3jbWL7V
	cF3r8ojDD0zhf9tCHKoPf/aIzDdokaZkeV7ZIM8eniMxQzF2ZQkkNyR6HEL7lCbsfgHIuxROino
	aVjbMaLnnJqDsyYJu0cNbzOB4el0O8c1enwo=
X-Received: by 2002:ac8:7f8d:0:b0:51c:257c:8164 with SMTP id d75a77b69052e-52df59fb802mr250057521cf.25.1787584762591;
        Mon, 24 Aug 2026 08:19:22 -0700 (PDT)
X-Received: by 2002:ac8:7f8d:0:b0:51c:257c:8164 with SMTP id d75a77b69052e-52df59fb802mr250056601cf.25.1787584762022;
        Mon, 24 Aug 2026 08:19:22 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aca33esm48989201cf.21.2026.08.24.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:19:21 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:19:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] soc/tegra: pmc: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxg-FCFslaM9Ep_@redhat.com>
References: <cover.1787239869.git.geert+renesas@glider.be>
 <70aca0e57b9900db051aade5a1af2e42c4d30ea5.1787239869.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70aca0e57b9900db051aade5a1af2e42c4d30ea5.1787239869.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 10:52:25AM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

