Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2557D34846A;
	Thu, 15 Jan 2026 12:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768480078; cv=none; b=f6sBGvePfKrhj8wrZxkeF4RNuPPtAP30VCqlvx1yWwugphldoyUx/7UzbhSzPgexWBWZ5utEN8rMH+TCXBACXF3zq/69BLpdVSKomobTqao0NcYvxPLhoXpdI//OBwzU3me6+7IiIVD/tU/2QM383Nn+WiWi6xygfLmlPy4efGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768480078; c=relaxed/simple;
	bh=1XEX8kGREtCY9I8HwWSyDf/rK4x4kdVrblnHh5DRwiM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=qeahkf7iNQ1MbmVZILsVeX/TZc5y2udGwVb5ggjqAwjBa1HIKw/xeqH/U63PCpoDdIHCMNMHYsW/wN6KL+fyLAZ7KSszBAycer8AY5tA+2/+9s6MUfnFIE27pY1Hq9qob7wt9thxm4CwP9D/gtpwtta0Q9/hMm86YBj0A+FDiR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=pDk/V+DE; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="pDk/V+DE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768480068; x=1769084868; i=markus.elfring@web.de;
	bh=PJnhVagQPwLaJRVDaQhPdi2Js0eyFEPWniT6mv2MpJw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pDk/V+DE6jtRfXhRfLuVcsUwRqQVcYU3ZINPX9brupcpNWNd8W0X2+Sl5qYzS7zP
	 oReLGktbwqGfAX6S5hKkV+8d3vuPGeoWseQ9dT+qWIBZxHVkft9sOR6vyrMVeZToh
	 neZ4A+kYaBRsddWnRaXsss+IgJy5btu0YBRHbfdX5qmWRDyFozDCP3VozOGUYApUy
	 DTnnxQhsjVB6zWYZ7sPK3hbX0Q8pVHqlQgQTepS46Lotef6UGNvYq4UK+5VfcD2Ut
	 VPPFnhNpvomWZj7jUkeW2NguF8/RIH2fco6mEmniu5jckCdHMEviB1KlhYp6jr7OY
	 SiXAaymaGMhd+4cK0g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.191]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M604f-1vjMSm3rYZ-00A4WZ; Thu, 15
 Jan 2026 13:27:47 +0100
Message-ID: <c72b1bfa-706d-4ef0-913e-38c42a49d182@web.de>
Date: Thu, 15 Jan 2026 13:27:46 +0100
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
References: <20260115044439.632676-1-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH v2] clk: st: clkgen-pll: Add cleaup in
 clkgen_c32_pll_setup()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260115044439.632676-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:BVdaiydgnCmJpN2ATf17kuVgQWDx0YPLbBAgGdPBhjNYCnqEfza
 aaoC2sHH4a8ZWgCf9RNp3J4qGyxw9NzwKRPfwSJTnsdN0TNz4ockF44FsV+azgzzdORxDo2
 utKSMuxBgMn5vOyivoOGaRA+CAkG5mBtY2D6rITPds+8uaO+htfL7fkeGtqTVmNVrZxgo1H
 DeFMxmSfFpcFGH6QCfH7w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:c9gXUAUtnqA=;DkhcUT7UPxM8IOmTdjwN+VRhxav
 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
 ShC8mzP/6zCQlApxA=

> In clkgen_c32_pll_setup(), there exists several leaks if errors ouccers.

                                                                  occur?


> Add iounmap() to free the memory allocated by clkgen_get_register_base().
> Add clk_unregister() and kfree to do the cleaup for clkgen_pll_register().

                                () calls?  cleanup?

Please avoid such typos at more places (including the summary phrase).


> Add a while to do the cleaup for clkgen_odf_register().
> Use distinct variable names for two register calls' return values.

I would find such sentences a bit nicer with a formatting for enumerations.

Regards,
Markus
