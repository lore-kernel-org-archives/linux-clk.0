Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BE945D93E;
	Mon, 12 Oct 2026 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.38.64.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793329; cv=none; b=OiBFWefG1p/1gfGkXldA+vZocYxNG9ClGof55C0cW7JAxLxr3wp7r9zIIkScD4TVCILRt4DEH3ipotvD+EPxTEWX987M+hHcvRDbXRwbfq1KTejvA9hrsxXjl4kS8mdhAmPUGH14v8kZL2Fjzj6LQMFwgLeQWyQ7jVAPunaLcYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793329; c=relaxed/simple;
	bh=vPP16qn4C5KCsIbBIItXVGI7k5gu0Vnv6h/g9ZwAWf0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ju/dVOFtvxZAgRTV8gzNAXXOyMX+I36klnL81L2yHTzMaoBMZ7Jba1zfQN7mFC6BYNSBuJOvedPeGbQkgWS5xOrwynGvMZi4/IlNgEuGQDkF/LKwc3JYyqrpaUQwDPQjIoToBAeaC4VenotPCSxDprzvpJ0bzgek4cpR4tpqx/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn; spf=pass smtp.mailfrom=mail.ustc.edu.cn; dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b=P7PQUFrZ; arc=none smtp.client-ip=202.38.64.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b="P7PQUFrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=r+wOrf6FFyJ+EZXWLP0+IkKhy9CSHDGdtllvWnItISo=; b=P7PQUFrZS5SzI
	wGPSamHskF879wnVPyOoss6Du3FMOGUUQG2ZKYLAplb8Uf1mZXAH1agVK5zWwGLO
	ojmExMgaRTcxKH8rgkbSk1OBwZoJbZo+J0o8UQGIJbxu41nQx4rRPu1xfBBkbIXy
	H78wMaT2SSYQxcpkVxbrCPdkbdUBgM=
Received: from [127.0.1.1] (unknown [114.214.192.228])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBHNx6lmMxq5yDXAQ--.122S2;
	Mon, 12 Oct 2026 16:21:57 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: [Regression v3] SM8750: cambistmclkcc + camcc together hard-reset the
 SoC on display blank
Date: Mon, 12 Oct 2026 16:21:56 +0800
Message-ID: <179179331695.677917.11557670447411700010@mail.ustc.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:3pYKCgBHNx6lmMxq5yDXAQ--.122S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XFy5tF43tw1UWFy8KF4DArb_yoW7GrWrpF
	Z5Ga1fJr4DtryS9a1Ivw18Za4S93ykKan8Ar1rGryUAa15Gr1xtF1Ika1UXasrGrnayF40
	vr4qqws7AF4vkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU5moGJUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREKB2rBkwcEggAXsz

Hi,

Third revision of a regression report about SM8750 (Lenovo Y700 4th gen tablet,
TB322FC, board dts sm8750-lenovo-elden) being hard-reset by the camera clock
controllers when the display is blanked.

DELIVERY NOTE (please read): the two earlier revisions (2026-10-08 and
2026-10-10) do not appear in the linux-arm-msm archive, and neither does any
[Regression] mail from this address. If an older copy of this report reaches you
later from a moderation queue, please ignore it and review this revision: the
data below supersedes it, and it also withdraws two of its claims.

### Corrections to the earlier revisions

1. "The trigger is the cambistmclkcc block specifically" is wrong. With a strict
   user-space gate on the same kernel (modules probed, all clocks unprepared, no
   consumers, no camss/cci/regulator drivers loaded):

     cam = 0                     blank, hold 60 s, resume  -> alive
     camcc-sm8750 only           blank, hold, resume       -> alive
     cambistmclkcc-sm8750 only   blank, hold, resume       -> alive
     both loaded                 first real blank           -> SoC reset

   The earlier single-module results were gate artifacts: our older blank test
   did not verify that the panel actually left the active state.

2. The "bind cambistmclkcc to MX only" workaround (be79b256d, attached to the
   previous revision) is withdrawn. We rebuilt the device tree only, restoring
   the upstream binding (power-domains = <&rpmhpd RPMHPD_MMCX>, <&rpmhpd
   RPMHPD_MX> + low_svs) and verified that the control build reproduces our
   baseline DTB byte for byte. The SoC still resets, with an RPMh vote tail
   identical to the MX-only build. The power-domain binding is not the lever,
   and our "half-built bare clock controller collides with a collapsing rail"
   story is therefore not confirmed - please treat it as an open question, not
   as a root cause. No fix patch is attached to this revision.

### Death signature (what we can measure)

- SoC level reset, not a software crash: no pstore and no kernel message, the
  USB PHY drops, and the device reboots by itself into the flashed OS. In the
  five death events we instrumented today the recovery was always automatic,
  28-42 s after the USB disconnect; two of them were confirmed by an SSH login
  showing a new boot_id.
- PMIC: dumping all SPMI slaves through debugfs before and after the event shows
  the PON register block (0x1300..0x13ff of the main PMIC) byte-identical, i.e.
  no latched PON reason and no fault bit. The SoC hardware watchdog is disabled
  ("Hard watchdog permanently disabled"), so this is not a watchdog reset.
- Tracing: the last frames are the compositor enabling disp_cc_mdss_* clocks
  (blank direction). On a bench where the panel did not initialize, the death
  moves to the resume direction (GPU domain bring-up) - the death point follows
  the display power transition.
- Interconnect: BCM/RPMh votes during a dying blank are identical in address and
  shape to a surviving blank (MC0, SH0, SH1, ACV) and icc_set_bw paths look
  normal, so this does not look like a NoC bandwidth vote problem.
- Pinning the GPU power/control to "on" (no GPU runtime resume on resume) does
  not prevent the reset.

### Reproduction

- mainline 7.2 based tree, no vendor patches affecting clocks or genpd.
- modprobe cambistmclkcc-sm8750 and camcc-sm8750.
- real display blank from userspace (org.gnome.ScreenSaver.SetActive(true),
  DSI DPMS off; no s2idle or system suspend involved) -> reset within seconds.
- on benches where the panel fails to initialize, the same reset is provoked by
  the resume direction instead (SetActive(false)).

### Questions

1. Is cambistmclkcc supposed to be usable as a bare clock controller with no
   GDSC and no consumer? The failure needs BOTH camcc and cambistmclkcc to be
   probed. Is there a hardware coupling that requires the camcc side to be
   powered while the camera BIST block keeps its AHB clock and PLL programmed?
   (The maili/hawi camss RFC adds both nodes together, which makes us suspect
   they are not independent on this generation.)
2. Is there a documented ordering constraint between the camera BIST block and
   display power/clock collapse (dispcc) on the shared MMCX/MX domains? Any
   display power transition, blank or resume, with both controllers loaded
   takes the SoC down instantly, and we cannot see that interaction in the clock
   or genpd code paths.
3. Which reset-reason source exists on SM8750 that we could read from Linux after
   such an event? PON latches nothing and there is no pstore. Is there an AOP or
   CPUCp crash/health register, or a smem scatter area, that records
   "PS_HOLD dropped" versus "cold reset"?
4. Until the root cause is known, what default would you recommend for
   distributions: an always-on vote for cambistmclkcc, a required vdd_mx supply
   binding, or deferring cambistmclkcc probe until the display is off? We can
   test any of these on hardware and report back.

We can run further experiments (registers, traces, chip revisions) on request.

Thanks,
Xuqianhui (elden bring-up, Lenovo Y700 Gen4 / SM8750)

