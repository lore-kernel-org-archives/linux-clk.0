Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20170127200532.pemk36hwyzkun3i5@lukather>
References: <20170126154859.55855-1-icenowy@aosc.xyz>
 <20170126154859.55855-9-icenowy@aosc.xyz>
 <20170127200532.pemk36hwyzkun3i5@lukather>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 28 Jan 2017 20:46:39 +0800
Message-ID: <CAGb2v669B=uYO4HkdHJ=3LdoGEWJxO8y+kmA+X35LYnuDqWL1Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] ASoC: sunxi: allow the analog codec driver to be
 built on ARM64
To: Maxime Ripard <maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Vinod Koul <vinod.koul@intel.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Icenowy Zheng <icenowy@aosc.xyz>, dmaengine@vger.kernel.org,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, Jan 28, 2017 at 4:05 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Thu, Jan 26, 2017 at 11:48:58PM +0800, Icenowy Zheng wrote:
>> As the 64-bit Allwinner H5 SoC has the same analog codec part (also the
>> same digital part) as H3, enable the driver to be built on ARM64
>> Allwinner platform, so that it can be used on H5.
>>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
>
> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
