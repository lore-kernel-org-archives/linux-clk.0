Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75643333429
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 02:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782095445; cv=none; b=t4mA+lETlNruauQzMXtHgcZ7T2nEkQKSUu2ttDObBgIfsobJiyWd+14MTTViFO73KkaDhCjR+ToQC0a4Gv13Kmcn6QrWAYNeU3DEmbUPo/5pot9isC5epVFBN0wzeDPqRnKFYHqYgG06pjTY6nN4LbHBg4TR9oDJ86XrjGnV2Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782095445; c=relaxed/simple;
	bh=ScO7RBq/KolPYjNRfRqcuR3AUL95RysnVAALa01G0/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUXqIsft7juKObUIWTFm/8MtE/WHmOvUt0xFVuYbKXozbzLIbiY3KRbh7AHr+5zmajVH2Sa2WpFx7q0n/GP3vhTxwA251BaXJnqzpeXIZqSbnz9JLEfdAawQd8/skqaBaO8rPwkjUvMfBdJf/MayLQo2JiwDTnYMVsnb+JDW0Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAtFS60Y; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAtFS60Y"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c3546924so28479345ad.3
        for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 19:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782095444; x=1782700244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ipKRVPzkC3/bLO3loiWzGU9J/nN5jU3SnxMn7jqpCwk=;
        b=MAtFS60YObAAfZAnwIUrnTfYtbd2b2l9RaVKdfvlGJvxkycReC2UgygiRnWnGBZM+U
         WdNJo5RGjCFuGEz1OQ1Z1y48mIhx5ObLDJAxxbmdLYKvo+pFwNLj+PN9PUqhjBMXub2x
         8Dd33BMNZ8cUMizDQsO1SktfNmmcuvSH1Yf48D9C+/wPlduw7F14+gh4aHpZ8y09mqSy
         4rDwzoSTB0L0QqVwITDaKo4fe9CXx866mWhxM0VddzMlSW3HcV5IhlPxTRO/CFqjCPGZ
         pg8nvQHjyJ99U4ChK7fN1MpJAy3sUbsOiWd1SuaEPQSNWWCpFgoJ9LaRHcT71Z93Ws7q
         AEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782095444; x=1782700244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipKRVPzkC3/bLO3loiWzGU9J/nN5jU3SnxMn7jqpCwk=;
        b=aZmM/OMT9gI4w+C637QQPB1ARRa51qArwBVSkEtDSZS6cUIWkMZKOZWn3WxpK9xQxP
         fmqZS3ftZFvrpCqFz8LNExJNjkaDfekVweaJ/82F/WZQ/ywsV+TuKqaOLsRNsTJe/BA7
         bVfe7EUJKTswnSbNwdCgl09mgjU1t3K5NlEMBwZM34SoWbn4ZXJa5/RiEQSwEvIYZD7Y
         C1naOTeQMraVRhsFXjKxSQy3LMkswuZMaR8wcvu1w+MOyRyAiQw4dW62mhPCgrYc5u+h
         JPMBGPQlpXf9eyZrY1qtLlmURynj0prHjfXWd2t3B2kBtsV4Wb4Xf4iVoVSx6zp6w59g
         dCfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsxkJ0UabhyKkJaZgzUzXjpqiqxYmhnl8KAYcer15WoNFlv7U4/6xvI/yoFiQxzGWs3FCfdcLlaQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwWpAVnMRCA1Z2J/w1RsCi50Gz5SrBxy20f709xq0cWb5FbJx9
	DC9ayhoodWmY1uGLtXB+Tts0OKIv5GO9qXyzlpjk8+e0swjDajfQT9+X
X-Gm-Gg: AfdE7cmoYA4Afp2lBnp9Zh5jcZBTeFU1XU2jb2Am4W3eZ0y2AiYI61NSFB6rBnwJnap
	T4eytB6Oc0OIIFJpy1CDKxKWnhTo8xnsC2qYxspce9sMF07uwOdZeWQaLGLsyJYSlPInu6s9ysQ
	Vxsq7+KCRfes7AgQu2QbENI13e1BhO5vEmIid4Il5IW7+q3LpziviyDWXDKMDvuW2FLutnvSFOJ
	l2N2DBsi1CdvISTsR3Kp/jHUWatRIYJHXsdgBMxW0kk73LVJCX2lNR3he919oNwFz3wh5HeZfQI
	NHcmlZiAxWdPe+nwQtIEe8ySzRyFbTLmrItp/D2fgSs709LjvU4w+ZNMbYcB0WDi1UVPL+e/tu1
	KbUvlJn2trYOk59Q6ZZLOO7fcRWV5G4o/WJdGZu/aONfzjgx6EwqVYCBMMFYuZHVFpjK4B4X5IN
	wlH4/H7849FcwwO2a0v9qYbYV3SXN7Sm7KijGMhDZIj/CbH32ZIxV2W9giOAaQxAH1Aw==
X-Received: by 2002:a17:903:b47:b0:2c6:a487:f431 with SMTP id d9443c01a7336-2c718fe2eb1mr137529215ad.23.1782095443621;
        Sun, 21 Jun 2026 19:30:43 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c742fdd411sm64398555ad.0.2026.06.21.19.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 19:30:43 -0700 (PDT)
Message-ID: <6d6dd8d0-292a-43f6-a94a-dedebe22c582@gmail.com>
Date: Mon, 22 Jun 2026 10:30:39 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] drm/verisilicon: add DC8000 (DCUltraLite) display
 controller support
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20260615065003.76661-1-a0987203069@gmail.com>
 <20260615065003.76661-5-a0987203069@gmail.com>
 <d5df0e9df3a9a68aae982f2fce830a4b10468476.camel@iscas.ac.cn>
 <df7363be-0e3f-4459-be4a-43ffb0a5366c@gmail.com>
 <0bb460aefb97e44cc0890a7841b8d217349143de.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <0bb460aefb97e44cc0890a7841b8d217349143de.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/18/2026 6:33 PM, Icenowy Zheng wrote:
> (CC'ed clk maintainers for weird clock gate bit)
>
> 在 2026-06-17三的 18:35 +0800，Joey Lu写道：
>> On 6/15/2026 4:51 PM, Icenowy Zheng wrote:
>>> 在 2026-06-15一的 14:50 +0800，Joey Lu写道：
>>>> The Nuvoton MA35D1 SoC integrates a Verisilicon DCUltraLite
>>>> display
>>>> controller whose register layout differs from the DC8200 in
>>>> several
>>>> important ways:
>>>>
>>>> 1. No CONFIG_EX commit path: framebuffer updates use the enable
>>>> (bit
>>>> 0)
>>>>      and reset (bit 4) bits in FB_CONFIG instead of the DC8200
>>>> staging
>>>>      registers (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT,
>>>>      FB_BLEND_CONFIG, PANEL_CONFIG_EX).
>>>>
>>>> 2. No PANEL_START register: panel output starts when
>>>>      PANEL_CONFIG.RUNNING is set; there is no multi-display sync
>>>> start
>>>>      register.
>>>>
>>>> 3. Different IRQ registers: DCUltraLite uses DISP_IRQ_STA
>>>> (0x147C) /
>>>>      DISP_IRQ_EN (0x1480) versus DC8200's TOP_IRQ_ACK (0x0010) /
>>>>      TOP_IRQ_EN (0x0014).
>>>>
>>>> 4. Per-frame commit cycle: DCUltraLite requires the VALID bit in
>>>>      FB_CONFIG to be set at the start of each atomic commit
>>>> (crtc_begin)
>>>>      and cleared after (crtc_flush).
>>>>
>>>> 5. Simpler clock topology: only 'core' (bus gate) and 'pix0'
>>>> (pixel
>>>>      divider) clocks; no axi or ahb clocks required.  Make axi_clk
>>>> and
>>>>      ahb_clk optional (devm_clk_get_optional_enabled) so DC8000
>>>> nodes
>>>>      without those clocks are handled gracefully.
>>>>
>>>> Add vs_dc8000.c implementing the vs_dc_funcs vtable for the above
>>>> differences.  The probe now selects vs_dc8000_funcs when the
>>>> identified
>>>> generation is VSDC_GEN_DC8000 (DCUltraLite reads model 0x0,
>>>> revision 0x5560, customer_id 0x305).
>>>>
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/verisilicon/Makefile    |  2 +-
>>>>    drivers/gpu/drm/verisilicon/vs_dc.c     |  9 ++-
>>>>    drivers/gpu/drm/verisilicon/vs_dc.h     |  1 +
>>>>    drivers/gpu/drm/verisilicon/vs_dc8000.c | 78
>>>> +++++++++++++++++++++++++
>>>>    4 files changed, 86 insertions(+), 4 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c
>>>>
>>>> diff --git a/drivers/gpu/drm/verisilicon/Makefile
>>>> b/drivers/gpu/drm/verisilicon/Makefile
>>>> index 9d4cd16452fa..d2fd8e4dff24 100644
>>>> --- a/drivers/gpu/drm/verisilicon/Makefile
>>>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>>>> @@ -1,6 +1,6 @@
>>>>    # SPDX-License-Identifier: GPL-2.0-only
>>>>    
>>>> -verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>>>> vs_drm.o vs_hwdb.o \
>>>> +verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>>>> vs_dc8000.o vs_drm.o vs_hwdb.o \
>>>>    	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
>>>>    
>>>>    obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>>>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>>>> index 9729b693d360..9499fffbca58 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
>>>> @@ -90,13 +90,13 @@ static int vs_dc_probe(struct platform_device
>>>> *pdev)
>>>>    		return PTR_ERR(dc->core_clk);
>>>>    	}
>>>>    
>>>> -	dc->axi_clk = devm_clk_get_enabled(dev, "axi");
>>>> +	dc->axi_clk = devm_clk_get_optional_enabled(dev, "axi");
>>>>    	if (IS_ERR(dc->axi_clk)) {
>>>>    		dev_err(dev, "can't get axi clock\n");
>>>>    		return PTR_ERR(dc->axi_clk);
>>>>    	}
>>>>    
>>>> -	dc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
>>>> +	dc->ahb_clk = devm_clk_get_optional_enabled(dev, "ahb");
>>> Please make the clock change a separated patch for atomicity.
>>>
>>> BTW the MA35D1 manual's clock tree shows that DCUltra appears on
>>> AXI2
>>> ACLK, AHB_HCLK2, behind a mux of SYS-PLL/EPLL-DIV2 (which seems to
>>> be
>>> the core clock), and behind a divider (which seems to be the pixel
>>> clock).
>>>
>>> However it's weird that only one DCUltra Clock Enable Bit exists
>>> despite both bus clocks have "ICG" (I think it means "Integrated
>>> Clock
>>> Gating"). In addition the linux clk-ma35d1 driver assigns
>>> "dcu_gate" as
>>> a downstream of "dcu_mux", although the Figure 6.5-2 in the TRM
>>> shows
>>> no ICG after the "Display core CLK" mux.
>>>
>>> Is the two bus clocks controlled by a single gate bit, and is the
>>> bit
>>> also gating DC core clock?
>>>
>>> Thanks,
>>> Icenowy
>> I will split the axi/ahb optional-clock change into its own patch in
>> v5
>> for atomicity.
>> Regarding the MA35D1 clock tree: from the TRM, the single "dcu_gate"
>> bit
>> gates both bus clocks (AXI ACLK and AHB HCLK) together with the
>> display
>> core clock through the same ICG cell. The clk-ma35d1 driver exposes
>> only
>> "dcu_gate" (downstream of "dcu_mux") and does not provide separate
> Then it's one of the case that the clock tree doesn't properly
> represent the hardware, which is bad. However, as three gates share the
> same bit, I am not sure how to represent such kind of thing in the
> common clk framework.
>
>> axi/ahb clock entries. Therefore the MA35D1 DT binding will use only
>> two
>> clocks ("core" and "pix0"); making axi and ahb optional in the driver
>> is the correct approach, and this will be stated clearly in the
>>   split-out patch.
> I agree to make them optional, although these two clocks do exist in
> the hardware of MA35D1.
>
> Thanks,
> Icenowy
As mentioned in the DT binding reply, the absence of separate AXI/AHB 
clock entries for DCU in clk driver is due to the hardware design 
constraint of a single shared enable bit, not a driver oversight. In v5, 
the axi and ahb clock fetches in `vs_dc_probe` will be split into their 
own patch and made optional via `devm_clk_get_optional_enabled`, with a 
comment explaining that on MA35D1 the AXI and AHB bus clocks share the 
single `dcu_gate` enable bit and are therefore not separately exposed by 
the clock driver.
>>>>    	if (IS_ERR(dc->ahb_clk)) {
>>>>    		dev_err(dev, "can't get ahb clock\n");
>>>>    		return PTR_ERR(dc->ahb_clk);
