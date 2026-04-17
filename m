Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C74A34E74B
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 13:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432087; cv=pass; b=V4ZSLERoZmVPf7bC69Xpg4AqtwbaCCcxY5ilTc17SEr5TZCEv+BIZXAlORhvhMjksgUv3gj5C0KEIc9niquTxpOctPPrYZShA88nldYkVhQzcMlUWEIasHtZ72RC9mTJJl+kmeC9ey8POpZmyUxWSAFsbpeKsX5WAomDWnL+91o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432087; c=relaxed/simple;
	bh=kI0N6QQjh0tI4EIny2tcL+kK2lCNv5JgbdSFpCdFlec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=npL+6grMmw7iH/Kz2alGyqGOx3aGh6ysRi46rNYrAuWW2shHPwRmNGcein8893g4vgwW9cgllWPq8MoxdtnG9dYaxfswD771jc/YhpYyipW58upcOp65M3g9xUxHFd9te54D77cVVoT92XjY+BTiA9SL080AqETNKELg+2WFvjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSoIMcoc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DCGx/w1i; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSoIMcoc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DCGx/w1i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776432085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vhkR8ww9uqquP99F0+9R4fQYgPW3ejfry8pMlRoU26k=;
	b=MSoIMcocxjbd53eb8lDOJl/j0yF+Cz/N+OdNSgO1CpK9HKEnBaTJzeor3UUwTXiTy2uZf9
	K2h0sTF1DNPrpnJEis9MNWRjTBflF3Yp3sZZOUcBQWLVKfdwQVACik3nftghtrBmSWtDzQ
	mLBqfBhffJEqJCAoqRFpLFQZ89J8+PA=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-KigC4IyLMeWUfrw8Z1BVnw-1; Fri, 17 Apr 2026 09:21:24 -0400
X-MC-Unique: KigC4IyLMeWUfrw8Z1BVnw-1
X-Mimecast-MFC-AGG-ID: KigC4IyLMeWUfrw8Z1BVnw_1776432083
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56ee7e84f9eso474649e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 06:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776432083; cv=none;
        d=google.com; s=arc-20240605;
        b=kK2YGcGzl8+Cpm4Mpb4cH6k4E7N6cFDl5fOrhpEmip0VJ2stlpBwPLD/6qBtxI0ket
         tfAaXyqgTRa10dh+C2tNWYtSf5r1Thiy3nC88PB0oNIXBwpBXALm73RVeF7Z1jmoJRM9
         afQDAEutsUK4w0nqKPIwNSZKee/NfBWOO4RHnUFlKY/Wv2hDVsHHbFot9dolOQWerHvZ
         QZ/qWFFEONuNyc0hhr2suXYMk7BIm+XM0NTDE+Q7Dkriid3YILqT40p/1N7YYlM9PYM/
         wHIUOd/Bbzvaz/qYVTyulebDSw3FMTcJXBth+BrMzLFmv90k7T0c7iAYxg9iNDRqda1L
         EOww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vhkR8ww9uqquP99F0+9R4fQYgPW3ejfry8pMlRoU26k=;
        fh=Y0w5bqKa5gPnRjMf6OocWJPPAdDii/DfwwYNH6SMa7s=;
        b=ZkNKcxMeoFbahgp8Uq2n6M0hz08CbksZvXP6BCO6yZNke1h8tlogqQh93M1+SiEQOV
         2vFhHtvHZl0KQnoSZmuQBn5RiXvmPLukru0SHadol9fF/RvbevnzN4GyKGlvxrWs/a7G
         SCdUD29NgwPPsKLo+6sPfGpAtqANJg4YpqzQI+hguQ3+JAmPv2L11s+tBM6Napu8UpdU
         IWtBtFsKQ5ApNzNEjeZ3D7ztH/uAey3duWL+4djiSXoc3hVo1y42O9rTEhjlMF6RO3+w
         0CNJ0mzk2D/bnVHgauqRIBqbhrQGNs0O24Ho8Ya8CUqmHPf4d+Vu3K2PwISAFdRb0Ur7
         HQQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776432083; x=1777036883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhkR8ww9uqquP99F0+9R4fQYgPW3ejfry8pMlRoU26k=;
        b=DCGx/w1itbMuA6yjzfe5J931mGm18c94X/jLhRscBdudH5X+/jj9WQ540fESevYyBC
         V2JavNkhoEXBpXSKuqMC7lNwyolMSSlm3YlelNUrxUp7YhZGQfXwJSm3oDhEhF+hIbAz
         juwEHrxJEkhI/ShjcGaRLVXpGFkIEL1YyaiS+1d98Q0XAa3Aj5R8d57SGcQ67GodBtui
         IPBc65YLJw0czjvzBzrdRSr0PVn9kIlUgCSzkW0t7uY0pWcSRGYhlbbi0m/JkgqzYw3d
         /bEbvbWuKNwN67JvVHCJdQmbu+pJPg2CVEqeq6s94C7+lcCm5rT4i9E6ZOqygeHNXcEP
         MXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432083; x=1777036883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vhkR8ww9uqquP99F0+9R4fQYgPW3ejfry8pMlRoU26k=;
        b=mFa/lyUsw3MTfJAdEwXvOR9AmwBNk8J2agshUlHSxDfjK4tBElder0HRhig2qqF7kw
         x2RsEVx9OUGgZAX3Yf3pbJ0F37NaxcdRbSSAyR5eBdrO4ipXTiX6jkbAjyS1vs/gGy/9
         i0kqTC3XOumERMBZu03ghxHk+EOfu39WneYah7KXz7s06+wT78ZRz1tIQKbWeN/HzR5U
         2cUrOeIH0XAV0a/+wPsVaynBSkIEIu2GtCISjPF95K6/7aEPT5QtacIfsBzma7SaT4WJ
         BADXfB7NgJjq1lnpI5OOUn50kVz1jN7DBr8vbRj6sZqEUdiyv8Vy4mnivVcSZFwYd1Ti
         C7qw==
X-Forwarded-Encrypted: i=1; AFNElJ8xGuKX/A4qnSt7Jppxh2DF7h6WEJT9ZNGBIgEqYpLpaN+KElDMYnfjeR8dqE1TcUfzxG5P94+S+38=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUL4e8tJzQdshRdDer8eDNABW44DfbaN33ak36TgcNne2B7tB3
	4tV3bYqxEV2ZPIVSpCsus19EkV2+7lM6cm82o6mgDsdqRXkJjGsOa/VcAe2VKmhjmbMJBj5OFgz
	VIX4Onm7nPXZT7+GPtwdfv2g2kKr1SwREak5Ol3pF/8z06GBXLV7c8ptZCyoY3INZpqI3weotiO
	g7eeyylizGWqjodT/ETSDxG3LCVcw9HTPhwrZAxiZOdzKp
X-Gm-Gg: AeBDiesDa1FMF1ltBCGfUPzMimC1Pm2NwXClhqlk/P6A7N5aMjgmtKi348GJt8blSnQ
	IUQ8RlQ/jqL+GK9aPkzDOL97cmFuvS58eEMKDOUTsOlea1GP8I2ZGPsj6nObiL6dTUhCS13acE0
	shNMtci9F1ziw6vtxq+/cwFxWXacOSrfhxrF6p0t8x8oDb4kFt8z1ZTYY7R2lBV0z6VUVejIKkA
	7NEZwPDct07orBRbp+aytL0
X-Received: by 2002:a05:6122:4d0f:b0:56f:6d11:b962 with SMTP id 71dfb90a1353d-56fa57fac70mr1252983e0c.2.1776432083283;
        Fri, 17 Apr 2026 06:21:23 -0700 (PDT)
X-Received: by 2002:a05:6122:4d0f:b0:56f:6d11:b962 with SMTP id
 71dfb90a1353d-56fa57fac70mr1252936e0c.2.1776432082793; Fri, 17 Apr 2026
 06:21:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413124912.3260571-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <aeFWGYaRownx1jdp@redhat.com>
In-Reply-To: <aeFWGYaRownx1jdp@redhat.com>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 17 Apr 2026 09:21:10 -0400
X-Gm-Features: AQROBzDWBqSJnk8R9ke7imMJ1S0GHgJWPy1mQjjbiQQkF57D15ZbbfpRJtYXdyQ
Message-ID: <CABx5tqJ2PJQgiHpq=wBrobhHzU9bPgE0A_Y7khg9PK-pZUzX0A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: divider: Add some kunit test suites
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lad,

On Thu, Apr 16, 2026 at 5:35=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
> On Mon, Apr 13, 2026 at 01:49:12PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +     /*
> > +      * ULONG_MAX is the canonical way to probe the maximum rate a clo=
ck
> > +      * can produce. With a parent at 1 GHz and the smallest table div=
ider
> > +      * being 2, the expected maximum is 500 MHz.
> > +      *
> > +      * Before the fix this returned 125 MHz (PARENT_RATE / 8), the
> > +      * minimum rate, because the search loop was bypassed entirely.
>
> The "Before the fix" comment should go in the commit log. The comment in
> the code should describe how the code is right now.

To demonstrate the existing issue, you could structure your series by:

- Introduce the test as the first patch and have it show the issue and
the current behavior.
- Put the divider fix in, and update the test for the new behavior.

Brian

