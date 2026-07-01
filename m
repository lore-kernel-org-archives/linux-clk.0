Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A513233B6E8
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 14:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915398; cv=none; b=r1kKppngDYkrud4Ju8rFc7gkSeMMy6QOz/9Vrxwpc15EoGKVwQZquL7UGNC2hkP/tQgpJeog58K/IJAkqmUoaYfcikZV9Kx9JoZQIjylHvxG8cXCdgzNNrQnti+M7i6WP6wJ2AvJUJPTeDISgVurCwtZhD1U5POyua+bmZIRqe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915398; c=relaxed/simple;
	bh=RpauZrEucFKlazf2uI7VX0Q7EoNWI1WAXPiXtwCOLeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MzyDMoKp0hifW+hXTwzXPv/2NX5YXnnxP1m4jcvamgKmMUpI8FPsFTibmVjASQvOgxFmfNCiGVKjE6KdeaGXUx4ayknqWj/SKZuG2sSwuwjaO7Bn+5kxgVCOQEVKai3+3iB5Wq08DbGeSLB1Txa92x9xxf9p9ieO78MEIaz9pso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q/JAo6Mn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B5nz2LWN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q/JAo6Mn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="B5nz2LWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782915393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/JWBbuPH+JoxQjIqcAckt9LCjRBqaw7vRzjjWYDDti8=;
	b=Q/JAo6MnZcLDT+/6nL+jgDytVlIsJuvXZzz05rNLi1WbYE7c5YWYRSvSFH9YIhMcVMhycJ
	Jc/W9RXrDUnmvI+NHo0464n+o6IkAgRJgYgH4/fta7uiETiWHUcwAeF57ZyOD2mERMW5pQ
	m6DhCvrYsP/V3MSChJKg4Stjpounddg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-P-dwEEROPTy5CFdEMIyjVg-1; Wed, 01 Jul 2026 10:16:30 -0400
X-MC-Unique: P-dwEEROPTy5CFdEMIyjVg-1
X-Mimecast-MFC-AGG-ID: P-dwEEROPTy5CFdEMIyjVg_1782915390
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e623b0e95so74260685a.3
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 07:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782915390; x=1783520190; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/JWBbuPH+JoxQjIqcAckt9LCjRBqaw7vRzjjWYDDti8=;
        b=B5nz2LWNivmTWzXzUWlJAAuJQkIVJsOrsQd+VYJRfONDYrdft4PTJD+Wp92wzteSCH
         W90qgpxNWSyWOf1cx2lLsTb7vbEf2xxsK7SI2/aNoWNrzUz0o7QfODRuXCxyIU/3gfsl
         hEoJNNI0ikQD5wNpiOlTBh1nzYNOvL7aMdk0ecjSs/xzJ/8L418Wxo8AHiQ3PEmYi2L6
         6CXw6o349xDJsPM4mvrPk9SkMbpigyfpefiMkbIA/2aHOQKtUqqLmijiUfHhuX6etSxt
         0DXTvSWeCm+t7HrIN6w9R0VW1tLzQ+NnYGHSYCok/88hZX60vr79Hlp38ouXAKdJdeGy
         xpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915390; x=1783520190;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JWBbuPH+JoxQjIqcAckt9LCjRBqaw7vRzjjWYDDti8=;
        b=ibfG2F9pS335mxvBUQwTphkDMr1uZDJJpK3juj+/amimeh+xVECy/tBhfPTsl7pcHm
         bYZZzA1kZLT0bfsGlAJPn8sEPD17EEjPxmyp8UGvdsw+Ic7pjMQ3x9sMMIKbN0/nAuQc
         DMUo2ARBn9xa5Av5zAp314OVp7n2RjFStk8TQ5Y5zfOlgZ5MfykGxOepHQ5xPHxLa3pC
         g3rBCf6NO7mx8bNj11BlmR4ukXvc83+rAomaRRdFwdUgoFeKTwFdZELN11UOhA5yAq9I
         Ryi5F04Ial6XlxbIavZgZiv3gbuF8LVg3beDH0W4iIPT7Uea2ypPEoE2mmRsOclKeXV2
         jrOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8t2OhEB7DYCIjUnVhG/RCGXUKtL28aWaEv1iHeMLHvqXoS/u9EZuGY4bFi3TT+SWNIAM/VXcqbdOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTOoAT3EybSzHRfkytIaht5KUyRKi5RxskuK9FsdTIKlapI6Oa
	Y7X/q1YV91HhzGUOFRYeMY2Yusne+VUyZpqdBIhUGcYHPviuhSQrBwSMRzMxSYsiQtJskhMmH3e
	cr54cbqKPJJO/7f7Mt8B2MnQaVOTgTUf/z4a9+80ODwE3AUSCTXUdwNcqncR8PjEdHFanRxiF2/
	QekkF65AUB649ZhjpqnZugXh6a5Z/RMZwTuOWkRC2AMx4h
X-Gm-Gg: AfdE7cl5sw8hO2Jh0jwLqokKEWXdr7Qqc+Sa4LsKLIHh37TTarvIigKqX8frM6VMawu
	4mRwZKjwf80vp7yoCpDfPO88DpSG7+zZZWyBvRgLFicdY5aHYy91Ao6k/PbpRnkkGaZyCRbzGqu
	cWVIEJswTg1dVY1bbMGn3aMBQ3J+2rrX9/BtbPeMfM2KCyGRdqj3txtorRronU1Zftrhr3ReRyY
	WRskVTRPQoQzpsbj/Vnp35eI2GPZDnn6ClJ1sNIWWu/TmWCpIRvwJ6QzWMpY/PY2pOP1d3X/MRI
	94pdx8EamDhRMZmjtYwhbyHMLczGEWOSfDdiLMI9KIPaX1PNGvKt3XwIZcdXGWoF4jdyALCe0Wu
	0YTRnosqHqyVkseT54qXB0cFSw6royNlCDEjb+ysLRZB/6D6NiA==
X-Received: by 2002:a05:620a:1986:b0:92c:3086:6d50 with SMTP id af79cd13be357-92e781f13b5mr264302685a.2.1782915389763;
        Wed, 01 Jul 2026 07:16:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1986:b0:92c:3086:6d50 with SMTP id af79cd13be357-92e781f13b5mr264291885a.2.1782915388400;
        Wed, 01 Jul 2026 07:16:28 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e622e87a7sm598871485a.28.2026.07.01.07.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:16:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 01 Jul 2026 10:16:05 -0400
Subject: [PATCH] clk: qcom: camcc-sc8280xp: add CLK_IGNORE_UNUSED to
 camcc_gdsc_clk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-sc8280xp-camcc-gdsc-clk-v1-1-ee28be1e8508@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqEMAxA4atI1gbazqDWq4iLElMN/tKACMW7T
 5nlt3gvg3ISVuirDIlvUTmPAltXQEs4ZkaZisEZ15jWWFTqXGeeCynsRDhPSkjbitZ+vr4N3sc
 mQqmvxFGe/3kY3/cHuUEeF2kAAAA=
X-Change-ID: 20260701-sc8280xp-camcc-gdsc-clk-113497a99f6f
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5612; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=RpauZrEucFKlazf2uI7VX0Q7EoNWI1WAXPiXtwCOLeQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJcFc3SjnPcDY3bsYP7Fe8N3+Wpa+OP2fk/i4l0/8jaK
 95020C2o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIkwL2Fk2C0g7Zg62T5SrM/u
 0qFjFib7Te4nPpg6S0HAvyT5YqFqDyPDNw4LTn0BFSetCSdv3ajuEG2o4A1efCh29f0P+Qp6XZv
 5AA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

With the introduction of sync_state support in the clk and pmdomain
subsystems, the following warning happens when the unused clocks are
shutdown in camcc-sc8280xp:

    [   15.408367] titan_top_gdsc status stuck at 'on'
    [   15.408429] WARNING: drivers/clk/qcom/gdsc.c:178 at gdsc_toggle_logic+0x14c/0x160, CPU#2: kworker/u32:1/14
    [   15.408462] Modules linked in: bnep vfat fat ath11k_pci(+) ath11k mac80211 cfg80211 mhi libarc4 snd_soc_wcd938x snd_soc_wcd938x_sdw snd_soc_wcd_classh hci_uart snd_soc_wcd_common
    snd_soc_sc8280xp soundwire_qcom snd_soc_wcd_mbhc snd_soc_qcom_sdw slimbus snd_soc_qcom_common regmap_sdw btqca btrtl qcom_camss soundwire_bus btbcm btintel snd_soc_sdca snd_soc_lpass_wsa_macro
    bluetooth snd_soc_lpass_tx_macro snd_soc_lpass_va_macro snd_soc_lpass_rx_macro snd_soc_hdmi_codec snd_soc_lpass_macro_common videobuf2_dma_sg ov5675 v4l2_fwnode videobuf2_memops
    qcom_spmi_adc5 snd_soc_core qcom_spmi_adc_tm5 videobuf2_v4l2 snd_seq snd_seq_device videobuf2_common v4l2_async qcom_vadc_common qcom_spmi_temp_alarm pm8941_pwrkey industrialio videodev
    snd_compress rfkill ac97_bus snd_pcm_dmaengine qcom_tsens mc qcom_edac snd_pcm pci_pwrctrl_pwrseq qcom_cpufreq_hw snd_timer snd qcomtee soundcore tee leds_gpio joydev binfmt_misc zram
    lz4hc_compress governor_simpleondemand panel_edp msm xhci_plat_hcd nvme nvme_core dwc3 qcom_pm8008_regulator
    [   15.408688]  ucsi_glink nvme_keyring nvme_auth pmic_glink_altmode udc_core typec_ucsi aux_hpd_bridge qcom_battmgr ulpi ubwc_config socinfo ocmem drm_gpuvm qcom_q6v5_pas drm_exec
    qcom_pil_info leds_qcom_lpg gpu_sched led_class_multicolor rtc_pm8xxx qcom_pbs qcom_common drm_display_helper qcom_pon qcom_glink_smem qcom_glink ghash_ce pwrseq_qcom_wcn gpio_sbu_mux
    qcom_stats phy_qcom_qmp_combo qcom_q6v5 gf128mul cec dispcc_sc8280xp phy_qcom_edp camcc_sc8280xp i2c_qcom_cci qcom_sysmon drm_dp_aux_bus mdt_loader aux_bridge qcom_pm8008 i2c_hid_of_elan
    dwc3_qcom_legacy llcc_qcom icc_bwmon gpi typec qcom_refgen_regulator phy_qcom_qmp_usb nvmem_qfprom qcom_ipcc phy_qcom_snps_femto_v2 gpucc_sc8280xp pinctrl_sc8280xp_lpass_lpi qcom_hwspinlock
    pinctrl_lpass_lpi lpasscc_sc8280xp qrtr qcom_aoss pmic_glink pdr_interface phy_qcom_qmp_pcie qcom_smd qcom_pdr_msg icc_osm_l3 qcom_wdt qmi_helpers qcom_rng smp2p rpmsg_core gpio_keys pwm_bl
    smem hid_multitouch fuse i2c_dev
    [   15.408928] CPU: 2 UID: 0 PID: 14 Comm: kworker/u32:1 Not tainted 7.1.0+ #2 PREEMPT(lazy)
    [   15.408937] Hardware name: LENOVO 21BX0016US/21BX0016US, BIOS N3HET88W (1.60 ) 03/14/2024
    [   15.408942] Workqueue: pm pm_runtime_work
    [   15.408959] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    [   15.408967] pc : gdsc_toggle_logic+0x14c/0x160
    [   15.408978] lr : gdsc_toggle_logic+0x14c/0x160
    [   15.408987] sp : ffff8000800f3b40
    [   15.408991] x29: ffff8000800f3b40 x28: 0000000000000000 x27: 0000000000000000
    [   15.409003] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
    [   15.409014] x23: 0000000000000000 x22: 0000000000000001 x21: ffffa33f298fca88
    [   15.409024] x20: 0000000000000000 x19: ffffa33f298fc5b0 x18: 00cd15db75dacefd
    [   15.409035] x17: 000000040044ffff x16: ffffa33f3b1a3d88 x15: 726f776b80000002
    [   15.409045] x14: ffffffffffffffff x13: 0000000000000028 x12: 0101010101010101
    [   15.409056] x11: 7f7f7f7f7f7f7f7f x10: fefeff3039313274 x9 : ffffa33f3a5edafc
    [   15.409067] x8 : ffff8000800f3780 x7 : 0000000000000001 x6 : 0000000000000001
    [   15.409078] x5 : ffff000bf3ca1288 x4 : 0000000000000000 x3 : ffff5cccb6a3f000
    [   15.409088] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000080ae0000
    [   15.409098] Call trace:
    [   15.409103]  gdsc_toggle_logic+0x14c/0x160 (P)
    [   15.409115]  gdsc_disable+0x4c/0x190
    [   15.409126]  _genpd_power_off+0xa0/0x1a8
    [   15.409137]  genpd_power_off.part.0+0x180/0x2a0
    [   15.409149]  genpd_runtime_suspend+0x218/0x310
    [   15.409155]  __rpm_callback+0x50/0x1f8
    [   15.409166]  rpm_callback+0x7c/0x90
    [   15.409175]  rpm_suspend+0xe8/0x690
    [   15.409185]  pm_runtime_work+0xd0/0xe0
    [   15.409195]  process_one_work+0x18c/0x518
    [   15.409208]  worker_thread+0x190/0x320
    [   15.409218]  kthread+0x110/0x130
    [   15.409227]  ret_from_fork+0x10/0x20

camcc_sc8280xp_probe() has the following snippet:

    /* Keep some clocks always-on */
    qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */

This clock is required for GDSC transitions, so let's add the
CLK_IGNORE_UNUSED flag so that it is not shutdown during the unused
clock sweep.

This was tested on a Lenovo Thinkpad x13s.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Suggested-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sc8280xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 18f5a3eb313e..9a525347fb2a 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -1766,7 +1766,7 @@ static struct clk_branch camcc_gdsc_clk = {
 				&camcc_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
 			.ops = &clk_branch2_ops,
 		},
 	},

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260701-sc8280xp-camcc-gdsc-clk-113497a99f6f

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

