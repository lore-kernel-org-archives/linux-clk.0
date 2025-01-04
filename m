Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904D514B08C;
	Sat,  4 Jan 2025 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735992252; cv=none; b=ENo9ZgDqMm6r00cymW69jzZYboijuMYZdDKqiFZHKvhmcgqP669KY3S1DBdG4rBcV2XhwhOr4pX+VlOhsKXcVhTvXDRofwftMH7rLzenIlLnrwy44mgGv2u3UcDAjjMqOIKAMg2A8a8a9bC44KuL5ngW82n0pdzswbH5e6ml+8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735992252; c=relaxed/simple;
	bh=R1Z20e0+lFyZuMxzJriZxCSSm+JWTL/QSOvycD2zSGg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BAmjT5ysvksu+PqowIWQkjJahpu05lapFN4YTNwWmTrUW0CNJtoJby8oIacree1CHHMQPnvTL0+VfbZ9n4AYnglHsHBx4CvQMt3/1KmJI8qwnPwo0W9IMkhAghIWCwTL+rFyeJ2niIag15WxgUm5PQqtUAtNnDzgY+lL6t5bBCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 995801480;
	Sat,  4 Jan 2025 04:04:31 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E520B3F6A8;
	Sat,  4 Jan 2025 04:04:00 -0800 (PST)
Date: Sat, 4 Jan 2025 12:02:56 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@csie.org, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman
 Beranek <me@crly.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Dragan Simic
 <dsimic@manjaro.org>, Frank Oltmanns <frank@oltmanns.dev>, Stuart Gathman
 <stuart@gathman.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X
 and PLL_MIPI
Message-ID: <20250104120256.65511a28@minigeek.lan>
In-Reply-To: <ca0cad16-7c39-4635-8f09-f9f3c95c9fef@kernel.org>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
	<20250104074035.1611136-2-anarsoul@gmail.com>
	<CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
	<ca0cad16-7c39-4635-8f09-f9f3c95c9fef@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 4 Jan 2025 11:33:23 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 04/01/2025 11:23, Chen-Yu Tsai wrote:
> > On Sat, Jan 4, 2025 at 3:40=E2=80=AFPM Vasily Khoruzhick <anarsoul@gmai=
l.com> wrote: =20
> >>
> >> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
> >> select TCON0 clock parent in dts
> >>
> >> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCO=
N0 mux")
> >> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> >> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> >> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
> >> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
> >> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> >> ---
> >>  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-b=
indings/clock/sun50i-a64-ccu.h
> >> index 175892189e9d..4f220ea7a23c 100644
> >> --- a/include/dt-bindings/clock/sun50i-a64-ccu.h
> >> +++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
> >> @@ -44,7 +44,9 @@
> >>  #define _DT_BINDINGS_CLK_SUN50I_A64_H_
> >>
> >>  #define CLK_PLL_VIDEO0         7
> >> +#define CLK_PLL_VIDEO0_2X      8
> >>  #define CLK_PLL_PERIPH0                11
> >> +#define CLK_PLL_MIPI           17 =20
> >=20
> > You can't really split code movement into two patches.
> >=20
> > With this patch applied the clk driver will fail to build because
> > the macros are now redefined in both header files. =20
>=20
> Are you sure? The values seem the same to me... I don't see how this
> could fail.

Yes, IIRC the C standard allows repeated definitions with the same
value. And I definitely tested this before (and hence recommended this
approach to Vasily) and it compiled without any warnings here.

Cheers,
Andre

>=20
> >=20
> > Barring recombining the patches, please add a patch before this
> > adding #ifndef's around the two macros that are moved.
> >  =20
>=20
> No, not necessary, just churn,
>=20
>=20
> Best regards,
> Krzysztof
>=20

