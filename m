Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E926E71F;
	Sat, 17 Jan 2026 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768646894; cv=none; b=T6xva4wr6QwnFb/8VtUnLAcnE0mOb6e+qS0mKZUhp08iMAw4cGBzVXxepuw70/8v6Qf4aZgGgtkj/+urz/ylglurzyNK8L2oGlTFeXKBuco7UYRySbZhvnFIGKcb/rMpuoO55YDxLcQ7MVbMICjZh1AHvjvFW81TOKfPvQ7DHio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768646894; c=relaxed/simple;
	bh=kf9avB/lhw73mPXfr34GUiIIOkMsvl/VIP3bJHLRYyo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=LCuLm5c75Vco3mTendWxrellrN6R1oMhJpsk6qvv/X0R+7eBqcd5p4WgV8WrEd5kbziv4BZOTVzfGUqU5uMW/HTTGycssI0+yim8SG2QELDQ2WmQHxI2Ukr5L0ojLa07plp0S+JNYssN/x8V7Ei7+VJM02sYZm5TfH5cBp4bI2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=YVqpomq2; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="YVqpomq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768646880; x=1769251680; i=markus.elfring@web.de;
	bh=DMaW+KN5Sx2t2n31lU1i9+6bQFMxr+o1OpqLuDe9FwI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YVqpomq25CVSo7xvzpkzGNV8/x8CjHS0y87ABNwZNpgUlMD7GKRjm0kY1sDGTq0U
	 Y5fZMK2yY9fzX0Nvhl9tWg/tdMloYfV2eB4Ce96hsRFn1WDYPa8SccsKYEWcCvv55
	 mNZSTWL5c9b/58AQadpvVNJN70nTzT1QGpk6WK3WvH4eQmK9tg4AK2GoFg9M2lp1k
	 YCQrh2d1lPyYIKu9TR7cN5AbFSaUBGdhAihjz259gPrKNGUJ+Y+rmsyUrnv+vHAXV
	 BwlO1RuAIcgYNB2ykn9oApDEyQeetrTXnetH3bB8kb8bk/34kRsYGHlToKPW3MyqI
	 qDGq0szncW/JEQceoA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.177]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N6sFx-1vsNvr1rHL-018NRZ; Sat, 17
 Jan 2026 11:48:00 +0100
Message-ID: <ca737c3d-9f2b-42f6-ad04-c1ac6c32794b@web.de>
Date: Sat, 17 Jan 2026 11:47:59 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, linux-clk@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260116113847.1827694-4-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH 3/7] clk: st: clkgen-pll: Rename some variables in
 clkgen_c32_pll_setup()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260116113847.1827694-4-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Wf66UGZxI9yUASHdF7SBs2qcKXrWuXlR1F5YqSOGbzYMJsKFNkt
 v/nY8gUymjI9zX2cvilYvx9u6zVNUsKQKqoF7h4ABBFiwGvmWEscawR3m1XdJJ136E1OoCV
 mUlZ9l8UBBvjv5aaE4jl1Eq5ElHfeT7vgB+HC6flMNQWH0dhKE7FPM0VdGnhN0CBQLIyzwK
 NUFXegrAYr1RqO8jKjsAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3wk/wNP1PWk=;7eq/6lr0VcKZuVE6P8SvSA8SPxy
 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
 0OAIRsMg=

> In clkgen_c32_pll_setup(), `clk` is used for two distint variables' name=
.

                                                   distinct variable names=
?


> This patch rename =E2=80=A6

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc5#n94

Regards,
Markus
