Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD8E3F0AAC;
	Tue, 22 Sep 2026 07:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060534; cv=none; b=A66SOBorGpJyKL0zJp13/UR4uWF5lGrXmesTRea21DZFJ9CwYGzY0v9e5Esp/Kymc4F1k9X2TuViD9yi6N39FUX2DjkKKK1MalmkoaehmBBJr6a/Hsl/ThRjF19VWtSH7L+8isib9+Xi9bswh+epZizKpAPbr5PkrBz/Ai4thNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060534; c=relaxed/simple;
	bh=jYRxjgdpR1NRlK2MqhyvlHb/+jMwHjghy3XCbIvhoBA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=f8xFg0Ap2D3x94lv29yb3Wav1111GxxBlZwDUjF4SkKzHg1Gg4wGj8WoUYjVHHgskmp868t//zM9NIBEwbqT5iJJeKK2QFH/S+masNZSrPnrVzKiuoHwyn81Fg8MeIbcpiMjHDEiDrrsLzHQJMeSG9EjV18fNyBAJWWaWoZ2yeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=HjmCv2w4; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="HjmCv2w4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=7li0UCnmi3VEUDWeZQy13ygt8VMTgtExd
	uQ0WnOVLXU=; b=HjmCv2w40+f/N8JfvU4uCg3vjeQ05o0pqPQ8I/n8aINib6MC6
	bMN6L5PRw9pFE7COmgBkDAcxzBQJVvjSooCih8vvoCEe6waYSsHrGau7lOTUvFSr
	ivHoGzs1m0orQFtSdxw0dH0Ledoook6PtbXeb4ozIBYrwokahXWa8FfcdU=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHQAe1J7JqJOYAAA--.631S2;
	Tue, 22 Sep 2026 15:01:09 +0800 (CST)
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
In-Reply-To: <aqBK9J1ZTJAGgxCu@redhat.com>
References: <20260820-ultrarisc-clock-fix-v1-1-f27c6a980b42@ultrarisc.com>
 <aoxzTneslr61sZmd@redhat.com>
 <178876250098.2581040.1337852022443550878.b4-reply@b4>
 <aqBK9J1ZTJAGgxCu@redhat.com>
Date: Tue, 22 Sep 2026 15:01:02 +0800
Message-Id: <179006046258.2835418.14613906948117661504.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790060462; l=1835;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=jYRxjgdpR1NRlK2MqhyvlHb/+jMwHjghy3XCbIvhoBA=;
 b=7IsMh+zRAfc35+mA5hTMo6zaKyYmrrH9JATjhOwCiSaqBa+ghSZq5lmSKQJ7Td+QvHQhjiWRq
 NpeuVZ7IxgBC1jZ9QPAC1g4CllwL4WonGArj+N2u0TQNJyufVy1TIDH
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDHQAe1J7JqJOYAAA--.631S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ArWxCrWfZr1ruFWxtryxKrg_yoW8AryfpF
	WUKFW5tF4kJrW0yr9FvF18ZFnYqanrt34UW34UJ345uan09FnIgrs7tayUuF4DZrn7GwnI
	yF409a43GFyjyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUG0PhUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAREWqw1CcADgABsn

On 2026-09-08 13:50 -0400, Brian Masney wrote:
> Hi Jia,
> 
> On Mon, Sep 07, 2026 at 02:28:20PM +0800, Jia Wang wrote:
> > On 2026-08-24 12:37 -0400, Brian Masney wrote:
> > > On Thu, Aug 20, 2026 at 10:50:47AM +0800, Jia Wang wrote:
> > > > The DP1000 PCIe and clock drivers both register at the device initcall
> > > > level. Since the PCIe driver is linked first, its probe runs before the
> > > > clock provider is available and defers.
> > > > 
> > > > sysfb_init() runs at the same initcall level before deferred probes are
> > > > retried. It claims the firmware framebuffer aperture, so the later PCIe
> > > > host probe cannot allocate the overlapping prefetchable window and the
> > > > GPU is not enumerated.
> > > > 
> > > > Register the clock provider with subsys_initcall() when built in so PCIe
> > > > host probing completes before sysfb_init(). Keep module builds using the
> > > > normal module init and exit paths.
> > > > 
> > > > Fixes: 3948a36be42b ("clk: ultrarisc: Add DP1000 clock driver")
> > > > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > > 
> > > Reviewed-by: Brian Masney <bmasney@redhat.com>
> > > 
> > > I see this same pattern is also used by lots of qcom gcc drivers, 4
> > > Renesas drivers, and a few other drivers.
> > > 
> > 
> > A gentle ping on this fix.
> > 
> > Please let me know if any changes or a resend are needed.
> 
> I just posted this series to reduce some boilerplate code across all of
> the clk drivers:
> 
> https://lore.kernel.org/linux-clk/20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com/T/#t
> 
> Let's see what people think about this.
> 

Hi Brian,

I noticed that your series has been applied to the qcom tree. I'll
rebase the fix on top of it, use subsys_platform_driver(), and send v2.

Best regards,
Jia Wang


