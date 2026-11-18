Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=165.173.182.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795017500;
	b=FaYcNpPcpjb3qFN0A2/CiXKOz3UlSdX5wWFBat/ExS0CtH3axYdhOWGNCdfzGKJGuxfS
	 lxttLZuIiUo+IvmL+0UeR00vHoyNOJ8A7Wjq0ONrmc06iYWRJ8sQyA0He3NFqxj3iS3rS
	 gwsowkkA8yCxEXiR/OVCStsCz0jL2aem4mVC042lmzqZgeM1x0YyEFj0j9GeRbZhjHaE0
	 p+ubb0P+Ew2wUtvDi64QXjjXb2EcuFktDUcNnTM+gN7o0Be/+U0l0ad6cAdx53zJKBH0o
	 CYwVKmAgYxJyWpChZL0UAWKzogbnnUESg+cZwuX8NILb7RzX0QCWUaPhuNGix+T7K5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017500;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Zoho-Virus-Status:
	 X-Zoho-AV-Stamp:X-ZohoMailClient;
	bh=Usg8X43Ws7OPUhBE58OKMyvzlPQGZ0CY7Z/mpX0bURc=;
	b=A9lQcSj7besrOoraEzaOiQauBsOvxNKmAhU7RTYocUYsK94QbpxiD6ET8ouhSwygWK6i
	 /UraGkDSgTcfu3WdNl/O0XfmG523PX4445sLc3x/0i9kLSdMXrn4xxSh2O9Xz7dESe40S
	 O8C7zWXAMkdZLbKLrdsmgc5SpJykjsxb8Meoqk1Thu7HPBMs3dhd4Wi5JIrnb2gJlqgiF
	 atepGSzkyt+WyrMeiZUa7/Lzb3hYlmnUrnRQ4ZKU7KUNx5qUSUv5NUXmzf7IVsx2Y9mUo
	 aQ9Y1Puueh04E2YxWZAYJQ6zOdJPSNv9j/xfpbHWt4LOZOD1Hqw33IMM3gJcTfINagA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ziyao.cc;
	spf=pass smtp.mailfrom=ziyao.cc;
	dkim=pass header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=mXGxqpWZ;
	arc=fail smtp.remote-ip=165.173.182.15
Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2663606A32C;
	Wed, 18 Nov 2026 15:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2663606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=mXGxqpWZ
ARC-Seal: i=1; a=rsa-sha256; t=1795017478; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aKZyVK/iul+awmkjrZ4kuKN+OjodgmfQHc1HR5F/rOku5wpVcBcGoNgE6xS6qEYjmpalvWBkcRTs6nHxmVTHCt7QU7A1xazObShsDMcV3AG2rifwZ/4KVqKwal8wx9TRNx2wQJvc3rQfpnEgm4boXPeyh2XZ52Wd43uFWjIIJoE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795017478; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jz/3H3A3oChBMYXVW8k3ME6DCqxX/fivj94e4R405A8=; 
	b=Gksh+Ce5o5nrckoOiOmG43DdjBFNHTT8gI4YnDCHhmIFxgkVLuStLR/Lz+XsPcxIkgCqTlzcQhETZEp/TJ0RAP5tefuMrsaUZmKoIqA13CVVd3UyS1+u9JPzeHE4fJFXiuxljjXYhAfJ3NcThvKRfVLS7CpkFWLSRlSddHVb6Go=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=mXGxqpWZsXT6I8C5aBcHiUxgAzoAL9pA3MtLq4B/joxYe8Bl4z8ZJlHLifcX0H3KKu8mEv0fwDQTJzPMHMTTLjzv61m/Y95MATStaMAcf4A5Oz/dxCNXNr9e5qZhCzsWqXAJ2mN7L5ag++9GRahDBCLdceN/1O4zuAh+q6+rIdI=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=Usg8X43Ws7OPUhBE58OKMyvzlPQGZ0CY7Z/mpX0bURc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17950174745448.173778142830997;
	Wed, 18 Nov 2026 07:57:54 -0800 (PST)
Date: Wed, 18 Nov 2026 15:57:44 +0000
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@kernel.org>,
	=?iso-8859-1?Q?Fr=E9d=E9ric_Mah=E9?= <frederic.mahe@cirad.fr>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 2/6] clk: spacemit: k1: Keep pll1_aud_245p7 enabled
Message-ID: <av3K-MIfagKY1CcV@pie>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
 <20261117205951.140146-3-frederic.mahe@cirad.fr>
 <20261118111528-GKD156369@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118111528-GKD156369@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.994.34
X-ZohoMailClient: External

On Wed, Nov 18, 2026 at 11:15:28AM +0000, Yixun Lan wrote:
> Hi Frédéric,
> 
> I will forward to SpacemiT people, and ask them to clarify..
> 
> On 21:59 Tue 17 Nov     , Frédéric Mahé wrote:
> > Accesses to the RCPU2 block (0xc0888000) hang once pll1_aud_245p7 is
> Access which register? is the PWM register in RCPU2?
> 
> > gated: the CPU stops responding, even to NMIs. Nothing claims this
> > clock in mainline, so clk_disable_unused() turns it off at boot, and
> > probing an RCPU2 PWM afterwards hangs the board. The RCPU2 clock and
> > reset registers live in the same block.
> > 
> Usually access IP block with clock gated off will cause system bus hang,
> exactly the same scenario as you see here..
> 
> > Mark it critical, as was done for the K3 RCPU clock.
> > 
> It just happen to fix the issue, but doesn't sound like a correct fix,
> usually, it can be fixed with correct clock topology 
> 
> > Tested on a BPI-F3: without this, probing an RCPU2 PWM hangs the
> > board; with it, no hang, also with no PWM in use.
> > 
> ..
> > Written with help from Claude (Anthropic); reviewed and tested on hardware.
> > 
> maybe just "Assisted-by: LLM"

I think this tag has been deprecated in commit 1e035297ffda ("docs:
remove Assisted-by references"), but mentioning code origin is still
required by process/generated-content.rst.

The notice could indeed be moved to the cover letter instead.

-- 
Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.
