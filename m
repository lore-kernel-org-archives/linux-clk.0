Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751976AbdK1RtJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 28 Nov 2017 12:49:09 -0500
MIME-Version: 1.0
In-Reply-To: <583a46dd967456aac07fb29529f74d91a10bdfeb.1511797218.git-series.maxime.ripard@free-electrons.com>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
 <583a46dd967456aac07fb29529f74d91a10bdfeb.1511797218.git-series.maxime.ripard@free-electrons.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 28 Nov 2017 11:48:47 -0600
Message-ID: <CAL_Jsq+PHzDGE_RreBmVZV+sg3dh5OG2vWZU+eobxF514Fpo_w@mail.gmail.com>
Subject: Re: [PATCH v2 01/18] dt-bindings: panel: lvds: Document power-supply property
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Priit Laes <plaes@plaes.org>, Icenowy Zheng <icenowy@aosc.io>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Please CC DT list.

On Mon, Nov 27, 2017 at 9:41 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The power-supply property is used by a vast majority of panels, including
> panel-simple. Let's document it as a common property
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-common.txt | 6 ++++++
>  Documentation/devicetree/bindings/display/panel/panel-lvds.txt   | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.txt b/Documentation/devicetree/bindings/display/panel/panel-common.txt
> index ec52c472c845..125ea68052af 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.txt
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.txt
> @@ -78,6 +78,12 @@ used for panels that implement compatible control signals.
>    while active. Active high reset signals can be supported by inverting the
>    GPIO specifier polarity flag.
>
> +Power
> +-----
> +
> +- power-supply: many display panels need an additional power supply in
> +  order to be fully powered-up. For such panels, power-supply contains
> +  a phandle to the regulator powering the panel.
>
>  Backlight
>  ---------
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.txt b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> index b938269f841e..250850a2150b 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> @@ -32,6 +32,7 @@ Optional properties:
>  - label: See panel-common.txt.
>  - gpios: See panel-common.txt.
>  - backlight: See panel-common.txt.
> +- power-supply: See panel-common.txt.

simple-panel.txt should do the same.

Really, I'd like to see panel-common.txt and simple-panel.txt merged
and simple-panel.txt removed altogether. But there are a lot of
references back to simple-panel.txt. A given panel still needs to say
what common properties it uses or doesn't use. Omitting a property
like power-supply is ambiguous and can either mean "I only have 1
supply" or "I haven't thought about supplies yet there are more than
1".

Rob
