Received: from sender5-pp-e105.zoho.com (sender5-pp-e105.zoho.com [165.173.182.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051C113B58C;
	Sat, 10 Oct 2026 17:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652201; cv=pass; b=eDmhORd+nbw6xOhbKJEsJTR54hXWNIGJUJgvheLWThWUcz2tNe1XresNuL0tpEMzWzPZcmt3HxpnyP5XFDpdXO8yS575yICjhOweIiVNLQ4kqBaO3xicp6jSofjO9d6mQ1Hdj70qPt17ji9jQUSydMJCVxR7kS0BDytdPBUngqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652201; c=relaxed/simple;
	bh=/zxAKR58iJyDSi4nZh1eLUziL2e+4QGrhKQGoOdfmBc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=r8VMMffEuE73C/fl6qaeom9GCMg/pK0GyzFkAQ6ljAqWVNaUEy1GwZzlyhV7vWcvr908OuWNs3B1ktbm6mTFSuUitSN21X/K/oQrFBCaRPgQDfHK67GRv8YpoDS0S9valDP6aGtanpSnZHsLeU/dbHgtr2Y55TIXRP6dCaY01ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=U/uWeRZU; arc=pass smtp.client-ip=165.173.182.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="U/uWeRZU"
ARC-Seal: i=1; a=rsa-sha256; t=1791652187; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nxr8HfIDUaKsX7L7P2AxOfgY4psqViDeVGoegqIogZQOCSUxXSZFW0e4nQXm29ZP3qhS5FaKvcIm7zdlCldhPmgjPwpIe3b5VzjYF2+IHl7S5agdKtiKLdDIrn0a548WDmtjV7vMGwVs/OYD8Ji+APf67G6Lt0sYWFu/uQeX9rA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791652187; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XI2lMiI9M516ZvoW8NXLevRqWxxdnnNPZ68nblQAcz4=; 
	b=fvFfD9tw0tqtdPanfbTOQHdUjQt9R0DPBYZq6ZBm1hd9pY6yKrSQumieJ2gr9jTxefjYdAfbBKN12ULVw+c47xuull4Sc51LBZoPcfmyCEiMCKLO0owpZHcwxU13YC0udX6Iz9G7YBE+x6eyaVI9RDLsOOsM0jzTxozCoI0at/s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791652187;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:In-Reply-To:Reply-To;
	bh=XI2lMiI9M516ZvoW8NXLevRqWxxdnnNPZ68nblQAcz4=;
	b=U/uWeRZUbmG6wRKALxODvJSXgzS7bSV5sVSz9yby4ojZfFMCsBPHat9mMzMFjQY6
	Q9L7stQjMHmXwDy8PDJ691RvJ1avRR2Xx9j6Qgfl9ks2dZbX2nIyaJilhkeDat33UKG
	DI5WV9VUZRknYv8lr1WBB5pLM/IHN1hhLWsP6UQU=
Received: by smtp.zohomail.com with SMTPS id 179165218602419.75079290365079;
	Sat, 10 Oct 2026 10:09:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Oct 2026 01:09:39 +0800
Message-Id: <DM1BOWOKF9OM.21QWSA1L8WH3U@pigmoral.tech>
Cc: <linux-clk@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH v6 7/8] clk: sunxi-ng: a733: Add bus clock gates
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: <sashiko-reviews@lists.linux.dev>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.22.0
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech>
 <20261009-a733-clk-v6-7-ae8178fce7e8@pigmoral.tech>
 <sashiko-outbox-166706@kernel.org>
In-Reply-To: <sashiko-outbox-166706@kernel.org>
X-ZohoMailClient: External

On Sat Oct 10, 2026 at 11:54 PM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] clk: sunxi-ng: ahb_store_clk is missing CLK_IS_CRITICAL flag
> --
>
> commit f3ca9c131f39f726826090f6af6752e7b39c004c
> Author: Junhui Liu <junhui.liu@pigmoral.tech>
>
> clk: sunxi-ng: a733: Add bus clock gates
>
> This commit adds bus clock gates that control access to the device regist=
er
> interfaces on the Allwinner A733 SoC. It also intends to mark the ahb-sto=
re,
> mbus-store, and ahb-cpus clocks as critical to prevent access breakage to
> boot and storage devices.
>
>> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-=
ng/ccu-sun60i-a733.c
>> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
>> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
>
> [ ... ]
>
>> +static SUNXI_CCU_GATE_HWS(ahb_msi_lite0_clk, "ahb-msi-lite0", ahb_hws,
>> +			  0x5c0, BIT(16), 0);
>> +
>> +/* This gate controls access to the storage controller MMIO registers. =
*/
>> +static SUNXI_CCU_GATE_HWS(ahb_store_clk, "ahb-store", ahb_hws,
>> +			  0x5c0, BIT(24), 0);
>
> [Severity: High]
> The commit message notes that the ahb-store clock should be marked as
> critical, but the definition of ahb_store_clk here uses 0 for its flags
> parameter instead of CLK_IS_CRITICAL.

Oops, I forgot to update the commit message accordingly. I will send a
new version to update it.

>
> During late boot, the Common Clock Framework automatically disables any
> clocks that have no active consumers holding a reference to them.
>
> Could this omission allow the framework to inadvertently gate the storage
> controller MMIO registers, leading to a system freeze or storage probe
> failures?

ahb_store_clk has already been set as the parent of the NAND, MMC, SPI,
SPIF and UFS bus gates. Therefore, when any storage-related peripheral is
in use, ahb_store_clk will be enabled through the clock dependency, so it
no longer needs the CLK_IS_CRITICAL flag.

>
>> +static const struct clk_hw *ahb_store_hws[] =3D { &ahb_store_clk.common=
.hw };
>> +
>> +/* Keep enabled for access to the CPUS domain registers. */
>> +static SUNXI_CCU_GATE_HWS(ahb_cpus_clk, "ahb-cpus", ahb_hws,
>> +			  0x5c0, BIT(28), CLK_IS_CRITICAL);

--=20
Best regards,
Junhui Liu
