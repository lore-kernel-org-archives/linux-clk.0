Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F0B1A29A
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742736227; cv=none; b=hHnwx7oZhNR03pgg+6zrrvjJezANEL8zuq81d81bOCKgqUqOnYaLxkqCDTxQB8XUQCT1Oxrdb8q2HN7rqCKpz2Wyt+2loorPupNA23w++om1D403E76yxwHGUk1LnoRKzhOEyeXjR6VG2t8r3fc0ZUNmxT4Z7XjRV8ooBnlVZ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742736227; c=relaxed/simple;
	bh=iIeLJ+9CJr5/8YiOgnNM4Q7aRK/g1TCtMV0NioQugdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HG6zPShs6KAefgbO6Kn4rfcKbew67MJhyvWjUgte7kY9iT6SyohRR5Vw5qzJWnJF9dYu30miNSvgpVwGWchbh2/TQsuqk5QyvfBbPxQx8PggxlFo7279nCQdDxOyse6jfLvFdu1XH7TtuPsFV4QWuh51+xFQmYMD1c/QF83IGqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1D+YU7hL; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1D+YU7hL"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85e14ce87ceso104329039f.1
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742736225; x=1743341025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTnereCUToCBjbpym0YZFtNwg1Scl5evNKMBH+DpSTo=;
        b=1D+YU7hLgduxfZmMMliGx3FfZCNlxf8Zwxqx5QQWDKVpQO/SGGWNr744S0Op8gEuZT
         zMBoZxmrDntFL1LT/NiMtS5bOku0bKl79kr8D+EGgnZsPoD+ksUxeBJGxds2b1KTDQ4u
         KXC1HPpYrtpuHBxWbxlvklbeFcDyrckIlqBLYUosJL+HCs2c+gHz4p7YQXHoCmzB4I65
         iHNPAPu1qBAeta97JN82SrqJ8zmsQPbLFLbsLf+TJ0MRMjsqFA4Z72f3ZhnRK2evbHO0
         r4SBQljNwZ5xRXv83qx1HUGNEeSdFium+KF2O31IXWVrJHuqWDTdGxZkXEwDmTv7FqYa
         g+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742736225; x=1743341025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTnereCUToCBjbpym0YZFtNwg1Scl5evNKMBH+DpSTo=;
        b=llcy2L1QnYZIiTIsnGJ0iGL5kIg44tEqLXdhj4Rv3UuTPvQME/Cw89u2E/ADMz0KZ9
         mmGGevvWGaPzcIuqN0mULx3cO7YyR302FWKqfaBJvX+/ylohYFmw3EQUj5CCci+atljU
         TJ/VQk4C+BVP4egVDP+c8VPcBibYApVsCTvW+dwGq81CKCFviF/p5wnk8ZNESYZqHlXi
         QDOtrJvRPgJTVHtsRvrYRh3NPqohrZh8NWAc8w9r1/HLCcSdrJPrkxRes1UpFvsdFl1s
         hxCUWq3MNc0Ytqu0XmlVx1Ouixw5DNnQOO4IJF1HVLEjoYg7qHUUINJOntz1nXw9CHg+
         wrMA==
X-Forwarded-Encrypted: i=1; AJvYcCXXTaacRkdqWfpFYeHviEKX/TtlihOf2UixCuEK1WMfAo2y5Q8Qi3mFRXBqgXNnnISKzaMvhgycBgM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsv08FCLCDCPt1A2Vx3xzlPtUWxCKfChtTPzoVLK2KMTHSkgJL
	ROUhIFhGuz8cKbsErisyVKhV0EPrqTFDOi25e0fnkVfAZ3YV0f4iQSTbVGqNrWA=
X-Gm-Gg: ASbGncucd6lrvTO06IqmVhbgmBQzDMyVRSWFUXcM7LiRReTYVujGsn1n+7Wgq8AjzO7
	J+qMolmXLPHIK7Wf1lkCghARC9pklNI9LvMhl4YeHaAbEn54ACiGzKi/8+SpSZ7B3kXOqB/aFYF
	Fcay0GPmzjPB9L5+ydnMq3Nlns+KGyT5bMMAr1NVY8XM0A0EDuyKZid1t8XpJmlyRoDue/OOwUC
	SCW3pVwzMKCzJK56aKndNz4WYrTxtHrOCEZ4ncon7hwqJJaxD3EK63wFnLMbAxprguYMN10Chwc
	6kCqOZP9rkwDA6/l4OOtiZq9IJrkGRc//66qJPs8mQiFRroDvXFk55BDq4zi21zpdmLXY5zMBdl
	DNwDNfHeu8oFJik5vcA==
X-Google-Smtp-Source: AGHT+IEyiEr0s0I0JWc39bQgGyyEOgsa8Hq3iEeguBlRcgoHvfxYc8cWRzvc6IC340C/Y3c8KTlAwQ==
X-Received: by 2002:a05:6602:4a03:b0:85b:41cc:264e with SMTP id ca18e2360f4ac-85e2bf076c2mr785677539f.6.1742736225099;
        Sun, 23 Mar 2025 06:23:45 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bc13d74sm125798039f.11.2025.03.23.06.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 06:23:44 -0700 (PDT)
Message-ID: <c080eb55-943e-4564-8dcc-dd5f27b296a9@riscstar.com>
Date: Sun, 23 Mar 2025 08:23:43 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 6/7] clk: spacemit: define new syscons with only
 resets
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-7-elder@riscstar.com> <20250322164247-GYD11633@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250322164247-GYD11633@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/22/25 11:42 AM, Yixun Lan wrote:
> Hi Alex:
> 
> It occur to me it's a little odd to implemnt reset driver
> for RCPU block, but after check with vendor the RCPU region can
> be accessed both by ACPU and RCPU, then I'm fine with this.

I implemented just the resets that were found in the downstream
code.

I first implemented a separate reset driver, very simple, which
only implemented the resets.  I had a separate DTS binding (like
was done for the PLLs).  I was ready to post it for review, then
noticed that the registers used were shared with clocks.  So I
merged all of that separate code into the clock driver, as you
see here.

> ACPU - RISC-V Main CPU, with mmu, running Linux
> RCPU - real time CPU, without mmu, running RT-OS

I didn't realize there was a separate CPU running its
own OS.  Is this managed as a remoteproc by the RISC-V AP?
The reset signals, I hope, are only touched by the AP
and not the real-time CPU.  Can you provide any further
information about this?

> On 10:18 Fri 21 Mar     , Alex Elder wrote:
>> Enable support for three additional syscon CCUs which support reset
>> controls but no clocks:  ARCPU, RCPU2, and APBC2.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 106 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 106 insertions(+)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 17e321c25959a..bf5a3e2048619 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -130,6 +130,37 @@
>>   #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>>   #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
>>   
>> +/* RCPU register offsets */
>> +#define RCPU_SSP0_CLK_RST		0x0028
>> +#define RCPU_I2C0_CLK_RST		0x0030
>> +#define RCPU_UART1_CLK_RST		0x003c
>> +#define RCPU_CAN_CLK_RST		0x0048
>> +#define RCPU_IR_CLK_RST			0x004c
>> +#define RCPU_UART0_CLK_RST		0x00d8
>> +/* XXX Next one is part of the AUD_AUDCLOCK region @ 0xc0882000 */
> this comment looks odd, XXX?

Yeah, I meant to remove that before sending but I forgot.

The downstream code treats this one register as being
part of the RCPU memory region, and extends that region
to be 0x2048 bytes to "fit" it.

The hardware documentation actually defines a different
"RCPU Audio Clock" memory region, and it might be more
correct (though less convenient) to define that as a
distinct region of memory.

What do you think?

					-Alex

>> +#define AUDIO_HDMI_CLK_CTRL		0x2044
>> +
>> +/* RCPU2 register offsets */
>> +#define RCPU2_PWM0_CLK_RST		0x0000
>> +#define RCPU2_PWM1_CLK_RST		0x0004
>> +#define RCPU2_PWM2_CLK_RST		0x0008
>> +#define RCPU2_PWM3_CLK_RST		0x000c
>> +#define RCPU2_PWM4_CLK_RST		0x0010
>> +#define RCPU2_PWM5_CLK_RST		0x0014
>> +#define RCPU2_PWM6_CLK_RST		0x0018
>> +#define RCPU2_PWM7_CLK_RST		0x001c
>> +#define RCPU2_PWM8_CLK_RST		0x0020
>> +#define RCPU2_PWM9_CLK_RST		0x0024
>> +
>> +/* APBC2 register offsets */
>> +#define APBC2_UART1_CLK_RST		0x0000
>> +#define APBC2_SSP2_CLK_RST		0x0004
>> +#define APBC2_TWSI3_CLK_RST		0x0008
>> +#define APBC2_RTC_CLK_RST		0x000c
>> +#define APBC2_TIMERS0_CLK_RST		0x0010
>> +#define APBC2_KPC_CLK_RST		0x0014
>> +#define APBC2_GPIO_CLK_RST		0x001c
>> +
>>   struct spacemit_ccu_clk {
>>   	int id;
>>   	struct clk_hw *hw;
>> @@ -1781,6 +1812,69 @@ static const struct k1_ccu_data k1_ccu_apmu_data = {
>>   	.rst_data	= &apmu_reset_controller_data,
>>   };
>>   
>> +static const struct ccu_reset_data rcpu_reset_data[] = {
>> +	[RST_RCPU_SSP0]		= RST_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
>> +	[RST_RCPU_I2C0]		= RST_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
>> +	[RST_RCPU_UART1]	= RST_DATA(RCPU_UART1_CLK_RST,	0, BIT(0)),
>> +	[RST_RCPU_IR]		= RST_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
>> +	[RST_RCPU_CAN]		= RST_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
>> +	[RST_RCPU_UART0]	= RST_DATA(RCPU_UART0_CLK_RST,	0, BIT(0)),
>> +	[RST_RCPU_HDMI_AUDIO]	= RST_DATA(AUDIO_HDMI_CLK_CTRL,	0, BIT(0)),
>> +};
>> +
>> +static const struct ccu_reset_controller_data rcpu_reset_controller_data = {
>> +	.count		= ARRAY_SIZE(rcpu_reset_data),
>> +	.data		= rcpu_reset_data,
>> +};
>> +
>> +static struct k1_ccu_data k1_ccu_rcpu_data = {
>> +	/* No clocks in the RCPU CCU */
>> +	.rst_data	= &rcpu_reset_controller_data,
>> +};
>> +
>> +static const struct ccu_reset_data rcpu2_reset_data[] = {
>> +	[RST_RCPU2_PWM0]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM1]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM2]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM3]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM4]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM5]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM6]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM7]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM8]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM9]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +};
>> +
>> +static const struct ccu_reset_controller_data rcpu2_reset_controller_data = {
>> +	.count		= ARRAY_SIZE(rcpu2_reset_data),
>> +	.data		= rcpu2_reset_data,
>> +};
>> +
>> +static struct k1_ccu_data k1_ccu_rcpu2_data = {
>> +	/* No clocks in the RCPU2 CCU */
>> +	.rst_data	= &rcpu2_reset_controller_data,
>> +};
>> +
>> +static const struct ccu_reset_data apbc2_reset_data[] = {
>> +	[RST_APBC2_UART1]	= RST_DATA(APBC2_UART1_CLK_RST,	BIT(2), (0)),
>> +	[RST_APBC2_SSP2]	= RST_DATA(APBC2_SSP2_CLK_RST,	BIT(2), (0)),
>> +	[RST_APBC2_TWSI3]	= RST_DATA(APBC2_TWSI3_CLK_RST,	BIT(2), (0)),
>> +	[RST_APBC2_RTC]		= RST_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
>> +	[RST_APBC2_TIMERS0]	= RST_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)),
>> +	[RST_APBC2_KPC]		= RST_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
>> +	[RST_APBC2_GPIO]	= RST_DATA(APBC2_GPIO_CLK_RST,	BIT(2), (0)),
>> +};
>> +
>> +static const struct ccu_reset_controller_data apbc2_reset_controller_data = {
>> +	.count		= ARRAY_SIZE(apbc2_reset_data),
>> +	.data		= apbc2_reset_data,
>> +};
>> +
>> +static struct k1_ccu_data k1_ccu_apbc2_data = {
>> +	/* No clocks in the RCPU2 CCU */
>> +	.rst_data	= &apbc2_reset_controller_data,
>> +};
>> +
>>   static struct ccu_reset_controller *
>>   rcdev_to_controller(struct reset_controller_dev *rcdev)
>>   {
>> @@ -1959,6 +2053,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
>>   		.compatible	= "spacemit,k1-syscon-apmu",
>>   		.data		= &k1_ccu_apmu_data,
>>   	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-rcpu",
>> +		.data		= &k1_ccu_rcpu_data,
>> +	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-rcpu2",
>> +		.data		= &k1_ccu_rcpu2_data,
>> +	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-apbc2",
>> +		.data		= &k1_ccu_apbc2_data,
>> +	},
>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
>> -- 
>> 2.43.0
>>
> 

