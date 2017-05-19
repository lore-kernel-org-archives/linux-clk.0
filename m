Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Fri, 19 May 2017 20:02:15 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [RFC PATCH 01/11] dt-bindings: update the binding for Allwinner
 H3 TVE support
Message-ID: <20170519180215.7lc7duueu74pt4kz@flea.home>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <20170517164354.16399-2-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20170517164354.16399-2-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4214209941031905922=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============4214209941031905922==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhwnzsjpz5kvdc7d"
Content-Disposition: inline


--zhwnzsjpz5kvdc7d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2017 at 12:43:44AM +0800, Icenowy Zheng wrote:
> -On SoCs other than the A33 and V3s, there is one more clock required:
> +For the following compatibles:
> +   * allwinner,sun5i-a13-tcon
> +   * allwinner,sun6i-a31-tcon
> +   * allwinner,sun6i-a31s-tcon
> +   * allwinner,sun8i-a33-tcon
> +   * allwinner,sun8i-v3s-tcon
> +there is one more clock and one more property required:
> + - clocks:
> +   - 'tcon-ch0': The clock driving the TCON channel 0
> + - clock-output-names: Name of the pixel clock created
> +
> +For the following compatibles:
> +   * allwinner,sun5i-a13-tcon
> +   * allwinner,sun6i-a31-tcon
> +   * allwinner,sun6i-a31s-tcon
> +   * allwinner,sun8i-h3-tcon0
> +there is one more clock required:
>     - 'tcon-ch1': The clock driving the TCON channel 1

Putting ID's in the compatible name is usually a bad idea. What is the
difference between the two? Only that the second one doesn't have a
clock?

That seems highly unlikely. How does it generate the pixel clock
frequency?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zhwnzsjpz5kvdc7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZHzMnAAoJEBx+YmzsjxAghdkP/jMCKTu4ahssq/exK6mZLsvH
V2VRotU/ZEa6xlA8XbwPZeq+XwzcNPGfvy8rF04xA5uyjp9UIig0Volhhg/R41l9
YWDVntRsJ9Z7DeadkC/5fx34D07t5YT9hNWYdCzYqhsgReB2q/SjwfLGB7ZanEg0
dL9h9hGfr2A+VHn0slwVoalR+VrIh+3VFC7ZJ5oV1juAQ4oNFMmEmzNDHnrlj1iT
9kRuwgoirGtOh9WR4NnpEobrHJF8W0OfgpTvS/gevUSJVkYWh9rtKDzEfDebLLqx
SLZxe0FtR6XPVBSAFPkl6aP3Nq9zglIYrgE+YEFosi2njyh4g60JTXJejC5LSuZT
FokK6izsHnkor93YZ05ubX7a7Et4M6Jxy1HPfuN8GZpf2ytrR04CGTLBLubKMdcr
eADaEsROii6YS+M26vJ8A3z9QoQpxOVmUN49puSVU4KDPj+7CpLe1NPpbHQ8yq22
7RT035qqQXKXLDG211VC+gK6E/pI0mslCzTcbMJIGxG31YCxosOowY2s3zEVZ2Ej
GuN7Up3iX3dJevW/hr/YHES8NrNsLBZFx3H6T/Ju8onS4LLMToMhweGIIiIGTNg2
UlZrJkPqIsPUENaQ+MqCXVO2z6H1urk5WYhX2xKnc4cQAzqcA8iJUWsikTxsLfTl
WQGqP2xZjdIsou0Qjj5B
=rBMI
-----END PGP SIGNATURE-----

--zhwnzsjpz5kvdc7d--


--===============4214209941031905922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4214209941031905922==--
