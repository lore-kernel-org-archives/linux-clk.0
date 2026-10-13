Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87CD3A1B5;
	Tue, 13 Oct 2026 00:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.38.64.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791850401; cv=none; b=tGccZw5t11+39793GdssWRINLBQ0Ya+x90XOvEolGC6wR2DtqIokb5BjY8z+f9LOmNcHNmM1jPuU0Dxg0g9XLo92vljokMms1Hlggr7jLvhOlRd9GLRlhU9MxcMCVAZDokgIxJ/yBfUzaPxTo5TmyDMhzF8IkaAtuFe9GsuZxW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791850401; c=relaxed/simple;
	bh=uKVtR7tRRNHn0e96X5owFpa/yollEt7bUwXNjIsV2lY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rYSuDN5Dks90lFzBqcdFsbUziWypJosh7EhOPMNOfMdQKxK9krEejIGB+DKzbUG2dK9cKJ6qR+Lnz7Eh9whacHr/PajgXlDB22pFBKmzsMTHd8dI5bVbSOeghCNGmlCvmRPOX/g2VcZMs076ZExnkmN5TWdSBspIQJ0PWeWZ91A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn; spf=pass smtp.mailfrom=mail.ustc.edu.cn; dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b=iLHD2avf; arc=none smtp.client-ip=202.38.64.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b="iLHD2avf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=zQvyoQ8x7gJKkcUzUu+Hp
	m+WTZB3SN8Jrv6hq9tNTJY=; b=iLHD2avfCHI5vN0teCeN0N/l8MQ2zdvthyxwY
	EA8x8qCDzPpeC9epG0LJnFomOHd77SqiYwDf7BLBMvsCx/SUHCWJ6z2DEv7DGM/b
	a+awJqaNH+/KLUMF9scwUB/0qudkbciEoBkOsEl5UohNkGFVcg3f2hTbY1PMB5KP
	o+GpwI=
Received: from [127.0.1.1] (unknown [114.214.192.228])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgDXxRycd81qP6PcAQ--.929S2;
	Tue, 13 Oct 2026 08:13:16 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: Re: [Regression v3] SM8750: cambistmclkcc + camcc together hard-reset
 the SoC on display blank
Date: Tue, 13 Oct 2026 08:13:16 +0800
Message-ID: <179185039667.309517.8503800087166757122@mail.ustc.edu.cn>
In-Reply-To: <179179331695.677917.11557670447411700010@mail.ustc.edu.cn>
References: <179179331695.677917.11557670447411700010@mail.ustc.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:3pYKCgDXxRycd81qP6PcAQ--.929S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4rKr47Aw48Xw4ftr17trb_yoW8GF1rpF
	Z0qF13tr4kJFZ5WFZ2yr1xXrZa93s5JFsrJwnxt3W7Zay3Jr1F9FWDKrnY9rWUCFsFgasY
	vF4j93WkJF4DZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcw0eDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARETB2rNcIkC0AAJsB

Hi,

Two upstream data points that look relevant to question 1 (cambistmclkcc used as
a bare clock controller with no consumer).  Short, no new bug, just context:

1. The Kaanapali camera DT overlay (PATCH v21 14/14) uses cambistmclkcc as a
   camera MCLK provider:

     clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;

   So upstream does have a consumer for the block.  On our SM8750 board the
   reset happens when cambistmclkcc and camcc are both probed with no camera
   consumer attached and the display is blanked.  Is a consumer (or the camcc
   side being powered) expected to hold the block in a different state, or is a
   bare, consumer-less controller meant to be safe?

2. The v7.4 clock pull contains "sm8750-gcc: Add CX power domain",
   "gcc-sm8750: Tie the CX power domain to controller" and "dispcc-sm8750: use
   common probe handling for always-on clocks".  Our failure always ends at a
   display power transition and the last RPMh write before the reset is a
   cx/mmcx level vote, so this looks like the same area.  We are rebasing onto
   that work now and will re-run the pairing case (camcc + cambistmclkcc, real
   display blank) with the same three-state instrumentation; if the CX domain
   tie changes the outcome we will report back with the evidence.

No fix patch from us yet - the four questions in the original mail still stand.

Thanks,
Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

