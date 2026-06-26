Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285D43FFFA1
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782493198; cv=none; b=O8Z+khcHn6g267a2Rjb/z8N9WMFXkGIDnkgmBbbTRet2OKZfEq4A/gLmvE7Gnhvj9k36K4qsp0EvG9k+p32FQZdfsvhjsFouMMgpnGeeSdpL6zsIwU1LRw8pLxAfdxXYEjHOadrppNZUwauObboPzpjLG4rMIBoZXnDHZ9TJ+yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782493198; c=relaxed/simple;
	bh=Ar2EAyKpkCHSCYbp7jjGT7LZl3SNUlgprNrJ+lZdoCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BMLF4kEvtyi9XvxovBujr/XEM2YCTWMDbGsADRje4L0d98bwB+8o8P8Gbkn88Lst/KN2yVWqdGssYiZsSU/Imf5I0W/2bUWyUTT9qUtP8eKt2lqItSpL6bMeHwpu76e/gp4G0K87N68A/4F+XbHlrS8VNV98P3gokWCf7BQHRSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LYY2w0dj; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYY2w0dj"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ad519f5f13so100125e87.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 09:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782493194; x=1783097994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OZ3ktGj5obXHVqZaFcE9dKGBQdx5LQjC7ZaKsiIV9tI=;
        b=LYY2w0djUg7Kqgkt1HgjAXA6cVMKoTpEEXRxlF/3zSYBEvTWjOI0GdvaOhy9CB7d8n
         2+7iIxZll1Ve9Lf402zIqChLylhZRYdYGaMW+t1xyqr97aQirIhmZpWE62ibDZFCRLci
         kkrygNz/18oA8AJk+PXAsag0FW7nw6wvQMXGeaQMyEgTwTKcgfEcrP0lLFCUFR+LArbp
         PIAOgK2U5OHl4vWiBqdgwRtieCWp/7yIAwHGKynBlh0yNwM1LMvImFGuFQHBANndDrUj
         hMChPxIst7LnYb1xDp5wksuBDMdWXne+tB0qgLV9/UzSn2g63elb+kLr/f2Tyw9Ov7uG
         8Ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782493194; x=1783097994;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZ3ktGj5obXHVqZaFcE9dKGBQdx5LQjC7ZaKsiIV9tI=;
        b=oal7lFScf3AXtNhspmScYnxcj5gIBFlSluOjTSEE/RVeAvrsGua1HPsye4uQW6mrk3
         CRiiutCnbsXuZhle4II8oEcpfteNHEytJ1zsM8R5zqpAgGB5NVh9h0SSkirTUxHuZAs6
         NVgmP+LE4sYFzTBpEuJh4gkPxEM5CExhb8Rtpp12amVRAq7sQg1j7hoVLM2Q65diqbgF
         ofOPkquQ5BQJW6A0C4mow3qPXo6fVqGBtJSDD4OtF7D1l6BCfCqpEha7gdIgu4U+myTv
         IpcUSATEU1IIAd3+pggAVNZAfFVZF+PPog7939539rizRjFuW8ppeo0HGxeYVuARwhxf
         gPnw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+pZMUOUB9vsyS6bDiHbZLfeKJ4+UdukSa3VmmSB1EYj2m/E4RLl30Wg/61AnHAYwqQpxbAXGw9QE=@vger.kernel.org
X-Gm-Message-State: AOJu0YymC/qW3YCQqCa67ZPyVcIlQTSVoTgUr71McEcM0ew7rZKQuYIS
	rSTsdcBaV4MxXNZHs70AH+A9HVtSPD1Xdt/XpigCuCLzzv4jXVSBZYGhkqIK8MA15Rw=
X-Gm-Gg: AfdE7cllL/msfJJwcW1JKq2gH/VGy3GFDYsiM5bGp3ZKbBdyXLimhuacmIqh9BXINTF
	+KfeVLY2wFHz8zBEZBVvd6fcOIa5Yxgd4/Pwfalyx36j3hQeY3aAQsLhqZ0W6kyL2Rsyc9m37ml
	RK0idhzV8sLz2PsV6Nw3DWS3O35rT/Bk/EBWRYnyjj4vdV41pCI8rS7x7D9DwWVNNvNU8EjSw7j
	RevCv43X+PJWjkn3kMyuVfWaz1Lo6n+NL82L/MjtIfglqrqfGb5QF2lfNwQvIweXPl/Afa0XHn/
	qiAhbhpkPr10iFcCeUKUU6iGAt0VVFv+6+cwLrmm9WzTgN16s7fdTzXgdqRnNo1RknhyjJ6HQNi
	kyQyrbu0ygBfAj2SsjAeyxzKP1pYlvQCpovYwWQbJqO4cF9/MjliZ3oNTjFxsDVIkbqMjHsZMTc
	ohvU7wS2FLxhkMtXU7X/8ps1XU2m1GzS6JOnKO5Nr5kuJb0aku6j7HE+rzvtnWM/R/hxU=
X-Received: by 2002:a05:6512:3e02:b0:5ad:5454:60a9 with SMTP id 2adb3069b0e04-5aea1f3b1ccmr1386667e87.2.1782493194281;
        Fri, 26 Jun 2026 09:59:54 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea50f5504sm1001430e87.66.2026.06.26.09.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 09:59:53 -0700 (PDT)
Message-ID: <c7dca61e-ac37-4d3e-ae4b-c81cca424e0b@linaro.org>
Date: Fri, 26 Jun 2026 19:59:53 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
To: Brian Masney <bmasney@redhat.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/26 19:26, Brian Masney wrote:
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:
> 
>      [   15.408367] titan_top_gdsc status stuck at 'on'
>      [   15.408429] WARNING: drivers/clk/qcom/gdsc.c:178 at gdsc_toggle_logic+0x14c/0x160, CPU#2: kworker/u32:1/14
>      [   15.408462] Modules linked in: bnep vfat fat ath11k_pci(+) ath11k mac80211 cfg80211 mhi libarc4 snd_soc_wcd938x snd_soc_wcd938x_sdw snd_soc_wcd_classh hci_uart snd_soc_wcd_common
>      snd_soc_sc8280xp soundwire_qcom snd_soc_wcd_mbhc snd_soc_qcom_sdw slimbus snd_soc_qcom_common regmap_sdw btqca btrtl qcom_camss soundwire_bus btbcm btintel snd_soc_sdca snd_soc_lpass_wsa_macro
>      bluetooth snd_soc_lpass_tx_macro snd_soc_lpass_va_macro snd_soc_lpass_rx_macro snd_soc_hdmi_codec snd_soc_lpass_macro_common videobuf2_dma_sg ov5675 v4l2_fwnode videobuf2_memops
>      qcom_spmi_adc5 snd_soc_core qcom_spmi_adc_tm5 videobuf2_v4l2 snd_seq snd_seq_device videobuf2_common v4l2_async qcom_vadc_common qcom_spmi_temp_alarm pm8941_pwrkey industrialio videodev
>      snd_compress rfkill ac97_bus snd_pcm_dmaengine qcom_tsens mc qcom_edac snd_pcm pci_pwrctrl_pwrseq qcom_cpufreq_hw snd_timer snd qcomtee soundcore tee leds_gpio joydev binfmt_misc zram
>      lz4hc_compress governor_simpleondemand panel_edp msm xhci_plat_hcd nvme nvme_core dwc3 qcom_pm8008_regulator
>      [   15.408688]  ucsi_glink nvme_keyring nvme_auth pmic_glink_altmode udc_core typec_ucsi aux_hpd_bridge qcom_battmgr ulpi ubwc_config socinfo ocmem drm_gpuvm qcom_q6v5_pas drm_exec
>      qcom_pil_info leds_qcom_lpg gpu_sched led_class_multicolor rtc_pm8xxx qcom_pbs qcom_common drm_display_helper qcom_pon qcom_glink_smem qcom_glink ghash_ce pwrseq_qcom_wcn gpio_sbu_mux
>      qcom_stats phy_qcom_qmp_combo qcom_q6v5 gf128mul cec dispcc_sc8280xp phy_qcom_edp camcc_sc8280xp i2c_qcom_cci qcom_sysmon drm_dp_aux_bus mdt_loader aux_bridge qcom_pm8008 i2c_hid_of_elan
>      dwc3_qcom_legacy llcc_qcom icc_bwmon gpi typec qcom_refgen_regulator phy_qcom_qmp_usb nvmem_qfprom qcom_ipcc phy_qcom_snps_femto_v2 gpucc_sc8280xp pinctrl_sc8280xp_lpass_lpi qcom_hwspinlock
>      pinctrl_lpass_lpi lpasscc_sc8280xp qrtr qcom_aoss pmic_glink pdr_interface phy_qcom_qmp_pcie qcom_smd qcom_pdr_msg icc_osm_l3 qcom_wdt qmi_helpers qcom_rng smp2p rpmsg_core gpio_keys pwm_bl
>      smem hid_multitouch fuse i2c_dev
>      [   15.408928] CPU: 2 UID: 0 PID: 14 Comm: kworker/u32:1 Not tainted 7.1.0+ #2 PREEMPT(lazy)
>      [   15.408937] Hardware name: LENOVO 21BX0016US/21BX0016US, BIOS N3HET88W (1.60 ) 03/14/2024
>      [   15.408942] Workqueue: pm pm_runtime_work
>      [   15.408959] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>      [   15.408967] pc : gdsc_toggle_logic+0x14c/0x160
>      [   15.408978] lr : gdsc_toggle_logic+0x14c/0x160
>      [   15.408987] sp : ffff8000800f3b40
>      [   15.408991] x29: ffff8000800f3b40 x28: 0000000000000000 x27: 0000000000000000
>      [   15.409003] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
>      [   15.409014] x23: 0000000000000000 x22: 0000000000000001 x21: ffffa33f298fca88
>      [   15.409024] x20: 0000000000000000 x19: ffffa33f298fc5b0 x18: 00cd15db75dacefd
>      [   15.409035] x17: 000000040044ffff x16: ffffa33f3b1a3d88 x15: 726f776b80000002
>      [   15.409045] x14: ffffffffffffffff x13: 0000000000000028 x12: 0101010101010101
>      [   15.409056] x11: 7f7f7f7f7f7f7f7f x10: fefeff3039313274 x9 : ffffa33f3a5edafc
>      [   15.409067] x8 : ffff8000800f3780 x7 : 0000000000000001 x6 : 0000000000000001
>      [   15.409078] x5 : ffff000bf3ca1288 x4 : 0000000000000000 x3 : ffff5cccb6a3f000
>      [   15.409088] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000080ae0000
>      [   15.409098] Call trace:
>      [   15.409103]  gdsc_toggle_logic+0x14c/0x160 (P)
>      [   15.409115]  gdsc_disable+0x4c/0x190
>      [   15.409126]  _genpd_power_off+0xa0/0x1a8
>      [   15.409137]  genpd_power_off.part.0+0x180/0x2a0
>      [   15.409149]  genpd_runtime_suspend+0x218/0x310
>      [   15.409155]  __rpm_callback+0x50/0x1f8
>      [   15.409166]  rpm_callback+0x7c/0x90
>      [   15.409175]  rpm_suspend+0xe8/0x690
>      [   15.409185]  pm_runtime_work+0xd0/0xe0
>      [   15.409195]  process_one_work+0x18c/0x518
>      [   15.409208]  worker_thread+0x190/0x320
>      [   15.409218]  kthread+0x110/0x130
>      [   15.409227]  ret_from_fork+0x10/0x20
> 
> Let's go ahead and add the flag ALWAYS_ON to titan_top_gdsc so that it
> is not disabled in the unused clock sweep.
> 
> Fixes: ff93872a9c616 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")

I don't think that the given backtrace (or the analysis) point to some
problem in the clock controller driver definitely.

If the problem is caused by "the introduction of sync_state support in
the clk and pmdomain subsystems", then it would make sense to fix it
instead, it's unclear that the problem exists beyond this applied series.

> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-6
> ---
>   drivers/clk/qcom/camcc-sc8280xp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
> index 18f5a3eb313e..52e1a786083f 100644
> --- a/drivers/clk/qcom/camcc-sc8280xp.c
> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
> @@ -2803,7 +2803,7 @@ static struct gdsc titan_top_gdsc = {
>   	.pd = {
>   		.name = "titan_top_gdsc",
>   	},
> -	.flags = RETAIN_FF_ENABLE,
> +	.flags = ALWAYS_ON | RETAIN_FF_ENABLE,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
>   
> 

-- 
Best wishes,
Vladimir
