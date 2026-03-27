Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B4D3F99ED
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 17:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633152; cv=pass; b=LkOZgjrfL9KBozTND0q8Qzsi2PRm1d732a9oTvDLiheFc1oCfy6NzZ619h4MKsNpWD6qcan8wB4S0FTrFL117nA6lhpPtGqkzr1nePtE4cSmppfz4uKV05SrmnC6P6CcCQVRfxxc73bpgVkeHv8R5juFCOLBjTw0WI8hIwOHsO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633152; c=relaxed/simple;
	bh=bT/y4JBqDvjHUf3ohN/Qg+bpv5VC56Jq9Guzemu4yO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLD2CqC9NkUO/4vL3EsSmxtcdqh0ffD+5psQ9AMQ9fr8xP2MmCifZgihuM5evY7MRNTQnMgD7WR/Ezq6MmFcwYKri0giXkv4+u4sEHrkkz3665+fdBp6utwT5b2ZbWloadUtp67si+YHtov49Lfx/vJH1UFw67sURondWphqDFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PhTpD8wo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QfLNUv+l; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PhTpD8wo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QfLNUv+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774633150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhPdolAuW7P0xgBhYuWJf3nGp5Pv13lQ9qoFlr8i+xY=;
	b=PhTpD8won2tO1Uf57i9PK5u3Zi8cwkZzmsxIO6o0wc0NT12S23ZuDQ8ARTbvznZZlJFiPl
	zGWFiTu59DMg31z7Dt5AgJNdtwbZSoKVy7hL6rbm5Q+g0c9lokS5f8S+5eKa0oNNBpfo6X
	0Cc6rBbmBUhCZTyjYappDwmQ54TmQ/M=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-Hr6lUje1OoSpzr_DrhYOsQ-1; Fri, 27 Mar 2026 13:39:08 -0400
X-MC-Unique: Hr6lUje1OoSpzr_DrhYOsQ-1
X-Mimecast-MFC-AGG-ID: Hr6lUje1OoSpzr_DrhYOsQ_1774633147
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b940da8ec09so159600866b.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 10:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774633147; cv=none;
        d=google.com; s=arc-20240605;
        b=Zjl/kUf5qzLF2R3GmZmP09FKPQSR1e7VV31wFhOU5NPQmFfSOopS7HSR3hV1HMTfmU
         eKBJFOoxQtmGtTvRsxBv757tEVgDYsM7vT6LFb6oDIn3nNLpEo6TDE52pjOrCgkEb6Jg
         8BgxY7RP80H36BJniTL4NnOXO1BFXKVPSSjnlPYReLxWWJjpg9C35vVT1TxtMM4aLLZP
         KmAmMim2E79Ay7k9R2fS94WYGoUzQeV5C++Y6XIVwUOlmxzo0VjXbMiX6EqNHFQRGN+S
         1070i+Rfh9a2KRjJ9Qc/ejyPw27Vrcn1Zd0YBVoGW8RYjA0QqekvOgLrYr+FqLpdezKx
         nJbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GhPdolAuW7P0xgBhYuWJf3nGp5Pv13lQ9qoFlr8i+xY=;
        fh=XtfAbnMNa240jFLRVXL8cEA7KDx350Sd2BDdjuo1mWc=;
        b=JDzBJfPkuaOl7Fw94x+MocTGoceC6lm+va7KKo4zOUPi/zmswvpoG0COFCWoSQtsjS
         amEGPwv+0GkH0WzE0HaJWAbCXVjlBIfeHko06Sf4O5DfNWAFolsWdSBkerHKM9sKQrm3
         IA1qQ/ebVreDZyXHAasEOB4QEKlGKmnPO4RmMGG2LeZCk7eOT/9QYYE0ZX1wjvjT+gVv
         sDWUPWNPXwXgxb5KydI5O8JxGOSb4zBolJp66kpfmKjpG3vjk5ET+R2iKDa04Ue4Zmpr
         LXncyKqfjF8zZFYgLKbe6FoEmKTKCVba+AZfqgVCsozPdat/ssuoJRfH4y5QmiuRldJm
         2Wfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774633147; x=1775237947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhPdolAuW7P0xgBhYuWJf3nGp5Pv13lQ9qoFlr8i+xY=;
        b=QfLNUv+l6bd/rbCBbdR63db+q3fSzJXvWtQ9g17GwqT7ntG6Gtqgv3QtRKfXJvzP9Y
         LjmAEVdCl7ujtlsZs+LOcN38Z16m17N4xMcCkJr/WF51ujRuCeYHXVmtVBGgomgCry6m
         kGaoVlUqZMPXEtGLvadt8KdP5prj10OT9rNefvm49mi06f1I7BUcsiOGCnzjDCCVvhyY
         vPa+fWAvH7vE4B9J/FPcSs4/gkisXqCh/phHT3l2x3Lfe20TSjivXZlOqK2lJp3OaBl7
         T1z+nx5O/DbwLAK5/7LpSsk81sNncM/F/vzTLKxJmsRK31r8jTqeAb5cxJUs7X9FTpx2
         KygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633147; x=1775237947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhPdolAuW7P0xgBhYuWJf3nGp5Pv13lQ9qoFlr8i+xY=;
        b=ihNNCKoXFUTLNKMagVpjQhza/ZjLwhXtEX/ISy+prG0w/oAs48o2ZsNYP4jBG0a0QH
         tlaGj76rVYg6PWTZ0vKCv5R47T5/gQmVMO3m7ZHyHUyI875+Sd8Wtq+/AmfhEKJ3g7l8
         UWqRqrqwP10wdG41k4MmjUIwIgQ8FTMGQuXjPcBCqpH3q3Zh8nYOGRdY6lO2y95QcvAV
         5m7Z45rX4JsHiNiEJa35nHBPlRrFm+QzjEnJHi/4Cc5IgG+Vxqi/d4RXXyOBThRI9vgp
         DqysO5gBcOelrdblTXjl5/9Vu2b5Q1StJ95zJHG8RJN2rmlwOj8q4wxAUDP8gDFBjwZs
         4IiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYBwvxelaX8caEJ1YVbme8Nv1DP55ILEJ4nT9LAvQfgXES1vM4xHdbvhNJAiLGvgZpK/li0ZXqKLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCVAJRgbypkn18i1tgjBng16jOpbx+eV7Iw1lrYW3GI9JuDkth
	PhSWsZ6ocVlSTK4uw029/OR678esc80aBSHU6kLY1TzSeZtmu3Dd7Imtet4TR2IY331X9vSWoCz
	yzPJXbLe1CrxvwWXlPu/wvla3INRYxgPLXPeE4XQRDbksi3WUJjQuTtFAk72EEgaInxMBV0BMzi
	5ApqwUq8V6wVObwe5nU63hn60lVOEy1kEPECYj
X-Gm-Gg: ATEYQzy9yKm6OavmQKPShqztqWE5qrzJMl/2qFQJu+ZhSoJOuI2ZUTa5cDdGgnzJ83W
	EFxLnhaGdV3vAEMm5pzA30c/TV9lMp4Kpwalaia2z/ngQsnj/NaYi1cBlVnhXFFlrfbgknnViAO
	l8AQSla4VgylFn4TPYxkxiICOZJIdOPYrpzGwchE7wAfEOM8r32rBv4GlhDzSPEWrA4smTYBcuy
	sunyw==
X-Received: by 2002:a17:907:a28d:b0:b98:22e7:72b with SMTP id a640c23a62f3a-b9b507a7bf9mr218778066b.30.1774633146688;
        Fri, 27 Mar 2026 10:39:06 -0700 (PDT)
X-Received: by 2002:a17:907:a28d:b0:b98:22e7:72b with SMTP id
 a640c23a62f3a-b9b507a7bf9mr218776066b.30.1774633146199; Fri, 27 Mar 2026
 10:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
 <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
 <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com>
 <CABx5tq+TdGvL+SCUe87qWFgeAq-1Zf5w63jn2hLe9+YTyz4sNw@mail.gmail.com> <CANiq72ktmUFsdpBUKnU-OvTj7rE5iZKFucubL_1bF1Ws_KYXcg@mail.gmail.com>
In-Reply-To: <CANiq72ktmUFsdpBUKnU-OvTj7rE5iZKFucubL_1bF1Ws_KYXcg@mail.gmail.com>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 13:38:54 -0400
X-Gm-Features: AQROBzB7WfnAtTWMTsWRSmdXifxpUbNDAg86GKrLb9ikVgnMGrHcwDI5L3K7rv8
Message-ID: <CABx5tqKKHvFPYrL=gjaOn+frDXfXpxM3-6oTzSo6QVgYMaEMPg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Michael Turquette <mturquette@baylibre.com>, 
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

On Fri, Mar 27, 2026 at 1:28=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
=3D> On Fri, Mar 27, 2026 at 4:17=E2=80=AFPM Brian Masney <bmasney@redhat.c=
om> wrote:
> >
> > I am not a clk maintainer, so I can't leave an Acked-by for you to
> > pick this up unfortunately. I've been quite active in the clk
> > subsystem though the last 6 months or so.
>
> In that case, I could take your Acked-by as an active contributor of
> clk if you are willing to provide it, i.e. with the "# Suffix"
> notation I introduced a year ago:
>
>   https://docs.kernel.org/process/submitting-patches.html#when-to-use-ack=
ed-by-cc-and-co-developed-by
>
>   cd9123eeb224 ("docs: submitting-patches: clarify Acked-by and
> introduce "# Suffix"")
>
> i.e. Acked-bys can nowadays be provided by other stakeholders apart
> from maintainers, e.g. people with domain knowledge, userspace
> reviewers of uAPI patches, key users and so on.
>
> Especially so since you offered to be a co-maintainer long term, so I
> think having your Acked-by is way better that having no tag at all :)

Sure...

Acked-by: Brian Masney <bmasney@redhat.com> # Active contributor to clk

