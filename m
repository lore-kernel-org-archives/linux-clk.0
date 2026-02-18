Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442B623BCF7
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 00:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771374916; cv=none; b=Ij3N9q0BTg1KHvQBUXHgrRSgFCt+tABSsq/npDOLt9vnsHnlOL0dY/CEKLZIQW0CMkbud8EFcNFRfALWPW5hedDW9IyLb9lHNW2Ow3/p/ODbUalSlQZ3uXJdph7Qk7+0bfIWilss5d/DFCGFWFENfWOYeWmMgOmdTIjLnX8QFnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771374916; c=relaxed/simple;
	bh=qdvgxZcv0ESuBA1Jt7oAm5we9rLZ1s8OEqGJPW/lJcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLR3215727PlEPGP1/DiwXR9G2S3uxN1i81LIAWzYFU6W/xEkTDgKXqZzEjrrGGm/7+s8Jdfr5PBONdRqm+x83ZkqJ+iFQSWHMyN61+J+mRx6Zh1H/u0bYXg6FdyZi0UO0t/8EItjMf7AYxAsXpFx8advNFWSlq5UVbdaX1qsqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qkb265rx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cHbnzZH1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qkb265rx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cHbnzZH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771374914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2GFKu2pbS4lNbKn6Jz4fUhg2OnmZkDZP9P6vjWAZkDc=;
	b=Qkb265rxBzDOP4OGZNlzl/wdPwfxqkqWpII2D6emQKX+Yl+itLWQftLFRmmBRnjrfGy4ST
	DrTCPmodQPrgeJF3nJxqJlmKB4DW89Od5gfSU5PDpD5yYrDIcPcr1ktVYK7f8mFcPh8wna
	9sjaxzNVw3vct73EH604WA9T63VsH7I=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-TQo27fszOTqRpHsewZnhTQ-1; Tue, 17 Feb 2026 19:35:13 -0500
X-MC-Unique: TQo27fszOTqRpHsewZnhTQ-1
X-Mimecast-MFC-AGG-ID: TQo27fszOTqRpHsewZnhTQ_1771374912
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506b4bdde91so377325901cf.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 16:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771374912; x=1771979712; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2GFKu2pbS4lNbKn6Jz4fUhg2OnmZkDZP9P6vjWAZkDc=;
        b=cHbnzZH1WSqWqtrHWUVvdat7hwMwBx/BDT3756rn4fgaq4WrTTDVLo9RqVRc5hh13o
         4m3cEmlSLtdbA3Qn3QUXHD0OG4iZnhaURTx6Y7kv64BCxd6tVzzY+ZqFjdogkf9wk7B0
         4ArTC/nBK7kO2013zQYvBt9cTiFLF7NUKVtr6qe8cKU75CL09goP9nBPBRcxWsBJAGAQ
         8gGDBeJOxb24G5N69OdAq7idCFvPEqTSm839IGtSVQC5esvpbKJmpEpgWP83Z5YwpHvO
         s8UVzgIwYR3V6qQOm+IL3qulqxiX/QfdW3sF+uiSZ8Fnajn+ZYWuoISQLClEavQa7nf2
         muLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771374912; x=1771979712;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GFKu2pbS4lNbKn6Jz4fUhg2OnmZkDZP9P6vjWAZkDc=;
        b=wYhkDenpxTNX/OxApuPwimWwk2uiBRQuHOhkoiCbNmfMSJCfe/9odGyDsLxlUG4Vla
         crZ0XUZ6BgK3MKE6JYgHHWn/UPt0eVMU1Zf6+uq5oZuTFxk0oKZ5bM5uMeE0f5PALWZt
         gcd3UXmffsG4KWHkqBV4y1E0OkRmO/u/cr+7jnEERkT6E+rXQ2XR37bPteGCDO9uSR2c
         HXxlIs4AiPNCtYeWbQ1dFZdCT8zNiOiSoDf2WYifDwfGFgXy9orfS69G9up/bA45W/ZZ
         xSG0NnoNcMmULH06M1vr2H5AJdlUNRMfMtmoiuXKsKWeOfsKQV29vgVI0O8nokPTrR3F
         ZQNw==
X-Forwarded-Encrypted: i=1; AJvYcCVFvzzgvzMi0jTbgvIdfU0GRXeBc1DvNYsqIPwZbzjFPWV1OTqvD6EKrPscWfKE2q0BMz35bzr6fGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9T+YgmYIFPiVpA9jDKHQreTTYVAa6OU6Bdt+DulI2H96hjipd
	ToqIc9V70RhMLNHaR8w4m88j0rMZGz8nhXZ/m+BKrRZgcmOU9OSygcRxuClIwCWGCEc9SjIRD51
	i1avJAUldJt3dJiRReyyUjHj87R+ULqrUFOoLYJeHE69QaS/ys9vhswUmdJE5rQ==
X-Gm-Gg: AZuq6aJFCM60+C75CvS6zndEjDySOylEUhd9mSptOI8yXrrX8m1OHFQ6aafnVJIxZOs
	fwH7KtorOlKfDnlkkRZtUGCkYUQPp6YYHuVrJVHvzi5VrFN4k0WoBKqchdX7ePaF7SQcmzwRT+Q
	VY2Aw7kxq3A26OyDqQm6H1hAQKYngFxS2guDwdnN6ktKzida4GrpjD2iShWpJoiSpWJluMoKtDV
	3q645trqrLykqaQwxRuw37VpggqSDMv7GNwdaawfYlERANnklEcUJ4BgmuKGTNtzZ7usf3ZxYLr
	za1K9jkbEQmiTUE9Ji9Rsb5N2rv4snDMzY+bzQIxyoCVnsbLQvAeiDnkcjf9bQ+BFiK/YGskheF
	uchWo+V8vqTBSTJ/vWHwoKp5sOW4UhAS3kVhCzuWpUja7OzQI+4U77hE5
X-Received: by 2002:a05:622a:1443:b0:502:9abb:c919 with SMTP id d75a77b69052e-506e9153b78mr3429761cf.10.1771374912630;
        Tue, 17 Feb 2026 16:35:12 -0800 (PST)
X-Received: by 2002:a05:622a:1443:b0:502:9abb:c919 with SMTP id d75a77b69052e-506e9153b78mr3429291cf.10.1771374912045;
        Tue, 17 Feb 2026 16:35:12 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cd8aff6sm174993256d6.27.2026.02.17.16.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 16:35:11 -0800 (PST)
Date: Tue, 17 Feb 2026 19:35:09 -0500
From: Brian Masney <bmasney@redhat.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH v6 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <aZUJPb2jQIx2evWN@redhat.com>
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
 <20260216-atlantis-clocks-v6-3-cb46d6a59c73@oss.tenstorrent.com>
 <aZST4Yywv09u65MP@redhat.com>
 <CAEev2e_XjxD3kHbOxVYwbf0Q0cwEr96dSQ3hWZE9eLdgeXhs4g@mail.gmail.com>
 <aZT4RsGnu1qlZl-l@redhat.com>
 <CAEev2e8hwN1FBR6yMr_NeZrFx3BXNz88RHfHLhSM=GrpExsUyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEev2e8hwN1FBR6yMr_NeZrFx3BXNz88RHfHLhSM=GrpExsUyw@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Feb 17, 2026 at 05:29:56PM -0600, Anirudh Srinivasan wrote:
> Hi Brian,
> 
> On Tue, Feb 17, 2026 at 5:22 PM Brian Masney <bmasney@redhat.com> wrote:
> > >
> > > We have a group of gate clocks that have a single enable bit shared
> > > among them (instead of individual enable bits for each clock). We need
> > > to keep track of the number of clocks within a group that have
> > > requested an enable, and only unset the bit if all the clocks are
> > > disabled. share_count is used to keep track of this. It gets updated
> > > by each clock. Hence it's a pointer (and the mutexes around access to
> > > it).
> >
> > The code currently has:
> >
> > struct atlantis_clk_gate_shared_config {
> >         ...
> >         unsigned int *share_count;
> > }
> >
> > That pointer is dereferenced like this in several places:
> >
> >     need_enable = (*gate->config.share_count)++ == 0;
> >
> > I don't see why the pointer is needed. Can you drop the pointer
> > and the dereference like this?
> >
> > struct atlantis_clk_gate_shared_config {
> >         ...
> >         unsigned int share_count;
> > }
> >
> >     need_enable = gate->config.share_count++ == 0;
> >
> 
> In this case, wouldn't each atlantis_clk_gate_shared end up getting
> its own copy of share_count? Which is not what we want. Or maybe I'm
> not quite understanding what you're saying.
> 
> Every time we create a group of these shared gate clks, we create a
> refcnt variable like this and pass the var to all clks that share it.

OK, I see now. Thanks for the explanation.

Brian

