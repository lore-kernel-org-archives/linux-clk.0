Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB3A33B979
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 22:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772058798; cv=none; b=tuva5al/L+PkoKNM3OZO+vvB18JEHX0abo+eh7ItPybzj29GTKh2eUmie2G+vaXSYF3CPfQZ+872zjGXOgBQ/sHqsq3m42hTt7+VsjbJHgN9N886evrkYSGlgTPYFbF4VTH539jfLsNf1RB8+y3JO/FLy8xbZdqq/Csf90XgKkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772058798; c=relaxed/simple;
	bh=ub4YPOS9MW8FeneJ+8J7whwUxcyuGRtYV/5WM5Rvo3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBWn+AjJfZ4uqbqwqo5dOclSnU0BqgMbIj/6dRc5HtulaT8QjzWpzhs32zwaOTZp3qUqYTrpOLdf1iDoHFMsTcYcQxqYe9s56AvX3byORXA4KeeHcrMLmo+BjK1d2xyAUGCypW22ewu5bqECEhvrxrE7Xpwnih0idYfIYTQfP9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XT6rChqk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SLT7UbuT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XT6rChqk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SLT7UbuT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772058796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJ4w+GJGB5YcT1aoYf5wDNw6bacytrNfbyC1gI6kr6g=;
	b=XT6rChqkXc6G9yw9zrMQs/wVSrFDcZaeJYWXWrm9LUg/xZN8byHz0HTkatKgxtqx0FR5TT
	pV0NG9+Dl5dDZHJBL7qE7RnGXApAoLZxUrMJysXE6M1sdR84rD6PCbgassXfIEJ3yiWBX+
	mAXPytme9eQunWveeggBaEJnZtVaUd4=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-XXi_OsrXMlmhcrWGxBEu-g-1; Wed, 25 Feb 2026 17:33:14 -0500
X-MC-Unique: XXi_OsrXMlmhcrWGxBEu-g-1
X-Mimecast-MFC-AGG-ID: XXi_OsrXMlmhcrWGxBEu-g_1772058793
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6445cf02fcbso103974d50.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 14:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772058793; x=1772663593; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ4w+GJGB5YcT1aoYf5wDNw6bacytrNfbyC1gI6kr6g=;
        b=SLT7UbuTH8p0tjvUb0Pux678M4B1kb3BW7hgGLnAhokDai7/HUCrtt0b7GkFz6uE6i
         iPfJ/X4zItt0xCTvwaLZXLcmcAs+cQ22zgHasfm8k1mOHaFZpe9OjhTiSUhlDkexuhSQ
         5v/KO91HF7TSiaDJ46pMP8KKn8nd8Ufkrk8nIsg++Av14jZmHfoTVOg4fLL0OLJHyVsl
         0MG4ugUbI0Eb9mkopTNHtW8CyGdUcsm7oKtbD/iw35+8oJrg/Hx0Gg6egtOmLOVvxhPd
         6RjixcbmlaOO3vzM3TdjvbHRGt8LDViSAN9b+cN3w50cdO9bJcSt1Y4d72pQyQrPL/+L
         elCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058793; x=1772663593;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZJ4w+GJGB5YcT1aoYf5wDNw6bacytrNfbyC1gI6kr6g=;
        b=cZhujkG89xFywgcYUVJ0lBj55ZX8PKuMJUONT0TvaBO9pp66DcsaVlzvgg3UKpRkXv
         sDYPkLu8oGS/tP2tMdXmjbDY0KU1QCweh2U+d0e9h70ZIbwFV+zpjPWg2q7g2tW8Bxpg
         fdZtedQ2nTQgko9ovdG/y6/XvAbwgBA2hfrdjb4x9EKfMW6wh+96hdm8G3dGcnyiBnSh
         61yiSAO3LokbPl4d+US2/0fzS5F3dlPdimjt9chz81blM9jrQLnvASMcb9NLHBojpw73
         lpeYWKJjhxuSmf5ir56FEGWl0GoRdaJHPdWXOHE1WxAOliWBCi676TvFkZBrv08/RmBj
         jRpw==
X-Gm-Message-State: AOJu0Yx0riDthwhL585o8r9Rvb5967OpBmcZ3n5cZC+HHwDxyVisOyvk
	tDuQVo8QyATKxmBts5JOozNhMfLn8ZjVAz7Tgaf8sWxU1DJTW8xdxexWkzvn1zLfIVIYt25GDYI
	BGkRM/B9bYFg8DGbFN0jQwk9dNcezBi0hCfggWl8Go9LYHzl1UuQRgEnQlWfutn5C0oGC5Q==
X-Gm-Gg: ATEYQzyPY/CkB5XK98SSo0C+WlIQuE1oinbWFPG8/pw6Y3swww8UhTidNtughZAElq3
	hMUz070WNmwgrSyp2PBJqSIRUaRxNYwM3rJtl4OAADth7dtquiwz4n7UERdPB2cRzbCDROOFD5E
	WO15w62T5PWyIqnvUpLS0CAnQFcrGyzGeZd3VwnvOYTVB3Njin5k5e+I/1RbrHZ3CeNm1xz0cZV
	8RF7nKgR471I8sFmIWLS1T74RM1tGLxHnx6MRaao+06kdIR1WN7RpMqwsqPq5vdet5nyU8zwNcn
	GnHMQNlU667V0ne5LpejcEn/xS38j6hPZpH18kurcV4FPSjINM9jUbjOg3KucG1zzuZFgM5R+1n
	grDSpvB7OVuZXSSAsjbw=
X-Received: by 2002:a05:690e:1909:b0:649:58f1:6ce2 with SMTP id 956f58d0204a3-64cb7c6a7b6mr183180d50.63.1772058793457;
        Wed, 25 Feb 2026 14:33:13 -0800 (PST)
X-Received: by 2002:a05:690e:1909:b0:649:58f1:6ce2 with SMTP id 956f58d0204a3-64cb7c6a7b6mr183158d50.63.1772058793037;
        Wed, 25 Feb 2026 14:33:13 -0800 (PST)
Received: from redhat.com ([2600:382:811f:bb35:ae9a:1ac7:e1d:86ce])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb7626ff1sm162622d50.13.2026.02.25.14.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:33:12 -0800 (PST)
Date: Wed, 25 Feb 2026 17:33:10 -0500
From: Brian Masney <bmasney@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/3] clk: x86: lpss-atom: Use predefined constants
 from units.h
Message-ID: <aZ94prCjOkqLrLdZ@redhat.com>
References: <20260224121159.3503754-1-andriy.shevchenko@linux.intel.com>
 <20260224121159.3503754-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224121159.3503754-2-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Feb 24, 2026 at 01:09:20PM +0100, Andy Shevchenko wrote:
> Use predefined constants from units.h to make code robust against typos
> like how many zeros to put.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

