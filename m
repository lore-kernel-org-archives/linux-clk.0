Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E95A1B81CA;
	Tue,  3 Feb 2026 00:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770079309; cv=none; b=CF02EUQleVunIgt1brPdu9n/Afv2szPzqhnbvWrTQg9n7gCly8dDSD/DRIrfd/36pGvSjE55/pdUCsGm1fkRcRadQyUcdA4vkYQrszbrQ+9Zs0o7WFoixXlWYuxHS+LGlHZKMxElWLmjVyP4TWMTVrDh6n9ftFQuFSR1R/npryU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770079309; c=relaxed/simple;
	bh=6M3SeQnPgGYanKhc5cvEJg+JHIhuAmuKJVbbOopCC70=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GmYlcl5IFKWhoHSOJqgRpT/85RBDaB0+TnLzDHNCQQ09kRq1YCt3+yEv/dYf08jshjwXAfaMb2H/RtjLdoo7HmdQ7tzqsW3RKzWdhnXbvKARuyw8bh+pHQvVMPU6/jVLWQ651M7jE0L24dhIaSNmDp3pul6EnJgWn1X2rozBEv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7/bGMzp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7/bGMzp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010B5C116C6;
	Tue,  3 Feb 2026 00:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770079309;
	bh=6M3SeQnPgGYanKhc5cvEJg+JHIhuAmuKJVbbOopCC70=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=N7/bGMzpubrJ6Upuujz9g0dsH5CDar+edwDAGbal957/93DuzdOHn8sXgsI/MynuG
	 a4D+2cq1WqvDz+BM7sZiBxV1+9zQmHXb1sQeDFAvcDPGDkLEI0WeLZxF7jpyd+qFqm
	 AsAW9OWLL8DIKAsac381eIOoAj+gItN4HhEkaVODpy86aShZFJEJro4T0rCh41Yg+1
	 Hq3lRPVyfNO5sFzRVEVV1YH1dJpcnCET/t3/XM1DVrw7u5h4snStpOQNcWwdR4Rpv0
	 hvudF1Pf1PpdGpr0JBL+r+psOClwByTSw9q3O6kl6w1O9Yi7Gu60/q18IV9g9ZPZpS
	 LhmwUgZRBx+UA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251222-clk-v2-v2-1-83e1a5ed8c7e@nxp.com>
References: <20251222-clk-v2-v2-1-83e1a5ed8c7e@nxp.com>
Subject: Re: [PATCH v2] clk: Disable KUNIT_UML_PCI
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
To: Brian Masney <bmasney@redhat.com>, David Gow <davidgow@google.com>, Johannes Berg <johannes@sipsolutions.net>, Michael Turquette <mturquette@baylibre.com>, Peng Fan (OSS) <peng.fan@oss.nxp.com>, Shuah Khan <skhan@linuxfoundation.org>, Thomas =?utf-8?q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Date: Mon, 02 Feb 2026 17:41:47 -0700
Message-ID: <177007930707.4027.14638082184159958493@lazor>
User-Agent: alot/0.11

Quoting Peng Fan (OSS) (2025-12-22 00:06:33)
> From: Peng Fan <peng.fan@nxp.com>
>=20
> commit 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
> enables KUNIT_UML_PCI, but clk driver could not work with it.
> Deselect KUNIT_UML_PCI to avoid the failure. Dump as below:
> WARNING: CPU: 0 PID: 227 at lib/logic_iomem.c:141 __raw_readl+0xac/0xe0
> CPU: 0 UID: 0 PID: 227 Comm: kunit_try_catch Tainted: G
> Tainted: [N]=3DTEST
> Stack:
>  a0883d00 00000001 00000000 ffffff00
>  603ef142 60044832 6002598b 00000000
>  00000000 600211b3 00000001 00000000
> Call Trace:
>  [<6032534c>] ? __raw_readl+0xac/0xe0
>  [<60044832>] ? dump_stack_lvl+0x57/0x73
>  [<6002598b>] ? _printk+0x0/0x61
>  [<600211b3>] ? __warn.cold+0x61/0xeb
>  [<600212cc>] ? warn_slowpath_fmt+0x8f/0x9c
>  [<6002123d>] ? warn_slowpath_fmt+0x0/0x9c
>  [<6032534c>] ? __raw_readl+0xac/0xe0
>  [<6002123d>] ? warn_slowpath_fmt+0x0/0x9c
>  [<6029e2ad>] ? clk_gate_endisable+0xcd/0x110
>  [<6029e315>] ? clk_gate_enable+0x15/0x20
>  [<6028795e>] ? clk_core_enable+0x6e/0xf0
>  [<60289f1f>] ? clk_enable+0x4f/0xa0
>  [<602a06af>] ? clk_gate_test_enable+0xbf/0x360
>  [<60053df9>] ? os_nsecs+0x29/0x40
>  [<600cd300>] ? ktime_get_ts64+0x0/0x130
>  [<600816c0>] ? to_kthread+0x0/0x50
>  [<602507bb>] ? kunit_try_run_case+0x7b/0x100
>  [<600816c0>] ? to_kthread+0x0/0x50
>  [<60252aa0>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
>  [<60252ab2>] ? kunit_generic_run_threadfn_adapter+0x12/0x30
>  [<60082091>] ? kthread+0xf1/0x270
>  [<60047591>] ? new_thread_handler+0x41/0x60
> ---[ end trace 0000000000000000 ]---

Applied to clk-next

I see kunit.py runs olddefconfig so I didn't notice :/
