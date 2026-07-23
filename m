Received: from mail-24428.protonmail.ch (mail-24428.protonmail.ch [109.224.244.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF12A3346A8;
	Thu, 23 Jul 2026 21:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784843652; cv=none; b=hQTPRRHZeZQFMDKjhKT6fzEuvJM5OjsUXEOx74gNTr2FlfQxezgHuXLRL5z8LWPm28SzZNO+YQGDDfc0lOq/77nOrFDZ6EhZXce4PjTFHJp1FUgvREqpwQIlTb5rDI8WPHrDTKWIZayavaLoCh8iYjPMG4A8vo/k9z8d+e/dpCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784843652; c=relaxed/simple;
	bh=+JWyagTRhRBqhLWVN4liLy4mFdyb13CfKOIn7cO2kUI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uHxRwvCAyP8ALRtxddjj6YjIZGKHV64FjBucYjh623XBVfIyLg591B5zAiOt7DM9uOkoPslBKGPhFO3EtJljTXzFb2LMIcx/IasjJg3kmw/X3KJbd01yJo5QA0RET3xtifxDQNSPJRu4fWB3wAxwmfDAk1UQt1MPQ28v/ez7SOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=CJATjGqm; arc=none smtp.client-ip=109.224.244.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="CJATjGqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1784843641; x=1785102841;
	bh=+JWyagTRhRBqhLWVN4liLy4mFdyb13CfKOIn7cO2kUI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CJATjGqm1fH9XwaodUqiTYhfluiU/SE/xaFlu1BCiqk/1ImB16qU9alrWtpFiB1cK
	 ZV9LgGfr/geDtgOhTzZFFLMtPkgDgfDlDNMOO2MpT+qdkoelbsia+AF0K4jmonMOdD
	 YuBus+Mv8Sw63gv3oIMfBjiOj2on4NNmShXfKnQw0j9dwFvX4gWqNftXOztr2mV/6U
	 gKqMpCKuH1d3gN98jJ1AflTHSJMBIt/Zen+C5Rw4UTy6spnG6I6BXfEOVGvh83BNdj
	 ToZfyUsiAHGZMd5kQbiX41wUMKD7R3TSkKes2aqJjQF7/fgzRs4IQYSIYpKySBPw4E
	 RwGM5KXOJHd2w==
Date: Thu, 23 Jul 2026 21:53:57 +0000
To: "aneeshpradhan2004@gmail.com" <aneeshpradhan2004@gmail.com>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: "andersson@kernel.org" <andersson@kernel.org>, "aneeshpradhan@acm.org" <aneeshpradhan@acm.org>, "bmasney@redhat.com" <bmasney@redhat.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh@kernel.org" <robh@kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "serenity@floorchan.org" <serenity@floorchan.org>, "20260723012415.48288-1-aneeshpradhan@acm.org" <20260723012415.48288-1-aneeshpradhan@acm.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: initial MSM8920 and Motorola Moto E4 (perry)
Message-ID: <gQh7CCQKYqMRqPhGEJiGaEHPClClU-x4DxsXkHZ42OS02s6gHd23p_m6n8bDmBRYS3ITCbC0G_62BH6016wSsp-JqW6GiztGAsIMtra6wp4=@protonmail.com>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 94f678ccf360fbe8c7d0fd7324b3a26103946ee7
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi, I'm forwarding this email on behalf of Catherine, as she is
unable to send emails to the list due to email spam filters.

-------------------------------------------------------------------

Hi,

I just wanted to let you know, this is a drive-by-vibe rendition
of my patch series from earlier this year. You aren't talking to a
person, but claude code instead:
https://github.com/aneesh-pradhan/xylitol/commit/4bdb6eaac4724ae0071095a925=
795c5e5b8b9985
I can confirm both the MSM8917 and MSM8920 variants exist in the
wild, as I own both. As for what you want to do with all this
information, that's up to you. This also contains hacked up
versions of my in progress DT for perry available on the msm89x7-mainline g=
it. A lot of the errors in this PR are results of Claude
mindlessly copy-pasting my in-progress work (bad whitespace,
incorrect copyright assignments). I was planning on picking up this
series when I had time again.

Thanks,
=E2=80=A8Catherine

-------------------------------------------------------------------

I (Aiden, not Catherine) would also like to point out that the
model seems to have been deliberately instructed to omit
co-authored-by tags:
https://github.com/aneesh-pradhan/xylitol/blob/5eda9e8987c10d9654f2aace9622=
ff11b11322d7/AGENTS.md

Regards,
- Aiden Isik


