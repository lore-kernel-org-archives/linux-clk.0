Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A812797A5
	for <linux-clk@vger.kernel.org>; Tue, 15 Apr 2025 11:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716823; cv=none; b=UlIgLOFopZS6mhE0GuJAAEVEyzCPPxgaBr+ABVhIHjvbIyaDpoKUqCidu76FT3m8xA+rqHiaTWyxGF91m7BQH1dOfuOQjOjDHRGTzTiT9/T1XfFhLV2OHcdUoO1WCr+ke3OBBimSW2ew7cHtJ3qX20ZTjRtR81rYF/UIht41UQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716823; c=relaxed/simple;
	bh=r2wFSvAGdnijWNUAAafq0qFsek3liCAmo5FEP4Sjric=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXr6juTEdRbuRdgrN/Ql07dd5odKHV6GcY+ZEpoL4rNB9VKCpwoPov3VnXvRqosn8EsvpUozWICl8lm2hY+sG7AbFOKSPJeclpNGqzlmim4TfbAARM+DoqB9OAD7Jl9Oo2doFSF/6uYtzDsEn7o65ZXP0zrMAejzGBT9g5MS6zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tYITBGxX; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tYITBGxX"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-8613f456960so155078139f.1
        for <linux-clk@vger.kernel.org>; Tue, 15 Apr 2025 04:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744716820; x=1745321620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BEN8NSjUS40oEvDS4Uv025vPGmuL5XNuea1dSWlYY68=;
        b=tYITBGxXhIwJf5FvnB8zQu5W3dCB42l3H7+isYk0MGZQUBJ2Owtvbs9qWYW2VlRw5i
         Wz8WDE8hFkLgNl4Ffl2wGs1rxFpeaCyssed0CHPL5OymMJk0RUmevZPNCJmVpHFq9gLm
         cfrXxnsjT/p33C060iEG5+lYD9ZjqW9waqi5P709hToSiq4fKF+ucySqwTUgwOjgyMdk
         9UBfiZcNas8ixHIloSr7ynH2H0mhcK1VWASeZ1AxlSHFL3XuTFbskF1JvBjldvWvNh0v
         PX9/A/VCjRRYv60X6L2SZXGtPY9V0nBWzuiDQJBDdiN5x5qR3Ln1ZxEOqLu99DStZONj
         E4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744716820; x=1745321620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BEN8NSjUS40oEvDS4Uv025vPGmuL5XNuea1dSWlYY68=;
        b=W4cnCr573xWS4Xnapw+GKXJsb55Eq6sbHhoHQkqIwl0vKZ8OuQHxrQt/qRyluOAO4L
         2jcHZDegtVh2z9p6gFi288urlA3RqNN9e5PFgxd2M05R+payB/40MUKefGkWuTSIG5XM
         GQHy7l7VjdsSQDVLVX23GNI0c4Fm3GLH2A60esIIR9mK7AepsHI47F9i6ggu8wPsTrO5
         C/OLXtfDY5oCYfQX1ZtpskFxeaGW5Ju93U61fP4JYr8UWrFfwuoBx8AOf8L2d7tGrU8R
         seRR64wncbeNSVbbaQ+YNvU5xY9A1tsWA0XGcgTrWdfkwr6KpTIu0MRb2T+HmCChP/a/
         wjdw==
X-Forwarded-Encrypted: i=1; AJvYcCU7n38tzWF3sIARf6K0BR6qCqVkhshB94ftCd40AddyErEXxk+SBiIMFHhQiA+5F5KWx98ImXJKiKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWDgjm8GU55MNJkJZUoSVQVep8N5uderof/9bPuhbpemN6X/P9
	ssvo1kx7zsJpfbKl+2AQU6s8Zic4aNpptEevsoQ+n/tW0blJ1DaiAdDk4Wbz6M4=
X-Gm-Gg: ASbGncvKTk4RcCXjmWPQ64QF+FItZx4CnnSCIRG4CInYl/zi4tETSxaHi1/LmtqRnGU
	XV/TjMrPXrXqzxe63Qei7i1c3JzLrujhgDL1rnJAZxHGVDhCvhBtKGvFZwQdMN0dboOlCR1gZg7
	oGllwtlCC0IENRpsu2YwAg4F27YmaiD7qKdLHH43O1+AIYIMXN4t9W0PPEbuISob0MbtgLvjGsQ
	sCmE+vhvt6PgbABR9P+b4nRdpzagiI26Ei0KDPFmWgjIcwRzjwtLDrF15QWLmdz0dY6+o3Rezyi
	aYJN6JL/AEwo4ps/P/i0GMTVN+8JQa9HzcwpuNNcu4xMCEDHe8LnlSOS+lUdm6ACmQrjCLUgjya
	JSgQ8
X-Google-Smtp-Source: AGHT+IFKkxJRsXzR7nky7WLvCENHLBsur2OzCblaH3VpEQ3uFHRRX61ZERpvrmJSp4XMt/JAkHbCEg==
X-Received: by 2002:a05:6602:3785:b0:85e:201e:3e35 with SMTP id ca18e2360f4ac-8617cb61445mr1651925539f.3.1744716820321;
        Tue, 15 Apr 2025 04:33:40 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-861656e18b2sm251622939f.45.2025.04.15.04.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 04:33:39 -0700 (PDT)
Message-ID: <fa4ae3d7-7683-4205-a36b-3bda3ac177c9@riscstar.com>
Date: Tue, 15 Apr 2025 06:33:38 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] clk: spacemit: define new syscons with only resets
To: Philipp Zabel <p.zabel@pengutronix.de>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, guodong@riscstar.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250414191715.2264758-1-elder@riscstar.com>
 <20250414191715.2264758-7-elder@riscstar.com>
 <eee41968ecb0c16da214819b9a43e9dd881fcf13.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <eee41968ecb0c16da214819b9a43e9dd881fcf13.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 3:22 AM, Philipp Zabel wrote:
> On Mo, 2025-04-14 at 14:17 -0500, Alex Elder wrote:
>> Enable support for three additional syscon CCUs which support reset
>> controls but no clocks:  ARCPU, RCPU2, and APBC2.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>

You are correct that those reset-only CCUs could have
their spacemit_ccu_data be const.

I'm going to give this series a little more time for
review but I'll gladly submit v5 with the added const
qualifier in those places.

Thanks.

					-Alex

>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 7494c97c3c7ec..cd1a0668bd203 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -130,6 +130,36 @@
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
>>   struct ccu_reset_data {
>>   	u32 offset;
>>   	u32 assert_mask;
>> @@ -1177,6 +1207,57 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
>>   	.reset_num	= ARRAY_SIZE(apmu_reset_data),
>>   };
>>   
>> +static const struct ccu_reset_data rcpu_reset_data[] = {
>> +	[RESET_RCPU_SSP0]	= RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_I2C0]	= RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_UART1]	= RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
>> +	[RESET_RCPU_IR]		= RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_CAN]	= RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_UART0]	= RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
>> +	[RESET_RCPU_HDMI_AUDIO]	= RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
>> +};
>> +
>> +static struct spacemit_ccu_data k1_ccu_rcpu_data = {
> 
> Could be const.
> 
>> +	/* No clocks in the RCPU CCU */
>> +	.reset_data	= rcpu_reset_data,
>> +	.reset_num	= ARRAY_SIZE(rcpu_reset_data),
>> +};
>> +
>> +static const struct ccu_reset_data rcpu2_reset_data[] = {
>> +	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +};
>> +
>> +static struct spacemit_ccu_data k1_ccu_rcpu2_data = {
> 
> const
> 
>> +	/* No clocks in the RCPU2 CCU */
>> +	.reset_data	= rcpu2_reset_data,
>> +	.reset_num	= ARRAY_SIZE(rcpu2_reset_data),
>> +};
>> +
>> +static const struct ccu_reset_data apbc2_reset_data[] = {
>> +	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
>> +	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
>> +	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), (0)),
> 
> Superfluous parentheses.
> 
>> +};
>> +
>> +static struct spacemit_ccu_data k1_ccu_apbc2_data = {
> 
> const
> 
>> +	/* No clocks in the APBC2 CCU */
>> +	.reset_data	= apbc2_reset_data,
>> +	.reset_num	= ARRAY_SIZE(apbc2_reset_data),
>> +};
>> +
>>   static int spacemit_reset_update(struct reset_controller_dev *rcdev,
>>   				 unsigned long id, bool assert)
>>   {
>> @@ -1351,6 +1432,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
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
> 
> regards
> Philipp

