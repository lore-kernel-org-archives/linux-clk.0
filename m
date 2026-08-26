Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995E746D084
	for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 16:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762581; cv=none; b=f0fl5o5LHpnaECikahWK+AsPSAxdZBZ+3mtZlzFHZKoR4L23HGKF8kHSecdwfLsBpSNvReRm+k3WKcrdThivj5SsxLs435F4io7B0Hoim7ao60VIxZ2CL5JdwrdyA8ZFsBXxJ7316ueHrd9H2kUYzXxCeNNJ0ZVHtz/S1idp/FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762581; c=relaxed/simple;
	bh=5IPxS8CBupw5Dqtvh6q9DL3RVvk8rwKM7LO3JB3810U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Bb2h6VprtsMO+dES/AQHyiQfAqnYoihuEEgPeezZ+bE7/GRDXSOyJ+AzQFllxcuo7E+G9vjE4x5Komry8Zjr0NxNCmNZ66seZKtSQB9umRrqr4mO18lE/Li9xsES8s4eihMVAFJGKwshS3ncY6P0oP+z1Cd0qeghlK1rZQngOFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so10801695e9.2
        for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 09:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762525; x=1788367325;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLLt3K4z1vfGu/cyXpEk3vTTq8ZeQdIakdo5vqeP+RE=;
        b=LzW7WQHoWVRuTFRI6E5D5toBxcQbseqooR6xPEGAux1j117cKq+pZ1gxDbyDlKMY4J
         VOEjYlX5Itzwv5nSR2vVidpxpTjTfhxZTTWJkJS9w5L8/c9qqUDuZq5zB409foFtLOu2
         PEqZtS3piD54YZCOMJVNEY5AiMg07gTmpnb2VV7qWiuxxsSm5YE/oj+yihrZRHNj8k+3
         6TkiZNlMIB/kHA3TQISyrnYl+4T1YnqwghTuovhVQqg8Tp5OADGQPadCUQfIUH+oMDRC
         +xV0OwITpadO78mBDOagrq2RsKHoP+F2KK7UoYWZt9hye6dA79EUiJxvw7XGJM0zzlxT
         SpkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWDq9F2fEBgBhk2+E1L7w7yzZGuIVYgnbHTlgs2Z++Zn90xGDr5Q3tSaqfUfsZsekQ41aS0b4QJdg=@vger.kernel.org
X-Gm-Message-State: AFuF++ksc5sSqa9T/PbHF/4odtQe1G3qkuH6SgadeJmhBvuHTKBiVLyD
	D9M92GwIcEWcy5DXxdOn77ZtEbyPMlQDTW98YRxijb+hOy/ubWSpQMtj
X-Gm-Gg: AR+sD11NZ2dQnC5InVgBfwMmko9zO+GvSW7FajGMzTn3m3QuE3HWRm8mDY576wkH5q3
	pqVeIri+Vzt6NZX+2Le2KbGGJy+oLM7l4+zKlkdBaaPYW3DcNO0W8iCfMhdTuHDRhx/IBhd+I7B
	75KtkI09ylsM2EXJ6jedC5hmNK5Batq6lICxjzmpnDnS4YpuznG6js/ZoOEpIrSlnJ9+QtEpfgV
	o9W1zkTpKa0EmpqMByuWMb1SuFOETzzjZhtuqhBN0/gyV5qL9uetMN1qbvcQnB743FghEToHDbs
	KrF9FiV2tHNHEZY+1C8m28uZF8eY8NiYaTmk+G6K/gmK79dUs7X+L24NGeVNxBKNzu9HS3MVmwF
	kTPOFGRz0owNu1DE0utAZcKgeIqa7qx2gR+cso364x2eSJ+cTXwTDjwvZEgXWYWP613kM9l3Oax
	azMSux58ZI+h9C7/e0vp6XdtEMHGAHpKdi8qCgdmWRgF/DJqV3D+8fIwi9DSdMB9LWSlhWJoFKt
	GNnGKLoCqDhDTyTxYo3cA==
X-Received: by 2002:a05:600c:c10f:b0:49a:54a2:4b38 with SMTP id 5b1f17b1804b1-49a54a24b54mr43496915e9.7.1787762524764;
        Wed, 26 Aug 2026 09:42:04 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dcad9ddasm30366375e9.12.2026.08.26.09.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 09:42:04 -0700 (PDT)
Message-ID: <72db2062-e0ac-4c33-b1d1-d1fa5ae4bec8@linux.com>
Date: Wed, 26 Aug 2026 17:42:01 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
From: Lucas Tanure <tanure@linux.com>
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
Content-Language: en-US
In-Reply-To: <57d796bd-7a3c-46b9-bd65-d6860adbd355@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/08/2026 10:55, Lucas Tanure wrote:
> On 24/08/2026 16:29, Brian Masney wrote:
>> Hi Lucas,
>>
>> On Sun, Aug 23, 2026 at 04:40:42PM +0100, Lucas Tanure wrote:
>>> While testing mainline Linux on the Khadas VIM4 (Amlogic A311D2 / 
>>> T7), I am
>>> hitting intermittent system instability, storage loss, and memory 
>>> corruption
>>> during boot, unless I append clk_ignore_unused to the kernel command 
>>> line.
>>>
>>> Because the failure is intermittent, I am running 100-reboot test 
>>> campaigns
>>> to bisect the remaining clocks and isolate which clocks are critical and
>>> cannot be safely disabled.
>>>
>>> As testing takes significant time over serial console, I wanted to 
>>> check if
>>> Amlogic or the maintainers could shed light on this:
>>>
>>> Are there specific T7 clocks or hardware domains that must remain
>>> critical/protected even without an explicit in-kernel consumer?
>>>
>>> Current clocks being disabled that don't kill the board on a test run:
>>>
>>> [    0.380313] clk: Disabling unused clocks
>>> [    0.380413] clk: Disabled unused clock: rtc_dualdiv
>>> [    0.380718] clk: Disabled unused clock: rtc_duandiv_in
>>> [    0.381377] clk: Unprepared unused clock: a73_div16
>>> [    0.381972] clk: Unprepared unused clock: cpu_div16
>>> [    0.382605] clk: Unprepared unused clock: f50m
>>> [    0.383174] clk: Unprepared unused clock: fixed_pll_dco
>>> [    0.383786] clk: Unprepared unused clock: hdmi_pll_osc
>>> [    0.384416] clk: Unprepared unused clock: sys1_pll_osc
>>> [    0.385056] clk: Unprepared unused clock: earc_osc
>>> [    0.385652] clk: Unprepared unused clock: pcie_refclk_osc
>>> [    0.386323] clk: Unprepared unused clock: eth_pll_osc
>>> [    0.386961] clk: Unprepared unused clock: pcie_osc
>>> [    0.387548] clk: Unprepared unused clock: mclk_pll_osc
>>> [    0.388187] clk: Unprepared unused clock: usb_pll1_osc
>>> [    0.388826] clk: Unprepared unused clock: usb_pll0_osc
>>> [    0.389465] clk: Unprepared unused clock: tcon_pll_osc
>>> [    0.390105] clk: Unprepared unused clock: top_pll_osc
>>> [    0.390738] clk: Unprepared unused clock: aud_pll_osc
>>> [    0.391361] clk: Unprepared unused clock: ddr_pll_osc
>>>
>>> I am not forcing any clock to be disabled; I am forcing all clocks to 
>>> stay
>>> on and letting them be disabled if unused one by one.
>>>
>>> Any guidance or hints on required platform clocks would be greatly
>>> appreciated.
>>
>> I have an outstanding series that disables unused clocks via the
>> sync_state callback:
>>
>> https://lore.kernel.org/linux-clk/20260626-clk-sync-state- 
>> v1-0-4156d8196dc8@redhat.com/
>>
>> Be sure to not have clk_ignore_unused in your kernel command line.
>>
>> I suggest comparing the list of which clocks are disabled with that
>> series against your list of clocks above.
> Thanks for the input, it did not solve the issue. I am going to produce 
> the list with a diff in disabled clocks with and without our change, but
> it did not solve the issue.
>>
>> Brian
>>
> 
With Brian's patches, VIM4 does not turn off 4 clocks:

t7_sys_sd_emmc_b
t7_sys_sd_emmc_c
sd_emmc_b
sd_emmc_c

This is expected since I'm trying to run from an SD card. However, even 
with these four clocks kept enabled, the board still hangs.

Complete list with all clocks being disabled after Brians patches:
[    1.002247] clk: Disabled unused clock: t7_sys_pwm_ao_gh
[    1.002898] clk: Disabled unused clock: t7_sys_pwm_ao_ef
[    1.003560] clk: Disabled unused clock: t7_sys_pwm_ao_cd
[    1.004220] clk: Disabled unused clock: t7_sys_pwm_ao_ab
[    1.004972] clk: Disabled unused clock: t7_sys_pwm_ef
[    1.005509] clk: Disabled unused clock: t7_sys_pwm_cd
[    1.006211] clk: Disabled unused clock: t7_sys_pwm_ab
[    1.006766] clk: Disabled unused clock: t7_sys_ts_hevc
[    1.007434] clk: Disabled unused clock: t7_sys_ts_vpu
[    1.008033] clk: Disabled unused clock: t7_sys_ts_nna
[    1.008741] clk: Disabled unused clock: t7_sys_ts_gpu
[    1.009294] clk: Disabled unused clock: t7_sys_sar_adc
[    1.009929] clk: Disabled unused clock: t7_sys_vpu_intr
[    1.010609] clk: Disabled unused clock: t7_sys_dspb
[    1.011186] clk: Disabled unused clock: t7_sys_dspa
[    1.011792] clk: Disabled unused clock: t7_sys_a73pclk_apb
[    1.012554] clk: Disabled unused clock: t7_sys_pclk_sys_apb
[    1.013213] clk: Disabled unused clock: t7_sys_rsa
[    1.013811] clk: Disabled unused clock: t7_sys_mipi_isp_pclk
[    1.014529] clk: Disabled unused clock: t7_sys_mmc_apb
[    1.015107] clk: Disabled unused clock: t7_sys_hdmirx_pclk
[    1.015819] clk: Disabled unused clock: t7_sys_i2c_s_a
[    1.016429] clk: Disabled unused clock: t7_sys_hdmitx_apb
[    1.017109] clk: Disabled unused clock: t7_sys_i2c_m_f
[    1.017740] clk: Disabled unused clock: t7_sys_i2c_m_e
[    1.018379] clk: Disabled unused clock: t7_sys_i2c_m_d
[    1.019018] clk: Disabled unused clock: t7_sys_i2c_m_c
[    1.019657] clk: Disabled unused clock: t7_sys_i2c_m_b
[    1.020296] clk: Disabled unused clock: t7_sys_i2c_m_a
[    1.020940] clk: Disabled unused clock: t7_sys_i2c_ao_b
[    1.021585] clk: Disabled unused clock: t7_sys_i2c_ao_a
[    1.022236] clk: Disabled unused clock: t7_sys_pcie_phy
[    1.022885] clk: Disabled unused clock: t7_sys_usb
[    1.023482] clk: Disabled unused clock: t7_sys_pcie
[    1.024088] clk: Disabled unused clock: t7_sys_spicc1
[    1.024723] clk: Disabled unused clock: t7_sys_spicc0
[    1.025345] clk: Disabled unused clock: t7_sys_g2d
[    1.025940] clk: Disabled unused clock: t7_sys_spicc5
[    1.026569] clk: Disabled unused clock: t7_sys_ts_a53
[    1.027197] clk: Disabled unused clock: t7_sys_ts_a73
[    1.027825] clk: Disabled unused clock: t7_sys_spicc4
[    1.028454] clk: Disabled unused clock: t7_sys_spicc3
[    1.029085] clk: Disabled unused clock: t7_sys_spicc2
[    1.029710] clk: Disabled unused clock: t7_sys_aififo
[    1.030339] clk: Disabled unused clock: t7_sys_uart_f
[    1.030967] clk: Disabled unused clock: t7_sys_uart_e
[    1.031595] clk: Disabled unused clock: t7_sys_uart_d
[    1.032224] clk: Disabled unused clock: t7_sys_uart_c
[    1.032857] clk: Disabled unused clock: t7_sys_uart_b
[    1.033482] clk: Disabled unused clock: t7_sys_eth
[    1.034077] clk: Disabled unused clock: t7_sys_audio
[    1.034694] clk: Disabled unused clock: t7_sys_ir_ctrl
[    1.035333] clk: Disabled unused clock: t7_sys_msr_clk
[    1.035972] clk: Disabled unused clock: t7_sys_spifc
[    1.036596] clk: Disabled unused clock: t7_sys_acodec
[    1.037218] clk: Disabled unused clock: t7_sys_smartcard
[    1.037880] clk: Disabled unused clock: t7_sys_am2axi2
[    1.038518] clk: Disabled unused clock: t7_sys_am2axi1
[    1.039157] clk: Disabled unused clock: t7_sys_am2axi0
[    1.039796] clk: Disabled unused clock: t7_sys_ampipe_eth
[    1.040468] clk: Disabled unused clock: t7_sys_ampipe_nand
[    1.041155] clk: Disabled unused clock: t7_sys_deswarp
[    1.041790] clk: Disabled unused clock: t7_sys_gdc
[    1.042385] clk: Disabled unused clock: t7_sys_cec
[    1.042981] clk: Disabled unused clock: t7_sys_aucpu
[    1.043600] clk: Disabled unused clock: t7_sys_aocpu
[    1.044217] clk: Disabled unused clock: t7_sys_mali
[    1.044830] clk: Disabled unused clock: t7_sys_ethphy
[    1.045451] clk: Disabled unused clock: t7_sys_mipi_dsi_b
[    1.046123] clk: Disabled unused clock: t7_sys_mipi_dsi_a
[    1.046795] clk: Disabled unused clock: t7_sys_dos
[    1.047390] clk: Disabled unused clock: t7_sys_ddr
[    1.047991] clk: Disabled unused clock: pwm_ao_g
[    1.048565] clk: Disabled unused clock: pwm_ao_f
[    1.049135] clk: Disabled unused clock: pwm_ao_e
[    1.049709] clk: Disabled unused clock: pwm_ao_d
[    1.050283] clk: Disabled unused clock: pwm_ao_b
[    1.050857] clk: Disabled unused clock: pwm_ao_a
[    1.051454] clk: Disabled unused clock: rtc_dualdiv
[    1.052038] clk: Disabled unused clock: rtc_duandiv_in

Also with the patches the disable happens 0.5 second later, from 0.5 
seconds after the boot to 1 second after the boot.

I am still investigating what is missing a consumer or what should be 
labeled critical.

thanks
Lucas Tanure


