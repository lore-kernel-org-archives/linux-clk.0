Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C971F3B87;
	Sat, 14 Feb 2026 06:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771050802; cv=none; b=Uy9+6sNMncukVmFyLzBDBm4xCTenCZnTlJN5SIM3L+M1ZUn1qJ2QpLeFv6C4JJd7nhDzWu5UNBn+aAPEFxstyARliMLpZG96TzFSkgnTrKmi76VQGjNOyVTIg+zfvHKOdOheqU0s52+SwuL8I08O+Z3L/q76rSo1wlNvrv18OQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771050802; c=relaxed/simple;
	bh=xnIRGd9+L3lJWfTvUHBF/6qigS8/WMAMUa/MKVu1asw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHWebCuOF68lcuAwunWPKKR/nbhhx2svBhwwEz7k98VIRN+6Gi/Kdlt7V5h15Up/nvMP+M3U/0Sw/9mMbiU4z7JNK9suKK0aVwEuZNSg0342Us/1x3i3UGy45eC/wSUJfGZLyLNrBaGiWNNtWg+wA65p0CbqV5aqr4iQARF+TbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [110.228.131.240])
	by APP-05 (Coremail) with SMTP id zQCowAAntQgkF5Bpt2dCCA--.30789S2;
	Sat, 14 Feb 2026 14:33:09 +0800 (CST)
Date: Sat, 14 Feb 2026 14:33:08 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v10 0/3] riscv: canaan: Add support for K230 clock
Message-ID: <aZAXJOHqrhKh8kd5@duge-virtual-machine>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <aYNwmqEjvfAahGA+@duge-virtual-machine>
 <f97dbaa3-b6d6-4dd2-aab9-f24a68c4adfe@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f97dbaa3-b6d6-4dd2-aab9-f24a68c4adfe@zohomail.com>
X-CM-TRANSID:zQCowAAntQgkF5Bpt2dCCA--.30789S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF17Aw45Cw18CFW8JrW8JFb_yoW8CFyfpr
	ZayF4v9F1DJr48Xa93uw4UuF10v3Z7Ar1xGw15G34kWFy3AFySqrZ7u3W5Za4Dur43GF4j
	vr1Yka4Uu348ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkYb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k2
	0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
	IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU89Z23UUUUU==
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

On Sat, Feb 14, 2026 at 12:37:24AM +0800, Xukai Wang wrote:
> 
> On 2026/2/5 00:15, Jiayu Du wrote:
> > On Fri, Jan 16, 2026 at 09:26:18PM +0800, Xukai Wang wrote:
> >> This patch series adds clock controller support for the Canaan Kendryte
> >> K230 SoC. The K230 SoC includes an external 24MHz OSC, 4 internal
> >> PLLs and an external pulse input, with the controller managing these
> >> sources and their derived clocks.
> >  
> > Hi, Xukai. Currently, the k230 initial series and the patch 3 of the
> > pinctrl series has been in the linux next. So if possible, you need
> > to rebase your clock series onto the latest linux-next.
> >
> > Then I will proceed with the development based on your v11 of the
> > clock series.
> I've rebased my patch series to `linux-next` (20260212). I noticed that
> the patch which updated the `k230.dtsi` format has been merged into
> `linux-next`.
> 
> Consequently, I've updated the `prerequisite-patch-id` for my series
> from `deda3c472f0000ffd40cddd7cf6d3b5e2d7da7dc` [1] to
> `9a2d01f55574b538dad572e193f81c44661f0853` [2]. Is this change correct?

Junhui Liu's commit `8cfdbd5e207d434a6e924eb81092874177f97536: riscv: dts:
canaan: k230: Add b ISA extension`, also modified k230.dtsi. I'm not
sure if you noticed this.

> Separately, I sent you my v11 clock series for PREVIEW, but it seems you
> haven't received it.

I have received the v11 version of the clock series that you sent. I will
conduct the test shortly.

> Link:
> https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/
> [1]
> Link:
> https://lore.kernel.org/linux-devicetree/20251227092355.42825-1-jiayu.riscv@isrc.iscas.ac.cn/
> [2]
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

