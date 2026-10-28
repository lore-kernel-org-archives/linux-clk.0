Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188682;
	b=FLqdFvNP5VxXOBaXlQorP2whvoK5R+gLMrrKeteRJcCM0nsp/XuFTkGoFA6EMde/sX2v
	 pGrUPom7ptqV8MJSe6/+uWmzIplZSZaFLRxFWHjk7T/tEBKLJBFMMQ5FJzJ26dx9+3Qdn
	 bfZIuJi+qHEercKiV9XV6kQcHKSx/WevUpJC+i+aqXwFs7OJfk9WDR/BWj2obd7i5ILCU
	 6uw5oku90QKjyzTJmQOCJYfDw9JNxPAhzELe4NrWNG5uxmuPCh9dnxFYVNCY5Ss+Lu/gp
	 Bshsfnv/mRvszR3eE1I8lwKmCGyXonB8QjY6MasduU0aYuig89JjY1Gy3EE+QD56vfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188682;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=SIzXsF2cSOwvj4zqSccNZxhOlsxGaf+jUqImNxmEMvo=;
	b=u3k1KW2Ij0nDIIyDecaWfI+918nZj2ee+q1fYYNp8MZBtpbxuq2Ab3kDOg/x5dRjqBHr
	 oAHdYvTG8hyUbe6p3cYJ9e1j7/nS+B3cN0DzugrrWor8lZ8do2epQBJUZjroDjMcmnQOy
	 rnzMOysR0hrww9nSJff2mciLEsSlyo8lyH56fccLGLCfYwj2qwerr7hm4dycvi2oCKFu5
	 K2RYTl/u0JxEAEqvX/sbRBi2CJ+lConNDV+vGI3pzQomNWOzK7yAI0tyvVmOdzmNPomUS
	 7N0Xjh/KQNCxi+mpk8fC6AEP7Cu6sRBFrOk5zCxZpKo38RDB//FVe2OpCRx+lRVfI+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=j5OtIRou;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F74C606A31A;
	Wed, 28 Oct 2026 11:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F74C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=j5OtIRou
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=SIzXsF2cSOwvj4zqSccNZ
	xhOlsxGaf+jUqImNxmEMvo=; b=j5OtIRou5pxx8OXpqnpffa/sdOzjFs4VnYkiT
	58imOHjSX2FiuCcGYWiC3Z1MghEwI1YQVyVf78hcGHzCsaRyUf+4xMpfLUUQkmNX
	zuyb6ISlVnflNwywTcbXRkw4oGZ816/TP0JuA+CAtuBd/bx9Lt+kgiCClL68Zj6j
	rcpbVE=
Received: from [127.0.1.1] (unknown [114.214.180.23])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgB3_kI84+Fq3M1YAA--.876S2;
	Wed, 28 Oct 2026 19:57:48 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC PATCH] clk: qcom: dispcc-sm8750: reset the MDSS blocks at
 probe when the bootloader left them running
Date: Wed, 28 Oct 2026 19:57:48 +0800
Message-ID: <179318866835.88849.1485640983989491497@mail.ustc.edu.cn>
In-Reply-To: <22a87c51-4f8c-49c0-a13a-c11767f10e85@oss.qualcomm.com>
References: <20261022140811.469417-1-xiaqinghuan@mail.ustc.edu.cn>
 <22a87c51-4f8c-49c0-a13a-c11767f10e85@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:3pYKCgB3_kI84+Fq3M1YAA--.876S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWUCF15WFWkuFWkXw4ktFb_yoW8tr4xpa
	1agF4rCrnFk34SvF4xAr40vay8C395KF43Jr98G343Z345trySvrZ3tw4YgrWqkrs7Xw1j
	yr1Ivw4UA3Wvva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxkI
	ecxEwVAFwVW8KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
	GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUgmhwUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREOB2rg+9ZfJwBfsZ

Hi Taniya,

Thanks, that is a clear answer and I will drop the clock-side shape.

Taking your two points at face value:

- the resets belong to the display side, not to dispcc probe;
- resetting the whole block after the PLLs are configured will flicker.

So the RFC as posted is withdrawn. I will not resend it in that form.

Where I think the replacement lands, and where I would like your opinion
before spending time on it:

The reset already exists on the display side. msm_mdss_reset() in
drivers/gpu/drm/msm/msm_mdss.c asserts the mdss reset, sleeps 20 ms and
deasserts it, and sm8750.dtsi already points that reset at
DISP_CC_MDSS_CORE_BCR. The "hold it for one frame" timing is not new
either, that function carries the same comment upstream today. So the
mechanism is there; my patch only moved it earlier, into dispcc probe.

The reason I moved it is ordering. On this SoC mdss consumes dispcc
clocks and MDSS_GDSC, so dispcc probes first and the dispcc PLLs are
programmed inside disp_cc_sm8750_probe(). msm_mdss_reset() then runs
after that, so resetting there would take down PLLs that were just
configured - which is the flicker you describe, and quite possibly the
same failure I was trying to avoid in the first place.

So my open question is narrower than the original RFC: given that
ordering, where should a board that is handed over with a live display
block put the reset? Three shapes I can see:

1. keep only the single CORE_BCR reset that DT already describes, and
   let the clock framework reprogram the PLLs after it;
2. drop the block reset entirely and do a per-encoder reset in the
   DPU/DSI enable path, so the PLL section is never touched;
3. leave it to the bootloader - the vendor loader has a DisableDisplayHW
   knob for exactly this - and carry nothing in the kernel.

I am not asking you to design it. I would just like to know which of
those three you would not reject outright, so I do not spend a cycle on
the wrong one. If the answer is "none of them, this is a bootloader
problem", that is a useful answer too and I will write it up that way.

No date attached - this is a background item for me, and I would rather
come back with measurements than with a schedule.

Thanks,
Qianhui Xu

