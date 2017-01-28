Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Rob Herring <robh+dt@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-rpi-kernel@lists.infradead.org, "linux-arm-kernel\@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, "bcm-kernel-feedback-list\@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, linux-clk <linux-clk@vger.kernel.org>, "devicetree\@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Document the VC4 DSI module nodes.
In-Reply-To: <CAL_JsqJ=VQSUO5MeHJSCB=_SnmOnA7G1=GhmWYKhjm-47kYV-w@mail.gmail.com>
References: <20170124003853.16418-1-eric@anholt.net> <20170124003853.16418-2-eric@anholt.net> <CAL_JsqJ=VQSUO5MeHJSCB=_SnmOnA7G1=GhmWYKhjm-47kYV-w@mail.gmail.com>
Date: Fri, 27 Jan 2017 18:41:37 -0800
Message-ID: <87ziibaota.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Rob Herring <robh+dt@kernel.org> writes:

> Need to cc DT list if you want it in my queue.
>
> On Mon, Jan 23, 2017 at 6:38 PM, Eric Anholt <eric@anholt.net> wrote:
>> These are part of the vc4 display pipeline.
>>
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>>  .../devicetree/bindings/display/brcm,bcm-vc4.txt   | 35 ++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
>> index e2768703ac2b..34c7fddcea39 100644
>> --- a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
>> +++ b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
>> @@ -56,6 +56,18 @@ Required properties for V3D:
>>  - interrupts:  The interrupt number
>>                   See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
>>
>> +Required properties for DSI:
>> +- compatible:  Should be "brcm,bcm2835-dsi0" or "brcm,bcm2835-dsi1"
>
> Are the blocks different?

They are from the same lineage, but very different (old dsi0 is 1 lane,
dsi1 is 4 lanes).  You can see how much the registers move around and
change in the dsi->port conditional blocks in the driver code.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAliMBOEACgkQtdYpNtH8
nujb2A//cz0wjKMwfrZVnCyS9pI679tKHbsH5zytw4Pukl0EdaV2TpC/BfrOlin8
Lv4IEh5gFNBKp9g2p/shMDDNDuGZlX+3xv6R9Fm0BCaU2WaxsLFjYqzeT6jewXrE
K65DndHDfHKGONuHdCyQ3TqKjzgrB4r9oCHJ4Q2tscojQlyrfqXBAqshSTBawg+p
xY2qSALdIbD8qYkLVqy0Q1Bn41pRFKUF0zYEun6q0lE2ZG6oE/J4w8Vh8gIVNIuu
g5u5R2IY5EpwQPZ0BNMm7N+pS2zDnmGmd1EqVRqvdjMDbavrAEbm3EnAX77W9IG+
GY+Ws2nlP+C+vvAfPmY1JDV7RxPAbE2xBgOmaWKHUAWbLzLZW3F3KvMfJXh6nDOz
VyHjRKGT+Ws5yy0wHpviyc8rHtxRogrLbiM+9mjde6B9s3whIRu2qIMVYtrEM7LD
swh/sKhkgsG7TtiXT6QhyaVN3j8H6XXLr+q9oJQ5391p/X/XpbAsX/FUfa1TD0bp
d7GSluEs+P/9CfbXSuVWKamnIy8ip3pN4Mf17STiQuViVB0BkgdJx9ktt7CpZ9Oj
Ql3v8nAl6UQq+DTQrK5NMwjspDrnjPmwin43wIPegQiRthjm23ruuqroYtKXPKJ4
iczlM33GTb4FNh0hEn2pggX1ZmNsi7vwm5X16qyeeYsbOT+QIb0=
=kRRx
-----END PGP SIGNATURE-----
--=-=-=--
