Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Amit Nischal <anischal@codeaurora.org>, Manu Gautam <mgautam@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <23b9ca5a-b708-f142-9906-3f3eadd8c26a@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>,
 David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Doug Anderson <dianders@chromium.org>
References: <1522761761-15262-1-git-send-email-anischal@codeaurora.org>
 <1522761761-15262-4-git-send-email-anischal@codeaurora.org>
 <152393708031.51482.15076025836699678476@swboyd.mtv.corp.google.com>
 <f563532b5c43960a61ae12a37a131be8@codeaurora.org>
 <23b9ca5a-b708-f142-9906-3f3eadd8c26a@codeaurora.org>
Message-ID: <152409430571.51482.3690471838803727777@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC) driver for
 SDM845
Date: Wed, 18 Apr 2018 16:31:45 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Manu Gautam (2018-04-18 09:38:41)
> Hi Amit,
> =

> =

> On 4/18/2018 6:33 PM, Amit Nischal wrote:
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Disable the GPLL0 active inp=
ut to MMSS and GPU via MISC registers=C2=A0*/
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_update_bits(regmap,=
=C2=A00x09ffc,=C2=A00x3,=C2=A00x3);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_update_bits(regmap,=
=C2=A00x71028,=C2=A00x3,=C2=A00x3);
> >>
> >> I=C2=A0think=C2=A0we'll=C2=A0have=C2=A0to=C2=A0throw=C2=A0in=C2=A0the=
=C2=A0pipe=C2=A0clk=C2=A0branch=C2=A0stuff=C2=A0in=C2=A0here=C2=A0too?
> >> And=C2=A0then=C2=A0drop=C2=A0the=C2=A0pipe=C2=A0clks=C2=A0from=C2=A0th=
e=C2=A0driver?
> >
> > All=C2=A0the=C2=A0USB=C2=A0pipe=C2=A0clocks=C2=A0would=C2=A0be=C2=A0tak=
en=C2=A0care.=C2=A0The=C2=A0PCIE=C2=A0pipe=C2=A0branch
> > clocks=C2=A0would=C2=A0have=C2=A0to=C2=A0be=C2=A0explicitly=C2=A0disabl=
ed=C2=A0so=C2=A0as=C2=A0to=C2=A0retain=C2=A0the
> > memory=C2=A0logic.=C2=A0Otherwise,=C2=A0it=C2=A0would=C2=A0lead=C2=A0to=
=C2=A0memory=C2=A0corruption=C2=A0in=C2=A0case
> > the external source is directly disabled without disabling the branch c=
lock. =

> =

> PHY driver is same for both USB and PCIE and both PHYs use pipe_clk.
> If there is indeed some limitation and pipe_clk cant be left enabled
> always then I will suggest to not change pipe_clk handling for USB as wel=
l.
> =


Right. This is concerning if we have a half way solution.

Just to clarify my understanding, are you saying that the pcie pipe clks
are also tied to the memory logic and so toggling them on/off is used to
reset the memories inside the phy? Or the memories inside the
controller? What is the pipe clk clocking in these cases?
