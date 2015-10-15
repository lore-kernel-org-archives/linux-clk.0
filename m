Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Mason <slash.tmp@free.fr>, "clk" <linux-clk@vger.kernel.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <561CF3CD.8060508@free.fr>
Cc: "Stephen Boyd" <sboyd@codeaurora.org>
References: <561CC7DA.1070101@free.fr> <561CF3CD.8060508@free.fr>
Message-ID: <20151015120956.7777.63740@quantum>
Subject: Re: Two-output clk provider with standard clk consumer
Date: Thu, 15 Oct 2015 05:09:56 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Mason (2015-10-13 05:06:37)
> On 13/10/2015 10:59, Mason asked: [noob clk questions]
> =

> Hmmm, I'm thinking there might be a better place to ask beginner question.
> Some subsystems have a dedicated IRC channel. Does clk have one? :-)
> Or perhaps kernelnewbies? (I'll check the archive.)

Hi Mason,

Please join us in #linux-clk on freenode. And sorry for not responding
sooner. I've been traveling on business for more than one month and
Stephen has been bearing 100% of the load while I'm away.

Regarding the reliance on string names when clock-output-names is not
used, that is an on-going discussion[0] affecting multiple drivers right
now. We're trying to find a long-term solution that moves away from
string names and uses the DT hierarchy to establish parent-child
relationships.

[0] http://lkml.kernel.org/r/<20151015104326.6f7e907c@free-electrons.com>

Regards,
Mike

> =

> Regards.
>=20
