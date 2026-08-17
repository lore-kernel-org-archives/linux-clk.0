Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4169A431A31
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972338; cv=none; b=P5NcEkLSACfwcI6hCjlp5W0Y40xcP+X3CjQj41r9ssuH8CACax3b9sR4YlYqKCTludILt9zvZdLx5eR9BCSG3yfAEMyxmd1DI/MLEvXt+DJXxz5vc0x1Ka+tq1k8AAGxgiPF/LxooyilBZraBzE3agBufuFqhveGFtZYs0NYZg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972338; c=relaxed/simple;
	bh=dQ/H3XY5fTRlGrTTCRMgcg6R2IED5vstP6YDZZ2Lg60=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eNfQ+D6aVEyQFwDq6gXV2Eycz4CkVl57JGm3y5ykn7uocDKKnt1ckQXPPfGcU5kCr+6hFPy8nYiDV8+pkYvZ++VjIUKyqzEB40I86lABpmDXr/VkxqN1SBiX/1UItYNAj4ytPpNBwDWe1HenVNhXtCzFdPoKFLga7ZpIelHV1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLPLY0rq; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLPLY0rq"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dcbade417so3377915a91.1
        for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 06:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786972331; x=1787577131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lTHpr993bewVeu2QK28PUz7lB7HML+v/keJBM3aBb4I=;
        b=LLPLY0rqtVEZmAYEyhp/QqI4NaPWXIOECPv2R2SB1iFC9Rp864xMZgNgpqua+8Wowu
         0iYkdiG9ov9Qx5aGuk5e/ou+yODJ8h5iNEz7RuEZTn1yJMdv/BSAcsWt6SsmRoD/FN45
         bSJUv16/5FjH6SgOVNIKnd8IuHU76B1bSMLt/TQsLffz3X2RRJ1ZphVnYJV6o9fAXBca
         XrgQ1sNOaR//lrLYCM63h2qex2Nq61jiUtZ1Izj3M/vWgS+77BjmZi1WV3RJhGBLDle/
         LV9SFUvXkQnMOCAFC4SqoZEO+BIr5Viq2LmSczqtx43L7UmQEcgu0efN5q0sFN+P2RsU
         6ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972331; x=1787577131;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTHpr993bewVeu2QK28PUz7lB7HML+v/keJBM3aBb4I=;
        b=TZo16ciY9oVa0mxG+y70eV0Km7HZNfN5UVVFhOkSl4Je0jdzdn2wDUi8z/nmnHag0y
         gmBWNqQyZG892e+IT3GpSgiNwK/bNpCpR/2kg08J9eH45bPG+XhaQRAJh9NeltEwPmyt
         L/FQOs1WmCP9LaV1EUE92Jgc+iSqb5ZeleFPe05tNU2gMpyNT4CBaOuFG+oJtEy9LUuS
         iavQHSmC/Q4ZsXvk+dYlK52i5ZnoBP1eBtR4OdMknhMeANoDlR/iLW7/RKu7r2t1wl5A
         uQ3J8QxHW0L4yhPgYVUwQ6swj7B4S19gWPQ/fOEmf5TL4Ben0K0PExtyS+M7JwBg6Ebc
         0dsA==
X-Forwarded-Encrypted: i=1; AHgh+Rpi4PoQG/Y3VuhqvETNqD7m8RGEN360ti6bSqU2pXoNG+bNWxqRCJZh9RtLRUkp7+1dosu1Je8NC/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9cwymSev91LpfciFfVTsN2JKlmiDsJ8qaqDxmIQrYDVrshEVB
	w7m3Tnf6UVoxova68gmJMxZeRctW1H/7u74xZBhVnPAPFyNbIOne5lE=
X-Gm-Gg: AR+sD11Kqhipj8mAu7eBpx9P5GADH9XrBXmKPv0IkED8bAC/AEWXqHcnfknbhjH9UgH
	4+3HOATVP1o8sDCpaxsIizAJQOoq0mW7ZB0T4HfpPU4qT2LWl7zX3Bwqf9aZnx0kuyuSd8m5nAR
	vMxmUB1o7mVUInsdCDbeRAlulC5xmEDfOkpeHXj2xSWVugW8bm9xW+t5WH3xSA7pT9+CZPcpTna
	ZktCWf41/3/faD+12sx3MdYQafZJSa+j54OxAaGUyaxRSz8HB37/CyGHKEf4Sl13asfexIFzT+z
	IwSNp0WFuuSZksaLD/DlFdK3zcoWLlGcXcqxw8CrIGW4hwR+YvXfJZ9SQJC2/KwNMwas2u9+Y6K
	gWLLlODKZ4sSIl8PeAfbf2tB4mriCq+zqpWBElkpSPhvLQANKnvuwOycvOzWn4ZG0BsAiLXN8s3
	dGRoH+Z0n+Mfl+Sz7iiWUywiHDIydpFV81X14+Qpa4oAHST7qhtyUvug==
X-Received: by 2002:a17:90b:53c8:b0:392:c80b:8ef7 with SMTP id 98e67ed59e1d1-3955aa68f86mr513356a91.18.1786972331373;
        Mon, 17 Aug 2026 06:12:11 -0700 (PDT)
Received: from octoberrain ([2405:1200:418f:8400::5d9b:1e58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e3184bsm4941870a91.1.2026.08.17.06.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 06:12:11 -0700 (PDT)
Date: Mon, 17 Aug 2026 22:12:03 +0900
From: Robert Eckelmann <longnoserob@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vladimir.zapolskiy@linaro.org, andersson@kernel.org, bmasney@redhat.com,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 m.szyprowski@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
 val@packett.cool, david@ixit.cz
Subject: Re: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks"
Message-ID: <20260817221203.462c7d31@octoberrain>
In-Reply-To: <CAO9ioeX-PB+v=OiuDakFE9NX5tDJdhjwvONJSmURKh1ABM=fgQ@mail.gmail.com>
References: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
	<20260811174822.1f4bcbf8@octoberrain>
	<gwdrtsvqcgdfccyrmyjgstcrr575xv4ltotrdl7ml4lzsfof4b@iv4lae7446yx>
	<CAO9ioeX-PB+v=OiuDakFE9NX5tDJdhjwvONJSmURKh1ABM=fgQ@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Aug 2026 16:21:54 +0300
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:

> > Yes, please.  
> 
> And then almost immediately (sorry). No. The flag is correct. To
> unblock SDM845 try adding GENPD_FLAG_NO_STAY_ON to the MDSS_GDSC. The
> MDSS reset is not working / accessible, so it might be the only way
> forward for now.
> 
> 

Like this?

diff --git a/drivers/clk/qcom/dispcc-sdm845.c
b/drivers/clk/qcom/dispcc-sdm845.c index e060097be413..bfa657113ec0
100644 --- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -764,7 +764,7 @@ static struct gdsc mdss_gdsc = {
                .name = "mdss_gdsc",
        },
        .pwrsts = PWRSTS_OFF_ON,
-       .flags = HW_CTRL | POLL_CFG_GDSCR,
+       .flags = HW_CTRL | POLL_CFG_GDSCR | GENPD_FLAG_NO_STAY_ON,
 };
 
 static struct clk_regmap *disp_cc_sdm845_clocks[] = {

This alone does not seem to solve the problem, I still get crashreports
like:

[    3.493402] /soc@0/display-subsystem@ae00000/dsi@ae94000: Fixed
dependency cycle(s) with
/soc@0/geniqup@8c0000/i2c@88c000/hdmi-bridge@3b [    3.513397]
/soc@0/display-subsystem@ae00000/dsi@ae94000: Fixed dependency cycle(s)
with /soc@0/display-subsystem@ae00000/display-controller@ae01000 [
3.537096] msm_dsi_phy ae94400.phy: [drm:dsi_pll_10nm_vco_prepare]
*ERROR* DSI PLL(0) lock failed, status=0x00000000 [    3.547813]
msm_dsi_phy ae94400.phy: [drm:dsi_pll_10nm_vco_prepare] *ERROR* PLL(0)
lock failed [    3.548807] qcom-pcie 1c00000.pcie: iATU: unroll F, 32
ob, 8 ib, align 4K, limit 4G [    3.556493] ------------[ cut here
]------------ [    3.556495] dsi0_phy_pll_out_dsiclk already disabled [
   3.556512] WARNING: drivers/clk/clk.c:1188 at
clk_core_disable+0xb0/0xd0, CPU#4: kworker/u32:1/60 [    3.556518]
Modules linked in: [    3.556524] CPU: 4 UID: 0 PID: 60 Comm:
kworker/u32:1 Not tainted 7.2.0-rc7-sdm845 #1-postmarketos-qcom-sdm845
PREEMPT [    3.556528] Hardware name: qcom  Inc. SDM845 HDK/ Inc.
SDM845 HDK, BIOS 2026.07-rc1-g2abf33b7c8ea-dirty 07/01/2026 [
3.556530] Workqueue: events_unbound deferred_probe_work_func [
3.572719] qcom-pcie 1c08000.pcie: iATU: unroll F, 8 ob, 8 ib, align 4K,
limit 1024G

[    3.573911] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS
BTYPE=--) [    3.573914] pc : clk_core_disable+0xb0/0xd0
[    3.573916] lr : clk_core_disable+0xb0/0xd0

Can share the full dump off-list if wanted.

BR,
RObert Eckelmann
