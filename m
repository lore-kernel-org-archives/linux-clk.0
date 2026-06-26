Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65AF3F928E
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491234; cv=none; b=Tm2tkNTs54WkHWssng8dIYb7YMSrCNopraBUaMAmX7jhg+MVBOxc16dgsLzxUqhnTQfgBxVRp83VBzvCa2tcfgG2gH2Pk3+sWd5i7P+WCvNEOlzWp8bvKmLGzEkaknMKMD+C50Ia6neB+QG/joEHvtSt7MSR4nZ4sFL5vHKL6kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491234; c=relaxed/simple;
	bh=/xPtRf9h640L0st1kQdoPeLkZA5DWVw0vwvLxaUC1z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eTkRzTjrkil9xiWBo6DHL0BSr1ccNJ1n3gx7zUIEMPmo1sY/iMX+kN85Nt2jO3mxIerkXfflYVjZjw2/cL389Ixk7xb2jO3y5/0zQitZAumFv+DfQZTIxZGPhWDeEP8fR5AcUh0L4UGI82IhpWXUKef1aUNW4KSUiQYwCSl9CLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CgPVolzf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=llJEw0Lp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CgPVolzf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="llJEw0Lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782491231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OH9AgO5IGQm1EQUN9NPt6bY+A8mHbJkrvaUgy5yBKLY=;
	b=CgPVolzf9pBRmbiEL7R8TR2XX/Nrh2y0sD9hjqw4bjppu5UtxeISreMa+AAAjD6VNNWBwk
	6JOIUGQP/g8IKpZMu5ZKDhJOhHorHkKJwU3PEipNzJVdrwRXEs/7nRO+VExNu8qX81aq9l
	29X7xO7xhYFq0n7xOEIHdmE9AkQur2Q=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-9E6ySOaNMzOK20djohRWKQ-1; Fri, 26 Jun 2026 12:27:10 -0400
X-MC-Unique: 9E6ySOaNMzOK20djohRWKQ-1
X-Mimecast-MFC-AGG-ID: 9E6ySOaNMzOK20djohRWKQ_1782491230
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92b447639d3so40926785a.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782491230; x=1783096030; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OH9AgO5IGQm1EQUN9NPt6bY+A8mHbJkrvaUgy5yBKLY=;
        b=llJEw0LpVhKzWaacuJPj6dRfIDzpsStMoUEbzjfsGUrPy2H29dl5AYOtszx3Yt+h+Z
         VhJ6lo8f3fZsiqDsTgX1XbKhD7rBNEudZ7ZYMzpYIKIm1XkGgUEF9pfLuKQCzL6Rw30x
         pUGdy97LWQ9l8GVo7FGAwFJ1mMnqHI8uNZidbRCwJNE8WhULs75kbalRmwxjkM9dK6pm
         daOCxoVKPxgiDabiswaQBSIWuRnCl+UzfBgXPsDBTXejYoEKtwyfMGYTl5batx9oKaN5
         Hk4UyLkCPtgp5pSvHFlca+WPy0ddiL4qYIEBqXLFNuK6RdN2qbTxp4Iji3jx3rzJWseR
         E/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491230; x=1783096030;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OH9AgO5IGQm1EQUN9NPt6bY+A8mHbJkrvaUgy5yBKLY=;
        b=k5C22vRHRZhF3qf8cmL4QvOU0hkwmdSUgHr1yrkuywYzeUWIel4RTzIQv9CswiTWXk
         HGf80pwczQ7DfI09DbvfgJuM6gOXvUohKYJ8MCPEApAqGbos/DToUp5aJAoCAMLo5NIH
         L3td+OHLl+JDbSMY6zB0hOxCJ9TPVb3NL11hbWkMZgbHF3eHfZEtOTM4AwzLtwdP1QN2
         mAB2LCUtJvLJGP7oJD2Ss0TJlHJCYE2gCTwkct1YqjZvOuFw8TiC2zJ63ssFdrGCRzCz
         R+d6q4PIUH+SuQEa020TLv+dbBHymA1PPq0m1NoLXyz4gaLoVixpT4Y3Ro8F5m3Itrwb
         vbaA==
X-Forwarded-Encrypted: i=1; AFNElJ/XhyMTiNXNCrd6uQbqTL36MGEnyi3WUANv6pngINn55ISKGts4DcFp6mc4+4jQ6b3KJnOWFG4nx70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/yfHzMdbhPgnfPqS+i3BI0C2fi4AuyxNr8o60f1IW5vBRWtCl
	5AyNwu0STotL90Vs8hd9j6nh7+qVZ0AjM23uOM/Nq1dHGa6dFqxIe/pVuzlHjfWMCvKUA/tiRF+
	mFF7bWIT6xdMZyVoeEGPf69MSse4FtjU3xxcctnlOAxXG8aXUz/rygu+u5wp1Jg==
X-Gm-Gg: AfdE7cm45bm7HWVr173rXCX+9D/wSTZPS/rRctCOOVEKyGca37nPzt/F53uVQwbUjDI
	vzge7KmP78zlMnI2b01EzsIQU/lnIV7h8ai+kAQ/t+cdHgxyRjz1jlueuoPdzTYxBWpb9yNJx4N
	gVsRpX/AWGzIei4zMUKhgzd8j6XxxcbTdX2xw0qTLexrACNjZbaRje6HAHo+qN1zuxEuA8sbIVn
	l5biUN7rNRsPwDJVFQE4LdPbmKaZ9U/SXS5zjWfw7E9FH4CjiVsPfwCnK+AWhMo/PJghDpEr1WC
	qcqttwG6uFX2vESoVjSq4TsJZ5ifHFU5/+UA9n5FDWbxqoaelsZr2mREqifbFaQPkTabumwV5gN
	v2ap0fIS0VXXgICfFnqJRMn3ihE74Z9jN/Ex+NBO+un3RLNBMpw==
X-Received: by 2002:a05:620a:2783:b0:915:675d:a2d with SMTP id af79cd13be357-9293e3beed4mr1155259485a.51.1782491229837;
        Fri, 26 Jun 2026 09:27:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2783:b0:915:675d:a2d with SMTP id af79cd13be357-9293e3beed4mr1155231685a.51.1782491226646;
        Fri, 26 Jun 2026 09:27:06 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-925fd390e76sm1199391485a.3.2026.06.26.09.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:27:05 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 26 Jun 2026 12:26:41 -0400
Subject: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1gZq0ahzFZlFjVGzmFraMgji3
 S0u3+L/C5JElQSf6oIof016+IKmroB35zdBXYrBGkuGLCG7HzMmHuxgzoBZs/OYj4DNSLxS3/V
 zO0LJQ5RVz3c9fe/7AW7pJMVqAAAA
X-Change-ID: 20260626-camcc-sc8280xp-titan-top-196cf6757b49
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5375; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=/xPtRf9h640L0st1kQdoPeLkZA5DWVw0vwvLxaUC1z8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLsVoQVzfz/dKOg1EPWdUqccqtDPb+EXkuNW7jwmr/3/
 +knWqM2dpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARjWCG/57CEp35hUXX/m07
 +nu6M9uHS7kKCwPqDE9PNpjv+GXXLm5GhmcnNM/zidyTSdo6p+5s2akZaRI7Hu3L/3as6kwk03G
 Pfg4A
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

Let's go ahead and add the flag ALWAYS_ON to titan_top_gdsc so that it
is not disabled in the unused clock sweep.

Fixes: ff93872a9c616 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-6
---
 drivers/clk/qcom/camcc-sc8280xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 18f5a3eb313e..52e1a786083f 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -2803,7 +2803,7 @@ static struct gdsc titan_top_gdsc = {
 	.pd = {
 		.name = "titan_top_gdsc",
 	},
-	.flags = RETAIN_FF_ENABLE,
+	.flags = ALWAYS_ON | RETAIN_FF_ENABLE,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

---
base-commit: 6c94b38b83a04c43ea49004275f0391404051093
change-id: 20260626-camcc-sc8280xp-titan-top-196cf6757b49

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

