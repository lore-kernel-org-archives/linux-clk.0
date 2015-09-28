Return-Path: <djkurtz@google.com>
MIME-Version: 1.0
In-Reply-To: <1442915603.24403.2.camel@mtksdaap41>
References: <1442915603.24403.2.camel@mtksdaap41>
From: Daniel Kurtz <djkurtz@google.com>
Date: Mon, 28 Sep 2015 23:11:47 +0800
Message-ID: <CAGS+omCzgqcF4p6puhq0x8MN9nzuGF6MPPwoqyt+-by2JzfVFA@mail.gmail.com>
Subject: Re: [GIT PULL] clk: mediatek: New clocks support and fixes
To: James Liao <jamesjj.liao@mediatek.com>, Mike Turquette <mturquette@baylibre.com>
Cc: linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Yingjoe Chen <yingjoe.chen@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@linaro.org>
Content-Type: multipart/alternative; boundary=001a11393efae49a530520d01ea3
List-ID: <linux-clk.vger.kernel.org>

--001a11393efae49a530520d01ea3
Content-Type: text/plain; charset=UTF-8

Hi Mike,

On Sep 22, 2015 17:53, "James Liao" <jamesjj.liao@mediatek.com> wrote:
>
> This is a collection of new Mediatek clocks support and fixes. These
> patches come from Joe [1], Pi-cheng [2] and me [3], including clock
> support for subsystems, CPU, GPT and some minor fixes.
>
> [1] https://patchwork.kernel.org/patch/6777041/
> [2] https://patchwork.kernel.org/patch/7174721/
> [3] https://lkml.org/lkml/2015/8/10/194
>
> ----------------------------------------------------------------
>
> The following changes since commit
1f93e4a96c9109378204c147b3eec0d0e8100fde:
>
>   Linux 4.3-rc2 (2015-09-20 14:32:34 -0700)
>
> are available in the git repository at:
>
>   https://github.com/jamesjjliao/linux.git v4.3-rc2-clk
>
> for you to fetch changes up to 74219612bb7e25e64409171acada05d9949228f2:
>
>   arm64: dts: mt8173: Add subsystem clock controller device nodes
(2015-07-09 12:58:14 +0800)

Will you be able to pull this for 4.3?

-Dan

> ----------------------------------------------------------------
>
> James Liao (9):
>   clk: mediatek: Removed unused dpi_ck clock from MT8173
>   clk: mediatek: Remove unused code from MT8173.
>   clk: mediatek: Add __initdata and __init for data and functions
>   clk: mediatek: Add fixed clocks support for Mediatek SoC.
>   clk: mediatek: Fix rate and dependency of MT8173 clocks
>   dt-bindings: ARM: Mediatek: Document devicetree bindings for clock
>     controllers
>   clk: mediatek: Add subsystem clocks of MT8173
>   clk: mediatek: Add USB clock support in MT8173 APMIXEDSYS
>   arm64: dts: mt8173: Add subsystem clock controller device nodes
>
> Joe.C (1):
>   clk: mediatek: add 13mhz clock for MT8173
>
> pi-cheng.chen (1):
>   clk: mediatek: Export CPU mux clocks for CPU frequency control
>
>  .../bindings/arm/mediatek/mediatek,imgsys.txt      |   22 ++
>  .../bindings/arm/mediatek/mediatek,mmsys.txt       |   22 ++
>  .../bindings/arm/mediatek/mediatek,vdecsys.txt     |   22 ++
>  .../bindings/arm/mediatek/mediatek,vencltsys.txt   |   22 ++
>  .../bindings/arm/mediatek/mediatek,vencsys.txt     |   22 ++
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   37 ++
>  drivers/clk/mediatek/Makefile                      |    2 +-
>  drivers/clk/mediatek/clk-apmixed.c                 |  107 ++++++
>  drivers/clk/mediatek/clk-cpumux.c                  |  127 +++++++
>  drivers/clk/mediatek/clk-cpumux.h                  |   22 ++
>  drivers/clk/mediatek/clk-gate.c                    |    2 +-
>  drivers/clk/mediatek/clk-mt8173.c                  |  370
+++++++++++++++++++-
>  drivers/clk/mediatek/clk-mtk.c                     |   36 +-
>  drivers/clk/mediatek/clk-mtk.h                     |   24 +-
>  drivers/clk/mediatek/clk-pll.c                     |    7 +-
>  include/dt-bindings/clock/mt8173-clk.h             |  106 +++++-
>  16 files changed, 916 insertions(+), 34 deletions(-)
>  create mode 100644
Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
>  create mode 100644
Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
>  create mode 100644
Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
>  create mode 100644
Documentation/devicetree/bindings/arm/mediatek/mediatek,vencltsys.txt
>  create mode 100644
Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
>  create mode 100644 drivers/clk/mediatek/clk-apmixed.c
>  create mode 100644 drivers/clk/mediatek/clk-cpumux.c
>  create mode 100644 drivers/clk/mediatek/clk-cpumux.h
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--001a11393efae49a530520d01ea3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p dir=3D"ltr">Hi Mike,</p>
<p dir=3D"ltr">On Sep 22, 2015 17:53, &quot;James Liao&quot; &lt;<a href=3D=
"mailto:jamesjj.liao@mediatek.com" target=3D"_blank">jamesjj.liao@mediatek.=
com</a>&gt; wrote:<br>
&gt;<br>
&gt; This is a collection of new Mediatek clocks support and fixes. These<b=
r>
&gt; patches come from Joe [1], Pi-cheng [2] and me [3], including clock<br=
>
&gt; support for subsystems, CPU, GPT and some minor fixes.<br>
&gt;<br>
&gt; [1] <a href=3D"https://patchwork.kernel.org/patch/6777041/" target=3D"=
_blank">https://patchwork.kernel.org/patch/6777041/</a><br>
&gt; [2] <a href=3D"https://patchwork.kernel.org/patch/7174721/" target=3D"=
_blank">https://patchwork.kernel.org/patch/7174721/</a><br>
&gt; [3] <a href=3D"https://lkml.org/lkml/2015/8/10/194" target=3D"_blank">=
https://lkml.org/lkml/2015/8/10/194</a><br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt;<br>
&gt; The following changes since commit 1f93e4a96c9109378204c147b3eec0d0e81=
00fde:<br>
&gt;<br>
&gt; =C2=A0 Linux 4.3-rc2 (2015-09-20 14:32:34 -0700)<br>
&gt;<br>
&gt; are available in the git repository at:<br>
&gt;<br>
&gt; =C2=A0 <a href=3D"https://github.com/jamesjjliao/linux.git" target=3D"=
_blank">https://github.com/jamesjjliao/linux.git</a> v4.3-rc2-clk<br>
&gt;<br>
&gt; for you to fetch changes up to 74219612bb7e25e64409171acada05d9949228f=
2:<br>
&gt;<br>
&gt; =C2=A0 arm64: dts: mt8173: Add subsystem clock controller device nodes=
 (2015-07-09 12:58:14 +0800)<br></p>
<p dir=3D"ltr">Will you be able to pull this for 4.3?</p>
<p dir=3D"ltr">-Dan<br></p>
<p dir=3D"ltr">&gt; -------------------------------------------------------=
---------<br>
&gt;<br>
&gt; James Liao (9):<br>
&gt; =C2=A0 clk: mediatek: Removed unused dpi_ck clock from MT8173<br>
&gt; =C2=A0 clk: mediatek: Remove unused code from MT8173.<br>
&gt; =C2=A0 clk: mediatek: Add __initdata and __init for data and functions=
<br>
&gt; =C2=A0 clk: mediatek: Add fixed clocks support for Mediatek SoC.<br>
&gt; =C2=A0 clk: mediatek: Fix rate and dependency of MT8173 clocks<br>
&gt; =C2=A0 dt-bindings: ARM: Mediatek: Document devicetree bindings for cl=
ock<br>
&gt; =C2=A0 =C2=A0 controllers<br>
&gt; =C2=A0 clk: mediatek: Add subsystem clocks of MT8173<br>
&gt; =C2=A0 clk: mediatek: Add USB clock support in MT8173 APMIXEDSYS<br>
&gt; =C2=A0 arm64: dts: mt8173: Add subsystem clock controller device nodes=
<br>
&gt;<br>
&gt; Joe.C (1):<br>
&gt; =C2=A0 clk: mediatek: add 13mhz clock for MT8173<br>
&gt;<br>
&gt; pi-cheng.chen (1):<br>
&gt; =C2=A0 clk: mediatek: Export CPU mux clocks for CPU frequency control<=
br>
&gt;<br>
&gt; =C2=A0.../bindings/arm/mediatek/mediatek,imgsys.txt=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A022 ++<br>
&gt; =C2=A0.../bindings/arm/mediatek/mediatek,mmsys.txt=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A022 ++<br>
&gt; =C2=A0.../bindings/arm/mediatek/mediatek,vdecsys.txt=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A022 ++<br>
&gt; =C2=A0.../bindings/arm/mediatek/mediatek,vencltsys.txt=C2=A0 =C2=A0|=
=C2=A0 =C2=A022 ++<br>
&gt; =C2=A0.../bindings/arm/mediatek/mediatek,vencsys.txt=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A022 ++<br>
&gt; =C2=A0arch/arm64/boot/dts/mediatek/mt8173.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A037 ++<br>
&gt; =C2=A0drivers/clk/mediatek/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt; =C2=A0drivers/clk/mediatek/clk-apmixed.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 107 ++++++<br>
&gt; =C2=A0drivers/clk/mediatek/clk-cpumux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 127 +++++++<br>
&gt; =C2=A0drivers/clk/mediatek/clk-cpumux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A022 ++<br>
&gt; =C2=A0drivers/clk/mediatek/clk-gate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt; =C2=A0drivers/clk/mediatek/clk-mt8173.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 370 +++++++++++++++++++-<br>
&gt; =C2=A0drivers/clk/mediatek/clk-mtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A036 +-<br>
&gt; =C2=A0drivers/clk/mediatek/clk-mtk.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A024 +-<br>
&gt; =C2=A0drivers/clk/mediatek/clk-pll.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 7 +-<br>
&gt; =C2=A0include/dt-bindings/clock/mt8173-clk.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 106 +++++-<br>
&gt; =C2=A016 files changed, 916 insertions(+), 34 deletions(-)<br>
&gt; =C2=A0create mode 100644 Documentation/devicetree/bindings/arm/mediate=
k/mediatek,imgsys.txt<br>
&gt; =C2=A0create mode 100644 Documentation/devicetree/bindings/arm/mediate=
k/mediatek,mmsys.txt<br>
&gt; =C2=A0create mode 100644 Documentation/devicetree/bindings/arm/mediate=
k/mediatek,vdecsys.txt<br>
&gt; =C2=A0create mode 100644 Documentation/devicetree/bindings/arm/mediate=
k/mediatek,vencltsys.txt<br>
&gt; =C2=A0create mode 100644 Documentation/devicetree/bindings/arm/mediate=
k/mediatek,vencsys.txt<br>
&gt; =C2=A0create mode 100644 drivers/clk/mediatek/clk-apmixed.c<br>
&gt; =C2=A0create mode 100644 drivers/clk/mediatek/clk-cpumux.c<br>
&gt; =C2=A0create mode 100644 drivers/clk/mediatek/clk-cpumux.h<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; To unsubscribe from this list: send the line &quot;unsubscribe linux-k=
ernel&quot; in<br>
&gt; the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org" =
target=3D"_blank">majordomo@vger.kernel.org</a><br>
&gt; More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordo=
mo-info.html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html<=
/a><br>
&gt; Please read the FAQ at=C2=A0 <a href=3D"http://www.tux.org/lkml/" targ=
et=3D"_blank">http://www.tux.org/lkml/</a><br>
</p>
</div>

--001a11393efae49a530520d01ea3--
