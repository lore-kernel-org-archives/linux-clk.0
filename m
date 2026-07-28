Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33DE54763
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785237968; cv=pass; b=LMLour7rzjZounm7XG7IPpquzeswT9pMnJlFKrTGAFGKF+PsYNKWrHEku5z+iEmQcB0HPtzY+kwGn1OgYnY0UmG3EyRZBh2BegYWhRTirf7oSA2JhtrZ7Om0H/gYpPPC4RfJ/CIwqQry165ao2wMa2dCj/PMeNMktSnYKTjta4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785237968; c=relaxed/simple;
	bh=C5zV99XhPg2mn+m3yVcctP/BfrmOJgNS14zU4scFyvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQrA4rL6c5rnE04qLtuRokCwgZkcfuweMTKA7dyiw81Y5LBJAWixlj0/6es/bmV6M4D3evJoewTi+HdS4Z8seP3825ihrdek2A1an8HOjQHFW13/sDEMO84EAgtYxqc/SI94l7B5bkcMFehJIxv6G3RbsCQ34/3f64xhgXWtmq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=zzAJUMkz; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="zzAJUMkz"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15dd4b9132so543999666b.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 04:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785237963; cv=none;
        d=google.com; s=arc-20260327;
        b=BaeKLFfkGFvviAeufCKOf1YeYQ59aX11viuDnBsENAJSSUaM+RmDbzjd3iTX6zjxJB
         FcC4fkJ0uR5ITTX8V0XLirXpb6pKaH8I6D72dUmPuesREMqWWK2do4o5goF3dRn9HZQl
         YFphF6C1XkIccJQzayMm7fKCwz11FuFkmSKaGz2/c4L54p8JsjTtoR6tkoSAszxlnfWb
         FVc7Wjl6FsX7SsUi3n+VDonW8jomFQqBmI2u6hTs6EV5m+dScjX4I3KT2D9LKhTnj+NS
         +whSljCSZt4bogSk5zX8tFAn9BGmfXUg+gJZKJ35bdMNlTgGce2oO+PY47D84bv3m7v4
         dKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lek6cL4/AbRQCXtH33ScvBhO9kuHePx/FpqKIeX9tRE=;
        fh=7tNG4P33Jph9mVgmaKu5RohA0sLT02Fv56ks50/dnpo=;
        b=Udp3guI2kC4WFSJrlV6vvzvsQHXFRTlVXXkbBeayuj4PO0lcLFQuMSPqbaYBIgAqqF
         SiXYB3t2npUK0mwWqwVIo5WPbugrdzs/hI0pdVsNo5Olp4qMGQz+yyql/sEBKca81HZO
         1qI4kHKthOac7LhRvgm0UwDzSCQY5CVR3r/vGVL0iLhm4TAodZfZljNw2emFi5wVhZoq
         iaO7KbtFRPg5j/fVhv2nKsYpw/Ud3ZkS1N6xvD7cta4h07wucAkJcEbLQTBfmdc79Hh0
         y6xQBagpgXss3dNJL4mXMztHDgsL0GTnbClmLscBx1JmeCKBkEFDRYJU3dGPxCu02o19
         32Uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1785237963; x=1785842763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lek6cL4/AbRQCXtH33ScvBhO9kuHePx/FpqKIeX9tRE=;
        b=zzAJUMkzZ964OodzLd2temAbiiCtp1GWHa5tQehubQkRW9LYaCxz3Hk3ideVl4+Nc+
         wiLczWznF4iTaFdzUu7ttH67FtiJk40RSw+zGDkxB/hVKXu9dS4WLsdTDtXlV2o261/T
         ChLqJzjYK2PXIkX0CkaA1itQ3caww5u05V7f0n1GC7POl9Y+82q7i7sz0unAZfSA+LDb
         gtKRYAmdOLfWwpbwzc7TM06mBC7h2sJ0zhR0jSPNw/LIpiYFwVA0mIqp4FUKx8EASGd/
         4R8Ewun6tDQqkkMDYwl7I3n6EM983vaWHl4Nxh6Yir63bC2c5R5cXAJhU63VFVAG55Ld
         bAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785237963; x=1785842763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lek6cL4/AbRQCXtH33ScvBhO9kuHePx/FpqKIeX9tRE=;
        b=gEMF2LUFBbJ0uDfo6Pgdq+96Qz3KrGV9J4Tc0KhWkf9rY/Wc8OTCXQlMCFNdVlz35i
         6FvUMi1nVvkZv5ykKfPAa/zCkbobhUv12pGkXT58AiDCjGEMZH8QS+ycOlNKcicG86bM
         0jYSTzCAGyjguvv8H+RtSGRt+DkHRijvEsBgw3MdwYAh0iUN2DoNil80E2Nl8cqJNeFe
         di430tWj9YwOXWxFD+Ks1VCrJI5LDpxNUHveT4BaG9pVPlj6WhoRIqBXbAVlTQl+lMlN
         rkTkJIyUpHg0CLJcPkkZGcmawgc4JL0QvUCSStxuBbYS0ZnVVxn5aSJNQWIMdeBBexCd
         fiBw==
X-Forwarded-Encrypted: i=1; AHgh+Rqe+C+y7RhWHCoCJ3VhbO3mg2+nfWeeoawdaOfuvZucVeHvSmXtg1JpRkg6vPLzV0c7lylJDExhf08=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4vB85LNHcwbdBieR57XFBr+Uvft2V14wkfcvIK/lns6YcI8cX
	3xDPWyXYHjqQ0/lad3VF7AT8/ALc8FX4yxEkcK6KH5obbBzaR6pfdfBTRsLXLhD9NTzrOZBoPan
	vCnIVll8LMAlQtya+/OcspT30KxonwDvwO4XdXZkMrg==
X-Gm-Gg: AR+sD107bDrNLrO+pDHRbIPJkTzMwdaj2vLtTHwDr0cvM+SesRQ8fMzsA0vVepxpn1z
	OzjW8nXhuzZTE9wbdC+qGHJiG7r838GpAJXs9+XE0J0B5fFwOBFv6mQ39Gakkw3DXIWKgRq/SOX
	z9nN1NchbnKL7+qBiUMpiqlC1vMmGkdcF9BcPaoczETV5OQqjH4EzmLATKbm9iddF2zndaCpo7t
	ex+kyhNTnCyIxDt9ABiHsxZ21NGEG4D9qYEw7iSto2eu4yBOVxwG2vnluS5xt8=
X-Received: by 2002:a17:907:c80e:b0:c12:34ed:da14 with SMTP id
 a640c23a62f3a-c1f72504745mr91551666b.64.1785237963102; Tue, 28 Jul 2026
 04:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
In-Reply-To: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 28 Jul 2026 15:25:47 +0400
X-Gm-Features: AUfX_mxMy4BRnDAVX9M9UW7_BMaDykpALH1nDWvPyZtvog3_VcfjLyQR3l2_74U
Message-ID: <CAKTNdwHcJvpjkG741j-bCTePb5n0wiu53eHctT8qfP4NdVCqVQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix RK3576/RK3588 fractional PLL rate calculation
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Thu, Jul 23, 2026 at 2:22=E2=80=AFPM Alexey Charkov <alchark@flipper.net=
> wrote:
>
> Fractional PLL rate recalculation for RK3576/RK3588 doesn't correspond to
> what the hardware actually does due to two issues: wrong denominator for
> the fractional component, and wrong signedness of the fractional
> component. The result is the kernel-visible PLL rate being off by about
> 2 MHz for the two affected PLL rates vs. what the hardware produces.
>
> While this fixes a real bug it's not a regression, as the issue was
> introduced in the same commit that added the RK3576/RK3588 support.
>
> Note that there is a separate unrelated issue with the rate table, namely
> the 2256000000 Hz entry currently leads to a VCO frequency of 4512 MHz,
> which is just above the TRM-stated maximum of 4500 MHz. Also multiple
> entries in the table end up with Fvco < 3 GHz, which according to the
> TRM leads to a PLL period jitter of +-2% vs. the +-1% for Fvco > 3 GHz.
> To be revisited and optimized separately.
>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
> Changes in v2:
> - Split out the denominator fix into its own patch (thanks Heiko)
> - Reword the commit description for clarity (thanks Quentin and Sebastian=
)
> - Add relevant clock derivation formulas and key constraints directly int=
o
>   a code comment for easier future reference
> - Link to v1: https://patch.msgid.link/20260721-rk3588-fracpll-v1-1-b289b=
f17cf17@flipper.net

What do you think - is this good for 7.3?

Best regards,
Alexey
