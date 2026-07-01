Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A7237DAAC
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 17:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782926556; cv=none; b=lr+EBp2PywJTqVzrbgny37galfHGOEcO0vHFYvJW7zowBjwyaygJol8wT4ZO0ilzZ7Z5ioK9VHWZ0y9hpuWpw70G8oT4E7HQVKn71ze97mbuwDFkcDdmL34mLPbwXXQ86wmglvQGOAfq6/R0q0cGq4OaE0Qr+ynIv/dNgNY5U8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782926556; c=relaxed/simple;
	bh=WixYXVjBpnpqn803RHj2B+sHKDCiqgvVnBUesOmq9/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KolvMwYYf5WRE+aphNvcQl3dLB5gg3UKC+UlY81bEu9cRs8facgfnaiD7NiSNquvvl+s1gTciTDx5k3pKls4n0ZcK5qOewZKkZfjagalt9SYdRFfQehw04wgWioZFk0zs3owB7brujEbL4f+GVICMtqh+Gz1frVpdDwTn3hvhS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oMKlCCK5; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMKlCCK5"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4728c12ba97so601649f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 10:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782926554; x=1783531354; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+LuHBNSxHfE6ANORbYQCZpiCLVUHvb/JGg4k1qU+4CM=;
        b=oMKlCCK5xW6+B7mGd083UX/1ew0Bf4omMENtXLQ8H3v4skqYdnGNDyjjbmfPegXYBL
         4D4yBwBmp1V+LPKB0n+4PJ2bL9QDvG9lNldMtqRs3ITxUQsseZtB4Ax6ItiaP/e2DfBg
         PN5VkWTh9DIFNd1EQZ9IKTlJPJJNfdVfrQFM3R4ZH3YajRQWslIhiNZts5ZxXgmojj/l
         khRU7eO6fXBrAvaSQcfRR+C3muH8VCJMf6qC0fPt87DEA7gRhO9xbdTerVOEmZUI6G8C
         ku6xqnLjzx2yRwFgTkmtoMNSEEZTYh2S/kBjciDuow/MXc46uYTbcwZyg4PDlhSnX016
         uhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782926554; x=1783531354;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LuHBNSxHfE6ANORbYQCZpiCLVUHvb/JGg4k1qU+4CM=;
        b=c6m2ihRNqQ3zI1/eNFfTmPb3gd+lJcJWyqRTWXuIR8PHT2p9o8phGyZFV5vVp31sXP
         Dk4c7d2pALvCXtMksW4y/MDCYWxGYkib3f50lbpvByJUXSjRpqFBioY0Kst+5WavzZsv
         tCZqLQsa9Q/Y1pj8R9Y5Uixgx7vkDEIKZEI0d45g5yS7MFwpPUNZcT59RpA9RPmFwwBh
         WZnLqwG5l4X+Zo/H/dPhsdXVf6WgDjaTrLRAkb8UbDdNltv3eWdJ6s4/SaRQdn7rwu0C
         3XQC7WfJjpTefmWsk2lMEiRZ2oTWfdQPWOLRIsvVdmJRFv+ciiqIpic6Xdpz1Nug2/qV
         QomQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVn2YyHBhiozK4a7Uvh/8JJyCMNg8rQVGkNLwdE22DrI5Fl55a7DWuW1X5lZFhmnFXjtDlvx13fVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg8WcIEbYgXbIDZviIr3N/NjIAz99qOhrHBgkie2UnSH86nocB
	pXTeWYjLdVRJo60N4Bhb6baw33kJXmY+1CTYbe23c6/Al7ZL6tSq01xk
X-Gm-Gg: AfdE7ck2VDL+i6tyZpYrou5O5hlz3VU4dENP/C9yvaz+R0uqV6lZt0W4dp5TkB/Eb5o
	xD5rGB9MkpBsiu3QZgn2Ogng96o313qiSskyWWXLj+KbaBZNR59H1fmNCnadyfG5fvpjUl1lJgT
	nkoGjSTvo2C4BgpeWw2aeTsZZvGUGdIlYV2ZMSMqN0Cu94M0+1/ADVNOhLo807SLpPEA309RNXL
	pOkxJ7XEQZQoU6wGdqyxtFeif0lsaBuX36gzP3P2COkpkisR6LgwVHy3TX65z+cDJ2jbrYBYrrQ
	AnhmnHFwGJbpryJV/+m1e9vk/Eh0U+h3l0CNrXEXFRXX0T4nka5jTaAX5Pekqeb414f2gSKNdzo
	4O94ofNiihyix1zyjAbM496N2CbZ39y6K5Xl4OW4uGY53x2fO3IIDO8tHiqaBIWOK8DFwJq4jUg
	fi6F4iDpytNQDr1Ixpd3F320jV
X-Received: by 2002:a05:6000:2606:b0:475:e7f7:ef7a with SMTP id ffacd0b85a97d-4775779827cmr4376692f8f.23.1782926553429;
        Wed, 01 Jul 2026 10:22:33 -0700 (PDT)
Received: from strix.localnet ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4b83sm1526700f8f.12.2026.07.01.10.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:22:32 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v5 00/12] ZTE zx297520v3 clock bindings and driver
Date: Wed, 01 Jul 2026 20:22:21 +0300
Message-ID: <ihPM7P2dSn-oiyaL8fageA@gmail.com>
In-Reply-To: <20260629-unwelcome-raking-3df3d8ff0422@spud>
References:
 <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <20260629-unwelcome-raking-3df3d8ff0422@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartVc9fFCIUSOe9qcGAUepe1g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartVc9fFCIUSOe9qcGAUepe1g
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH RFC v5 00/12] ZTE zx297520v3 clock bindings and driver
Date: Wed, 01 Jul 2026 20:22:21 +0300
Message-ID: <ihPM7P2dSn-oiyaL8fageA@gmail.com>
In-Reply-To: <20260629-unwelcome-raking-3df3d8ff0422@spud>
MIME-Version: 1.0

Am Montag, 29. Juni 2026, 18:49:08 Ostafrikanische Zeit schrieb Conor Dooley:

> Bindings seem fine to me, I'll be happy to give you some r-b tags when
> you go non-RFC. To be frank, I think you should drop them as you've got
> no significant questions here I think and you'll be taken a bt more
> seriously.

Thanks for all the advice so far!

Here's one more binding related question: Philipp's request to give the PHY 
reset its own reset ID means I need a node and driver to consume that reset. 
My question is if it should be another MFD subdevice of topcrm or not. I am 
leaning towards not:

usb_phy: phy@2 {
	compatible = "zte,zx29-usb2-phy";
	interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 43 
IRQ_TYPE_EDGE_RISING>;
	interrupt-names = "powerup", "powerdown";
	syscon = <&topcrm 0x84 0x2>;
	resets = <&topcrm ZX297520V3_USB_PHY_RESET>;
	reset-names = "phy";
	#phy-cells = <0>;
};

usb0: usb@1500000 {
	compatible = "snps,dwc2";
	reg = <0x01500000 0x1000>;
	...
	phys = <&usb_phy>;
	phy-names = "usb2-phy";
};

I am not aware of any IO region to configure the PHY, although one may exist. 
topcrm + 0x84 has two status bits reporting if USB and HSIC are powered and 
out of reset. Nevertheless, the PHY feels distinct enough from topcrm that it 
should have its own binding. The phy driver would merely deassert the reset 
and wait for the ready bit and maybe in the future do something useful with 
the connect/disconnect IRQs.

Interestingly the USB IO region is actually downstream of the AHB bus and 
matrix controller, but it has its clocks and resets in topcrm. I suspect the 
purpose of this setup is to allow wake-by-USB IRQs while shutting down the 
main data path.

Cheers,
Stefan
--nextPartVc9fFCIUSOe9qcGAUepe1g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpFTM0bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoixfYP/1N5fuUTGEPdtNuW3vG/
UGctsVeP61D6WbybvSCVo7+1KDVP3P6sfavO3bN3qn3TEOPG6QAENugWVQMzgVxN
J6KFEIrSj87dtQePwmnV/hcK0Tt9wgqevxLDJaG5FZASgo4SltRANZqfA5Ck9l5d
yVufi9cvOxmxi2Cu5seCTlLR4jlUkFUFdto0OPA5TfFvqiT04RJSzjyMCzwfeBuZ
HmBBOTx0Qs7CaiXjFW7t4kJ/zYErOfkJeNt+kL2gbOlBjtPeNl5Swh5qbtxdQpHR
vQZotxrgKhuhCz2cTcVlgQ/woxLBvVd11Kr8Wv8Vi9t/Mz3De0hvD4131RJvZ7U0
GlYZXh6o0PBrXjb8obVMiINYWDhfcHFl5jXnrMeiBHyVBj3UIKwp/hpxnjhSRxli
WDP64JocUSKMoKxSLVH4fJN/HJPAHDj7ksjYic6QMtoRzWwtG3un+XfuIMjVnQmx
fIrAO4sLHmOAXNa0THlHDj1YrAVyxktU4fWDK119uvokp8HkUnHQBtUz72bCGKdn
FXRzeNhd/2+p4ubgd0KoecHHSEJW+VAqqpISEHFlaO45qn7HrnD/KmBwnhgeBc/J
XOZKOe169hR6oQA9ZY3GMXzz+fIIZkCmAvlSHFqfRf0jbkG/fBCjkpaOidwvcpja
znrBP0byDtZU6RNhIpGa1ymE
=mB5M
-----END PGP SIGNATURE-----

--nextPartVc9fFCIUSOe9qcGAUepe1g--



