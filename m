Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F289243964
	for <linux-clk@vger.kernel.org>; Sat, 26 Sep 2026 02:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790388199; cv=none; b=VSmjxJGtdUEidCeJvijzk20ehIeynMjZ5choZX61LOo5BB7AOJvubYls2XgI0H9paN2hD61g0dND4ZC7/+tnYXM9BfzVyCHp8Rfm14KHmNxKHhEKAfFVRCInkhtPUiKmmHYu3AsQhPN+lM7u6/wz7J+E3DAMp/omtx1Fs+fxjfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790388199; c=relaxed/simple;
	bh=RP+5Ec9UeM9r+i1P+pNVYwSRiXYhsbr/Ikg0S83LBdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXTAtugjOfCVMv8xgPub0ESkv8dvNHzwHQdAsOxu4m2yE9Im9CSoshfnCAbBj7vECj4GVREnTpsHiIXeGWxapDWiPa/x8moP3dMUnE8PXW0UhrSVNE+tgGx2FIySgE3EGQ8liISKxilSm4uLF7mqVuDkWHS6cY2E1keXzWjro9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q32lRUpR; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q32lRUpR"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8121458be2dso2003007a34.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 19:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790388197; x=1790992997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAXbW0zIqThSvZBW3q+aJhA/JQ2MT3RMwWvhV448ODw=;
        b=Q32lRUpRc+Qeu+5VqeTl527qrkLgMttX9zZnDVUgOQOHCCYv6Z/EWlh/BfakCj3QHW
         I0KQVJlRI/n4kyv+APGaV+jUfZWtwiSRz/RAbzojYsZhvG8VVS0DQNwG8UtebbYNTQBP
         b4D/WdvFWHl+nnnyN95sfJVrdk3cciloa9Fg6WVMb7GhM575RoK/GE5M/5sFtVogZzSm
         c7fyLECFdiH2tliwJMlnnEotgvso+MZY0hVz0Xa2K96MtZYc09nYc1GCn7PFkPRA2Nrh
         rLwZu/iJasLpvgRst0u4P7ojQL2e1CnLN/pBubAeCJde46QIpH/MTp3hBtU9uHlfCDl1
         MYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790388197; x=1790992997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAXbW0zIqThSvZBW3q+aJhA/JQ2MT3RMwWvhV448ODw=;
        b=xNjMz50hNIbO5GWIyFU/h7XP6B96GEmtiic9j/woxy0dcqrUjeSlYNSLb576nnZsbR
         0A5458kfo5lWCIx/cK22XBryG4GKHMnnPLcpWkckMzBIDxhiAPzz57A/Ky8cDvumTJCm
         Pcdu5wj7rMuGTonHOtoPL298TCbN0AG0vfIotDHQQJnIvxEhPQudQ90tVYR0Sa7X8X+1
         1KDWP6xMnWsEAxz9IoKVnsJZ8r3tIYpS95kIQWCXqPv8+yb4/snyXgxa52daAPedABTg
         6R4MLcLtgDXUXArdB53Msq2/Je43X3n4i0MZoLw+oLh4tHD0FjQ9DDiLnra/anA/1199
         sNng==
X-Forwarded-Encrypted: i=1; AKwUvBzPHfJ0trNmGku1yr3rGlE/eg9OkryLa5wLlz7WfIDcL15ciO4+WdBxIH3eLdBgjquxdgY4P8RNqII=@vger.kernel.org
X-Gm-Message-State: AFuF++muzQ/DN5CjA+zXjYGfsCSGHIgv+kk0ckjLz8xw3E8HgYHwJI+7
	os/E/19kgfcoTgWy9T34bB1s+tlWD2rDW75z6s53trooa1rsDIu6QHt1
X-Gm-Gg: AYBFou25zxmhyfOBrSyEWm9SPB1zNW8RfBC5m4tc3M628hcl9szeS0zynR6THPDEL6k
	COV/RxCVDZFsdlq1ntIJ98oXanMfdN+5MUAbGnkQVgXXydkEebqSB+278gsnFDmCmr23NkVOk/G
	sEVVsmXUI0UrOX0NeoFK73DANLGNGxjE2EoJrxEXG6rdWheQO6g3r9v8hbX+Q3ryYq4K7946opX
	5KTuNxZ6M4MNDlvC927fC9Y/EwMi1y719QfQVOxPw9JAnAckvpX0F7ZMF/ri3THV2/iFZYTd8/W
	CethHwVu7Liqelp1Ny+bl6xyWzJa+qtrY2bLwAoU+drGtdBGVcr/hL4+B9QkcJoS5mKg+Xb8a2w
	Falo8MU+hFEmru7a4G83hPZJ55AQB0MN9p1YTxj556g2WtWN9tuzto4esUCkSb5i2F5SJ3VlkCG
	LVyk1ULb3h3vWIAwpEqyLgUbxpgfZFN4eRH4k6uXfuJA2ZW/Y3vGNcjCHGYS0JD88RRyBwcOWRa
	4Mi5JX78yGurhc4h22VbgHJ2EXVdaYEvzaQ7hWRNSPypC4dgA==
X-Received: by 2002:a05:6830:a18a:20b0:816:f1c2:d6b8 with SMTP id 46e09a7af769-81780a93afbmr4940499a34.9.1790388197052;
        Fri, 25 Sep 2026 19:03:17 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81903f5f25csm3719365a34.18.2026.09.25.19.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 19:03:15 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Fri, 25 Sep 2026 22:03:13 -0400
Message-ID: <20260926020313.911537-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DLLYUYMR3CZT.17I8APGBH9H8S@pigmoral.tech>
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech>  <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>  <20260921200512.3179109-1-enzo.adriano.code@gmail.com> <DLLYUYMR3CZT.17I8APGBH9H8S@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Thanks for reproducing the ahb-cpus issue. Adding clk_ignore_unused lets
the Cubie A7S reach an interactive initramfs shell.

I reused the September 21 uninstrumented comparator: v7.3-rc1 plus the
four single-divider patches, CCU v4, the seven pinctrl patches, and the
minimal test DT, with only ahb_cpus_clk marked CLK_IS_CRITICAL. The Image,
DTB and initramfs were byte-identical to that earlier comparator; the
only boot-argument change was adding clk_ignore_unused.

Without the flag, that comparator stopped producing serial output at
"clk: Disabling unused clocks". With it, the confirmation run recorded:

  [    1.263452] clk: Not disabling unused clocks
  [    1.292364] Run /bin/sh as init process
  [    1.526500] mmc0: new high speed SDXC card at address 544c

Commands issued after the shell prompt returned the expected readiness
and completion markers. No panic, oops or SError appeared in the capture.
The RAM-only run was followed by a guarded 120-second power-off recovery,
which restored the vendor kernel and eMMC root.

This narrows the second failure to the path bypassed by clk_ignore_unused,
but does not identify an individual clock: the flag also bypasses the
runtime-PM acquisition and traversal before the per-clock disable calls.
I therefore still cannot add a Tested-by for v4 as posted.

Assisted-by: Codex:gpt-6

Regards,
Enzo
