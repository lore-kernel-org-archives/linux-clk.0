Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C745E3B2A0;
	Wed, 21 Jan 2026 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988923; cv=none; b=EVvRI7uMS1TCYSpf6upmal+nz+UPWxCCnTYMNZXw0269zLXgATytgoG7/fgYNfved5u3D4do4i06izERekLFZVSo09+jjNXurCYj+n2N1+TtdL4nd4+LmHmPxo0N0jFzaK1xZByWsSwwcsN6l9vELjan0vAG6Q2mDVqEYdix/mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988923; c=relaxed/simple;
	bh=bJ6v4gCXozS8EoZ8hHdT0a8S/Zo0IdPYAnJEl0dNtE8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=n1XSin701vRUQPgufyaPkumMxj64y57YZIucFjeZYpyU6tRvI5cpAu35qRtnHkipABQ1H3r7Sx9QSs2EbNsIAMfZ+8RSNrAaDPwFNPNzgIRLH6oMN4PPkQRb4lPLgMiQcWKI5TAMGbVVJw5hk3Wtam3oCHYn/ePJYrHzTApboVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Y7OEo4tA; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Y7OEo4tA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768988908; x=1769593708; i=markus.elfring@web.de;
	bh=KWWo4MvWMf+0VetDUiMkukTdJtEkE7e7Ec2EdLFdFcE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Y7OEo4tALhqn/odEicEwQzatEEthBiaFMemjxgbQ3mGKVlvU36ys70sVukBpMkVv
	 T/Lhw/C1jGKO36MNaH6nJBerM9WHczXCAU/N5qjFyfpTzU9dqL1i4q+3JR1i9vXAN
	 WlAkgAEUOCd5kAgpJq3yvytqJiaXHT6TBxqkgUqAA6vcvSOVEF/ZdzgIFZo5618kn
	 802FcYExKGSR8L/PJwEtvxtYcyPKntgifs2jOxtjeUW5jBC0K0P+RT98LgcMK7M/s
	 Zkl+Zs4umHBK2w4xVG+GFC+bmH98+iG4pA6UDiiMSfSgCo1vEjZjiY+M9MfjM3yQ0
	 8di3MLWMjauo8MT/+A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.226]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M4sXj-1vkQdH28jH-00E7rR; Wed, 21
 Jan 2026 10:48:28 +0100
Message-ID: <3e8f9be5-3951-47a6-b9b4-eb60cbbcab53@web.de>
Date: Wed, 21 Jan 2026 10:48:27 +0100
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
References: <20260121012223.186199-4-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH v2 3/7] clk: st: clkgen-pll: Rename clk variable in
 clkgen_c32_pll_setup()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260121012223.186199-4-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JYZ8qvdUAFNHph7xOcyMDgp6R7shW7oZU2bSEl87UW5uGDM19K8
 Eo/Zh6lN6ChIZRJ+AZgwp/CAYrDZ9eJOghmJK6Q9e8fM52hhRdhLSBzJQ3RuEzFgkq/1/ui
 TPzwR2ft7grwbtVPlnnh0mCgeH9Dm5nvtBas7tGtRqam56HuiOZ3bWvZJA1u7xFa0nDDRH4
 sRCxx3mE/PWhRO55zmBRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j+qFRU17E14=;rIsbsbIyNpUlzVK5GN5+hW46jb4
 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
 tl6lc4JgwwdNRr4VRddl0nhbYcUVW

> In clkgen_c32_pll_setup(), `clk` is used for two distint variables' name=
.
> This patch rename =E2=80=A6

* Did anything hinder you to avoid typos in such a change description?

* See also once more:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.19-rc6#n94


Regards,
Markus
