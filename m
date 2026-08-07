Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED8C3C0625
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 11:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786101396; cv=none; b=hmLhsuoVUL+slrJohktfKyShsaXkW6AYHmnnAYuXBA9Duz+P5t0k8MX4yKccw9z0/snGIBaph9LftfjK0FqsYfRnV1MdWrU0IMCtRgDXqRgKCkZPhgr9iVQMTllRAWVT++bDG9x4gs9xDAlL6vHhFCzdyiPdI20MEOjnwlJtuy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786101396; c=relaxed/simple;
	bh=Jf0pBYRztSgtLQs1plfcBVlPdUL6retvyHX/gVroXE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRBykbc7P0haT/z+oZNPSYObX/71NK8ICKdEu+fjdZyOAGdS+tCLS0CK5nK1WBGV6zfo8Qjr7owjHAf/hooFzqKOQLnEblEkRd3aVbctHbE2kn0H4Rum8XR+baswwh2kz4AXIEpR4ij5E/r7/bMVejamAZkNMTXQrSt5dawfsmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hTxig4PR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eLXHKBsK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hTxig4PR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eLXHKBsK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786101394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ptae6l/fNkNvj6rHMZqp4k0wTqugafRiBrSlidEaAZ4=;
	b=hTxig4PRwSepZzeVaGUHrdxFEGsVQ4j0qgJu51Z/yO8/yii5NX2/Icqzo1gqK2FccpWqPG
	1sA68NkaiWtoZuyOtZJXfxUCoyNR70/fUsmMhmDJh+seLo3/YWDyke4qVooE0FsN1I7NTP
	BIrEmCPMPm7V/Ems8lVYqCgw62xIi50=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-tXwy4Y2iOs6RvlLkPxgXHg-1; Fri, 07 Aug 2026 07:16:33 -0400
X-MC-Unique: tXwy4Y2iOs6RvlLkPxgXHg-1
X-Mimecast-MFC-AGG-ID: tXwy4Y2iOs6RvlLkPxgXHg_1786101392
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e67e87752so32439387b3.2
        for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 04:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786101392; x=1786706192; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ptae6l/fNkNvj6rHMZqp4k0wTqugafRiBrSlidEaAZ4=;
        b=eLXHKBsKa6szcsKZOH5JtRj1hjvRD/eHVEwoQmVC008+cLOU+mZ+JDe6iw+s+0+mFe
         dr/pYn90fi7LpC3NgTj36PIOepaUyEC0Qbs5iJLRLKug6UUaVUkJ750sM+qcs+tSO1nF
         l07tYMcP4bprt02ksWfTupYr/LMVe+VM7EhszNMxoE0o+Va6FhwKchGhofMZUet3JhH1
         5dgvnm7RFmA4z6vBAxlMmZNiuqUB3sAj+8wwtmmhWq3Y1dMl8xq1fMG2o9HNBLL50+BC
         qRr7ZZpSkuURpagZ2xYR3RRdnMu03cTV8xp5Ky6YvmqDhYPqCtIitAIvflzB2S9UPbc+
         2oVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786101392; x=1786706192;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ptae6l/fNkNvj6rHMZqp4k0wTqugafRiBrSlidEaAZ4=;
        b=IW4fbGDkbqMKOymK6R0SSa8v5uI1/0MQKVRG7UR+oEvhkVZDREF2hTVu17NGuBDGyw
         OpIBFwfJ8xJ90RoVhB9X2d40NY2XVQq5R4me6zZ79TeabiV6alxJdtR/YaJn8ID1MMa3
         sddn4dLyGYeuiJQMJuiztEdkwuUmm1ezUVpjvG+HSQNbTADQ7vk3Ar+iZAngCS05ZZxT
         WhWExxn6EEBkCoQJpy9LzcuIMKgUqwN4Znnns/pncfWgrQ9OpQPS9xsgnuUuI8HYhNI9
         pwfbEDmdTNCu/9Dtpwb/OlK8CRdHOLLOj9oZg6rvm317Hf5V6DyimPZ28qxdVpqfxt3E
         kdcg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8xpWec/3K2c3A6KOUXizReDch4PAi1L8Hop23ZjzwnRcBLYtycsUow5KrPYlT076YkWpTwC0Cvds=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG2uUU+IxQvlj8WsKveVJCWNxkSAW1aaiBJLD7D27gj+hopHLK
	SfZEEpZmrFaFTHlTcxqra694EKJ1vUt7zVc3DI0QuerpvIZ6zRd38oFRZ0TGo35V8uwUVbiurtG
	+chdjV6tDNpXugp8NgttYJwE8PuPsIgw3P1XgNwqdeFQujlvaBdF+1T2ck0n4QQ==
X-Gm-Gg: AR+sD12n95/oV4OR791sc3h0xgQt7aTIeXu6KAlgCqT6f3w2EA3ykO1i11zkW2VaCIy
	9oHhh91pfYXIKbFL25KzoGJ1z4O6AOUL7RJ4nQ/hB0mci8UYMTmY26ti9jqVrdQtoijGZHQT08t
	TwCzV0v6o6Y+cutmJVCdYE6dp5XJtXDo3FGblISccQZUESJDvDNSHHpokM8xq4CPBDgrcGdJNrS
	lm7k7lQz7MWjSwsHpOYuikDSwbwZeuz5o7Jkv3etL0qLfLp/N0WuVMgJmISdpgH6zaoXey0lANO
	zUqx0vuJLwuVtjc7TjOINy5GNw/yOn5GAmTm52q/R1/AO2kyYfJh4wYg2bTdvgz8wR3ZWNPuGwX
	Lzuv5ztvpDsfKz0kzMseEajTi97uvh/dgurY=
X-Received: by 2002:a05:690c:a92:b0:81d:29ce:cd7f with SMTP id 00721157ae682-82445193d57mr11124497b3.24.1786101392499;
        Fri, 07 Aug 2026 04:16:32 -0700 (PDT)
X-Received: by 2002:a05:690c:a92:b0:81d:29ce:cd7f with SMTP id 00721157ae682-82445193d57mr11124177b3.24.1786101392004;
        Fri, 07 Aug 2026 04:16:32 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823efa0308fsm7697497b3.9.2026.08.07.04.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:16:31 -0700 (PDT)
Date: Fri, 7 Aug 2026 07:16:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?B?Suly9G1l?= Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as co-maintainer for clk
 subsystem
Message-ID: <anW-jTldkWSJK3wl@redhat.com>
References: <20260804-clk-masney-maintainer-v1-1-de593189a9a1@redhat.com>
 <CAEG3pNBFyg1uWwDiy8Bd1NKJL4VMOKCvy=_VxoKw+eO_hAdVKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEG3pNBFyg1uWwDiy8Bd1NKJL4VMOKCvy=_VxoKw+eO_hAdVKw@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Mike,

On Thu, Aug 06, 2026 at 09:55:04PM -0700, Michael Turquette wrote:
> On Tue, Aug 4, 2026 at 8:33 AM Brian Masney <bmasney@redhat.com> wrote:
> >
> > With Michael Turquette stepping down as a clk co-maintainer, this
> > subsystem is big enough that it needs multiple people to keep the
> > clk community healthy. I've already been doing a lot of work to
> > help with clk maintenance, so let's make it official in the MAINTAINERS
> > file.
> 
> Acked-by: Michael Turquette <mturquette@baylibre.com>
> 
> If someone doesn't pick this up and give you commit access to the
> linux-clk tree on git.kernel.org then let me know and I'll unvault my
> SSH key and merge the patch myself. I'm only a bit embarrassed to say
> that it would be nontrivial for me to blow the cobwebs off and commit
> a patch to kernel.org after all of these years ...
> 
> I would also propose to add Jérôme Brunet <jbrunet@baylibre.com> as a
> co-maintainer. This was proposed a long time ago and there was every
> reason to add him, but I was inactive at the time of the proposal and
> nothing changed. I'd like to make this right by proposing him to join
> the clk co-maintainer team now and help you with the load.

Yes, it would be great to have Jérôme help with co-maintainer to help
spread the load. I'll send a v2 that includes him as well.

Mike/Jérôme/Stephen: Will you all be at Linux Plumbers in Prague this
October? I'll be there. I submitted a talk about the CCF to go over the
current state of sync state, how to land my series to fix the clk scaling
issues, and to discuss ideas for how to replace the global prepare lock
with a more fine grained one.

Brian

