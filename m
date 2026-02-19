Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD9732721D
	for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771483947; cv=none; b=nEeeuZzO0xAUttRNYaXKtMEyj17y/ljJNdriiqe/AWG70hK/j7TK7yZr1nQiDGBxRSY+dx1mjtgXKAZTd8Yt2R6VHY6r8zV3ffeNLqQjTcQBze8KZrVp9nWArZfSQ/9dD57xVbUpUwCbPF+cmbSomCGf6uNy4JDHayPuHrhpXoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771483947; c=relaxed/simple;
	bh=a9gIIuUbYtr3xbL1BkLiyFYBOn2YLV4QKHmbdYOIfKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=f9bhVqtEfNE1Uc+W8KjE1BZU8CyzSFCqZ6Z119vOiZHX6Gv6+b7uluJeCfzeWTbuwQmXnfsF7/GB0NPSVgacRcQKejWelTjypL6HCQ/qS58f6yrl/ax56in1Qn4roVMrtM8vAQwHf90jFgP6OzTkXBO62tWhM9OFMO3EBZVI+dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sOpAMsQ1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sOpAMsQ1"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4359a316d89so540442f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 22:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771483937; x=1772088737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3EBP5eZrSw5SNu4AKLCAw7ge8STkhI5WlLpg3XWzOaM=;
        b=sOpAMsQ1MVE4s7cCbsAdLmUB7thK8ePn2HjuQra1Ycn1RVNxOw3NgPxjpLLY1XHPFa
         lRvz16iiJtU4pTsZkKkLTG34wrLk4sJIe9MvS9mRzxIz4tHo58U+H3/vn4oQRgJpDinA
         JdB4RpAKhq+jK/sLfedkJRha7zs95pJW3vYId2cGjGtQ8AZ1ECoQTBPmj2LoWIwJvQNj
         7zlzEbIVeXJg5tIUIvwQM3lvdIywkjGefejv1WOaePKSlhyzSiLicUMVQsljnd3ofwz/
         X3Fz7Hh5bxgRL+M2XOx/jxpNnpoRiXAXEmRx2BZoat29D3xWNKBRUsGfz/VEgsDeW9Tz
         vS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771483937; x=1772088737;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EBP5eZrSw5SNu4AKLCAw7ge8STkhI5WlLpg3XWzOaM=;
        b=iarvCiw5TFD/ezW4PB2XHl2RTvmysLziU2V0xSboaxP5TsurdzkliPSesYfuVs90mI
         crucNQGgzS20gly/dP2PBsvLK1CiFPmjx3ysFBxb5NdKL/tI6+GH9xor5o9FbEsGiHXL
         zOFqbEhnRdBM4CFnPpSnCx4c/RwnKMxo4PmN2sOkge63rEwTAxlBwpVxpXBeJigt3nRy
         jxFNmdMgA/EExtYK/KFzUmRdQ5MndDv3PyJsmm+Ak1OWlSODrdFjfR3KyCLrd9MDdR8o
         rciocLK8Nw3SkVYAFVa1R/6/1ecB/ad5Kkn8CM69zhys31/ITaCd07H4+QK29xSmmD3L
         RdYg==
X-Forwarded-Encrypted: i=1; AJvYcCVH1LxmjrWWJYYIlZGDTqsGGa+syN+TfsrI7OX/GGmt4XlAHCAEcSJidZTPhk5NUlFMOfffyGrdjZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5K5G3Me5tIz+4BJmSuYdZYMDUbI4soh2IHwEV0qLxKz+zMh2U
	WR/6lF1A8a1HC7MYeAkz/DJOBYH0h9zDt7lPQGmBM/30is+Ml0f0wqseJ/iywHeddQ8=
X-Gm-Gg: AZuq6aKX4eRzs9PmkWxK2y3CWyhaKzPFdf6BPWFXQFxTlfzU2u24oQAAP/V4QUp+W3s
	iwkK2iMFzRCpDCNssLl6mpWpigZWNJMeZ84LTX8PxRhPTOl7W8fBvuV/KbJCKmH4Wwvtl22nMrd
	+ZgVdi7JNGfFK+vqzoMgSrEnPMpP0Y2BHk1rxQshwmMt3bQZVV4HU1rddl1cFK+DTy4dZxJqvsM
	LvwgArpzpz/qaFQLB33M+8o47JAo//Gs1a3UTAa9Vp/QLsVc/iF31vRXkfTMxeFWvt4VQLrJev8
	lcLAlB2GJpIhs+q/V6y546aUyskBFM8vPBsX5lJAl9PvRC9jAbIPSGsf31uBbsaYDvwJl6Ls4Gh
	ibtpX/DGQqcMkJ/3Uu6NkJBJo8SlTgJUWEyRLSYXR/x/5fhcnvZPWLf0WPji6r2+3u3rf7zyCpg
	MhCp4eK8NyNcocecm6M8qsfSPNkiHfWNG7vLYdJLo=
X-Received: by 2002:a05:6000:401f:b0:430:f5dc:d34a with SMTP id ffacd0b85a97d-43958e4a636mr7655865f8f.29.1771483937384;
        Wed, 18 Feb 2026 22:52:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm45905510f8f.34.2026.02.18.22.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 22:52:17 -0800 (PST)
Date: Thu, 19 Feb 2026 09:52:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Harry Austen <hpausten@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <monstr@monstr.eu>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Harry Austen <hpausten@protonmail.com>
Subject: Re: [PATCH v4 2/2] clk: clocking-wizard: add user clock monitor
 support
Message-ID: <202602151704.qepyfVlc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214180933.42143-3-hpausten@protonmail.com>

Hi Harry,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Austen/dt-bindings-clock-xilinx-add-description-of-user-monitor-interrupt/20260215-021554
base:   ea7282e99ead6d2a294cef40acd2a29ada3ab71d
patch link:    https://lore.kernel.org/r/20260214180933.42143-3-hpausten%40protonmail.com
patch subject: [PATCH v4 2/2] clk: clocking-wizard: add user clock monitor support
config: microblaze-randconfig-r072-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151704.qepyfVlc-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602151704.qepyfVlc-lkp@intel.com/

smatch warnings:
drivers/clk/xilinx/clk-xlnx-clock-wizard.c:1183 clk_wzrd_user_mon_work() error: dereferencing freed memory 'dump' (line 1182)

vim +/dump +1183 drivers/clk/xilinx/clk-xlnx-clock-wizard.c

68614f228e6cbe Harry Austen 2026-02-14  1176  static void clk_wzrd_user_mon_work(struct work_struct *work)
68614f228e6cbe Harry Austen 2026-02-14  1177  {
68614f228e6cbe Harry Austen 2026-02-14  1178  	struct clk_wzrd *clk_wzrd = container_of(work, struct clk_wzrd, work.work);
68614f228e6cbe Harry Austen 2026-02-14  1179  	u32 *dump = vmalloc(WZRD_NUM_DUMP_REGS * sizeof(*dump));
68614f228e6cbe Harry Austen 2026-02-14  1180  
68614f228e6cbe Harry Austen 2026-02-14  1181  	ioread32_rep(clk_wzrd->base, dump, WZRD_NUM_DUMP_REGS);
68614f228e6cbe Harry Austen 2026-02-14 @1182  	dev_coredumpv(&clk_wzrd->pdev->dev, dump, WZRD_NUM_DUMP_REGS * sizeof(*dump), GFP_KERNEL);
68614f228e6cbe Harry Austen 2026-02-14 @1183  	iowrite32(dump[WZRD_INTR_STATUS / sizeof(*dump)], clk_wzrd->base + WZRD_INTR_STATUS);
                                                          ^^^^
dev_coredumpv() can free dump.

68614f228e6cbe Harry Austen 2026-02-14  1184  }
68614f228e6cbe Harry Austen 2026-02-14  1185  
-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

