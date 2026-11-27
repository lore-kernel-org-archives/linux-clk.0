Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795805260;
	b=LxKiEA5Wsj6wQqLdTgIY42bkBcKrxQyGExRiWhthwnsQaVPvsP33XSDwAqVgf6u/Xsz3
	 lZ0al2mPOz6cVWvLttiAMdBBjtrORyiCOf2nQelFleSH1nIza0AQVS25xorqNYucxiXj3
	 xJB4FH7t7NOtEyZQB6uafdRe/ko3cDgTaPQQOLbbxhqUetoCZ6ILLFCgPwoogW8yB9JOe
	 0NX8u4SunyQIRdF12FYNkh8a8Hui+VgXgsaeRdrpv58pPtjWBTWdBnrrk/EFemYbwsXf5
	 R5YdpwT4yYW7lZGNAWhA9empCKTc1ljh3/6pYaNU/9wGSah40/9l8/gYVEyPdPJPhMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=QXJklL9KhZ3VVaTRDB8HfhkTSWUyeH6f1XgJBlsBOh8=;
	b=DuamTDOXW2f09jdfqDObyM9pYjpq9hv/7o5XZqVGaJaaEH0Ir3ch2n9OEzWr7VBodC+2
	 zcOc5kzMgSep93NAesbdAlftoiOXkYLOjYjCyy3Fasa5GkYZd4jHYbjPVki+KJm3vrJ2E
	 /gKvpDZOJ4Yx+uTOfAf0jTH7VLqiTxwJ0Gejz7ehAr3TCdx4BYJkbNsFYht9TD/rZoxrB
	 endZ19l6Gv3VfqTGYVeMQCU+n6RVGKH5kwbz4GOjIrBbpKwYSPFVv7ytTgdOnwuL76D/K
	 nAtDu+tvmOvn5dOnc7kf7NqUNKvGfJKu0V1Vn7uNRAYgEWruqTfJsjfLou3eprA3vvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qPLvuMaT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488B6606A321
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 18:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 488B6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qPLvuMaT
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55d03bfd477so93281321cf.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 10:47:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795805258; cv=none;
        d=google.com; s=arc-20260327;
        b=k2tzPDCk3UCrm78AKCdJuKTZ4l+FG1R+Nge/YyLcXlG8UP5dyaVPnTgPnAbNGMhUra
         nzhnZwrDjZwxrJs+r/Ivq9AyHIWWCYTBxJb0QrYQSHHKZprCcISgd87Kpwlxmzzigrhw
         N7+rs7mMEucUMXwH19WNaJvrV9S/F6wCatubOvOxlFufh30yIspvdwrl89QCiTbSrnJf
         GK8Q3M27QjY+2eYbaRW2h+6Wtf2k91dYgn6z9DvEH9F5Z/oHgv08HYad+CvZB8wHKEJC
         5L577WpcTpM1iWMIa3sZtLpf041M6Zb1eu6+va09E2FhH0XQhbD2NXHzHPgKN+j5qcac
         kQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QXJklL9KhZ3VVaTRDB8HfhkTSWUyeH6f1XgJBlsBOh8=;
        fh=yE2xi7ah77babHAPhZBLPgSjWrkXz1U4zskDgemLEcY=;
        b=SiTS2eOTHSPjFvJaVGyf4c6KymUw13RtyHoZ+xvGNLLfBvsjf44RQJ/1uqYDON24et
         lwA5arZFaMakeiUN+SbBSkKqMdYk1HVF+gRkleY7O1DvPiGlyuCd0h8+C2+qx/r43Zfg
         J2haYprQGuRygSUrLgN2msGd+YH9+pNlfuHU67Mf60nocHwPOJdzHbL+rwqullNAhl6X
         ZgumXAf24yNy9zn4WToZOnxWu3uiBXa6MQjrzASBM/SGUJGaF47jwqq0jladecydEnZh
         MD53etPfnQ8DsLC2mSwqMGvlD19wYxe37ga2+jVmPDd+On0+5XkvfnjOmnoZnvvwakno
         f1PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795805258; x=1796410058; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXJklL9KhZ3VVaTRDB8HfhkTSWUyeH6f1XgJBlsBOh8=;
        b=qPLvuMaTS+2kS5TIv3ELAZegkaAvq2Zi+7IM37tMLyGOADhqENvb9gsA0wghGXRYXv
         wlqXTB++ZHc4fV3Uy7oUfj4KySXCZPf10nbrKHWNA10pp8AiaulMtxggK4c7nDLcbX2x
         V+5/5iGGpeailx2eiw5aLl61DfhqwpiUxsWy2bOURE0iO0kuZ7rQqymUyCWq4HSLKYNe
         74Ur8qsp/sTHp+g7P05x1Xq01rZOpKRTlmCSCpAG0LYhHZwWeoZvBAkf8GA30xkCMFEK
         KNmUCeX8p1WXmaIKwaQvboQW1ZJgxguwqpgOeA5jdUAi4+Ua8ZKVdPA6AUIXZDaxj85W
         IwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805258; x=1796410058;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QXJklL9KhZ3VVaTRDB8HfhkTSWUyeH6f1XgJBlsBOh8=;
        b=Qh5ZqYjgYERKd50WyRQtGqrpj1JMPNX9Wzh7ceXHMF0fVHwVI0uUfVLdNl7ygDR4wk
         EyOBDchqwBLaw9uCsfZfdokVxC6ui6r1e8Dea/qC7n0dKogABQo4GX4QF/C3XtxS4290
         7EkDNzIjvIfQjZr7536rwv8S/C/UVLZIAKOUif7ypnTKQUNd4om2pSUNsTyv2MQJXJyp
         hzunce2iKiU4FLCej898VJ+LmIhY8td9eA3PhvvFPWHWNPteTXvxbhq+0eGj+7auWQ9S
         rRUrDYJUJLivAeQaA6allR2A6lVr7+5TCKgbV0nnV0R9RzyiV2nlkl1b2YXSyXyDqf7S
         IRZw==
X-Forwarded-Encrypted: i=1; AL+hErE5m5vBek11vTyn12HYdXdNV+U5OSXSg5pE7OKyJQZ4RZLwNSjY0VuqPjGrJJri2uE1XGPe3S8YUuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XKloCrThJuwJRdEcUPoG3lgTVsQG65TREpS4/uWLFee9pX/cw
	XfQUqUXCD303GYLf3AC9YCZhNYQ1XSgkW0TsVyaSJmnOnMKNJ+kQhU++WqHVPMEDIXKicaprsVr
	xZKP80PP8Js1ApxXNijbTOFgHK4os+MW5IvkBNuJClw==
X-Gm-Gg: AZFdTZcSUfAWAEGhTGdbEXSjs4x9vfgoR8/kuWYv0EhRGVW3bx5pXwcMUA/k8cLYOXw
	e5B0qqabdJ+/OcBx17JvrtoRd/GLq852jj8Ea+Z1IXxfmLKGqGLYoMuhlR1SxXgklPOc5ui5PzW
	kZ30q0jd9QNvagvk4bmoyFADZIBmmPWVhbIWe6udUwNGoyfzOA74NKOkvoYHHBp0jMdFrd1plsH
	fLgHS9/BWb6GZRFi8erigLK2Vl5WErSoSIcm9WMsXQFF9oAkKL6Y+oWYGA/XCejR52Yn4Mksh/U
	+F/l78jp8a+Q5zuFBc/itDrgdq94lcFSt1KDFjM7CQQJ56MWMIFME+is9o/OzZmWwm++qXPG9VJ
	21008FVwpIpTN0RYQJSQGIGkRAQ1JV7Xli4FFWwezCwxSjgtycSkbjzra9NGepZJq1rrd4s8tot
	tKpAPYAOC7sYzH
X-Received: by 2002:ac8:5706:0:b0:55d:1944:a29d with SMTP id
 d75a77b69052e-55d76a6404dmr462446441cf.40.1795805258035; Fri, 27 Nov 2026
 10:47:38 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
 <20261127134507.125513-4-hikmahgumelar@gmail.com> <awnF3Zbid3lzBC0a@kekkonen.localdomain>
In-Reply-To: <awnF3Zbid3lzBC0a@kekkonen.localdomain>
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
Date: Sat, 28 Nov 2026 01:47:25 +0700
X-Gm-Features: Aa3M54qhWG1e_CumAsUf65sLcNMdTthNXWeuvrPtP8kaHusc_84MXI8aGH_G6lw
Message-ID: <CADA=zOO+0mkpXK7Vae2XR+_2y7GfO1+dnO_rqj4c6cQXWTTWrg@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] media: i2c: add s5k5e8 image sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

Thanks for the review and feedback. Right now I am prioritizing the
camera sensor drivers (s5k5e8 and ov12a10) first, with separate patch
series for s5k5e8, ov12a10, and the MSM8953/tissot changes.

I will update the patches based on your review feedback on s5k5e8
(which applies to ov12a10 as well). While I have had the camera path
running on 7.1.3, I am upgrading my tissot (Mi A1) hardware test
kernel to the 7.4.0-rc series so I can validate the updated drivers on
device before sending the next patch series.

I will submit the updated patch series once these changes are in place
and tested on hardware.

Best regards,
Hikmah Gumelar

Pada Sab, 28 Nov 2026 pukul 01.03 Sakari Ailus
<sakari.ailus@linux.intel.com> menulis:
>
> Hi Hikmar,
>
> A few comments below, they probably apply to the other driver as well.
>
> On Fri, Nov 27, 2026 at 08:45:03PM +0700, Hikmah Gumelar wrote:
> > Add V4L2 subdev driver for the Samsung S5K5E8 5-megapixel MIPI CSI-2
> >
>
> This is an odd place for a new paragraph.
>
> > CMOS image sensor supporting 2592x1944 10-bit Bayer output.
> >
> > Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
> > ---
> >  MAINTAINERS                |   7 +
> >  drivers/media/i2c/Kconfig  |  10 +
> >  drivers/media/i2c/Makefile |   1 +
> >  drivers/media/i2c/s5k5e8.c | 567 +++++++++++++++++++++++++++++++++++++
> >  4 files changed, 585 insertions(+)
> >  create mode 100644 drivers/media/i2c/s5k5e8.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f72ce07a4e38..2ac245d4ad7c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25007,6 +25007,13 @@ T:   git git://linuxtv.org/media_tree.git
> >  F:   Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml
> >  F:   drivers/media/i2c/s5k3m5.c
> >
> > +SAMSUNG S5K5E8 CAMERA SENSOR DRIVER
> > +M:   Hikmah Gumelar <hikmahgumelar@gmail.com>
> > +L:   linux-media@vger.kernel.org
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
> > +F:   drivers/media/i2c/s5k5e8.c
> > +
> >  SAMSUNG S5K5BAF CAMERA DRIVER
> >  M:   Sylwester Nawrocki <s.nawrocki@samsung.com>
> >  M:   Andrzej Hajda <andrzej.hajda@intel.com>
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 162b8ea02601..4c622e5eef73 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -879,6 +879,16 @@ config VIDEO_S5K3M5
> >         To compile this driver as a module, choose M here: the
> >         module will be called s5k3m5.
> >
> > +config VIDEO_S5K5E8
> > +     tristate "Samsung S5K5E8 sensor support"
> > +     select V4L2_CCI_I2C
> > +     help
> > +       This is a Video4Linux2 sensor-level driver for the Samsung
> > +       S5K5E8 5MP camera.
> > +
> > +       To compile this driver as a module, choose M here: the
> > +       module will be called s5k5e8.
> > +
> >  config VIDEO_S5K5BAF
> >       tristate "Samsung S5K5BAF sensor support"
> >       help
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index a750942e9c62..bdcb8f34aca3 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -136,6 +136,7 @@ obj-$(CONFIG_VIDEO_RDACM21) += rdacm21.o
> >  obj-$(CONFIG_VIDEO_RJ54N1) += rj54n1cb0c.o
> >  obj-$(CONFIG_VIDEO_S5C73M3) += s5c73m3/
> >  obj-$(CONFIG_VIDEO_S5K3M5) += s5k3m5.o
> > +obj-$(CONFIG_VIDEO_S5K5E8) += s5k5e8.o
> >  obj-$(CONFIG_VIDEO_S5K5BAF) += s5k5baf.o
> >  obj-$(CONFIG_VIDEO_S5K6A3) += s5k6a3.o
> >  obj-$(CONFIG_VIDEO_S5KJN1) += s5kjn1.o
> > diff --git a/drivers/media/i2c/s5k5e8.c b/drivers/media/i2c/s5k5e8.c
> > new file mode 100644
> > index 000000000000..d25b978d7eda
> > --- /dev/null
> > +++ b/drivers/media/i2c/s5k5e8.c
> > @@ -0,0 +1,567 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/unaligned.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-fwnode.h>
> > +
> > +#define S5K5E8_CHIP_ID_REG           0x0000
> > +#define S5K5E8_CHIP_ID                       0x5e80
> > +#define S5K5E8_REG_MODE_SELECT               0x0100
> > +#define S5K5E8_MODE_STANDBY          0x00
> > +#define S5K5E8_REG_VTS                       0x0340
> > +#define S5K5E8_REG_EXPOSURE          0x0202
> > +#define S5K5E8_REG_ANALOG_GAIN               0x0204
> > +#define S5K5E8_REG_TEST_PATTERN              0x0600
> > +#define S5K5E8_XVCLK_FREQ            24000000
> > +#define S5K5E8_LINK_FREQ_418MHZ              418000000ULL
> > +#define S5K5E8_PIXEL_RATE            167200000ULL
> > +
> > +struct s5k5e8_reg {
> > +     u16 address;
> > +     u8 val;
> > +};
> > +
> > +struct s5k5e8_mode {
> > +     u32 width, height, hts_def, num_regs;
> > +     const struct s5k5e8_reg *regs;
> > +};
> > +
> > +static const char * const s5k5e8_supply_names[] = { "avdd", "dvdd", "dovdd" };
> > +#define S5K5E8_NUM_SUPPLIES ARRAY_SIZE(s5k5e8_supply_names)
>
> Please just use ARRAY_SIZE() where you need it.
>
> > +
> > +/* Register initialization tables derived from Xiaomi Mi A1 vendor configuration */
> > +static const struct s5k5e8_reg s5k5e8_common_regs[] = {
> > +     { 0x0100, 0x00 }, { 0x3906, 0x7e }, { 0x3c01, 0x0f }, { 0x3c14, 0x00 },
> > +     { 0x3235, 0x08 }, { 0x3063, 0x2e }, { 0x307a, 0x10 }, { 0x307b, 0x0e },
> > +     { 0x3079, 0x20 }, { 0x3070, 0x05 }, { 0x3067, 0x06 }, { 0x3071, 0x62 },
> > +     { 0x3072, 0x16 }, { 0x3203, 0x43 }, { 0x3205, 0x43 }, { 0x320b, 0x42 },
> > +     { 0x3007, 0x00 }, { 0x3008, 0x14 }, { 0x3020, 0x58 }, { 0x300d, 0x34 },
> > +     { 0x300e, 0x17 }, { 0x3021, 0x02 }, { 0x3010, 0x59 }, { 0x3002, 0x01 },
> > +     { 0x3005, 0x01 }, { 0x3008, 0x04 }, { 0x300f, 0x70 }, { 0x3010, 0x69 },
> > +     { 0x3017, 0x10 }, { 0x3019, 0x19 }, { 0x300c, 0x62 }, { 0x3064, 0x10 },
> > +     { 0x3c08, 0x0e }, { 0x3c09, 0x10 }, { 0x3c31, 0x0d }, { 0x3c32, 0xac },
>
> It'd be nice to have a human-readable macro name as many as possible of
> these registers. Some here are probably 16-bit (or larger) registers, too.
>
> > +};
> > +
> > +static const struct s5k5e8_reg s5k5e8_2592x1944_regs[] = {
> > +     { 0x0100, 0x00 }, { 0x0136, 0x18 }, { 0x0137, 0x00 }, { 0x0305, 0x06 },
> > +     { 0x0306, 0x18 }, { 0x0307, 0xa8 }, { 0x0308, 0x34 }, { 0x0309, 0x42 },
> > +     { 0x3c1f, 0x00 }, { 0x3c17, 0x00 }, { 0x3c0b, 0x04 }, { 0x3c1c, 0x47 },
> > +     { 0x3c1d, 0x15 }, { 0x3c14, 0x04 }, { 0x3c16, 0x00 }, { 0x0820, 0x03 },
> > +     { 0x0821, 0x44 }, { 0x0114, 0x01 }, { 0x0344, 0x00 }, { 0x0345, 0x08 },
> > +     { 0x0346, 0x00 }, { 0x0347, 0x08 }, { 0x0348, 0x0a }, { 0x0349, 0x27 },
> > +     { 0x034a, 0x07 }, { 0x034b, 0x9f }, { 0x034c, 0x0a }, { 0x034d, 0x20 },
> > +     { 0x034e, 0x07 }, { 0x034f, 0x98 }, { 0x0900, 0x00 }, { 0x0901, 0x00 },
> > +     { 0x0381, 0x01 }, { 0x0383, 0x01 }, { 0x0385, 0x01 }, { 0x0387, 0x01 },
> > +     { 0x0340, 0x07 }, { 0x0341, 0xb0 }, { 0x0342, 0x0b }, { 0x0343, 0x28 },
> > +     { 0x0200, 0x00 }, { 0x0201, 0x00 }, { 0x0202, 0x03 }, { 0x0203, 0xde },
> > +     { 0x3303, 0x02 }, { 0x3400, 0x00 }, { 0x323b, 0x02 }, { 0x3301, 0x00 },
> > +     { 0x3321, 0x04 }, { 0x3306, 0x00 }, { 0x3307, 0x08 }, { 0x3308, 0x0a },
> > +     { 0x3309, 0x27 }, { 0x330a, 0x01 }, { 0x330b, 0x01 }, { 0x330e, 0x00 },
> > +     { 0x330f, 0x08 }, { 0x3310, 0x07 }, { 0x3311, 0x9f }, { 0x3312, 0x01 },
> > +     { 0x3313, 0x01 },
> > +};
> > +
> > +static const struct s5k5e8_mode default_mode = {
> > +             .width = 2592, .height = 1944, .hts_def = 2856,
> > +                     .num_regs = ARRAY_SIZE(s5k5e8_2592x1944_regs),
> > +             .regs = s5k5e8_2592x1944_regs,
> > +     };
>
> Indentation could be improved above.
>
> > +
> > +static const s64 link_freq_menu_items[] = { S5K5E8_LINK_FREQ_418MHZ };
> > +
> > +struct s5k5e8 {
> > +     struct device *dev;
> > +     struct v4l2_subdev sd;
> > +     struct media_pad pad;
> > +     struct clk *xvclk;
> > +     struct gpio_desc *reset_gpio;
> > +     struct regulator_bulk_data supplies[S5K5E8_NUM_SUPPLIES];
> > +     struct v4l2_ctrl_handler ctrl_handler;
> > +     struct v4l2_ctrl *link_freq, *hblank, *exposure;
> > +     const struct s5k5e8_mode *cur_mode;
> > +     /* Serialize access to sensor registers and streaming state */
> > +     struct mutex mutex;
>
> Please rely on the sub-device state lock instead (same as control handler's
> lock); see e.g. imx219 for an example.
>
> > +     bool streaming;
> > +};
> > +
> > +static inline struct s5k5e8 *to_s5k5e8(struct v4l2_subdev *sd)
> > +{
> > +     return container_of(sd, struct s5k5e8, sd);
> > +}
> > +
> > +static int s5k5e8_read_reg(struct s5k5e8 *s5k5e8, u16 reg, u32 len, u32 *val)
> > +{
> > +     struct i2c_client *client = v4l2_get_subdevdata(&s5k5e8->sd);
> > +     struct i2c_msg msgs[2];
> > +     u8 addr_buf[2], data_buf[4] = { 0 };
> > +     int ret;
> > +
> > +     put_unaligned_be16(reg, addr_buf);
> > +     msgs[0].addr = client->addr;
> > +     msgs[0].flags = 0;
> > +     msgs[0].len = 2;
> > +     msgs[0].buf = addr_buf;
> > +     msgs[1].addr = client->addr;
> > +     msgs[1].flags = I2C_M_RD;
> > +     msgs[1].len = len;
> > +     msgs[1].buf = &data_buf[4 - len];
> > +     ret = i2c_transfer(client->adapter, msgs, 2);
> > +     if (ret != 2)
> > +             return ret < 0 ? ret : -EIO;
> > +     *val = get_unaligned_be32(data_buf);
> > +     return 0;
> > +}
> > +
> > +static int s5k5e8_write_reg(struct s5k5e8 *s5k5e8, u16 reg, u32 len, u32 val)
> > +{
> > +     struct i2c_client *client = v4l2_get_subdevdata(&s5k5e8->sd);
> > +     u8 buf[6];
> > +     int ret;
> > +
> > +     put_unaligned_be16(reg, buf);
> > +     put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
> > +     ret = i2c_master_send(client, buf, len + 2);
> > +     return ret == len + 2 ? 0 : (ret < 0 ? ret : -EIO);
> > +}
> > +
> > +static int s5k5e8_write_regs(struct s5k5e8 *s5k5e8, const struct s5k5e8_reg *regs, u32 len)
> > +{
> > +     u32 i;
> > +     int ret;
> > +
> > +     for (i = 0; i < len; i++) {
> > +             ret = s5k5e8_write_reg(s5k5e8, regs[i].address, 1, regs[i].val);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int s5k5e8_power_on(struct device *dev)
> > +{
> > +     struct s5k5e8 *s5k5e8 = to_s5k5e8(dev_get_drvdata(dev));
> > +     int ret = regulator_bulk_enable(S5K5E8_NUM_SUPPLIES, s5k5e8->supplies);
> > +
> > +     if (ret)
> > +             return ret;
> > +     ret = clk_prepare_enable(s5k5e8->xvclk);
> > +     if (ret) {
> > +             regulator_bulk_disable(S5K5E8_NUM_SUPPLIES, s5k5e8->supplies);
> > +             return ret;
> > +     }
> > +     gpiod_set_value_cansleep(s5k5e8->reset_gpio, 1);
>
> Reset was already asserted here, wasn't it?
>
> > +     usleep_range(1000, 2000);
> > +     gpiod_set_value_cansleep(s5k5e8->reset_gpio, 0);
> > +     usleep_range(3000, 5000);
> > +     return 0;
> > +}
> > +
> > +static int s5k5e8_power_off(struct device *dev)
> > +{
> > +     struct s5k5e8 *s5k5e8 = to_s5k5e8(dev_get_drvdata(dev));
> > +
> > +     if (s5k5e8->reset_gpio)
>
> No need for such checks.
>
> > +             gpiod_set_value_cansleep(s5k5e8->reset_gpio, 1);
> > +     clk_disable_unprepare(s5k5e8->xvclk);
> > +     regulator_bulk_disable(S5K5E8_NUM_SUPPLIES, s5k5e8->supplies);
> > +     return 0;
> > +}
> > +
> > +static int s5k5e8_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct s5k5e8 *s5k5e8 = container_of(ctrl->handler, struct s5k5e8, ctrl_handler);
> > +     int ret = 0;
> > +
> > +     if (ctrl->id == V4L2_CID_VBLANK) {
> > +             s64 exp_max = s5k5e8->cur_mode->height + ctrl->val - 4;
> > +             s64 exp_def = min_t(s64, 1960, exp_max);
> > +
> > +             ret = __v4l2_ctrl_modify_range(s5k5e8->exposure, 4, exp_max, 1,
> > +                                            exp_def);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret = pm_runtime_get_if_active(s5k5e8->dev);
> > +     if (ret <= 0)
>
> Just check for zero. I wonder where the above pattern came from; it's not
> the first driver I review today that had the same. No need to assign to ret
> either.
>
> > +             return 0;
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_ANALOGUE_GAIN:
> > +             ret = s5k5e8_write_reg(s5k5e8, S5K5E8_REG_ANALOG_GAIN, 2, ctrl->val);
> > +     break;
> > +     case V4L2_CID_EXPOSURE:
> > +             ret = s5k5e8_write_reg(s5k5e8, S5K5E8_REG_EXPOSURE, 2, ctrl->val);
> > +     break;
> > +     case V4L2_CID_VBLANK:
> > +             ret = s5k5e8_write_reg(s5k5e8, S5K5E8_REG_VTS, 2,
> > +                                    s5k5e8->cur_mode->height + ctrl->val);
> > +     break;
> > +     case V4L2_CID_TEST_PATTERN:
> > +             ret = s5k5e8_write_reg(s5k5e8, S5K5E8_REG_TEST_PATTERN, 2, ctrl->val);
> > +     break;
>
> You could also make default case set ret to -EINVAL and unassign ret in
> declaration.
>
>
> > +     }
> > +     pm_runtime_put(s5k5e8->dev);
> > +     return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops s5k5e8_ctrl_ops = { .s_ctrl = s5k5e8_set_ctrl };
> > +static const char * const s5k5e8_test_pattern_menu[] = {
> > +     "Disabled",
> > +     "Solid Color",
> > +     "100% Color Bars",
> > +     "Fade to Grey",
> > +     "PN9",
> > +};
> > +
> > +static int s5k5e8_init_controls(struct s5k5e8 *s5k5e8)
> > +{
> > +     struct v4l2_fwnode_device_properties props;
> > +     struct v4l2_ctrl_handler *hdl = &s5k5e8->ctrl_handler;
> > +     s64 hblank = s5k5e8->cur_mode->hts_def - s5k5e8->cur_mode->width;
> > +     int ret = v4l2_ctrl_handler_init(hdl, 8);
>
> Please don't assign in declaration if you need to validate the result.
>
> > +
> > +     if (ret)
> > +             return ret;
> > +     hdl->lock = &s5k5e8->mutex;
>
> Please don't.
>
> > +     s5k5e8->link_freq = v4l2_ctrl_new_int_menu(hdl, &s5k5e8_ctrl_ops, V4L2_CID_LINK_FREQ,
> > +                                                0, 0, link_freq_menu_items);
> > +     if (s5k5e8->link_freq)
> > +             s5k5e8->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
> See e.g. ov05c10 driver for an example on initialising controls.
>
> > +     v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_PIXEL_RATE,
> > +                       S5K5E8_PIXEL_RATE, S5K5E8_PIXEL_RATE, 1, S5K5E8_PIXEL_RATE);
> > +     v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_VBLANK, 24,
> > +                       0x7fff - s5k5e8->cur_mode->height, 1, 24);
> > +     s5k5e8->hblank = v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_HBLANK, hblank,
> > +                                        hblank, 1, hblank);
> > +     if (s5k5e8->hblank)
> > +             s5k5e8->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +     v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_ANALOGUE_GAIN, 0x20, 0x200, 1, 0x60);
> > +     s5k5e8->exposure = v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_EXPOSURE, 4, 1964,
> > +                                          1, 1960);
> > +     v4l2_ctrl_new_std_menu_items(hdl, &s5k5e8_ctrl_ops, V4L2_CID_TEST_PATTERN, 4, 0, 0,
> > +                                  s5k5e8_test_pattern_menu);
> > +     if (hdl->error) {
> > +             ret = hdl->error;
> > +             goto err;
> > +     }
> > +     ret = v4l2_fwnode_device_parse(s5k5e8->dev, &props);
> > +     if (ret)
> > +             goto err;
> > +     ret = v4l2_ctrl_new_fwnode_properties(hdl, &s5k5e8_ctrl_ops, &props);
> > +     if (ret)
> > +             goto err;
> > +     s5k5e8->sd.ctrl_handler = hdl;
> > +     return 0;
> > +err:
> > +     v4l2_ctrl_handler_free(hdl);
> > +     return ret;
> > +}
> > +
> > +static void s5k5e8_update_pad_format(const struct s5k5e8_mode *mode,
> > +                                  struct v4l2_mbus_framefmt *fmt)
> > +{
> > +     fmt->width = mode->width;
> > +     fmt->height = mode->height;
> > +     fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> > +     fmt->field = V4L2_FIELD_NONE;
> > +     fmt->colorspace = V4L2_COLORSPACE_SRGB;
> > +     fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> > +     fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true, fmt->colorspace,
> > +                                                       fmt->ycbcr_enc);
> > +     fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> > +}
> > +
> > +static int s5k5e8_set_format(struct v4l2_subdev *sd,
> > +                          const struct v4l2_subdev_client_info *ci,
> > +                          struct v4l2_subdev_state *sd_state,
> > +                          struct v4l2_subdev_format *fmt)
> > +{
> > +     struct s5k5e8 *s5k5e8 = to_s5k5e8(sd);
> > +
> > +     if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && s5k5e8->streaming)
>
> You can use media_entity_is_streaming() I think.
>
> > +             return -EBUSY;
> > +
> > +     s5k5e8_update_pad_format(&default_mode, &fmt->format);
> > +     *v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> > +     if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > +             s5k5e8->cur_mode = &default_mode;
> > +
> > +     return 0;
> > +}
> > +
> > +static int s5k5e8_enum_mbus_code(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
> > +                              struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +     if (code->index > 0)
> > +             return -EINVAL;
> > +     code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> > +     return 0;
> > +}
> > +
> > +static int s5k5e8_enum_frame_size(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
> > +                               struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +     if (fse->index > 0 ||
> > +         fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
> > +             return -EINVAL;
> > +     fse->min_width = default_mode.width;
> > +     fse->max_width = default_mode.width;
> > +     fse->min_height = default_mode.height;
> > +     fse->max_height = default_mode.height;
> > +     return 0;
> > +}
> > +
> > +static int s5k5e8_set_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +     struct s5k5e8 *s5k5e8 = to_s5k5e8(sd);
> > +     int ret = 0;
> > +
>
> Instead, implement enable_streams and disable_streams pad ops.
>
> > +     mutex_lock(&s5k5e8->mutex);
> > +     if (s5k5e8->streaming == enable) {
> > +             mutex_unlock(&s5k5e8->mutex);
> > +             return 0;
> > +     }
> > +     if (enable) {
> > +             ret = pm_runtime_resume_and_get(s5k5e8->dev);
> > +             if (ret < 0)
> > +                     goto out;
> > +             ret = s5k5e8_write_regs(s5k5e8, s5k5e8_common_regs,
> > +                                     ARRAY_SIZE(s5k5e8_common_regs));
> > +             if (!ret)
> > +                     ret = s5k5e8_write_regs(s5k5e8, s5k5e8->cur_mode->regs,
> > +                                             s5k5e8->cur_mode->num_regs);
> > +             if (!ret)
> > +                     ret = __v4l2_ctrl_handler_setup(s5k5e8->sd.ctrl_handler);
> > +             if (!ret) {
> > +                     static const struct s5k5e8_reg stream_on_regs[] = {
> > +                             { 0x3c16, 0x00 },
> > +                             { 0x3c0d, 0x04 },
> > +                             { 0x0100, 0x01 },
> > +                             { 0x3c22, 0x00 },
> > +                             { 0x3c22, 0x00 },
> > +                             { 0x3c0d, 0x00 },
> > +                     };
> > +                     msleep(80);
> > +                     ret = s5k5e8_write_regs(s5k5e8, stream_on_regs,
> > +                                             ARRAY_SIZE(stream_on_regs));
> > +             }
> > +             if (ret) {
> > +                     pm_runtime_put(s5k5e8->dev);
> > +                     goto out;
> > +             }
> > +     } else {
> > +             s5k5e8_write_reg(s5k5e8, S5K5E8_REG_MODE_SELECT, 1, S5K5E8_MODE_STANDBY);
> > +             pm_runtime_put(s5k5e8->dev);
> > +     }
> > +     s5k5e8->streaming = enable;
> > +out:
> > +     mutex_unlock(&s5k5e8->mutex);
> > +     return ret;
> > +}
> > +
> > +static int s5k5e8_init_state(struct v4l2_subdev *sd,
> > +                          struct v4l2_subdev_state *sd_state)
> > +{
> > +     s5k5e8_update_pad_format(&default_mode,
> > +                              v4l2_subdev_state_get_format(sd_state, 0));
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops s5k5e8_video_ops = { .s_stream = s5k5e8_set_stream };
> > +
> > +static int s5k5e8_get_selection(struct v4l2_subdev *sd, const struct v4l2_subdev_client_info *ci,
> > +                             struct v4l2_subdev_state *sd_state,
> > +                             struct v4l2_subdev_selection *sel)
> > +{
> > +     switch (sel->target) {
> > +     case V4L2_SEL_TGT_CROP:
> > +     case V4L2_SEL_TGT_CROP_DEFAULT:
> > +     case V4L2_SEL_TGT_CROP_BOUNDS:
> > +     case V4L2_SEL_TGT_NATIVE_SIZE:
> > +             sel->r.left = 0;
> > +             sel->r.top = 0;
> > +             sel->r.width = 2592;
> > +             sel->r.height = 1944;
>
> Are you sure? It is uncommon the entire pixel array is readable.
>
> > +             return 0;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +
> > +static const struct v4l2_subdev_pad_ops s5k5e8_pad_ops = {
> > +     .get_selection = s5k5e8_get_selection,
> > +     .set_fmt = s5k5e8_set_format, .get_fmt = v4l2_subdev_get_fmt,
> > +     .enum_mbus_code = s5k5e8_enum_mbus_code, .enum_frame_size = s5k5e8_enum_frame_size,
>
> It seems a bit crowded here.
>
> > +};
> > +
> > +static const struct v4l2_subdev_ops s5k5e8_subdev_ops = {
> > +     .video = &s5k5e8_video_ops,
> > +     .pad = &s5k5e8_pad_ops,
> > +};
> > +
> > +static const struct media_entity_operations s5k5e8_entity_ops = {
> > +     .link_validate = v4l2_subdev_link_validate,
>
> Please do drop this one.
>
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops s5k5e8_internal_ops = {
> > +     .init_state = s5k5e8_init_state,
> > +};
> > +
> > +static int s5k5e8_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev = &client->dev;
> > +     struct fwnode_handle *endpoint;
> > +     struct v4l2_fwnode_endpoint ep_cfg = {
> > +             .bus_type = V4L2_MBUS_CSI2_DPHY,
> > +     };
> > +     struct s5k5e8 *s5k5e8;
> > +     u32 val = 0;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> > +     if (!endpoint)
> > +             return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
>
> Please remove this redundant check.
>
> > +
> > +     ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg);
> > +     fwnode_handle_put(endpoint);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to parse endpoint\n");
> > +
> > +     if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2 ||
> > +         ep_cfg.nr_of_link_frequencies != 1 ||
> > +         ep_cfg.link_frequencies[0] != S5K5E8_LINK_FREQ_418MHZ) {
>
> Instead of the latter two, can you use v4l2_link_freq_to_bitmap()?
>
> > +             v4l2_fwnode_endpoint_free(&ep_cfg);
> > +             return dev_err_probe(dev, -EINVAL, "unsupported CSI-2 configuration\n");
> > +     }
> > +     v4l2_fwnode_endpoint_free(&ep_cfg);
> > +
> > +     s5k5e8 = devm_kzalloc(dev, sizeof(*s5k5e8), GFP_KERNEL);
> > +     if (!s5k5e8)
> > +             return -ENOMEM;
> > +
> > +     s5k5e8->dev = dev;
> > +     v4l2_i2c_subdev_init(&s5k5e8->sd, client, &s5k5e8_subdev_ops);
> > +
> > +     s5k5e8->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
> > +     if (IS_ERR(s5k5e8->xvclk))
> > +             return dev_err_probe(dev, PTR_ERR(s5k5e8->xvclk), "failed to get xvclk\n");
> > +
> > +     if (clk_get_rate(s5k5e8->xvclk) != S5K5E8_XVCLK_FREQ)
> > +             return dev_err_probe(dev, -EINVAL, "unexpected xvclk rate\n");
> > +
> > +     s5k5e8->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>
> There are quite a few lines over 80 here, please wrap.
>
> > +     if (IS_ERR(s5k5e8->reset_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(s5k5e8->reset_gpio),
> > +                                  "failed to get reset gpio\n");
> > +
> > +     for (i = 0; i < S5K5E8_NUM_SUPPLIES; i++)
> > +             s5k5e8->supplies[i].supply = s5k5e8_supply_names[i];
> > +
> > +     ret = devm_regulator_bulk_get(dev, S5K5E8_NUM_SUPPLIES, s5k5e8->supplies);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to get regulators\n");
> > +
> > +     ret = s5k5e8_power_on(dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = s5k5e8_read_reg(s5k5e8, S5K5E8_CHIP_ID_REG, 2, &val);
> > +     if (ret || val != S5K5E8_CHIP_ID) {
> > +             ret = dev_err_probe(dev, ret ? ret : -ENODEV,
> > +                                 "failed to identify s5k5e8 (id=0x%x)\n", val);
> > +             goto err_power;
> > +     }
> > +
> > +     s5k5e8->cur_mode = &default_mode;
> > +     mutex_init(&s5k5e8->mutex);
> > +
> > +     ret = s5k5e8_init_controls(s5k5e8);
> > +     if (ret)
> > +             goto err_mutex;
> > +
> > +     s5k5e8->sd.internal_ops = &s5k5e8_internal_ops;
> > +     s5k5e8->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +     s5k5e8->sd.entity.ops = &s5k5e8_entity_ops;
> > +     s5k5e8->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +     s5k5e8->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +
> > +     ret = media_entity_pads_init(&s5k5e8->sd.entity, 1, &s5k5e8->pad);
> > +     if (ret)
> > +             goto err_ctrl;
> > +
> > +     s5k5e8->sd.state_lock = &s5k5e8->mutex;
> > +     ret = v4l2_subdev_init_finalize(&s5k5e8->sd);
> > +     if (ret)
> > +             goto err_media;
> > +
> > +     pm_runtime_set_active(dev);
> > +     pm_runtime_enable(dev);
> > +
> > +     ret = v4l2_async_register_subdev_sensor(&s5k5e8->sd);
> > +     if (ret)
> > +             goto err_subdev;
> > +
> > +     pm_runtime_idle(dev);
> > +     return 0;
> > +
> > +err_subdev:
> > +     pm_runtime_disable(dev);
> > +     pm_runtime_set_suspended(dev);
> > +     v4l2_subdev_cleanup(&s5k5e8->sd);
> > +err_media:
> > +     media_entity_cleanup(&s5k5e8->sd.entity);
> > +err_ctrl:
> > +     v4l2_ctrl_handler_free(s5k5e8->sd.ctrl_handler);
> > +err_mutex:
> > +     mutex_destroy(&s5k5e8->mutex);
>
> An extra newline before a label, please.
>
> > +err_power:
> > +     s5k5e8_power_off(dev);
> > +     return ret;
> > +}
> > +
> > +static void s5k5e8_remove(struct i2c_client *client)
> > +{
> > +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +     struct s5k5e8 *s5k5e8 = to_s5k5e8(sd);
> > +
> > +     v4l2_async_unregister_subdev(sd);
> > +     v4l2_subdev_cleanup(sd);
> > +     media_entity_cleanup(&sd->entity);
> > +     v4l2_ctrl_handler_free(sd->ctrl_handler);
> > +     mutex_destroy(&s5k5e8->mutex);
> > +     pm_runtime_disable(&client->dev);
> > +     if (!pm_runtime_status_suspended(&client->dev))
> > +             s5k5e8_power_off(&client->dev);
> > +     pm_runtime_set_suspended(&client->dev);
>
> Set the state to suspended conditionally, too.
>
> > +}
> > +
> > +static DEFINE_RUNTIME_DEV_PM_OPS(s5k5e8_pm_ops, s5k5e8_power_off, s5k5e8_power_on, NULL);
> > +
> > +static const struct of_device_id s5k5e8_of_match[] = {
> > +     { .compatible = "samsung,s5k5e8" },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, s5k5e8_of_match);
> > +
> > +static struct i2c_driver s5k5e8_i2c_driver = {
> > +     .driver = {
> > +             .name = "s5k5e8",
> > +             .pm = pm_ptr(&s5k5e8_pm_ops),
> > +             .of_match_table = s5k5e8_of_match,
> > +     },
> > +     .probe = s5k5e8_probe,
> > +     .remove = s5k5e8_remove,
> > +};
> > +
> > +module_i2c_driver(s5k5e8_i2c_driver);
> > +
> > +MODULE_DESCRIPTION("Samsung S5K5E8 5MP sensor driver");
> > +MODULE_LICENSE("GPL");
>
> --
> Regards,
>
> Sakari Ailus



-- 
Best regards,
Hikmah Gumelar
