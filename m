Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20160615123646.GD4948@dell>
References: <1465986467-14802-1-git-send-email-wens@csie.org>
 <1465986467-14802-4-git-send-email-wens@csie.org> <20160615123646.GD4948@dell>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 15 Jun 2016 20:41:35 +0800
Message-ID: <CAGb2v669g6G4aK5UssyLLve1a-AbdVfo4CPYrt+YWmCUURz9qQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] mfd: ac100: Add driver for X-Powers AC100 audio
 codec / RTC combo IC
To: Lee Jones <lee.jones@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	rtc-linux@googlegroups.com, linux-kernel <linux-kernel@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jun 15, 2016 at 8:36 PM, Lee Jones <lee.jones@linaro.org> wrote:
> On Wed, 15 Jun 2016, Chen-Yu Tsai wrote:
>
>> The AC100 is a multifunction device with an audio codec subsystem and
>> an RTC subsystem. These two subsystems share a common register space
>> and host interface.
>>
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>> ---
>
> Change log?

Change log was in the cover letter. Changes were the addition of the
codec related register macros and regmap ranges.

>>  drivers/mfd/Kconfig       |  10 +++
>>  drivers/mfd/Makefile      |   2 +
>>  drivers/mfd/ac100.c       | 135 +++++++++++++++++++++++++++++++++++
>>  include/linux/mfd/ac100.h | 176 ++++++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 323 insertions(+)
>>  create mode 100644 drivers/mfd/ac100.c
>>  create mode 100644 include/linux/mfd/ac100.h
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index 1bcf601de5bc..bd83849a0c8d 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -101,6 +101,16 @@ config MFD_BCM590XX
>>       help
>>         Support for the BCM590xx PMUs from Broadcom
>>
>> +config MFD_AC100
>> +     tristate "X-Powers AC100"
>> +     select MFD_CORE
>> +     depends on SUNXI_RSB
>> +     help
>> +       If you say Y here you get support for the X-Powers AC100 audio codec
>> +       IC.
>> +       This driver include only the core APIs. You have to select individual
>> +       components like codecs or RTC under the corresponding menus.
>> +
>>  config MFD_AXP20X
>>       tristate
>>       select MFD_CORE
>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>> index 42a66e19e191..60f9a6b0557c 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -113,6 +113,8 @@ obj-$(CONFIG_PMIC_DA9052) += da9052-irq.o
>>  obj-$(CONFIG_PMIC_DA9052)    += da9052-core.o
>>  obj-$(CONFIG_MFD_DA9052_SPI) += da9052-spi.o
>>  obj-$(CONFIG_MFD_DA9052_I2C) += da9052-i2c.o
>> +
>> +obj-$(CONFIG_MFD_AC100)              += ac100.o
>>  obj-$(CONFIG_MFD_AXP20X)     += axp20x.o
>>  obj-$(CONFIG_MFD_AXP20X_I2C) += axp20x-i2c.o
>>  obj-$(CONFIG_MFD_AXP20X_RSB) += axp20x-rsb.o
>> diff --git a/drivers/mfd/ac100.c b/drivers/mfd/ac100.c
>> new file mode 100644
>> index 000000000000..15d24fa77771
>> --- /dev/null
>> +++ b/drivers/mfd/ac100.c
>> @@ -0,0 +1,135 @@
>> +/*
>> + * ac100.c - MFD core driver for X-Powers' AC100 Audio Codec IC
>
> Nit: Drop the filename here.
>
> Apart from that:
>   Acked-by: Lee Jones <lee.jones@linaro.org>

Thanks.
ChenYu
