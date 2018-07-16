Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1531738834.12853.64.camel@baylibre.com>
Subject: Re: [RESEND PATCH v2 2/2] clk: meson-g12a: Add EE Clock controller
 driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 Rob Herring <robh@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yixun Lan
 <yixun.lan@amlogic.com>,  Qiufang Dai <qiufang.dai@amlogic.com>, "Bo.yang"
 <bo.yang@amlogic.com>, "Xingyu.chen" <xingyu.chen@amlogic.com>,
 "Qianggui,song" <qianggui.song@amlogic.com>,  "Sunny.luo"
 <sunny.luo@amlogic.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org
Date: Mon, 16 Jul 2018 13:00:34 +0200
In-Reply-To: <1531728707-192230-3-git-send-email-jian.hu@amlogic.com>
References: <1531728707-192230-1-git-send-email-jian.hu@amlogic.com>
	 <1531728707-192230-3-git-send-email-jian.hu@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2018-07-16 at 16:11 +0800, Jian Hu wrote:
> Add a Clock driver for the Everything-Else part
> of the Amlogic Meson-G12A SoC.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

Point raised about fdiv gates remains un-answered.
Please address all the point raised before reposting your patches.
