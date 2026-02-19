Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C3714A8B;
	Thu, 19 Feb 2026 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771507290; cv=none; b=AMzM9Z01kkeOPRmZ69tWGF9UdNGuvytQP7Md02UwQnqo5MZnwgTSVWxmK/ZdTD0DxkEjxbToD2hzlcre5GjC8Ug7OZm3uCcLB58o+X3c2I+9kiPT+XEMTmnNGhX+xCfnt0CEJxqItbG4c1iP+zChA0xJ4BnqA3NERqzSz/fPg2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771507290; c=relaxed/simple;
	bh=t5YalXoT9QkPm3r2QR0i4BOgLh60VKw0Td/wtW2BsTw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ET/n+Zk6tOjDTuiYBGqeFaw2I2yYnStOSyLG3tVHp4yjLc4llWWCZVaR1yR+4sooEtn/zF+HjjY/cHji3qGG8QfCX4XlzMuy4aYm7taVFxGdedzOyHnirxVFjBIbU8tHmgoToAPDR4NcTH+a97qEdrdzj00epPscN+zaYU6Kozo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ziswiler.com; spf=pass smtp.mailfrom=ziswiler.com; dkim=pass (2048-bit key) header.d=ziswiler.com header.i=marcel@ziswiler.com header.b=zy0fl2fI; arc=none smtp.client-ip=74.208.4.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ziswiler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziswiler.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziswiler.com header.i=marcel@ziswiler.com header.b="zy0fl2fI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1771507288; x=1772112088; i=marcel@ziswiler.com;
	bh=t5YalXoT9QkPm3r2QR0i4BOgLh60VKw0Td/wtW2BsTw=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=zy0fl2fImBoaOk9VmTjdiVUwf12weWESpe8KQmif26Fg4Kf1qbWTp0h+sluvkdTi
	 k88mt/albzyXE2DeJDLQG3FWDCDsBgbUE0PGdCOFJz3q6ajRJlFE/d1JnKF5FQMzJ
	 r3VwaiDquNlS9qoiWUVd5y8NuLLifEBj4jW1+upV9yWMuGacM9oy/p2jkXfHFLbwj
	 29ZJ7LYQZiYDSp8XwLg3z3WrtqHmtoIhAPnrGAtsS8xsgEKoXStqp0fjEb/UmRiGT
	 /7Mspnp7147quEds2SnXzgozGGXOKIJhlySSNIZMWbO9rzaY6pS9OJu84aNcAe9Dh
	 0zyfGnyFQjcdvSsnLQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [10.10.1.155] ([84.227.68.106]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1MQuoF-1w4Q761D4p-00Rk3A;
 Thu, 19 Feb 2026 14:15:03 +0100
Message-ID: <6b49d264eeda4cbcad839baaefd4b38e41c48735.camel@ziswiler.com>
Subject: Re: [PATCH v13 2/3] clk: eswin: Add eic7700 clock driver
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Brian Masney <bmasney@redhat.com>, dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	troy.mitchell@linux.dev, ningyu@eswincomputing.com,
 linmin@eswincomputing.com, 	huangyifeng@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, 	ganboing@gmail.com
Date: Thu, 19 Feb 2026 14:14:56 +0100
In-Reply-To: <aZNRFYs_QuGRI8PV@redhat.com>
References: <20260214101421.228-1-dongxuyang@eswincomputing.com>
	 <20260214101519.341-1-dongxuyang@eswincomputing.com>
	 <aZNRFYs_QuGRI8PV@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:SpptaM3hwcGVu724N7lma8gBdAgsyr9aMh362EpjOLpbe41BzGx
 y4Qtu+Kz9c21nznFdbquA1qK7g3vTxBim8qTU/rlFIPryJK5FluJARa9mxOkHrrF9yfIBht
 qqF6pgWoOrFWKEbBQloFkDaj5IwQ2stIAVBDyHTE2SxrSaeQFSAKq71Ju/ljkMcB3fVRjVP
 2HmGz9SIXUrj3CgvnxtPA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wXZVIL6e9iY=;PjmEjt8ljW9E1nkScSEedrzk06o
 WvHhkJs80rNZzqwuJoibHKvBdYIM3SFjHeDABiTiftNE6yzMIvmJpI5AmFotGgmWLzxncL4bj
 MlKAds8Np4ELsxnENj8r/qQ5svP6AcjvLVYGLQL+rw1+evviiXOOJc5QZ5/gxECd9OQKHQWDC
 1dr7h63z33j2Pkk48wXawgT5JQl6e9CW5JmKfl/DNviIthSM3iviMsE4zSKEMsyXZfJpMD3FU
 mUSiS144LnLkYvtma9Aw3oFYJcvvgaQmlFtCq7oPCM4q8pM0T/K6ZW6s0ppFN4U5hhZea7BPy
 Ec44Nd8+Im2llyV61mwWn1g+OSUR/dc9/dK96pEq5qE/PlbZeVwHn05opgYnYmDRwSjqWRdup
 8z1BGjNDHaQRW4vW4+WN1LKcZaPN2PdlEsQ0AGEMMZB8WClvP9kMNkJ0nEw+1C+xFt8OlxeLQ
 XHUpHGCD/let4O2UlBq4ikHBS3DxBCx7zLreZjblSvAoPDr7z+2BC1lt/SATOp5c19k86+ysV
 ylkebAGlyNU8Sd1xuyQ+Sz4JRCNamcIUvp8IpberY69Q6lCPrADlpjHxwefiYs3WYSed8kNTG
 JqTwcpoFepuosKKLAftdczT37HPIRJXUIj8AFMDqY+QVwWTfWeDTwwSrnRiVAasVXvcUk7zYX
 zmvw1eKvtMRgGF/Csr82oGAdSyhFI2xa1felzyOMvF7AdSVr/nd/12VoWHRWQwKBsASMwM3fU
 697I8TD4I3XMxh18Ld7GVuI3JrH2nqWONlTqhC3UwXCyzvqQHJCHt7imaOpmx7igl3ldpBdIm
 Ia7h9IpEWD+sJFNlRxjOKaytPTEPQUErzc8ip7u9w3hCzNU5blDv9nZel0WSPbmBXgdJC2rCO
 pMWhI9/SS4yOVJuA2b3v82s0JZ8PbCSX9unFYJiW8LeUAX7ZWo2mCKx3US5wvilD/wNwzZlzf
 O6di+RtxMTtxDR7wsRDcPNddkrQOaGqW/irdGA5vejjHvisdBaktn/FiFdSVZpA6SShRoUrhV
 7nIg0etockIJG69b58PHdUPuX84rm6pv7TyzggFMeRC+VVqbx80fBZPbjCjE96FHI3uyxAh7Z
 la99EI9XXdwLNci4HIEn3hbkfBSTmtoPO4ocaXWvPllw9zjD1QoT+tcQvveZou0S3xmSMkMGp
 KHaQUVf2pLCab6Vvu0XOK5pGnQjGRdU6z4QQQX9Fv3fZ1VCFjqQrczxwhmLpIdeFy6e30VRaB
 wtvmcmCQRoTvD2MkQuRz/982l0mBS9oimUeTwhQn966vce9mazDcm94ceU539QjRel9kJ6AsH
 SCRyAXqZpcUdf5pz6GySwLyNQOzQ3PDRYoO0jQwKZEkWezO2RI9KjmP92PBxMGHTNbJ2pMDZ6
 xnrlef8a0ueBoV6eDbqO6peEVCQpRYcV8/UeAd0INM21ksY1zkXWnSCZEoov39z91veC1pOJD
 WBMJ/Pwt/Q6XPxT7p6mLX2GyHESIe0R1I8KSnR8eOa7cHiRTgbQV837S8DH9PVdGJ740fd14+
 zknpajYgu7jIEKhK9RrFLnf3FcewVOYG6Sb14vk9ESsl0Tk4Ote/N6RC8+GLpTAspbmB4yGWr
 E+4wvRAliKie+klu2DnK9zVtcwFDq9m1jy3YbOBMw4GcU3uBCi/p1CeT7ypFABOgLLqFUV39b
 a+gb8z9Wr3s8iUqANUq8JXe4m4JM9VOTWwZLm5hi2olSqowdP8M9ncDNbaadu/f8wPPG0FTj5
 G7l2lBGhQC1uw6k1Xm7/YtFCND+BZL9vN3awuFLFv0jazWkZFOxKDrSg=

Hi Brian and Xuyang

On Mon, 2026-02-16 at 12:17 -0500, Brian Masney wrote:
> Hi Xuyang,
>=20
> On Sat, Feb 14, 2026 at 06:15:19PM +0800, dongxuyang@eswincomputing.com=
=C2=A0wrote:
> > From: Xuyang Dong <dongxuyang@eswincomputing.com>
> >=20
> > Add clock drivers for the EIC7700 SoC. The clock controller on the ESWI=
N
> > EIC7700 provides various clocks to different IP blocks within the SoC.
> >=20
> > Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> > Tested-by: Marcel Ziswiler <marcel@ziswiler.com> # ebc77
> > Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
>=20
> Can Marcel retest the new version since some of the logic related to the
> parent rate changed in the new version? It's probably still fine, however
> it's good to be sure.

I can confirm that v13 still works as expected. More details available here=
 [1].

Thanks!

[1] https://github.com/riscv/meta-riscv/pull/601

> I have some other minor comments / questions below.

[snip]

Cheers

Marcel
