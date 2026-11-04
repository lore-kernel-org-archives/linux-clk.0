Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793802641;
	b=LAN92WwquCWbqwCehU4nF+lu/p2adDe6smW9pllDva33rbqtnxgBomMDYu5xPlNi8qO8
	 f02cYzBZ/McH+bH1jh2KfN4FeJEWWZe7ISOyWHjnqHxbmibljLTCuWHTftij3eUgArWrz
	 9Sto8uvC7jkqMqOGJvYzrU0wVQJzzjzFX42CbcmudbGpP5H3MuhuVGBPI4FzLNlLB5jDX
	 yXIKyck3h2rU3chDr5yVzdjo8eXmo4HM+PdTMYsRus8CA64Xj+vuWahYabWuioi5jUj3s
	 WaYB2kNj1NpfHfeRzJ0qboVn89cYymO7xVOIVsgrUsz1I5FLDiNvMT8yslGAJ+kwjJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Rn0itiYWQq4UoXD7WO2n0E3/GBUM2A+vN4SJN/HSKdo=;
	b=3xAUDn6MWGpgwsCcU4vcPjRQOBzzgyHQvzfrCFsNTN8/tdnL3t1nF9XIRhzLrxx5sB4w
	 5r/CTqrYdQLMX8Le90il9NQHud59eK/kxVImjNV6SiDS/to0QWULV45cLlADgkwys9jES
	 uRO0uGQwFpOgTwT2dNV3NEbBy72zcy6WpRe31fuscj6T+kFWK9iNXDqDwICQ5TwMt89ZL
	 PCwYSUqZ5POZMjUo/60SwTTSQiFpmuJtxbOtvHadgQPRNYujMsCFD8MCJr986LPQRWre4
	 BkG9vM6jPReO8ER14im4P2qxENLcdSywx7l0v+x17PAKXkaQqyBJaqRlQIJ57oDcQzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=IM3V1nfM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16383606A328
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 14:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16383606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=IM3V1nfM
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67a2bd0c297so851944d50.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 06:30:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793802639; cv=none;
        d=google.com; s=arc-20260327;
        b=Gs+eP2TBQmVDSBjHrk2mi/WsMr/JNaO/m5ZvUxb6Bw0m63EHlnM5AhMAu34hqsFNrI
         E28LnILzVkWvImZQgM85QUJnBapwlrrPSxx7+kI+ycTNBm+Jvlj7xk6iayVV662LAWYs
         3Qg3q1dvEA5WhZzQqnO0mcjcP1pRcdIMGObPIKoAUahDRzFRdTbHnY93pkKahuo3e+K9
         vXFEmNal4+tJzGr7wlvkfplpMUuKqCGj93TCjWzv23e22Y6Qb6u+Fl69+ylZTE2TP1XD
         vKM/JWp4AXqJDq7zmKeHqUrwtsz/5M0ZiWpvJkK20lDDSWxaAciXYRVvVRFzifycqOwx
         QQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rn0itiYWQq4UoXD7WO2n0E3/GBUM2A+vN4SJN/HSKdo=;
        fh=3Djcbj4Fo2RtBWVMeceGHKtoh7FxjDlg/zkCbOhy/uA=;
        b=Z10nsk1bTKsBNXmYXY21+0LxGmhn862aHw68uKCViiV2yJ1e/pKwoGrizhTpJmTzMs
         GRp5lIO7vKiRk7RpsdxMqNUPBQz5RFWqKl93b4429z3z0VZ+SGnOB/G0lWQAd8VTPSJ8
         Pa0YPNIQsP+qrIDdI1cgvVioAuBb3bPx7wxi3FzTkHhSOzCfN5/e7gHlrFwaNZbeQW7/
         QLFcYC9Y90fHjkifKT5q7XrxeC2SL5cQZy+w4MDXE7ouewbS86TOqzNp5w4+O7uq0uu/
         Mu3C2ddG0xDaGaH+ADZR0d1+kPowyt4bt46ILZRSfLs8kZDOsMQe6nRuVk5XdCVZjMYb
         Ic9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793802639; x=1794407439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rn0itiYWQq4UoXD7WO2n0E3/GBUM2A+vN4SJN/HSKdo=;
        b=IM3V1nfMdyfBycwTSOze4fkQR/dg2hzQheXiDA/HdcVRW7u5PaXH4iiRmPSzQyq3N5
         9AgNhr6sPE+C9QuZ/rDUmdBQk2/+RHPs2597wMbl3+eKt1ZBk1L58dCoizsAHMiosLCd
         ThYZ1r8MnmKabThNKeZDx2x9lFITOSH9R1/BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802639; x=1794407439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rn0itiYWQq4UoXD7WO2n0E3/GBUM2A+vN4SJN/HSKdo=;
        b=JE9/lfLKPHggoMJiw2hfx2VqsTdZezm3OJmmLA2sCuBtdiSleK3x8zo86UTBRbbE++
         Uczkn3dLejQ7it+OhUxCjLSeCimk1Us7+ectzYUHl03zwT84ejxwVBAFH3BIZNjtKQQh
         HVl+hJFGUL4nqP7/KBA4pGG+7AZvQPQJRoqotZh7E4Wm1AbLK2ALEd4SifuKxWrt8UQi
         N2J2iJ1m/ZgNjcgPMSwULQ/KfPb9vjNNFQdvk5F2xuQTXpmqdyK61IJsIKihpNo+5NmO
         x/j35dWYEHleM3C0NzBs/ol78bM8vJzuwzrNwrMKR8Y/NPknkBXb6gLK9cTuUBCBrU+Z
         HA8g==
X-Forwarded-Encrypted: i=1; AKwUvBxi8xYA0anzMdM1T8iwhS9bEY5UOcNCcbP40SRWCPvpxHT9Hs915Wtir9E1Eo/EUGzqOVfUx7KTSkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZGFxAZOWIzqaPAj4/O1aCku5CTm2qmZAe2LcosaUkT0Gqg7/E
	9LRhSgDaVWHl58Npbqg8wGhUcnnZXeSGXlb3GXDTqnBUlmcbq8foe/vHGRtMrShbet0OAobpWOU
	w/fb3FqznVub+sCvg3xXMtcQlZu7k8qwEey8CC0+jZQ==
X-Gm-Gg: AYBFou1nKQjeuPiMVBgDkja2iQU+TK5e6FOZFCMoDrTktFjHndFudmt4YmY/LpoxeHV
	KCLLw8gsSeKaVx0zme9meNwACxRusb17FZLiWc/wQDE5NazWuM9NDBLR8iUIjuikqGYr4J4VXFO
	6miUs+tp/yM7fz5wgWxBC31EdRAFH4nGXMGbROMvxiIOS2MDpVR0BCSFAFT7OJDF96YTx2fLv+O
	T8HNYNS3KZwjXBBL2hN4HDnn54JCaF1Cnq1fdHOeCUt7EKm6+jC0VI2TXcyZ5OPpIJxTJCzJS1i
	iM/Q5kNiKhJKfT9JF4nCdy0ViGAgqeSZVIn20etUqGOtdeGtIzu9PutyJ+gjID6OcNusDMce8WQ
	MErhcio8DSkNNzEkHyCWw7YLdMQnJ6mtAFVO8Tv8+gtd5YbtZXkiXVloqlKwZqxBxDyYK
X-Received: by 2002:a05:690e:128d:b0:67b:f2b4:7ea3 with SMTP id
 956f58d0204a3-67bf2b48061mr1185261d50.18.1793802638944; Wed, 04 Nov 2026
 06:30:38 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com> <8c8908f1-ed6b-478a-ad00-c67448b25acb@foss.st.com>
In-Reply-To: <8c8908f1-ed6b-478a-ad00-c67448b25acb@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 4 Nov 2026 15:30:27 +0100
X-Gm-Features: AclHuK-2YVD6MLpocItLoy0Jf9YnF4dS8B-jCRxYLxfAIe0sapLG1UQibi0oIPQ
Message-ID: <CABGWkvoVrA7vaE6mKdp=2KNajREtgEi2RRV4qFcJmFqqWwQDoQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Select the STM32MP25 LTDC pixel clock source for
 the RGB output
To: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Vasut <marex@nabladev.com>, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Brian Masney <bmasney+clk@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gabriel,

Thanks for your review.

On Wed, Nov 4, 2026 at 11:42=E2=80=AFAM Gabriel FERNANDEZ
<gabriel.fernandez@foss.st.com> wrote:
>
> Hi Dario,
>
> Thanks for working on this and for testing it on the Engicam board.
>
> First, a small remark about patch 2/4: this driver is based on the one
> we deliver to our customers in the ST kernel on GitHub [1]. Please keep
> the original copyright and the Signed-off-by of the authors when you
> reuse such code, and add your own on top of them (e.g. with
> Co-developed-by).

You are right, I used your downstream driver as a reference and I should
have kept your copyright and authorship. Sorry about that.

>
> Now about your two questions:
>
> On 10/28/26 14:59, Dario Binacchi wrote:
>  > - the mux parents are referenced by their global names. Should they
>  >   rather be described by clocks/clock-names in the SYSCFG binding?
>  >   Moreover, no driver registers "txbyteclk" yet.
>
> Yes, I would also prefer to describe them in DT. I'm working on a
> version where the mux is described by a clock-controller sub-node of
> the SYSCFG node. This sub-node is populated by the STM32MP2 SYSCFG
> driver, so no auxiliary device is needed (patch 3/4 can be dropped):
>
>      syscfg: syscon@44230000 {
>          compatible =3D "st,stm32mp25-syscfg", "syscon";
>          ...
>          syscfg_clk: clock-controller {
>              compatible =3D "st,stm32mp25-syscfg-clk";
>              #clock-cells =3D <1>;
>              clocks =3D <&rcc CK_KER_LTDC>, <&lvds>, <&clk_dsi_txbyte>;
>              clock-names =3D "ltdc", "lvds", "dsi";
>          };
>      };
>
>      &ltdc {
>          clocks =3D ..., <&syscfg_clk CK_SYSCFG_PIX_LTDC>, ...;
>      };
>
> The driver takes the parents from the "clocks" property
> (clk_parent_data), so the inputs which don't exist on a given SoC (no
> LVDS/DSI on STM32MP231/251) are simply omitted. For "txbyteclk", we keep
> the existing clk_dsi_txbyte placeholder until the DSI driver provides
> this clock.
>
> I also want to keep "#clock-cells =3D <1>" with a onecell provider: the
> SYSCFG has other clock selections, and I would like to be able to add
> them later in the same driver without changing the binding again.
>
>  > - the pixel clock source is selected in the board devicetree by
>  >   assigned-clock-parents. Should the LTDC driver rather select it
>  >   according to its output (RGB, LVDS or DSI)?
>
> I think the LTDC driver should select it: the source depends on the
> output used, not on the board. This is what we do in our downstream
> LTDC driver: it gets the mux as "ref" clock and calls clk_set_parent()
> according to the encoder type (LVDS PHY clock for LVDS, LTDC kernel
> clock otherwise) before setting the pixel clock rate. The board
> overlays then don't need assigned-clock-parents. Yannick and Raphael
> (in Cc) can comment on the LTDC side.
>
> Since I have already reworked the clock driver this way (binding,
> driver and SoC DT), would you be OK if I take over the
> clk-stm32mp25-syscfg patch? I would send it in a series, keeping you as
> Co-developed-by, and you could then rebase your Engicam patches on top
> of it.

Yes, please go ahead. Please Cc me on your series, I will test it on
the Engicam
MicroGEA-STM32MP257D-RMM with both the RGB and the LVDS displays.

About patch 1/4: in your SoC DT rework, will the LTDC "lcd" clock become
CK_KER_LTDC on STM32MP255/257, as in your downstream kernel?
In that case I will drop it, otherwise I will resend it on its own.

Thanks and regards,
Dario

>
> [1]
> https://github.com/STMicroelectronics/linux/blob/v6.6-stm32mp/drivers/clk=
/stm32/clk-stm32mp25-syscfg.c
>
> Best regards,
> Gabriel
>
>
> On 10/28/26 14:59, Dario Binacchi wrote:
> > On STM32MP25 the LTDC pixel clock is selected in the SYSCFG
> > DISPLAYCLKCR register among the DSI byte lane clock, the LVDS PHY pixel
> > clock (reset value) and the LTDC kernel clock. The SYSCFG node is
> > already described as provider of this clock, which the LTDC references
> > as "ref" clock, but no driver registers it, so the RGB (DPI) output
> > can't work.
> >
> > This series adds a driver for this mux, probed as an auxiliary device
> > of the STM32MP2 SYSCFG driver, and selects the pixel clock source on th=
e
> > Engicam MicroGEA-STM32MP257D-RMM display overlays. Patch 1 is an
> > independent fix for the RGB display overlay.
> >
> > Tested on the Engicam MicroGEA-STM32MP257D-RMM board with both the RGB
> > (Rocktech RK050HR345-CT106A) and the LVDS (Ampire AM-1280800W8TZQW-T00H=
)
> > displays.
> >
> > I am sending it as RFC since I am not sure about:
> >
> > - the mux parents are referenced by their global names. Should they
> >    rather be described by clocks/clock-names in the SYSCFG binding?
> >    Moreover, no driver registers "txbyteclk" yet.
> >
> > - the pixel clock source is selected in the board devicetree by
> >    assigned-clock-parents. Should the LTDC driver rather select it
> >    according to its output (RGB, LVDS or DSI)?
> >
> >
> > Dario Binacchi (4):
> >    arm64: dts: st: fix the Engicam RMM RGB display pixel clock
> >    clk: stm32: add STM32MP25 SYSCFG clock driver
> >    soc: st: stm32mp2-syscfg: register the STM32MP25 clock device
> >    arm64: dts: st: select the Engicam RMM display pixel clock source
> >
> >   ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso |   3 +
> >   ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso |   5 +
> >   drivers/clk/stm32/Kconfig                     |  12 ++
> >   drivers/clk/stm32/Makefile                    |   1 +
> >   drivers/clk/stm32/clk-stm32mp25-syscfg.c      | 111 +++++++++++++++++=
+
> >   drivers/soc/st/Kconfig                        |   1 +
> >   drivers/soc/st/stm32mp2-syscfg.c              |  28 ++++-
> >   7 files changed, 159 insertions(+), 2 deletions(-)
> >   create mode 100644 drivers/clk/stm32/clk-stm32mp25-syscfg.c
> >
> > ---
> > base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> > branch: stm32mp25-ltdc-pixclk
> >



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
