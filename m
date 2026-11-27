Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775222;
	b=kXU5Ki4Q/pwkBsdQlytdPnELC1z3PWRxamojAVWpwK8Mnt53nbUC9UcbT8N7ZEtvuzYk
	 Sm8PIeVecShQDoNWFLDneimWGJz8FumQ+gNPSXZ2s5dI4+vAxMHCAKxK+y5De+B30EdFc
	 R6R2/7UCZT3OyHRQXfhV2gOwF3qyv+ac5ZJw0r+Y+OT/LrAA7vXdUGscxxDCegvz9ssbs
	 xLovd0C2jIjAP6Pp6tkKXY82vSw5UCCCKiwCE251+AzBEqH7gJHm39SOi26XbIgcaVMUx
	 eCTjoiSI5ylcr76J5cqC4j2gBmQQyCnjMCO81693zehNw4kIhesKF4Dekq6geIqRz8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775222;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=kUqYMnBcsEL1do1DUDscVdbJ5Tov4SvgkfladUfWF4w=;
	b=fj/tNQvMvzAfdh7uuIkDnovygqFjFEZZeFbX12jN9kiQvNJQ/RK/AgmJPbB8xw4R0W32
	 TKbd89G7mpxaxu4de8kirTCKUr6nH/86SRUyVv95cidCdQJS5N7FSBPLVftdmjFxpQy+j
	 wASZN/f6Culux0028XJ9hAUH60tlu9vYwO3gjtu9Bd316Skgz+PH/sydS967vo/PaYW+w
	 r6VdsnyxN7Z0iHSrbf0VHATpI86tyc0jckWTUS2T8dMG/J3lAt5V+vUn1XjvA5YCBr04C
	 uOTZuQX0KJEbkW05zEfx576nsuinXOUiAI3MCKFRAHEGhb+lNknBLqFaBjTyLLUA0Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=jrjLNw6e;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E373C606A31E;
	Fri, 27 Nov 2026 10:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E373C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=jrjLNw6e
Received: from hawking.lan (ntp.lan [10.0.1.1])
	by www.nmnhosting.com (Postfix) with ESMTPSA id E59604C984;
	Fri, 27 Nov 2026 21:26:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795775217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kUqYMnBcsEL1do1DUDscVdbJ5Tov4SvgkfladUfWF4w=;
	b=jrjLNw6eKElCiN4pO9MuTqz/brZEVVk50lfZTJGsbjjhfzMNjajs+kMzEnEVr36UQaNPAd
	nOEVLJ/M88JLlyCuIwSwXUu1ZA3PQ+EYdmUkNGwKDkwtr9ak9HF6T3Kglac/NWdbYjkZtH
	q5DMdp555iyOcUuG7vBJ6xU3PLC0bmtxq34fLN1dHPnt/R6jRkYql8jlkMdu+APeIKs8PN
	I48OvspZvXO66wJQsL5/HBg+29IGL72D/fKTKFvzxdmcFNlid+WwZbJ/xOjHAKeS5/WQh2
	BKVKyuMuRMywRRF5oTv4sFzNg812/uwlOYeHNPeFwqAfcSt92seyXrCPt571jQ==
Message-ID: <645158cb30c2335a6f3d301d7ecf0aaacc28df5b.camel@d-silva.org>
Subject: Re: [PATCH 00/11] arm64: dts: allwinner: Add Allwinner A733 USB 3.0
 support
From: Alastair D'Silva <alastair@d-silva.org>
To: Andre Przywara <andre.przywara@arm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai	 <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland	 <samuel@sholland.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet	
 <jbrunet+clk@baylibre.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 27 Nov 2026 21:26:56 +1100
In-Reply-To: <114b03ba-914f-4494-be12-d967be62da00@arm.com>
References: <20261127073231.1776847-1-alastair@d-silva.org>
	 <114b03ba-914f-4494-be12-d967be62da00@arm.com>
Autocrypt: addr=alastair@d-silva.org; prefer-encrypt=mutual;
 keydata=mQINBGactvoBEADBFM2HqfQUUM4j40ZQPyYzmnM8S6zrycO0ipDDPMs7nZMzyzGzOdqfS
 VB/tuYvZOOKVWzJuWJ5aT/YyHx54r3L+D5hTkEG0sXPVJky3yTS9sbHEMSLBHb8TVVuhPVPuieV4g
 Nkqg5POMTidk8xAw50WpV++tUlewXVSciehnuCQPXhXMP7FcCh4uO8LdN7E8m7ir1LafKTFfoWPah
 KVT8NGG9r+ucrFcN5F+VnHxTDaI68yRPkNdtUWmp22wIX1KwDCtKFrndYO4p5Hv2hlDKomsuIIHHn
 muQGRwuh0xpf0nVJNF8ETZHMzxQLfo3e/HvxBFOTkwY9w7CuuQFZchbhS0I3PfmGT0+jiNcdfqjDC
 fPPB5uhy+DkR6wO72vuwFYUrpU2mdliDSdKEtWBHulnXMJjpBOXetfIwhI8G2dTVg59lN5i9DvJZc
 7y1Sp+qfZQ4P9qpYZyQEKR4GNDOdnm6F2LW2cZkcyAU/Ii765zdDMTQMIzZNSxT/FcDd0K1voTNRl
 QHbQw+kmIMhzSv2JefcC9oNbE0XYzcBDNP5T3O/4itOQ90GCKQEPAbIPeBjlQif7kkyvo/H6yv4s9
 duuK7zbJD9AID/+KGLkpU3p68VDB/C2ZSb9rQz3p1CJNSfsX/CPk7sPqA7RKZ4a2B0hSJ2pJCncNZ
 KXtMlkkm/FmewARAQABtCdBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz6JAl
 EEEwEKADsWIQTQGemDFwqYyU/dBWv75AdnjVo60gUCZpy2+gIbAwULCQgHAgIiAgYVCgkICwIEFgI
 DAQIeBwIXgAAKCRD75AdnjVo60qHZEACJnLfpS71Hk8bX0CLCNJ5wgqdZD3pBHEdbv9Ux9kRlZp4a
 ZFwlg9ltwBjl2dZP3PLtD9xQdsdYKVippKd5a7ZZC2y81oDaHjeC9LnPYn8+ce3mGE/+gRyoNfToY
 N06DeUNJKSlZ9t11UIqZCgfp12u16/Yrigy8C4ihEeHXlLhNX6JkeJR5gsHXJnC7vSuMZY+Qz2R72
 ZidWg+cd2WDMGop5sbTvc+55q94A7vTMlWzaix5HdbEUA3sd2U0dMBju5QodRGGhDQMcCu64TydRD
 MtMzzOk9ThJ036ze3HASWGOppyQmaw58k+XNzbHlr9Sc1LsFUNF7zpWXac2rzlywbyRAdFIT/TC76
 hy9zOkwIo2nwA/tdIwLx1j0UZPpAMQmcDUvJqZh6sE+fv6HN0yMPr+sSYJmriMt8Z6leCEHQXOHVI
 SI5z5FvV3coMmHYRq6aXpfs/8SLiYgkV3B0HE/E18Y3j1OkeLYoqIH1VfzQZeCSL/S77NYvk60/MV
 1HFSyqLdUR3uWZI4uZzoEcMoB0GX33uCTp2Ntc00+wSntwekCUQLCMLUb7dZrbpVuobHoWWtkiD2I
 uE5kAiaVwwwzM0BUwiM6VzVoKbeECz93rdsNtwoDqM0NtzoISC46H/BKVQ9mRNXDO4ThEBpJ4H2Tn
 mPNRYYcR0u2mNy1EJII04w==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


On Fri, 2026-11-27 at 09:56 +0000, Andre Przywara wrote:
> Hi Alastair,
>=20
> On 11/27/26 08:32, Alastair D'Silva wrote:
> > This series adds USB 3.0 host support for the Allwinner A733 SoC and
> > enables it on the Xunlong OrangePi 4 Pro.
>=20
> I think you should step on the brake for a bit, sending out (AI=20
> generated?) patches like crazy is not going to make you friends with the=
=20
> maintainers and reviewers. At the moment we are trying to get the basic=
=20
> A733 DT merged (for v7.5), so anything non-essential has to wait. And=20
> the list of out-of-tree dependencies below already shows that this is a=
=20
> bit early.
>=20

Ack. It is AI generated, but reviewed, restructured & tested by myself over
the past few months.

It's been sitting around on my drive for a while (I was expecting to enable
U-boot first, and that got tied up with reverse engineering the PMU,
but it seems I got things backwards).

> So I'd say wait for v7.5-rc1, which is probably going to happen in early=
=20
> January, then you have a much saner base, and we have more time for=20
> reviewing more fancy features.
>=20
> Oh, and also: please try to look beyond your particular board. It's not=
=20
> just the OrangePi 4A that is out there, we have other well documented=20
> boards as well. Peeking at their schematics should make it easy to add=
=20
> the respective USB nodes to their DT.
> The OPi 4A is benefiting from work of other people as well, so it would=
=20
> be nice to do the same for other boards. It's fine if you can't test it=
=20
> there, just mention that and others can test. That has also the=20
> practical benefit of keeping the dependencies together.

Sure, I was not comfortable with pushing out untested code, but if we can
offload testing to others, I can do that.



Cheers,

--=20
Alastair D'Silva
