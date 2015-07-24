Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
Date: Fri, 24 Jul 2015 08:50:17 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Jim Quinlan <jim2101024@gmail.com>
Subject: Re: [PATCH v2 1/7] clk: Add a basic factor clock
Message-ID: <20150724065017.GJ2373@lukather>
References: <1432241646-9511-1-git-send-email-maxime.ripard@free-electrons.com>
 <1432241646-9511-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64rqRC24wPWz5xYZv=w2QAtsCb-pd76Qynkb5NBCptXhQ@mail.gmail.com>
 <20150523074930.GI8557@lukather> <20150724000001.642.84690@quantum>
MIME-Version: 1.0
In-Reply-To: <20150724000001.642.84690@quantum>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Chen-Yu Tsai <wens@csie.org>, "Stephen Boyd <sboyd@codeaurora.org>,
 Emilio Lopez <emilio@elopez.com.ar>, Hans de Goede <hdegoede@redhat.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============4861907032914680897=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============4861907032914680897==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ELVYuRnMxQ5nnKRy"
Content-Disposition: inline


--ELVYuRnMxQ5nnKRy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Thu, Jul 23, 2015 at 05:00:01PM -0700, Michael Turquette wrote:
> Quoting Maxime Ripard (2015-05-23 00:49:30)
> > On Fri, May 22, 2015 at 12:35:35PM +0800, Chen-Yu Tsai wrote:
> > > Hi,
> > >=20
> > > On Fri, May 22, 2015 at 4:54 AM, Maxime Ripard
> > > <maxime.ripard@free-electrons.com> wrote:
> > > > Some clocks are using a factor component, however, unlike their mux=
, gate
> > > > or divider counterpart, these factors don't have a basic clock
> > > > implementation.
> > >=20
> > > I think "multiplier" would be a better name here, considering it is t=
he
> > > counterpart of "divider". "factor" implies you can multiply and/or di=
vide
> > > the clock rate.
> >=20
> > You're probably right, I didn't though of it that way :)
>=20
> I also prefer multiplier over factor.

Ok. Note that I re-submitted it some time this week and forgot to
change it, but I'm perfectly fine with the name.

> Jim Quinlan submitted a similar patch. See here:
>=20
> http://www.spinics.net/lists/linux-clk/msg00691.html

It looks very similar indeed.

> I nacked that patch because Stephen and I are trying to figure out how
> the basic clock types should work going forward. Code reuse is good, but
> they are not very maintainable.

What are the issues with maintaining them? The only drawback I'm
seeing with introducing such a driver is that you can't really have a
clock that is both a divider and a multiplier, but that can be solved
by splitting it into two sub-clocks.

=46rom a pure maintainance point of view, refusing it would mean that
each and every platform would have to come up with its own
implementation. For example, we do have clk-factors.c for sunxi that
does just that, and implies some cooperation from each clock driver
that have to provide some code to determine the various components of
the output formula. This can prove to be very challenging (and bug
prone) for clocks like the audio one we have where we have 1
multiplier and 2 dividers that needs some adjusting.

Splitting it into sub-clocks for each of these components would allow
to have less bugs, while keeping the whole thing very simple, and the
implementation on the driver side very trivial.

Overall, the clk-factors code we have (client side) is approximately a
thousand lines of code logic that could be replaced by (less) trivial
probing code for such a driver.

> Since there are two potential users of this code, I should reconsider.

Like I said, eventually, I'd like to leverage that code a lot more
than for the single clock alone, and I think it could benefit other
platforms too (like Jim has proven).

> Can you two come up with a common implementation that works for both of
> you?

Yes, sure. Jim, how do you want to go with this? Do you want to
resubmit your patch on top of 4.2-rc something so that I could give it
a try? Otherwise, I posted such a patch this week

https://lkml.kernel.org/r/1437235304-2208-1-git-send-email-maxime.ripard@fr=
ee-electrons.com

Can you give it a try and your feedback?

> Please do not put any CLK_OF_DECLARE stuff in there (there isn't
> any now, but I wanted to be clear).

That's never been my intention ;)

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ELVYuRnMxQ5nnKRy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVseApAAoJEBx+YmzsjxAgEyEP/j3y8f0ZdiboWHHiG+i+CA+1
mxCX1JM59NJLb0oSPMtKYCVfLvBlsQbtXQZVav1vRYWP+H+pcBCLrdzwd9zY3NOD
T9UARAt/aat2ZgpAAoMIMlnQ7Xe1AgIab3LfvLJ8zjX2XPKwo3Ho8p4kAMO7x9dT
t8NGtLJkuWrQcBcXgCoe14f8hKMwEHYhUpi+kd0qn2i1utlKhZHQAoqxKqRg1jx0
MX4J3NSs70uia7LeJgCJnWHwtNfTu5JY/GOFi6PvASsFfHkxQKkP6Z0oeSArQPSZ
FPInuOUKWB/IUV4LdqqDzOotplZDnrDvG3pAEbtej2CrlXcq5M066WiijBN2WfKO
pEp/i/i8d+7mttnMktW9RLRMYsa5qpakPXBqTfIY8yM6sSdmNLQinpCDJmMGQqFA
YNF/jIV7T9Wc6EN2Ki0mZQfPR4qchvmWXQ5OV+0+YPEM6g+qPCJv6xEjQlT71VLb
S7WDN4tPvynXwqtPhJ+Wg75/fanGPx9aFj6lVVQ9kzdeUdEFHZ3qHrLWKIHi/nvH
4zbzUlzE69OAxXtsEQcJFnXjy7uvNEiVFFA09SW5S6zJKjELd2FGmUZwzrMpjJ/A
H3sXHeYwr/b6nFdLXGbxq7p3zip7nbca4/bSrPVxXihIBYp7DbJG+R5xCI3tZlwR
c1ifBF03GysI3x3z3Fwx
=54si
-----END PGP SIGNATURE-----

--ELVYuRnMxQ5nnKRy--


--===============4861907032914680897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4861907032914680897==--
