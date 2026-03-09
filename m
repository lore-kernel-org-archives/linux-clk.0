Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E7238F926
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052086; cv=pass; b=A95yyG222TnlD04yMlAFV2adwYDMOF7Sa8eAaev9jZdV6pIewKwmRsRN9zxfrnWgarTbCY7+IifTHOau6FcH53s43ROtUYThKfigyts3QiSK6EJhwGKEIBerhaLxLOfpWFofrhjCWXwTWuph5ND1xJ+QMJFTOJ6hRl+n09OFrMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052086; c=relaxed/simple;
	bh=6f14elA8IIirriRdqQ4qpy+0nJEZrJZL2kf6Ne8X864=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cmWj6xi2T+1Nj5rkMxsbxnaAmo14k76ZBRc3zmFwCpthsq8pZZ4pq9U9rmds6bxvhnr2GZLlpnXZt/NqwFV10wxJfV2U3ZJMx4lW3OjOTPlI3rs885X5ZczVoNLSN7pNTdm1nfzBd0gb/Gom95061+JfcGwZer9O3w+NBQ05XR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3aSE+L+; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3aSE+L+"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94acf9ce1b7so7577539241.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 03:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773052082; cv=none;
        d=google.com; s=arc-20240605;
        b=aDa31y4d/XRQxnlbqR3is1Un6Px7PXHtmqd1Ja2wzFnulZfiddt/Ue/mLnJT/3FG4V
         W4i44WccvvxRWl8BwM3ZtT1ElNvjurWscwiXcp4QFj5Wra/z5W4dUR7GkMfmeR6rMh27
         uzLyOAYDsNvMB+49CLqRLaf9sGHLgC6VZwgg0Z5PbCZzc/z7Cn46+yu1jCiaAXeRPwMz
         XKfbD6b55kaLgvDK8lzgHvtKFsUQ+UQhjJ2i/hUYTpEmYsT9/ZoKwlyQ1TvfXCCTKVf3
         zcLl3EUn1OQDx/9C6lDv0bh9Zxy2x69rHx4mgCKvoU0GXm5k1prrjo0rtsokh1ROax2p
         1low==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=47FvQEMiG9H1DdZUcvw6rDThxg0r8NhOMc8DeHXZ1bg=;
        fh=IP6VXw/zUAp/kLDiVtKynPt0i+J2XD/aBDcDP5XpD3k=;
        b=BUKGqwa8iEf5riyqYJeYe/uPrVvpDjaDLD1aawc2pX+pbJF3rVuMX8pID0GlYvQ/nJ
         3lJ03q+u4vaK5HxbfMdDYhkRekFhi3NTjMgm2056y9+LyHWcx0Ain74r5Jkz2bQ5I2vV
         hj7MuA63e2qdbiBMGVJyTXXlfc+omGs+D9VMBVo9vEdwFGMOxM+ajgZ4kEXdEMqQtSQX
         6AnhI50p5rOtZzgQC5BSLXDAYMpKlGtX1aTytuvqbZhZNefsJQ4Y27za5FqKVISBwyMT
         fMDaTHMxbHRg/wNdx3HQVnTPv59tNsKuMZvRowwM5OsUkFqDsoE+wepDYKctSJzj+6Ru
         IGXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773052082; x=1773656882; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=47FvQEMiG9H1DdZUcvw6rDThxg0r8NhOMc8DeHXZ1bg=;
        b=d3aSE+L+Nv/30Fp7G6KsCXcMzHtTYr/77eC/KOeAaPRtmSI1NLtJrZHR37FdQbdWTi
         G5xSFFwK1z6/EF/pz9nSIbBbGkNPodOoNTQm+yXZmMdNUzW30jhBiCG8jFhe/s+MOWVw
         ydauJeB/YWK/6El/r+QJUNi2RLW/cfaioC/F+qr49ZMS+HKLOH1j/lCOvWMONDVBVAt4
         OaZkq+uYL5f2/Wy1DvMBXm0eEFQ0czrvkyhLaMPRC0XGVQ33HSZyJ3CyyamRMBsZ3HgS
         bX9C14rYlEevX5ROtOTrW4WkXMywUfNwzNmA0GjAEl5qz0w+msMleDJLcFvboCgcozAe
         hGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052082; x=1773656882;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47FvQEMiG9H1DdZUcvw6rDThxg0r8NhOMc8DeHXZ1bg=;
        b=tXHysnaCc8R5hFngIxF2lySEyBPldZaIFi3l4MZHt4BTtJn2iaY6o68xK6vVik2cej
         ITJs9+TWmUwv2CAox7xgDcmYXf4VyWa0oknp4cdnQNiKiTlMxbzKwLFfnwi/obGBTB1y
         Fx9ETv41C+GAdB1qaUn42Y4kfKQWxOPiIsBWTeeO9DKoBKKydEgIU5FiV6V3vDF1Qfho
         Wms/Qg8xVg+HGzoH1K6RBO4wH2+sSF+2EkAqP7Hzd5meVQNNvfrZBbPPyNZ7awr5fnIp
         7IAGFxRh5BX2jj0QwSd3I5Zz2D+HLCZuOTSa7oBtpuLlWO80aYk4z1sQzfzB50HkNRAP
         dpyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc5LmFjT0hfrdFCy4quzJltPWDh0qi9SOSzEMWxKYbUVmWEFFDmPtjXtbjck+D9iiByUzskJkowBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YywnYRjU74YhQj8dII4n2S9d1OAl92ADwqyu/K73d7hnrCK8ABc
	xkIq0/liLmxx1DdXCGO7Yb/z6PQwoOsLOaLCv/laf2uLurgtxileNn28/cEkOinxOmIIRbHlu71
	CjK4l8sBaNZNuXuosCcp+Oj5oHY9bdY8=
X-Gm-Gg: ATEYQzzrBMpbCQHKFxvz8CFw/8zbUHV/F7gAubr9AO/HdrabZynhXin/o56mEZ2/vnZ
	mU6fD/AvlrJ9xvds78LJPK7YHRLzCtNMDl7fjBEz6ZIXK5N1jbw0W45I5Ua9HTuHfCq1LlEfqXO
	Rr4rWQFPF93o16peTgw5Kza/0oD9Q3w902ZTmSj1jTDQnK4lBPqEsbiQ9a5Ar0BOsc07ufaQEeW
	5LWik6pQdElBS0w+7LgvsyKwkfQL2K8bNhvceHpdUlXLWXMvTdszZzt2DcnfxcuPlIAVVqtqwtF
	dACe4b8W
X-Received: by 2002:a05:6102:32c1:b0:5ff:ba2d:17ab with SMTP id
 ada2fe7eead31-5ffe5ecf73emr4058677137.8.1773052082024; Mon, 09 Mar 2026
 03:28:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 9 Mar 2026 18:27:40 +0800
X-Gm-Features: AaiRm52n0mEqkIkAfJNxnqmAil_gDRCCcRZGE1BviAPFVckHxkj84uxVGDCdZzk
Message-ID: <CAH2e8h4R-nF+eV+OnkSySKSY5_H-V8Ndyfhac3=VNQ-bMaBeFg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes
To: taniya.das@oss.qualcomm.com
Cc: abel.vesa@oss.qualcomm.com, ajit.pandey@oss.qualcomm.com, 
	Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	imran.shaik@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 5, 2026 6:40 PM Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
> is simply a separate block housing the GX GDSC) nodes, required to
> power up the graphics-related hardware.
>
> Make use of it by enabling the associated IOMMU as well. The GPU itself
> needs some more work and will be enabled later.
>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>

Hi Taniya and Konrad, GX GDSC stuck at 'on' on my device
the raw register values are

0x3d68024: 0x00000000
0x3d68028: 0x00000000

[    0.593882] msm_dpu ae01000.display-controller: bound 3d00000.gpu
(ops a3xx_ops)
[    0.594237] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0xc0000000
[    0.598140] [drm] Initialized msm 1.13.0 for
ae01000.display-controller on minor 0
[    0.598213] msm_dpu ae01000.display-controller:
[drm:adreno_request_fw] loaded qcom/gen80000_sqe.fw from new location
[    0.598267] msm_dpu ae01000.display-controller:
[drm:adreno_request_fw] loaded qcom/gen80000_gmu.bin from new location
[    0.598288] msm_dpu ae01000.display-controller:
[drm:adreno_request_fw] loaded qcom/gen80000_aqe.fw from new location
[    0.600620] [drm] Loaded GMU firmware v5.1.25
[    0.698366] ------------[ cut here ]------------
[    0.698368] gx_clkctl_gx_gdsc status stuck at 'on'
[    0.698385] WARNING: drivers/clk/qcom/gdsc.c:178 at
gdsc_toggle_logic+0x140/0x160, CPU#3: kworker/u33:3/84
[    0.698394] Modules linked in: fastrpc qrtr_smd rpmsg_ctrl
panel_nt36536(+) joydev mousedev qcom_pd_mapper ucsi_glink
pmic_glink_altmode typec_ucsi aux_hpd_bridge qcom_battmgr aw99706
nvmem_qcom_spmi_sdam nt36532_ts qcom_spmi_temp_alarm fsa4480
regmap_i2c phy_nxp_ptn3222 industrialio rtc_pm8xxx qcom_stats
phy_qcom_qmp_combo aux_bridge typec qcom_q6v5_pas qcom_pil_info
qcom_common phy_qcom_m31_eusb2 qcom_q6v5 qcom_sysmon icc_bwmon
qcom_rng sm3_ce qrtr nvmem_reboot_mode arm_smccc_trng pmic_glink
rng_core
[    0.698445] CPU: 3 UID: 0 PID: 84 Comm: kworker/u33:3 Not tainted
6.19.6-sm8750+ #5 PREEMPT
[    0.698450] Hardware name: LENOVO TB322FC (DT)
[    0.698452] Workqueue: pm pm_runtime_work
[    0.698457] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    0.698462] pc : gdsc_toggle_logic+0x140/0x160
[    0.698466] lr : gdsc_toggle_logic+0x140/0x160
[    0.698469] sp : ffff8000810bb920
[    0.698471] x29: ffff8000810bb920 x28: 0000000000000000 x27: 0000000000000000
[    0.698477] x26: ffff000800065428 x25: 0000000000000008 x24: 0000000000000000
[    0.698482] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000001
[    0.698487] x20: 0000000000000000 x19: ffffa3c20a6abb98 x18: ffff5c4963eb2000
[    0.698492] x17: ffff000800a062c0 x16: ffffa3c20a71a510 x15: ffffa3c20a56d230
[    0.698497] x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574732073757461
[    0.698502] x11: 0000000000000058 x10: 0000000000000027 x9 : ffffa3c208f81e50
[    0.698507] x8 : 0000000000000027 x7 : 7461206b63757473 x6 : 0000000000000000
[    0.698512] x5 : 0000000000000001 x4 : 00000000fffc025b x3 : 00000000ffffffff
[    0.698517] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000802511f80
[    0.698522] Call trace:
[    0.698524]  gdsc_toggle_logic+0x140/0x160 (P)
[    0.698528]  gdsc_disable+0x4c/0x190
[    0.698533]  _genpd_power_off+0xa4/0x1a8
[    0.698538]  genpd_power_off.part.0+0x170/0x270
[    0.698543]  genpd_power_off+0x50/0x68
[    0.698548]  genpd_runtime_suspend+0x1e4/0x2e8
[    0.698553]  __rpm_callback+0x50/0x220
[    0.698560]  rpm_callback+0x7c/0x90
[    0.698567]  rpm_suspend+0xe8/0x590
[    0.698573]  rpm_idle+0x128/0x3c0
[    0.698580]  __pm_runtime_idle+0x58/0x100
[    0.698587]  a6xx_gmu_stop+0x74/0x3e0
[    0.698592]  a6xx_gmu_pm_suspend+0x48/0x118
[    0.698597]  adreno_runtime_suspend+0x38/0x68
[    0.698604]  pm_generic_runtime_suspend+0x34/0x60
[    0.698609]  __rpm_callback+0x50/0x220
[    0.698616]  rpm_callback+0x7c/0x90
[    0.698622]  rpm_suspend+0xe8/0x590
[    0.698629]  pm_runtime_work+0xcc/0xe0
[    0.698632]  process_one_work+0x15c/0x3c0
[    0.698638]  worker_thread+0x18c/0x320
[    0.698642]  kthread+0x148/0x208
[    0.698646]  ret_from_fork+0x10/0x20
[    0.698653] ---[ end trace 0000000000000000 ]---

[    6.710781] ------------[ cut here ]------------
[    6.710786] gx_clkctl_gx_gdsc status stuck at 'on'
[    6.710793] WARNING: drivers/clk/qcom/gdsc.c:178 at
gdsc_toggle_logic+0x140/0x160, CPU#5: kworker/u33:5/143
[    6.710799] Modules linked in: snd_q6apm snd_soc_core snd_compress
snd_pcm snd_timer snd soundcore fastrpc qrtr_smd rpmsg_ctrl
panel_nt36536 joydev mousedev qcom_pd_mapper ucsi_glink
pmic_glink_altmode typec_ucsi aux_hpd_bridge qcom_battmgr aw99706
nvmem_qcom_spmi_sdam nt36532_ts qcom_spmi_temp_alarm fsa4480
regmap_i2c phy_nxp_ptn3222 industrialio rtc_pm8xxx qcom_stats
phy_qcom_qmp_combo aux_bridge typec qcom_q6v5_pas qcom_pil_info
qcom_common phy_qcom_m31_eusb2 qcom_q6v5 qcom_sysmon icc_bwmon
qcom_rng sm3_ce qrtr nvmem_reboot_mode arm_smccc_trng pmic_glink
rng_core
[    6.710831] CPU: 5 UID: 0 PID: 143 Comm: kworker/u33:5 Tainted: G
     W           6.19.6-sm8750+ #5 PREEMPT
[    6.710833] Tainted: [W]=WARN
[    6.710834] Hardware name: LENOVO TB322FC (DT)
[    6.710835] Workqueue: pm pm_runtime_work
[    6.710837] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    6.710839] pc : gdsc_toggle_logic+0x140/0x160
[    6.710840] lr : gdsc_toggle_logic+0x140/0x160
[    6.710842] sp : ffff80008205b920
[    6.710842] x29: ffff80008205b920 x28: 0000000000000000 x27: 0000000000000000
[    6.710845] x26: ffff000800065428 x25: 0000000000000008 x24: 0000000000000000
[    6.710847] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000001
[    6.710849] x20: 0000000000000000 x19: ffffa3c20a6abb98 x18: 000000000000000a
[    6.710851] x17: 0000000006000000 x16: 0000000000000000 x15: 0000000000000000
[    6.710853] x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574732073757461
[    6.710856] x11: 0000000000000058 x10: 0000000000000018 x9 : ffffa3c208f81e50
[    6.710858] x8 : 00000000015fffa8 x7 : 0000000000000316 x6 : 0000000000000001
[    6.710860] x5 : ffff000b6e3a17c8 x4 : ffff5c4963ef2000 x3 : ffff000807c95e80
[    6.710862] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000807c95e80
[    6.710864] Call trace:
[    6.710865]  gdsc_toggle_logic+0x140/0x160 (P)
[    6.710867]  gdsc_disable+0x4c/0x190
[    6.710869]  _genpd_power_off+0xa4/0x1a8
[    6.710871]  genpd_power_off.part.0+0x170/0x270
[    6.710873]  genpd_power_off+0x50/0x68
[    6.710874]  genpd_runtime_suspend+0x1e4/0x2e8
[    6.710876]  __rpm_callback+0x50/0x220
[    6.710879]  rpm_callback+0x7c/0x90
[    6.710881]  rpm_suspend+0xe8/0x590
[    6.710883]  rpm_idle+0x128/0x3c0
[    6.710885]  __pm_runtime_idle+0x58/0x100
[    6.710887]  a6xx_gmu_stop+0x74/0x3e0
[    6.710890]  a6xx_gmu_pm_suspend+0x48/0x118
[    6.710892]  adreno_runtime_suspend+0x38/0x68
[    6.710894]  pm_generic_runtime_suspend+0x34/0x60
[    6.710896]  __rpm_callback+0x50/0x220
[    6.710898]  rpm_callback+0x7c/0x90
[    6.710900]  rpm_suspend+0xe8/0x590
[    6.710902]  pm_runtime_work+0xcc/0xe0
[    6.710903]  process_one_work+0x15c/0x3c0
[    6.710906]  worker_thread+0x18c/0x320
[    6.710908]  kthread+0x148/0x208
[    6.710909]  ret_from_fork+0x10/0x20
[    6.710912] ---[ end trace 0000000000000000 ]---
[    6.726652] adreno 3d00000.gpu: CP Fault Global INT status: 0x10000
[    6.726659] adreno 3d00000.gpu: CP SW FAULT pipe: 1 status: 0x400
[    6.726661] adreno 3d00000.gpu: CP REG PROTECT error, status=0x608212
[    6.726736] msm_dpu ae01000.display-controller:
[drm:recover_worker] *ERROR* 68.5.0.1: hangcheck recover!
[    6.726748] msm_dpu ae01000.display-controller:
[drm:recover_worker] *ERROR* 68.5.0.1: offending task: kwin_wayland
(/usr/bin/kwin_wayland --wayland-fd 7 --socket wayland-0 --xwayland-fd
8 --xwayland-fd 9 --xwayland-display :0 --xwayland-xauthority
/run/user/1000/xauth_UWXqvr --xwayland)
[    6.726754] revision: 0 (68.5.0.1)
[    6.726756] rb 0: fence:    -255/-254
[    6.726757] rptr:     64
[    6.726758] rb wptr:  168
[    6.728919] ------------[ cut here ]------------
[    6.728921] gx_clkctl_gx_gdsc status stuck at 'on'
[    6.728927] WARNING: drivers/clk/qcom/gdsc.c:178 at
gdsc_toggle_logic+0x140/0x160, CPU#2: gpu-worker/230
[    6.728931] Modules linked in: snd_q6apm snd_soc_core snd_compress
snd_pcm snd_timer snd soundcore fastrpc qrtr_smd rpmsg_ctrl
panel_nt36536 joydev mousedev qcom_pd_mapper ucsi_glink
pmic_glink_altmode typec_ucsi aux_hpd_bridge qcom_battmgr aw99706
nvmem_qcom_spmi_sdam nt36532_ts qcom_spmi_temp_alarm fsa4480
regmap_i2c phy_nxp_ptn3222 industrialio rtc_pm8xxx qcom_stats
phy_qcom_qmp_combo aux_bridge typec qcom_q6v5_pas qcom_pil_info
qcom_common phy_qcom_m31_eusb2 qcom_q6v5 qcom_sysmon icc_bwmon
qcom_rng sm3_ce qrtr nvmem_reboot_mode arm_smccc_trng pmic_glink
rng_core
[    6.728963] CPU: 2 UID: 0 PID: 230 Comm: gpu-worker Tainted: G
  W           6.19.6-sm8750+ #5 PREEMPT
[    6.728965] Tainted: [W]=WARN
[    6.728966] Hardware name: LENOVO TB322FC (DT)
[    6.728967] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    6.728969] pc : gdsc_toggle_logic+0x140/0x160
[    6.728970] lr : gdsc_toggle_logic+0x140/0x160
[    6.728971] sp : ffff800080f7b880
[    6.728972] x29: ffff800080f7b880 x28: 0000000000000000 x27: ffff000802674b70
[    6.728975] x26: ffff00080db71080 x25: 0000000000000008 x24: 0000000000000000
[    6.728977] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000001
[    6.728979] x20: 0000000000000000 x19: ffffa3c20a6abb98 x18: 000000000000000a
[    6.728981] x17: 0005004800000000 x16: 0000000000050040 x15: 0000000000000000
[    6.728983] x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574732073757461
[    6.728985] x11: 0000000000000058 x10: 0000000000000018 x9 : ffffa3c208f81e50
[    6.728988] x8 : 00000000015fffa8 x7 : 000000000000034e x6 : 0000000000000001
[    6.728990] x5 : ffff000b6e3417c8 x4 : ffff5c4963e92000 x3 : ffff0008089a2f40
[    6.728992] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008089a2f40
[    6.728994] Call trace:
[    6.728995]  gdsc_toggle_logic+0x140/0x160 (P)
[    6.728997]  gdsc_disable+0x4c/0x190
[    6.728999]  _genpd_power_off+0xa4/0x1a8
[    6.729001]  genpd_power_off.part.0+0x170/0x270
[    6.729003]  genpd_power_off+0x50/0x68
[    6.729005]  genpd_runtime_suspend+0x1e4/0x2e8
[    6.729007]  __rpm_callback+0x50/0x220
[    6.729009]  rpm_callback+0x7c/0x90
[    6.729011]  rpm_suspend+0xe8/0x590
[    6.729014]  rpm_idle+0x128/0x3c0
[    6.729016]  __pm_runtime_idle+0x58/0x100
[    6.729018]  a6xx_gmu_stop+0x74/0x3e0
[    6.729020]  a6xx_gmu_pm_suspend+0x48/0x118
[    6.729022]  adreno_runtime_suspend+0x38/0x68
[    6.729024]  pm_generic_runtime_suspend+0x34/0x60
[    6.729026]  __rpm_callback+0x50/0x220
[    6.729028]  rpm_callback+0x7c/0x90
[    6.729030]  rpm_suspend+0xe8/0x590
[    6.729032]  rpm_idle+0x128/0x3c0
[    6.729034]  __pm_runtime_idle+0x58/0x100
[    6.729037]  a8xx_recover+0x1a0/0x2c0
[    6.729039]  recover_worker+0x244/0x390
[    6.729041]  kthread_worker_fn+0xe0/0x2a0
[    6.729044]  kthread+0x148/0x208
[    6.729045]  ret_from_fork+0x10/0x20
[    6.729047] ---[ end trace 0000000000000000 ]---

Best wishes,
Pengyu
