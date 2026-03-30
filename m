Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1843F3D3338
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876073; cv=none; b=Mew/AhI9Z5wKMszEkNz7A+mPdSXJHc7suQIREeXcSSQ2Lev1pKjl2qulLZnOjop1k9xXpkE7g5UTIBRRQEqxun2OzkqXq22mg4/3IiVNh3IX/mruki7IRO5Ijw+g6rjU/i6lTiT617NPoY5nojWmY0z3iLPTLVbJYt2G595wp3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876073; c=relaxed/simple;
	bh=bO3HeS6hOIk64nPeHchB6zoAMO/C28flp4quWOTLF5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7c7Y1d5hBM6+KlCwhlRw39Nm0qcKA8oHoQ2CGzNY8YUCSMQiBbiGMigC1zUwreuTu81llX/LFhusPGyTv6z/mnWFwVHP6h/uyhUUG9YVmDZDv96lioJ5PZX5Bo+kcusJfneIf03ICjS4tymZ2gcHouROd0HkoTj5/skOoRi+J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A1QuRAWm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XkU6gJUr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A1QuRAWm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XkU6gJUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774876071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ai+5B1JDs4Yx5japT2S+wEeUd585BH1Ippqlg9P+9rE=;
	b=A1QuRAWm5G25WdVL+E7rgcL4n2trpJONtGmI2Qj4gOUwC90BV9ieOzdCEVmUCTHzuPyynP
	nghQkYXyOMQhmeREQ/G8u30ZK/bi+jIJ9o20KgkGkMws3KpKNds8vAXpUvnG4tZeY83icJ
	dcFp1JCIyxJT2QvXtKGOdlcVPyn/rpU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-xld997qnPkSW6I1QXNwKWQ-1; Mon, 30 Mar 2026 09:07:49 -0400
X-MC-Unique: xld997qnPkSW6I1QXNwKWQ-1
X-Mimecast-MFC-AGG-ID: xld997qnPkSW6I1QXNwKWQ_1774876069
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a16036c90eso28294426d6.2
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774876069; x=1775480869; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ai+5B1JDs4Yx5japT2S+wEeUd585BH1Ippqlg9P+9rE=;
        b=XkU6gJUry7t7PE+IQ/41CVkGVKMbqAbgKWnfYRGSEat4+u0FgAG+JtXHHk3s57Lhn3
         k8BCkVrf569YYdaRd7MO+oQd2rb8h+0oq5fHX+tAAwa89nk5u927JCJ4JwIl+ZfSvvDl
         OXtdLUSL5EOxPYjJJtvEXkWDKFDUJMmnIvhVNzZWE07DRnGUF4TkChTlFQ5Z5hVV4fYN
         aQappJsNyAGCTPrzMiJ7aWiEv5JIRI9BRFCfDIBnhIlOj6MhHosDnH+4U1gFFGE7FAQV
         7LALw7P5VK7dlqwYpaGymVdpU5CUEEk628rlJfK6w4Ww5NhqBafFGSndQrYGOSqXV49A
         ZXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774876069; x=1775480869;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ai+5B1JDs4Yx5japT2S+wEeUd585BH1Ippqlg9P+9rE=;
        b=E69MyFyybFNh0y6eBs4+j6kBH8xYGvUQ6a/XO/L6SeTA+JS1Da9HbV2IkTAmM+adcr
         OLTId1O3WK4idasReSvGe/yWWKXWTacXFkc+Hs4MDkvg2gpgzyGxXKJItXK2m/PN+nj3
         +ZsJqdSQkow6FyIw7OypXYzOWoEOVDCihM907UpqkuAU6KY8xW6kmZ6KzAIgjTUB1D2f
         FbQJY20e5jQjigIla9Ih1FZNmX3iMrVeKM3runfwFXJKwAIcZdX2w1+OZDsJreTRtOva
         30A8I+0d4FhI850ZMaDT/uheC48RbI6CkZpFx8Jgqcx6a0JQw2QOO2KtKPGqgxuoCyx2
         /KVg==
X-Gm-Message-State: AOJu0YzkR67TaA/jDR2ofMZaDsaV629W2b9IZs9B4aVKJToPIFVQ+mZH
	dnKO2gGGXZD+SHEL+DZj+l9EyF7N+XJCH4Gzs3Ixb4GJk7j5icJxS+wAcFCCRHW4TzVP4WSDQTY
	Zqr52IQqe8sALVnT19zJvU/eydxv2QGBONT5w9Nm1OpKEN5v5n2cRQSnQ0BHVHA==
X-Gm-Gg: ATEYQzwptu+rJNFCQ/p1ZokHAgXRC0Za5B/gpAT9YVpYKjOpCByGMPWy8yUvNmDWTLQ
	2slJoq8DSdlKFTS9jDtr3+4SCiaKBg/karo3hzyhcdoKl+6ciwHjQ9lVzrxvh1dOzUMEoaKYxlx
	3ADETyw/109hFiAhgAakOdnbm1dsDPXm/cwha49XYtVtbfN79pssvBhs5+7LgBrP5tPLujNJp0a
	0qBAS/mU3ykiLVoTbciwxTbic4B8bdFu/HOP7Dya5Pk2oHS1KGgriSi4QDEKHmn8p+K7/pDJH7E
	SOYBcy21odRMoNAvUdIN1CrARq9LZzRTxXOu0Nu1ciqb97j2i4yPHiSRNqQcS1zhEKXsrmxNEyc
	f0g9UjJ0mPZPYMgddnnpkjNX7cPDwM8G+vXHgg8R35Rkab98wDD2ayckk
X-Received: by 2002:a05:6214:4292:b0:89e:a170:6b13 with SMTP id 6a1803df08f44-89ea1707210mr136977726d6.20.1774876069036;
        Mon, 30 Mar 2026 06:07:49 -0700 (PDT)
X-Received: by 2002:a05:6214:4292:b0:89e:a170:6b13 with SMTP id 6a1803df08f44-89ea1707210mr136976846d6.20.1774876068418;
        Mon, 30 Mar 2026 06:07:48 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf867c24sm63010316d6.36.2026.03.30.06.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:07:47 -0700 (PDT)
Date: Mon, 30 Mar 2026 09:07:45 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:ARM/TOSHIBA VISCONTI ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] clk: visconti: pll: use kzalloc_flex
Message-ID: <acp1of8UeIrtYAqx@redhat.com>
References: <20260326042317.122536-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326042317.122536-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Wed, Mar 25, 2026 at 09:23:17PM -0700, Rosen Penev wrote:
> Simplify allocation by using a flexible array member and kzalloc_flex.
> 
> Add __counted_by for extra runtime analysis. Assign after allocation as
> required by __counted_by.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

Note: Sashiko reported a separate issue related to the struct clk_init_data
not fully initialized to zero, and parent_data and parent_hws fields are
left containing stack garbage.

https://sashiko.dev/#/patchset/20260326042317.122536-1-rosenp%40gmail.com

I'll post a fix for this.

Brian

