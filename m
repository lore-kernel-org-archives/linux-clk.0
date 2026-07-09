Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8252C399350
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598807; cv=pass; b=fQk+uYnnp4UkIENzW2Ukop4qkALuA2DD7sssXsWmHYp4Bl9zXsJ5/oEtEdqePM4zOVqRd2ngaJviIxxpDNrhPa2Fy5Ew6mbZyzTc3kTxqgazSrh6X7hySxPsudO7b1ZcLG0BjGfucHLpemwFHBAAVbWTDGMGKHojv3F6uYwGRJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598807; c=relaxed/simple;
	bh=nupF+JGOy5gLNRy3DmIcpq1wZn9qLlTFpEoyHXrL8JI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbY1cb24dV68JtGTF3l9ij6m4C8mbppkVZuD11RWhVtmMYwVuMD7J6d9+9sJIURH91VloaYfLzPOVmJcHXpFvhpqRcClDx30kozPogIYDdxxZrurjubSO947rGcFc8fv+1v8YirOSA4OkerUn/dFzBVmosM8Iyhr8dEM77d+h40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eSRbMt7A; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QGqmAlNL; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eSRbMt7A";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QGqmAlNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783598805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nupF+JGOy5gLNRy3DmIcpq1wZn9qLlTFpEoyHXrL8JI=;
	b=eSRbMt7ALcGP6+I3nfRZ1ZxvYTOYnDvHcw5RxBlreGjuX3zaXEtHS3kj7Nv7Ru9pSnc9k7
	VBZhYvb0DWFOTMkum23f5HG+G2OGtPDjs5hDwbkVA6WfdhA/G+6zsM+G8yu5H68Iuro1mX
	VniBdqjgQa0rssQYRIkpGjIur82eYJ4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-RPlonhgSOiOZ9C4ydGyc5w-1; Thu, 09 Jul 2026 08:06:43 -0400
X-MC-Unique: RPlonhgSOiOZ9C4ydGyc5w-1
X-Mimecast-MFC-AGG-ID: RPlonhgSOiOZ9C4ydGyc5w_1783598754
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c158e733fd6so28684866b.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 05:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783598752; cv=none;
        d=google.com; s=arc-20260327;
        b=r5iXKBSIgqvV7/xKCBzVgKcW19dbAQQpFlDZYoyAu+1X5OsVV1ZjbKgO3d/MJMKyKb
         5jBHJLmfHjTh83d9cLQ+PqHRAYYrpXXF04r/+TVzuVDKvOMhgAgdMIgx3DRa8OOFUP1m
         b5epz5jWWesj3iYjFXqNXL3HHZiUpJY4E5F1MfWFVfzZSyDkqwhf3BMxA1Uzvwy5UdTI
         hwzyxUmnuX3VIJyKS7J/PuSwsgt7vLbBuz5r2GT6+5Bt6AcAxio80yXddQI6dAfFjexv
         qqviiIDngmDZ9LUotRV5y27QlcmAaeXZFyo7RL9Wd3h7t8YbmqmAPdTyp6nIupKa+DfG
         9yEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nupF+JGOy5gLNRy3DmIcpq1wZn9qLlTFpEoyHXrL8JI=;
        fh=/2kCEybajADfNpbY5NJHIfhmf0hwid39NuqEV2Rso1c=;
        b=Ch3EqBkmvdD9MI/w4j2KziH+CIKFD92BL5VJ7VW9DS0u7tHpwEgEi2lV0a14cyg//d
         PF9ihJWC7a85yMd9BKJaqqYnaeAjwbSQunijT3QoUszbrNE4mNojpJE7GUeuD8yhL7Y9
         lIuqmRs//5G1gJKatHbrPm1aJsE1jWe/zzSjNDNRfd/MzCkYcMWiTpt6hCHkzSk3Uyk9
         VTLNCvrUmO8YdiQ2CG6Gz/hmUe29Di6SKe3pmF05Fgn2upLXQgYw8eOdKZRd3Iq0ydCh
         6M30Gzlr9iE3O+aeab6VkVX7CvmXQQWBF96ZFnQYpsb2Cv3U1t92AZN4S8fmfGKrw/Vl
         Qu5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783598752; x=1784203552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nupF+JGOy5gLNRy3DmIcpq1wZn9qLlTFpEoyHXrL8JI=;
        b=QGqmAlNLCG8StFcC2xu8b9JqaImrtSuaBtfgGXt8A4R5jjjD5Vg7/jRydnwTnx9kKp
         Rmu43f8UFLExsI1++nuAEgZ7aLD1vOKC0VvPBy5tD0c1qpz5YTYNb2sWEz5m0cwIZdlA
         U7prWS1AXVH00QqqD36ZfIPZLzTvyXZWHVBtPGNI4TxGIcjQJXgKKYGnFkHWSkoFtY1b
         7sCNHXMEj/YSIksEyM6Hs688svD91azkepLmyKPskxk3laUVw7mSp9RxAAWU1+Xtek+R
         3JobNLU6j0TcrLXt8UeJ4LIl+TxXCw70zxm6ncKr73Kohru9VIwqTvJTeNR34FW32vMH
         uhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598752; x=1784203552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nupF+JGOy5gLNRy3DmIcpq1wZn9qLlTFpEoyHXrL8JI=;
        b=Up69Udgx+FYq1UXzdlPjuMqULFyX/0UOfNMSJqp3CwtDCAGibu6qsT/UE3KPsp4kzY
         0LifA9/nrNUGJHRnx7mRbwO/S9BX0k2QiHbVaj8W9tPjPmeRmMZ/3y30ZRB5KA833XOC
         JgtFluQaglaS2Rx7x+tvargoeoblq0gQvO+GyrqIlHLI2W3seEHa6vF0pfy+FmEZ/5je
         jr7PyW4YuJpGtqsnXla4s4WaYTBszW9JWrZV4hRE5EMd+3Ezt4DvEx6LUcd3pepnA+eD
         LVe2H7zqzL8UDc2cMCgWGVoF/i2iNPsl/LwyGduwdeio0LFbpPC6JUOlnsa3Ak4NFtvz
         9eDg==
X-Forwarded-Encrypted: i=1; AHgh+RryKNydlHxptWhTRBnyw1xDAwZRRn/Xx+QpBYh9cKTSGCeXvjoLYvOjKo3XGfyVYnPhTQgY8HabtMk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoh7J7aqs41OzAjo3OtPavm2XiwpVJwbiwZ0PRaoR63P0C30FS
	3d01gmKyZc5a5jkP4GGRzbmQ2qDP/WBgqfel0uoj/mWfFQsl+0ex9YbMFuFz0xXQDeTSYB6wbUm
	ryMOjCzAa/dGfkqFMshJ3HojxWgdHpVSAKlMnF4AImyosobpKhF5xgxBHmku4LF+aoU7NmX25je
	sEQagIXD1rTrPY/Ycu18/hIF0fnpQSgzFiV4Yu
X-Gm-Gg: AfdE7cnI4RCIwO9G2WSHTw4VjiCF/Ktta5ksX/OTaFx2mNr2AeRqRSZwwJ0TNKZghYG
	HZr5b6Sgh2CJC/0dbvMoso4+3ljVc4Q63S57xq5inRqK5bT0m7vOXGTvvqe4B/HvWvaZ+SxJtlw
	ORz8xk/Ucx9DZEv6SeUNU50uBz15dCHONNPeOItKE+JtKxtVa8r+bAKMa4vr9K24vltcM=
X-Received: by 2002:a17:906:f90a:b0:c12:1dd4:13ea with SMTP id a640c23a62f3a-c15ce145098mr197352666b.30.1783598752403;
        Thu, 09 Jul 2026 05:05:52 -0700 (PDT)
X-Received: by 2002:a17:906:f90a:b0:c12:1dd4:13ea with SMTP id
 a640c23a62f3a-c15ce145098mr197351166b.30.1783598751928; Thu, 09 Jul 2026
 05:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707005619.1229238-1-rosenp@gmail.com> <ak0T7zxwwSn_L57X@redhat.com>
 <ak8/8ixE7IS7kKdz@x1>
In-Reply-To: <ak8/8ixE7IS7kKdz@x1>
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 9 Jul 2026 08:05:40 -0400
X-Gm-Features: AVVi8Cf6EcgENFDFDPWtf5ppg2jncu2WbpgZuy1VQEr2l6d4u0g-_cZiV4hXsgY
Message-ID: <CABx5tqLynfd-uku+iLNHrnLu4k0rXn=yBi2oU6b2HNEZT=0vaw@mail.gmail.com>
Subject: Re: [PATCHv2] clk: thead: allow COMPILE_TEST builds
To: Drew Fustini <fustini@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Drew,

On Thu, Jul 9, 2026 at 2:30=E2=80=AFAM Drew Fustini <fustini@kernel.org> wr=
ote:
> On Tue, Jul 07, 2026 at 10:57:51AM -0400, Brian Masney wrote:
> > On Mon, Jul 06, 2026 at 05:56:19PM -0700, Rosen Penev wrote:
> > > Follow the pattern of many other directories in this Makefile (sunxi-=
ng,
> > > tenstorrent, ti, etc.) by using obj-y. This allows COMPILE_TEST to
> > > select the driver without having CONFIG_ARCH_THEAD enabled
> > >
> > > Tested with:
> > > make LLVM=3D1 ARCH=3Dloongarch drivers/clk/thead/
> > >
> > > Assisted-by: Codex:GPT-5.5
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
>
> This doesn't apply to 7.2-rc or next for me due to the surrounding
> context, but I agree with the change itself.
>
> Acked-by: Drew Fustini <fustini@kernel.org>
>
> Brian - do you think this should be routed through my thead-clk tree or
> go through the main clk tree?

It'd be great if you could pick this up through the thead-clk tree.

Brian

