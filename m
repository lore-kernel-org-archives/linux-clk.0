Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7815B374E45
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 08:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700189; cv=none; b=u8HJW9sSS0P8Ddc/++QcFwaQsS8/0yVhUf7WAw16K0MXNMJddGtAfIFBHoPhnJzueF25gQXFGDXA68o0qYa0v4zZvDtS9SuSD5SqH6HtpqLM9jLx0K0z9TmOb2zeijcjYjTnHYFbp1EYN32pnQ+vPKqY8P1qZgjEKy4DUG3p2oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700189; c=relaxed/simple;
	bh=mbnSWoGtpVXDY2O/y7CT2oXvHtcIcvxxDazvTWMlsag=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j1htEwRMZZX/7lIezJlkARSaqrAF++3Pb7qb1N3lHkQcdvTvym352fbWqgLFg1oEutIWM1fuEnPlZQbl0b9yjeFQ9XMnFqDXH22GI3EaCoptxVjf4Z+rw8rWHfdkoDkSYnrvC9i6kLtBZSLQl6q/BEH2mTvhW394liLd1XInvcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OU7o98Qc; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OU7o98Qc"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48071615686so61095965e9.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 00:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772700185; x=1773304985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImdwXMFzfOswNPEOQHnijbZ5BxVnmvmjujol0/tafME=;
        b=OU7o98QcuPVQYKb9DcL7V1O+c1AaYuWMz390SqtiMJOIli46Gr7spJayvSgOzH1Rc8
         /eOfoKZYvJ4aeZimQ5X2CoB5rAKThlUyfPSaG+BMTrn9J7ytSTXrT7llVCcx5zBz4Jn6
         30irGrazQvupfYSz6xfQg73/rigoijIQC8vievagVrIGF1OlaVeznra1DyxMlhJp++6Y
         2R/I3u+oGM1In7960b1S+n3cmgoWETLXsOSaGEfun8QklPw6jeifKw32QGdwvF5uqmB6
         /Pzfe9v9eSKaHpSstLupNYsf6LhZmRAum64bUjjgCiBxV90LQUtnvZx9bMlExTIKyVlz
         bM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700185; x=1773304985;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ImdwXMFzfOswNPEOQHnijbZ5BxVnmvmjujol0/tafME=;
        b=axev8gsYjbsd4RFgVLLve4Uvc6S67tC6MQpSpoe6AMIiRbaCj9Iy+2jdTn/gxSdy0d
         oHrE6o5nhHAo0zvoimieENSYoi096sQgjJB2oF0rRyecV8/Bye/N7AkdMTFXcXdYamSZ
         Alf8FLu8BKzpxDHourfByBJZc9ZU7SBxk/3vneYqJnMbCjJ3NOvJ/82kHwa+Yqpr++ao
         53W4LYtDlQfcqDKlCpU5SLA+SQyPnJS/lplnMWr3/wONXok2LmI+3cJ9AX4zwoM8TKry
         +Y7tJpo8FxkgHd3cxJc1slOvnom/EgqBu/GLjbHjhxov6TL+W4Sz2aKs+3ewN0UZFGff
         vd+w==
X-Forwarded-Encrypted: i=1; AJvYcCUbS9bI2lU56W3brQcv7VFiuDhgrlLNKSabs0NhSrCDxATIAXP6AivR55W5JfjrLWM/aP4xeQtOz0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlGiGH37fz1Ohy719nrYKOMDdmiyqAw7EkXt7/sgD0fNpC34Vy
	9b0sf8ia8JCyGapwNfSG9HeuEQscqbmkKcVp/ViUzXaqgtr0pwFQuXPZSct7N3xsffGx2+tMQXI
	jgOWFwe59w84m71p+Ng==
X-Received: from wmj21.prod.google.com ([2002:a05:600c:255:b0:480:69c2:3949])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8f:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-485198d8b81mr83642225e9.35.1772700184640;
 Thu, 05 Mar 2026 00:43:04 -0800 (PST)
Date: Thu, 5 Mar 2026 08:43:03 +0000
In-Reply-To: <aak9ZBJenK1DSCEt@monoceros>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
 <CGME20260113151335eucas1p157cd966c5f0f4e477fb11272810a0ae8@eucas1p1.samsung.com>
 <20260113-clk-send-sync-v4-3-712bc7d94a79@google.com> <90657b83-1cff-4c7d-adde-9b560c2be7c2@samsung.com>
 <3cfeounnaphhezvjpz5igswml6iu3b6jhwhjn2g4ziimjdoefi@ge4ezxx6jxlr> <aak9ZBJenK1DSCEt@monoceros>
Message-ID: <aalCF0Egy6gWXdBK@google.com>
Subject: Re: [PATCH v4 3/3] pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData
From: Alice Ryhl <aliceryhl@google.com>
To: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2026 at 09:24:33AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Tue, Jan 20, 2026 at 09:48:48AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > On Mon, Jan 19, 2026 at 10:45:56PM +0100, Michal Wilczynski wrote:
> > > On 1/13/26 16:12, Alice Ryhl wrote:
> > > > Now that clk implements Send and Sync, we no longer need to manuall=
y
> > > > implement these traits for Th1520PwmDriverData. Thus remove the
> > > > implementations.
> > >=20
> > > I thought this was already merged :-).
> > >=20
> > > Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >=20
> > If I understand correctly this patch 3 depends on the first patch of
> > this series so I cannot pick it up via the pwm tree *now*. There is
> > another patch pending for the th1520 PWM driver, but as of now git seem=
s
> > to cope well when merging the pwm's tree for-next with this patch.  So
> > it's fine for me if the series is picked up for 6.20-rc1 via the clock
> > tree.
>=20
> That didn't happen (with s/6.20/7.0/), so this patch is still open in my
> todo list. Is the first patch still considered for the clk subsystem?
> What is the plan for the pwm patch?

It's been on my todo list to try and contact Stephen to see if he can
take these patches, or if he is okay with them going through another
tree, but I have not gotten around to it. He has not replied on the list
to any version of this series.

Alice
