Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.77.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B891F4611;
	Fri, 27 Mar 2026 07:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.77.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774595195; cv=none; b=Ar1vt94nciWmjSuM4NuujWoD5pAysTHznMixZE/Do8MMdDc4smXk1TTT54abPiSLJHzmGojvDbSq/+siaVlGVhsfO0yo3d1bYQINHkva9BWTkThCwE2YCbdIf5M6ypwWZ6zQAs0TcPPuBWdFxxnptSp6Sd6ziocpCoz/G1fOxqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774595195; c=relaxed/simple;
	bh=acJnhk3DhlEkQc4Hdu9XGurQ2f/IqUWKVh1uoABR9WA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hheAZxiareWUERUpedmCi3UjbwkiylxRckLF4PJyRdAjm8B3nIcohezEnehm+42Twq8WFMkXHplXXRatzFzNDlFVoQo65Ou8HFs90feI/sQMy9wG+AtKlnXjxvczVSeEuIdKtCBXdQEo2aFxZsweUsGSqqfJauUIPYjSaFK3Vyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=oJT4MR45; arc=none smtp.client-ip=114.132.77.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="oJT4MR45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774595091;
	bh=C5sPPhxc2ESUsfKZcmePqfZSGtd39KSgY9EBT4h19Z4=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=oJT4MR45zGFsDiQoi7e3V7hweAfxTuleEh3YMiT8E1pJVzLnTy7gQkvT3j/L9hsBT
	 8hOTgyJ3jYWn8Snir6f6LKegADFzc6U8jLNeX1bOOYZg5wbx4a2oQwhFloMOjjkgl8
	 dQsJpnoncULL7vYfFXAsEaGIh18sbWqT0gY9dWAI=
X-QQ-mid: zesmtpsz9t1774595088tae86de95
X-QQ-Originating-IP: w/WyDemxcbjpJuaCt1YW/wsPI2c2ZYwcqhNJMRnh9EA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Mar 2026 15:04:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1752965271814094096
EX-QQ-RecipientCnt: 21
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 15:04:46 +0800
Message-Id: <DHDDGG4TDFOS.2DPHBA6U2JMVE@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Guodong Xu" <guodong@riscstar.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 compatible string
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Conor Dooley" <conor@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-2-ca94ca7bb595@linux.spacemit.com>
 <20260326-explode-surplus-24c0e0813099@spud>
In-Reply-To: <20260326-explode-surplus-24c0e0813099@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: McJfg7Aee/FZuqgBLJa/xaD93ptxSj5gtrQRlr2BHMhaSuQ7Hmc7FSVm
	nIbSM/Gn9ozMbLDAzyDH+vq5F/k9zjNFar+BG0Flj5Fv5Qb3kLBOQgep/HUvaEWm+0REQgk
	utQdzLZlWXNyZv2nn0GyzOdluz6WiLSYfnDkvmLzrjDA1IDE7LTjtyNcunyenvlBbjYaBL7
	mEa7uvvsPio6wr4K+A8wHylXqbN1xA5Omj74pPKdJ+wtE1q9+WC3rVp1Ss5BsRB8d2ghPly
	NbCS9jz/nQTk4C2cOLP4oNcXZ+C7rrA3EYWGj3tICHboN6UMAl1rPf7fA6NKoqLBaPD6a6E
	b8X62kTE4p8pepTCHO0caY5TYjyPWGFznU+M06CCNS9yzqWnErMdhJQ0Pdnr5gazRMTq+kj
	bnz6JW7yTTJ0OBaE2grKZjRUb5XfmfCOPkzi6RQoXsJ34mtxevGQKnXfUufsCCM+TasNNYF
	bmlQf+G7vCOo+Rt952DsFtLZt4xuH05ppyLSgnFQOjXzZoj3TKEj6EOfwrfnivwaDImWGpm
	twhLEFYC552lvFErafayaB9W64nfLbRea2jgYNRNxNK5sckvJ7IXERvCT9xDZXp2JkrZ9Zb
	jqB9h5NezcuFHQzSd92GpEx4yB/mqPX325JDsllEaoxHm9z8tEJ1YK3mSklNr67A943Uze0
	/Q/lTzNybK/WbckQe+DCVkk7TxkHPwmGxNgNiMgH8lSBQnZ+tTJKbnK8L+G8dDgusUS6Fps
	CIhnSCyOr1nlHKL/tWEwK2sBNzt6DfcW4XD37Cv9CTWqQgyThhGlnVSSivvBYDqR7pOlC9V
	herj0wt6QAME/Q62DeFPxjHm17xsYWWc9J2Eo8WvZYcI0n2BCp+4lN9f7mebQTwbtq/QSrg
	uzgfBsa5kTO7UaFg/BDsF3Ye+YSMuI7L7nG0z6YKHWVrcOUa2Ni5leJnuDmxQb7EAaY9Slv
	t0l42y7QZtI8y6/adItDuv1OjHxF5HeXI15wNe7gmfFLcCNbxu45AngCu038T5mo/mFAQcL
	DTr/SpmtZPiOILKrFUksajYQkjbJT0oAAB4HCDo8zzeQQm2O8g
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Hi Conor,

On Fri Mar 27, 2026 at 2:34 AM CST, Conor Dooley wrote:
> On Thu, Mar 26, 2026 at 04:17:17PM +0800, Troy Mitchell wrote:
>> From: Guodong Xu <guodong@riscstar.com>
>>=20
>> Add k3 compatible string.
>
> That's obvious. What you need to explain is why it is not compatible with
> the existing k1.
>
Thanks for the review.

The SpacemiT K3 PDMA requires a new compatible string because it is not ful=
ly
backward compatible with the K1 implementation due to two main hardware dif=
ferences:
- Variable extended DRCMR base: The DRCMR (DMA Request/Command Register) ba=
se
  address for extended DMA request numbers (>=3D 64) is different in the K3=
 hardware
  implementation.
- Memory addressing capabilities: Unlike the K1 SoC, where some DMA masters=
 had
  memory addressing limitations (restricted to the 0-4GB space) and require=
d a
  dedicated dma-bus, the K3 DMA masters have full memory addressing capabil=
ities.

I will update the commit message in the v3 series.

                                              -Troy
