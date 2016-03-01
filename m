Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Martin Sperl <kernel@martin.sperl.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: bcm2835: expose raw clock-registers via debugfs
In-Reply-To: <56D59998.8060301@martin.sperl.org>
References: <1456755616-2472-1-git-send-email-kernel@martin.sperl.org> <1456755616-2472-2-git-send-email-kernel@martin.sperl.org> <87k2ln5k09.fsf@eliezer.anholt.net> <56D59998.8060301@martin.sperl.org>
Date: Tue, 01 Mar 2016 10:41:40 -0800
Message-ID: <874mcqrqfv.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Martin Sperl <kernel@martin.sperl.org> writes:

> On 29.02.2016 21:39, Eric Anholt wrote:
>> kernel@martin.sperl.org writes:
>>
>>> From: Martin Sperl <kernel@martin.sperl.org>
>>>
>>> For debugging purposes under some circumstance
>>> it helps to be able to see the actual clock registers.
>>>
>>> E.g: when looking at the clock divider it is helpful to
>>> see what the actual clock divider is.
>>>
>>> This patch exposes all the clock registers specific to each
>>> clock/pll/pll-divider via debugfs.
>>>
>>> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
>>
>> This one definitely seems useful to me.  I think the debugfs bits need
>> to be under #ifdef CONFIG_DEBUG_FS though.
>>
>> With that fixed,
>>
>> Acked-by: Eric Anholt <eric@anholt.net>
>>
> Note that include/linux/debugfs.h contains such ifdef and generates
> dummy code like this:
> static inline struct dentry *debugfs_create_regset32(const char *name,
>                                     umode_t mode, struct dentry *parent,
>                                     struct debugfs_regset32 *regset)
> {
>          return ERR_PTR(-ENODEV);
> }
> (see also Documentation/filesystem/debugfs.txt )

OK, looks like the CONFIG_DEBUG_FS ifdefs I've seen in other drivers are
just noise.  The patch should be good as-is, then.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW1eJlAAoJELXWKTbR/J7oHZYQAJht2cnFHAQEt8XTiCm6eQdm
QZXYIjKRiAYY0zzESzrLdIR+KGxgavM67HeXESUwp5U5+bmFG9gvf7F2Iuez7bty
KOd4cCbrzexTrSSUpLgHwB/DM0wZdkR9arZ6b/RpTg7RleRlTnokNF72xHwbxu+1
w4tPXGJwACOlyGb1eYXEW4kX9mkc+xxuCTM+NJ7e/JMJFdhNr6CURSMIfaEOCDVQ
is13T+CtF5Qw20l0dhBU3vN+2+NLmYTAsWx2Tsnp3okJsw2KQyActVwOwsrcFfNl
x2fl4SEDjCv9Px+viwIoL8ZCCRRse4HefgemDwkhwjBhc5CJEW8DTZJ5XXzW046E
Uq7YRzXvaHsr1SSS3ZfhsokibxiiUFmu9hUjuRRAMPv8uqakjFScaNCmHSRmPnSF
FJsL7xTxZsWFWOMIPwRvvp/qZEuVaRr7mOEF+51tGdRnyfkaSThN6dds8E4p4nak
szHtmEtj4nMqBjIxbJuPkz1jUHvfT3VBaZ6jXrp9ZZb+gzTr/VPUz5C1zToWDCc7
SvWzMaqH3a3doGt96g3mzwlYmqVQ+bEDOwqRKm/JJXl0rpP5BEqfiQupRMqocmvR
jh0pS9ypeFv72TbkSr81JkLz4bw5HXnnXIkH9HRrDbGb+IVQKIw87wINywgVjFnI
J7o4RK2hHgDWjkec2eLU
=H8Mw
-----END PGP SIGNATURE-----
--=-=-=--
