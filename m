Return-Path: <prvs=0690d33e02=mike.looijmans@topicproducts.com>
Subject: Re: [PATCH] clk-si544: Properly round requested frequency to nearest
 match
To: Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <mturquette@baylibre.com>
References: <1527775435-5017-1-git-send-email-mike.looijmans@topic.nl>
 <152778087117.144038.3582001993053198941@swboyd.mtv.corp.google.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <9eaa65c3-f8e0-1302-5f49-8691c244476d@topic.nl>
Date: Fri, 1 Jun 2018 07:05:44 +0200
MIME-Version: 1.0
In-Reply-To: <152778087117.144038.3582001993053198941@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

=EF=BB=BFOn 31-05-18 17:34, Stephen Boyd wrote:
> Quoting Mike Looijmans (2018-05-31 07:03:55)
>> The si544 driver had a rounding problem that using the result of clk_rou=
nd_rate
>> may set the clock to yet another rate, for example:
>> clk_round_rate(195000000) =3D 194999999
>> clk_round_rate(194999999) =3D 194999998
>>
>> Clients would expect that after clk_set_rate(clk, freq2=3Dclk_round_rate=
(clk, freq)) the
>> chip will be running at exactly freq2.
>>
>> The problem was in the calculation of the feedback divider, it was alway=
s rounded
>> down instead of to the nearest possible VCO value.
>>
>> After this change, the following holds true for any supported frequency:
>> actual_freq =3D clk_round_rate(clk, freq);
>> clk_set_rate(clk, actual_freq);
>> clk_round_rate(clk, actual_freq) =3D=3D actual_freq && clk_get_rate(clk)=
 =3D=3D actual_freq
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>=20
> Any fixes tag? I can slap
>=20
> Fixes: 953cc3e81170 ("clk: Add driver for the si544 clock generator chip"=
)
>=20
> on to the patch here.
>=20

I think that would be good, yes. Slap it on.


Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail
