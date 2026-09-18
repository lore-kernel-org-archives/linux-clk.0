Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E6B3CDBD3
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745590; cv=none; b=UcNsaam1HGnFoovhZTNSMhIq2HDB/gCZ3Ok25JZ2EutIOcuPOdAKnq87VFU62QOm9nlpIXMpk2hFrbkPwS29g4EmeLtJ0Lg1xV+te+49pV4Bo/sTrZPiWECgI8TolU5NqtVYoyElMxjor0X41jt35XUt5ht+GGFlXnLxpBx8+/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745590; c=relaxed/simple;
	bh=L1WiWMmX3DsfOI8wyFB2zH02SO5nVuyZ3sk5usay3Fs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lc6v9gHG9VU6OMvfJZVEEY/v6YuO1W2l1p3fUs/s6s8UmFIlgVajKC+eDVvuSHzqp8eOEx8z+AmAUKrsxl9nLwOpzgBe94O9CWhx8FzACxvxZb0xI/HsmMhklGUaMnombExPJGh+rRYKM8YJgbX8rtPu881a4+4U7Cp284dxm70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=c4NIRCv3; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="c4NIRCv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1789745582;
 bh=WtQrZyaQlO+mtHmYw2SBSJxPWTjmzlVgI7Rp9b5tPg4=;
 b=c4NIRCv3LlgBjCJ+KRuvR8ppVPaY4qWZyJ+6MQqvEcF+ii4rdyvsjZ6XCTTLkPEfaYRsl6t7L
 i3MWA9VXyvqEji0ybdyNykgecN/q2M7nJ+uis8Vy3lTUuJ/HafyX1266EOWyX9ZyhiDg41IWDSG
 IFBvWRnETTgzuUOOYiKyHlscnaPykjn20aMxL17qnMQV37VHbRHHTE90kuylZ7O/NSTj2tO7NNn
 HrAlstBdRgBnTpqG+BwU2quEGUKny7simSZ2q3EMvnMMhGUd7Uga6i3TINrm5cyKTjNUl/JAPTx
 ZS4XuEfMvky7fotcYbx69gwF2gGeP46aTL8OPcxFBMFg==
X-Forward-Email-ID: 6aad59a12df78bc22ddeff38
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Fri, 18 Sep 2026 11:32:45 -0400
Message-Id: <DLIJUQCKB76W.3RHK9KPO5JSOZ@ubuntu.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <mfd@lists.linux.dev>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maud Spierings"
 <maud_spierings@murena.io>, "Graham Markall" <hello@big-grey.co.uk>,
 "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Chaoyi Chen"
 <chaoyi.chen@rock-chips.com>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v4 00/20] drm: starfive: jh7110: Enable display
 subsystem
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Michal Wilczynski" <m.wilczynski@samsung.com>, "Joshua Peisach"
 <jpeisach@ubuntu.com>, "Vinod Koul" <vkoul@kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Lee
 Jones" <lee@kernel.org>, "Andy Yan" <andy.yan@rock-chips.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Emil Renner Berthing" <kernel@esmil.dk>,
 "Hal Feng" <hal.feng@starfivetech.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Dominique Belhachemi" <db@domibel.de>,
 "Brian Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>
X-Mailer: aerc 0.21.0
References: <CGME20260915153213eucas1p148f013af239a334fc78cdc249c0f8a61@eucas1p1.samsung.com> <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com> <DLGBPXP4F8E0.9X0QMZ9GFQVF@ubuntu.com> <136d6789-2f0c-4a91-ab2d-de3a3f119d5d@samsung.com>
In-Reply-To: <136d6789-2f0c-4a91-ab2d-de3a3f119d5d@samsung.com>

On Thu Sep 17, 2026 at 1:22 PM EDT, Michal Wilczynski wrote:
>
>
> On 9/16/26 02:45, Joshua Peisach wrote:
>> On Tue Sep 15, 2026 at 11:32 AM EDT, Michal Wilczynski wrote:
>>>
>>> Testing
>>> =3D=3D=3D=3D=3D=3D=3D
>>>
>>> Tested on a VisionFive 2 v1.3B using modetest.
>>=20
>> I.. got nothing. I did have to manually modprobe the modules, but
>> unless I am doing something wrong.. I didn't get anything and modetest
>> just gave -2.
>
> Hmm have you also changed the DTB not just the kernel and the modules
> (you can also built in everything).
>
Yes (I didn't built-in everything, but I did make sure the DTB was
copied and flash-kernel was run)

> Also note modetest needs -M verisilicon.
>

"failed to open device 'versilicon' with busid '(null)': No such file
or directory"


> If that is not it, could you send "dmesg | grep -iE
> 'verisilicon|inno|hdmi|vout'" and "ls /sys/class/drm/"?
>
the dmesg output:

[    0.090950] /soc/display-subsystem@29400000/hdmi@29590000/controller: Fi=
xed dependency cycle(s) with /soc/display-subsystem@29400000/display@294000=
00
[    0.091029] /soc/display-subsystem@29400000/display@29400000: Fixed depe=
ndency cycle(s) with /soc/display-subsystem@29400000/hdmi@29590000/controll=
er
[    0.104227] /hdmi-connector: Fixed dependency cycle(s) with /soc/display=
-subsystem@29400000/hdmi@29590000/controller
[    0.104272] /soc/display-subsystem@29400000/hdmi@29590000/controller: Fi=
xed dependency cycle(s) with /hdmi-connector


/sys/class/drm only contains the file "version"

-Josh

>>=20
>>> ---
>>> Michal Wilczynski (20):
>>>       dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
>>>       dt-bindings: display: bridge: Add starfive,jh7110-inno-hdmi-contr=
oller
>>>       dt-bindings: mfd: Add starfive,jh7110-hdmi-subsystem
>>>       dt-bindings: soc: starfive: Add starfive,jh7110-vout-syscon
>>>       dt-bindings: display: verisilicon: Add starfive,jh7110-dc8200
>>>       dt-bindings: soc: starfive: Add starfive,jh7110-vout-subsystem
>>>       drm/bridge: inno-hdmi: Split probe out of bind
>>>       drm/bridge: inno-hdmi: Allow the register map to come from a pare=
nt
>>>       drm/bridge: inno-hdmi: Add .disable platform operation
>>>       drm/bridge: inno-hdmi: Add .mode_valid platform operation
>>>       drm/bridge: inno-hdmi: Make the PHY configuration table optional
>>>       soc: starfive: Add jh7110-hdmi-subsystem driver
>>>       soc: starfive: Add jh7110-vout-subsystem driver
>>>       clk: starfive: jh7110-vout: Allow pixel clock rate propagation
>>>       drm/bridge: starfive: Add JH7110 HDMI controller driver
>>>       phy: Add common Innosilicon HDMI PHY helpers
>>>       phy: rockchip: inno-hdmi: Use the common Innosilicon PHY helpers
>>>       phy: starfive: Add jh7110-inno-hdmi-phy driver
>>>       riscv: dts: starfive: jh7110: Update DT for display subsystem
>>>       MAINTAINERS: Add StarFive JH7110 display subsystem entry
>>>
>>>  .../starfive,jh7110-inno-hdmi-controller.yaml      | 121 +++++
>>>  .../bindings/display/verisilicon,dc.yaml           |   1 +
>>>  .../mfd/starfive,jh7110-hdmi-subsystem.yaml        |  95 ++++
>>>  .../phy/starfive,jh7110-inno-hdmi-phy.yaml         |  49 ++
>>>  .../soc/starfive/starfive,jh7110-syscon.yaml       |   1 +
>>>  .../starfive/starfive,jh7110-vout-subsystem.yaml   | 218 ++++++++
>>>  MAINTAINERS                                        |  13 +
>>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 121 ++++-
>>>  arch/riscv/boot/dts/starfive/jh7110.dtsi           | 105 +++-
>>>  drivers/clk/starfive/clk-starfive-jh7110-vout.c    |   6 +-
>>>  drivers/gpu/drm/bridge/Kconfig                     |  11 +
>>>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>>>  drivers/gpu/drm/bridge/inno-hdmi.c                 | 112 +++-
>>>  drivers/gpu/drm/bridge/jh7110-inno-hdmi.c          | 297 +++++++++++
>>>  drivers/phy/Kconfig                                |   8 +
>>>  drivers/phy/Makefile                               |   1 +
>>>  drivers/phy/phy-inno-hdmi.c                        | 298 +++++++++++
>>>  drivers/phy/rockchip/Kconfig                       |   1 +
>>>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 168 +-----
>>>  drivers/phy/starfive/Kconfig                       |  20 +
>>>  drivers/phy/starfive/Makefile                      |   1 +
>>>  drivers/phy/starfive/phy-jh7110-inno-hdmi.c        | 579 +++++++++++++=
++++++++
>>>  drivers/soc/Kconfig                                |   1 +
>>>  drivers/soc/Makefile                               |   1 +
>>>  drivers/soc/starfive/Kconfig                       |  43 ++
>>>  drivers/soc/starfive/Makefile                      |   3 +
>>>  drivers/soc/starfive/jh7110-hdmi-subsystem.c       |  73 +++
>>>  drivers/soc/starfive/jh7110-vout-subsystem.c       |  82 +++
>>>  include/drm/bridge/inno_hdmi.h                     |  10 +-
>>>  include/linux/phy/inno-hdmi-phy.h                  |  85 +++
>>>  30 files changed, 2337 insertions(+), 188 deletions(-)
>>> ---
>>> base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
>>> change-id: 20251031-jh7110-clean-send-7d2242118026
>>>
>>> Best regards,
>>=20
>> By the way, something weird happenined while I applied the patches
>> using git am. Somehow, some were out of order. The 10th patch
>> adding .mode_valid tried to be applied before .disable even though
>> in the series, the order is correctly set? git would obviously
>> fail because the .disable entry did not exist in the header, so I had
>> to manually put those in.
>>=20
>> I guess it's possible that something went wrong here? I personally
>> pulled the mailbox from the lore.kernel.org mbox.gz file.
>
> I would recommend using b4 shazam instead
>
>>=20
>
> Best regards,

