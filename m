Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3AA3168E8
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 11:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767958250; cv=none; b=OVs6K973dGtiyaldJ9rJ5fpFyTxEfmZGMg0qlbnrC/HZKGlIqGjnaMM1g3VAAPUQlKxR2UopGthHCS3MDJ4SU69w+GHsimJKQ+FpKSxdnKcgPLPMMZZnRFOEAEO15wUuY9TIJfPxfyY04VRrIBLHHA8wHgKFaM/5v/mTy+5y6nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767958250; c=relaxed/simple;
	bh=hX8QoInMSSmT+Eu3xppZ5ZFqPNqLP1E6amFpuz+9lV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MywpvHnz9IgT+6LYbRLOzz80XiwsRChbmvRwSsNa6u2aHXQKZJtOr25PNuZw0VB6KEMrqe0UHuB07oZCrMz6hzZJis7He72YZKOiuNEUy8BjtdtqTuyYx9vGoyQIIM5gFAWJhzuQam2bWHT5qzsBY5PHDfq8WWUFLiF9W9DCdhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LUiayFCP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NJSTU7mO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LUiayFCP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NJSTU7mO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767958247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DxP3jexOTjA2W5uk/m4wnMS2LnFu0zsvKD0G0RKhxtE=;
	b=LUiayFCPqEugTkYADlAQfah2YQA4xFm42/XV4VJ7duv1z1OLxCW0p4NKAiOU+wakihVLdE
	llrQFIGKUE1uC2pS5uBUwC7qJoB++8e2JrGINpbl3s3sjBvdbkUb/URMlQLHg8hc5wViO/
	LNM4ljo1yKuE9IyUT1FOYrjDcs3bJUU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3--eqhbDMCNrCIMcGnNsS07g-1; Fri, 09 Jan 2026 06:30:45 -0500
X-MC-Unique: -eqhbDMCNrCIMcGnNsS07g-1
X-Mimecast-MFC-AGG-ID: -eqhbDMCNrCIMcGnNsS07g_1767958245
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b8012456296so386361566b.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 03:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767958244; x=1768563044; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxP3jexOTjA2W5uk/m4wnMS2LnFu0zsvKD0G0RKhxtE=;
        b=NJSTU7mOtwnhJXfP36cVMGwLq3xjUBXrJAtsTJso7yLuJZZogAmx2hFIv9RcjaCIbd
         RZ0KWIm9mAzBgtXjOEQLk4V29OJyIhO3MAnhsR4WGxjqmd8jkarJc+cutFXkqQxAHOgi
         qK0oknSZF7F3RpVBgP9Mmp7WLPfsFGZevelTpsdP/ayBg7kUkHqd50M4cNaLSiVr+16l
         AJe6X0qCIW4n4N4E/UDcFxBT//hJX3LaYgm5KLrNj3P+g0qTQeTDlZxwdqAaGljr7LYX
         5pBtwceuX9FMZuMlZRDa7v2ddmA8bJjF4DMPNsUm22JahtuYckHmTqvMngXmI97nNnHo
         8q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767958244; x=1768563044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DxP3jexOTjA2W5uk/m4wnMS2LnFu0zsvKD0G0RKhxtE=;
        b=rtVMIwKsRbQbLAkck1eUaHxM6PGta2NzqjQ/47XBZaYTE3039LxgXhpQLNm3vspdYZ
         hQAWqVgDKw2snQZruW7uduCHf9hHVv/qNl9ocxt9O3urhsu6oZQoanNz2m37ZAzqzqfn
         E6nAUEkz9wQMi6nV7VMPOP2n1yIsa012zIja5r9cUgfRAfpotBShaH+/Uu4MG0JSe1YJ
         eyl7s74B1qgkv9mHDOxQXc+u5I4I2bx8RVpiCS+/XrE2GZeDsPXZrzELIEEoatAc2t8R
         /R3GC7kowI3jhXBy3a5WiojaMSCe8NdIaS4QCt8a8NJ93w9tMcXcQRcKgtcazRLx27aa
         cYgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH3kqMdhnumXkG+9nB3PIXjysfx74Klkk0VaawWaJtIzabmCMg7G6eFdITyaosgwoyvXGHGkmbX9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4CEJrwc9Un6leSTh7J+k63+WQ4U/W9ajjcMtiIOTMNZ2Z2tr4
	grqL1o7jWmfU6tgkBg8uWh9CZ9RJBQZqpdQb3o47B3Opc5OfeLj6luEH4kLRn5crhNXWaxM7i94
	OMV+L4vqh/lokgcw/eABKkw2RvDKXXBTWwD9rFou2AbVv+d0H7kw+pXeF+f/3mntyAp2nJ8KXuD
	+CxSCu+E0uGqizno9SpQo6fK2fbuWMvlO1a3Hj
X-Gm-Gg: AY/fxX7tE4Jd5T1v6XcCFZLZwNTsbLfod+upDv9AG57vlgyYhtuetNA0hkTBVGM/GEG
	y97TxIyfaMXekJoVyMz/UGl1YiOqpkQO8SO1Gwz7wJubInCE4xv9WqpXguWqeNvKpg68Czn8oHG
	T4XtRnaRsj5dxYZhyeQdw9b8fT947BPlLLdbQSWtfzikEc7Pw10n9zBHuzNbd/SXWztQ==
X-Received: by 2002:a17:907:d93:b0:b80:751:ee5b with SMTP id a640c23a62f3a-b844540cb89mr901506366b.49.1767958244600;
        Fri, 09 Jan 2026 03:30:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVmXeE8AhEfK6T08eNrAxn76T8DxtU0Qo65IkfrZqE8T7XU9qkdX19TO393u/6yx6/Sf79D4T/ROQEGFrKr0Y=
X-Received: by 2002:a17:907:d93:b0:b80:751:ee5b with SMTP id
 a640c23a62f3a-b844540cb89mr901503766b.49.1767958244088; Fri, 09 Jan 2026
 03:30:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
 <aWA6rNLNqYfJKTzf@redhat.com> <baaaccab-3ac8-47ed-b4c5-13401d08228f@tuxon.dev>
In-Reply-To: <baaaccab-3ac8-47ed-b4c5-13401d08228f@tuxon.dev>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 9 Jan 2026 06:30:32 -0500
X-Gm-Features: AZwV_QhwqP9OJmcksKErXzol7iiFllGhZ-NWTltU-KzJ5qLgs2fV7oABV3BpO6A
Message-ID: <CABx5tq+eOocJ41X-GSgkGy6S+s+Am1yCS099wqP695NtwALTmg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] clk: microchip: core: fix issue with round_rate
 conversion and allow compile test
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 2:16=E2=80=AFAM claudiu beznea <claudiu.beznea@tuxon=
.dev> wrote:
> On 1/9/26 01:15, Brian Masney wrote:
> > Hi Stephen and Claudiu,
> >
> > On Fri, Dec 05, 2025 at 02:46:26PM -0500, Brian Masney wrote:
> >> Here's a series that fixes an issue with my round_rate conversion on
> >> this PIC32 driver, fixes a minor bug, and allows building this driver
> >> on other architectures with COMPILE_TEST enabled.
> >>
> >> Changes in v3:
> >> - Mock out cpu_nop5() in the case of COMPILE_TEST
> >> - Don't return -EINVAL in *_get_parent()
> >> - Link to v2: https://lore.kernel.org/r/20251201-clk-microchip-fixes-v=
2-0-9d5a0daadd98@redhat.com
> >>
> >> Changes in v2:
> >> - Add new patch to drop unused asm/traps.h
> >> - Link to v1: https://lore.kernel.org/r/20251125-clk-microchip-fixes-v=
1-0-6c1f5573d1b9@redhat.com
> >>
> >> Signed-off-by: Brian Masney <bmasney@redhat.com>
> >> ---
> >> Brian Masney (4):
> >>        clk: microchip: core: remove duplicate determine_rate on pic32_=
sclk_ops
> >>        clk: microchip: core: correct return value on *_get_parent()
> >>        clk: microchip: core: remove unused include asm/traps.h
> >>        clk: microchip: core: allow driver to be compiled with COMPILE_=
TEST
> >
> > Stephen: Can you just pick up the first 3 patches in this series? Let's
> > drop patch 4 for now. I'm going to send to the MIPS maintainers a patch
> > to move arch/mips/include/asm/mach-pic32/pic32.h to
> > include/linux/platform_data, and update all of the drivers to use that
> > new header.
>
> I'm going to take those though clk-microchip tree if that's good for ever=
ybody.

Sounds good. Thanks!

I'll CC you on the MIPS changes to move the header file.

Brian

