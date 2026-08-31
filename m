Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89B02C15A5;
	Mon, 31 Aug 2026 10:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172585; cv=none; b=V8ejf//39Pp2DqiAm/0JJsynXrCcYaSamJ3ZSupmMXnWYea451eDkIEeSEIq9m+W8XCJTl3CiKys9GjWYq3z4jyzPG4o1scShXI7Kk9YOwv6c5Mb7m8nCzmCRJ5gubj0Wd0bxRxzhA0lp4qW+xclae6ccyhbbp2fWSGS2OB3JaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172585; c=relaxed/simple;
	bh=KBFgIbv9Rk6IokVvbDRQ9fNg4+KOQnXPvMP6h367nmk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Er18zRoNH2U1Ka2JerkNYbqaV0wHoEeAzGklWS36ddw6S6Ig7TDEgaUCokWxdzWlfr4NmSy6DbXuVl29PuUylZNwqoC45prN3o7xMxhjvDU9vgDoQ47meFuEHdhVdCn1SIMfRJQIyrGvE03BVqGHe6iJbb6J0Ss+IM8Fny6MibI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S/fbMcyn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S/fbMcyn"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16C3F593;
	Mon, 31 Aug 2026 12:34:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788172491;
	bh=KBFgIbv9Rk6IokVvbDRQ9fNg4+KOQnXPvMP6h367nmk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=S/fbMcynsZydjMBk1pcv3OtzpKkZl5TgFMaI+7SJfxDUB+BLUmjvxwFtv+Uokv5qA
	 YrVJ2Fq+B9d0bA1l+rvimhNEXz377DGxrKR0SI3trjTEa8MahNs5LXAqfHrdKA2L9L
	 eKnh8M0C23+xLkfszO0WiC1f1ucyJgY8YqBH26hQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
References: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: unregister CAMCC_GDSC_CLK
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, Brian Masney <bmasney@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, Brian Masney <bmasney@redhat.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Date: Mon, 31 Aug 2026 11:36:18 +0100
Message-ID: <178817257850.3929813.16300278876629611104@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi Brian, Bryan,

Quoting Brian Masney (2026-07-08 23:30:06)
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:


I've recently switched my Lenovo X13s to Ubuntu 26.04. That's providing
a Linux 7.0 kernel.

Unfortunately - the camera can only run once. On successive attempts I
get a kernel WARN log like this.

Bryan pointed me at this patch, which I see is already in mainline.

So I've booted v7.2-16202-g08dbfad3f504 from yesterdays torvalds/master
which I believe incorporates the patch in this thread and I get the
following trace:


[11525.260456] ------------[ cut here ]------------
[11525.260463] titan_top_gdsc status stuck at 'off'
[11525.260475] WARNING: drivers/clk/qcom/gdsc.c:192 at gdsc_toggle_logic+0x=
20c/0x220, CPU#5: CameraManager/26167
[11525.260486] Modules linked in: btrfs xor libblake2b raid6_pq ufs qnx4 hf=
splus hfs minix ntfs msdos jfs nls_ucs2_utils xfs usbhid xt_connmark xt_con=
ntrack xt_MASQUERADE xt_tcpudp xt_mark nft_compat x_tables nft_chain_nat nf=
_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfcomm algif_hash algif_skc=
ipher af_alg snd_seq_dummy snd_hrtimer nf_tables bnep snd_soc_wsa883x q6prm=
_clocks q6apm_dai q6apm_lpass_dais snd_q6dsp_common q6prm qrtr_mhi ath11k_p=
ci ath11k mac80211 cfg80211 mhi libarc4 qcom_spmi_adc_tm5 qcom_spmi_adc5 qc=
om_vadc_common qcom_spmi_temp_alarm pm8941_pwrkey industrialio snd_soc_sc82=
80xp snd_soc_wcd938x snd_soc_wcd938x_sdw snd_soc_qcom_sdw snd_soc_wcd_class=
h snd_soc_qcom_common snd_soc_wcd_common snd_soc_wcd_mbhc regmap_sdw snd_se=
q_midi snd_seq_midi_event qcom_iris snd_rawmidi qcom_camss v4l2_mem2mem sou=
ndwire_qcom videobuf2_dma_contig hci_uart videobuf2_dma_sg snd_seq videobuf=
2_memops btqca videobuf2_v4l2 btrtl snd_soc_lpass_va_macro snd_soc_lpass_tx=
_macro snd_soc_lpass_wsa_macro slimbus snd_soc_lpass_rx_macro
[11525.260552]  btbcm soundwire_bus ov5675 snd_soc_lpass_macro_common video=
buf2_common snd_q6apm btintel qcomtee v4l2_fwnode snd_seq_device binfmt_mis=
c snd_soc_hdmi_codec v4l2_async bluetooth videodev qcom_tsens qcom_edac mc =
snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine snd_pcm fastrpc snd_ti=
mer tee qcom_cpufreq_hw pci_pwrctrl_pwrseq snd soundcore leds_gpio nls_iso8=
859_1 joydev input_leds sch_fq_codel efi_pstore dm_crypt leds_qcom_lpg xhci=
_plat_hcd panel_edp hid_multitouch hid_generic led_class_multicolor qcom_pb=
s qcom_pon reboot_mode pinctrl_spmi_gpio rtc_pm8xxx qcom_pm8008_regulator n=
vme nvme_core i2c_hid_of nvme_keyring nvme_auth i2c_hid_of_elan i2c_hid_acp=
i_prp0001 apr qcom_spmi_pmic i2c_hid qcom_pm8008 regmap_spmi hid rpmsg_ctrl=
 dwc3 rpmsg_char qrtr_smd ulpi qcom_pd_mapper udc_core msm ucsi_glink pmic_=
glink_altmode typec_ucsi aux_hpd_bridge qcom_battmgr socinfo ubwc_config oc=
mem drm_gpuvm drm_exec gpu_sched spmi_pmic_arb spmi_devres drm_display_help=
er qcom_stats spmi cec dispcc_sc8280xp camcc_sc8280xp
[11525.260623]  phy_qcom_edp rc_core i2c_qcom_cci videocc_sm8350 i2c_qcom_g=
eni phy_qcom_qmp_combo llcc_qcom gpi phy_qcom_qmp_usb gpucc_sc8280xp icc_bw=
mon aux_bridge drm_dp_aux_bus dwc3_qcom_legacy qcom_refgen_regulator nvmem_=
qfprom phy_qcom_snps_femto_v2 qcom_q6v5_pas qcom_pil_info qcom_common qcom_=
glink_smem qcom_glink qcom_q6v5 qcom_sysmon aes_ce_blk mdt_loader qrtr ghas=
h_ce pinctrl_sc8280xp_lpass_lpi pmic_glink qcom_aoss gpio_sbu_mux pinctrl_l=
pass_lpi qcom_rpmh_regulator gf128mul lpasscc_sc8280xp qcom_smd phy_qcom_qm=
p_pcie pdr_interface qcom_hwspinlock icc_osm_l3 typec qcom_pdr_msg pwrseq_q=
com_wcn qmi_helpers gpio_keys sm4 rpmsg_core thunderbolt pwm_bl smp2p qcom_=
smem fixed dm_mirror dm_region_hash dm_log dmi_sysfs autofs4
[11525.260673] CPU: 5 UID: 1000 PID: 26167 Comm: CameraManager Kdump: loade=
d Tainted: G        W           7.2.0+ #6 PREEMPT(lazy)
[11525.260676] Tainted: [W]=3DWARN
[11525.260677] Hardware name: LENOVO 21BX000WUK/21BX000WUK, BIOS N3HET88W (=
1.60 ) 03/14/2024
[11525.260678] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[11525.260680] pc : gdsc_toggle_logic+0x20c/0x220
[11525.260682] lr : gdsc_toggle_logic+0x20c/0x220
[11525.260685] sp : ffff80009157b5e0
[11525.260685] x29: ffff80009157b5e0 x28: ffffc78a55f6fd28 x27: ffff0000883=
bd130
[11525.260688] x26: 0000000000000001 x25: 0000000000000000 x24: ffffc78a553=
5bab0
[11525.260691] x23: 0000000000000000 x22: 0000000000000000 x21: 00000000000=
00001
[11525.260693] x20: 00000000ffffff92 x19: ffffc78a5535b690 x18: ffff80008dd=
c5108
[11525.260696] x17: 0000000000000000 x16: 0000000000000000 x15: 0000fe3dc40=
ab158
[11525.260699] x14: ffffffffffffffff x13: 0000000000000028 x12: 01010101010=
10101
[11525.260701] x11: 7f7f7f7f7f7f7f7f x10: 0000000000000000 x9 : 00000000000=
00000
[11525.260704] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 00000000000=
00000
[11525.260706] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000000=
00000
[11525.260708] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 00000000000=
00000
[11525.260712] Call trace:
[11525.260713]  gdsc_toggle_logic+0x20c/0x220 (P)
[11525.260716]  gdsc_enable+0x6c/0x2a8
[11525.260718]  _genpd_power_on+0xc0/0x208
[11525.260721]  genpd_power_on+0x10c/0x280
[11525.260723]  genpd_runtime_resume+0x154/0x358
[11525.260726]  __rpm_callback+0x54/0x210
[11525.260729]  rpm_callback+0x78/0x90
[11525.260731]  rpm_resume+0x588/0x768
[11525.260734]  __pm_runtime_resume+0x68/0xd8
[11525.260736]  rpm_get_suppliers+0x4c/0x1a8
[11525.260739]  __rpm_callback+0x180/0x210
[11525.260741]  rpm_callback+0x78/0x90
[11525.260744]  rpm_resume+0x588/0x768
[11525.260746]  __pm_runtime_resume+0x68/0xd8
[11525.260748]  csiphy_set_power+0x50/0x3a8 [qcom_camss]
[11525.260760]  pipeline_pm_power_one+0x16c/0x188 [videodev]
[11525.260777]  pipeline_pm_power+0x94/0x138 [videodev]
[11525.260787]  v4l2_pipeline_pm_use+0x60/0xb8 [videodev]
[11525.260796]  v4l2_pipeline_pm_get+0x20/0x48 [videodev]
[11525.260805]  video_prepare_streaming+0x28/0xa0 [qcom_camss]
[11525.260813]  vb2_core_streamon+0x60/0x1f0 [videobuf2_common]
[11525.260819]  vb2_ioctl_streamon+0x58/0xb8 [videobuf2_v4l2]
[11525.260823]  v4l_streamon+0x30/0x60 [videodev]
[11525.260833]  __video_do_ioctl+0x330/0x4c8 [videodev]
[11525.260843]  video_usercopy+0x374/0x898 [videodev]
[11525.260853]  video_ioctl2+0x24/0xb8 [videodev]
[11525.260862]  v4l2_ioctl+0x70/0xc8 [videodev]
[11525.260872]  __arm64_sys_ioctl+0xd4/0x168
[11525.260875]  invoke_syscall+0xa8/0x138
[11525.260878]  el0_svc_common.constprop.0+0x4c/0x140
[11525.260880]  do_el0_svc+0x28/0x58
[11525.260881]  el0_svc+0x48/0x310
[11525.260885]  el0t_64_sync_handler+0xc0/0x108
[11525.260888]  el0t_64_sync+0x1b8/0x1c0
[11525.260890] ---[ end trace 0000000000000000 ]---
[11525.260901] qcom-camss ac5a000.camss: Failed to power up pipeline: -110


Slightly different trace, but it's the same WARN except:

 [11525.260463] titan_top_gdsc status stuck at 'off'

instead of

 [   15.408367] titan_top_gdsc status stuck at 'on'

Does anyone have any insights to debugging this, or is anyone else
testing on a Lenovo x13s recently?

Before putting Ubuntu on this laptop, I used to run a branch from
Jhovald (https://github.com/jhovold/linux/tree/wip/sc8280xp-6.16), which
I always had success with, and I think at that point all the camera
support was mainline, so I can likely go back to that and then bisect to
master if that's worth the time.

--
Regards

Kieran


>=20
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
>=20
> This clock is force enabled to be on in the probe, and registered with
> the Common Clk Framework, resulting in them being toggled off after
> unused clocks are shutdown. This clock is required for the GDSC
> transitions.
>=20
> Similar to the fix in commit b60521eff227 ("clk: qcom: gcc-x1e80100:
> Unregister GCC_GPU_CFG_AHB_CLK/GCC_DISP_XO_CLK"), let's just unregister
> this clock.
>=20
> Link: https://lore.kernel.org/linux-clk/20260626-camcc-sc8280xp-titan-top=
-v1-1-2ca246886493@redhat.com/
> Fixes: ff93872a9c616 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
> Suggested-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/qcom/camcc-sc8280xp.c | 19 -------------------
>  1 file changed, 19 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-s=
c8280xp.c
> index e97b8d4f3c84..660d8655d391 100644
> --- a/drivers/clk/qcom/camcc-sc8280xp.c
> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
> @@ -1753,24 +1753,6 @@ static struct clk_branch camcc_csiphy3_clk =3D {
>         },
>  };
> =20
> -static struct clk_branch camcc_gdsc_clk =3D {
> -       .halt_reg =3D 0xc1e4,
> -       .halt_check =3D BRANCH_HALT,
> -       .clkr =3D {
> -               .enable_reg =3D 0xc1e4,
> -               .enable_mask =3D BIT(0),
> -               .hw.init =3D &(struct clk_init_data){
> -                       .name =3D "camcc_gdsc_clk",
> -                       .parent_hws =3D (const struct clk_hw*[]){
> -                               &camcc_xo_clk_src.clkr.hw,
> -                       },
> -                       .num_parents =3D 1,
> -                       .flags =3D CLK_SET_RATE_PARENT,
> -                       .ops =3D &clk_branch2_ops,
> -               },
> -       },
> -};
> -
>  static struct clk_branch camcc_icp_ahb_clk =3D {
>         .halt_reg =3D 0xc0d8,
>         .halt_check =3D BRANCH_HALT,
> @@ -2839,7 +2821,6 @@ static struct clk_regmap *camcc_sc8280xp_clocks[] =
=3D {
>         [CAMCC_CSIPHY2_CLK] =3D &camcc_csiphy2_clk.clkr,
>         [CAMCC_CSIPHY3_CLK] =3D &camcc_csiphy3_clk.clkr,
>         [CAMCC_FAST_AHB_CLK_SRC] =3D &camcc_fast_ahb_clk_src.clkr,
> -       [CAMCC_GDSC_CLK] =3D &camcc_gdsc_clk.clkr,
>         [CAMCC_ICP_AHB_CLK] =3D &camcc_icp_ahb_clk.clkr,
>         [CAMCC_ICP_CLK] =3D &camcc_icp_clk.clkr,
>         [CAMCC_ICP_CLK_SRC] =3D &camcc_icp_clk_src.clkr,
>=20
> ---
> base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
> change-id: 20260708-camcc-sc8280xp-remove-gdsc-bae01f4008e4
>=20
> Best regards,
> --=20
> Brian Masney <bmasney@redhat.com>
>=20
>
