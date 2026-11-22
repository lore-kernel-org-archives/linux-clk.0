Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795315207;
	b=KMisG4UFczZP80KlKoOYLdyC5zszx+i7QLqs0CDea9iskl0bANRtvaDDYoP3VNPEuvd+
	 aAYvZhNMSD/hnRen3ahHKPZWfZG0QPuwZJ76XYZXbH1F10pmdsJNQpi0j3MHodb5Yyk7X
	 LycI2QYd4iMDBaxnnb7/jRmdzqsVPF7tGNGzi16T8vwKvJWmmpph+DNoI5cp4Mu/1OxXm
	 P8lgbA9Vye9ojtYGgiFJvyz6fzAuYCmnEdT1QP0d6Ksz/WGCN7zY2QI61cgxxje2fmtFh
	 PxiwXspac3IxjCF7nubXlMegNxJFMw3pVdt3qsaiv0xDJET+re3WmfVShotQxJ5kwLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795315207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PKya3YxXvPxdPz7Z0C1z6SRKNYNaf8lxnWH3lx3F6Ek=;
	b=MiQh4IFO4/0HC/Q2U/+U8eHC2WRaKP3LP2R62d2IlPmljQRRmz+6tjWtNjzsIxvIv6HR
	 Nztk4JxAmizVkd50QNTdlVOBehKVY5H+D80r0vHBqQcdQNV4CVoKWbigHxK+s5qr2IYQf
	 L9N3Fhd9xmR3W+itKegM0iLSX7Mbbqm64dcwwmJwGh3xERFFYNgNbHTylqUS09oX3lRKo
	 VoFCkjnIjrxlKZEF9T3aa7FIbTeOW/r2AG0dZrlkb7Ew+8Y/wWmSU4uwWEH2dW34bFlAC
	 QBBSx8pp9X0EjHogFtlDEVpTxc22afJuJDV68/vRdD03a+bbvbloKyYURvriDw5ZhmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mswin.me;
	spf=none smtp.mailfrom=mswin.me;
	dkim=pass header.d=mswin-me.20260707.gappssmtp.com header.i=@mswin-me.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nMNK5Ugl;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A49606A32A
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 02:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39A49606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mswin.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mswin.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mswin-me.20260707.gappssmtp.com header.i=@mswin-me.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nMNK5Ugl
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c513a854320so375221766b.0
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 18:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mswin-me.20260707.gappssmtp.com; s=20260707; t=1795315205; x=1795920005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKya3YxXvPxdPz7Z0C1z6SRKNYNaf8lxnWH3lx3F6Ek=;
        b=nMNK5Uglm3oSjscVzrRVwYpVzwUcFeqH+R9VCWRiY03isTCMYcCfLyfN6aoOLdTq3z
         rpOUbiiz/Y6TIT4y5YnwKh/6iJd3DJP0FfCWAAZPwbvx8j7HikkKC7e9DRegNFuYeDwY
         /JV2B1O1YcXy6xxMmQIlcsHxgXrP5pavTdPcLJEukIYO10xfHtBb7t6UimVQ24i0izuC
         cCROVhvbNXk5NLVPgnZUSxZL3dEb+nxktf8aDfiYuBR5qxF0RP8+O2jdrz02vjllVHMP
         hTjRloH4GbNOB19H7RL5gusClYBLQ6tNGTatl59RZBCG0RvpzhbBnixNQuiEEY1KWdu6
         Y3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795315205; x=1795920005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKya3YxXvPxdPz7Z0C1z6SRKNYNaf8lxnWH3lx3F6Ek=;
        b=rlTO8fybFjEeYFRuLDLNR6LLWoxfe6LBB/kpO92CjaUGBjNCDfsSHeewgXkWWfCYZO
         VCjFFO2poHy/WRAYS1r0U/23qtU2dOe2aEhOVU3UqrRlaGibsgtADMkF1GJXJSZOvz6C
         e2qALKLggekuk/SDb2iOT8Wa+p4m/WDeziwKH2uooKnvWAOvYMjffAwo0PpofdQ6ls4k
         IA2vIezN1OYfruxtHpSuERM6SOlN8VMF+SSQkUTpjvJaE4WBWnVoCTXev11iIpT0T+Pf
         ZNOAonm0c9SzaKbyZ9m8fJH6DxkqiIele3LsV4CTleGKzVm8SzS6O6u6+YEbfj+6oh5p
         bAIg==
X-Forwarded-Encrypted: i=1; AL+hErHJpC7r/yfkyBAH4XJVt25NgBcTNuSGokG5a5tyGJmrCFjmlsUy2YJGYRbLXRNu80cQ6lA/pSYtlvg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dWw30JqWJs5iJ0kLdNQ9ow7S44p11bmL9eKdDWktWTZtqhmTD
	9T/UhAbBo1idK5bS3frQD6Q7TdwmsbMyShB2VskOOE6DuelQLZSR10yY2u0CBYbUNfs=
X-Gm-Gg: AZFdTZdRfKRVo5QSwH0dJk6KJcitxZ+ThNR/JZ4zs5Z0YYKR8wl9HhUzIqb9/SrZcxQ
	i5xrJh41V0tsbLnfS7++V4wSfYgSlJc/TtbBxG59gDvV5EDnpgBySuKRrQhXBQ3wPPi+CVXaTCt
	pgf2VTKpbvwDXq/EFc+Ab5rchiapxlCcEU+bSc7h7FqeD0MElBGk8LE61Faq9ep0e3ocZjQS2Pp
	2LGBG8OJynHbLcu87e963LkK93FcBStPd6pSmQCV2JWO/xKDMGzkfWr1oUCExbfRQkFBGd7hoY+
	TkKlDrXDSyBSxruaLS4xcYC+Ls+uYf+WouJBxiEoUe/EBgnof8uce57+3nINcoc1QSc3x7608pc
	uuaNyGcY7ZzYsa0ET6Itl23xAUYpTUwbnqIgJwVCbYRCglAdK5aUKEXjMx4+SMEml6CyNATTGLN
	O1qG/99J7I72Uefx66q9sNcsILVPEiKsRHZ+bmsYms4GrscJDzXsurRykUstcGkB7jXA1C+WUow
	c2rmD8zdJLL3aQFUkLjsgIy8wmI6NJxN66C77TcCol/UuGUZnD2AGSJLK6JmYSUF+h+b4Se33is
	1E08cH5AXVU7q6Hkp/GYJGJ+Zo8wKzt4zC4h
X-Received: by 2002:a17:907:a890:b0:c41:55b4:d88b with SMTP id a640c23a62f3a-c513ab14402mr690249566b.43.1795315205485;
        Sat, 21 Nov 2026 18:40:05 -0800 (PST)
Received: from zephyr.int.serkovo.ru ([95.135.208.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68788sm258432866b.29.2026.11.21.18.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:40:04 -0800 (PST)
From: Roman Linev <admin@mswin.me>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: dispcc-sm8250: Don't park mdp_clk_src at registration
Date: Sun, 22 Nov 2026 05:40:01 +0300
Message-ID: <20261122024001.375239-1-admin@mswin.me>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parking disp_cc_mdss_mdp_clk_src at registration time breaks the EFI
GOP framebuffer on the HUAWEI MateBook E Go 2022 (gaokun2, SC8180X):
the panel goes dark as soon as dispcc-sm8250 probes and stays dark,
while simpledrm keeps rendering into the framebuffer.

Use clk_rcg2_shared_no_init_park_ops for disp_cc_mdss_mdp_clk_src, as
was done for sc8280xp and x1e80100, so registering the clock no longer
reconfigures it. The firmware framebuffer then keeps working until the
display driver takes over, as long as its other resources (MDSS_GDSC,
the MDP branch and the display PLL) stay enabled.

Tested on gaokun2 with an out-of-tree DT whose simple-framebuffer node
holds MDSS_GDSC, dispcc-sm8250 built as a module, and clk_ignore_unused
pd_ignore_unused on the command line. With the patch the panel stays
lit; without the patch the panel goes dark (v7.4-rc3 and v7.3-rc2
based kernels). Built-in dispcc-sm8250 and the unused-clock sweep were
not tested. This driver also serves sm8150, sm8250 and sm8350; only
sc8180x was tested.

The cause was localized and the change tested with the help of an AI
coding assistant (Anthropic Claude).

Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
Signed-off-by: Roman Linev <admin@mswin.me>
---

Notes:
    Testing (HUAWEI MateBook E Go 2022 LTE, SC8180X, booted from USB via GRUB
    with an out-of-tree gaokun2 DT; Ubuntu userspace, GNOME on simpledrm):
    
    The DT describes the EFI GOP framebuffer as a simple-framebuffer in
    /chosen with power-domains = <&dispcc MDSS_GDSC>; without that holder
    MDSS_GDSC is powered off at dispcc's genpd sync_state, which also
    blanks the panel independently of this patch. With the holder in place
    and dispcc-sm8250 loaded as a module (deferred_probe_timeout=30 so
    simpledrm binds after it; clk_ignore_unused pd_ignore_unused on every
    boot, so the unused-clock sweep never ran), each pair differs only in
    this one line:
    
      kernel                   stock dispcc-sm8250    with this patch
      v7.4-rc3                 panel black            desktop visible
      Ubuntu 7.3.0-15 (rc2)    panel black            desktop visible
    
    In both black cases the kernel log shows simpledrm bound to the DT
    framebuffer, MDSS_GDSC on and GNOME rendering (KMS readback of the
    framebuffer shows the desktop), but the physical panel stays dark from
    the moment dispcc-sm8250 probes. Only the sc8180x path was tested.
    
    Prior art: Val Packett's downstream linux-qclaptops tree carries the
    same one-line change for the Surface Pro X (commit 88aee348d602, "mostly
    for sc8180x"); I came across it while researching the issue, next to
    the merged sc8280xp/x1e80100 fixes it mirrors, and did not find it
    posted to linux-clk. This report is from a different device, the HUAWEI
    MateBook E Go 2022 (gaokun2), where the failure looks different:
    MDSS_GDSC is held on by a simple-framebuffer node and scanout still
    stops. The tests above isolate the parking as the cause on two kernels.
    
    Tool use: an AI coding assistant (Anthropic Claude) was used to
    compare this driver with the sc8280xp/x1e80100 fixes, build the test
    kernels/modules and analyse the boot logs; the change itself is the
    one-line ops swap from those fixes. All hardware observations were made
    by me on the device.

 drivers/clk/qcom/dispcc-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index dc62eb18de..4a94b4c5a9 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -564,7 +564,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 

base-commit: fbfe0c4beecfbd0e2958d91e5c95ff189bc489a0
-- 
2.56.1

