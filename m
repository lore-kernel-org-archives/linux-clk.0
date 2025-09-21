Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CAE2566DF
	for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758477547; cv=none; b=o3bXwbyRnM74epy7ibcitRkRY2oef0MFHjMPU/LWZJQSTcZAJ8Gop8SwTW06uD4+IIxotdirrCm9J1CbQSMLqfc1N2Unc/WA0ewv0bU2MIoR4Ip8HRKnzwJM3MJXhmUa52jk1GetvsVz+BmU4FlunAKGm43G1B7NeNT/D3T/IW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758477547; c=relaxed/simple;
	bh=5JC0wL/8iPQ4ecKyPVdGw0veg3faWdX+l0jdkzWeAhA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Ux8+jAzy4SW8sPC+OcTAENBea5YG22AfgqoalbXfY8nDzqMDMf+QemCRmMZAi7cR46debrRnzIkjd4T0d1JIrXqsV1lIxi/7Cwz/zQGjG8P4aKgMVzxDDEvXGoABu/u7zlws/AOQHvYZyUqR/zPTTVXmTd4eSTWExVbQXEiyXXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=dfonvugG; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dfonvugG"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77f22902b46so655582b3a.0
        for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758477545; x=1759082345; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7N6w84tes+OnzuskxkGRs0hmNPgasERO4DjEJx5NcY=;
        b=dfonvugGWwwwAjT/gN6hS82L/tOskEu+g725JeZoL+sN/7MLF5WdRoN9Y314Ns82fw
         +cdQvJ+tBB/Ma+Vox64oUAQKwyT4pCZS1sHdPgGZ57HD0rNsKgc1mC4I2o1/qKvaYwDa
         HDDet1UKzpHB3txKOs1tumxvMxAzT05NGDEwbVKkUejRJEnuGepvk0NrBoXUbkSESFu6
         A4FopHra+X0GxpsLO36DyNvLZgDZIi29BPM1qeJw+mDeU+EpVhPRb0li8VbHNfcpPuOj
         H9ZN91pfK0mSE1asGXRkgll3G+d1nzxpVxj7cQ4Tt5lUyk1n5rpaFAGU6mt5HUtDMtGv
         SMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758477545; x=1759082345;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N7N6w84tes+OnzuskxkGRs0hmNPgasERO4DjEJx5NcY=;
        b=Vyh7M04TNwD0BSU6Sv9HfnY5NtDmyddeGScxkpacK20jOFGvr2VS+dmpESoGayq6PU
         pbcESwkjeDFviJDbOIbHSk7KmKX6iFkYrzaHzXk1v9hkIPDRMutWNpfATR+Sph8gUvYW
         UNU+omnctratuQQWZ9TyfuOG8n+PJHzjKL2dwMWtIMsNV5dJycrGxx5qFqGSh/AV0pzE
         RRehPBxtGAvIAwmZ5TWf3Xbvz0lX6HdpYlOnpXjcojtPJ7qz3IqRZPc9ZPtbIm5Ykf58
         pKthYLWhQJv4xzaGjOW05EFHDMhexeoh/Ysl7DRDhf0HBs3xufpEBm+KDYBlwq/JJvVc
         BZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV63WO0XkoFhowMiTMTtfZqyQLcIaf5fxLQcbAtHIbbb4xXPYhQ5bi1zOixypAEeIYZO9e1ri93+M4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw5AczQzpafhZHEnQAjPtopzP/3IrnQPybin8dAV/pkS1Ai3+8
	sdZ3hHqZxgeG1dd+Bd7kaxobiOEjeRlpbQN9uQ+M5z7/ZHkAIqgChM5y0UR55Kgd5BY=
X-Gm-Gg: ASbGncu2+FDPlM1jJsCtLZoffkx8GNbZEYK3+DqLLwtD7nuIHHSCCTUGGpFmxiAdTQe
	0fcJBbd3A3mAGxOl73RvZsyWq7JyB5vdCNii9CQ4u7ibWiE9LkdTj9UAht5Hke0BcuyTBJPzSm6
	xn+n0i3r06DXOKCZJJow396XAVteB4kJWYdljtozRaNjBiV6gmhSgNTEhMO/+6dgVZddBwiqSlY
	YOJwFA6FLrtE/0DwXXLznc9chPXZaPspuqVrq+KtQJ+g5myzDsn48kBO58Tqh8X1z11PGQSXNk5
	0ZeFH4U/T2fp72JK2+5e3b/HgJ69Wzd4kUk8j/hw92NNN84MRC/B8SfBlJ398lgvcdSwj10imXg
	caUgaNqyoVD6rf4m3
X-Google-Smtp-Source: AGHT+IHg8BXrugUq7dCoFCAjQs6GsPk7319hfKZdgh92vJPcD4LifQ3N7nQ9Wa6JYSP5tXdqqMNh6Q==
X-Received: by 2002:a05:6a00:3c84:b0:772:638e:5f72 with SMTP id d2e1a72fcca58-77e4eabb6b7mr11513181b3a.25.1758477545224;
        Sun, 21 Sep 2025 10:59:05 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f0401bdfcsm6481124b3a.76.2025.09.21.10.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 10:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] clk/clk-next: (build) use of undeclared identifier
 'mtk_pll_round_rate' in drivers/clk/m...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-clk@vger.kernel.org, sboyd@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sun, 21 Sep 2025 17:59:03 -0000
Message-ID: <175847754283.744.2651245381599327321@1dfac204f25d>





Hello,

New build issue found on clk/clk-next:

---
 use of undeclared identifier 'mtk_pll_round_rate' in drivers/clk/mediatek/clk-pll.o (drivers/clk/mediatek/clk-pll.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:7b540b5ad3c86a154ae7867284b0a7da95bc0eec
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
- commit HEAD:  146bd480c1bbe9d01e77b3a97e256212a12d2a48



Log excerpt:
=====================================================
drivers/clk/mediatek/clk-pll.c:320:16: error: use of undeclared identifier 'mtk_pll_round_rate'
  320 |         .round_rate     = mtk_pll_round_rate,
      |                           ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## multi_v7_defconfig on (arm):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:68d039c975b320799d353ae5


#kernelci issue maestro:7b540b5ad3c86a154ae7867284b0a7da95bc0eec

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
