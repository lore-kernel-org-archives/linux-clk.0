Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD582ECEA8
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 06:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761114560; cv=none; b=BxNyNj6xZBuoqZsI663hsoBn6CyxBt2Na/kIv2aVr7HmDuE1CRDjZfc5KDMP8sDQXv3kJI2Lih/WCLB+IhCPvjuHclwSIeE/kdmEw+VtDN/LeZnZbeT3jjWs5zmcMhLTSSY1gMZ3WVby6vRRnoT+AcS25W5Q4MRUmanENCi8fVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761114560; c=relaxed/simple;
	bh=HEDRAGGNfbmhEyuJ5b5RqiksTIntppv7cTuCcWdvHtc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=qVWU6OY7IvQ35whs1mn+pL8H++Z4DgIt5D2pageIns3P6QCKYgWonZnfG+Qvj9aAIDKKdU4LF07SpQmiZYjQE0acrG8mCoolqK+JErT1ls0b8vaHj+LmgPm9rz4yGVwqNMzOK9usXKjWBX80F01HF4XLRzyaDY59wwTeP+1ThuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=walle.cc; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 8FEB06F4;
	Wed, 22 Oct 2025 08:23:35 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 08:23:35 +0200
Message-Id: <DDOMVXFQ82CN.FJ0FMPGMTFPN@kernel.org>
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
Cc: <linux-clk@vger.kernel.org>, "Maxime Ripard" <mripard@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Randolph Sapp" <rs@ti.com>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251003222917.706646-2-rs@ti.com>
 <DDJPIJGC8W1L.1BCHJEG3FO574@kernel.org> <DDKSRCG9J0MB.3NKE0JJWUWDTD@ti.com>
 <DDOCJEZSBJ1V.WPWWUAR7M1H9@ti.com>
In-Reply-To: <DDOCJEZSBJ1V.WPWWUAR7M1H9@ti.com>

Hi,

>> Am I correct in my assumption about running clk_get_rate on unprepared c=
locks
>> though? (That it shouldn't be allowed or, if it is, that the result shou=
ldn't be
>> cached.)
>>
> Any follow up to this Michael? I wanted to be sure this was something the
> subsystem should allow before I look into further workarounds.

I don't know. I'm not that familar with the ccs. My first reaction
was that it's asymmetrical that a .set is allowed (and works for
tisci) and that .get is not allowed. That way you can't read the
hardware clock (or think of a fixed clock, where you want to get the
frequency) before enabling it. I could imagine some devices which
needs to be configured first, before you might turn the clock on.

OTOH Maxime pointed out the comment in the kdoc of clk_get_rate()
which clearly states that it's only valid if the clock is on.

-michael
