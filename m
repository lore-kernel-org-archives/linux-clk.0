Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33AA3ACEF9
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 17:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566584; cv=pass; b=uIa3zoF80MZQ51IC8vBnkygixM1oGi1MPU2zHPo3y/mN0ML1c2f4pFFyIHVwRvAwMk2Mprtnnh+0HHUlfvmi/y6Di8CWuKFrac7/udU93gfJnE76QzfZz5hvKolxLh4KKRgbgj5L886yUqFS89umLjI5otC1dYf1lSY9h8H6p/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566584; c=relaxed/simple;
	bh=6YU4XgoArXKK8lKx2eYgqh9xiuQ1vBhQ5b9X5+uvwlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQ7Hq31Tu4qRNsldZV6b1/nxp/6tZdpGmooRkwdTXPYCHuc5K9G/kUJ+pqao6n9NW5OGglPxp4dAsCiF9CLWB/fWRcCyCN61n8sleOoqch9msF0IBexB+9EOXHjYas7nyLBe1FxO1YueMcGMC0ROmbpJXowZy98s7M0qdANh8i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lK9/BTpF; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lK9/BTpF"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-888cbacf70eso63870607b3.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 10:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791566582; cv=none;
        d=google.com; s=arc-20260327;
        b=IQBK78/2L1cPG3Q9XfR6om6sSPAGDDO/ZW2f0zbrexo/M0FKTVfdki+BZmdISXw95q
         +XuAGw/YZNN2Vw5+RVB80QrSKou0pnxyVjF7Eo5U5OkB7RGhQkvE7bsE98gk3ZBFERjM
         TJO7Fo1eg7lLf7s9POc0mZij9i8VHcNwG82ntFGNs8oyFp9wqaZUpR5foZlnZQICozZY
         rkJAPzkAanJv4PxYtn1h7IaoG/v1kGnHBFe+/pAZCUKPToYWIDYhVcfhe3bT8GCMuEpH
         Rxa2jQJvDKfc1zpOVj4+3OT3jdm7UUeyliAT4qJAB2xNbn8ma+benyffJl77EL83bNCZ
         OpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7guQfADc6+PbbbfdUGoZzUcLMB4O/8N5dkMpPapKTa0=;
        fh=pgPzuEK4QN+7B5hO91zbj94r3jEEsHKiyLoywNJ249s=;
        b=hnrlNI6Kv5cbuIqtlf+IP0fArRplhLgeAq+v8nnP6bQJjozBvU/wgRXo5A9ta0Z7QO
         eq1VZzQiACI4E7gsX/HwrYlQBxqFWK9M7jgHcClFfARyx5Ps6w9RcOkRkjSWTqgDRsx2
         yG6WHOGhetM/2P+GKF7SkSLH2vtdeWPgaQLi99BtizpALm5Wo91BVSjfoseHQCt8Noev
         lEq7CEz1OJrcL8irIgv754hOnX8usLtfj5/W/58/Xxlm46W28Zl6tqbk7vEgqK5rxa71
         7cfEakln6cLfQ7cverwbKXr1NY2mkfB5vmKa424XGqAnwigf5tMMPoKjEcDsEhGlJB95
         5bMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791566582; x=1792171382; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7guQfADc6+PbbbfdUGoZzUcLMB4O/8N5dkMpPapKTa0=;
        b=lK9/BTpF7JrxClZxeERJ1j2HBG803kIo6gesCjGJBJuCGXaA2IncbaaHE9YfurClZ+
         5KqlwPGpD0uzeYiJ59vQL8QN/P5/DS1RSEMbzHbdNPtZKSK7czP0NFWlVEzShkyYRv7f
         mvCzSiZcCJSZJt6x6iu6FfK9wuhlK2tRHu8c2V9wT91CeAWEpubR3XcNtjkq7sVi/8uu
         YeATk2fmsInZxA+m4ZZz+V9zMOelw4398GW8kLYqThM5Cs66J+Mu5JeizNQQ8PAXDT0D
         fFn6OZiFabDm2ALs/d7rIQBCwqtFMHmZcgigViofvMFSi4utiq50shHr3DkW9UCSSnyj
         gDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566582; x=1792171382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7guQfADc6+PbbbfdUGoZzUcLMB4O/8N5dkMpPapKTa0=;
        b=HLcHE5gMSdasbeejHG5Aq/OMlMSzB16j6YPC08Xcvebprp4Rqruf2J7jUengb37siC
         +hGBGuqpxFfmdwIPuXis8Ub8x6/bQJY1w04AaW29QegLXbOGXSnzw1wNYoma0klBNbO0
         Rl6OIBTIzNy/PIZ0U4IBXM86VAwM5AZ1oGjkr72mRZNh34YRfpKEvnLTNJ/FkoigDP2/
         VK0j3DMRTFSzRIyAG61j44UgVPg+rZM6gfV53Fjwurlib78uiB/o51nXbzk4EYQypb45
         aJNDiY7b+oVu96j4DZaWBYyQrVEzquMx0772ppV+90oPz/2DxDDHTcepUFVP55ltU8+I
         0d6g==
X-Forwarded-Encrypted: i=1; AKwUvBzmV7/yVo1q+JvYJbCG/kY8+C1Z1HFLIDUSYgYDtRMKzATXbgn07ONJljFY2UtAFnbYyV/0W7fvNtg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIchz9LWJBVGOLFbSUK+MFkXgAGU3anAN+dxkCXJGrtdR4j2CnI
	FW4ZC/kLbJspGlrrsSDdGO0R2JttYrtrJYx4SXFVqGTPIJectYmz82dK9Pq+T8jyBc28d6sfj2y
	Zm1G3bjT85QOcjGp+lvgPT7T9cbBRSdU=
X-Gm-Gg: AYBFou0qQThY2vkhLAYklsM8C1wiPuDX7OGDVcFRjkIlqYkkDa7SzjZeYDWbuA4ziP4
	JnSFaz6bBfE3vziSA4i2XAp56d7U1X66dgapZUeOYxBLEq3GLXjn4199tIZzQKEy4qGF9CNTl/g
	NV10xOLI+QQHreDH3Hex5VVQOIUo2T1vbuYipoglud9lPvdVEUp66yWa0GB3ONT2UWRO/SRoSxA
	WzX7wd3PAlkdTbkChZDzronmW2i9m0oaRTeiFRVg2iAMg8X2fyjJ/1x717JY3XzRHmifhE7MDRv
	b1ujKW5kVxhPOIw/OTcnYY0s9FXyzBnOY2bVr42SdFTLjjn42hxKtzSLODD81838CN4Ejnehggp
	cZOxEbCk9wkHPf6HrO87nfMY=
X-Received: by 2002:a05:690c:281:b0:8ae:c724:42b5 with SMTP id
 00721157ae682-8b07ebf60fcmr8646307b3.5.1791566581813; Fri, 09 Oct 2026
 10:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915125226.20579-1-ansuelsmth@gmail.com> <179000484817.707534.5059164498545591038.b4-ty@b4>
 <CA+_ehUzrL9qHe92tE0CeaOMAD1LXGuK79t5mZGv+bp2sCas_sA@mail.gmail.com>
 <asZD79RRF4u5OJdn@x1g10> <askXRONt8Si264ve@x1g10>
In-Reply-To: <askXRONt8Si264ve@x1g10>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 19:22:47 +0200
X-Gm-Features: AclHuK-SbB5oNH02iZdZMOXyHo-ctNQBKsVcPWGcnDB6my47wEggf0BJ5HZcjuw
Message-ID: <CA+_ehUw7374O63trsUORkfMbhMJqiXn_WkC_KL+hTDnLAa2=Gg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] clk: en7523: Add support for selecting SCU serdes
To: Brian Masney <masneyb@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 9 ott 2026 alle ore 18:33 Brian Masney
<masneyb@kernel.org> ha scritto:
>
> Hi Christian and Vinod,
>
> On Wed, Oct 07, 2026 at 03:06:55PM +0200, Brian Masney wrote:
> > On Tue, Oct 06, 2026 at 01:23:36PM +0200, Christian Marangi (Ansuel) wrote:
> > > Il giorno lun 21 set 2026 alle ore 17:34 Brian Masney
> > > <bmasney@redhat.com> ha scritto:
> > > >
> > > >
> > > > On Tue, 15 Sep 2026 14:52:22 +0200, Christian Marangi wrote:
> > > > > clk: en7523: Add support for selecting SCU serdes
> > > > >
> > > > > This small series is a split from the Airoha AN7581 USB PHY series [1].
> > > > >
> > > > > [1] https://lore.kernel.org/all/20260702093812.15918-1-ansuelsmth@gmail.com/
> > > > >
> > > > > Changes v2:
> > > > > - Rebase on top of linux-next
> > > > > - Add review tag for Documentation patch
> > > > >
> > > > > [...]
> > > >
> > > > Applied, thanks!
> > > >
> > > > [1/2] dt-bindings: clock: airoha: Add PHY binding for Serdes port
> > > >       commit: 11952173d8a180ac05641775f80bd6946327478f
> > > > [2/2] clk: en7523: Add support for selecting the Serdes port in SCU
> > > >       commit: 4e39820b601221997cb2220edc830f92367cdfc2
> > > >
> > >
> > > is it possible to have a stable branch/signed tag for phy subsystem?
> > > Commit 11952173d8a180ac05641775f80bd6946327478f is needed
> > > to permit correct compilation of a airoha usb phy driver.
> >
> > Yes. I'll have to rebase the clk-next tree but it's no big deal.
> >
> > I'm at Linux Plumbers right now and I'll send out an immutable tag in a
> > day or two.
>
> I looked into creating an immutable branch, however as I mentioned it's
> going to require rebasing clk-next (actually clk-pile). I'm willing to
> do that, however I realized after I sent my last email that the laptop
> I'm working on right now in Europe only has access to my kernel.org
> account. So I'd have to rebase all of the prior commits and add my korg
> Signed-off-by since it's going to change the committer on lots of
> commits from my Red Hat to korg account.  I don't want to do that.
>
> Given that we're this close to the merge window, I'd like to avoid any
> kind of risky operations on the tree this close to assembling a pull for
> Linus. If I can be convinced this is particularly pressing for v7.4 I'm
> willing to entertain the request, but I wouldn't be able to do it until
> Monday when I'm back in the US.
>

Thanks a lot for the effort. No, no need to hurry on this.

It was ideal to have as it's currently blocking 2 other driver for
submission but it's not worth to cause all these rebase and resign.

If minimal changes are possible, it's totally ok to wait for Monday.

If not possible, then rc1 it is.
