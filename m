Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300428;
	b=sphN5xP9fInUgsecH8tEIjOFv12OL2ikBaAYX4dIuYuxaZYF4O2Q78LBrg1C9OHGxf9i
	 PUk3/G0z5D1opVHDo/mecMWOp7zxzlBATWcDgBfd1SMvuugRRFEmApa/zPU1CFx2RDs06
	 4mRnVd0fE2k5RQi4n7l+w7t0OIbFWoKELkXG/jdAeXaI5jTfmpl8QqB4ReLAsLOKYYCbo
	 WW2DJEx8yEp29RXmkLlp6RRxbUttX8EbX/ad6k2crEPdUEqJTy0q7BzQj6T+0CunPRitH
	 kkWutcDbGPKCyT1k4drpLFfQ7a6XEqSb2rSINY/eqAkXMZMTS45IvuAkxN0aBF42rSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300428;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=tb236Dm5vjk3jIJHIZtBKJRyeMEkcz2Hz6AmSpXUM38=;
	b=kwluQyGKDS3edrvCOKfwxMRR4MVZWxR3nzHIx4e58ixXeDYBnAbEntleeLPGg7bAA2le
	 h84VIHTihCxf7vAi/X9/cAKaGxrYy7VZ4Xh5Zp99TqakNBR9oMdaEnFMrSC1DELMQkTZ6
	 5xYiYCGYuwLQDECuK/xGs3JUF3dyV4TRT9xOJhd6ovEr7Hv14okFCpWrmPdl7QH2yTotl
	 2XGqGW0e7bcvEDO1/bRJKW9jyi1bqgZnBHr137fO0u8DryJnuyayZBTHw2IbG+KSkEpLc
	 Dgq0Xa++XcPb8uA3oLLtgDmUJRCNHZ3VyUN9G5O1O6Zjq9Aon20Mcqq+H2SqvZdB/lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cgC+Y2WX;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="kE/mRSPY";
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1031606A31C
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 08:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1031606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cgC+Y2WX;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kE/mRSPY
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D2D8F1400183
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 03:47:06 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 03:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794300417;
	 x=1794386817; bh=tb236Dm5vjk3jIJHIZtBKJRyeMEkcz2Hz6AmSpXUM38=; b=
	cgC+Y2WXxO/XaImP2Gm48Wap91NQSiNuC5bPDsseRWrORVRfmbbWXNQosdG5qKP/
	hl7uhyaxlhnj2qvg0FJGGYqsrVfkRvwFhB+uz8/ad2rq3j9nrobXhl4bnUUESCSN
	T0U5W6qYyKx2vLFLMMhDYcE5TdpGVsbSeLJxM4JmLQizdUdU3NAuP4VboagSHVxS
	bPWd/LYM0ebOe3n6OZhXv+8KZcVqqCgkO2hNRSoAOmN6nApW8F++nP7OL+Jghd1z
	pv66YhkWVPXQ1emlHL2qpc3rc/c+PvBBIK+qcapDm2uNmPGNxQyZ3Oyd+m+Iad7s
	XuxC1IjAIyaFtuGGL4DoQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794300417; x=
	1794386817; bh=tb236Dm5vjk3jIJHIZtBKJRyeMEkcz2Hz6AmSpXUM38=; b=k
	E/mRSPYeLWtnTujMQqC+6MeTrE+UKfjRBdR8AX8oroox+S1B0gYbl08nb+pcRFWP
	dZLPqck94q+klISPxktsroSmqOP7Z/2DLr3haN8K+aTPWurrEXBonJR6JORXcPTS
	ZPswAFAcZLo5kBsg+5vIHkAJitT6sLiq5hgG/L+dmMQzscTiqI/jmaVRRqx2+XIo
	Th9MTu2LiBJhHy/Byeqs1Qx9aN86VSkuvuHEjysASJD5QdzXDdXJKGmjP9zS/qjp
	ijm3wcGvpM95upb80dfIuR9dP7F0hEoCzvypNwmwiRX+k1ig6BlcVu+a0Lb2IdMj
	sAfV6w58gdUr9wsdji2PQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794300417; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:FynYkQBw1IZCAoFTAtLQ7PcrM9VHbq8C80zbUgFfkO6BJyb
	DO+dV3sdVdNspY1QVVBKUvB26VTpSOpZeJCwmLYAdMW6n4/UOQEA107iGrAiCprf
	MVJ6nwImSGCESl2W2i0dr0zK8EEb20TES1P2VCCmUwxZOwBxCBivhD/51+9UbXgb
	n1/IqGFtJmrkf8RdZ1YUh0Lkj13WGH1VIW9nU/lqKOk1TXDKLeE/ZQke+FIRwwTV
	OD7sTPjiDQEPcZ5Z5H+4WC8JeaxNc4GpzuAqLQ5wsm+OKDCasBgPw2O6sT1wayL3
	gt2K0nrZ/7IHUNSaZszdR+upu1xF1gwUO9J1jDg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:lERdrb9Ixmt/09H167x565OA+x+60OUGjeylKHspBT4=:/J/XjW7Q6CFdj+SNsM8IKlFX81NAeeVIkFwzukOjqaM=;
X-ME-Sender: <xms:-tnyapZWpF7wmx-xErevIPpESn9od4WYUbneta5UlMF1DyZKOrXa7w>
    <xme:-tnyarN1mrP318EQ7eZAOCEin2fmQvn7aELTkSzMqyVL64lXEQJ2yMdc0iXja-5Gj
    d7-nprKmtLa84fScPVNtjUXWSgO9N11d5RbPOPKdjqQ4DN3wewilaxX>
X-ME-Proxy-Cause: dmFkZTErx1dxoqSf6te9rXHPqp0f1SJG/nfdWjOU7ZalO87A+EP4qML1q0Z0D8gxg/nRWC
    rvfIBrNbS4wqwUNlWo/9KOxDTwGOhlIXs8DwpTnxQBvdJ3XFf8AYcyH9uv5L2alR1WEZZY
    YAOY30rhi9AKJC/pO2DdYe1oePMkSIa3oFgFKmZGPqe1XxtwiCj1GPkRLFipZntZWM+KeB
    //2NuoZILEAf0rhOOLud9ax/noqUHj31GklZ/DeCrl5G8BdmbpNh8Mme3/E7sFzUdMddXc
    gvZ8RE5e+VmIGYI8lt8iNh/6COeH4R247RPHZyeSvx7zMUO4KASDH+ZWhqu71g/24fjEmI
    +VlonHM3LwH9lX8bzfkCxMXcl4KHEfqgf7CE05e5nPpb/S5YEQCcptGJyQg6OZ1igs50+Q
    lcBBM7acbUOoBx+F6ko9cMQJIrV82q7SQ3QikYVWRL2vanSAs5ZHI5ymDoIqZf76vuZG3t
    /6exr7ZlBOE1DMvqyYM0HB4FryKT1nQ3820ZBtrU0/rpK6SivFbfRI4vB8QLKpOKAG3cOK
    NJKaspt85Zu4Gv41H3Tjmv+br8SL1kbryf3eyDw3xImDq2XrkWZASsGdjknHNxOpeEAHJ5
    jWG3cIpSozZ1BvcfbolW73Kdtw2oqERaIbQK3jB9y5sQBDNsFx6WfAGVZXog
X-ME-Proxy: <xmx:_dnyahLRQ_SqIpxW5ldaasvoRJZw1y8bu-mOJoR4YiYu1EifSHjXGQ>
    <xmx:_dnyaqWHhl3huLu3H0ff75gGpVGetik4mBPIsIQFydiUv_9glx_SSg>
    <xmx:_dnyauN3-clC1hcF9Et2ItV1Eo2XlWhsETg2vEftAmFAa-55UjXTxA>
    <xmx:_dnyaukE-5Vt6vurldhKktgim6GhalK9eXVaAPjAJstnvs7nSAbjqA>
    <xmx:AdryaksipLQyu4Nqkx8C9EgX_qlE2hcaQ_6UpkzGv2xMfKSJ-gW7ioKC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id F034E32A0099; Tue, 10 Nov 2026 03:46:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A4QaHkHhrVgc
Date: Tue, 10 Nov 2026 09:46:29 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Brian Masney" <masneyb@kernel.org>
Cc: "Long Zhao" <longzhao@ambarella.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Jerome Brunet" <jbrunet@baylibre.com>,
 linux-clk@vger.kernel.org,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 devicetree@vger.kernel.org, "Long Zhao" <zl020895@163.com>,
 linux-kernel@vger.kernel.org, "Linus Walleij" <linusw@kernel.org>
Message-Id: <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
In-Reply-To: <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2026, at 09:27, Krzysztof Kozlowski wrote:
> On 10/11/2026 09:23, Arnd Bergmann wrote:
>> On Tue, Nov 10, 2026, at 09:02, Krzysztof Kozlowski wrote:
>>> On Mon, Nov 09, 2026 at 08:22:33PM -0500, Brian Masney wrote:
>>>>
>>>> - I create a new shared immutable branch based on v7.4-rc1 and I can put
>>>>   the first two dt-bindings patches in that. I merge this into clk-pile
>>>>   (feeds clk-next) with --no-ff. The DTS folks will merge this immutable
>>>>  branch as well.
>>>> 
>>>> - I can then merge patches 3 and 5 into clk-pile.
>>>>
>>>> - The DTS folks will take patch 4.
>> 
>> If the clk driver is required to boot, I would
>> suggest having a branch with the two clk patches that
>> can get merged (not applied) into both the clk tree
>> and the soc/newsoc branch to put the other patches
>> on top.
>
> There is a build dependency - DTS needs clock binding
> header - so it has to be second, unless the dependency
> is decoupled.

Ok, I see. Let's go with Brian's suggestion then.

For reference, I'd also be fine with the alternatives
we mentioned. We've done all of those before:

1. Include the actual clk driver in the immutable
   branch to cover both compile-time and (potential)
   runtime dependencies.

2. Merge the initial clk driver through the soc tree
   alone with an Ack from Brian.

3. Decouple the dts from the binding, using only
   numeric clk IDs for the initial merge in 7.5,
   start using the binding in 7.6.

4. Merge the clk driver in 7.5 through the clk tree,
   merge the rest in 7.6 through the soc tree.

      Arnd
