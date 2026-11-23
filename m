Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795449289;
	b=wG+NEDcberSfwRHvy0K45hvnPjmRjQgz9o56jIguVMLJxp3OE9JUXMBfqak2TfuF0v1y
	 ZH9VKT0LWjTh2oI5iha+nTHlF6LHg0tkX3Wscu8vXy5fXs7s2NZzF8keI52sXXnDuppoF
	 zssEMp9/Sn2tvd7sMtBUctMvWLpQ4X+6DGQ3d+TgopUsBf2Fa72u2cNjyJgnQEGmRi1ev
	 fQBAcF0ytQMZqWEfcx/W7OszdQn3pq+BW0Y2GuHYG/MLFMjy5mQdE+pdp44w1l+6tBmQI
	 AHXgZmDxGdGYlvUDGJZCag/9+WtJW4dU/sfnDXIEwotAMWjFlPVH6FmZmGplqd1ItJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
	b=q/VO2YWzI6TOxTumL3kS4hwmn4jKpPyueVY2Xu1rr6wfWz8qUHa1c+Ds8SVVy4mzd2E4
	 8LDR5xow73Qxzhdgvovxlv8Xj9jyedLlQKt0CjgwuaE03AV74Iepg/H/s2K5g68NR2tJF
	 CNEeoZ6UpKg1AE4HW7S/2xRbqr1WYH1a80F7tzM0gDxVYhQI8VopJQkk9HZM1qZaMDuvC
	 W7T4T3uwjlSXLW18yIv8/MtRtGjI7gN6imKCQps601cOH3WCuV2qWoDCq2dQeXgzEIQFp
	 VWe+69p+z645DBY7GbPbcZoD9e4PJ5vbjahHS9MkbObLmrkxAr4XRdJVliTImftCLWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K31mtXdK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC82606A327
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AC82606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K31mtXdK
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-382f4710a17so5902455eec.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 07:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795449288; cv=none;
        d=google.com; s=arc-20260327;
        b=j9nmLdFNBByeskokuO9hI0mA8MeS6EY6OTMdqhavx25IzgAEwXGTj8X/aOwMe9zFjL
         vFznSdnFLEP0AiQw+Cf/Cjk8WN3XgDZdaRNd+K1WkpOiKksrmtBgFMReom2y8luWVlhN
         KglE4kQ8im85JJOQxxrGqF8DERPMAzhZD3gLSnOhIQp3aU6oJZUMfYBxwA0lOX1uVteh
         M97KmQpZCS+90KCBpu6cgk0+VyvmsJvtfRf4Y6IEsX6K76apxOBZR/pqlUcvrv8QDeS2
         tLR7cdOIX2qg1cTsAXztE32aEVCaIBc9xp100zhjeipI4+kwPhX3fwVF4vf1B1Ru8+6T
         ZBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        fh=YQiAzmvRQwLFNWVaqLNRBvJXR2IjZVAQ8UplwVKOwhw=;
        b=MO4UMzfvT9sOvm5O/k93o9gbrr7CBBlffwhROJDmIylVeRCXTfn4P5yMYF4W/hM+9b
         UtlfVNG758QdiyKuNREsF5RhDmlmj3KvruTuXpu/yzb2A9dYEK9/kXlCxcr9z5c8Unbh
         4foKGxN4BpifQhlayAVGQmF64L2sLQGxdADP//bOwSfYySnFnKpoHiY4Gfv7hsJr/Rsv
         DdmKEHejDDi5BdJgTjzzlE+vurXsS/r3NFINbnEMvdLuo/FxBEmgO+/GnALlTUnzZPKF
         3fj9PXOLeG/mjqmVjpa9u+/ITqO/3HAIp1YG8jgWtDLhVx5JTz0S9v6YxoJDiT2eA2+Q
         JvNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795449288; x=1796054088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        b=K31mtXdKcF83FLFamHn4mu2c1WFux/XDEszEG14A98Jt2rLyW5vAa6g0aQrAW3bjzC
         gllAzO506OvE/rfpZOcYCxMRUDQNB4VXopntsohEOrakiet5wYn7sGPPxwfV/CfChisN
         uYXj8HFMNtuEZ+ou9t21iBeUUC7Pic5yoPJ+xhHP/+72mh5EZsszVIGPCdywgkhiTEHT
         PWSHOr4kNaUQ3YX2g4wkBHhAis3nwdahz8TPq6MFehDLcsSCT1djEzG7g4OFRye28hLN
         CCekPYk30csF+W8hqwpRnXEm3DGytgokuK/dlh+xzWCckuPUC6BXDNd7W44jN2cXrX68
         uVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449288; x=1796054088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        b=TEo0f02D3xU9EmcAqD6BqsvLfuerkx+ZdPumaLp4JoBUk1ak2GsY5E23PEoIKpMxbn
         04ke0Hyy5Ih8T5lMAV+uMQgMMBspjGJR7ZKcL2hQ0cvXDgkrJ8NIFHmOOVO2XXPYG2ga
         b8pSWobtITR/TVUf0uw2MZ6pcCN6lB8mYZ1uCm6ktwlpfH8bdIx5wEsT5R+FWLJNvS++
         3vFMAUmzH5HBjagDss92gFuYyp5EZpGBjCocMjKM/v9wHL9Q/MEZ7i3rlaYr12SkYsio
         CyWqHqivB1QWygj1UdfKLlHIQDSFC8CeDAag/YRMaUksCvXdlJbPH36/HFTXM2g+YgCF
         K0Cg==
X-Forwarded-Encrypted: i=1; AL+hErHpugxp2de0BKQvyyT1Mjrn9UzFX1+2rkJTi5ARK9o02topWq1tRoqC1s6zeLTA0IOlF/QoSgNH/jM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9O1zvgC8yDzFshMSVUc/qUgTcZh9nMbD9BatpIen5H58zGcOf1
	EBo6sUuFTSJSJh4zpVY7hX5hBa7Ue80KmEthu7u97IBREHRWMnUoye7U3ZZHMPZ1yfuLN6l7+7+
	GCjU1SK+1EyKCaDhWP79LDEgSPWhICrm5tCIugN1MQg==
X-Gm-Gg: AZFdTZeKEOemsG7To+TEu1HGJ6lNTgtoR+EZj52n91mrL9zJp6eeSITcyz5vUwBEEPU
	ZEJ0wQ48cahPRkde9FWSJdcl3eCZyvI3+os2C5olw0ibYSx9i4AV9jkRaDf6evkrqzovumW121f
	cSQpvHayO2DzBKeHTQzDIbA0UPQYXLdZ+aqXUDXfMmtez0DV4ebXxHqG2blagoKuRkguE0F6h5i
	0nSQ8uDCrzbawzWiRA6/jyUrSI0L2Stt4PQsBtIT7VBZe45lFGkuLTLZNQKNB6GsB/ZNyE509w3
	gATxR6AufEhD5VeM+N//CCRl35crWr05QvyENY65//Flut5K9lsH1ZaEMcrovtmfBr5V4zGge+I
	SXSzTkm3/6zEK7yZuiiO+PUDd+V+o1rBf60e9XVG6WPL9cqYSlR+GHi9MsQP8fdPcCgLkprawZ9
	/foxn/m7hxefClarceoSqiMT02ftqjLqMps7EaDzEsy7cEezQQaITNMlJQi0N/f7cQnL+4cN5gw
	to=
X-Received: by 2002:a05:7301:e103:b0:385:496e:80ac with SMTP id
 5a478bee46e88-3856fe59334mr13784647eec.8.1795449288031; Mon, 23 Nov 2026
 07:54:48 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
 <awARmkCuelD_fdX6@shikoro> <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>
 <awAq7vxcY8CGjhNl@ninjato> <awGV8BU_AfaXQyBv@maple.netwinder.org> <awIMBj_7OLrlM5G-@shikoro>
In-Reply-To: <awIMBj_7OLrlM5G-@shikoro>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Mon, 23 Nov 2026 10:54:36 -0500
X-Gm-Features: Aa3M54odzMyo7xKMWSU836vO5_C9zRbLplW5YRgzXWccrFx6zqrBud8_l_A46R0
Message-ID: <CANp-EDbNxWnpjXDshVhPEwppGu1cf2V2UBO+hk2NtFDFeqCAdg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document reset cells
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, khendry@reliablecontrols.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 4:24=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> > Thinking about it some more, perhaps instead of using 0 as the special =
case
> > for "no parent", we could set .source to match .index. In other words a
> > clock pointing to itself means "no parent". Worth changing?
>
> What would be the gain? As you said before we can't update the values
> because they are already in DTBs.

It could remove some potential confusion about whether 0 is allowed.
And perhaps more importantly, it would make consistent the .index and
.source fields. Having one of them shifted by 1 can be confusing, and
could lead to bugs.

Ralph
