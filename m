Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCA151CF63
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 17:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753588; cv=none; b=cdCDn4xfbrm4G0ZEIyKwzH5weKiN00Flu6HHxQavOXo+GB0QsvEYNkpf6MFo2dCrTgG1wnlx5BSIOwAVD1cVHSBOxa0401+w8oOiJTt9V8mBVhlk6xKYVZxEnWzc7IotJpQbl++Wgcw+mPGsPcYZIMGjajsskaKuZxf4MzNWDdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753588; c=relaxed/simple;
	bh=1Xoph9Zzyoz401QMuFQFY0T58m+Pyq3jkWrPk367ZGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mO/4aFQgisu0hiQJOyQgvXQ6kzFLGst9N4f2exxGefQ+e80trmJcl0QgsPY2ifpUUrtfwzBCBCt7k5uPRUPfuIIDcgRQ/D+/VPHR7+OQQtg7/NoS+BtTcwqoszGVBjPpnhC/IvbEzQytJCzivW9vsixLACuDOLTCJWw/xCjE5Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hxrjI9ei; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rg1Rfulj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hxrjI9ei";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rg1Rfulj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789753576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kE00NOrohgS0BTx8CbajGWpf7GfpFqU+s4VpEz/jUQ=;
	b=hxrjI9eiMjSq4+fOvIj/f7Cqp0h18nhYeml7cJFaTIFdq6uuv5dle/tccVjb5Dhcc5A9ac
	+54Y3Ha01kBd7sauJKhoTqu/JVX9Y1xK/Fkzyi8WJYrJITOxSKPOD5aUkRFv/Gq9ihG/dM
	4uWmmLa/QmwRIlNtCGycAYSecllV0+I=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-g1qitTgRNVqEuf6bfrb4Iw-1; Fri, 18 Sep 2026 13:46:14 -0400
X-MC-Unique: g1qitTgRNVqEuf6bfrb4Iw-1
X-Mimecast-MFC-AGG-ID: g1qitTgRNVqEuf6bfrb4Iw_1789753574
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso182748185a.3
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 10:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789753574; x=1790358374; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kE00NOrohgS0BTx8CbajGWpf7GfpFqU+s4VpEz/jUQ=;
        b=Rg1RfuljsQVhMZmauqQ4lby7wCVsie0wpTeKW/vJIQXKWmP7Ul/n7iDDdoyOlTwEAf
         pQVLH3Br4VpL/q7/ciVTJSO2jz9pCexOFnJiVkh4GnhUaaINLoFfYJTDQdwD/J9LcTL+
         af8UkEYj9NZILhd8KX/x7gb6HUMUoCmm34qLwrhczVOFknCfG77b2nQ3gjweoYj81P9L
         LAeRFsfTmQmPrj4tPVTO+QpRxq5YcGslWwJnWo0oYrYDHwI967TP0k2R7Am21RS8yiVH
         xYRdh+fN7N39k2owFxrwbjjINeuOK/UWukhVQolrh4XZCxdruU+4JNukz/FxaIM5sFpj
         y6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753574; x=1790358374;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5kE00NOrohgS0BTx8CbajGWpf7GfpFqU+s4VpEz/jUQ=;
        b=AAMro9rEQFk1T83/X6ofR4ie7EB+dXXFShWzHXN/Rjckb2D8OfvkCwJpL9rDfhBjS/
         wNUZ4BL7YkzmezYbAHL3geS/crTZfHKjz4FATcqzAWeYrwl6baLeaLQincM5Wm6hs+ot
         JbIbKJfDdBe+hWx4/qVWeKHEQD/hDKwdlsOH/nvdIHXym/76Y0zXMCB9NTpAVkn1ZcFd
         fPc2JSdhpqmKE/g4rWWDKd81wMJf72xJ/gg0JQ+DiiJOHYJ2qdpumVvnmP0ktEO8BFA3
         7ZPWKTDTqhPMfgZ32kqbjN6VVKcfrjQG0TxPLuXvx73q56bYd+pfe6Sc8q5UDJEQcVrm
         GlOw==
X-Forwarded-Encrypted: i=1; AKwUvBxqNVsL4gOtB0nv6iRfJSEdTQkzN4Ytuqu0OG/EnIoenr9bvzR2JGvDf11t6AWUZLytTg2nXZatlOg=@vger.kernel.org
X-Gm-Message-State: AFuF++ljfGGQ4omhuwdBTcdoVYcx1yq9zNRBXf9F+OhkQWxLmMpZ0N3z
	TrKt2AlGNcIndA1VmoZtRT8JhEfBPffH1oT4HRCuUObURjgB++Rm8mx4xobp0btgta0gpHA+Hno
	IZSufLqOrHEQl6PCQsW/fJc/BXz0Jq+1kFiuX4TYwfDLVG43ptxIoHpYxAI4GYQ==
X-Gm-Gg: AYBFou3xzEkVwbjJONVJqkr9hIKMxVxrzdg3+VMrzD7XV0dqoFIpKBDIeWlM8QIpwJX
	z1bpc8k5zePVhgeGNRjHrD8k4JtX5L8x903LpNVb2cShrk91oCGY5aGDFoUI8eLEqHpRvKaHAsp
	EehttEa57C9YpDx0F6664Q2ZcAZ+0hEKagjoQ4ARZJaPLoMxpx8EHMlE+/2s3mwRK3hDBSNF1Jv
	7o1xzmBkKO/VfKSpgkWn55yCQSGwZuWh6DcEEZl8aZQ7gC9QJ6fzQC+ljxK3egGnTIGXddTtaoc
	TuEeEIEyavnhDsNg3Vrwlqr7WN5Di+m9t2jlesQdykDdrH/zlTu11DauM4h+/w8ZbIJo8h5oBBo
	GjNHS8wjshQftNPKcahtXJdflwfmptTHIvoQ=
X-Received: by 2002:a05:620a:1a07:b0:939:fce5:f6d2 with SMTP id af79cd13be357-93bdc6e5bdamr470100385a.27.1789753573722;
        Fri, 18 Sep 2026 10:46:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1a07:b0:939:fce5:f6d2 with SMTP id af79cd13be357-93bdc6e5bdamr470095285a.27.1789753573025;
        Fri, 18 Sep 2026 10:46:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0e56a03sm192582085a.16.2026.09.18.10.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:46:12 -0700 (PDT)
Date: Fri, 18 Sep 2026 13:46:11 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL] clk: renesas: Updates for v7.4
Message-ID: <aq1443hvruNPF2ll@redhat.com>
References: <cover.1789723268.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1789723268.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Sep 18, 2026 at 11:37:46AM +0200, Geert Uytterhoeven wrote:
> 	Hi Stephen, Brian, Jérome,
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v7.4-tag1
> 
> for you to fetch changes up to 8d90c0eeef104553d6b9137becd7f58b468aaa0b:
> 
>   clk: renesas: r9a09g077: Register SYSC regmap (2026-09-14 09:47:33 +0200)
> 
> ----------------------------------------------------------------
> clk: renesas: Updates for v7.4
> 
>   - Add display and PCIe clocks and resets on RZ/G3L,
>   - Make sure clk_init_data is fully initialized,
>   - Convert RZ/V2H to the clk_hw-based provider API,
>   - Add syscon regmap support for the System Controller (SYSC) on RZ/T2H
>     and RZ/N2H,
>   - Miscellaneous fixes and improvements.
> 
> Thanks for pulling!

Merged into clk-next.

Brian

