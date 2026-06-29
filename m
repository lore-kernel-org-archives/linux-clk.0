Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F4338593
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731271; cv=none; b=IKUhnHoPclgJM6QI3W1ZyV/qhBgTnGrnFvHqMQ74G4SrwzFhrCD/2MQAUS/7Crucf0l3CgSrfc+swXwq0HcC+Y9q0BZMmkuFzwe8dMBPwExyBXqBcKiB6dvAWuf6MgGskc93wuAn/8z2LgTR17r62/zVEuRs3jWFl4ZiRofjkVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731271; c=relaxed/simple;
	bh=Lor7gJ8V8+wxyAWALctRfgBM9XvrQWK9zg2WLSKS7hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdVU2m1wx6N5HXY5bA89fReCtsOUlArzQWVReWSdYrp4u1y8W0SB3TA56txCY/neTtwD7yAM47TbVbG8GSkyjDTW0MR86+TVVznfrRyRmhWrSStPu4LY70CcQoco+zAtRq9jHilcGNYMlpU6DGfnKab1MyoMO666hpuSGRgdN9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZGsDSj19; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ReTihSDN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZGsDSj19";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ReTihSDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782731269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pojPlvqxqWoRbloWL+lScPJutLJi6w2eMZlHbjxXR2E=;
	b=ZGsDSj19epqMdDiO7tvpDWxiEFk18sQ9v2blGoDs4Jsh9+7TmL2GMe/XX0dcGl54CCI46U
	ZTnEwJNxkGjXzxQ5ug7Tjt/FO8q6AajnWWLC5l97GmdpBBn381SLRwfiT+YL5Q7nDjQsVf
	E8YKUoUL5qDcadf9j+p4lfoP7ovZmfU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-2u_Q-BMYPZuUh1RinidUww-1; Mon, 29 Jun 2026 07:07:48 -0400
X-MC-Unique: 2u_Q-BMYPZuUh1RinidUww-1
X-Mimecast-MFC-AGG-ID: 2u_Q-BMYPZuUh1RinidUww_1782731268
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e9489f62bfso64007806d6.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 04:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782731268; x=1783336068; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pojPlvqxqWoRbloWL+lScPJutLJi6w2eMZlHbjxXR2E=;
        b=ReTihSDN8aKwRNpZ8utFBQyx6A5/1CJumojv9FIt9QmQfPTPM3yw9NtVL7e8tP406K
         OPNWzuGM3CV8wkbCJfNXZqME6/KH96UB8FnHM29i7ikGcYVBuGpbTVe7VZH6VVvhfcLn
         sR4CW4PKR4/RyZtk9D45rDJEo3RqwB4d7+PouSP9R7D+TruSGckj6M3BAljqEzx7Xx33
         gfG2ZfWsBQtgro+VJY5JoRNjt2CuRPzR09jPQMHrpUKrwibsF1xwm6fXvI8bOqIAf9xQ
         BkFxxGAsuup/iwtAMJDJC35tsi//2Li7q//4xGsug2Hp3EZnfAre5fO+kkwHMu920NCg
         a0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782731268; x=1783336068;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pojPlvqxqWoRbloWL+lScPJutLJi6w2eMZlHbjxXR2E=;
        b=D3VpB+QyQ0tesLQzraGAohfaduY+Xaz2EOwzMy3a7MFR62V3m6EysMjwa59TsiaCZz
         HnNdUcCK+QiSwcTa4nB2LfM8iFDrMxRYA7D2kPEXeArAOZ60/qWZ+3PTDJJXIo30rOZJ
         UcIAXnLfJ7P5DvvRo9tQhockJ68rRUD4Q1/J81O9CDeqSzO3UODlAFpUaLk8tRdHmIyz
         WNcRCyp6lvCwvgptMW8/9sHq63wLGsFYc5XA+5TZYKwD1THrRgJYFuJ+pftP2AwTeedc
         zZxgupzhDCAEQpdTxzoiNf0NuC7TpuMraE7Yeu0g9yre1MldeBIhytR4UNnuP3hWBo47
         rr9A==
X-Forwarded-Encrypted: i=1; AHgh+Rrmug+GAJ8HQL5BR17ELLwbB7cU9g/Luf7x02TDpiZASz4KUgODQ4h6ZhhMUuaSq7Ir9DFtjbd3GnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpaNEgYAJJt3qlq7MEGz6kzrAaBbyo5rOXdEy9zqG14vKl7A/3
	QRregFURgLo2+KCN5KD3twNFC9OXlzrGZGWkzqhOOuG2ga/vcAjM/fYl/KGdBoQ9ERFmadtFUG4
	AOpewACmDC8cK1o5RrC6MS/ZFFqTzfhaBc8NVlN7SdkfpkiqFoAhCI9g3bkigkw==
X-Gm-Gg: AfdE7clGSGUv5ujcdKRMe2NGEJKe9m0zC2LpwGnfE7TNQaKyw/qAbW6sjqUH211J5D/
	xFdN89D1Zx6G58nYr1HAndukRmNDbOYcfTsHerBTDyDk8qtcGv5pzBkCjz7MWdkc9Enp/vwtOMC
	ALR75xztneqpjSrxY8FhON77suPSOSX2RZLRXyy1KeEl4Y+xqJNfE3tX4pwd6rEZ73/GEob51oz
	8YJneFDe/8GnrqXybf5OLmfYE0mszyGhc5e90HsvmSBHTgTZ2gQNUoVV5YFlKMbpnDVq7dbLmD3
	AAm028FnKZJSfdVvAoe62gmv6JhHRrIozZYrm56iTa+XhUTgi7z4cieqfD30wCTKljkihsUSNR7
	hauhC4mWnntQRETU45u7+J2Q5DIgvROOwHg57gS8oBT4yLw==
X-Received: by 2002:a05:6214:2465:b0:8ef:aad6:dada with SMTP id 6a1803df08f44-8efaad6dc1amr59166876d6.20.1782731267689;
        Mon, 29 Jun 2026 04:07:47 -0700 (PDT)
X-Received: by 2002:a05:6214:2465:b0:8ef:aad6:dada with SMTP id 6a1803df08f44-8efaad6dc1amr59166266d6.20.1782731267043;
        Mon, 29 Jun 2026 04:07:47 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde21csm303342486d6.26.2026.06.29.04.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:07:46 -0700 (PDT)
Date: Mon, 29 Jun 2026 07:07:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
Message-ID: <akJSAHEJXZkLp_0H@redhat.com>
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <c7dca61e-ac37-4d3e-ae4b-c81cca424e0b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7dca61e-ac37-4d3e-ae4b-c81cca424e0b@linaro.org>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Vladimir,

On Fri, Jun 26, 2026 at 07:59:53PM +0300, Vladimir Zapolskiy wrote:
> On 6/26/26 19:26, Brian Masney wrote:
> > With the introduction of sync_state support in the clk and pmdomain
> > subsystems, the following warning happens when the unused clocks are
> > shutdown in camcc-sc8280xp:
> > 
> >      [   15.408367] titan_top_gdsc status stuck at 'on'
> >      [   15.408429] WARNING: drivers/clk/qcom/gdsc.c:178 at gdsc_toggle_logic+0x14c/0x160, CPU#2: kworker/u32:1/14
> >      [   15.408462] Modules linked in: bnep vfat fat ath11k_pci(+) ath11k mac80211 cfg80211 mhi libarc4 snd_soc_wcd938x snd_soc_wcd938x_sdw snd_soc_wcd_classh hci_uart snd_soc_wcd_common
> >      snd_soc_sc8280xp soundwire_qcom snd_soc_wcd_mbhc snd_soc_qcom_sdw slimbus snd_soc_qcom_common regmap_sdw btqca btrtl qcom_camss soundwire_bus btbcm btintel snd_soc_sdca snd_soc_lpass_wsa_macro
> >      bluetooth snd_soc_lpass_tx_macro snd_soc_lpass_va_macro snd_soc_lpass_rx_macro snd_soc_hdmi_codec snd_soc_lpass_macro_common videobuf2_dma_sg ov5675 v4l2_fwnode videobuf2_memops
> >      qcom_spmi_adc5 snd_soc_core qcom_spmi_adc_tm5 videobuf2_v4l2 snd_seq snd_seq_device videobuf2_common v4l2_async qcom_vadc_common qcom_spmi_temp_alarm pm8941_pwrkey industrialio videodev
> >      snd_compress rfkill ac97_bus snd_pcm_dmaengine qcom_tsens mc qcom_edac snd_pcm pci_pwrctrl_pwrseq qcom_cpufreq_hw snd_timer snd qcomtee soundcore tee leds_gpio joydev binfmt_misc zram
> >      lz4hc_compress governor_simpleondemand panel_edp msm xhci_plat_hcd nvme nvme_core dwc3 qcom_pm8008_regulator
> >      [   15.408688]  ucsi_glink nvme_keyring nvme_auth pmic_glink_altmode udc_core typec_ucsi aux_hpd_bridge qcom_battmgr ulpi ubwc_config socinfo ocmem drm_gpuvm qcom_q6v5_pas drm_exec
> >      qcom_pil_info leds_qcom_lpg gpu_sched led_class_multicolor rtc_pm8xxx qcom_pbs qcom_common drm_display_helper qcom_pon qcom_glink_smem qcom_glink ghash_ce pwrseq_qcom_wcn gpio_sbu_mux
> >      qcom_stats phy_qcom_qmp_combo qcom_q6v5 gf128mul cec dispcc_sc8280xp phy_qcom_edp camcc_sc8280xp i2c_qcom_cci qcom_sysmon drm_dp_aux_bus mdt_loader aux_bridge qcom_pm8008 i2c_hid_of_elan
> >      dwc3_qcom_legacy llcc_qcom icc_bwmon gpi typec qcom_refgen_regulator phy_qcom_qmp_usb nvmem_qfprom qcom_ipcc phy_qcom_snps_femto_v2 gpucc_sc8280xp pinctrl_sc8280xp_lpass_lpi qcom_hwspinlock
> >      pinctrl_lpass_lpi lpasscc_sc8280xp qrtr qcom_aoss pmic_glink pdr_interface phy_qcom_qmp_pcie qcom_smd qcom_pdr_msg icc_osm_l3 qcom_wdt qmi_helpers qcom_rng smp2p rpmsg_core gpio_keys pwm_bl
> >      smem hid_multitouch fuse i2c_dev
> >      [   15.408928] CPU: 2 UID: 0 PID: 14 Comm: kworker/u32:1 Not tainted 7.1.0+ #2 PREEMPT(lazy)
> >      [   15.408937] Hardware name: LENOVO 21BX0016US/21BX0016US, BIOS N3HET88W (1.60 ) 03/14/2024
> >      [   15.408942] Workqueue: pm pm_runtime_work
> >      [   15.408959] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >      [   15.408967] pc : gdsc_toggle_logic+0x14c/0x160
> >      [   15.408978] lr : gdsc_toggle_logic+0x14c/0x160
> >      [   15.408987] sp : ffff8000800f3b40
> >      [   15.408991] x29: ffff8000800f3b40 x28: 0000000000000000 x27: 0000000000000000
> >      [   15.409003] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
> >      [   15.409014] x23: 0000000000000000 x22: 0000000000000001 x21: ffffa33f298fca88
> >      [   15.409024] x20: 0000000000000000 x19: ffffa33f298fc5b0 x18: 00cd15db75dacefd
> >      [   15.409035] x17: 000000040044ffff x16: ffffa33f3b1a3d88 x15: 726f776b80000002
> >      [   15.409045] x14: ffffffffffffffff x13: 0000000000000028 x12: 0101010101010101
> >      [   15.409056] x11: 7f7f7f7f7f7f7f7f x10: fefeff3039313274 x9 : ffffa33f3a5edafc
> >      [   15.409067] x8 : ffff8000800f3780 x7 : 0000000000000001 x6 : 0000000000000001
> >      [   15.409078] x5 : ffff000bf3ca1288 x4 : 0000000000000000 x3 : ffff5cccb6a3f000
> >      [   15.409088] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000080ae0000
> >      [   15.409098] Call trace:
> >      [   15.409103]  gdsc_toggle_logic+0x14c/0x160 (P)
> >      [   15.409115]  gdsc_disable+0x4c/0x190
> >      [   15.409126]  _genpd_power_off+0xa0/0x1a8
> >      [   15.409137]  genpd_power_off.part.0+0x180/0x2a0
> >      [   15.409149]  genpd_runtime_suspend+0x218/0x310
> >      [   15.409155]  __rpm_callback+0x50/0x1f8
> >      [   15.409166]  rpm_callback+0x7c/0x90
> >      [   15.409175]  rpm_suspend+0xe8/0x690
> >      [   15.409185]  pm_runtime_work+0xd0/0xe0
> >      [   15.409195]  process_one_work+0x18c/0x518
> >      [   15.409208]  worker_thread+0x190/0x320
> >      [   15.409218]  kthread+0x110/0x130
> >      [   15.409227]  ret_from_fork+0x10/0x20
> > 
> > Let's go ahead and add the flag ALWAYS_ON to titan_top_gdsc so that it
> > is not disabled in the unused clock sweep.
> > 
> > Fixes: ff93872a9c616 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
> 
> I don't think that the given backtrace (or the analysis) point to some
> problem in the clock controller driver definitely.
> 
> If the problem is caused by "the introduction of sync_state support in
> the clk and pmdomain subsystems", then it would make sense to fix it
> instead, it's unclear that the problem exists beyond this applied series.

This is a separate issue outside of this series. With the current tree,
sc8280xp (Thinpad x13s) needs to be booted with clk_ignore_unused. With
the clk sync_state support, the x13s can be booted without
clk_ignore_used and without pd_ignore_unused.

Brian

