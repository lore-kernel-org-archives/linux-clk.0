Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D573EC2E0
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 13:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617564; cv=pass; b=FuPJv3OqKYfFjZ0LqTS+aFsTDxVhT1pWJU6r/ZFVs4u1inlK5sdF0WSNTxhg8wOGWgNDmg/hi0jm6y+t6SlHW3npz1avzCV5wxKdeI1TVDI7QO79mUGN53HbuEO+splBvnj4rM1ZsvW6pBdC+Vk9ZYb4sgS+1iaDVnN7aeRVB5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617564; c=relaxed/simple;
	bh=O7lSs+njbRqVkVDMgsOfygnKLYu8xaGMK8nVUk8tZOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHip8eVSbIeVj7T/jZGhnPdaO8Rbn2wc8NjCbdoeklHQL1UqETjJLz9fBQ2rgXIoULa4nTtQn5HkR7KzN9swmiKYXE6Ii0MqnRR9oT+ce82Rqkw27d0B+eOYihcN8NesRaHdvwFw8VztL4XR4sW5FSVT2Q68a6kNg3B23bWHeOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qhpsnojl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QF1+1Od+; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qhpsnojl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QF1+1Od+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774617562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O7lSs+njbRqVkVDMgsOfygnKLYu8xaGMK8nVUk8tZOs=;
	b=QhpsnojlFuqiGOokjxFbweLSJ9ox6LapcjREga4mAN61Xt+stDmHSZf8PgImmsW9O0unr5
	kXPB77M3eVDk9uDdWs/fYC2iXHnb/4hG1vUrP5474/nFEeJ6lMJgwH/4wDs9LJshsfc3TV
	LOGC8sBrGtboCscYR3imd1I5a/Y2UY0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-pegEp4S3MN6-7GieI2_2rQ-1; Fri, 27 Mar 2026 09:19:20 -0400
X-MC-Unique: pegEp4S3MN6-7GieI2_2rQ-1
X-Mimecast-MFC-AGG-ID: pegEp4S3MN6-7GieI2_2rQ_1774617559
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b90bb54d034so318013366b.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 06:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774617559; cv=none;
        d=google.com; s=arc-20240605;
        b=JcN0nd+02pFKR4QHTdQ1Jcg4XNmeLA9LjCaWIsceFptID96cS74TrmS49xG5cLLVby
         JaW1I6LBCSZGDIoqRzcw2anc7dlAEqxS2Da1GCxD9p+nWrsVe9v8KnW2z7a8Wzmyzu9M
         GKZB9kzTexBeKWlHIaoazuKMmCwtp2h6oos1tM2YEjDOfmBla1bx6MpeuRDY2WtMCmGc
         VJcMtzc6KBMSFkRuuotzNbi9Lj/gaF/RBrtpYLAkf90bj5TskT0hWO9HojOnjeB5m3NY
         7lKx4pCFHrUMW6MVB1db2WC5QSEQKYyhBsfium9rnE3w5IHwHVtPtKIKgMbOv12sox+k
         qGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7lSs+njbRqVkVDMgsOfygnKLYu8xaGMK8nVUk8tZOs=;
        fh=9clvuN5WYCgz97kpOkIajuuFkCvKTAv7GEQNLLmv7Wo=;
        b=SkqdlxZ+oEiYvB2O6pNCLjs3/lQdwoxqEK5uDZanijW2ziah1oT6XzkECaaBX1FejY
         3sZVFlbjUeQWK9oDD1fTJDIgYuj9z/Pmozt5TJ/KsTKAYctZeGM9L/DpYL5vPwPE+OWG
         KvoouV2jSWvQ55QmKT8ieoEwD2Z0R2hkXAz5L1Or8HP5JnqCM5CRzmaIpbDSTqkP5RzT
         DxIxqV3P/y1PyWEQEZVkauY8Ew3yyxfLqIBYMWnn1IPbumAO3BnbgDc+G/C9PVALMwBV
         JG9DaiHcl8AdxODw7x9djAlkjOXOxtzHarbuFHAIsE9oOGpl9YT1SeTZKLXZCqgJIyLw
         unDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774617559; x=1775222359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7lSs+njbRqVkVDMgsOfygnKLYu8xaGMK8nVUk8tZOs=;
        b=QF1+1Od+lu0v6SXLoUiWmfc2wQaHF6IaeGlzGx8vxaU0KEjgbLmsWHS7kdZuM+6E6F
         2r/zqBez4/G81iFb1QukUYd8Kp7anbhuxDbMomI95RydsDay+zMi81xoLhe8yDZrfSMV
         yF35ikU2/jwXDHO2nSpPkaV48yNOw5gVpZkNzDPh5tT1Ylf6s235SUG4bKoQniobmInD
         GEXOMMilSk4M/XAvwUNN/TrmMUGPVydz2CngdMUTeJ6m34SvRsq4kM1l/2BrB311wAo/
         UXdPA6MfmBWMeEU6YBRG73otnf8f6MTEfU7vU87hZMM0oFzq6nYFeNR57KHy+5GJ++bp
         V8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617559; x=1775222359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O7lSs+njbRqVkVDMgsOfygnKLYu8xaGMK8nVUk8tZOs=;
        b=sDQ8BMT7KtGZa2DJPWwXYc5312HI9MebOGEbPKj7h+6fDekcEM1nfhtBcIMcLeHWgQ
         oHbzJ+MylhiSbatypnp32DlqsNMdK6hBDx1UAGBhTo5DFEcfqt0GFbfsHLCczQDM/wWT
         thI5wKUCguA2vVZGhJvZSC1tSLKxSdehLU75VfAatP1jA0Leh08iQ/xaxJEMtuJXd5Nh
         lTekG0wVdAz8c5s/ACG6l/aqdg/27D9WJm20Z37Dd0t7zr+oy6AAtFPBqrJln5oC6oXw
         2eI7dnNCKwrP5NUBPWsM9DyrSyrIQs/rCypeBWg6yYQr0kkQNYPztQYNr+EhcDeMY5pF
         WvoA==
X-Forwarded-Encrypted: i=1; AJvYcCXUrbtEEO82XsSWKkWOghy4Z/48tds1Xj/lVMXs3Md6Gmqmcc0zKm/2YA9ECSeUUDg6DM6crt1+KDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBuA2IfX7f3ikH30mhaS28D4MtzDv6zMVGHQCk9aLANVeNeXIg
	uROhbtLG8oY1gnWtgmem9iOc8INLhzxq0n6Ji4oWi/+HLpcUn7/qqCyn9u1cdA2zTFv1EQ9TEBC
	RQ2+zaH9U80SXj7mpclxPCGudsnLmAWWpyKqtldyqhPhmZcyfXQPfRXCUom5sZ/fGpEpHpGlFXV
	0MCZ4uAgSFYPR27rhNFpFzbzP4f9c4ZlChWUaA
X-Gm-Gg: ATEYQzx0sslGnARqXV9h9L5Tlo1Vp9u8nQIR90nXE18eMkBdgssFwLPvZnXgS7j2XjK
	9PSU6x+KMGd468VGJyrIsHJnbrolrOzZ1bakckcZWd5SQDzz1s9nm2GgHYhAuHjbwvkZrfp2GhK
	+2o1pv4xBvqFSALaw4JodxNu2nppHxBl0ghb7vtE3mB5j+60MjiLj+QVTaLx2QQOuKqQAEkFovc
	ux36w==
X-Received: by 2002:a17:907:9808:b0:b94:82e:55e7 with SMTP id a640c23a62f3a-b9b522ae87bmr156858766b.25.1774617558632;
        Fri, 27 Mar 2026 06:19:18 -0700 (PDT)
X-Received: by 2002:a17:907:9808:b0:b94:82e:55e7 with SMTP id
 a640c23a62f3a-b9b522ae87bmr156854566b.25.1774617558068; Fri, 27 Mar 2026
 06:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
In-Reply-To: <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 09:19:06 -0400
X-Gm-Features: AQROBzBLIY29Yr2X6VCTB1TmB9iOUiQz4yOfIMWdESx0Gr_aeFF6e9jfGR2ISWk
Message-ID: <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
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

Hi Danilo / Alice / Miguel,

On Sun, Mar 22, 2026 at 8:15=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
> On Sat, Mar 21, 2026 at 2:17=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Fri, Mar 20, 2026 at 12:43:47PM +0100, Danilo Krummrich wrote:
> > > On Mon Feb 23, 2026 at 11:08 AM CET, Alice Ryhl wrote:
> > > > The Clk type is thread-safe, so let's mark it as thread-safe in the=
 type
> > > > system. This lets us get rid of hacks in drivers.
> > > >
> > > > For Stephen's clk tree.
> > > >
> > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > ---
> > > > Changes in v5:
> > > > - Rebase on v7.0-rc1.
> > > > - Pick up Reviewed-by tags.
> > > > - Link to v4: https://lore.kernel.org/r/20260113-clk-send-sync-v4-0=
-712bc7d94a79@google.com
> > > >
> > > > Changes in v4:
> > > > - Pick up Reviewed-by tags.
> > > > - Link to v3: https://lore.kernel.org/r/20251218-clk-send-sync-v3-0=
-e48b2e2f1eac@google.com
> > > >
> > > > Changes in v3:
> > > > - Rebase on v6.19-rc1.
> > > > - Pick up tags.
> > > > - Add fix for pwm driver as well.
> > > > - Link to v2: https://lore.kernel.org/r/20251020-clk-send-sync-v2-0=
-44ab533ae084@google.com
> > > >
> > > > Changes in v2:
> > > > - Rebase on v6.18-rc1.
> > > > - Add patch to tyr driver.
> > > > - Link to v1: https://lore.kernel.org/r/20250904-clk-send-sync-v1-1=
-48d023320eb8@google.com
> > >
> > > Alice has resent this over the past three cycles, but it hasn't been =
picked up
> > > yet. Please let me know if there are any concerns -- otherwise, I pla=
n to take
> > > it through the drm-rust tree in a few days.
> >
> > Stephen hasn't really been active lately, but Brian (in Cc) has been
> > trying to pick up the patches falling through the cracks. It looks like
> > such a candidate to me.
>
> I'm planning to send another clk pull at the end of this week and I'll
> include this series.

Stephen came on the list and started to merge this things this week. I
was going to collect up more patches for him if he wasn't around, and
intended to include this. However, since he's starting to collect
things, I'm not going to send him a clk pull today.

It's up to you if you want to send this in via drm-rust or wait for Stephen=
.

Brian

