Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5429376BD6
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 11:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709119; cv=none; b=OZ0/YM6UcAgDw9lt3nlfrYbkzvTeQVR5oH8pzd2s1QsMr2h8QmeKQeGCQYZync1MFlKGU9lG01NP6ff68m5rQHyctXT5RcBjZvCB0sML1RQYn8bEN5fWvUW+j7OFnDbMnsssbfn4Lte07HNKo66fCRYLUxOE5RdFrHIvbhvWYPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709119; c=relaxed/simple;
	bh=B873sRwQ1J5CCn/I3TZ27cfOdjvggNk5/UwePR4qofQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wo3k+XnPH7OvU3mpbDR9IQZ9HAtgRz3mWG6j+KFHKIQgb5WpwNwOKya4eSKTlOyj3D05ujLY/LeP1UiSo7bHqbSOHd6VhVFUyPlqQ8dMXDv/59SzhxLNCBa1eMMEWZ0qfjvZbbK3U0uvuEYc4BHD6Spz/813j1Iw3hRGtfRI+2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b/hKmmw+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nKKVFOHL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b/hKmmw+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nKKVFOHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772709116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkxCRFYiRt8J6Zp/a/+uZknb9+WKEd8QL5JOgoUkxw4=;
	b=b/hKmmw+nblSPUmj/G0J+iaGJHK/u6EpXsgs2QCTq7S+S2dW/SrDtSvUWqCAIt3yS7uzaq
	Ywcpp+8OcJf48amC3pGcY9o3Y1IYhI0kKRlRmIdYSVPGae5DeGH88WXqxXhM/i/v/E0Z9/
	q7+A9f8VtCHJxhtjfc43Tr7LgfBodZQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-NLmBpALWOzmjHWDsqeFlsQ-1; Thu, 05 Mar 2026 06:11:55 -0500
X-MC-Unique: NLmBpALWOzmjHWDsqeFlsQ-1
X-Mimecast-MFC-AGG-ID: NLmBpALWOzmjHWDsqeFlsQ_1772709115
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50341fddb89so554042341cf.3
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 03:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772709115; x=1773313915; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fkxCRFYiRt8J6Zp/a/+uZknb9+WKEd8QL5JOgoUkxw4=;
        b=nKKVFOHLKtqB9NmjzoBHkQmNB6+UyJqGFV/alSHWfAq04JHic4Xqq6Yj1cJs/mzKRf
         PcczZri8M7LVDHqyz2kfvBDUvJHTQUGO87GRh3cUP4xUVR0bEgLDUI6uxRFZdVpgeYdW
         aLBhuqKXL1Np7+LpM+YO2611Ou+X5nOL64E3kLiKHYtU+6iP6jDxKj+iiiuERl/ZrOB0
         E0i9jTc8ng+6PM7MN/IzkXTDAFw96i2XAggrDvsO3dQPa0Zhk1Criv8z1MnCASvb/o7x
         Yw9XAdjARx80g1kCeouZh2rMMtiSIsvTy/E5x36MaXCrPqWVkR9CeyQujox5UMREeaZK
         uMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772709115; x=1773313915;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkxCRFYiRt8J6Zp/a/+uZknb9+WKEd8QL5JOgoUkxw4=;
        b=IuMfLSLj56Fx6bKBsWOkOrNSRBjOJTQu8s3dzB10HjX+pzq0VnrqhdaGIQEVCppsNK
         HhYfF9MN7BJcqSqzcK/OjlKTS6Wpvs44h8WYuFGWml62KfQGApSZGCME9BjOM11IgzX6
         rRsy9HlGEKx4tFrw2niLgkgoNetMYIA8Envvk9QiUjp+5QyKEi9VYnm1pMp60fRVJWDU
         fB8W369NGem45ckFjeJ2ynEBf7GVPfMM9f/Ec/mRWxx58bvSiuP+JTpY14hCIarx/9l8
         zFK986ANKcsW0LUi8IaDQGIAWo6REsU2UkGPzVoCSv4NIpY+14J+o1xS5efSKairE1Kk
         f5fg==
X-Forwarded-Encrypted: i=1; AJvYcCWreU/q+cCfhhUlAK8KOAYPtcgmYnk7gD5p8dlRsQyMGE92FwuKrIE+DysEXF/ae+QC21FUiWb/0kY=@vger.kernel.org
X-Gm-Message-State: AOJu0YysDQtc+EXzUCpmAdTMBNlj5k4LvaPwRVMmwqVpDvfE3hc33/k2
	EahpakiXHH/6D7G00N8uutqvd9YgQE+Z7/SLzO2IBO32fQ3BZE5i97gXBNBUPuWEVWH7aKkCEtF
	esgwNh13WF6nFz8eBpVe9qncCyRd1WEpQZ+orOmnUBhzFQZMOybNdalAG0yFb7DUrPG0rBg==
X-Gm-Gg: ATEYQzxYRLWseYbRgatLvvULIYQ1KPJi6jjVq0V3swgQDKhN6kdEAwKm8CR2w3zCHNS
	W8E1m2MfVIa9r5oVKRrzG4Nrk+K1C8ZGrTZYRi7GcAKl2PLAAYPHFq4iGipv7qyzcFlMfkqshAG
	jESGEjCgRZ5NhgG7cX5No3mL/EWW8WN0d8a3COod3L2wv8U8PRm5OIqc5fvxY2djn37EPdXDUfa
	tzQO8m5JW799eYWOc/u79Y0ULqK+7hZHxiBwWQLIx5TaJUiGiGswJQLENOKS6pY0gSspUeW6S5L
	5GxrpNyHYXFICtpEecmlKPNgZsitjCemZaEGw0ul1/Li7tZZTo29I/iRGmqR7rLdqW9ul5hMaDg
	6hIyNt9isPBjJVQHSb7Ii+rqu04V9PkisoFsh+wmTL2HD/U5jtYJlWG3p
X-Received: by 2002:ac8:5f0d:0:b0:506:542d:2b3a with SMTP id d75a77b69052e-508db25d6c0mr65191101cf.11.1772709115283;
        Thu, 05 Mar 2026 03:11:55 -0800 (PST)
X-Received: by 2002:ac8:5f0d:0:b0:506:542d:2b3a with SMTP id d75a77b69052e-508db25d6c0mr65190921cf.11.1772709114890;
        Thu, 05 Mar 2026 03:11:54 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899f4fb7c53sm120590996d6.30.2026.03.05.03.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:11:54 -0800 (PST)
Date: Thu, 5 Mar 2026 06:11:53 -0500
From: Brian Masney <bmasney@redhat.com>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Tao Lan <taolan@huawei.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: hisilicon: Improve deallocation in error path
Message-ID: <aalk-cn0R40a_tM3@redhat.com>
References: <20260303-hisi-error-v2-1-7cd9b43d8fbb@posteo.net>
 <aahI_4lfMdQjZCu3@redhat.com>
 <aalGkLuM1jK3Vlrw@probook>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aalGkLuM1jK3Vlrw@probook>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Mar 05, 2026 at 09:02:11AM +0000, J. Neuschäfer wrote:
> On Wed, Mar 04, 2026 at 10:00:15AM -0500, Brian Masney wrote:
> > On Tue, Mar 03, 2026 at 04:25:18PM +0100, J. Neuschäfer via B4 Relay wrote:
> > > From: "J. Neuschäfer" <j.ne@posteo.net>
> > > 
> > > Unmap 'base' if an error occurs after it has been mapped.
> > > 
> > > Reported-by: Tao Lan <taolan@huawei.com>
> > > Closes: https://lore.kernel.org/lkml/ZNlSH+eWV8Sk3FYn@probook/
> > > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > 
> > My understanding is that you need to use your full first name in the
> > Signed-off-by.
> 
> I have been contributing to the Linux kernel and other projects using my
> abbreviated first name for over a year. It has been mostly well received.

Sorry I should have checked.

> > > Changes in v2:
> > > - Rebase on v7.0-rc2
> > > - Update my email address
> > > - Reword the commit message somewhat
> > > - Link to v1: https://lore.kernel.org/r/20240708-hisi-error-v1-1-727bc7399b63@gmx.net
> > > ---
> > >  drivers/clk/hisilicon/clk.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
> > > index fae65127cd4aa8..08050ff1c8cf9a 100644
> > > --- a/drivers/clk/hisilicon/clk.c
> > > +++ b/drivers/clk/hisilicon/clk.c
> > > @@ -70,7 +70,7 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
> > >  
> > >  	clk_data = kzalloc_obj(*clk_data);
> > >  	if (!clk_data)
> > > -		goto err;
> > > +		goto err_base;
> > >  
> > >  	clk_data->base = base;
> > >  	clk_table = kzalloc_objs(*clk_table, nr_clks);
> > > @@ -83,6 +83,8 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
> > >  	return clk_data;
> > >  err_data:
> > >  	kfree(clk_data);
> > > +err_base:
> > > +	iounmap(base);
> > 
> > Use devm_of_iomap() and it will be automatically cleaned up for you.
> 
> This would require a larger restructuring of the HiSilicon clock drivers
> to pass a struct device * to hisi_clk_init. I'd rather avoid that
> because I can't currently test these drivers and because the benefit is
> questionable. However, I still had the upstreaming of this patch in my
> backlog, and I think it's simple enough to review as is.

OK, fair enough.

Reviewed-by: Brian Masney <bmasney@redhat.com>

