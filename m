Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CE21CAA92
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874382; cv=none; b=i23ofg9D+hbpjfVZmkBvUhvc4egAMc+eGKnO0n3XsrGPKYBr3F7KxrVW+3CLz0WDyCvUPFjfqHx8Km7dFSBJjMy7deKIkVVEaGzMGrL2izZKzWYWbdTuA8slCP5L3qhFtATmE/m3iu3sY/J6bEkR5Ebpwam/vn7RGolL4eVnUEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874382; c=relaxed/simple;
	bh=dV1zMZO7EmGOw2erf3pdS0/4kjvUBr+2XLiFaFWCCzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jp4Ee+VzCmi3UT5S4eHXBS1aQ1BWiQnJ8USoWxFFIQvvr6n3hMngf2SOI26XOrITSFiLAAR2Iy0YIKbe+VojKeWK2tSLVFqu/ZuI1JZgRBt4RCc+YRkJLk+1N8XCU+Yq1ropjaKAVYKuMJ1DKH3xNPsa1HEj+FF57G0FvYZSsSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ddsdiaqH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QD0zPwNd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ddsdiaqH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QD0zPwNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788874364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NLHhVOGygbZejqC5i8njqwFC1rrqYhIiaH4rSU/x68s=;
	b=ddsdiaqHQ6nBP22VSeiymSmHBFmt9CPxRp4wqjugqskhQZ/FjLgmSA3H+bQDmRrvsc5tHn
	f3MfiELJM3pP/GCW946/QHMjEPEjvkdVOUsmkLkOCWHuKRFWFbZCQIh6m4D9aTaVAv5AsO
	L4Ikvv/ksoHgf/Vd+/oH3ulKt611OJE=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-pWRd0rj0NZKM4WM-HwW-Xw-1; Tue, 08 Sep 2026 09:32:42 -0400
X-MC-Unique: pWRd0rj0NZKM4WM-HwW-Xw-1
X-Mimecast-MFC-AGG-ID: pWRd0rj0NZKM4WM-HwW-Xw_1788874361
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-869553205a7so67475767b3.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788874361; x=1789479161; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLHhVOGygbZejqC5i8njqwFC1rrqYhIiaH4rSU/x68s=;
        b=QD0zPwNd3+J/p0qoqlYOYP8/8fFX9+HUivUcTuwp/Icyy9fvdUz4ZDtRP45w/jKA+m
         xlMFTSE2rrBrHQI+DrgBe5/gtlMbbgH0QVpQwIxLQJr7e7VCoMgiuZSGDOn6aNKkJ1n1
         kxcquzNCvUmSWLZ3/YwYRJhnBWOQqveVwEjTmKZpltzgp+HQ711rVNncmSPhXUqQMrjr
         WfcD5zzFMqS7xuv+RBoVTweRK6t3PdBRFKDIyGZBCmdTQXvhXVAMZ+S6z3KBPZCxCrQl
         +LVGZy+/0YHnz8khtNaXepcwnncOQjXC67juwFa/DgiGZ2db9mtWEUHNG2/PX5eE/ril
         Tf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874361; x=1789479161;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NLHhVOGygbZejqC5i8njqwFC1rrqYhIiaH4rSU/x68s=;
        b=pryPiidWWsAWSbi6qViPOm4q82DqqIsvNLgYMi4wKdovIAgg0WRq9TiwMIujkxPPko
         X32gGD8mdGyJvw/U9hSxCTjzGD9z0TPOpSLNMGz7KSD2Wv8aGsD9T0+UXU+0nW+qQ7aQ
         qu4K8de193I3/1vXo+0U1sIZpobSuGp4OCavOAtgVBBN9W3bpVDMlDUu80Ci9CBeFUKL
         TxwRH8rb/NtxsK1x2ePxzJIS+388D9/84arxLzoaC9oV4UoUHIk5VJnGDT9s1czrPtKW
         2uHHt0E27evD8hUnczBn9dfilC/Ce14DHDgr4+iZYUyakv+Z2zXvj6EggLT2cOzmjXZA
         KsbA==
X-Forwarded-Encrypted: i=1; AKwUvBzmjLh+bFYFondLN77a/qrF/cD1r4UL4kHtzAJHNUqebTwI1GC2Sjv2yBytByDBqIJiF61Ax2OSAO8=@vger.kernel.org
X-Gm-Message-State: AFuF++lfancJHa16JJX9TIYZ8IbaMSaUMGJEDaXtRc5nOstZG4YMhnoe
	VhLf1VEsxFU0+zGTOWc0+89QjZY+MFTNkvLRDgmQ++41sR8e/lpK03BbugCq3uekV3OlSB0sfOW
	pKg6kfiATQvNgrgnRW2yNFfI4F5ba98jGGDZy/cOThwPbz8+K2QrjcymCpYXKDQ==
X-Gm-Gg: AYBFou385tkUJW2MMbUyQKgKeAZ7nnr/i4NUeIGg79cIUwTEWDw7pExq+IKy+Owqq7a
	q6XPwb9x1AO7zD4COADXZpQ+lnGEMiSvTqIane4OUxeIjIPSLdODTuh+bX041HSyLoQbQJbDumi
	BvjcppZucbmfz9oP/SQF8acPlKPgyGClqpcCWIzUhprxRxcbhjOVILdi1drdOCZkLLTf5k/fUC5
	XNeHPkpbwVc+PtRE4cjv3tkKp4Qo0xG876JZEacyViDoCwAkh8KcquC5q50uYOECb0/35QVCJEr
	dsm6qwzcs0eRvHFy9EFpM4ghZcOaKO8/lrPhMDKYZWxKs69ycqUQStBNzXXYPddJTdQCuDI2H5r
	wLhrKAeSQKtoFX7Zz1ftyZP8kct4MXzbl1DE=
X-Received: by 2002:a05:690c:dd6:b0:873:5c0f:284 with SMTP id 00721157ae682-8735c0f0419mr84208037b3.46.1788874361295;
        Tue, 08 Sep 2026 06:32:41 -0700 (PDT)
X-Received: by 2002:a05:690c:dd6:b0:873:5c0f:284 with SMTP id 00721157ae682-8735c0f0419mr84207477b3.46.1788874360744;
        Tue, 08 Sep 2026 06:32:40 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413d7f8sm111769461cf.14.2026.09.08.06.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:32:39 -0700 (PDT)
Date: Tue, 8 Sep 2026 09:32:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: unregister CAMCC_GDSC_CLK
Message-ID: <aqAOdSmt3JY4R7uo@redhat.com>
References: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
 <178817257850.3929813.16300278876629611104@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <178817257850.3929813.16300278876629611104@ping.linuxembedded.co.uk>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Kieran,

On Mon, Aug 31, 2026 at 11:36:18AM +0100, Kieran Bingham wrote:
> Hi Brian, Bryan,
>=20
> Quoting Brian Masney (2026-07-08 23:30:06)
> > With the introduction of sync_state support in the clk and pmdomain
> > subsystems, the following warning happens when the unused clocks are
> > shutdown in camcc-sc8280xp:
>=20
>=20
> I've recently switched my Lenovo X13s to Ubuntu 26.04. That's providing
> a Linux 7.0 kernel.
>=20
> Unfortunately - the camera can only run once. On successive attempts I
> get a kernel WARN log like this.
>=20
> Bryan pointed me at this patch, which I see is already in mainline.
>=20
> So I've booted v7.2-16202-g08dbfad3f504 from yesterdays torvalds/master
> which I believe incorporates the patch in this thread and I get the
> following trace:
>=20
>=20
> [11525.260456] ------------[ cut here ]------------
> [11525.260463] titan_top_gdsc status stuck at 'off'
> [11525.260475] WARNING: drivers/clk/qcom/gdsc.c:192 at gdsc_toggle_logic+=
0x20c/0x220, CPU#5: CameraManager/26167
> [11525.260486] Modules linked in: btrfs xor libblake2b raid6_pq ufs qnx4 =
hfsplus hfs minix ntfs msdos jfs nls_ucs2_utils xfs usbhid xt_connmark xt_c=
onntrack xt_MASQUERADE xt_tcpudp xt_mark nft_compat x_tables nft_chain_nat =
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfcomm algif_hash algif_s=
kcipher af_alg snd_seq_dummy snd_hrtimer nf_tables bnep snd_soc_wsa883x q6p=
rm_clocks q6apm_dai q6apm_lpass_dais snd_q6dsp_common q6prm qrtr_mhi ath11k=
_pci ath11k mac80211 cfg80211 mhi libarc4 qcom_spmi_adc_tm5 qcom_spmi_adc5 =
qcom_vadc_common qcom_spmi_temp_alarm pm8941_pwrkey industrialio snd_soc_sc=
8280xp snd_soc_wcd938x snd_soc_wcd938x_sdw snd_soc_qcom_sdw snd_soc_wcd_cla=
ssh snd_soc_qcom_common snd_soc_wcd_common snd_soc_wcd_mbhc regmap_sdw snd_=
seq_midi snd_seq_midi_event qcom_iris snd_rawmidi qcom_camss v4l2_mem2mem s=
oundwire_qcom videobuf2_dma_contig hci_uart videobuf2_dma_sg snd_seq videob=
uf2_memops btqca videobuf2_v4l2 btrtl snd_soc_lpass_va_macro snd_soc_lpass_=
tx_macro snd_soc_lpass_wsa_macro slimbus snd_soc_lpass_rx_macro
> [11525.260552]  btbcm soundwire_bus ov5675 snd_soc_lpass_macro_common vid=
eobuf2_common snd_q6apm btintel qcomtee v4l2_fwnode snd_seq_device binfmt_m=
isc snd_soc_hdmi_codec v4l2_async bluetooth videodev qcom_tsens qcom_edac m=
c snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine snd_pcm fastrpc snd_=
timer tee qcom_cpufreq_hw pci_pwrctrl_pwrseq snd soundcore leds_gpio nls_is=
o8859_1 joydev input_leds sch_fq_codel efi_pstore dm_crypt leds_qcom_lpg xh=
ci_plat_hcd panel_edp hid_multitouch hid_generic led_class_multicolor qcom_=
pbs qcom_pon reboot_mode pinctrl_spmi_gpio rtc_pm8xxx qcom_pm8008_regulator=
 nvme nvme_core i2c_hid_of nvme_keyring nvme_auth i2c_hid_of_elan i2c_hid_a=
cpi_prp0001 apr qcom_spmi_pmic i2c_hid qcom_pm8008 regmap_spmi hid rpmsg_ct=
rl dwc3 rpmsg_char qrtr_smd ulpi qcom_pd_mapper udc_core msm ucsi_glink pmi=
c_glink_altmode typec_ucsi aux_hpd_bridge qcom_battmgr socinfo ubwc_config =
ocmem drm_gpuvm drm_exec gpu_sched spmi_pmic_arb spmi_devres drm_display_he=
lper qcom_stats spmi cec dispcc_sc8280xp camcc_sc8280xp
> [11525.260623]  phy_qcom_edp rc_core i2c_qcom_cci videocc_sm8350 i2c_qcom=
_geni phy_qcom_qmp_combo llcc_qcom gpi phy_qcom_qmp_usb gpucc_sc8280xp icc_=
bwmon aux_bridge drm_dp_aux_bus dwc3_qcom_legacy qcom_refgen_regulator nvme=
m_qfprom phy_qcom_snps_femto_v2 qcom_q6v5_pas qcom_pil_info qcom_common qco=
m_glink_smem qcom_glink qcom_q6v5 qcom_sysmon aes_ce_blk mdt_loader qrtr gh=
ash_ce pinctrl_sc8280xp_lpass_lpi pmic_glink qcom_aoss gpio_sbu_mux pinctrl=
_lpass_lpi qcom_rpmh_regulator gf128mul lpasscc_sc8280xp qcom_smd phy_qcom_=
qmp_pcie pdr_interface qcom_hwspinlock icc_osm_l3 typec qcom_pdr_msg pwrseq=
_qcom_wcn qmi_helpers gpio_keys sm4 rpmsg_core thunderbolt pwm_bl smp2p qco=
m_smem fixed dm_mirror dm_region_hash dm_log dmi_sysfs autofs4
> [11525.260673] CPU: 5 UID: 1000 PID: 26167 Comm: CameraManager Kdump: loa=
ded Tainted: G        W           7.2.0+ #6 PREEMPT(lazy)
> [11525.260676] Tainted: [W]=3DWARN
> [11525.260677] Hardware name: LENOVO 21BX000WUK/21BX000WUK, BIOS N3HET88W=
 (1.60 ) 03/14/2024
> [11525.260678] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [11525.260680] pc : gdsc_toggle_logic+0x20c/0x220
> [11525.260682] lr : gdsc_toggle_logic+0x20c/0x220
> [11525.260685] sp : ffff80009157b5e0
> [11525.260685] x29: ffff80009157b5e0 x28: ffffc78a55f6fd28 x27: ffff00008=
83bd130
> [11525.260688] x26: 0000000000000001 x25: 0000000000000000 x24: ffffc78a5=
535bab0
> [11525.260691] x23: 0000000000000000 x22: 0000000000000000 x21: 000000000=
0000001
> [11525.260693] x20: 00000000ffffff92 x19: ffffc78a5535b690 x18: ffff80008=
ddc5108
> [11525.260696] x17: 0000000000000000 x16: 0000000000000000 x15: 0000fe3dc=
40ab158
> [11525.260699] x14: ffffffffffffffff x13: 0000000000000028 x12: 010101010=
1010101
> [11525.260701] x11: 7f7f7f7f7f7f7f7f x10: 0000000000000000 x9 : 000000000=
0000000
> [11525.260704] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 000000000=
0000000
> [11525.260706] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 000000000=
0000000
> [11525.260708] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 000000000=
0000000
> [11525.260712] Call trace:
> [11525.260713]  gdsc_toggle_logic+0x20c/0x220 (P)
> [11525.260716]  gdsc_enable+0x6c/0x2a8
> [11525.260718]  _genpd_power_on+0xc0/0x208
> [11525.260721]  genpd_power_on+0x10c/0x280
> [11525.260723]  genpd_runtime_resume+0x154/0x358
> [11525.260726]  __rpm_callback+0x54/0x210
> [11525.260729]  rpm_callback+0x78/0x90
> [11525.260731]  rpm_resume+0x588/0x768
> [11525.260734]  __pm_runtime_resume+0x68/0xd8
> [11525.260736]  rpm_get_suppliers+0x4c/0x1a8
> [11525.260739]  __rpm_callback+0x180/0x210
> [11525.260741]  rpm_callback+0x78/0x90
> [11525.260744]  rpm_resume+0x588/0x768
> [11525.260746]  __pm_runtime_resume+0x68/0xd8
> [11525.260748]  csiphy_set_power+0x50/0x3a8 [qcom_camss]
> [11525.260760]  pipeline_pm_power_one+0x16c/0x188 [videodev]
> [11525.260777]  pipeline_pm_power+0x94/0x138 [videodev]
> [11525.260787]  v4l2_pipeline_pm_use+0x60/0xb8 [videodev]
> [11525.260796]  v4l2_pipeline_pm_get+0x20/0x48 [videodev]
> [11525.260805]  video_prepare_streaming+0x28/0xa0 [qcom_camss]
> [11525.260813]  vb2_core_streamon+0x60/0x1f0 [videobuf2_common]
> [11525.260819]  vb2_ioctl_streamon+0x58/0xb8 [videobuf2_v4l2]
> [11525.260823]  v4l_streamon+0x30/0x60 [videodev]
> [11525.260833]  __video_do_ioctl+0x330/0x4c8 [videodev]
> [11525.260843]  video_usercopy+0x374/0x898 [videodev]
> [11525.260853]  video_ioctl2+0x24/0xb8 [videodev]
> [11525.260862]  v4l2_ioctl+0x70/0xc8 [videodev]
> [11525.260872]  __arm64_sys_ioctl+0xd4/0x168
> [11525.260875]  invoke_syscall+0xa8/0x138
> [11525.260878]  el0_svc_common.constprop.0+0x4c/0x140
> [11525.260880]  do_el0_svc+0x28/0x58
> [11525.260881]  el0_svc+0x48/0x310
> [11525.260885]  el0t_64_sync_handler+0xc0/0x108
> [11525.260888]  el0t_64_sync+0x1b8/0x1c0
> [11525.260890] ---[ end trace 0000000000000000 ]---
> [11525.260901] qcom-camss ac5a000.camss: Failed to power up pipeline: -110
>=20
>=20
> Slightly different trace, but it's the same WARN except:
>=20
>  [11525.260463] titan_top_gdsc status stuck at 'off'
>=20
> instead of
>=20
>  [   15.408367] titan_top_gdsc status stuck at 'on'
>=20
> Does anyone have any insights to debugging this, or is anyone else
> testing on a Lenovo x13s recently?
>=20
> Before putting Ubuntu on this laptop, I used to run a branch from
> Jhovald (https://github.com/jhovold/linux/tree/wip/sc8280xp-6.16), which
> I always had success with, and I think at that point all the camera
> support was mainline, so I can likely go back to that and then bisect to
> master if that's worth the time.

I'll be honest that I'm not sure. Does reverting this patch fix the
issue? If so, leave it reverted, and check to see if adding the
CLK_IGNORE_UNUSED flag works for you via this patch?

https://lore.kernel.org/linux-arm-msm/20260701-sc8280xp-camcc-gdsc-clk-v1-1=
-ee28be1e8508@redhat.com/

Brian

