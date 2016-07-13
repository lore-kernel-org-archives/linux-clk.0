Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 7/7] arm: amlogic: select meson8b clk driver
From: =?utf-8?Q?Alexander_M=C3=BCller?= <serveralex@gmail.com>
In-Reply-To: <m2inwiqwaa.fsf@baylibre.com>
Date: Wed, 13 Jul 2016 19:53:12 +0200
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Message-Id: <41983A35-37D0-40D0-BFD2-1EF7DC655B93@gmail.com>
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com> <1467741391-60534-8-git-send-email-serveralex@gmail.com> <146776648028.35356.7816151912503029258@resonance> <m2inwiqwaa.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Hi Kevin,=20

I did the proposed changes and rebased to integ.=20

Please review and let me know if I missed something.

Alex

> On 06 Jul 2016, at 23:41, Kevin Hilman <khilman@baylibre.com> wrote:
>=20
> Michael Turquette <mturquette@baylibre.com> writes:
>=20
>> Hi Alex,
>>=20
>> Quoting Alexander M=C3=BCller (2016-07-05 10:56:31)
>>> Select the Amlogic clk code for meson SoCs and the more specific =
meson8b clk
>>> driver for Amlogic meson8b.
>>>=20
>>> Signed-off-by: Alexander M=C3=BCller <serveralex@gmail.com>
>>=20
>> This patch isn't necessary as an alternative is already queued. See:
>> =
https://git.kernel.org/cgit/linux/kernel/git/mturquette/linux.git/commit/?=
h=3Dgxbb-dt-clk&id=3Dbae5d70ba6f8726ea6306aa07b7d2eb4357d3c81
>>=20
>> However, if you're basing on top of clk-next (or clk-s905) then you
>> won't see the three patches linked above because they are queued =
through
>> Kevin & Carlo via the amlogic tree.
>=20
> ...which you can find here[1] and specifically, the "integ" branch =
where
> I'm keeping the latest queued versions of various things merged =
together
> for easier testing.
>=20
> Kevin
>=20
> [1] =
https://git.kernel.org/cgit/linux/kernel/git/khilman/linux-amlogic.git/
