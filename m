Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FDB23EAA3
	for <linux-clk@vger.kernel.org>; Fri, 20 Feb 2026 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597999; cv=none; b=MBwsguVDnb45BpRK1+/2uDySCQbBY+mZZGhSGrtckhzPxRXXQ2sgjZcKl5GARW7Dc5ViWc4oc6ae+0WlAq4yu7T4i6alPSeBTl9hyjxOVnjAUaduksfZk7MTaRkp02bwc/Sh5BG296xxNMR18vzWb8QFnIxG2bQeiSUGbGMReLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597999; c=relaxed/simple;
	bh=TYJ30ChM6gcCS6QYe5Ckg+2S4lGk8QCdkrY13mptiiI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fHFWjETWrBrNdU48JAfjSyJOIiVnE9EQpU+QHptjpE1j6ZJP3mxdKWputf76JyMRoiDyAHEiBwcPj27rh7Qn82Dfgp0yfiSGQ4Gleel0w/qMlGK8qLtU+jDyAIIzJs5KHnhkUc8SrS0S8LZmlHoTfeU3AgnDi5C2UQloMq8S8L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=NIKOiXNx; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="NIKOiXNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1771597987; x=1771857187;
	bh=qlD/PNnYcqmWY7VC/XbBl5Mb7IvYgw6IfOHsy2m/ZS8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NIKOiXNxYonLwfO4TAlXq4EB63vyM7/6bACW7FQTM7bkdXmHrz3sQWJqmbCXYc03l
	 vkf4UlJQ87xHUfiigBjjjyuBTqG0wn4IAE70I/Y6HoT7rW59eEMgZMNVOdgJyzYX+w
	 VBSWuYgy2OoAIvuuHcWYeWLFQQeYvTQ9XMGJiYhZrD2A3cVobzY/redLaChLZmcGV3
	 /7g+N3bfKy5mLVkxrSS/uUhYBEDcI3YV/iq2yWVAalvylDSHVDYMn3Tc4ChuCbW5s+
	 hIdtUr6Ya1BJm8KM8hqxUA4euBLiYlyd5S087cNIEPFjHvkU26oJyJc7uFc1Z11oVp
	 +UwP/nH92sP2g==
Date: Fri, 20 Feb 2026 14:33:04 +0000
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, Harry Austen <hpausten@protonmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <monstr@monstr.eu>
From: Harry Austen <hpausten@protonmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] clk: clocking-wizard: add user clock monitor support
Message-ID: <DGJV2ICCB72N.39T6HN62PUHPE@protonmail.com>
In-Reply-To: <202602151704.qepyfVlc-lkp@intel.com>
References: <202602151704.qepyfVlc-lkp@intel.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 5b0edd8755628df423df7963b1dc7428928e5e67
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Feb 19, 2026 at 6:52 AM GMT, Dan Carpenter wrote:
> Hi Harry,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Austen/dt-bi=
ndings-clock-xilinx-add-description-of-user-monitor-interrupt/20260215-0215=
54
> base:   ea7282e99ead6d2a294cef40acd2a29ada3ab71d
> patch link:    https://lore.kernel.org/r/20260214180933.42143-3-hpausten%=
40protonmail.com
> patch subject: [PATCH v4 2/2] clk: clocking-wizard: add user clock monito=
r support
> config: microblaze-randconfig-r072-20260215 (https://download.01.org/0day=
-ci/archive/20260215/202602151704.qepyfVlc-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 14.3.0
> smatch version: v0.5.0-8994-gd50c5a4c
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202602151704.qepyfVlc-lkp@intel.com/
>
> smatch warnings:
> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:1183 clk_wzrd_user_mon_work() =
error: dereferencing freed memory 'dump' (line 1182)
>
> vim +/dump +1183 drivers/clk/xilinx/clk-xlnx-clock-wizard.c
>
> 68614f228e6cbe Harry Austen 2026-02-14  1176  static void clk_wzrd_user_m=
on_work(struct work_struct *work)
> 68614f228e6cbe Harry Austen 2026-02-14  1177  {
> 68614f228e6cbe Harry Austen 2026-02-14  1178  =09struct clk_wzrd *clk_wzr=
d =3D container_of(work, struct clk_wzrd, work.work);
> 68614f228e6cbe Harry Austen 2026-02-14  1179  =09u32 *dump =3D vmalloc(WZ=
RD_NUM_DUMP_REGS * sizeof(*dump));
> 68614f228e6cbe Harry Austen 2026-02-14  1180
> 68614f228e6cbe Harry Austen 2026-02-14  1181  =09ioread32_rep(clk_wzrd->b=
ase, dump, WZRD_NUM_DUMP_REGS);
> 68614f228e6cbe Harry Austen 2026-02-14 @1182  =09dev_coredumpv(&clk_wzrd-=
>pdev->dev, dump, WZRD_NUM_DUMP_REGS * sizeof(*dump), GFP_KERNEL);
> 68614f228e6cbe Harry Austen 2026-02-14 @1183  =09iowrite32(dump[WZRD_INTR=
_STATUS / sizeof(*dump)], clk_wzrd->base + WZRD_INTR_STATUS);
>                                                           ^^^^
> dev_coredumpv() can free dump.

Whoops. That makes total sense. Pretty sure this can be easily resolved by =
moving the
dev_coredumpv call after iowrite32. Will do in next patch version.

>
> 68614f228e6cbe Harry Austen 2026-02-14  1184  }
> 68614f228e6cbe Harry Austen 2026-02-14  1185
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks for the report!
Harry

