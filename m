Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A47A171CD
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 00:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774224967; cv=pass; b=nAuoBwtpmqhpf9YUhv0b+LzG6QH/FAdkAjIggpEhqr2c7tjuQuEG4wyCCJR9MpbDiGQJitSKkHWiR7Qw9w0NsLf3Gj3f0B8qk7IM+vCNS89FWpCmM/WRWztCCVL5W3IHZOvqXAUfuLoWVt/9nYKIlqhOHCkE2563L7wJ9Y59XdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774224967; c=relaxed/simple;
	bh=Mz4C/9cLAOaPCx0GR6OuyCvm178ZaYrumVlM4vEmkDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Urgw2/rApR4Ax1RUgIwQpYtwLQf6fcivrYUISeHx6A2F4a+hw28NvctQbjgBfRlxjai0f86JrVQtIdlGCIe8RaYiAyx4nBlTsx3GVfYvnPvNhqOGGHbf0wjbWMe1n0nYt3OvhUlTMUqt6IbPYL4r3NP1MdcxIDugTDznGIEHSFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DvA6/jeN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kPrJ512D; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DvA6/jeN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kPrJ512D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774224963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mz4C/9cLAOaPCx0GR6OuyCvm178ZaYrumVlM4vEmkDo=;
	b=DvA6/jeN/F+bukrZilrk81irRXPAKgroaeLO0GH8WjfINB4OzLtMUt/YNewBacu1Bn0+yS
	effV/p+VO2AZ5tq+kAA7cpobvT+lBYa2hkQp0Kgd9dCrceqfBxuKFrAuHT9+q8ls7B256z
	qYCYomjr0ca6prESYeLw4x/hjNtwJbo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-jp1ZNVAtO02VqFCfy3KzFQ-1; Sun, 22 Mar 2026 20:16:02 -0400
X-MC-Unique: jp1ZNVAtO02VqFCfy3KzFQ-1
X-Mimecast-MFC-AGG-ID: jp1ZNVAtO02VqFCfy3KzFQ_1774224960
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b8fa5744b82so279764066b.3
        for <linux-clk@vger.kernel.org>; Sun, 22 Mar 2026 17:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774224960; cv=none;
        d=google.com; s=arc-20240605;
        b=jkqZ5fcVneJwCQ5b/qu1IxvdPBcmDQJdRlFeW+sQtl/N8CO0H/Mcw1v5rKKKNp3846
         DRUc8sXkobX1W+wZHUcsrvmYABh858DTzcSvFkIdYFdFq5j/sd4DnOqfP9mDj78O+6BB
         VgSVrwnzUTsY0ZjEeFR0JA5y4bimDRnt6oDF2pdMU92+3jyXnhI8WWnQ2RnzMDIea9aV
         ED5Npitb+NcIvTMAk1fIYgXsYTMMin22k6cKLxzveE3tehQSy2BU5EZcVtGM956FEjop
         LvDR5VI/OjAmzWEMJbTPr3j81N19oVmkOY2fB5rAqFKamF8yL6HYo8tqjOsDZBuj/Rg7
         e+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mz4C/9cLAOaPCx0GR6OuyCvm178ZaYrumVlM4vEmkDo=;
        fh=VgFyCcn5rAD0YUo6lAsde5ZKmCrC0tx57hZX3RsKZro=;
        b=ZewA19k0bJI3bJ7VhvmLpNkE44QRwqK3nkipaPHva1Gmp6akGsfEv3S3/uCGjAkdeb
         fKkmwiV2dz2rkAHO8acWRDOdgiNErJiKyLmnFdjv8vDrgdKDG5BEYT108RiOiBLrQsHK
         SaAYHCfTI3zvNSJme5w7TZOUzGWtXf2g55wU1prT+p3A4b4sJvjvehKAwFrPpI9bl7DY
         iczpiNXBHdYAuvZ4VngSRvwKO/WXPwludF76vsBzXB4t7An2wUA9uOLhXA7qiwb4W6Ys
         21Q6MP8Ut5DmCvmZpObGNDR+DDLtRQzTyinPF1JDgDfU7HlihQOJsmyWnG4Ffh/vRXK/
         5utw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774224960; x=1774829760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mz4C/9cLAOaPCx0GR6OuyCvm178ZaYrumVlM4vEmkDo=;
        b=kPrJ512DRSW+J5WctURRy9dMghkGz0dHsmyRlP2W98rKK58/R9NG9SnVjA53wbggWh
         IKxmS8xORlnZzEx6D/n7wxKNUcGugQgJhImx6ICsKq8RUwQA/sH1zS3kVlcuXb0ooIBO
         IRoaAVPpHfipPBLNLzDAIPkrqmsi9pbaAv22ekD9XWw5dHdqXojkI7ljzTtSjeGQ+V1u
         LRMNYQYHLOiJNS7+3t2RNBvmtinwoRJRdmtAWN+BcySTs6sSTT9pzvlDpbirshpE70qi
         x2DPgZ9PDptYiSbdVtW+VpsCsWTWFlhJW837SQm+JWX0sd5OtpoA5A2bwoB3IaCrG4PW
         7KWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774224960; x=1774829760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mz4C/9cLAOaPCx0GR6OuyCvm178ZaYrumVlM4vEmkDo=;
        b=dlshQoA4qi4mwq7Et5ED+0fZqxaNkn2pSOLDC2zIxpii33Iyx3JOVPImpF297flUta
         RNh9BcZflBQHfQ6NGIvQXTJ3f24cG5K2svRQIuRWKwzM2sBu7hF/F92Ehm5S2KPSlX3d
         AbhRM8PCCF9ZGC72SXaZtmrB4uL58UDqaw7j1tJa21FyM9xqiuDEZPqvZLxCs8FMuJMd
         5BcWLUIAojPHOovHh9kexBY8snbStLNp8nO5aPdXQHzshe/rMmycqbIag0yEbvwpWP9s
         t0cHZywcvzuScjoNzdNbJH8ZvtRUo/KrH+wBlnFZzvdYouPJ7oEvnPBpNReDZ3CWFcHj
         ghCA==
X-Forwarded-Encrypted: i=1; AJvYcCWKakMkT3Dic0CYVUB/mbJkew9DBX+gs1AAst4qx/bbxtFFKMvIhL70dmJVC7yRpquapOQWfQFWQvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU30KVqKL4T7KuIKQavjk4qbXTWjOaBrbqxe/WUmpjlB3Nom2z
	8nFcKWpsQIkgOC+DMgn7Lik+b26Qx2gT/qYGp3vmoJF1lV3bV1TnoAoEU3fQsW6MbHmDCHIclCm
	jAUBQmS9/0SSeV6MNJwRHMHi7u3KJKeNUIjN3FZ2eGid6wNz6ys02rPTP/NNKdchEDaDDeFxO4O
	f1kInsA3K3KGFwR6j2MHO79+d8SRRlHnE/p5BL
X-Gm-Gg: ATEYQzxHHCW4Al5u/k/fRp33Y4oHO2FoY9gb1x2NYBU93bwyQP7QgtkE4qQx2/mAaMS
	sQp5ucFKzzz4BBqyY8n6j4PcHnV7+RtkVqsVcLRNoN1wKXYYGDqeeRPyOB3i6jB45zHqzVC8HIY
	WAGONuSbAphl+QCg+39J/QJarASHjvk5TUn4DDzvxqlXUOKEb6wumHWx/GFgiU63b+QoMomsDD1
	dWylA==
X-Received: by 2002:a17:907:cf8a:b0:b98:32c1:246e with SMTP id a640c23a62f3a-b9832c15bb8mr715930266b.8.1774224960420;
        Sun, 22 Mar 2026 17:16:00 -0700 (PDT)
X-Received: by 2002:a17:907:cf8a:b0:b98:32c1:246e with SMTP id
 a640c23a62f3a-b9832c15bb8mr715927066b.8.1774224959860; Sun, 22 Mar 2026
 17:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
In-Reply-To: <20260321-awesome-hot-kingfisher-5d9f55@houat>
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 22 Mar 2026 20:15:48 -0400
X-Gm-Features: AQROBzAoTifV84Es4roNHZ7fg_jcFEWRuoYT-h9cCD6210iyG8-nf7F7j1kSz9A
Message-ID: <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Maxime Ripard <mripard@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Danilo and Alice,

On Sat, Mar 21, 2026 at 2:17=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Fri, Mar 20, 2026 at 12:43:47PM +0100, Danilo Krummrich wrote:
> > On Mon Feb 23, 2026 at 11:08 AM CET, Alice Ryhl wrote:
> > > The Clk type is thread-safe, so let's mark it as thread-safe in the t=
ype
> > > system. This lets us get rid of hacks in drivers.
> > >
> > > For Stephen's clk tree.
> > >
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > > Changes in v5:
> > > - Rebase on v7.0-rc1.
> > > - Pick up Reviewed-by tags.
> > > - Link to v4: https://lore.kernel.org/r/20260113-clk-send-sync-v4-0-7=
12bc7d94a79@google.com
> > >
> > > Changes in v4:
> > > - Pick up Reviewed-by tags.
> > > - Link to v3: https://lore.kernel.org/r/20251218-clk-send-sync-v3-0-e=
48b2e2f1eac@google.com
> > >
> > > Changes in v3:
> > > - Rebase on v6.19-rc1.
> > > - Pick up tags.
> > > - Add fix for pwm driver as well.
> > > - Link to v2: https://lore.kernel.org/r/20251020-clk-send-sync-v2-0-4=
4ab533ae084@google.com
> > >
> > > Changes in v2:
> > > - Rebase on v6.18-rc1.
> > > - Add patch to tyr driver.
> > > - Link to v1: https://lore.kernel.org/r/20250904-clk-send-sync-v1-1-4=
8d023320eb8@google.com
> >
> > Alice has resent this over the past three cycles, but it hasn't been pi=
cked up
> > yet. Please let me know if there are any concerns -- otherwise, I plan =
to take
> > it through the drm-rust tree in a few days.
>
> Stephen hasn't really been active lately, but Brian (in Cc) has been
> trying to pick up the patches falling through the cracks. It looks like
> such a candidate to me.

I'm planning to send another clk pull at the end of this week and I'll
include this series.

Brian

