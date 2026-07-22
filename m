Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247E73469F6
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728470; cv=pass; b=OZXOQhTkdvnzGz7Ex6dwkbv9qvBenu0CVU1haIOXgbiBQObtQDvsFQkFgVpSfU1S1B4KCo5XaTP+b4k6FV+3YXi78rZ6JEckJbAeVSapzZyhItgeDl0ddeDhyvkucJurD4QXqfuuuQj1UNwZx/9KLyA+jrk0JpWQ6ViQnfQXiHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728470; c=relaxed/simple;
	bh=awrVTQ1VekJ4Xb6s/ONNNBSESRBX7h9MN6iG9XhSyGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZhTXdQt1ftsTOPFO19tuBBWkMy7FMcR4YHWdZhXRHQZgyBxiZEvcDY5D7CACSgP4uXPNS9otW3lE7lewe9epVXvXp8uIk4YEtdCNshvL4AMrlW1baKr17Kdgbt3as9kzPjMoepSVsIDDFfhJQOAJ0n/8HeoiSC9exEsYtOozVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=fySxZuBQ; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="fySxZuBQ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15c42a45adso943760766b.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 06:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784728467; cv=none;
        d=google.com; s=arc-20260327;
        b=LlALEh7pfl2MtV3WIKZ8Vgw+jvAg1AzeA1jK+c+bIxzaXbEM5kK3FnrRM7Zx8UcJ3C
         oH6g5LA/2UBIbQg//OvCpHvYjHjh9KldvVsxDVwocVVlALmytba12NKhYiAZmEksCWx8
         Z3TF1Bo5uifDw8z1ohvojQmolENLsKFEVpt/63vx6sRpVDTz/n5gIC6yyZQ3Pwp0W38h
         aev/BVjUcyoYre/E/CPcfoZoypenNns/d9eSsg/JGRJLARCLl11GmOAOTBM35ftNxUOV
         5iTqz15DfoiuMUyV7lMayzutcfcB6wlFtwprTeIqcWPr/NFyqA6kbbjNM607aqp6RMs8
         oiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=awrVTQ1VekJ4Xb6s/ONNNBSESRBX7h9MN6iG9XhSyGo=;
        fh=y5fu5sQhfhyqlrb9SJj3tKGJ/SYdphH+Po+HDbcuzAQ=;
        b=TYhiOMkPAijsRF/vDSug5IOt2BD0EFTPMJl3jS7wIcqcoVonAx7M9FiM4PC9cldfoX
         YbGSbRAq2Vsq0hIZHcYjTG18kLlN8+JSV1dCQZRwL3Lxe+1Hz/OV3Bo5FKvrMSkL9kxt
         uDPQbQX5MhMigoTzkOy1UCrd8UGe2Us95W+LojuwiQ+KMCF0n4am0ptXrEKKA0XXWFPQ
         Dw6KUtqhEq8+OZ5A+1I6SUI/W8mBSGx6Jzd9cHM+Uka3hT+qpQ7fHtoxFXr8EcHkNSFY
         HCriM/AQdjl4inFg5tcvC/NWnxPNr6Lg3mFFpmLAkf65juZd9StFULCpoxuARPWx1jCW
         uZsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784728467; x=1785333267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=awrVTQ1VekJ4Xb6s/ONNNBSESRBX7h9MN6iG9XhSyGo=;
        b=fySxZuBQu0vX38JPx0SJ0D6KzKbm3CefrMsp5NY0AcpCNZR+FUp13qJMM47m1HQ5yG
         YcoWsc1uw6vDPh/jtZP9DRs7QsWpnFCsNJjii0GxQ16cYWbkB4SWUXZFU7ZgqWBv2fAV
         kykEeEBFEQlvCs8S3SGLd98RKfSdkao5C967L5hjrzlPRi9KluHsQI8iehgYa4xZfZXb
         MBf/6CfhY2G1rabWNJHgiTmQQxo8OXIQapiubbFvpJpFXGaqI0y0u7swfskEwtCUZk/v
         DjaMl3H/P50Mp1GFoS9i4tDiDLcyqakcXDfJxspBDj0ZfFlaZmXqMwc3oINehrtVd83u
         05XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728467; x=1785333267;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awrVTQ1VekJ4Xb6s/ONNNBSESRBX7h9MN6iG9XhSyGo=;
        b=tRyddlYB2z06dSNsHb2vXGzfhs5v7PtqsWwul5jziZrnIkRgFT0YRu/cMjbabKHfZq
         kcx91xIO15HxlO9J0DaUSrhWmYf6VhtHz4BdHepJ2mSBHJWlHxUsUmAbvrDFWcVga0ws
         8AuBQlf1b2R5BlHU34v2iQ37cwFQdu2Fb+Z5FUpRlMKq9LnjuC095UUQM8yt80YxaTPX
         +HLUdpLnVK3n/2WAEsPfqLtdE3uJr7GMvMeapRPLrT8vlp2Vfw8iqtggl7dHW0JNGDPt
         kxJ2bLssyYb/11tpSVwgGBf/hIdFxX0Idl+Xphi2lu4nxBnu2JdS2ksrUOk7BxqIfOUq
         /W4g==
X-Forwarded-Encrypted: i=1; AHgh+Rou9W57ZkFRU5AggabK7IQWrkjUtEf8LvmwU1aCD/6Myu44svgvzfmA4NGoJ7d1BNo3ZTqq8wiuYpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/wul0R1JTZ1jJmf9LyPbyxeNvjSowSNtq9lSObGwULaAfMlwW
	bJbYATAoQy5w1UMaCiyys2qias/fJoTvFe6ZuUOI08h9N/tVw+8AnqN2YTy4MEpuGfesy/yB0sv
	cW7qu+waukjwVSKw/ahXk+HFDyNT4wCrQduMX5lbshA==
X-Gm-Gg: AR+sD13dXIc6B6xijxkWudq7DSDKDS4wfE8DEWnrCTZxNXIrsO9n69jFwLprjVHOzqi
	J8m4F0qkvxzfPobDZizDrWoRbguHkAcpC5dTxpwd4ptdMHxdS4BN1+wplYDRRTf8Ep8nlQoodxX
	T8RqvJAmRKvkDWRw4xRTfyyED/B8qUVCK/EFkX4bWYM7Y75R1PAJfwhNbp5FBwcate8m0eNjEYD
	iNUd1WnjN8jl8N2iyXvjHsB/5drC90XMxWn4YdnDp7nReAmGp6Y4zTdg7TZFvqnW+buLpn1agGz
	YnCYaFqtBudrQEq3HA==
X-Received: by 2002:a17:907:a684:b0:c16:aee0:5422 with SMTP id
 a640c23a62f3a-c1c30a69e59mr189324266b.6.1784728467074; Wed, 22 Jul 2026
 06:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net>
 <7f3924ab-52fc-4fb6-91b4-42a5e55d5c76@cherry.de> <CAKTNdwE=s6XG==4HvbaEV86DATWO6egVxLgNE4LpjFaXNQP7_g@mail.gmail.com>
 <b0111164-3726-4a1b-bc3a-0e678ea2ecad@cherry.de> <amDC9ZfBAD2xbhqa@venus>
In-Reply-To: <amDC9ZfBAD2xbhqa@venus>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 22 Jul 2026 17:54:15 +0400
X-Gm-Features: AUfX_mzETQep4O3vKsGAnWDqzknYtAlD9NY9GlA6VK-u5lN0h7PUcE9Fa-TFX_4
Message-ID: <CAKTNdwFEEd2LF0F2E2yR5jPfYB4sh-NaYyXn2GTFwCpACaqAfw@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: Fractional PLL coefficient on
 RK3588/RK3576 is two's complement
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, 
	Wyon Bi <bivvy.bi@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>, 
	Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Wed, Jul 22, 2026 at 5:44=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hello Alexey,
>
> On Wed, Jul 22, 2026 at 02:59:25PM +0200, Quentin Schulz wrote:
> > On 7/22/26 1:00 PM, Alexey Charkov wrote:
> > > On Wed, Jul 22, 2026 at 2:35=E2=80=AFPM Quentin Schulz <quentin.schul=
z@cherry.de> wrote:
> > > > On 7/21/26 9:17 PM, Alexey Charkov wrote:
> > > > > Not adding Cc stable, because while this fixes a real bug it's no=
t a
> > > > > regression, as the issue was introduced in the same commit that a=
dded the
> > > > > RK3576/RK3588 support.
> > > >
> > > > I don't think this is a valid reason :)
> > >
> > > I believe Linus frowns upon changes like "it never worked, but we've
> > > fixed it now" being submitted as fixes. It's been broken for years,
> > > and since nobody complained yet, going via the normal development pat=
h
> > > (i.e. -next) seems perfectly fine to me.
> >
> > My bet is because of the Fixes: it'll get backported anyway even
> > if you don't put Cc: stable. In any case, I don't care too much :)
>
> FWIW you are mixing up things. Linus does not handle the stable
> kernels. He does the release candidates and the initial version of
> every kernel release. The stable releases are handled by the stable
> maintainers. Linus only said, that he does not want to get these
> kind of fixes during late -rc phase. That makes sense considering
> fixes also have a chance of introducing regressions.
>
> But if patches end up in a pull request for an -rc kernel or in the
> pull request for the next merge window depends on the maintainer
> applying the patch (i.e. Heiko). The maintainer can queue a patch
> with all those tags into the normal for-next queue targeting the
> following merge window. This results in the patch being in
> linux-next for a while, then being added to the master branch during
> a merge window and then being added to the stable trees (as stable
> only picks patches that are in mainline).
>
> The maintainer can also merge a patch to the queue for -rc kernels
> without the Cc stable. That is exactly what happens for a regression
> from a normal patch in the merge window, since the affected patch
> wouldn't be in any stable kernel.
>
> TLDR: The Cc stable tag has nothing to do with Linus.

Indeed, I made a logical leap here. In my view, however, this patch
doesn't need to go into 7.2 fixes (it wasn't broken during the 7.2
merge window), nor necessarily into stable backports (no-one seems to
have used the affected PLL rates in older kernels, so there is nothing
to fix for them either).

However, it will become relevant for driving arbitrary display clocks
for DP video output because several display modes (and consequently,
PLL rates) I needed for those monitors I tested require new table
entries with negative PLL coefficients. Those would be 7.3+ material
anyway.

Best regards,
Alexey
