Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Alexander =?utf-8?Q?M=C3=BCller?= <serveralex@gmail.com>,
  linux-clk@vger.kernel.org,  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 7/7] arm: amlogic: select meson8b clk driver
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
	<1467741391-60534-8-git-send-email-serveralex@gmail.com>
	<146776648028.35356.7816151912503029258@resonance>
Date: Wed, 06 Jul 2016 14:41:33 -0700
In-Reply-To: <146776648028.35356.7816151912503029258@resonance> (Michael
	Turquette's message of "Tue, 05 Jul 2016 17:54:40 -0700")
Message-ID: <m2inwiqwaa.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Michael Turquette <mturquette@baylibre.com> writes:

> Hi Alex,
>
> Quoting Alexander M=C3=BCller (2016-07-05 10:56:31)
>> Select the Amlogic clk code for meson SoCs and the more specific meson8b=
 clk
>> driver for Amlogic meson8b.
>>=20
>> Signed-off-by: Alexander M=C3=BCller <serveralex@gmail.com>
>
> This patch isn't necessary as an alternative is already queued. See:
> https://git.kernel.org/cgit/linux/kernel/git/mturquette/linux.git/commit/=
?h=3Dgxbb-dt-clk&id=3Dbae5d70ba6f8726ea6306aa07b7d2eb4357d3c81
>
> However, if you're basing on top of clk-next (or clk-s905) then you
> won't see the three patches linked above because they are queued through
> Kevin & Carlo via the amlogic tree.

...which you can find here[1] and specifically, the "integ" branch where
I'm keeping the latest queued versions of various things merged together
for easier testing.

Kevin

[1] https://git.kernel.org/cgit/linux/kernel/git/khilman/linux-amlogic.git/
