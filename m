Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792956100;
	b=Q1uvEuck9lm8aU74+Xr+yY4cpurne6bEbrtGbyB3/8oS6CKf50C4Gvlj0qcOrQs0n9lq
	 HKtEA7GzrOYM7E3Ce+Icx7hgvSL1ygEv5qjn7ACQIDxKt5saWy5Cx3g6+m/lQlaR3AznZ
	 Ctmcep48l7O7bUSRAWmRTsuOQCIGF4HMNePCiThBNHd50p1kZZzJzXyxPtpYAsJQbhQL6
	 0CeyBJZtkY0G6tWrbuE3d8er3NtQBrqbD6TwyXfnomQ64YXgmcrZTc0MbOmHB2J1uCRbB
	 NYleDYiGU8de3z8E6NrHOGprGnFo9kv332WfeTTwo8z04sgDlmfLN1E37m6kbWJ9DSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OH1v0lTH3i5PVrd8YAnHucUCqAE9dOjJzTTBfZTDUMo=;
	b=yIGwmO5Lc2X0c39c+v8Yqh+HcmcdpPJP2XGlItdqaxQ0ynoFGqvRJZ49Hu/r29FdXqqG
	 fUvIrZ+siFAgXMcbD+nlGWJtgBY3g8iQ/p71VpWvzklYuS1uTiSZqSaXcoY/0by68p2L2
	 Kg03fgL+lgZJh9M8RrF68azk05bmsALLQ9DJwwmpaU7CcAPZT0XeTrotrtEjQhtbxbtJr
	 AA81xAOWhj35L1Vk3BXrskE/WKKEZPvw1UKEvNfVbztHUP6QbFRu2oQmJJdPWqWcOjRi+
	 w7VRWAPuWRj4AJpBwPu08uHkSavh+BOnejhnxAyAk5oEi/ByBkQ7Qv+m62ePkgVwd5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M3KUq8wh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0140D606A326
	for <linux-clk@vger.kernel.org>; Sun, 25 Oct 2026 19:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0140D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M3KUq8wh
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so5640970eec.1
        for <linux-clk@vger.kernel.org>; Sun, 25 Oct 2026 12:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792956099; cv=none;
        d=google.com; s=arc-20260327;
        b=RlsY2JXoRqYUSRAt0reB1BeMWkLB6gT1C39Q/ZXTfG9Mo7VN79SRLwcTRQFDdomZBO
         TYpXw/6OryricLjqk/4mt54vNlHKn6shP1MsORt2PYFZptz5geTN1oPFs4K/R59iuNeM
         drAYplxNn7eJbCr2937TG6/VCqYzeTL3o60gzhkbBi2TRnWz+4FGviS9A/SHDEou2vZh
         FBWYBZ8LDwLqkn7nGlufC36N3XGq8np/ckSEh3CFGMNlO0ivxVVvZ/GxEc5sDog23oDh
         SaquJbPuPvR5eE1yTCjIE49V8DeY90XUPIaVeqnbiLcP9Hv3gmmOgg/dPv19aMS5/GVS
         NDag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OH1v0lTH3i5PVrd8YAnHucUCqAE9dOjJzTTBfZTDUMo=;
        fh=LtMTJ8KWLNAmiTp04JJzcd+RhUCaWZLPwH1uab/yqFM=;
        b=hRs8z2oazI5UuXgV3jaxlWfPBgWjn1vPy+vRj2Qx3re4h7kk/MTmZMNm48VszrFtKa
         ESF/Y8r0JNa++pkKDf0G0S+2X0/sthXm5d/Z4TBQJ0bnq1o+a5Yo/FlwRFlPS2SV56U4
         hSRvQd+wczv+QizxwwJ2/wd3uOwcxo7tDAt9uZ0m9X/wsPlDZXdh4z+x6vhU853g3uVY
         nSMOFtXX2Yw+XBiH/OoO3cgRDPG/gXvocR5Zz09nMfmjaIqzbgXp65SvrrzHMhUic728
         Os//kJs6MOBL+LbvExyAnEdC6v1Ed9g1ugGpTKCWjPPILHHGWeoLj3b9H/2+icYJDZ2p
         r3SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792956099; x=1793560899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OH1v0lTH3i5PVrd8YAnHucUCqAE9dOjJzTTBfZTDUMo=;
        b=M3KUq8whaTsLJ6plVgkBsYp7Udx+ghUM+jFVw6R5idi4BXD5awRFMvFS+EglrAC6Jz
         559v5cbuPq/LvGTLvAo9XzWo4w16yiYx8BS/OU8BwS5LJ7U1spf8EP3frSZaB8JLLUpb
         z+n/YLecOuCouGUToF4uSikzuQAKwJeNb7UpGhtwNBfpt2mwbj83uNgF5w6qL64LNS2j
         xYCC+OneYqgSmBqSx1QEUyFHHUw0g4iikHrQBKZsf0UGY/oxH4hkzLTmJ+agS0oKxTEV
         r7oB15D/4w4DILHo1m6pFZJDudN0kq5mKOvy97I0Ta2Z+IY/QaoxpD4acg1Ms5PGlruI
         VWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792956099; x=1793560899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OH1v0lTH3i5PVrd8YAnHucUCqAE9dOjJzTTBfZTDUMo=;
        b=NzmgbeyBbTHF2IMj0+Z+Qb86d5mA+96RZ2AWp0ejr7TFVN+hMgQGTIOqXjlpHihP0Q
         7b62XzXz4ZjBRnaJmFC7O5Mm9TBDYSFjKpEgwT4vGmeu9C/NCGPvQlJYXZJUpc/88lK2
         0WkvLyRuPrfQzsgW953iysMW5kdsNoGLtFZaFNKSDFSjnE4foNfw9ZXfbpBRYb2IVrr7
         wJI90/n2OJ1tXWj5MKUqoSy8J0qRP1DDEFfQNJAw5YI9nxeAp5SsoX+IMU7CEvkbo1zC
         p3Hfb8W+eVWf4O2huMap5sgDDETCJmAGsrCGW1thjk1446iKqlUaZIrdAUwQQn3SI5k+
         ZzIA==
X-Forwarded-Encrypted: i=1; AKwUvBwq6YMNqTb5ixpniJyyf36Iu2B/8hpyv44tjPLRq7KK3E7IKIZbTwkzhidJfxLum9D+KOkfOnm7dHI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXfvar+MIbZGBggk/K22aiL1p2CPgsdyNqgpvwQxS2T6UQy2yF
	RciA0W/+2fXt0ysM8jxjY8CkbIJwcFE+4dugf1e747CVUi7OHbeMEk5Vm6WkVMQc8yGN8C4g6gV
	N4y74NLbNgRxr0RxfHxJv8B/rA9gR/kE=
X-Gm-Gg: AYBFou3oG4Ba1aeHiUZFif3gef7iUui+w1gpJDSbvSsOHdyy/6ydIhXW2WTAroZjdLL
	AXrk8kPz0dJ9shjP1kOCm3uAEcGcP60eyXQNVo09+yoLKehqk1tbEoMVg04Y3vbe4jzqAV7xNdZ
	fFX3svkQI/TxHYXxYUqYHiKhQFzfu/l+ynlQrHSswMxRdWP4wRRiHOQDsfnVo1vOSVfFcpPBzDq
	eQ2pNDd8VsZZ4vluMaVfcKj0VPzl94o+zWDXahiDBSloCpXPGF7tRaC2z3N4BqJaiknf87uuzqd
	r3BdCd+AMMtV2VRMV/wcwLkl8t7H56yFMVp8NTvmSToCO4hvAbtxUCk65zSR1680HdoJeydNrC4
	TvgoO630k6viLr2EQBG9YlKs176y5MQsGZT7lwwzVnDcZ45XANFXpY2WhAJmhLyETtvXvqESJUL
	jhTT8wnS9QgzX+E9M=
X-Received: by 2002:a05:7300:84:b0:35d:eb9c:fce with SMTP id
 5a478bee46e88-369e84afdb2mr8666043eec.25.1792956098996; Sun, 25 Oct 2026
 12:21:38 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930-b4-dalmore-fixes-mipical-clk-v1-1-0518be6c7979@nvidia.com>
 <258d0c04-fbf9-4de4-b009-8feff88dc69d@tsv-stahl-riesa.de>
In-Reply-To: <258d0c04-fbf9-4de4-b009-8feff88dc69d@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 25 Oct 2026 21:21:27 +0200
X-Gm-Features: AclHuK-Zu-La3MBSX4NrGbqHTCl63lbPGopl2QWUuujCrh98e0xucb-_xaWX1wM
Message-ID: <CAPVz0n2QpNfTfubqvZ2i9B_Z_gug4oKSmD0YMJ7Riymdh+guYg@mail.gmail.com>
Subject: Re: [PATCH] clk: tegra: Fix Tegra114 MIPI calibration clock parent
To: Mikko Perttunen <mperttunen@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Patrick Fischer <admin@tsv-stahl-riesa.de>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 25 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:5=
7 Patrick Fischer <admin@tsv-stahl-riesa.de> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 02:18:34PM +0900, Mikko Perttunen wrote:
> > Register the gate with pll_p_out3 as its parent. Also drop
> > CLK_SET_RATE_PARENT at the same time: the parent canonically runs at
> > 72 MHz so we shouldn't change the rate.
>
> I ran into the same problem on a Tegra Note 7 (P1640) and ended up with
> the identical change. Before it, every DSI enable logged
>
>   tegra-dsi 54300000.dsi: MIPI calibration failed: -110
>
> and enabling PLL_P_OUT3 by hand made it go away. With this patch there
> is no timeout at boot or across DPMS off/on cycles.
>
> Tested-by: Patrick Fischer <admin@tsv-stahl-riesa.de> # Tegra Note 7 (P16=
40)
>
> While testing I also found that tegra114_mipi_power_down() never drops
> the clock enable it takes, so with this patch PLL_P_OUT3 stays on after
> the first DPMS off. I sent a fix for that:
>
> https://lore.kernel.org/all/20261025-upstream-host1x-mipi-clk-v1-1-6bc6e7=
55b4cb@tsv-stahl-riesa.de/
>
> Thanks,
> Patrick

Thank you for cc-ing me Patrick.

Hello Mikko!
I have observed calibration fail on my Tegra114 devices and your patch
fixes it. Thank you!

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T
