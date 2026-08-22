Received: from sonic308-56.consmr.mail.ne1.yahoo.com (sonic308-56.consmr.mail.ne1.yahoo.com [66.163.187.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07EB49364E
	for <linux-clk@vger.kernel.org>; Sat, 22 Aug 2026 12:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.187.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787400142; cv=none; b=Tmo9HhehaC2oWVmKoR17sW6g/hhqeuC2LjW+7tsndUFvaDbLclIi0yknQlZfrqOo7jNj7c4fhV6UH+S6yN4fQT2Vxz/lLegIoLLY2xpMpOHSvgIDkudMXPB2VDepYFIloCwZfxx4HsfLxwvKLryeK68kIDsYljXQkYHPqcl1Jq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787400142; c=relaxed/simple;
	bh=s4Wa0qWjE6AXVdv0c07yVbuoJbOretYa3cy6R6vDmBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+jZ57ONMRx9mIiGXolM21gDJ53rLRGzSaEokkWwZyujhYNwVyUDrUOPbwhi5YI1nBGPib6Tg3QInDbh9XSAGpiV6RNyOhwFQee1JJFuPoEGnxSDlsemQc9AW8HHks+D1t7GmPUFSvOX1itHCp04HX7BtahoZ2IFn30H48kWcFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=rSOzEBzt; arc=none smtp.client-ip=66.163.187.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="rSOzEBzt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787400140; bh=s4Wa0qWjE6AXVdv0c07yVbuoJbOretYa3cy6R6vDmBg=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=rSOzEBztTzEnXmvmsf+5wD704NMjgt4fwFpSnoU9bZvvwKIOnaBgZqQVIcw2w6DwFrjQCg9KBJ/VCxtqJ8NVql1hxHf/Bt2pL/pyYZyqEaFyZutksOPZEbs5T9zvNHn4t7pnPWLD6l++8NayKWlIsN/AxuGOWoDp7KPXJs+YfRxkUzz4BTEB2LEBih5cm/V9RUamhumEso+PQeviqbSuKr7qoMC08JYRGTSEO3uLWLMNNVWk4KomGxk85PIXDpnYRXs0X3MgxDVFzxmwdAet63kROibub3i2q0wE3t5MG+1JGdH4zPpMoQbypjUUBEynjDLy1ZsgNLmf0omK1Ip1CA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787400140; bh=Gd4fhg957Q7WfJ3K4b7w+/pmikyqXNXQ+To75TVgC2O=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=W9q3N07yGwxwIz+7JzEcWmDseZO+ByrnA0kou5tJQ4f6YOeGfEQKYw57vyol1PynLrjZaabvoDSxuzfQHANEPONq/OmEzbyvDeefeJ4ntsOtx/whPYG13qGyV7bJ/07e7nyZ1+Q1UPazSoTN3STc39hGdwmF2Ix2+lWJgDfTwNRFGLB5irKsm70iV8/P5PONq+UFu6Fx/vTx/H9Pj3sDdRbRr40ekpwGzSBemOsKo551RJt+izyVZ9we5NsZLBT1iv5yrWi7oSwU0g/WXF021pVArf1HAlj/BJENrtALS5DJnthJP+eB4R4m2KofwZ5eiKij8eeJrh4Rq1G2musp+Q==
X-YMail-OSG: dsIeJhoVM1lHJZPUUvoNlnZ0qVZ8ALlP8UZRvcddlcOM1KWfx063_B50xgy_dXe
 zup2O1KAqs.klqN8wWJnwO.0KGHJfCZCsNAdfnmxRexgXN6r400ZV6ZZps9PCCY_JOUsR.r79tQi
 M2.2mCAWuwtqhsp2tNU6HFiQbNppyL3xsAQ9JsrndyjMcHh88HdPHkdeRGnfhQ7.7FhuMMlrA7kq
 5VMdp.0u7CNQERpORPP7nMB1DWnR.k81ZBnGV7lCM5a90W0oG_KqK8yPwnusRVeIhJoRztFFNPbo
 _cAA0F85Ar9ENJOOFBpPJ15mIKL84y5cpkaGZSbM3V1rgqPgvGXi3pj66eyqiVEHWz5Bwn4oZA_j
 VQu8Iuj2RaKh4ZHWVFMo_p9vW6POz5Z0qJ40HUfGQnGwl6l8Z9fvENhwTyIGgDB7Z6ZFaex.Wacv
 UcsgA72YvOn4e2NIcWAnTH9zzTziW1t_af_KhVGf4uWh85rqiNwcNZWDcy7zcOgTqPHc1Zryw1ru
 dv8zq_sKlm9eWlPCNwhBn9rX8Jn6PaHD.90Dak7AlkXzUctaa8UWNfVS8qh20lbUyw9HJSseIs6Q
 7nviZl_JgvyiCJsIl98Nn91iWNdgGKwYKKZrgzQse59C3mAgFop9h_wgtrRLbRz8Q.FbrjiRP9P3
 l53DpXxzBmYjDYSlPsHxlaH9pK_LQLExh7S7kIBqpysA9wMDthrYSqychPYm7tk_PTUiIT3sXRq_
 _426Ljcxda5bqnY_1GHHD99.7egU9JnUG7AVzavoTjmuKVg._t9JDn2U4DvJWM.6.3W3Cn15oiDH
 QI8g4gIYedmNIcYnz4PBqv7GrN.jJNvzbI1DnF5EiqvaY5GIXbpMemeH6etzoXr7fou1QUI_Oj6f
 KTN.us9MW7NAbfWqPEdMqetw74EZKKQ9mQSXJ6W5jT6gObwednntSCj6O0CoLtpoQpsRLrifLj4_
 ST8wfYTP30ejxr2T56nsbzWfIY0FYdAYPiPYGpy1.m1x1XVMkFnl1Zub28yoTFNhXJektJX74E7S
 OdH.abXNdMh6LZumC2ET9z1L7dvsbn6DMyFI8QDEKz.oJJpUm1sDdm.rZf8kpCvOn1HhH5TiOUOu
 QmrFCeWZvHOScxLGYkE6LADtIgbtT5hEkGtkg17lJeZ287kWt5uNtNQn9NYfSw9hEx3R5U4vcR2_
 nCZrn6sYhrUf616Bp8mGfCakNY95JqUkllCsS5hnjLSLoFja9y34KXmjpvITvvdzh21zh0Se9lS7
 Yg5FPkCs2s5omhBmcytLovO54XD_TUzmgDMfew9jLsl53IeSGXbT_kcrjRUrHPWLJFBMyOADcyah
 RoxCMt1feTE0TLa0sJJGFQACX7bzZL8KL3ZXseMWVFRiFyf5TRH0XB5p9WZqSIrJo4SkRKQuZ4WA
 3bSFtdhjr4fe.nSPhdsvBE9rzeAYoVH8NlN5WNuieMkrYP1kjclDtBU.A9L8xq7nQrLSNGoS_5g5
 jbeCE0DF4_w8emc_Rv32De0MCFORlgZeJo0coMMR_.2NCYZ9ug4GoF95V8Byhvt9AyJuGSIcgHao
 l0G44OSG02BAbN_hu5p.mawA_nTcXKUxbzXMpBOo5GmJpYDgUrb7VCn7FsfAHLlrYkWh2kip30P6
 eq2vuUb35wLyY14_HLW5X2rgGJ.tzs52d.cQmphEpmR_ExPayVY6AI_QDU4ZdZhgiGpyfTKeSL3j
 enhEypHhgFLydw2Wyv7yPnxW5u5_hn4pbxz_7OdjHC.pNwZE1SrTWH5W1AARNV2DwqTcDzZlgpe2
 j7t.VHFYXcd3XBnuPpuJwL11jc6cn7HsmOp5gZRJzVdelbARsuMVdmv0RHJAnxfqfCAyvZtFBVGk
 gimZxoiWJuSws5WS3XF07JpYuVDrBpgmSIxpks4E08ZSB_RcG_8O_imgHGgOqERhobMGipQMqRBX
 2eKkc8.WOTX4c_qEBCEiBozLm2cLt9mepkXps.MIpNPhg8e_VHS5Y6VrXzJDNVjL4VZjVICU9xpI
 QMCXIW0rruoei5v0TyGqEg61zht0cYHb9X2djXSXJf7xA5DyvWzAsn2BuPQJs2II6JZ_c5okr3so
 Q56rRtPraMc5_dNNUSAgPUqyf9eFCBg.g1MK5Pcj4p5Ssb_N3NffqOqlgYPBZl7ciE9lRmAEG_N7
 piy4EN0Ctb8vLXsro7jwvmIOOewBapg5tiRwHan2YDPdo3Eie7uhxQPF3MHRXFRVUGmaTn3pmbGc
 4FHg6Hhy8jZClbZKk9lBnI1qMwCJ6HD_TQOcnaO_8L73ilnc7goZk15gXDJjEnP1c7DbJ27Hf6oo
 ecszofmeMttpuIy2ofA9nOCGhk4orX326NQ--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 8f0b58d9-8ade-450f-86f8-2ca7c74bfa99
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ne1.yahoo.com with HTTP; Sat, 22 Aug 2026 12:02:20 +0000
Received: by hermes--production-ir2-cddf86dcf-wdr5c (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d9e6700a592f300a4cd05ef193b7d1cf;
          Sat, 22 Aug 2026 11:19:50 +0000 (UTC)
Message-ID: <8286b42e-0314-477b-ac2e-4b410a97d833@yahoo.com>
Date: Sat, 22 Aug 2026 13:19:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Jie Luo <jie.luo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Stanislaw Pal <kuncy7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260730191353.557494-1-kuncy7@gmail.com>
 <aeeeebf9-dbd4-4f57-847a-5f495b3236a2@oss.qualcomm.com>
 <20260803091003.15285-1-kuncy7@gmail.com>
 <8af46926-fecc-4396-973e-2290ae285998@oss.qualcomm.com>
 <cd5a25ed-76a3-4f1f-b924-06bb685ff426@oss.qualcomm.com>
 <181944c2-2484-4384-9c91-45cc87f31955@oss.qualcomm.com>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <181944c2-2484-4384-9c91-45cc87f31955@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.26380 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On Thu, Aug 20, 2026 at 01:39:52PM +0800, Jie Luo wrote:
> The CMN PLL output clocks do not depend on the AHB or SYS clocks. They
> continue to operate correctly at the fixed rates even when the AHB
> and SYS clocks are disabled.

The PLL outputs keep running, but the AHB register interface does not.
Once autosuspend gates AHB/SYS, any later register access to the CMN
block hangs the bus. That is the bug we are fixing.

> On IPQ5018, the CMN PLL provides a 50 MHz output clock that is used as
> the reference clock for the connected Ethernet device.

Correct, and that consumer is hardwired in silicon — the internal GE
PHY and uniphy blocks take proxied this clock without any Linux driver
calling clk_get() on it. Therefore no device link exists to keep the
provider active, and CCF rightfully gates the bus clocks after probe.

Adding DT consumers would require touching PHY and datapath drivers
across multiple subsystems just to create artificial clk references.
That is not a stable material. The v4 driver fix is minimal, correct,
and self-contained.

Reviewed-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>

