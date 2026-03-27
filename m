Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2743290B8
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624682; cv=pass; b=JGtWRMAKFXwU3Ei9qrW4jSHLBNBIwn/FezJtgCgq/pnuVLU9LeYPMrGknZDqNZEOOSMgC6/3IVMARUYdv3njLNYqOBYLyjoiniuZAMfF31bYIz88Gzav9Uwlyth/i9aDemubCnP3+E5XM8QJzZp8weQBfbpyF0oisKk2R79RIKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624682; c=relaxed/simple;
	bh=N+FUxj1Gl+zVCUHvFBWeIGI6C2A3mF/PTd7CkfeomPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opIt1KGHBpBR7HQqgZBq5CHiNY5FrX73+ftPDjk2WFfdLAVDXxXJPf1ZyX61vDzJeo5ukiu1HHcncjhJrbLCtQXYF/2DeRl0/0bhOEjwR4dlGR7fZ8N1g5zTeMoS5ec7Nm9k46rfGBGQrY37VzgTV8f+Ts/YuVdHFpkJPwNduY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J7DZ82QZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gAcajNhP; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J7DZ82QZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gAcajNhP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774624678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+FUxj1Gl+zVCUHvFBWeIGI6C2A3mF/PTd7CkfeomPo=;
	b=J7DZ82QZHXy6rPpKE7z2gacwQ9LBZbmNcXkJODpMmH/EgscFG9u58cYiOJpvpzKy/3lc1n
	KXVNKi3ktgRYlHQ+4TyPyaXBH69BWsTPv4c9qCXubjIEHP5iPkP0pPXXbMXB/GQAKcREgJ
	Fc17CCR1OBWGP5aULzRKXGHIEBGtdtI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-5RSu-FZVMOG0tUtw1pojQg-1; Fri, 27 Mar 2026 11:17:57 -0400
X-MC-Unique: 5RSu-FZVMOG0tUtw1pojQg-1
X-Mimecast-MFC-AGG-ID: 5RSu-FZVMOG0tUtw1pojQg_1774624676
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b8fbe7a6f41so150311666b.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 08:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774624676; cv=none;
        d=google.com; s=arc-20240605;
        b=hdrKukSzwPbvNrpeQkBWZZstVr5Eni2YWo7T0E/EbAH1ZBSZ79LSnYaIWf8yqJ1llT
         hasOutsVvu3YkjdwjOhX06EKJygWU5/pZYd/jk1WUc5UY1r2hns8MouF15ajGbmIY6SC
         CKIQ2mZCbwpldpEJCdec9YrNTdMm2JrYe+IdUint/OlUlk1zVBP5w20lRkpkI/7G/wv8
         UgImp92c4G3BeqdvqXhHfdEVKryvNkbl6ZlTf34gom1fcZNq78GBPHzjUzqH0Q7u0Mca
         i46b02aV5hF9IGIDBMv7q+SCzJM+4mzrKsHqEISRz190MLzbxmImK4OSyRoOrr45X3uN
         9LtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N+FUxj1Gl+zVCUHvFBWeIGI6C2A3mF/PTd7CkfeomPo=;
        fh=XlWPf1k/PGbvuIx0kQZPl3r2E4SK0K+CgwElnV1kU9I=;
        b=Iv/96OUUF/Ti15uqdFOJPoDZmWel0YuxS5AXMpp/WJd7SlL+X7Zt7pemnXOZN3NapI
         8Q2nhVIUlCBrujB9Fc8AoXnkFM+TV3xX6NDY4HhNetuNOIki1FROYjJDp/NWqmYHM0T/
         H2AeUaHIclu1g+tPhfPIinMGN+rTFT21PZ6xAtZMdiT35mbHBMGUv+f2sVqqXLLsPN1H
         mdpuj3gqV1fnJz68HjsexjQ+w3xRcEu+GMz2L3OIbYloHpY9ER/7OxaaeDhHSEWmdbzE
         PU0bQbLfM6AOB1ykDjPWn+C7hMcTwKx7O1gHrD87OIQAXK2ZiTF+m31ScoFCgX4E8R3Y
         PodQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774624676; x=1775229476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+FUxj1Gl+zVCUHvFBWeIGI6C2A3mF/PTd7CkfeomPo=;
        b=gAcajNhPcQfkyvK4Qc02qz/7Kopjequpi0qsteYfPNlILbxx0o2CnToWDSoUq/ggj1
         8TONcafxAaeqcnj6as02QIWHyHcvgruQMRl5owzPmg3dSzvUvNsdZTVnduu+bqDnc79f
         2qWst275DnOmLfWYVgGPhKHZSeQVMtQodYxyL7z6xRaZDis1/BzaW8AeiOLpGFBzdvtM
         pcyJrIcLacOx6gBRAmt+I3bcmc+u0iLrhUvd2VnqrUbUiuMs8KITWYxW3aZOdyxGZ/+Q
         puS75gcwp/L1tTtv1GzsM4xfCW13OlvVjTN0rJTHXambgfGtQLnQHinDy042fUEg8AjR
         aUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624676; x=1775229476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+FUxj1Gl+zVCUHvFBWeIGI6C2A3mF/PTd7CkfeomPo=;
        b=NTnDU0RIUE7QexDN7BcZj5Rjfa6aeT1iifN17K9j48xOcxKpQ7EHOf+nmHwXZsHURn
         kkbtQfyWUH9h2Qtg/g22+jaiuqHVXXc5340I4QRJlWQC2O5B+s6bh2BYKCvKzNsY96Xq
         Hnqxlr+O+SRCj93lDZ9lhyu1pLDQOq83BHjqcv7BuVUB9qRshy0tiM+eZvFV7IyaaRC/
         oh8jI6CrJ71LeZ0esq1ZmohyVLD8fSbu1tQWngeX5ux27hkvkwg4jkIAgLYHzUiYKvCR
         ysXkawn2WX6+MHLDyF/LwYACut8v+S7NttDTf/1hAB3A5DqOTVoPCtyC4hFynqNqh/qX
         3NZg==
X-Forwarded-Encrypted: i=1; AJvYcCUkH/vvlvOYwjL16M3sUT36sZtuflUdpIR8PPfLXI5NkUiWO1KH7NZU5yTeBNXxb/0tAjDN5HfJ3Bk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDfSqfHwlUh5gYEGl9k2gUQZKNHdhIiLkA1/YCQLkd1l2E9PO8
	2ZikXSysPX8Xx69LZiFCzFSS0+aYL6eNwSCagur7DUCApLPtga4TeiMMHnzy1tMKitXDyse83Dy
	Zk2v9RmREG0Vru792VaXEGCxk7O6L2Ne3AWlQ5TxqI19x6GwbVSKiwPVVM/iA0cRrjQ0D1YBqzq
	3K9VEV8hEqNxvmNbVC9b7LMlJc7AJSk0tKlvyP
X-Gm-Gg: ATEYQzwjSfqKurapw23TBes4Ej0plv6XWDtMBjmk4EUF1hjskLBpBvEn6jgskKgJ1IB
	TXiNRb66POOVlAVjcxzSzvm7JAwVU1nnV5wC06/SCNycyKQ7YSAXjn1lBOEDXwULtf8KFOyjg3D
	DSOE2ixgOFNAKrScXPhzBfvKsNO8iR9ujh3VUrOplxMUGPmGLAM7oonPOu824+++fLRHRgCABus
	lmo2A==
X-Received: by 2002:a17:906:c112:b0:b98:36cd:7e14 with SMTP id a640c23a62f3a-b9b5095329cmr217768766b.42.1774624675956;
        Fri, 27 Mar 2026 08:17:55 -0700 (PDT)
X-Received: by 2002:a17:906:c112:b0:b98:36cd:7e14 with SMTP id
 a640c23a62f3a-b9b5095329cmr217766666b.42.1774624675436; Fri, 27 Mar 2026
 08:17:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
 <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com> <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com>
In-Reply-To: <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 11:17:41 -0400
X-Gm-Features: AQROBzDgpgoaKrafOSYhxekTKjnPTVIaXvtE8lmpvFqxHDMdDYL6dEArDWvsT-E
Message-ID: <CABx5tq+TdGvL+SCUe87qWFgeAq-1Zf5w63jn2hLe9+YTyz4sNw@mail.gmail.com>
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

On Fri, Mar 27, 2026 at 11:00=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Fri, Mar 27, 2026 at 2:19=E2=80=AFPM Brian Masney <bmasney@redhat.com>=
 wrote:
> >
> > Stephen came on the list and started to merge this things this week. I
> > was going to collect up more patches for him if he wasn't around, and
> > intended to include this. However, since he's starting to collect
> > things, I'm not going to send him a clk pull today.
> >
> > It's up to you if you want to send this in via drm-rust or wait for Ste=
phen.
>
> I guess it depends if he plans to pick it up this cycle or not.
>
> If he doesn't, then it may be best to just go forward with your
> Acked-bys -- Danilo can pick it up if DRM needs it in their branch,
> otherwise I can pick it up.

I am not a clk maintainer, so I can't leave an Acked-by for you to
pick this up unfortunately. I've been quite active in the clk
subsystem though the last 6 months or so.

Brian

