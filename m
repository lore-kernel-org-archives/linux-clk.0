Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648350;
	b=v4ArKInyMWS5uobwg9loVUcrwWJTq5GTTqe9KIl7qRsryJeacFb7oqepBN6l63FNL6Zi
	 qqXpzXAujD1nY4L+fOxK2BW/ziM6tRbxNrn3vsZgXrS0DSz+1bkZsKqUnIX/j0x3325NN
	 HMY/i25N9WjoT7SpRBgBUhXdaGj9sSWL8/pSJ/Oj1la9Sz2RaTGLOtk38JBUAacSxa192
	 rt9+X+evwnhzvrT3UmK+q9D0pmekrHAEvqFfj0rbOxpBe7Vj6+tJ2MUVgpbNdsAEfxWvk
	 /YkUiN2fV3qaRa+njTOFxP+Kd8wKQ3wyjDvuGxWTX++X8BllKMw9Tn/44bta2gZLrCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=;
	b=A7Ycj3KLp8ex3D0bgBeO8sl0B5j0kn7tojmK58KGRwRD3153kAdGMEgQyR+kE5sWxyaw
	 FB8YYCNbufB84bcvYHINiBnRxKSONeF8sh+6rxnEoC7WlGjlbsqGQ5Ez9hoFTozefKy9n
	 H8/knWkuwClnffroZ2//MEv5C744h/mZStZts4WsorTVa3wjk3hf+U7I60/5F7B8Hi8T5
	 vdALyq3gt3UCODzXw1ACjfOar+ND02q0cA2SVXUwDJMyzfdgBh2KDjpRfxkOVy0ZlukwF
	 RwQZaoR4fIc2PCRtZCV10Cvak9YJKf83kGW8Of0LCc2H2gjOgatV1UbxSShOYlJ898A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=P9+vfVMQ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AB3606A32A
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 23:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34AB3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=P9+vfVMQ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso60659945e9.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 15:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795648347; x=1796253147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=;
        b=P9+vfVMQuEA5tApB3Ym+P8H7sPqn9qUi+CwY7nhtWJ/GEq21N+YuwnNdE7iVGw20bZ
         dgEYwQq4qLwfEZ5QGeH8wpnTY+9HTHRiTm9S56qrqXGzjRXUgjA6nZKHE5zoiuQgQ9DJ
         JSSekzHetnM6g9vN0zXnQ9SBK8tneNkTvPOSOwv4DVq8lAoPP2Vxp3IGuLXSpx20hrEf
         25UOybrnutUF1MB2Ba/f1r/iCHNGotD9Jq3BSyO415okFTxkzZRxdC2QjHIb3y+ysD7r
         S+zqG6SBRdD5fnuotFWNOiQLCPVOer5mKJZbhI+TbAdKrBrt7pDlfptq3gjwKl/DUjbz
         MVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648347; x=1796253147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=;
        b=mjSZaHeyjgmJPKnGTVBn0LsprHCHvdnRmLJ2mXfsL8tTOS3tmlarN9gIepeyjD3t9+
         bCLRFQHrcpz4dz79gWvHQ+nkQbcxSg2zVH9go4Hl9JHtnipwzG8uZ6rg2alNSD+eydbO
         0OL2rc4MgM/AopfHosRxcilRYbRwrQIvV+9LDUR2zFFAVgQnK3U3ltlufEcpB3ty8ZmP
         OHASs6z0GXlovqefz+hRXCTnAubKuQ0s5ZqwsxCu6UmzaO/j9FnQaI2rXJI1dLr1N2uF
         AvE/yUTSDesxTuD6Ua8D9Zn4P8SkgNadfP79PPRdPPrWAXeps9Pad18+V9A+rUKUu2KS
         ARZA==
X-Forwarded-Encrypted: i=1; AL+hErE0xVTPhReu+nUTVSiZI8t8Yg6FVL60Ahy4jy3pFSQgK/10yvS9mMalm/HCCRI9ImlUX34Bwp3Hmng=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+jgzAsttP8Th5ZLkL3fAlQcaNsUvHLlmAU1MH4KtEPWynMnAP
	VIZk5PMoHj7VBH97+nwJACjy3+d6I6EYgspR9f5QFSDFzp8WOG5C3eyDEtL6cAfEcIs=
X-Gm-Gg: AZFdTZeRT8NS0PB1o2aBFbpwZcYkwaCsB++omtKxwfj5Vq11AqmOt19HeHrGEROIbGS
	X/dRoS7XpcDvLMoAvEWibRqFwa2K16cTPuHp8ptdbFz5kF15B52I7hy4NdXsfUbpCnYz86Xiwlf
	ru/TKHieBMZPerTy7U/lW/OXfcarfE19QFDOSJdNck3ejh2B9cnEr7WBkGZzM5YDEgc1O9sxz2/
	9AAcxTn3iB3H0XzWNo3cZWIhQ49daVuk23QzeTxh1LiADUoLH3JrkmwjxDEU4BgpyC3rM/9l7CX
	IKSracW4hNS6sXZ3LD/yMIIkczpo0cUTM7J2HZLHjM3g3JdmO0GEPvRLq3qFmc06RwJZwwOQykh
	mg80VR9rg3X3CD9jxY8hHVmFZFapavZ4IhvmIN4A7wt5km7Jmt83VYhKUDeENyEnmDqzeeeE477
	eljVhr6F5l/dVXIwRigd6D+QoLhcqgJqDPLCibInJEUxpq4r9EE6qY1bhkfgFp5UM9xkPLvvz72
	pfIi10OrcQD5QMTB1okLhytPOJy9rXXEa3ejaCaNr+LmghFv/pqH0en4fYRltISP5Zc08cU7QxC
	AWHZ4IzarsTybs5DM9qY5xQBLxvUykje18o=
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr395769935e9.17.1795648347566;
        Wed, 25 Nov 2026 15:12:27 -0800 (PST)
Received: from localhost ([2a02:8071:6e30:8500:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8533579csm480759855e9.2.2026.11.25.15.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:12:26 -0800 (PST)
Date: Thu, 26 Nov 2026 00:12:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>, linux-clk@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Mariano Marciello <mmarciello@google.com>, google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awdp3W7LWfQ3ZrIy@monoceros>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
 <awbJUwrBQw5TnowW@monoceros>
 <awc0sBl6q6A2Reaq@google.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="khx4cneo7r6erf2z"
Content-Disposition: inline
In-Reply-To: <awc0sBl6q6A2Reaq@google.com>


--khx4cneo7r6erf2z
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 11:19:12AM -0800, Brian Norris wrote:
> On Wed, Nov 25, 2026 at 12:43:40PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > > > +#include <linux/mod_devicetable.h>
> > >=20
> > > Please include the specific <linux/device-id/*.h> that is needed
> > > instead of all of <linux/mod_devicetable.h>.
> >=20
> > Or better still, rely on the bus headers to provide the needed
> > *_device_id structures. (That is <linux/platform_device.h> provides
> > of_device_id (for patch #2)
>=20
> Only very indirectly:
>=20
>   <linux/platform_device.h>
>   -> <linux/device.h>
>     -> <linux/device/driver.h>
>       -> <linux/device-id/of.h>
>=20
> > and <linux/auxiliary_bus.h> provides
> > auxiliary_device_id and of_device_id (for patches #3 - #6)).
>=20
> Also quite indirectly.

Yes, I already thought about making this more explicit. But this isn't
my primary objective currently. It's safe to assume that the provider of
struct platform_driver also provides of_device_id. While a forward
declaration would be enough technically to define struct
platform_driver, that is not sensible because most users of
platform_driver also need the definition of of_device_id and there are
too many drivers relying on that already.

Well, but having said that, the thing that I consider important is that
no new users of <linux/mod_devicetable.h> pop up. If you want to go for
#including <linux/device-id/of.h> that's fine for me, too. (And similar
for the other busses and *_device_id structs).

Best regards
Uwe

--khx4cneo7r6erf2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsHa1YACgkQj4D7WH0S
/k62MQf+OKGka4mPSwopQ0+gI2VWXrdB3QhqgUL8ffjUMb7jkBi86oA6YfcjNC/D
8aZRTb/LZNPgl7ygdsKPEfFKlbKH1yCA+9gfN/aS+x6ykkZUKdn1Ha8m8ImuN87s
ooG++TXgzYfljHdoCVeukZsRth0gqt+QTBWLDPPUCDzC543cmPPqIWNi0LXdgwuf
OFve6MraHVKSLw0TVigzWyx0MYat5C1Y5gWVcsnmShhh1D18CrPfvFcu4dFot6Zj
IsEZRk30Wuu42YCnSD1t+UeGc+VDD5hxC1JhUdvN7txOJr1NHKdNT11aByux9mPD
ityFQTt/321OJci6adJV7NMgTYNlPg==
=MU9a
-----END PGP SIGNATURE-----

--khx4cneo7r6erf2z--
