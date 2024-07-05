Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DDA142E83;
	Fri,  5 Jul 2024 08:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720168852; cv=none; b=W9Ym+mMop8gB6Y1JNp3sebn66euu/nHk6czR4RGeIzkJf7nChvk+8d6bpNyTZ42WTqABtw5NNhYyTGd+MmQBF6ldqRqA9sqO0QW8/1CtK2V78sWSe1yR8vKC1ztNFeUFk8CORevwCVzD3G1rk40D2LeT4hYDctwfou1Z/oGE84A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720168852; c=relaxed/simple;
	bh=INe9YI/gvN9RsV8rzUze5SNDtnjh987deR2ilDFjZHg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=rcQkYeM0NeZkZZY2ZZgl8CMhhCQtYLtDXRO8xHfFRTgfvm/4kE6iuOcR29+z6210fQgx+HstVtUTxKxoDsatV7B2HZ3+xYIk/NhfVm5GQ6lNGjXklZo0bPtugSk6CGo72pvZy8QjRxfgvjHKeK23s1RtMGiRNSNIutjxvlHQDuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=MvqN0sxv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YYvZEiQG; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="MvqN0sxv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YYvZEiQG"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B3A2811401A5;
	Fri,  5 Jul 2024 04:40:49 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Fri, 05 Jul 2024 04:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1720168849; x=
	1720255249; bh=XggOw6sNdJbe3Ee9jM5s0rhVY/BH/gB5TnFgTwGkUno=; b=M
	vqN0sxvUNK0jk2xXrivtOhG2fJNAstNS0Az0kPG7Z9Hht1YRiriSkBIlIS9KqLMo
	QT9hMdM/4uv8kG/bHCwh5AaCiD5HrKpmz4r1a4L6Fv4yRBDPtlxCWuAKEGEGggOw
	0pl4c7A3RYuDpjpBSIKnUCbmsf+Za4A5S3wWT3+WfKqLxsYruYJ7+bPQ+P7JYZCh
	SgqT5G/QrB0qnjlewYHrU8AGd+gLrPOE9OPBYGfSPOogc3Iuvibg3w7042SDIvct
	QFdpElOJlwpIyY+8Pi8f2U4zL+bqoeWz7G6k8Wj1Kqfiixgr4LolPHkH8AAkjo9b
	25nTbjl+ZHqjFFuFL727w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720168849; x=1720255249; bh=XggOw6sNdJbe3Ee9jM5s0rhVY/BH
	/gB5TnFgTwGkUno=; b=YYvZEiQG+jRSv2QL7uMXf4TqqIudGMW1hoFPfUOibxcw
	TacQLhVfQuk82KlE8enxXU1E6yOhapEGS58U6tChdivRft/rW8INn11QLLGTomDh
	9gjHNdFX6SCktUAzmesh1UvlY2ae7N/nLra16tQkFg3TKfJ51eRhSr3v6a0ZsXai
	5xfxiAA2CQWI6MDLuurmJpkB3wQResZL70hlcumcCPC5Y4Mcyx3OT+FIOK3VHZQ3
	AEoW5bZLB5n/SJ1t/f3IKncqe62iJWqG/k618IDUB9cA2eyZAvANa/e2pX2JL7Ss
	JsirC9nKOLBrKxQEokKZtToq0ziVhsKtAzkhEfzwGw==
X-ME-Sender: <xms:kLGHZlr9ABtO4zPZUN0mmhASWOKY1lCBcCX0JNBdUIWA5u7bJvyn-A>
    <xme:kLGHZnrX-EUuLNQ9wOKdtOAfFWCmbgNzyZk7mu_wVev7jzSurMCpvVx9b1MQ7mkeA
    UzTxHjiBFnbeIleUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfthigr
    nhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehvdevieegudejueefgeffhefhffevudfhieejgfdtffetlefgteeu
    veeiudeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:kbGHZiOzY8TJjtzSUlAybkgTSy6oewMQPd9fVCmxRFAzwibbjOI6ow>
    <xmx:kbGHZg4kjPSctSbDNpxotQi1V6DLxcR-Bgepas0TOnNciieHiDiW8A>
    <xmx:kbGHZk6yO6WYF6-qIXETTta0hX1UhISvy6KxMJc4XWAc-EKo4ZWcHw>
    <xmx:kbGHZoiba4Ht9kPv3rSLlvaAKBNNAagSSNMxSRomnY-5KMGfYYHB3g>
    <xmx:kbGHZq6CQjR2jt6ectEqyn-1UrbcXP7g3vtd5RiGYopbpI06pylUPAi3>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E1C02A60078; Fri,  5 Jul 2024 04:40:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <e041466e-cfdc-46db-ae83-dcc04ed1af42@app.fastmail.com>
In-Reply-To: <dc00b9daafe6a88ffaaaf4aace29e136.sboyd@kernel.org>
References: <20240703105454.41254-1-ryan@testtoast.com>
 <20240703105454.41254-20-ryan@testtoast.com>
 <dc00b9daafe6a88ffaaaf4aace29e136.sboyd@kernel.org>
Date: Fri, 05 Jul 2024 20:39:15 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Stephen Boyd" <sboyd@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Daniel Vetter" <daniel@ffwll.ch>,
 "David Airlie" <airlied@gmail.com>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Rob Herring" <robh@kernel.org>, "Samuel Holland" <samuel@sholland.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: "Andre Przywara" <andre.przywara@arm.com>,
 "Chris Morgan" <macroalpha82@gmail.com>, "John Watts" <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 19/23] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
Content-Type: text/plain

Hi Stephen, thanks for reviewing.

On Thu, 4 Jul 2024, at 11:02 AM, Stephen Boyd wrote:
> Quoting Ryan Walklin (2024-07-03 03:51:09)
>> +#include <linux/of_address.h>
>
> What is this include for?
>
for writel, however have confirmed this should instead be #include <asm/io.h>, will correct for v3.

>> +       if (of_device_is_compatible(pdev->dev.of_node,
>> +                                   "allwinner,sun50i-h616-de33-clk")) {
>> +               writel(0, reg + 0x24);
>> +               writel(0x0000A980, reg + 0x28);
>
> Lowercase hex please. Did the downstream driver have names for these
> register offsets by way of some sort of #define?

Thanks, will correct. AFAIK no, these are from Jernej's tree which I understand he developed independently, there was no vendor driver to reference, nor DE33 datasheet publicly available. 

Jernej, are you able to weigh in at all?

Thanks,

Ryan
