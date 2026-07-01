Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F34B3128D4
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915588; cv=pass; b=B/32NBpzbzm8I2f/lKJ7mH9KNK3Eg8b4AtVEy8EgPZU9mQJfDGq+G36q0b2mtQtbb6TmAeguiV6g8rz3pbTSaTRrnJEa8numUdlG4YhYA8ykw1UZilMz0bNYqmvNpa5hYSlFqBGzmN9TWJYnqE+5drb3yTyihfMMepHyZTV3WeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915588; c=relaxed/simple;
	bh=Dr2QbTXzGUsrz8PscbfBXdq0EUt9WfhBru9tOtPMlfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eer7dyjXJsll6vvY2NxhhhWeBoDtxWScCQ/7nk8jJ+LIb4Tb4nbHR/fDYa0YpT/KtQrvrmI83pSpjxgqRBfuoz3EUftLfAM7YcwGLD2AoRNqUedyogaPFyBLQOJHRRSzrF1fLYWKOuNMa6SHubBUvI4tadrd2qP8BjWNERI3Y6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ORpV9rZq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rtnxOSoQ; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ORpV9rZq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rtnxOSoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782915586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxUIqRckuJTUeIQE7s8OWJi+e0vZjCym/RMS7ZkEbCU=;
	b=ORpV9rZqQTkT8VinNftDuNNlQh+ZcHmRwQu0Wc+/xxkGVj+bICA41wGVtVW5t276vdx/kK
	z2x/6TEEHGGLY8Craw/XnhMODLRIYi2FWJL/Xik4NqL+8jIJ4hIKp2xAD8xCVeqOFeNUoT
	BhRFMcz8nmBA12CgrJnNyPrIl+8Lrx8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-e46sNBmbOdC_358qdkdTeQ-1; Wed, 01 Jul 2026 10:19:44 -0400
X-MC-Unique: e46sNBmbOdC_358qdkdTeQ-1
X-Mimecast-MFC-AGG-ID: e46sNBmbOdC_358qdkdTeQ_1782915583
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c1273e18eebso81349566b.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 07:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782915583; cv=none;
        d=google.com; s=arc-20260327;
        b=fB2AdmDOgWHO742RB//d5WuyZTCqwl6cNYS3YuqPXd1oIFBwT3cFO3/eM0lkIIRNru
         vWUgpArPyChykCX6NxwShwIk5rs9VlSnqYRLW0LjQ7oaz6RLGNyXs/bRUMY4nTDEIPBX
         +pnamhMQRB+UU4lscHsEohm25BQz87dQndgrzBbfrRGMgD9lSMm2Gr+uyqkVZlGV07Gg
         a58HozQfz+vBQZLX8z/z69wqxa6Q3PFHBcFlORy4usxVJmvsTqk/u1ssZvFWDvYPJLv6
         5ZxyPpHULgDxYLZNJo3Km5CLaf7b5ttITpD/C99rvbL3u77DK4J6NVC1cOKOu+Pwl4cM
         oj3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LxUIqRckuJTUeIQE7s8OWJi+e0vZjCym/RMS7ZkEbCU=;
        fh=Tw2YAwq7pc5QUWYzvbqrnOS18YSyZKkG5vu71LpqR/8=;
        b=l4Gc8Vxnu11bXcjTXnOhgoFmglVxFzUJfITk4xxRsub939AA48K4iC6j5qOSZp3Lfg
         Tn5YnkbALoGh9aoH1n0VLSRUFJoYtAG8f5XPvNsD4KXyB6A0AkkZix+NU000mIDK/Rdo
         gXQKpKhv3JUkV5+vNlBMBpR7ATRc6nGgv6p+/Oo7TSdObOdkcBIvkfm8C1WZ/0oUl+b1
         b4dAZgigUpE6KupFXchul+w8q6j6VVkZsGLd6mnI+0UltnRkUPapqRnYL0uYkjQOvSyh
         Q5perT60zwIZUSlSmOb0TDCwByWOYJT03DHELqVJlDyNegZsWwJTJxRKEcEJHei6OF5n
         +7Tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782915583; x=1783520383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxUIqRckuJTUeIQE7s8OWJi+e0vZjCym/RMS7ZkEbCU=;
        b=rtnxOSoQJZusrn1vIUgtjGz8dYZ4Yz4+xxa97/gPCEn5KapiA/EqLo8JKkCyr3iUvS
         AhaB3GZCuGh0WUOu6A7KdZ2FDNPjth4O8UtVpYIP2gAHFaDoOGAMUrq9GblzKdu9QmZw
         rbcPIn+tY0aFMvRC/pT24Xx03f3t2kVpBul4/Yz+B8lHrGC8yqHPKpJNSwQmS4xGqdr5
         ipmDesOHvEawfb7+UWisLwZ2g/8/O/MVh5DH0nxTE02/7depKg55JcewAJhemMTOVMV9
         gWjcaedAahvgsO0+4Uw8lQej7S9rDURJH+d33F/+1kihKq/bVkCxAGIBpsMY+a5Dlngt
         dBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915583; x=1783520383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LxUIqRckuJTUeIQE7s8OWJi+e0vZjCym/RMS7ZkEbCU=;
        b=PY5MtPDc2z0esh77gOJFJzwYEZ1Jj5F/XGOzKP4R/9y4eEfsMVf2RIiW79LJdu8j93
         MeIRVhrw61OQkzlBgY0gl5zYTfp3ste2yqDI6nL4pqRF7NJGCuCs1X8fL9whlWSACawD
         23L2lao8hmnjml8rf2q6jxBpdnjXPDTDRKx+7uuFygrTL49NqDiLJ2kyw3rP5fEHXRDI
         pMVExzQ+fY1365jk4D2u65PHRifUhxiWkuarCu6w30lpHVTJgDQbvr+UZVBFIxitGbVu
         2M1I1zNlgiOKH5aXOyYM2M+If3vEvv0c1soiJFhScRqs5HUosRG4b3Zk8svRyjF6BAU6
         vHxA==
X-Forwarded-Encrypted: i=1; AHgh+RrWMmbRPJUuI3on9pxMRXnZG+BCXj+YHZRFfVR8UI4qTViAKvtIOEVkVWQpSb3SBzp3isZmpKGxdVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNkQDchEouiG4LIooN4OF3keoxOL4E4xGOULUvLo8wSr18U9pF
	LBpIVH83d6oecJsK1bBWPrKpFNxh8twrvGj5JlqztyTFhf1I9pQWbZjq3uZpIOYMJgSTNjW1gV0
	tbAqdKW/NlqgjIgC3wdz6AJ2ax21EmJHve3fr/yJ4+ktQW3DsELuGM3WGrr5Ibwi2yBSW8ACRfl
	T+vZh2EG0MqTBSTAW+2w01ZQ7zC9ZEiRdpHPFO
X-Gm-Gg: AfdE7cnznCStEVSERemkDPmTct83ZKuurGjcLrQe1rrEEE8cSUOmgO1SOEg+gS7m1Dd
	EMd71pHn5RKJMp1WZphqPvfuqxIcvs2t+UPrPqimNRR8ddW9Y1EptEfBjFX5x9n/NxZ54GK7Pkz
	zZkOX7w87Zp+6jLLLWzNxYik6C7isrupSsKdFe2Mdm9BrzIpFgf6StbyiZW32BJwKD5F8=
X-Received: by 2002:a17:907:3f85:b0:bfd:6cf6:1952 with SMTP id a640c23a62f3a-c12aa121813mr103021766b.28.1782915582698;
        Wed, 01 Jul 2026 07:19:42 -0700 (PDT)
X-Received: by 2002:a17:907:3f85:b0:bfd:6cf6:1952 with SMTP id
 a640c23a62f3a-c12aa121813mr103019266b.28.1782915582251; Wed, 01 Jul 2026
 07:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-sc8280xp-camcc-gdsc-clk-v1-1-ee28be1e8508@redhat.com>
In-Reply-To: <20260701-sc8280xp-camcc-gdsc-clk-v1-1-ee28be1e8508@redhat.com>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 1 Jul 2026 10:19:29 -0400
X-Gm-Features: AVVi8CfCGnf-KThjG1Nb4ovigZ-th2kHNShcT0J5gP_7f9NEYeNnXTxLVCsszj0
Message-ID: <CABx5tqLPM6wjYkwrnT7hKOrY+WoL_J=2kfLuBkV48OPLmOXpFQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: add CLK_IGNORE_UNUSED to camcc_gdsc_clk
To: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 10:16=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:
>
>     [   15.408367] titan_top_gdsc status stuck at 'on'
>     [   15.408429] WARNING: drivers/clk/qcom/gdsc.c:178 at gdsc_toggle_lo=
gic+0x14c/0x160, CPU#2: kworker/u32:1/14
>     [   15.408462] Modules linked in: bnep vfat fat ath11k_pci(+) ath11k =
mac80211 cfg80211 mhi libarc4 snd_soc_wcd938x snd_soc_wcd938x_sdw snd_soc_w=
cd_classh hci_uart snd_soc_wcd_common
>     snd_soc_sc8280xp soundwire_qcom snd_soc_wcd_mbhc snd_soc_qcom_sdw sli=
mbus snd_soc_qcom_common regmap_sdw btqca btrtl qcom_camss soundwire_bus bt=
bcm btintel snd_soc_sdca snd_soc_lpass_wsa_macro
>     bluetooth snd_soc_lpass_tx_macro snd_soc_lpass_va_macro snd_soc_lpass=
_rx_macro snd_soc_hdmi_codec snd_soc_lpass_macro_common videobuf2_dma_sg ov=
5675 v4l2_fwnode videobuf2_memops
>     qcom_spmi_adc5 snd_soc_core qcom_spmi_adc_tm5 videobuf2_v4l2 snd_seq =
snd_seq_device videobuf2_common v4l2_async qcom_vadc_common qcom_spmi_temp_=
alarm pm8941_pwrkey industrialio videodev
>     snd_compress rfkill ac97_bus snd_pcm_dmaengine qcom_tsens mc qcom_eda=
c snd_pcm pci_pwrctrl_pwrseq qcom_cpufreq_hw snd_timer snd qcomtee soundcor=
e tee leds_gpio joydev binfmt_misc zram
>     lz4hc_compress governor_simpleondemand panel_edp msm xhci_plat_hcd nv=
me nvme_core dwc3 qcom_pm8008_regulator
>     [   15.408688]  ucsi_glink nvme_keyring nvme_auth pmic_glink_altmode =
udc_core typec_ucsi aux_hpd_bridge qcom_battmgr ulpi ubwc_config socinfo oc=
mem drm_gpuvm qcom_q6v5_pas drm_exec
>     qcom_pil_info leds_qcom_lpg gpu_sched led_class_multicolor rtc_pm8xxx=
 qcom_pbs qcom_common drm_display_helper qcom_pon qcom_glink_smem qcom_glin=
k ghash_ce pwrseq_qcom_wcn gpio_sbu_mux
>     qcom_stats phy_qcom_qmp_combo qcom_q6v5 gf128mul cec dispcc_sc8280xp =
phy_qcom_edp camcc_sc8280xp i2c_qcom_cci qcom_sysmon drm_dp_aux_bus mdt_loa=
der aux_bridge qcom_pm8008 i2c_hid_of_elan
>     dwc3_qcom_legacy llcc_qcom icc_bwmon gpi typec qcom_refgen_regulator =
phy_qcom_qmp_usb nvmem_qfprom qcom_ipcc phy_qcom_snps_femto_v2 gpucc_sc8280=
xp pinctrl_sc8280xp_lpass_lpi qcom_hwspinlock
>     pinctrl_lpass_lpi lpasscc_sc8280xp qrtr qcom_aoss pmic_glink pdr_inte=
rface phy_qcom_qmp_pcie qcom_smd qcom_pdr_msg icc_osm_l3 qcom_wdt qmi_helpe=
rs qcom_rng smp2p rpmsg_core gpio_keys pwm_bl
>     smem hid_multitouch fuse i2c_dev
>     [   15.408928] CPU: 2 UID: 0 PID: 14 Comm: kworker/u32:1 Not tainted =
7.1.0+ #2 PREEMPT(lazy)
>     [   15.408937] Hardware name: LENOVO 21BX0016US/21BX0016US, BIOS N3HE=
T88W (1.60 ) 03/14/2024
>     [   15.408942] Workqueue: pm pm_runtime_work
>     [   15.408959] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
>     [   15.408967] pc : gdsc_toggle_logic+0x14c/0x160
>     [   15.408978] lr : gdsc_toggle_logic+0x14c/0x160
>     [   15.408987] sp : ffff8000800f3b40
>     [   15.408991] x29: ffff8000800f3b40 x28: 0000000000000000 x27: 00000=
00000000000
>     [   15.409003] x26: 0000000000000000 x25: 0000000000000000 x24: 00000=
00000000000
>     [   15.409014] x23: 0000000000000000 x22: 0000000000000001 x21: ffffa=
33f298fca88
>     [   15.409024] x20: 0000000000000000 x19: ffffa33f298fc5b0 x18: 00cd1=
5db75dacefd
>     [   15.409035] x17: 000000040044ffff x16: ffffa33f3b1a3d88 x15: 726f7=
76b80000002
>     [   15.409045] x14: ffffffffffffffff x13: 0000000000000028 x12: 01010=
10101010101
>     [   15.409056] x11: 7f7f7f7f7f7f7f7f x10: fefeff3039313274 x9 : ffffa=
33f3a5edafc
>     [   15.409067] x8 : ffff8000800f3780 x7 : 0000000000000001 x6 : 00000=
00000000001
>     [   15.409078] x5 : ffff000bf3ca1288 x4 : 0000000000000000 x3 : ffff5=
cccb6a3f000
>     [   15.409088] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0=
00080ae0000
>     [   15.409098] Call trace:
>     [   15.409103]  gdsc_toggle_logic+0x14c/0x160 (P)
>     [   15.409115]  gdsc_disable+0x4c/0x190
>     [   15.409126]  _genpd_power_off+0xa0/0x1a8
>     [   15.409137]  genpd_power_off.part.0+0x180/0x2a0
>     [   15.409149]  genpd_runtime_suspend+0x218/0x310
>     [   15.409155]  __rpm_callback+0x50/0x1f8
>     [   15.409166]  rpm_callback+0x7c/0x90
>     [   15.409175]  rpm_suspend+0xe8/0x690
>     [   15.409185]  pm_runtime_work+0xd0/0xe0
>     [   15.409195]  process_one_work+0x18c/0x518
>     [   15.409208]  worker_thread+0x190/0x320
>     [   15.409218]  kthread+0x110/0x130
>     [   15.409227]  ret_from_fork+0x10/0x20
>
> camcc_sc8280xp_probe() has the following snippet:
>
>     /* Keep some clocks always-on */
>     qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */
>
> This clock is required for GDSC transitions, so let's add the
> CLK_IGNORE_UNUSED flag so that it is not shutdown during the unused
> clock sweep.
>
> This was tested on a Lenovo Thinkpad x13s.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Suggested-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Fixes: ff93872a9c616 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")

Sorry, noticed this literally as soon as I hit send. Plus CCed Bryan...

Brian

