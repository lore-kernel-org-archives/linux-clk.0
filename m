Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962E934D38E
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630480; cv=pass; b=HJL1myj3vuzFco1A+AI2oM+LZIdr6TKJf/CLfdKXFJK/855kadRDeVUtAN5NFlzbcgAxEZyub4BxCFhsWoiBUknwOZOsViTH00++LV2aMJvo8jF3Ec80psqhuzkZsTLP7m+garqevF2QSNL/xsCLABDhTp8Wqh+JPG3PZu2hGkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630480; c=relaxed/simple;
	bh=AA7FXil+Trih5c1d9kWVytFuGXphEJXf1NURtb9SB3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gOTJ4DIUU6duC4J/bx54RTc9buaKUI8FYndviSZmD9BxF30kZS+6cjK8WO6qP4U0jw4lRJNisXxOP1evwFlW3i1ZzM802JN8E/tMZOeO2KqPCRvR0J/7F95zoEBBxUkiTJSQ3mPBasvlJGSU6MfUR+T8QiMBy+hfqy+0MqAV/ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M+lM8qSm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kkWJRpFa; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M+lM8qSm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kkWJRpFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774630478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AA7FXil+Trih5c1d9kWVytFuGXphEJXf1NURtb9SB3E=;
	b=M+lM8qSm06aaM2HXue/gJ+V2Twiq0p5rLC3hXuni8aajFX1Gep64kDG8y741Gwuva60l49
	6kJAWv5LfVjpmxOuUB5TbrP+FEBJ+IjvMOMXO5h6SdB2fsqX3j+I6cvaEbk1sDPKKqjRuA
	Q2yvUtceEkvg/4B3HikzSJCPoLYJOnM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-C2A95ZECM668RcZgXkMIMA-1; Fri, 27 Mar 2026 12:54:37 -0400
X-MC-Unique: C2A95ZECM668RcZgXkMIMA-1
X-Mimecast-MFC-AGG-ID: C2A95ZECM668RcZgXkMIMA_1774630476
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b982051b914so276630766b.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 09:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774630476; cv=none;
        d=google.com; s=arc-20240605;
        b=eL0q6WaEK0EkT1LUrTIrcYyY233mcngpevkUfY5jGuOhOjG20SLs7KpDV3ry5MHuAp
         WoaYSdH4xn9tpWWGfiwiVja6YxmM2z8mg3+aRAdlFb9XfQjg20lPv14rsAOowr132Ljl
         QqYTROnAAxZnWoAcNbHC98E/pNg9r/D8GWgmS9kP2ig9U10p+MxsF2lk3ZFQxMyNfzkF
         lrb19mc98Hp3RqghmTy9dZt9fCLCzIeseY0WX3Y5y1jOXWcds81q8594WygpiE3qLFlG
         R8mC5OHS7Awtm7+kxaPaU78vJw+Nq384KC31NDhUxUNkkKbwa/30lf35KsJjGPtbaiWO
         vJDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AA7FXil+Trih5c1d9kWVytFuGXphEJXf1NURtb9SB3E=;
        fh=cF63xe/nYaeizpSYVzpgnF0N+GKCRzM7mUU7a4zLxp0=;
        b=QLEeHDi+Nt15PsMRcEHuovYtev9iDcu2UkQpOwZ5hZKUSuWEhPJl7Ee+j0WjT6t99/
         2JHdeFiJLvFNhGvGol29mhZrFarZYHhkCGg99jxhXHG/xfz0tqOmghsRzxenbcob61NT
         aWJClUQ3iUINWm16+bpkxninlLGmUSDVVFtTv+s40KF/uK2q9YyZTfCUHDwux2C+XvrP
         70o1nx8yXEUy06jHkZrZ8ueL8x+4Wo1DxzSpifVatCxdg+9RjITYKM2zjKksIC+te8jG
         a9i7eDvUz0/IuajH0vceYEk0WWqdWO2ae6VHvX7qOcW5lNrKo80xLFE4fbxI8TC/Kfs9
         x7cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774630476; x=1775235276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA7FXil+Trih5c1d9kWVytFuGXphEJXf1NURtb9SB3E=;
        b=kkWJRpFaLyDrk3WoOy0rPbhglWs/Ir/9/QatWq7O/Jg4mmx6vLZiw2I5NTKWMYSYtA
         D0RkgtgU2x0yuaQ7SLApFMghsSo1nAtQF9KffUV9E8AhQt4QMlKxqgGBE4ks4R6XMEQ5
         7P+0XrC41+C3Hg36gdqdx6GDto+ClKnwPdNC7NIM2aTswQ7UTuEvBWWdDmRgQc9JidIF
         HQJC/7l65+6FeJxrC/CzRoPxN66RRD5f4IuSvH30BSg7qaBV3E0rTLvT0/dJkIHUZvTM
         Sru9rWyG9+uuy2CMjOyw/H9mrBzDjf+v6XKKYvAPlJ6wsPXUWcYU8zidQPSQYz8rEiXw
         7knQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630476; x=1775235276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AA7FXil+Trih5c1d9kWVytFuGXphEJXf1NURtb9SB3E=;
        b=lyPB1nIJb9DXh7gylNniYsgU8yO1lyOJy7I2TpaJKzuflNWjrEaFNH7r8fLBFreZPo
         jhyBk5TqInH09xYcai1vb77DJFKaaTV5lYVoPw0dyXAqtCF1AUnZQDVI0G0EuESu5cu8
         LDcxeG9+ZB49C32IBmvOCbYlovrzEkrt6C8ajwNGBwTxNH1v01bsIUWa+/PLszgj8aEI
         /MtoSVkbHAw1k7Ac4EHXQOD/pq1z5evlMeKYl8NWMd60XDYEoOkbDwGmwDmY5Aryv+ib
         8QcH+UGZuzjGa4s2z7+gvh1Y7G6GsWe1UmxRt00y2ZtuNE0I+Zl2MSQ3WnWoSk9c9DAw
         pQJA==
X-Forwarded-Encrypted: i=1; AJvYcCVWDAqgudklZs6yMwLWtpsKvE0+aOcZA2s5ifq0vk9U1Zw4OYGuw6MQIIYwRwGKPW/hMInaA929w/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmDrr89UqT7GLtgj/av1WIP+IaCbEcYJmR9boWDYfbLTrLzFgy
	73cHEOHKgUsPM1AeQw88ygXxlmAJ0nlHx3XsgRT9J3hcNSt+aI1UpoO7Y7eq5QYeHaJ15E+ZY94
	uihHmA96u7kVQBc8k7VWo3FMtPTm8B5KPcsS6pm8rr1K9ZMxSh6gFfxIbSsgCNiOPjEqZujkn9a
	ElsHESYIXIvevWdbBnIdtgH/ZI+EH+N/nsRiKa
X-Gm-Gg: ATEYQzzwa/P7QZlmREvQAscmWEhA1mOAPq2hJz+OQqJBPEWkKcz3n1qvtD8vqdmij2z
	ZLLwl7U0VUjp9fAIuToK399QigO0EjP+iu0IM20nus4XWbWIbGogL25h6hnRPKw2xMpzGDcGkVe
	mGapvLmeTsa4mKMXTsAPq2ZN81ROctjpnNdZ7FsS+D02qu2fa2w9rFvQvrMrq3XQjtnn33ph0xa
	BFcTw==
X-Received: by 2002:a17:907:c294:b0:b96:e11e:97a3 with SMTP id a640c23a62f3a-b9b509438cdmr207734466b.51.1774630476015;
        Fri, 27 Mar 2026 09:54:36 -0700 (PDT)
X-Received: by 2002:a17:907:c294:b0:b96:e11e:97a3 with SMTP id
 a640c23a62f3a-b9b509438cdmr207731766b.51.1774630475513; Fri, 27 Mar 2026
 09:54:35 -0700 (PDT)
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
 <CABx5tq+TdGvL+SCUe87qWFgeAq-1Zf5w63jn2hLe9+YTyz4sNw@mail.gmail.com> <DHDOH1FXTIZT.1QKZIPZ73YNLI@kernel.org>
In-Reply-To: <DHDOH1FXTIZT.1QKZIPZ73YNLI@kernel.org>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 12:54:24 -0400
X-Gm-Features: AQROBzBbM13XF9Lw32GUQ1TlyrNM8BNb-Fkj0IVXkv6U0HfbzJXabBJAUaFVI5s
Message-ID: <CABx5tqJho=k88A1L0neVeaiYCXpLsc7UjzGSgAug73ZC_amYag@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
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

On Fri, Mar 27, 2026 at 11:42=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
> On Fri Mar 27, 2026 at 4:17 PM CET, Brian Masney wrote:
> > I am not a clk maintainer, so I can't leave an Acked-by for you to
> > pick this up unfortunately. I've been quite active in the clk
> > subsystem though the last 6 months or so.
>
> I'm not involved in the CLK subsystem, but maybe it would be a good chanc=
e to
> offer stepping up as co-maintainer (also given that Michael seems to be i=
nactive
> for a couple of years now). :)

I mentioned to Stephen at the last LPC in Tokyo that I am interested
in becoming a clk co-maintainer. I've sent him some git pulls for some
of my work the last few development cycles, and he's pulled them. For
this development cycle, I collected up some patches from others that I
feel are ready, however I didn't hear back from Stephen yet:

https://lore.kernel.org/linux-clk/abLV9vjYxXsKciHW@redhat.com/

He separately pulled some of that work via the posted patches into
clk-next this week. I don't know if there was something he didn't like
in my git pull.

To be honest, I initially helped with reviews trying to free up time
for him to give feedback about my work to address some long-standing
issues related to clk scaling that affect DRM and sound:

https://lore.kernel.org/linux-clk/20260323-clk-scaling-v7-0-8e7193dc9405@re=
dhat.com/
The kunit tests in patch 2 and 4 clearly show the issues. (I'm working
on some fixes to this series right now based on feedback from
Sashiko.)

I've become more interested in the clk subsystem as I learn more about
it. There are other improvements that I am willing to make to the clk
subsystem, however the current situation has been quite challenging to
be honest. I will help with the linux-clk subsystem for the long term
if there is the possibility of me eventually becoming a co-maintainer.
Stephen can have veto power over what goes in.

Brian

