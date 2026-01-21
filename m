Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB8B3ACF1F;
	Wed, 21 Jan 2026 09:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988487; cv=none; b=DgQD/4V36YDjmLi1KsI0Jj5T+2+aJK/1+leGPtQlUIDlj0hgu6rXD0awNMzWNAaAbboBI7msNBbVQ7eX5IPMaBPSB2fpBnLQk7LFnaJC4duhhLhaSJGSx2JrZmSP2AEY/8uD3vRK1mm3U0Cxye+NIxpJ8MQoYLrgNCFIK6a4jgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988487; c=relaxed/simple;
	bh=bJ6v4gCXozS8EoZ8hHdT0a8S/Zo0IdPYAnJEl0dNtE8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=c0SovLsrBSDUosSOrvM8DyJj1ij8/p/hGCbeRIuq24xzJfem+Dh8/2mHH95lR4o4rWqqUPciRNCo05vSM+MIs7zVdZbQN2o0S1RPl8LsarsN2CBLaDFGYj6ARDs4jxhwByUmMUS8Ofl3l02U4c7jHvxe5+wcpYFW6ByDscdc2Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=mo9tNWRu; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="mo9tNWRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768988464; x=1769593264; i=markus.elfring@web.de;
	bh=KWWo4MvWMf+0VetDUiMkukTdJtEkE7e7Ec2EdLFdFcE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mo9tNWRu+hdtR+69znfcZ3/XQ7bxQu2EPAnmMusns4FrvbEtXnVP+uKFpFRfC1ar
	 hUTZpvcYbygfhGBoheHIPF5op6K+aMphO8O8832vNtFx3r7lptKU+xQgVLz7t1oGV
	 Gz5wDd6nPfUL+FG7wZ+O+ZAIh8OzcLjAD1cuHDT+fJt8ecaCd+ejoBCCHNh6auJrs
	 kegpJfGXUCPkM3EEfdyU4pwxyNkPu09E9p5Gw5F1/LEUZaV6sEbdpDamQCVK+taGB
	 PaLjHHXvtsjocRF7CxHXMxZ5X3FLSX2kSZf3d7jkzbiLv+6Oc5KctO1cfLfOOwk7H
	 X6ZgQ21Eube7uPbC+w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.226]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzkOL-1vvskz0SDx-0117AN; Wed, 21
 Jan 2026 10:41:04 +0100
Message-ID: <33432d93-7c93-499a-903b-f1aeaef3dae7@web.de>
Date: Wed, 21 Jan 2026 10:41:02 +0100
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
References: <20260121012223.186199-3-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH v2 2/7] clk: st: clkgen-pll: Rename clk variable in
 clkgen_c32_pll_setup()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260121012223.186199-3-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:imQ9QCPqUdW7aj7RkcO2dW5TDmyYXvn4NRw/c95jgCpI0QtZBaf
 gUJAx0dCkbf26+E42s1xZIt4RSzLHYhxsgWohA73ICELKQfla6Jnj0d6+FYFrtA9uiZ8fWL
 HkjpcVSfNxOt9zrhXQ9dTUpzZ5dgcAEnQhmt9QBNPdhwgphsrXMMWyu+RTs9RWtlYCxnU54
 zpNuwHBwAXf06inCQ/XHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3nA8ttkBab8=;Fp+tTo8RvGC7qyn5TSIGTXJdaw9
 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
 aPx0H4fU=

> In clkgen_c32_pll_setup(), `clk` is used for two distint variables' name=
.
> This patch rename =E2=80=A6

* Did anything hinder you to avoid typos in such a change description?

* See also once more:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.19-rc6#n94


Regards,
Markus
