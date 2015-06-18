Return-Path: <lho@apm.com>
MIME-Version: 1.0
In-Reply-To: <1434576529-4183-1-git-send-email-matthias.bgg@gmail.com>
References: <1434576529-4183-1-git-send-email-matthias.bgg@gmail.com>
Date: Wed, 17 Jun 2015 23:28:56 -0700
Message-ID: <CAPw-ZTm=GZgUzWQcUAmfQwrDG8kouxj9uxT9L1+G+QCYQ8WjUw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: xgene: Delete duplicated name field
From: Loc Ho <lho@apm.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: sboyd@codeaurora.org, Mike Turquette <mturquette@linaro.org>,
	Kumar Sankaran <ksankaran@apm.com>, Feng Kan <fkan@apm.com>, linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary=001a113468e610e2df0518c4ec41
List-ID: <linux-clk.vger.kernel.org>

--001a113468e610e2df0518c4ec41
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 17, 2015 at 2:28 PM, Matthias Brugger <matthias.bgg@gmail.com>
wrote:

> X-Gene clocks implement it's name in the clock private struct.
> This is a duplication of the name field. We can delete the field
> and rely on the common implementation to retrieve the name.
>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>

=E2=80=8BI had applied and tested against linux-next. Look good to me.

-Loc=E2=80=8B

--001a113468e610e2df0518c4ec41
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi,</div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,helvetica,sans-serif"><span style=3D"font-family:ari=
al,sans-serif">On Wed, Jun 17, 2015 at 2:28 PM, Matthias Brugger </span><sp=
an dir=3D"ltr" style=3D"font-family:arial,sans-serif">&lt;<a href=3D"mailto=
:matthias.bgg@gmail.com" target=3D"_blank">matthias.bgg@gmail.com</a>&gt;</=
span><span style=3D"font-family:arial,sans-serif"> wrote:</span><br></div><=
div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">X-Gene clocks implement it&#39;s name in the clock private struct.=
<br>
This is a duplication of the name field. We can delete the field<br>
and rely on the common implementation to retrieve the name.<br>
<br>
Signed-off-by: Matthias Brugger &lt;<a href=3D"mailto:matthias.bgg@gmail.co=
m">matthias.bgg@gmail.com</a>&gt;<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">=
=E2=80=8BI had applied and tested against linux-next. Look good to me.=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,=
sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:ari=
al,helvetica,sans-serif">-Loc=E2=80=8B</div><br></div></div></div></div>

--001a113468e610e2df0518c4ec41--
