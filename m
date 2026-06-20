Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7B954652
	for <linux-clk@vger.kernel.org>; Sat, 20 Jun 2026 17:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781976498; cv=none; b=gM+LrycsyDXGrZRLO8wh5+bjh1I38yij9C424d11cJEFQb0k60dNWmIbYwki6b0XtW+AMlgk47Iy4DBefBCE19zaAFtBk/SQvxg2fpqpSwA+lzMWfcQUdQrlTcmQDsCZaowNl07xRjC3DsPzNcggywAhW3trBSyoVBNo4QIX4h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781976498; c=relaxed/simple;
	bh=nM5yehFKra88Qfal5zlQkUu6h12HqXiJIL0q08sT7nU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtwLip124cPN6uyQ4EcpvaIPqyciceREBl4WKpBdY17IChzlTj/vHhWEbhUporsmaz80mUCll9YrzKygy/aewaBTyuVQGpix87wcN3UXHy1lgmVlev6uhbnC1c136lcbuJ/2kaXptVd4zmHFcyoAGEcsHWdBd2gsdr0UYF/EiRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jB61f7lp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jB61f7lp"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-46255b269c2so2294506f8f.3
        for <linux-clk@vger.kernel.org>; Sat, 20 Jun 2026 10:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781976495; x=1782581295; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/6fDvnIguDHo3k7rp3ZTnWwimeNwTtivMzdauHwuVo=;
        b=jB61f7lppmVBZGkKBtcJaZCSkm9hC3ba6fNnuGFpbsu5ILAsvceXsbtlJzQevYsV+x
         fo7AmHwC8ug+s09Os2ZXQWboeHE4sEU4+C06+XWAws2Gp/CvQMCe2UjcE6rsJV7Q79Lj
         ykYfjIGdLGVvPmp1fjc8J//yuYBo2DCAimNvEbSSqY/+RIbrEmtEmcVm9FwY1E9hJmk8
         xwlU3O9/+ByeuvePqDLiSR13kfjTLfmcLgSmFoFXiN2nUQe2sRzTAGx2weogkFGesqe/
         khQ//xr4sKUclN46CAmQHKRa7wI+yqNLEGTcp9O0bS5WTB3m0qKb5C7agYqEGQYp+W1A
         3NkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781976495; x=1782581295;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/6fDvnIguDHo3k7rp3ZTnWwimeNwTtivMzdauHwuVo=;
        b=O+HJPfE9pffrrkMRzM7UJCM9VVJwzTBKZKghReJAoIkmYpBDNVyykAdJ5yjNP+xbiW
         J0X+M95FoV4Nkn8tjt60CJa+cDImHxRtY1Zp6YHXaTKeESO8kHCrjEWyTqg7OhN2DHbI
         +pGLxeK33PjVEFHzrceNjtAVlHPsmi8VfJeg05TKsVmwZdeCIhthlHsL2fBuEbCtFoqa
         DPu/mcbaRj66Lt6qZuziScp5hHXpmoh+3W/d7eouUhPjWbqUrvoh7MdKORqUHoiBuQEX
         dF0A9rFEkhmu4jizR7eYybt8J+OmlGsMIqjsCiCsrtO4OhEJF7P3s2kshid30Z16Nccp
         /GwA==
X-Forwarded-Encrypted: i=1; AFNElJ/a3KIgui9wv0ux5han7E5vynN0NFUkRf5Xx+WIxFCb+59KrGaF1D7Og7zuYCiO9ej9lhhStR5ojF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsP2A+I08mx9qaHtoa2PA2a6Eqxb9gxBpDJxKZl2hrZMw5ktqO
	6HxGe3eFO71b9bnB6A5YZAS0+pvfX6oLlGKHIMuLts9ClQ8nW+0KPXI7
X-Gm-Gg: AfdE7ckI2p8GEzjgSjx4SkfWaSkn+uhPQUTZ7cSO+MLMLMPbIVintiFo7eGH/wuDWxG
	57euSkWwsTd6Wi4j1INAgd8vRsuhLstZFo/LA8hkBz6NVIU4MPiTTo1QhIAdNV0i/Z6fIA7i+wZ
	w1L82++EPp1am428tzkGWqzfKjGEODXg8/zYs3rEz3yR/vkFr+QzYlTAkdGEWnP6xvwH7JZnkY8
	7Vq+QlTOh3/a/yQg5cRQZrFhDd/nMvT82e2CDA1viSVgFEFTwP0/p+sFiW8yhZ6HFiBPyG82T1O
	u2fM0+yHdUBT0gbSB8X8oI2W/XL1SjkdpY5fWtqf+tZvyb+29YM2a97A0LyVlJ2lV1eUEEdhZvl
	dkSBXg4M/S2YAYsoxDoq99cd8QM6QvhC7ntcx8A1YIlmvTofXZqV3C2HMF0dVwwsQG34BfNfNku
	264QB4ImVWdP3nsztk/cDwXm5xcw==
X-Received: by 2002:a05:6000:41ea:b0:464:5df5:332a with SMTP id ffacd0b85a97d-465026e230fmr13924863f8f.34.1781976495283;
        Sat, 20 Jun 2026 10:28:15 -0700 (PDT)
Received: from strix.localnet ([197.250.226.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c4fd2sm9661404f8f.14.2026.06.20.10.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:28:14 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH RFC v4 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock and
 reset bindings
Date: Sat, 20 Jun 2026 20:28:03 +0300
Message-ID: <vYm1twErR8mp-Fjgbvf-MQ@gmail.com>
In-Reply-To: <20260618-fantasy-estimate-6c52edbc6890@spud>
References:
 <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <BXIzXc2sQ5SGynZ1chd-pw@gmail.com>
 <20260618-fantasy-estimate-6c52edbc6890@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartj8KIpuwSTluwcOdB0G_0rg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartj8KIpuwSTluwcOdB0G_0rg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Date: Sat, 20 Jun 2026 20:28:03 +0300
Message-ID: <vYm1twErR8mp-Fjgbvf-MQ@gmail.com>
In-Reply-To: <20260618-fantasy-estimate-6c52edbc6890@spud>
MIME-Version: 1.0

Hi Conor,
Am Donnerstag, 18. Juni 2026, 22:54:53 Ostafrikanische Zeit schrieb Conor 
Dooley:

I think I get the gist of your suggestions. I have a few follow-up questions 
to make sure I understand things right:

> I think aux bus makes perfect sense when you have a clock/reset
> controller, but once you start expanding past that and you have reboot
> or hwmon or hwspinlock then mfd starts to make sense.

At what point does it make sense to move the bindings from bindings/clock to 
bindings/mfd? The controllers are still very clock-heavy. allwinner,*-
prcm.yaml look like clock, reset, misc controllers in mfd/ whereas 
ingenic,cgu.yaml, sprd,sc9863a-clk.yaml and da8xx-cfgchip.txt are clock + misc 
drivers in clock/.

Likewise for the node names: syscon@ or clock-controller@?

> You'd then have topclock that is a syscon + simple-mfd, matrixclk that is
> a syscon and lsp that's using the aux bus. The topclock and matrixclock
> would have dedicated and trivial drivers somewhere that have the mfd_cells
> and call mfd_add_devices().

Do I even need simple-mfd? It seems I can add the syscon-reboot node via 
mfd_cells too by setting .of_compatible. It seems once it has a driver (even a 
very short one) simple-mfd is misplaced.

What about syscon? Topclk needs it for syscon-reboot and the watchdog 
controls. For the other two I only want a regmap. Afaiu device_node_to_regmap 
works without a "syscon" compatible. There's also regmap_init_mmio, but afaics 
I only want this when my driver is the only one using the regmap.

> Probably the compatibles you've chosen start to make less sense at this
> point though, but probably "topclk" and "matrixclk" are not what the
> documentation for this device calls these register regions?

Yeah I'll rename them top topcrm / matrixcrm / lspcrm. I just stuck to the old 
names for this email.

> I think the priority is having something that reflects the hardware
> accurately, I wouldn't compromise on that just to have the same design
> for all three drivers.

As far as I can see the primary difference between mfd_add_devices and simple-
mfd + child nodes is that the latter makes the MFD composition visible in the 
device tree and the former keeps it a driver implementation detail. My sense 
is that the latter is preferred unless a subcomponent of the MFD might be 
reused in other components - e.g. an ADC is used in PMIC-abc and PMIC-xyz and 
thus the driver can be reused as well.

--nextPartj8KIpuwSTluwcOdB0G_0rg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmo2zaMbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiA8sP/iDCZo9JCPTXlknep41Z
EiXNNHm4yYRiVaWnovL3ahmlVRNEQnKpkhizLzvFtmvkwpJPPWe+PQuZGKh1xfHX
j4l43lj0EiP9ZkpSFoJgHzskpiLVoCzt8IzYLzY5/miAhJCRVkVhudLZXb9AWTAN
5Kg2jCv4/s6gp4viQkwA58GEomii5C43k2D+j8/UBf4rz9mWrMuMRaezj7F0YqCG
Nik4IrBIHuDGWJyThgQ2mTluCQcBroaA3V/+jhDMTPg12FmhY4A5M1fpW33iN3B6
fo65LBzVwmhdjICendnz9go3I3ZEjqnlERFhlEqywbZBjNxFxhV0Jg7XAuVN9YOw
EFYuyNbzZy+u7KYvgzW8pswUYhOjAUupEU2EOY3+kKzmpkB+0hXeP10rTawXot4d
GKJFdt9emZh4/xFtEyeVovXR2bq6Kk40uZsgwDEf1KS+QtANtA3vstQn9rEhIPFZ
vVopjQLE45hhxKiWjXqUZaA0iJg+bmmy5HeI03X9b6jXgfaEhJBBAH0bRW9smBoK
OJ0wIe1JnGd0RnGM/1DjWedhXVq2RMfVgXCozzyFiETgXhYr++4Y57h/NgHzoNm0
nIN2gqG3q7T+OOkziGJmmcMyvONlYqcyy2F9bnJ1AgtGwdYhMWC159JK54VhAd6S
sFQ9rZwU2zMAjJ7YPlocj67G
=JozV
-----END PGP SIGNATURE-----

--nextPartj8KIpuwSTluwcOdB0G_0rg--



