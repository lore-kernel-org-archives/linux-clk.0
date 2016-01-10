Return-Path: <kernel@martin.sperl.org>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH 5/5] dt-bindings: bsm2835: fix bindings documentation to use new clock framework
From: Martin Sperl <kernel@martin.sperl.org>
In-Reply-To: <20160109224523.GA17329@rob-hp-laptop>
Date: Sun, 10 Jan 2016 12:05:52 +0100
Cc: Stephen Warren <swarren@wwwdotorg.org>,
 Lee Jones <lee@kernel.org>,
 Eric Anholt <eric@anholt.net>,
 Russell King <linux@arm.linux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>,
 Remi Pommarel <repk@triplefau.lt>,
 devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Matthias Reichl <hias@horus.com>,
 lFlorian Meier <florian.meier@koalo.de>
Message-Id: <ED21A42A-EE91-495D-857E-04C533CD718C@martin.sperl.org>
References: <1452331558-2520-1-git-send-email-kernel@martin.sperl.org> <1452331558-2520-6-git-send-email-kernel@martin.sperl.org> <20160109224523.GA17329@rob-hp-laptop>
To: Rob Herring <robh@kernel.org>
List-ID: <linux-clk.vger.kernel.org>


> On 09.01.2016, at 23:45, Rob Herring <robh@kernel.org> wrote:
>=20
> On Sat, Jan 09, 2016 at 09:25:57AM +0000, kernel@martin.sperl.org =
wrote:
>> From: Martin Sperl <kernel@martin.sperl.org>
>>=20
>> The bcm2835-i2s driver has been updated to use the new clock =
framework
>> for the bcm2835 SOC.
>=20
> You are breaking compatibility with the driver change. New kernels =
will=20
> not work with old dtbs as you have found. What should be done is fix =
the=20
> driver to work with the old and new dtb.

Actually the driver/device-tree is already broken with commit =
94cb7f76caa0
("ARM: bcm2835: Switch to using the new clock driver support=E2=80=9D)

Because there we already have the following conflicting definitions:

clocks: cprman@7e101000 {
	compatible =3D "brcm,bcm2835-cprman";
	#clock-cells =3D <1>;
	reg =3D <0x7e101000 0x2000>;
	/* CPRMAN derives everything from the platform's
	* oscillator.
	*/
	clocks =3D <&clk_osc>;
};

i2s: i2s@7e203000 {
	compatible =3D "brcm,bcm2835-i2s";
	reg =3D <0x7e203000 0x20>,
	      <0x7e101098 0x02>;
	dmas =3D <&dma 2>,
	       <&dma 3>;
	dma-names =3D "tx", "rx";
	status =3D "disabled";
};

The i2s driver fails to load because the second reg range
overlaps with the range from clocks (which was introduced
with the commit mentioned above.

This patch only changes the driver to work again without
this second reg address range and using the clocks property
instead.

>=20
>> This patch documents the required changes to the bindings.
>>=20
>> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
>> ---
>> Documentation/devicetree/bindings/sound/brcm,bcm2835-i2s.txt |    7 =
+++----
>> 1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> But I leave it to platform maintainers to decide if breaking=20
> compatibility is okay, so:
>=20
> Acked-by: Rob Herring <robh@kernel.org>

Thanks,
	Martin=
