Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F5754A7ED
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 19:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191901; cv=none; b=tZXBfFyjRfT+VvqF5Yw+n+tQm/4ipo2wUsfqGPeEQruKpyeom9/GPLHha/zyrTneNInzERGHr2fnk4xRVVBHUE4FqRrrXxuMtSJ1O5huY2d+gjVPMcKLzZo2uIsEVLps+NJf5OEzwAWHONE2A79uSbiu74Vkb9fXgAdmMGwsg0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191901; c=relaxed/simple;
	bh=6iupfhzSHmFB3n5I6wsdrPypYlAtg1EjTEHMjDviSIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGPMegxRSOnTEOvhLCHGkuMcCxJxmgG43IOW7ivQazQf7dRm27Mp79R91Tn/XNyy8bAsCcqk40lS+Ij0pVPPKyCttilCztSM7PP5SYRUo3yWPF/UVsNBBlFWW8QPPbFmeMA+Aqqu8nBKif7LucxSfxv8c9gMMnTHOojVp2PpWgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Is7mSpCF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dRp9jP0V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Is7mSpCF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dRp9jP0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790191898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ovivw96bNcYL69Xo4W26bbtJi3QOHW7T3qBHC1K/UZc=;
	b=Is7mSpCFEi3PjNGLWfPoI+vW2SdyN3ZQvj4kb20womUBMOvoWVXMt7nfjvSojkx8rtk5TR
	XewifqYwuvreF7IG8CRjxVtOz3lWBomWniiEK08lbNQNBeClUZPJVL++gd//4xaIZbrt5g
	c0qViOIuePEN5j4ruZZTNR6cEkzBH90=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-ChMd3y1fOrya8HqmsjjI5Q-1; Wed, 23 Sep 2026 15:31:37 -0400
X-MC-Unique: ChMd3y1fOrya8HqmsjjI5Q-1
X-Mimecast-MFC-AGG-ID: ChMd3y1fOrya8HqmsjjI5Q_1790191896
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ae8e7e546so231484085a.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 12:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790191896; x=1790796696; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ovivw96bNcYL69Xo4W26bbtJi3QOHW7T3qBHC1K/UZc=;
        b=dRp9jP0VZB4lw1/HxJBfjLhHBlDy9tDQ1yh2s8H61FNfp14Nd2qW0WZzBixyq3eR/D
         //hfPXFZKMXPT2zibaH5TYECnYVnxZUFH+T+hgJpzvqM4LTaEvD7lPM8qfErNGKTmD13
         qny/6CaDVDIM8R72SpsGrR9oLgUbJ4lJ6jbe8Nll1u05tjiVbtNWlK9SINYi7bw+8T2v
         JdrVWhWhUblN1e9DOKawuUbTR7d0F1SWDqW2sTBTiPSYYSHvj38DQRY+6a9fFhiTOoyR
         n/0GI2nBQK09RzzeAZfxalMnQCGlSpU3QNG4BM89bWOPZPlDa1sPpn74ykmriYXI6dmU
         TUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191896; x=1790796696;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ovivw96bNcYL69Xo4W26bbtJi3QOHW7T3qBHC1K/UZc=;
        b=Q5/TDk/E01mjcKstoTUewjemlYFfyMvXTxAcqlhq0WqI2JMxZi/bL3b1rldx8SvwwP
         Pk94G6xlxNMvWxbON+dJospwaGU6lCNiUTaytD4WitlVoSwNc3h4TdIyYm+MjwuwcEYH
         lZjhPVaS9tCJD3DKuxRgAF5dIlEHFhjgaBGGD1NrQXNnREyf2e2s0QCQT/9zyWMP8RY1
         7IES1nmeqwDvaIBRpkrbBzfTlwPWnSClrNDDI1R8eT66/UeIyuuOLjBN0lrWQe1DRMAU
         vhLWHrMiwcbzP/qNASJE/Iu6lAmWCGOVUMEudk1v3mNVdO/zq3+vb0gTKlKZxjK83PV6
         JMkQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1jLKG7Cq/AsZklvsdqG7tmjZujIwxiHSJ+k7AxzF7Hl+rHt+7UnRo51Gft7Mb9h1yisQCZU3+Uzw=@vger.kernel.org
X-Gm-Message-State: AFuF++nMjrSlN4sakvDZC+WwfrhZckWY9KFTMJdeP9gSJRin70hkPsR8
	fOsAAyijuilg492ID5ldDNE/p+K+ZpguFsoxX3C4zYgAN/jfUWn19acvQ+d+EaJ/GkF1ZKP2RBy
	S5zkAGVvf1qgySnnlcMijX4HjcsJtknxmmuZZLoZ35Pnra2P/zExCxfXUr3MyBg==
X-Gm-Gg: AYBFou3DcQRxX6ouusggeSutnBGnaeF4yF6NUiF4JG/8POJDzi5fXvDER/lfN8t611n
	LQB0d+HswznT7Y189m25I6W1bFOg9OoRHU9hcb6XOs5pOG1EQO/U3jjvZ0fnWwhkRmmBoYjKuN+
	ZbBOj342JdlqRTrE/wksZXCfl37lfpUEwv/ul3o6IT8D6hKYfxMoyFg7Ti5P07SwHPlmo2kgvft
	g8VMkK1BS9mrgzfPz8qvW87qjDyb8MMSgTqhIebHJvlpHq6EOnrr6Lqv+VvBzX8s4m2XbS6lbJ2
	+/7ixOvs1/BeUG/Oa3HXysOPhzlrM6iO3UtfAxutTpRZ+kmS4tuao6QFhsTzbYB5dsSeFsAsqnA
	w6Id6Te1N
X-Received: by 2002:a05:620a:890e:b0:93c:18ff:a0b with SMTP id af79cd13be357-93c3470da05mr22943785a.29.1790191896489;
        Wed, 23 Sep 2026 12:31:36 -0700 (PDT)
X-Received: by 2002:a05:620a:890e:b0:93c:18ff:a0b with SMTP id af79cd13be357-93c3470da05mr22940985a.29.1790191896030;
        Wed, 23 Sep 2026 12:31:36 -0700 (PDT)
Received: from redhat.com ([2600:382:8529:2779:5d36:56ab:46b2:2e62])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248bd54esm297435985a.38.2026.09.23.12.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:31:35 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:31:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: clk: document overflow panics in `Hertz`
 constructors
Message-ID: <arQpEx3LI5D5_EVf@redhat.com>
References: <20260908225615.1732105-1-georgeandrout13@gmail.com>
 <DLHSL43HJVOM.2LMYD808W8FPN@nvidia.com>
 <arFPKcA1RCecTfMD@redhat.com>
 <CAH5fLggOMBVi3DjQSmLtstnntgJQzDsQjEt15nRkiNi7EuLB8w@mail.gmail.com>
 <CANiq72koa5rBohoBg4zaawBUPuhBatGouBzqTWi8djxMaaLacQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72koa5rBohoBg4zaawBUPuhBatGouBzqTWi8djxMaaLacQ@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Sep 21, 2026 at 06:08:46PM +0200, Miguel Ojeda wrote:
> On Mon, Sep 21, 2026 at 5:51 PM Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > My understanding is that the "default" way patches land is that the
> > subsystem also takes Rust patches related to the subsystem, and that
> > the rust tree is a fallback tree.
> 
> Indeed, the idea on how we suggest setting up the `MAINTAINERS`
> entries is that, by default, maintainers keep control of both sides
> (they are the experts, after all) and that, hopefully, they get more
> involved on the Rust side etc.
> 
> It makes sense for reworking the subsystem, too, since it may happen
> that a rework on the C side may need adjustments on the Rust side etc.
> 
> The file is already under "COMMON CLK FRAMEWORK", so in this instance
> it seems fine.
> 
> Brian: in case you want it (but it wouldn't be needed!):
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> As Alexandre said, we may want to rework how these work (instead of
> panicking), but documenting helps for now (and whether this counts as
> a Fix or not is, I guess, up to what you usually do in your
> subsystem).
> 
> I hope that helps!

Sounds good, I'll pick this up.

Learning Rust is something that I want to start to do this coming
Winter. I have an existing userspace project that I'm going to convert
from python to rust.

Brian

