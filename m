Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC914BD366
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 15:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005042; cv=none; b=jdSY2rHPqtY+SOHqObAzpoVMtqewtWeMGM8KQsmSQziE/mCCcZJDAyJGAaJybgVsJM4g+lDD1qTwOyBhim+WxsXe963lRqbYu2rkWgcAVdtMikpMpIHPDCbZ/vzUQl3HLNlxPC/MW728xh6pomdl7wBSEvaif7QfuWiJswS72o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005042; c=relaxed/simple;
	bh=XgUCGVJLhIlUmnyZQ21SpI34kHHRrPg2RzKmgwQLt0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRuVyJIGZWj+2aV/ZdpyjT1UIX8uMqqiqBqfrwcfzuWf/L/RslJpd9lPdcRKgJ7yBu2z+7DuM6MedOPL5kAeM2nwDMFdGuqmBckVARjTpDYAIgXPg9JvFG2ihnE8195yPwc74YWZWVBu2RParwRQx0Wut+7R+w7WWzUxOzT+jns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wxy0lrPo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XkfW4h4B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wxy0lrPo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XkfW4h4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790005038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d2LwH2cP1qS4tI8C535iQCzn4GaCMcdwd0hMiPIjiQg=;
	b=Wxy0lrPoo20W5/QEbwVI6zhjpWFU8XUick3XJaGH30o9huaevpYIZ1fsmveMQpP3pURjsO
	r0/dP5OL2Na71bELJ08E/O8TpyIUUyK/6viOW2IBGgOAsFMCHj4vbhDZvxwWDXlTdEAQtX
	Sta5kLM+0GItNPMETFT35I1TNx2acgo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198--mkI0569OLaaD0yh-NNpiA-1; Mon, 21 Sep 2026 11:37:17 -0400
X-MC-Unique: -mkI0569OLaaD0yh-NNpiA-1
X-Mimecast-MFC-AGG-ID: -mkI0569OLaaD0yh-NNpiA_1790005036
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104c2ce026so91626126d6.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 08:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790005036; x=1790609836; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d2LwH2cP1qS4tI8C535iQCzn4GaCMcdwd0hMiPIjiQg=;
        b=XkfW4h4B44QD5Sf2VLzdkuzV614JwCgfxMgk/aPYoRtAVqRLNpeZ+r4m0fwpQn7Uwg
         7hYUSzEBreXjHI0+NdRym83af2jC53LSQ+70Znw/125GW3k4f4sv7lepNl0rWbH0tnU1
         hwqfaqTA0+io+rIalArmbDJXQWRx0g7hy+iW22ds4lUH5lpC5OKCFHHOm5wEb68zcUCf
         OT3YNJ+YdimsvSnZjmXELGvdzDaYkYPiXotTIxHhSnMHgJ2452X0231HGVAIhPkNR/SV
         Zs0i+VUM5fpvp8MVnkjVvH96RClkaxXxBaJr42bWMPUHXfDj8wr1eRFYOs7y41ElZk8S
         twag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005036; x=1790609836;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2LwH2cP1qS4tI8C535iQCzn4GaCMcdwd0hMiPIjiQg=;
        b=Mn3xgqbq7SfOjG9hILLyvjDgfmetJsELnXelj0HXzPV0FiWP9eZynE3Rqh/2v5E3xC
         EDbQ4jlmhTV04x5Na2ANcW2aKnSedKugXWve5r3hh6T/+mjGf0kpcG+2GjG5v4ouAu/a
         FeHLynokJyGiwaKqTq1lbZWseZ27ia5zIlry2NwSQ5bskwdpikRa7OWC69yyzk3MruKQ
         qtdGm7mrMJeZN+wrOSNOz+UyQRCf5fUP049ZRo1nAYnsBmUxIDk/p7h6ocPgZQZW94rO
         u6I7AKdnzvdXB0Lj67zBPCahJr5dTg5ccHwRW8nGcDbzErv+16IZFwfwCsaMn7HkDW3M
         Celg==
X-Forwarded-Encrypted: i=1; AKwUvBz7M7YjdlFF0I/gddtwooEV5kt9q+cO7DYsXKkm56zEW3QJeRaF2VEeBvIh1cKlvI64B1K2NTv2HRw=@vger.kernel.org
X-Gm-Message-State: AFuF++kRDSu6nTJLBynnpgldwWIYVjZZL+7B/QHSlywd44alPs3qDVAk
	kd+VzlnVkjA9LoLJ63b1Bu6qjzjIE3U2/cjN7C1/53McoDD7Dp/L/0K3TagnKrNj/ZMQLQr8gEg
	eFcrftLMAvZSyyL+OYNY+LyRxYrJ9pROBeb5KbQhBYgzBpJshSffgoz0Vkrkcng==
X-Gm-Gg: AYBFou2KYJFgCSDy5d9seQ4nyRBqIrpj1BAxnuzR3VPrKftTqMulS0Nk2xuU1VYk10i
	+WpnbnFfTDfTE4AkLrSQ/mbpQ2gjysbDPe2IRPlDTq8+t9eZxR1Em5aXIf24HfKvjTqAb93Kr3x
	dnu33mXEWZalFabXnSDfczpvqYNzMaxpJ6rE7YsE7saVsm/IrSPAzqMDWOYZ5o0z8mJHWfSVzo6
	i/SySioNi5iCN/W5hd1AcSreq7AA1cNJRlpFdzH1ljerzLePztwfxKz+YhccJu794KFCHgffe9C
	k07yzplXisCPplwNN1gsbq9NP/HkVFJSf9F55+/2WNtxPCbLw1PyYqEbq4NCUM54PrUYZXUtHKL
	lpru4o4LEuGEEuqSjxQk7Sd+mj6IeJG4QT+8=
X-Received: by 2002:a05:6214:4118:b0:912:517b:910 with SMTP id 6a1803df08f44-913fc994924mr10057886d6.47.1790005036373;
        Mon, 21 Sep 2026 08:37:16 -0700 (PDT)
X-Received: by 2002:a05:6214:4118:b0:912:517b:910 with SMTP id 6a1803df08f44-913fc994924mr10057426d6.47.1790005035845;
        Mon, 21 Sep 2026 08:37:15 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260aa1c03sm70584576d6.39.2026.09.21.08.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:37:14 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:37:13 -0400
From: Brian Masney <bmasney@redhat.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Georgios Androutsopoulos <georgeandrout13@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: clk: document overflow panics in `Hertz`
 constructors
Message-ID: <arFPKcA1RCecTfMD@redhat.com>
References: <20260908225615.1732105-1-georgeandrout13@gmail.com>
 <DLHSL43HJVOM.2LMYD808W8FPN@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLHSL43HJVOM.2LMYD808W8FPN@nvidia.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Sep 17, 2026 at 07:10:42PM +0100, Alexandre Courbot wrote:
> On Tue Sep 8, 2026 at 11:56 PM BST, Georgios Androutsopoulos wrote:
> > `Hertz::from_khz()`, `from_mhz()` and `from_ghz()` multiply their
> > argument by 1_000, 1_000_000 and 1_000_000_000 respectively without
> > checking for overflow. When `CONFIG_RUST_OVERFLOW_CHECKS` is enabled,
> > each panics once its argument exceeds `c_ulong::MAX` divided by that
> > factor. None of the three documents this. The panic occurs only at
> > runtime, when the argument is not a constant expression.
> >
> > Add the missing `# Panics` sections stating the bound for each unit.
> >
> > Fixes: d01d70205601 ("rust: clk: Add initial abstractions")
> > Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> 
> As we just discussed at Kangrejos we might want to harden these a bit,
> but meanwhile documenting the behavior is indeed a good idea.
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Brian Masney <bmasney@redhat.com>

I assume this will go through the rust tree? If not, I'm happy to take
it through the clk tree, assuming the rust devs are happy with this.

Brian

