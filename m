Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418553AAF5D;
	Mon,  7 Sep 2026 06:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762516; cv=none; b=FwKRy7Sj8NI82ouam9gxwaaKFbpX+xKrbJ+c+QW/d6zU4sMDh6VMTzD4MyL8STcJUIp7XidECvbiDQpFcgeljgrPNDIOCs6aEiFzeWvHbYPYFE648qmFYLbkPlgz8kgzWEl5g8USb44+J0GNhPPsZATlgLlFJ6tHu/fA4CAZgBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762516; c=relaxed/simple;
	bh=58f/7cs5Tg86uAPZttAleSwy5aEYNn3uutYt5Dy46UM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=L1hckPy0jJTRqNTkIB+rnBLCynqPfUqvxQcxLra1DfPC4FjiGkWh9OgBImzbfZYuCMmUzJ0UqV+jbdcchaHJ9IDTaeOme8Apw5mNEWwdIo2CmaMV6pQUzdDr3A5CiDkRw+WcOt637T2wOTqV+Rfl4zZ0gTAucKQMuI/L4Ua7pdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=LmP7IWcw; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="LmP7IWcw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=MG1ZB0F5fD0UTr/wyYEwootAO5twhA0H7
	BU+8s20t30=; b=LmP7IWcwQwGgTpPN0Bbw1CYaJmu/aGOIFVlu7GBGZqlGuiLKN
	2MHypXJ6LzF6D4NWuvjBds6y2wkEeebrfGgT4N22jShAS7QlGRHaoTkcZ1etjuxz
	mopa8QsKTlHP/Z2JeL0ecZ/NzZYMMzPP7C3vApYYUf51ysabVehRxrbmOE=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHQAePWZ5qJFUAAA--.361S2;
	Mon, 07 Sep 2026 14:28:31 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: ultrarisc: Register DP1000 clock provider earlier
From: Jia Wang <wangjia@ultrarisc.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <aoxzTneslr61sZmd@redhat.com>
References: <20260820-ultrarisc-clock-fix-v1-1-f27c6a980b42@ultrarisc.com>
 <aoxzTneslr61sZmd@redhat.com>
Date: Mon, 07 Sep 2026 14:28:20 +0800
Message-Id: <178876250098.2581040.1337852022443550878.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788762501; l=1197;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=58f/7cs5Tg86uAPZttAleSwy5aEYNn3uutYt5Dy46UM=;
 b=tfGuRPXGzK6kF4MOBIg+HB7bfG5ec6KeUJyi7bsUIWAA7xrzFdRXvMu/oiYTQ31ioyXOB6Jom
 /mffz5KkOkAAHOsrG+3yQ88jY95GRkK/oKcHJQGxtkaqEuHP48dQpF2
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDHQAePWZ5qJFUAAA--.361S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wry5AryrZw4fZFyxtrW5KFg_yoWkAwc_ur
	ykuryDWa1j9rsrJ3ZxCr47A3yak3WqgF15Wr4jq3ySkryfXas5Za1q9F4Skw15Zw4ftasr
	CrsYqFW09w129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUBVbkUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQACEWqdDaQAAQAGsL

On 2026-08-24 12:37 -0400, Brian Masney wrote:
> On Thu, Aug 20, 2026 at 10:50:47AM +0800, Jia Wang wrote:
> > The DP1000 PCIe and clock drivers both register at the device initcall
> > level. Since the PCIe driver is linked first, its probe runs before the
> > clock provider is available and defers.
> > 
> > sysfb_init() runs at the same initcall level before deferred probes are
> > retried. It claims the firmware framebuffer aperture, so the later PCIe
> > host probe cannot allocate the overlapping prefetchable window and the
> > GPU is not enumerated.
> > 
> > Register the clock provider with subsys_initcall() when built in so PCIe
> > host probing completes before sysfb_init(). Keep module builds using the
> > normal module init and exit paths.
> > 
> > Fixes: 3948a36be42b ("clk: ultrarisc: Add DP1000 clock driver")
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> I see this same pattern is also used by lots of qcom gcc drivers, 4
> Renesas drivers, and a few other drivers.
> 

A gentle ping on this fix.

Please let me know if any changes or a resend are needed.

Best regards,
Jia Wang


