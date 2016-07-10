Return-Path: <hao5781286@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160404212450.GP4227@lukather>
References: <1458204222-31149-1-git-send-email-yassinjaffer@gmail.com>
 <1458204222-31149-2-git-send-email-yassinjaffer@gmail.com>
 <20160319235905.GA16539@rob-hp-laptop> <20160402011436.GA18567@codeaurora.org>
 <20160404212450.GP4227@lukather>
From: Hao Zhang <hao5781286@gmail.com>
Date: Mon, 11 Jul 2016 01:07:26 +0800
Message-ID: <CAJeuY78Mt-286pWvCVqPFnPixp3cQ+C=SHekCkMfAd7Lf_t1+w@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi: Add CSI (camera's Sensors Interface) module
 clock driver for sun[457]i
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>, yassinjaffer@gmail.com,
	dev@linux-sunxi.org, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>, Hans de Goede <hdegoede@redhat.com>,
	Reinder de Haan <patchesrdh@mveas.com>, Jens Kuske <jenskuske@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: multipart/alternative; boundary=001a114e31f6f1620105374b1112
List-ID: <linux-clk.vger.kernel.org>

--001a114e31f6f1620105374b1112
Content-Type: text/plain; charset=UTF-8

Hi all
I am developing a media codec driver(using bt656) for cubieboard
one(allwinner a10 processor), i want to use DT to banding csi. after i get
some reference on
Documentation/devicetree/bindings/media/video-interfaces.txt, i have some
question about whether the csi driver for cubieboard one support to parse
the DT node just like in the reference document? if not, whether someone
is developing it or should i necessary to complete it together (What's the
progress of it) ?

Best regards :)
Hao Zhang

--001a114e31f6f1620105374b1112
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all<br>I am developing a media codec driver(using bt656=
) for cubieboard one(allwinner a10 processor), i want to use DT to banding =
csi. after i get some reference on Documentation/devicetree/bindings/media/=
video-interfaces.txt, i have some question about whether the csi driver=C2=
=A0for cubieboard one=C2=A0support to parse the DT node just like in the re=
ference document? if not, whether someone is=C2=A0developing it or should i=
 necessary to complete it together (<span style=3D"color:rgb(51,51,51);font=
-family:arial;font-size:13px;line-height:20.02px">What&#39;s the progress o=
f=C2=A0it</span>) ?=C2=A0<br><br>Best regards :)<br>Hao Zhang</div>

--001a114e31f6f1620105374b1112--
