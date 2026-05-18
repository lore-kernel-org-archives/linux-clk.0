Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3713DC4D8;
	Mon, 18 May 2026 05:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779083988; cv=none; b=VP7qePIw4dWyvN5J4u1EMvcbOD+/fGxEzZBvp8hyad0hiPlDvuFULaDR3d7d4TVhB2/JwqTNeVBqCg/qgkQ4Ixq/VrtUpuQ4CzATEXmSmD+DF5eFEOOZ65sd4maDWL4md7RVt24lcfJvfkBUjMIGc4NPr0OQ8ScIreLIm3+kCzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779083988; c=relaxed/simple;
	bh=ZBo6UzpGi2/48ish2J7eO+3r26XLemO1MJ804jDcqVQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=XJB4qcIa5Nmuyp3iuje2YcK633d3b9mz3HLTqfGXnqP0GopSFeBK1uJ5BdTV5XBcG/dsey8ZMP0gJGyAJqiT2ON7kO37DJbbUSJh4GoEBHjnxogDgZPnmdV69X+tbgDmsPB/G5IxeACb1WSSfByOm9o/pV44vclBSDh/Y9SRK6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=eZWF6w0c; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="eZWF6w0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779083935;
	bh=ZBo6UzpGi2/48ish2J7eO+3r26XLemO1MJ804jDcqVQ=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=eZWF6w0cCiyWaTydiAeVD9Wr0gBWhJzXENuOkbWu98zAroBqvjX0CGhEOhmfwV+TJ
	 oSwg6FYx/n4WLFi13cp/t0oCfHtRtg437E0g4ZRroAtBSnxzCX+l+PPk8yjGtqQ248
	 RtxcXbVFOyq8RARM3ZUUF3LsixbUkGzYYjNqFI9g=
X-QQ-mid: esmtpgz10t1779083929t26c6620c
X-QQ-Originating-IP: gvbpIGWnr3UB9vTsa+lepJJScjkrVuXQnqPryEVy31I=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 May 2026 13:58:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10797554963980711834
EX-QQ-RecipientCnt: 17
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 13:58:45 +0800
Message-Id: <DILKM8GE0NN8.3TSFR8JVSIVHM@linux.spacemit.com>
To: "Junhui Liu" <junhui.liu@pigmoral.tech>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Brian Masney"
 <bmasney@redhat.com>
Subject: Re: [PATCH v5 1/6] clk: correct clk_div_mask() return value for
 width == 32
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
 <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
In-Reply-To: <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MGm7C9qlvlpb+0R3a7Ch7ScULWfI+0VWccSjrmDaSy5wqYyGJTLwkOfa
	/lNo4yihnJreNMCLrHOUZgBl85G7dIuL/CzItqyGuagdIjWznY8ARAz1GdDzKQVk85YdkcL
	xG8wTMTyuiWXY/F1LxoWm7ayC6VbCHDyJWVkTehJqZSg9U4WBYlzL1qsEpFtxOiAxzOj4+6
	Q9Ct3SIGjTd3A1oIH16kaqORn4Li61NtpgYoWIYZrv+8ezMe81VI/tk8KQa8mTCrLYQjYRx
	gP/RIfkShFfxCCbyHgP6buK/vtXgow2VXAjHW2LkAF24hyJzO/Looq8mskxm/nxsVtKR+Ee
	/YNgf8Ban93osvxHowinER39b96hVCxq/7MPezN2iPFButMh5rcgRCZcu8wH9rrfDb2l6hx
	0dWvHn6oi0RGSElFNzgotZ+Up/NIyzfXvu/SIc61TrW1YI5k7ZMQ6EKp5LuAnnLVnbQafvQ
	+8iaDpDDkwQk7RKNQfDWPligb7p/uyMk5KgCsuUu56DaDEfqq/pOHsvoMD6NACVkULtUNao
	82rH/gvY1HoQserltBJu3uo3GBz+9yhY8sgggfpPIbvcjGimtD4hwGkiiB2u5ngYIOx8goh
	QxeJZn7/n4tX66+EvltQnXh4KB1hj1SpYz/k+lgZOYVSJ/kjDOIyXwovJfaFNNICR5Cuwe9
	SjPse8E0m65EfHQFaa5YKESMNWbw341subB0HJihFB1nk9veMgGuS7Vq3MVqT4XwqFbMID6
	7J119jQj8CrcbLjwgwgINbXSMoo0rOAG61MuCPQ1qeodIexw2SNWg0/1bacHSoARgSIQ8yW
	2gwGgdQvMnDj9kpK5XukDx3e3pBn2Y9k1+/8Yn7EJtr42XwaXOxhj10jJDl77aSD9iuKHQt
	huzUPiETZh2rzmTCaVhLpEOlNqTGlsL2kJo7GcUPrWFW9kY4fWj5WmJefwZApQ3F2Xd9ikV
	b/elMXAbtM3S3RHxPKFNNUM7QAcGUS1vll2p0e4FWsvvT1XOrPBPXPKfXLIKR0Zx+MsJ/Xh
	sgAJkrKBS3MZS+SOG/pwm1dyzipr7MVt+/GMbLvQ==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

On Thu May 14, 2026 at 5:27 PM CST, Junhui Liu wrote:
> The macro clk_div_mask() currently wraps to zero when width is 32 due to
> 1 << 32 being undefined behavior. This leads to incorrect mask generation
> and prevents correct retrieval of register field values for 32-bit-wide
> dividers.
>
> Although it is unlikely to exhaust all U32_MAX div, some clock IPs may re=
ly
> on a 32-bit val entry in their div_table to match a div, so providing a
> full 32-bit mask is necessary.
>
> Fix this by using the standard GENMASK() macro. This safely resolves the
> undefined behavior on both 32-bit and 64-bit architectures, while also
> benefiting from the built-in compile-time type and bounds checking
> provided by the GENMASK() macro.
>
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>
> ---
> Hi Troy and Brian, I dropped your Reviewed-by tags in this version
> because the implementation has changed (to use GENMASK()) and requires
> re-evaluation IMO.
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
