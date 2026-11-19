Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078003;
	b=spuYf9cndi9IDL1rTvXGOxscvZZzHTNuQiqPAGmQB/Ia6ymcWrWTxCU691mgPybnULOb
	 gTlr2EAUxd9MFJngIcyHRnWZ+pbnEZZ2+N+2vQ/XhTafDfmZXGcXY2YSlYSRkm0ebeGgt
	 sPSRRB8Yjx1JFOy6dlTHBN9GMp/ixixE2vj6bu+OWWq7wfsaw5luiDP3VBmQvftyH/W2p
	 YW7os49OrDUlmSb+6ne3bbjtOce/wwoZ8WpXCIs1SWN/OfIYp+6I7L+bZ1A5SDOKy3wqF
	 2idrplEMjq81EW2m0jA1EM0aTDmHbjngz2Z18z/xkRQvFmznptRqEkY2U1liJ8qSO+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078003;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=WW2blqW/7siEgeA3QhLwyU83G3vWkab0u6sANyXaeO8=;
	b=Twkii+NVG2V/5NVHwsPkJOURWwiMyx28+48d3d7gjdR5qWZQdgTcG+s+pYHdN1MnJ3lN
	 B26jo/pgB676b5AnEfUOfYiLZA22LAObcqFTVHdne0Dz3R1v0ijodjfFCmNoonaGF5gyD
	 3+VrUw0kXdSf9iylxkSD6fKBCKL9T9iCQIoI8mUIVypNwenvYx3ZRoejinXWloDc9DFkN
	 G6Vzn4SMxMDZzVTiIRMI8GhNu2wP0fUsV8hj/DRibGcQ7wncnNEIwHMV2MfGkcyXZFsrG
	 LZ2Ud+p/6WIjSMRFNBiMdrt0FL0fmyh9pQLmhh4XP9yh2qm7SJS8llhCCCt0KW//c+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=UYFRPMY3;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1lzFt6eB;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3056D606A325
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 08:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3056D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=UYFRPMY3;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1lzFt6eB
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7A6CB7A026A
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 03:46:42 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 19 Nov 2026 03:46:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795077989;
	 x=1795164389; bh=WW2blqW/7siEgeA3QhLwyU83G3vWkab0u6sANyXaeO8=; b=
	UYFRPMY3/jzs0xi1mXQbVIg7KpGY0usB1jjHmn3po658+6DjKILjMz+IhDaC+cBE
	ps3He7mIolsqRniMEqAIOzT5m15/fzra7M2klC+0HbBcMBZULlWXoN4F5ASza3yg
	q+3NpmS01SnuxB/RGfrKCxcdAycw4LmsaiAfzcA8Q05GKNrXpJ0NOVf9VxqEOjW8
	jVXfmZw7JQEVHOQhJpOZQQ5dyhx/8TD0oUrqbf5DcxZtvDC9UPwj4hH2APLLO246
	bfNxn9FkVoEZ15ETvCIbxiWbWCHTHo9Y5lLPg3eXBJgVjWzzNwy9xfse9NJsCPDl
	hMEbJoitweGY4/ou+I15Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795077989; x=
	1795164389; bh=WW2blqW/7siEgeA3QhLwyU83G3vWkab0u6sANyXaeO8=; b=1
	lzFt6eBLruf12W8oA4MHDTJYYaNKfluVXK014wD2AE5/PkKRNmvaNXs6OtZD06cP
	qARJrNv/xRZt9AogIDvj35Req9DPilSnlIblee0aYsm2ntqn7fbUcq/xS0JTanKL
	2Du/EiNpwKhlnRKBelx+XDAkKuI4faM7ec8LPebuct9VwwneeHVVF4dny2cKDuez
	pdbsJ5PrEYbPOqy61dw/3MSxYA3yUoq49jgVgLjTpTwMcwOy7TKCEfG7wGIfNL9p
	zRq+GT/zgjo8yFFfGzAuaWl3sOj1zkv3jrFwPygrNsJjyffOo10Hm4d0Q0dgCs5V
	wd4lMLkk3SAI9joAN/o3Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795077989; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:d24futGEsYvUoPbpMbaR769jse+T+/RdjtyvOWWpGnA8J9H
	6yCrUsMxjDyDw8zVYFKjiA6Te9SonY9WcRU7AZlG6NX62Enujyb5SW9S00e3kuRu
	rrEoaz6WWAkUE0ZnWmqMLAC5Jy68tRo034h0aV1ZyBYp7ArfE/lldLLHxXiHwX4N
	RzHnpTGQgWB7u6gSiU1BCBbqsoYRrvpEcECIc1pgOUsxvXq0bPVVGByiB0VCRwMw
	4zw2P/Iw1KVJUQ7H0gSG6ZmvRPBiHne7j86AlWGOie+rNiTmQA9NSrmiWxcgMoE9
	AXgHMBkWXrCvD4A24ux33eiFLyXwNq9mNR9nBYQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:yHHEsa1F/yfYCs90xpNsERTHqBBu4lUbLy1LnnHw6Xk=:gUUvC0d3DXsIVObCQRNT9BOZ11HTUi7uu67Hd2r4Lys=;
X-ME-Sender: <xms:Xrf-apO2eZFEucASI6Z-iV3CNj11pQgRm7s87ifIoT3yRijzcQmpRg>
    <xme:Xrf-amyi7e9qiqX7gmNP4WTxg_MbzQiDZecDe3v_gxW7PrrnRFDcxzNqy2q0JFHoN
    fp81TAY_BnVsc1eCXapy6fNezXHD47G7-KpFpTuHCNcd5ev0kD6g19XfQ>
X-ME-Proxy-Cause: dmFkZTGV31TGU0zONOkJ/gBT4mhriliTNuQFY+d8+N+bTlJoW0nxIyUhLgf15xdQFnCpZF
    9Jdi9ioVT+ArUJtExz3P/QC8IyLdAftkr1Wq16l2yCdO5JQ38cqo75FJ5tNzR0b2nUbcxk
    GZbcqERGkx5Ta1opOW8Y57lemjWOUY2k5j74bKsnyV9KP9DtIA+lqR33B6KFt4lHZaTcDx
    lQ2oXBNJp2LMQKvX6SkMo7pSxJyoS4jDrVgl44HQ7DI37WrXmxv7vS/8QKBcvXc0sUClTi
    cS58SfLhGvF48w1OwGTpvIVhEIvatCY3HXo6+0Vz9gaXZ7TzA+hgU6NG1Mv3OiaUslusDi
    3T2GvrXnApIMkjt9XqvrL6oXS5qb+9k7ziRwXOYDVHgtgNTuv6D6tvGQCN1j8lr5nqgZCN
    MaeknzCilXGRLUxFGiJ9VCNSBaJMrIZdV0SjyNV3CqQoa0zbkih9vD3I8t0eNFAXjbpngj
    AhAXMpl7NEOz8ey49XMybjheyeyYnBmgGy1eLkDwl498HdPtVCVizXXzvQ13k8OrDDq/y9
    lXU4OBqi1Wj2mKykStwGX3yX+TEP4/CLLyMFQxfx0jDZiZdaRs6nonLloJTwyFBUSuKkJn
    G98cdGW1XrPwWm//oUpWUlsaTPqzapGM3/Z8LB78Klyo9e7/liYHGbaAwUkQ
X-ME-Proxy: <xmx:Ybf-amO7wLTg3t2P81VHzE2AxuUjkmN9b3yR1mTkfnVDq-xLyxI0BA>
    <xmx:Ybf-ap2u_7nYAD4T1Mkv08l-ABAHYfNieXgsEMydL-YhuDcJi2PZCA>
    <xmx:Ybf-aq13pl-t08t_dbneajYh6a3iSv704hi2unh58z0XSlYSZIdMpg>
    <xmx:Ybf-aowyha8MxnAMV5wnHNBt5XRGuMTECRpthTTTw2e0J-4Gjm0qag>
    <xmx:Zbf-anLwbR9PDmLBERtIf9SECCIy3j9-aMZ-xG_EavHOI2-v177KPQbr>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6974332A0099; Thu, 19 Nov 2026 03:46:22 -0500 (EST)
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
Date: Thu, 19 Nov 2026 09:46:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Brian Masney" <bmasney@redhat.com>, "Long Zhao" <zl020895@163.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Brian Masney" <masneyb@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Long Zhao" <longzhao@ambarella.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Jerome Brunet" <jbrunet@baylibre.com>,
 linux-clk@vger.kernel.org, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Linus Walleij" <linusw@kernel.org>
Message-Id: <d2cb7e5e-9c39-4534-9ed8-a5e2b6074dc1@app.fastmail.com>
In-Reply-To: <avslH10GRqkVT9fU@redhat.com>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
 <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
 <avMM8z-LYncKS8ip@x1g10> <avMmKJpczepWTRdc@ashevche-desk.local>
 <avReozTC_GEmfIxG@x1g10> <2b30e92.3c75.1a1e2828c3a.Coremail.zl020895@163.com>
 <avslH10GRqkVT9fU@redhat.com>
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Nov 16, 2026, at 16:45, Brian Masney wrote:
> Hi Long (and Arnd/Krzysztof),
>
> On Mon, Nov 16, 2026 at 11:59:28AM +0800, zl020895 wrote:
>> At 2026-11-11 20:25:07, "Brian Masney" <masneyb@kernel.org> wrote:
>> >So how about this:
>> >
>> >- Have Long post a new version that splits out the creation of the new
>> >  Kconfig symbol ARCH_AMBARELLA into it's own patch. I assume Arnd could
>> >  provide an ACK on this?
>> >
>> >- I create an immutable branch that contains that the two dt-binding
>> >  patches, plus the ARCH_AMBARELLA Kconfig patch.
>> 
>> Just checking in -- there hasn't been further feedback from
>> Arnd/Krzysztof on the plan yet.
>> 
>> Should I go ahead and prepare that split for v12, or hold
>> off until Arnd/Krzysztof chime in?
>
> I haven't heard back from Arnd/Krzysztof yet. How about wait 48 hours to
> see if they respond, and if they don't respond within that timeframe,
> then go ahead about post a v12 with the ARCH_AMBARELLA split out into
> it's own patch. I think that's a good change to make anyways.

Sorry about missing your question, this sounds fine to me.

      Arnd
