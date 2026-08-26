Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E3248035F
	for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 20:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787774701; cv=none; b=KgXiGMdOP7UJvtZwrlyk3fmXQMHaXpOWL4DN6MoZae8PicYlhjnQXZq4zc414X00VH1xVtf6coGdDYsg80Pcj7VRnHSAaPD4vNgV0UPnIFvst1aS41+5wIaJquzUZeMmMxdiCecJqn8oCTu1Xj29vBDRYK7Zowu2d8QEpTg9Ka4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787774701; c=relaxed/simple;
	bh=lwElOIU6l9yhRCfYIK0BHfaPZ3F3WCrmTBLyvrsXJck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qz0Z/p7qV8Skw/HJQsIZup+qccamGT3qzCK61L8eC6lfGAGdrjZxbj+Ppy1yUiD/YY+8ynolqIcHeu4S7I7YNyn1dWDsZwixshoDNhDf24h1Bj11K46cdo8d5wf48Ei1+REPY8uAC8MberfZTi6GPeCWqOoqxqeGiFi0+1juTic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b966dd74so6638775e9.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 13:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787774688; x=1788379488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqltKglBedGMune1iOvieoStWiRDAaU03/Ap5YDSFbs=;
        b=YQjX9+FdxDnsbiZhMkHspDl1m52gIuw1Ktz/+DSKeHhH2ZXNt0Egt8kSfYPNewaTxL
         xxy7X6BHjRhtv+B9gKgbqU6fwRoNg2ggcOBFwiNKL6/tyxgR9nDSGQ75D4aI52W7kJIJ
         8i7J9+1PDqacBPjL72lskq38wvwPYKuwRIpZsRGGLT+91AEoO02kSX6aImwjLkSYU0fA
         ONgNZgs5sr4bVlmwzrSKo+fKTR5eHbsCBb598vCOk9GFm/pMCGBzd3Oh93oYmFnVilFe
         TN5MfQ0TnxgNiK4FOtnVoymCZbZQmXhq099uMbDdQOMOmggjphuRZgM+/CKPhpCTdUmf
         uh9g==
X-Forwarded-Encrypted: i=1; AHgh+RpK3k7opmG+wDSDY1jve5vrWA9F7C90JdmcsYHlVzBptt/QMch8VXNCQ2F7RfspasD5omTzn6EwlZg=@vger.kernel.org
X-Gm-Message-State: AFuF++mNK3dPqJi9aOQGxBOprJ6F9azUddyl5hCKhq7w3GGgnnKcMwxB
	bqCZVvpH7f7IFIyTVRrW0Oiu+uQIb1T807xcgcvUuJdvrn5lq4HPVFI5
X-Gm-Gg: AR+sD13yRX2HnVaMIyw0mLHvd8tUSfGqcsuxV2M88RKSHrG8pnoxTFtslQsRcaKWgcK
	XZk6E95vcazInN20YWpdHLhbnUVERxs1HDqXNCB7GwxCgQd6RTT4+f3i9ieKYwB19ZQtxEndqmZ
	VJ8OGJr1HK+Makd1mLxoWzju5FOcUysK3vQFBz+UHUgNMsThyJnNVUmDHGDGX+4mL3fA70zeMa/
	xVTj7RUYgvozVo9PjhOlE1w7GL6G/fz+/zOoT5Dfh8BGKfqI9nX3veRjQrzFuz8b4uPzGzL99UG
	tYf92Mq9b8D7WmF48JpzY/PUK9ZJupL8BNcj4WtGgye7vWZPM3tWDTb4b8auDbh1TSJig9Ds6ou
	qlNtrX+/iBaw+m7gTKsxvm8czd6IyBTtdC+wmjDXaVD8JaPy6b82azeVfsSGXxyxsWK4VSV7bzb
	ibfl68WBX5pqEym/dGVY9PeaeC4yY1w6vbwvR2tSAkoRXwTyLJ5/UgHt/uG8QmgFbR74gOTg25L
	JSh0rzLso7ma23IfsanWA==
X-Received: by 2002:a05:600c:3112:b0:499:db6e:40a5 with SMTP id 5b1f17b1804b1-499dc6fba17mr83121845e9.4.1787774687928;
        Wed, 26 Aug 2026 13:04:47 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499e7170b72sm22537845e9.0.2026.08.26.13.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 13:04:47 -0700 (PDT)
Message-ID: <5ac071a6-8013-4143-9f59-7d0c6cad5c00@linux.com>
Date: Wed, 26 Aug 2026 21:04:44 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
To: Brian Masney <bmasney@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
 <aoxjX3HabY0brgXk@redhat.com>
 <57d796bd-7a3c-46b9-bd65-d6860adbd355@linux.com>
 <72db2062-e0ac-4c33-b1d1-d1fa5ae4bec8@linux.com>
 <ao8fqstEs01hd3--@redhat.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <ao8fqstEs01hd3--@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/08/2026 18:17, Brian Masney wrote:
> Hi Lucas,
> 
> On Wed, Aug 26, 2026 at 05:42:01PM +0100, Lucas Tanure wrote:
>> With Brian's patches, VIM4 does not turn off 4 clocks:
>>
>> t7_sys_sd_emmc_b
>> t7_sys_sd_emmc_c
>> sd_emmc_b
>> sd_emmc_c
>>
>> This is expected since I'm trying to run from an SD card. However, even with
>> these four clocks kept enabled, the board still hangs.
>>
>> Complete list with all clocks being disabled after Brians patches:
>> [    1.002247] clk: Disabled unused clock: t7_sys_pwm_ao_gh
>> [    1.002898] clk: Disabled unused clock: t7_sys_pwm_ao_ef
>> [    1.003560] clk: Disabled unused clock: t7_sys_pwm_ao_cd
>> [    1.004220] clk: Disabled unused clock: t7_sys_pwm_ao_ab
>> [    1.004972] clk: Disabled unused clock: t7_sys_pwm_ef
>> [    1.005509] clk: Disabled unused clock: t7_sys_pwm_cd
>> [    1.006211] clk: Disabled unused clock: t7_sys_pwm_ab
>> [    1.006766] clk: Disabled unused clock: t7_sys_ts_hevc
>> [    1.007434] clk: Disabled unused clock: t7_sys_ts_vpu
>> [    1.008033] clk: Disabled unused clock: t7_sys_ts_nna
>> [    1.008741] clk: Disabled unused clock: t7_sys_ts_gpu
>> [    1.009294] clk: Disabled unused clock: t7_sys_sar_adc
>> [    1.009929] clk: Disabled unused clock: t7_sys_vpu_intr
>> [    1.010609] clk: Disabled unused clock: t7_sys_dspb
>> [    1.011186] clk: Disabled unused clock: t7_sys_dspa
>> [    1.011792] clk: Disabled unused clock: t7_sys_a73pclk_apb
>> [    1.012554] clk: Disabled unused clock: t7_sys_pclk_sys_apb
>> [    1.013213] clk: Disabled unused clock: t7_sys_rsa
>> [    1.013811] clk: Disabled unused clock: t7_sys_mipi_isp_pclk
>> [    1.014529] clk: Disabled unused clock: t7_sys_mmc_apb
>> [    1.015107] clk: Disabled unused clock: t7_sys_hdmirx_pclk
>> [    1.015819] clk: Disabled unused clock: t7_sys_i2c_s_a
>> [    1.016429] clk: Disabled unused clock: t7_sys_hdmitx_apb
>> [    1.017109] clk: Disabled unused clock: t7_sys_i2c_m_f
>> [    1.017740] clk: Disabled unused clock: t7_sys_i2c_m_e
>> [    1.018379] clk: Disabled unused clock: t7_sys_i2c_m_d
>> [    1.019018] clk: Disabled unused clock: t7_sys_i2c_m_c
>> [    1.019657] clk: Disabled unused clock: t7_sys_i2c_m_b
>> [    1.020296] clk: Disabled unused clock: t7_sys_i2c_m_a
>> [    1.020940] clk: Disabled unused clock: t7_sys_i2c_ao_b
>> [    1.021585] clk: Disabled unused clock: t7_sys_i2c_ao_a
>> [    1.022236] clk: Disabled unused clock: t7_sys_pcie_phy
>> [    1.022885] clk: Disabled unused clock: t7_sys_usb
>> [    1.023482] clk: Disabled unused clock: t7_sys_pcie
>> [    1.024088] clk: Disabled unused clock: t7_sys_spicc1
>> [    1.024723] clk: Disabled unused clock: t7_sys_spicc0
>> [    1.025345] clk: Disabled unused clock: t7_sys_g2d
>> [    1.025940] clk: Disabled unused clock: t7_sys_spicc5
>> [    1.026569] clk: Disabled unused clock: t7_sys_ts_a53
>> [    1.027197] clk: Disabled unused clock: t7_sys_ts_a73
>> [    1.027825] clk: Disabled unused clock: t7_sys_spicc4
>> [    1.028454] clk: Disabled unused clock: t7_sys_spicc3
>> [    1.029085] clk: Disabled unused clock: t7_sys_spicc2
>> [    1.029710] clk: Disabled unused clock: t7_sys_aififo
>> [    1.030339] clk: Disabled unused clock: t7_sys_uart_f
>> [    1.030967] clk: Disabled unused clock: t7_sys_uart_e
>> [    1.031595] clk: Disabled unused clock: t7_sys_uart_d
>> [    1.032224] clk: Disabled unused clock: t7_sys_uart_c
>> [    1.032857] clk: Disabled unused clock: t7_sys_uart_b
>> [    1.033482] clk: Disabled unused clock: t7_sys_eth
>> [    1.034077] clk: Disabled unused clock: t7_sys_audio
>> [    1.034694] clk: Disabled unused clock: t7_sys_ir_ctrl
>> [    1.035333] clk: Disabled unused clock: t7_sys_msr_clk
>> [    1.035972] clk: Disabled unused clock: t7_sys_spifc
>> [    1.036596] clk: Disabled unused clock: t7_sys_acodec
>> [    1.037218] clk: Disabled unused clock: t7_sys_smartcard
>> [    1.037880] clk: Disabled unused clock: t7_sys_am2axi2
>> [    1.038518] clk: Disabled unused clock: t7_sys_am2axi1
>> [    1.039157] clk: Disabled unused clock: t7_sys_am2axi0
>> [    1.039796] clk: Disabled unused clock: t7_sys_ampipe_eth
>> [    1.040468] clk: Disabled unused clock: t7_sys_ampipe_nand
>> [    1.041155] clk: Disabled unused clock: t7_sys_deswarp
>> [    1.041790] clk: Disabled unused clock: t7_sys_gdc
>> [    1.042385] clk: Disabled unused clock: t7_sys_cec
>> [    1.042981] clk: Disabled unused clock: t7_sys_aucpu
>> [    1.043600] clk: Disabled unused clock: t7_sys_aocpu
>> [    1.044217] clk: Disabled unused clock: t7_sys_mali
>> [    1.044830] clk: Disabled unused clock: t7_sys_ethphy
>> [    1.045451] clk: Disabled unused clock: t7_sys_mipi_dsi_b
>> [    1.046123] clk: Disabled unused clock: t7_sys_mipi_dsi_a
>> [    1.046795] clk: Disabled unused clock: t7_sys_dos
>> [    1.047390] clk: Disabled unused clock: t7_sys_ddr
>> [    1.047991] clk: Disabled unused clock: pwm_ao_g
>> [    1.048565] clk: Disabled unused clock: pwm_ao_f
>> [    1.049135] clk: Disabled unused clock: pwm_ao_e
>> [    1.049709] clk: Disabled unused clock: pwm_ao_d
>> [    1.050283] clk: Disabled unused clock: pwm_ao_b
>> [    1.050857] clk: Disabled unused clock: pwm_ao_a
>> [    1.051454] clk: Disabled unused clock: rtc_dualdiv
>> [    1.052038] clk: Disabled unused clock: rtc_duandiv_in
>>
>> Also with the patches the disable happens 0.5 second later, from 0.5 seconds
>> after the boot to 1 second after the boot.
>>
>> I am still investigating what is missing a consumer or what should be
>> labeled critical.
> 
> I've seen cases where a clock is modeled in Linux, but isn't actually
> used by Linux, so it gets caught in the disable unused clocks sweep.
> 
> Does the board immediately crash after the disable unused clock sweep?
yes> If so, you could add a log statement, then 1 second sleep in
> clk_disable_unused_subtree() and wait for the board to crash.
good idea , thanks
> 
> If you can't get timely help from the vendor, then you can add
> CLK_IGNORE_UNUSED to all of those clocks, and slowly start taking them
> off in batches and wait for the crash.
That's what I've been doing for the past few weeks, but I'm probably 
hunting down a set of clock issues, as support for this board is still 
in its early stages. It's a combination of clocks, which makes it way 
more time-consuming.

I went with a more localized approach:

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2b6fae54702a..3358f4dc871f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1489,14 +1489,95 @@ static void clk_unprepare_unused_subtree(struct 
clk_core *core,
                 else if (core->ops->unprepare)
                         core->ops->unprepare(core->hw);
                 trace_clk_unprepare_complete(core);
+               pr_info("clk: V Unprepared unused clock: %s\n", core->name);
         }
  }

+static const char * const disable_clocks[] = {
+       "t7_sys_pwm_ao_gh",
+       "t7_sys_pwm_ao_ef",
+       "t7_sys_pwm_ef",
+       "t7_sys_pwm_cd",
+       "t7_sys_pwm_ab",
+       "t7_sys_ts_hevc",
+       "t7_sys_ts_vpu",
+       "t7_sys_ts_nna",
+       "t7_sys_ts_gpu",
+       "t7_sys_sar_adc",
+       "t7_sys_vpu_intr",
+       "t7_sys_dspb",
+       "t7_sys_dspa",
+       "t7_sys_a73pclk_apb",
+       "t7_sys_pclk_sys_apb",
+       "t7_sys_rsa",
+       "t7_sys_mipi_isp_pclk",
+       "t7_sys_mmc_apb",
+       "t7_sys_hdmirx_pclk",
+       "t7_sys_i2c_s_a",
+       "t7_sys_hdmitx_apb",
+       "t7_sys_i2c_m_f",
+       "t7_sys_i2c_m_e",
+       "t7_sys_i2c_m_d",
+       "t7_sys_i2c_m_c",
+       "t7_sys_i2c_m_b",
+       "t7_sys_i2c_m_a",
+       "t7_sys_i2c_ao_b",
+       "t7_sys_i2c_ao_a",
+       "t7_sys_pcie_phy",
+       "t7_sys_usb",
+       "t7_sys_pcie",
+       "t7_sys_spicc1",
+       "t7_sys_spicc0",
+       "t7_sys_g2d",
+       "t7_sys_spicc5",
+       "t7_sys_ts_a53",
+       "t7_sys_ts_a73",
+       "t7_sys_spicc4",
+       "t7_sys_spicc3",
+       "t7_sys_spicc2",
+       "t7_sys_aififo",
+       "t7_sys_uart_f",
+       "t7_sys_uart_e",
+       "t7_sys_uart_d",
+       "t7_sys_uart_c",
+       "t7_sys_uart_b",
+       "t7_sys_eth",
+       "t7_sys_audio",
+       "t7_sys_ir_ctrl",
+       "t7_sys_msr_clk",
+       "t7_sys_spifc",
+       "t7_sys_acodec",
+       "t7_sys_smartcard",
+       "t7_sys_am2axi2",
+       "t7_sys_am2axi1",
+       "t7_sys_am2axi0",
+       "t7_sys_ampipe_eth",
+       "t7_sys_ampipe_nand",
+       "t7_sys_deswarp",
+       "t7_sys_gdc",
+       "t7_sys_cec",
+       "t7_sys_aucpu",
+       "t7_sys_aocpu",
+       "t7_sys_mali",
+       "t7_sys_ethphy",
+       "t7_sys_mipi_dsi_b",
+       "t7_sys_mipi_dsi_a",
+       "t7_sys_dos",
+       "t7_sys_ddr",
+       "pwm_ao_g",
+       "pwm_ao_e",
+       "pwm_ao_a",
+       "rtc_dualdiv",
+       "rtc_duandiv_in",
+};
+
+
  static void clk_disable_unused_subtree(struct clk_core *core,
                                        struct device *dev)
  {
         struct clk_core *child;
         unsigned long flags;
+       int i;

         lockdep_assert_held(&prepare_lock);

@@ -1517,6 +1598,11 @@ static void clk_disable_unused_subtree(struct 
clk_core *core,
         if (core->flags & CLK_IGNORE_UNUSED)
                 goto unlock_out;

+       for (i = 0; i < ARRAY_SIZE(disable_clocks); i++) {
+               if (strcmp(core->name, disable_clocks[i]) == 0)
+                       goto unlock_out;
+       }
+
         /*
          * some gate clocks have special needs during the disable-unused
          * sequence.  call .disable_unused if available, otherwise fall
@@ -1529,6 +1615,7 @@ static void clk_disable_unused_subtree(struct 
clk_core *core,
                 else if (core->ops->disable)
                         core->ops->disable(core->hw);
                 trace_clk_disable_complete(core);
+               pr_info("clk: V Disabled unused clock: %s\n", core->name);
         }

This makes it easier to let the sweep disable clocks for testing.

> 
> Brian
> 
Thanks
Lucas

