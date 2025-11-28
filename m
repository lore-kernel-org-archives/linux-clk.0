Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9461B264628;
	Fri, 28 Nov 2025 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764317641; cv=none; b=tijDebcy4NIFCC+r4oZhc+mJNSzzTExILM3WXWkqye4qs77xIVbtxEebMtD9meEQqcjaCLp0ONo57lJtdksOVyl5cDncsOUP2RrFQpu6EAwIDMUxIIlXmpNh3fO7u7rAgfDLCj17GXd83EzlrGO9hQAZn7LhgbO3N8ggy4tPRHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764317641; c=relaxed/simple;
	bh=gMagwaKi/4FSopFRVMgg+uHGdsnCi1VK/U7Dkvw3ygQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrgwolNOxNK2mZOD2Dj+Jbpz67pY+QByotu4y+VRTwN2x4aN/lHy5Yk44IOSvuo3NbhAvZtoCQlq7sMrQRT1wkY2fJ/mJZprn1xCuRAUDMUmoOtUa6jO+9ihw2DMStnPmeSIvBr5Hf9c2l2eHfLouzO9/jafWKhsh46ZgjqsViQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GaRph7lU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ijqjE2K3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GaRph7lU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ijqjE2K3"
Date: Fri, 28 Nov 2025 09:13:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764317637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3zJAl3/7GWmpQsnkVs/lnlUz1vc8ovJjGBqqf79Duo=;
	b=GaRph7lUvQMu4m0qyVcLeoqdP2ck/NKogCJTEr1jnu82yzhIyA2sgy0hk9Q8KDQqb3Yjc7
	YySMSm4CF9VYQhZ7KXB8OU1v3egya2VwPC6hQD/pyNALOFTs5fXMsR2XVgnIJB/+gmBYX+
	f9XexTSkpLeLOv2offlb+fuUP+8fsdQDkBq5Ef6gzPk5WYtF8LxtS+wSCF0E4k1vIyjxc5
	ne4e2L7Urv4lIJLRX925DFCJe3hDiLQmUMWiX1abretVRZ9DeCU5iXe1KIl6Nof4wqyLkr
	NQsSwdg6HyKNVaRnB7eXktKMV6WQM/d4It9JF34eF7c2eLddMUCkRO2wL3fw1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764317637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3zJAl3/7GWmpQsnkVs/lnlUz1vc8ovJjGBqqf79Duo=;
	b=ijqjE2K3YF7rRqygFfZ/RsFGeo/3YyIWxk0YvlwcBO+5r2+bZLQr3QtBISqIjzTTJM2fM6
	LW+dr/0Pwf0HpwAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, David Gow <davidgow@google.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] clk: Disable KUNIT_UML_PCI
Message-ID: <20251128082930-a0343b02-715c-446d-a879-57526a765191@linutronix.de>
References: <20251128-clk-v1-1-2dd64cbb0c3d@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128-clk-v1-1-2dd64cbb0c3d@nxp.com>

On Fri, Nov 28, 2025 at 12:14:48PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> commit 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
> causes clk gate test fail. Deselect KUNIT_UML_PCI to avoid the failure.

One relevant bit for the commit message is that CONFIG_UML_PCI_OVER_VIRTIO is
also disabled in this .kunitconfig for the same reason. See commit f84a9e965833
("clk: explicitly disable CONFIG_UML_PCI_OVER_VIRTIO in .kunitconfig"). The
commit itself declares itself to be a "short-term fix". But it is from 2022.
Maybe we can fix this properly at some point instead of papering over it.

> Dump as below:
> WARNING: CPU: 0 PID: 227 at lib/logic_iomem.c:141 __raw_readl+0xac/0xe0
> CPU: 0 UID: 0 PID: 227 Comm: kunit_try_catch Tainted: G
> Tainted: [N]=TEST
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
> 
> Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
>  drivers/clk/.kunitconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/.kunitconfig b/drivers/clk/.kunitconfig
> index 08e26137f3d9..4697bf9fb949 100644
> --- a/drivers/clk/.kunitconfig
> +++ b/drivers/clk/.kunitconfig
> @@ -1,4 +1,5 @@
>  CONFIG_KUNIT=y
> +CONFIG_KUNIT_UML_PCI=n
>  CONFIG_OF=y
>  CONFIG_OF_OVERLAY=y
>  CONFIG_COMMON_CLK=y

Maybe drop CONFIG_UML_PCI_OVER_VIRTIO=n from the same file?

Thomas
