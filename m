Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792968904;
	b=znNf/hMHw2PciepFYSOTW6IsyfcHHeLL8Q5Sg/cJqBCI9SLzj/m6bsnrgbhHNaiQEiQL
	 S8VGmwh5NOvZeOsZcv6ZzWUs8uVeeQBFHoRH+oi5l3KSkMYEd3U3Num6XFfucXrmkNCLX
	 OK1o+4trYr3/NeRzJAUX5EGGYoyOpIQlmacB2dP2/9bmyRjldrPF/GcjJd4HaQlAQivYB
	 XrCgZY6OFWpqPa8HMoZyy6ehDPK1D5Zn6+AG/gnwsOYmMsWJvmBEWAlwpoOTM5UHTlXny
	 gylH//7In2kCWucGx98VBlhN30+uEn6PES+bqDs7f71Go2vqAC9ltRaQ13XeVHUUmEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792968904;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=Vm//i3BWkJl3AkkwF5gC7SHrPbPShxtg/tUJT/ir0V0=;
	b=AAGJHxul3Gs5J+NBNWMHyWQPk6PwJsGJDe00AoPVgT/LI0emFpFnhu5BDKI2wOjI5lc1
	 N3L6kTGEpoDxHi8Il7J9J2u9Ee3CxPt5irwkz1o9UbFpzd/W0E/DdqSyZvBIbYtuOZGjQ
	 ZQKj4CgmLTihxQJYidDWRSF2Ka3gwJjbbhC9y/tuGy4PUpcinKHENOLIm5DdUW9P6yooN
	 9zjb3+7PcBN0XbxT+LQWZ1TtBQA9585sOR6wo/+d/1ZjgDwLTTzbHq3iBeOuVafP/wzkJ
	 vd9XdDwW0og9jJENtPbQTT35hvmPCstVxVwh/1fU9AwTZIJ615fl8OvaxIZBtyz2vaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7AB606A31A;
	Sun, 25 Oct 2026 22:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C7AB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <c1591d63538946500b5939c385d624223495361e.camel@crapouillou.net>
Subject: Re: [PATCH 3/4] clk: ingenic: jz4760-cgu: Adapt calc_m_n_od() to
 core framework changes
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Stephen Boyd
 <sboyd@kernel.org>,  Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Date: Sun, 25 Oct 2026 23:54:57 +0100
In-Reply-To: <a718b428cff741a2c14fe3c022026c8a88c28abe.1792955907.git.hns@goldelico.com>
References: <cover.1792955907.git.hns@goldelico.com>
	 <a718b428cff741a2c14fe3c022026c8a88c28abe.1792955907.git.hns@goldelico.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Nikolaus,

Le dimanche 25 octobre 2026 =C3=A0 20:18 +0100, H. Nikolaus Schaller a
=C3=A9crit=C2=A0:
> The common Ingenic CGU core framework was updated to support a
> secondary post-VCO divider (OD1), which extended the signature of the
> calc_m_n_od() callback.
>=20
> Update the JZ4760 CGU driver implementation to accept the new pod1
> argument, preventing compilation errors. The parameter remains unused
> on this specific SoC architecture.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> =C2=A0drivers/clk/ingenic/jz4760-cgu.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/ingenic/jz4760-cgu.c
> b/drivers/clk/ingenic/jz4760-cgu.c
> index 372fe4b079927..52cc5ce150048 100644
> --- a/drivers/clk/ingenic/jz4760-cgu.c
> +++ b/drivers/clk/ingenic/jz4760-cgu.c
> @@ -56,7 +56,8 @@ static const u8 jz4760_cgu_pll_half_div_table[] =3D {
> =C2=A0static void
> =C2=A0jz4760_cgu_calc_m_n_od(const struct ingenic_cgu_pll_info *pll_info,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long rate, unsigned=
 long
> parent_rate,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *pm, unsigned int *p=
n, unsigned
> int *pod)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *pm, unsigned int *p=
n, unsigned
> int *pod,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *pod1)
> =C2=A0{
> =C2=A0	unsigned int m, n, od, m_max =3D (1 << pll_info->m_bits) - 1;
> =C2=A0

Well you can't update a callback prototype in patch 2/4 then update the
implementations in 3/4, the kernel has to be buildable after each
patch.

Cheers,
-Paul
