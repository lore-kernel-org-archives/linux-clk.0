Return-Path: <martin@sperl.org>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH v3 1/4] clk: bcm2835: add a round up ability to the clock divisor
From: Martin Sperl <martin@sperl.org>
In-Reply-To: <1449418969-5565-2-git-send-email-repk@triplefau.lt>
Date: Sun, 10 Jan 2016 17:27:38 +0100
Cc: Stephen Warren <swarren@wwwdotorg.org>,
 Eric Anholt <eric@anholt.net>,
 Lee Jones <lee@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Message-Id: <268944A6-84F0-41F5-B84F-C9C1E9012575@sperl.org>
References: <1449418969-5565-1-git-send-email-repk@triplefau.lt> <1449418969-5565-2-git-send-email-repk@triplefau.lt>
To: Remi Pommarel <repk@triplefau.lt>
List-ID: <linux-clk.vger.kernel.org>


> On 06.12.2015, at 17:22, Remi Pommarel <repk@triplefau.lt> wrote:
>=20
> Make bcm2835_clock_choose_div to optionally round up the chosen MASH =
divisor
> so that the resulting average rate will not be higher than the =
requested one.
>=20
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>

Note that investigations have shown that the fractional Divider is not =
used
unless we have HW-MASH enabled.

I got some basic support in a patch that I shall share as soon as I have =
done
some more testing=E2=80=A6

Ciao,
	Martin
